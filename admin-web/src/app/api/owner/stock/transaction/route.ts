import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { resolveCustomer, canAccessWarehouse } from '@/lib/warehouse_scope';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

function getUserId(req: NextRequest): { id: string } | null {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try { return verifyToken(auth.split(' ')[1]) as { id: string }; } catch { return null; }
}

const INCREASE_TYPES = new Set(['IMPORT', 'TRANSFER_IN', 'ADJUSTMENT_UP']);
const DECREASE_TYPES = new Set(['EXPORT', 'SALE', 'TRANSFER_OUT', 'ADJUSTMENT_DOWN']);

// POST /api/owner/stock/transaction
// Body: { app_code, warehouse_id, product_id, tx_type, quantity, note?, ref_type?, ref_id? }
// tx_type: IMPORT | EXPORT | SALE | TRANSFER_IN | TRANSFER_OUT | ADJUSTMENT_UP | ADJUSTMENT_DOWN
// Quy tắc kho: MỌI thay đổi tồn đều qua stock_transactions — KHÔNG sửa trực tiếp số lượng tồn.
//   - Nhập kho / tăng tồn: upsert warehouse_stock (cộng dồn).
//   - Xuất / bán / giảm tồn: trừ có ràng buộc quantity >= số trừ (chặn tồn âm).
export async function POST(req: NextRequest) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const body = await req.json();
  const { app_code, warehouse_id, product_id, tx_type, quantity, note, ref_type, ref_id } = body;

  if (!app_code) {
    return NextResponse.json({ error: 'Thieu app_code' }, { status: 400, headers: corsHeaders() });
  }
  const type = String(tx_type || '').toUpperCase();
  if (!INCREASE_TYPES.has(type) && !DECREASE_TYPES.has(type)) {
    return NextResponse.json(
      { error: 'tx_type phai la IMPORT | EXPORT | SALE | TRANSFER_IN | TRANSFER_OUT | ADJUSTMENT_UP | ADJUSTMENT_DOWN' },
      { status: 400, headers: corsHeaders() },
    );
  }
  const qty = Number(quantity);
  if (!Number.isFinite(qty) || qty <= 0) {
    return NextResponse.json({ error: 'quantity phai lon hon 0' }, { status: 400, headers: corsHeaders() });
  }

  try {
    const customer = await resolveCustomer(sql, user.id, app_code);
    if (!customer) {
      return NextResponse.json({ error: 'Khong tim thay khach hang' }, { status: 404, headers: corsHeaders() });
    }
    if (!(await canAccessWarehouse(sql, user.id, customer.id, warehouse_id))) {
      return NextResponse.json({ error: 'Khong co quyen tren kho nay' }, { status: 403, headers: corsHeaders() });
    }
    const [product] = await sql`SELECT id FROM products WHERE id = ${product_id} AND customer_id = ${customer.id}`;
    if (!product) {
      return NextResponse.json({ error: 'San pham khong thuoc khach hang nay' }, { status: 400, headers: corsHeaders() });
    }

    const delta = INCREASE_TYPES.has(type) ? qty : -qty;

    if (delta > 0) {
      // Nhập / tăng tồn: upsert stock + ghi giao dịch trong 1 transaction.
      await (sql as any).transaction([
        sql`
          INSERT INTO warehouse_stock (warehouse_id, product_id, quantity)
          VALUES (${warehouse_id}, ${product_id}, ${qty})
          ON CONFLICT (warehouse_id, product_id) DO UPDATE SET
            quantity = warehouse_stock.quantity + ${qty},
            updated_at = NOW()
        `,
        sql`
          INSERT INTO stock_transactions (customer_id, warehouse_id, product_id, tx_type, quantity, ref_type, ref_id, note, created_by)
          VALUES (${customer.id}, ${warehouse_id}, ${product_id}, ${type}, ${qty}, ${ref_type || ''}, ${ref_id || ''}, ${note || ''}, ${user.id})
        `,
      ]);
    } else {
      // Xuất / bán / giảm tồn: trừ có ràng buộc (quantity >= số trừ) — chặn tồn âm.
      const deducted = await sql`
        UPDATE warehouse_stock SET quantity = quantity - ${qty}, updated_at = NOW()
        WHERE warehouse_id = ${warehouse_id} AND product_id = ${product_id} AND quantity >= ${qty}
        RETURNING quantity
      `;
      if (deducted.length === 0) {
        return NextResponse.json({ error: 'Ton kho khong du' }, { status: 409, headers: corsHeaders() });
      }
      await sql`
        INSERT INTO stock_transactions (customer_id, warehouse_id, product_id, tx_type, quantity, ref_type, ref_id, note, created_by)
        VALUES (${customer.id}, ${warehouse_id}, ${product_id}, ${type}, ${qty}, ${ref_type || ''}, ${ref_id || ''}, ${note || ''}, ${user.id})
      `;
    }

    const stockRows = await sql`
      SELECT quantity FROM warehouse_stock WHERE warehouse_id = ${warehouse_id} AND product_id = ${product_id}
    `;

    return NextResponse.json(
      {
        success: true,
        quantity: stockRows[0] ? Number(stockRows[0].quantity) : 0,
        message: type === 'IMPORT' || type === 'TRANSFER_IN' || type === 'ADJUSTMENT_UP' ? 'Nhap kho thanh cong' : 'Xuat kho thanh cong',
      },
      { status: 201, headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json({ error: 'Loi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}
