import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { resolveCustomer } from '@/lib/warehouse_scope';

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

// GET /api/owner/products?app_code=kanposvncafe
// Sản phẩm thuộc Customer (dùng chung mọi chi nhánh / kho — tồn kho là của Warehouse).
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
    const products = await sql`
      SELECT id, customer_id, product_code, name, unit, price, active, created_at
      FROM products
      WHERE customer_id = ${customer.id}
      ORDER BY name ASC
    `;
    return NextResponse.json(
      { customer: { id: customer.id, customer_code: customer.customer_code }, products },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json({ error: 'Loi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}

// POST /api/owner/products
// Body: { app_code, product_code?, name, unit?, price? } — chỉ chủ doanh nghiệp tạo sản phẩm.
export async function POST(req: NextRequest) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }
  const body = await req.json();
  const { app_code, product_code, name, unit, price } = body;
  if (!app_code) {
    return NextResponse.json({ error: 'Thieu app_code' }, { status: 400, headers: corsHeaders() });
  }
  if (!name) {
    return NextResponse.json({ error: 'Ten san pham la bat buoc' }, { status: 400, headers: corsHeaders() });
  }

  try {
    const customer = await resolveCustomer(sql, user.id, app_code);
    if (!customer) {
      return NextResponse.json({ error: 'Khong tim thay khach hang' }, { status: 404, headers: corsHeaders() });
    }
    const [customerRow] = await sql`SELECT id, owner_user_id FROM customers WHERE id = ${customer.id}`;
    if (String(customerRow.owner_user_id) !== user.id) {
      return NextResponse.json({ error: 'Chi chu doanh nghiep duoc tao san pham' }, { status: 403, headers: corsHeaders() });
    }

    const created = await sql`
      INSERT INTO products (customer_id, product_code, name, unit, price)
      VALUES (${customer.id}, ${product_code || ''}, ${name}, ${unit || ''}, ${
        price === undefined || price === null ? 0 : Number(price)
      })
      RETURNING *
    `;
    return NextResponse.json(created[0], { status: 201, headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json({ error: 'Loi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}
