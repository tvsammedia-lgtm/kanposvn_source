import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,PATCH,DELETE,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

function getToken(req: NextRequest) {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try { return verifyToken(auth.split(' ')[1]); } catch { return null; }
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

export async function GET(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const user = getToken(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const [customer] = await sql`
    SELECT
      c.id, c.customer_code, c.owner_user_id, c.name, c.phone, c.email, c.active, c.created_at,
      u.email AS owner_email,
      u.full_name AS owner_full_name,
      u.phone AS owner_phone
    FROM customers c
    JOIN users u ON u.id = c.owner_user_id
    WHERE c.id = ${id}
  `;
  if (!customer) {
    return NextResponse.json({ error: 'Khong tim thay khach hang' }, { status: 404, headers: corsHeaders() });
  }

  const branches = await sql`
    SELECT
      b.id, b.branch_code, b.name, b.phone, b.address, b.app_code, b.active, b.created_at, b.is_default,
      a.app_name,
      l.id AS license_id, l.plan, l.status AS license_status, l.started_at, l.expires_at
    FROM branches b
    LEFT JOIN apps a ON a.app_code = b.app_code
    LEFT JOIN licenses l ON l.app_code = b.app_code AND l.user_id = ${customer.owner_user_id}
    WHERE b.customer_id = ${id}
    ORDER BY b.is_default DESC, b.created_at ASC
  `;

  return NextResponse.json({ ...customer, branches }, { headers: corsHeaders() });
}

export async function PATCH(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const body = await req.json();

  const existing = await sql`SELECT id, name FROM customers WHERE id = ${id}`;
  if (existing.length === 0) {
    return NextResponse.json({ error: 'Khong tim thay khach hang' }, { status: 404, headers: corsHeaders() });
  }

  if (body.name !== undefined) {
    await sql`UPDATE customers SET name = ${body.name} WHERE id = ${id}`;
  }
  if (body.phone !== undefined) {
    await sql`UPDATE customers SET phone = ${body.phone} WHERE id = ${id}`;
  }
  if (body.email !== undefined) {
    await sql`UPDATE customers SET email = ${body.email} WHERE id = ${id}`;
  }
  if (body.active !== undefined) {
    await sql`UPDATE customers SET active = ${!!body.active} WHERE id = ${id}`;
  }
  if (body.owner_user_id !== undefined) {
    const u = await sql`SELECT id FROM users WHERE id = ${body.owner_user_id}`;
    if (u.length === 0) {
      return NextResponse.json({ error: 'Khong tim thay user owner' }, { status: 404, headers: corsHeaders() });
    }
    await sql`UPDATE customers SET owner_user_id = ${body.owner_user_id} WHERE id = ${id}`;
  }

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${admin.email}, 'Sua khach hang', 'Customers', ${'Sua khach hang: ' + String(existing[0].name)})
  `;

  const [updated] = await sql`SELECT * FROM customers WHERE id = ${id}`;
  return NextResponse.json(updated, { headers: corsHeaders() });
}

export async function DELETE(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const existing = await sql`SELECT id, name FROM customers WHERE id = ${id}`;
  if (existing.length === 0) {
    return NextResponse.json({ error: 'Khong tim thay khach hang' }, { status: 404, headers: corsHeaders() });
  }

  // Xoa branch + license + branch_users tuong ung (branches co ON DELETE CASCADE
  // tu customer; branch_users cascade theo branch; license xoa thu cong).
  const branchRows = await sql`SELECT app_code FROM branches WHERE customer_id = ${id}`;
  for (const b of branchRows) {
    await sql`DELETE FROM licenses WHERE app_code = ${b.app_code}`;
  }
  await sql`DELETE FROM branches WHERE customer_id = ${id}`;
  await sql`DELETE FROM customers WHERE id = ${id}`;

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${admin.email}, 'Xoa khach hang', 'Customers', ${'Xoa khach hang: ' + String(existing[0].name)})
  `;

  return NextResponse.json({ ok: true }, { headers: corsHeaders() });
}
