import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { resolveCustomer, canAccessWarehouse } from '@/lib/warehouse_scope';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,PATCH,OPTIONS',
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

async function loadTransfer(sql: ReturnType<typeof getSql>, id: string) {
  const rows = await sql`
    SELECT
      t.*, fw.warehouse_name AS from_warehouse_name, tw.warehouse_name AS to_warehouse_name
    FROM stock_transfers t
    JOIN warehouses fw ON fw.id = t.from_warehouse_id
    JOIN warehouses tw ON tw.id = t.to_warehouse_id
    WHERE t.id = ${id}
  `;
  if (rows.length === 0) return null;
  const items = await sql`
    SELECT i.product_id, i.quantity, p.product_code, p.name AS product_name, p.unit
    FROM stock_transfer_items i
    JOIN products p ON p.id = i.product_id
    WHERE i.transfer_id = ${id}
  `;
  return { ...rows[0], items };
}

// GET /api/owner/stock/transfer/[id] — chi tiết phiếu chuyển kho.
export async function GET(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }
  const { id } = await params;
  const transfer = await loadTransfer(sql, id);
  if (!transfer) {
    return NextResponse.json({ error: 'Khong tim thay phieu chuyen kho' }, { status: 404, headers: corsHeaders() });
  }
  const [cust] = await sql`SELECT id, owner_user_id FROM customers WHERE id = ${transfer.customer_id}`;
  const isOwner = cust && String(cust.owner_user_id) === user.id;
  const hasFrom = await canAccessWarehouse(sql, user.id, String(transfer.customer_id), String(transfer.from_warehouse_id));
  const hasTo = await canAccessWarehouse(sql, user.id, String(transfer.customer_id), String(transfer.to_warehouse_id));
  if (!isOwner && !(hasFrom && hasTo)) {
    return NextResponse.json({ error: 'Khong co quyen truy cap phieu nay' }, { status: 403, headers: corsHeaders() });
  }
  return NextResponse.json(transfer, { headers: corsHeaders() });
}

// PATCH /api/owner/stock/transfer/[id]
// Body: { action: 'confirm' | 'ship' | 'receive' | 'cancel' }
// Chu trình: DRAFT → CONFIRMED → SHIPPING → RECEIVED (hoặc CANCELLED).
//   - confirm: kiểm tra tồn kho đủ ở kho nguồn (chưa di chuyển hàng).
//   - ship: trừ tồn kho nguồn (TRANSFER_OUT) — hàng đang vận chuyển.
//   - receive: cộng tồn kho đích (TRANSFER_IN) — hoàn tất.
//   - cancel: chỉ khi chưa SHIPPING.
export async function PATCH(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }
  const { id } = await params;
  const transfer = await loadTransfer(sql, id);
  if (!transfer) {
    return NextResponse.json({ error: 'Khong tim thay phieu chuyen kho' }, { status: 404, headers: corsHeaders() });
  }

  const [cust] = await sql`SELECT id, owner_user_id FROM customers WHERE id = ${transfer.customer_id}`;
  if (!cust || String(cust.owner_user_id) !== user.id) {
    return NextResponse.json({ error: 'Chi chu doanh nghiep duoc xu ly phieu chuyen kho' }, { status: 403, headers: corsHeaders() });
  }

  const { action } = await req.json();
  const status = String(transfer.status);

  try {
    if (action === 'confirm') {
      if (status !== 'DRAFT') {
        return NextResponse.json({ error: 'Chi duyet phieu o trang thai DRAFT' }, { status: 400, headers: corsHeaders() });
      }
      // Kiểm tra tồn đủ ở kho nguồn cho từng mặt hàng.
      for (const it of transfer.items) {
        const rows = await sql`
          SELECT quantity FROM warehouse_stock
          WHERE warehouse_id = ${transfer.from_warehouse_id} AND product_id = ${it.product_id}
        `;
        const available = rows[0] ? Number(rows[0].quantity) : 0;
        if (available < Number(it.quantity)) {
          return NextResponse.json(
            { error: `Ton khong du: ${it.product_name} chi con ${available}` },
            { status: 409, headers: corsHeaders() },
          );
        }
      }
      await sql`
        UPDATE stock_transfers SET status = 'CONFIRMED', confirmed_at = NOW(), updated_at = NOW() WHERE id = ${id}
      `;
      return NextResponse.json({ success: true, status: 'CONFIRMED' }, { headers: corsHeaders() });
    }

    if (action === 'ship') {
      if (status !== 'CONFIRMED') {
        return NextResponse.json({ error: 'Phai CONFIRMED truoc khi SHIPPING' }, { status: 400, headers: corsHeaders() });
      }
      // Trừ tồn kho nguồn (có ràng buộc chống tồn âm) + ghi TRANSFER_OUT.
      for (const it of transfer.items) {
        const deducted = await sql`
          UPDATE warehouse_stock SET quantity = quantity - ${it.quantity}, updated_at = NOW()
          WHERE warehouse_id = ${transfer.from_warehouse_id} AND product_id = ${it.product_id} AND quantity >= ${it.quantity}
          RETURNING quantity
        `;
        if (deducted.length === 0) {
          return NextResponse.json(
            { error: `Ton khong du: ${it.product_name}` },
            { status: 409, headers: corsHeaders() },
          );
        }
        await sql`
          INSERT INTO stock_transactions (customer_id, warehouse_id, product_id, tx_type, quantity, ref_type, ref_id, note, created_by)
          VALUES (${transfer.customer_id}, ${transfer.from_warehouse_id}, ${it.product_id}, 'TRANSFER_OUT', ${it.quantity}, 'STOCK_TRANSFER', ${id}, ${`Chuyen kho ${transfer.transfer_code}`}, ${user.id})
        `;
      }
      await sql`
        UPDATE stock_transfers SET status = 'SHIPPING', shipped_at = NOW(), updated_at = NOW() WHERE id = ${id}
      `;
      return NextResponse.json({ success: true, status: 'SHIPPING' }, { headers: corsHeaders() });
    }

    if (action === 'receive') {
      if (status !== 'SHIPPING') {
        return NextResponse.json({ error: 'Phai SHIPPING truoc khi RECEIVED' }, { status: 400, headers: corsHeaders() });
      }
      // Cộng tồn kho đích + ghi TRANSFER_IN.
      const updates: any[] = [];
      for (const it of transfer.items) {
        updates.push(
          sql`
            INSERT INTO warehouse_stock (warehouse_id, product_id, quantity)
            VALUES (${transfer.to_warehouse_id}, ${it.product_id}, ${it.quantity})
            ON CONFLICT (warehouse_id, product_id) DO UPDATE SET
              quantity = warehouse_stock.quantity + ${it.quantity},
              updated_at = NOW()
          `,
          sql`
            INSERT INTO stock_transactions (customer_id, warehouse_id, product_id, tx_type, quantity, ref_type, ref_id, note, created_by)
            VALUES (${transfer.customer_id}, ${transfer.to_warehouse_id}, ${it.product_id}, 'TRANSFER_IN', ${it.quantity}, 'STOCK_TRANSFER', ${id}, ${`Nhan chuyen kho ${transfer.transfer_code}`}, ${user.id})
          `,
        );
      }
      updates.push(sql`UPDATE stock_transfers SET status = 'RECEIVED', received_at = NOW(), updated_at = NOW() WHERE id = ${id}`);
      await (sql as any).transaction(updates);
      return NextResponse.json({ success: true, status: 'RECEIVED' }, { headers: corsHeaders() });
    }

    if (action === 'cancel') {
      if (status === 'SHIPPING' || status === 'RECEIVED') {
        return NextResponse.json({ error: 'Khong the huy phieu da SHIPPING/RECEIVED' }, { status: 400, headers: corsHeaders() });
      }
      await sql`
        UPDATE stock_transfers SET status = 'CANCELLED', cancelled_at = NOW(), updated_at = NOW() WHERE id = ${id}
      `;
      return NextResponse.json({ success: true, status: 'CANCELLED' }, { headers: corsHeaders() });
    }

    return NextResponse.json({ error: 'action phai la confirm | ship | receive | cancel' }, { status: 400, headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json({ error: 'Loi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}
