import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { newOrderCode } from '@/lib/pricing';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

function getAdmin(req: NextRequest) {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try {
    return verifyToken(auth.split(' ')[1]);
  } catch {
    return null;
  }
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

// GET (admin): danh sách đơn bán từ kanposvncrm.
export async function GET(req: NextRequest) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  try {
    const rows = await sql`
      SELECT * FROM crm_sales ORDER BY created_at DESC LIMIT 500
    `;
    return NextResponse.json(rows, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { error: 'Lỗi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}

// POST (admin): tạo đơn bán đơn giản — chọn khách hàng + sản phẩm + tổng tiền.
// Body: { user_id, customer_name, customer_phone, product_code, product_name, amount, note }
export async function POST(req: NextRequest) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const { user_id, customer_name, customer_phone, product_code, product_name, amount, note } =
    await req.json();
  if (!product_code || !product_name) {
    return NextResponse.json(
      { error: 'Chọn sản phẩm để bán' },
      { status: 400, headers: corsHeaders() },
    );
  }
  if (typeof amount !== 'number' || amount <= 0) {
    return NextResponse.json(
      { error: 'Tổng tiền phải lớn hơn 0' },
      { status: 400, headers: corsHeaders() },
    );
  }
  const code = newOrderCode();
  const [row] = await sql`
    INSERT INTO crm_sales (order_code, user_id, customer_name, customer_phone, product_code, product_name, amount, note)
    VALUES (${code}, ${user_id || null}, ${customer_name || ''}, ${customer_phone || ''}, ${product_code}, ${product_name}, ${amount}, ${note || ''})
    RETURNING *
  `;
  return NextResponse.json(row, { status: 201, headers: corsHeaders() });
}
