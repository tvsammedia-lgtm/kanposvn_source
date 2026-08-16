import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { canAccessWarehouse } from '@/lib/warehouse_scope';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,PATCH,DELETE,OPTIONS',
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

async function loadWarehouse(sql: ReturnType<typeof getSql>, id: string) {
  const rows = await sql`
    SELECT
      w.*, b.name AS branch_name, b.branch_code,
      COALESCE(s.product_count, 0)::int AS product_count,
      COALESCE(s.total_quantity, 0)::numeric AS total_quantity
    FROM warehouses w
    LEFT JOIN branches b ON b.id = w.branch_id
    LEFT JOIN (
      SELECT warehouse_id, COUNT(*)::int AS product_count, SUM(quantity) AS total_quantity
      FROM warehouse_stock GROUP BY warehouse_id
    ) s ON s.warehouse_id = w.id
    WHERE w.id = ${id}
  `;
  return rows[0];
}

// GET /api/owner/warehouses/[id] — chi tiết 1 kho.
export async function GET(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }
  const { id } = await params;
  const wh = await loadWarehouse(sql, id);
  if (!wh) {
    return NextResponse.json({ error: 'Khong tim thay kho' }, { status: 404, headers: corsHeaders() });
  }
  if (!(await canAccessWarehouse(sql, user.id, String(wh.customer_id), id))) {
    return NextResponse.json({ error: 'Khong co quyen truy cap kho nay' }, { status: 403, headers: corsHeaders() });
  }
  return NextResponse.json(wh, { headers: corsHeaders() });
}

// PATCH /api/owner/warehouses/[id] — đổi tên/mã/trạng thái/is_default (chỉ chủ doanh nghiệp).
export async function PATCH(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }
  const { id } = await params;
  const wh = await loadWarehouse(sql, id);
  if (!wh) {
    return NextResponse.json({ error: 'Khong tim thay kho' }, { status: 404, headers: corsHeaders() });
  }
  const [customerRow] = await sql`SELECT id, owner_user_id FROM customers WHERE id = ${wh.customer_id}`;
  if (!customerRow || String(customerRow.owner_user_id) !== user.id) {
    return NextResponse.json({ error: 'Chi chu doanh nghiep duoc sua kho' }, { status: 403, headers: corsHeaders() });
  }

  const body = await req.json();
  const { warehouse_name, warehouse_code, warehouse_type, is_default, status } = body;

  const type = warehouse_type ? String(warehouse_type).toUpperCase() : wh.warehouse_type;
  if (type !== 'CENTRAL' && type !== 'BRANCH') {
    return NextResponse.json({ error: 'warehouse_type phai la CENTRAL hoac BRANCH' }, { status: 400, headers: corsHeaders() });
  }
  if (type === 'BRANCH' && !wh.branch_id) {
    return NextResponse.json({ error: 'Kho BRANCH can co branch_id' }, { status: 400, headers: corsHeaders() });
  }

  const updated = await sql`
    UPDATE warehouses SET
      warehouse_name = ${warehouse_name ?? wh.warehouse_name},
      warehouse_code = ${warehouse_code ?? wh.warehouse_code},
      warehouse_type = ${type},
      status = ${status ?? wh.status},
      updated_at = NOW()
    WHERE id = ${id}
    RETURNING *
  `;

  if (is_default === true) {
    await sql`
      UPDATE warehouses SET is_default = false
      WHERE customer_id = ${wh.customer_id} AND id <> ${id}
    `;
    await sql`UPDATE warehouses SET is_default = true WHERE id = ${id}`;
  }

  return NextResponse.json(updated[0], { headers: corsHeaders() });
}

// DELETE /api/owner/warehouses/[id] — chỉ xóa kho KHÔNG còn tồn và không nằm trong phiếu chuyển kho.
export async function DELETE(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }
  const { id } = await params;
  const wh = await loadWarehouse(sql, id);
  if (!wh) {
    return NextResponse.json({ error: 'Khong tim thay kho' }, { status: 404, headers: corsHeaders() });
  }
  const [customerRow] = await sql`SELECT id, owner_user_id FROM customers WHERE id = ${wh.customer_id}`;
  if (!customerRow || String(customerRow.owner_user_id) !== user.id) {
    return NextResponse.json({ error: 'Chi chu doanh nghiep duoc xoa kho' }, { status: 403, headers: corsHeaders() });
  }

  const stockRows = await sql`SELECT quantity FROM warehouse_stock WHERE warehouse_id = ${id}`;
  if (stockRows.some((r) => Number(r.quantity) > 0)) {
    return NextResponse.json({ error: 'Khong the xoa kho con ton hang' }, { status: 409, headers: corsHeaders() });
  }
  const transferRows = await sql`
    SELECT 1 FROM stock_transfers
    WHERE from_warehouse_id = ${id} OR to_warehouse_id = ${id}
    LIMIT 1
  `;
  if (transferRows.length > 0) {
    return NextResponse.json({ error: 'Khong the xoa kho co trong phieu chuyen kho' }, { status: 409, headers: corsHeaders() });
  }

  await sql`DELETE FROM warehouse_stock WHERE warehouse_id = ${id}`;
  await sql`DELETE FROM warehouses WHERE id = ${id}`;

  return NextResponse.json({ success: true }, { headers: corsHeaders() });
}
