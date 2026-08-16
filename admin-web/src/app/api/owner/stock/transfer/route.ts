import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { resolveCustomer, canAccessWarehouse } from '@/lib/warehouse_scope';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,POST,OPTIONS',
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

// GET /api/owner/stock/transfer?app_code=... — danh sách phiếu chuyển kho.
export async function GET(req: NextRequest) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }
  const appCode = req.nextUrl.searchParams.get('app_code') || '';
  if (!appCode) {
    return NextResponse.json({ error: 'Thieu app_code' }, { status: 400, headers: corsHeaders() });
  }

  try {
    const customer = await resolveCustomer(sql, user.id, appCode);
    if (!customer) {
      return NextResponse.json({ error: 'Khong tim thay khach hang' }, { status: 404, headers: corsHeaders() });
    }
    const transfers = await sql`
      SELECT
        t.id, t.transfer_code, t.from_warehouse_id, t.to_warehouse_id, t.status,
        t.note, t.created_at, t.confirmed_at, t.shipped_at, t.received_at, t.cancelled_at,
        fw.warehouse_name AS from_warehouse_name, tw.warehouse_name AS to_warehouse_name,
        (SELECT COUNT(*)::int FROM stock_transfer_items i WHERE i.transfer_id = t.id) AS item_count
      FROM stock_transfers t
      JOIN warehouses fw ON fw.id = t.from_warehouse_id
      JOIN warehouses tw ON tw.id = t.to_warehouse_id
      WHERE t.customer_id = ${customer.id}
      ORDER BY t.created_at DESC
    `;
    return NextResponse.json({ transfers }, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json({ error: 'Loi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}

// POST /api/owner/stock/transfer — tạo PHIẾU CHUYỂN KHO (DRAFT). Không làm thay đổi tồn.
// Body: { app_code, from_warehouse_id, to_warehouse_id, note?, items: [{product_id, quantity}] }
export async function POST(req: NextRequest) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }
  const body = await req.json();
  const { app_code, from_warehouse_id, to_warehouse_id, note, items } = body;

  if (!app_code) {
    return NextResponse.json({ error: 'Thieu app_code' }, { status: 400, headers: corsHeaders() });
  }
  if (!from_warehouse_id || !to_warehouse_id) {
    return NextResponse.json({ error: 'Can from_warehouse_id va to_warehouse_id' }, { status: 400, headers: corsHeaders() });
  }
  if (from_warehouse_id === to_warehouse_id) {
    return NextResponse.json({ error: 'Kho chuyen va kho nhan phai khac nhau' }, { status: 400, headers: corsHeaders() });
  }
  if (!Array.isArray(items) || items.length === 0) {
    return NextResponse.json({ error: 'Can it nhat 1 mat hang' }, { status: 400, headers: corsHeaders() });
  }

  try {
    const customer = await resolveCustomer(sql, user.id, app_code);
    if (!customer) {
      return NextResponse.json({ error: 'Khong tim thay khach hang' }, { status: 404, headers: corsHeaders() });
    }
    for (const whId of [from_warehouse_id, to_warehouse_id]) {
      if (!(await canAccessWarehouse(sql, user.id, customer.id, whId))) {
        return NextResponse.json({ error: 'Khong co quyen tren kho ' + whId }, { status: 403, headers: corsHeaders() });
      }
    }

    const countRows = await sql`SELECT COUNT(*)::int AS n FROM stock_transfers WHERE customer_id = ${customer.id}`;
    const n = countRows[0]?.n ?? 0;
    const code = 'XCK' + String(n + 1).padStart(3, '0');

    const created = await sql`
      INSERT INTO stock_transfers (customer_id, transfer_code, from_warehouse_id, to_warehouse_id, status, note, created_by)
      VALUES (${customer.id}, ${code}, ${from_warehouse_id}, ${to_warehouse_id}, 'DRAFT', ${note || ''}, ${user.id})
      RETURNING *
    `;

    for (const it of items) {
      const productId = it.product_id;
      const qty = Number(it.quantity);
      if (!productId || !Number.isFinite(qty) || qty <= 0) {
        throw new Error('items phai co product_id va quantity > 0');
      }
      await sql`
        INSERT INTO stock_transfer_items (transfer_id, product_id, quantity)
        VALUES (${created[0].id}, ${productId}, ${qty})
      `;
    }

    return NextResponse.json(
      { success: true, transfer: created[0], message: 'Da tao phieu chuyen kho (DRAFT). Xac nhan de kiem tra ton kho.' },
      { status: 201, headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json({ error: 'Loi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}
