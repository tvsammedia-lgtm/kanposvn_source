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
  const [branch] = await sql`
    SELECT b.*, c.name AS customer_name, c.customer_code
    FROM branches b
    JOIN customers c ON c.id = b.customer_id
    WHERE b.id = ${id}
  `;
  if (!branch) {
    return NextResponse.json({ error: 'Khong tim thay chi nhanh' }, { status: 404, headers: corsHeaders() });
  }

  const licenses = await sql`
    SELECT id, user_id, app_code, device_id, plan, status, started_at, expires_at
    FROM licenses WHERE app_code = ${branch.app_code}
    ORDER BY started_at DESC
  `;

  const users = await sql`
    SELECT u.id, u.email, u.full_name, u.phone, r.role_name, bu.can_login
    FROM branch_users bu
    JOIN users u ON u.id = bu.user_id
    LEFT JOIN roles r ON r.id = bu.role_id
    WHERE bu.branch_id = ${id}
    ORDER BY u.full_name
  `;

  return NextResponse.json({ ...branch, licenses, users }, { headers: corsHeaders() });
}

export async function PATCH(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const body = await req.json();

  const existing = await sql`SELECT id, name, app_code FROM branches WHERE id = ${id}`;
  if (existing.length === 0) {
    return NextResponse.json({ error: 'Khong tim thay chi nhanh' }, { status: 404, headers: corsHeaders() });
  }

  if (body.name !== undefined) {
    await sql`UPDATE branches SET name = ${body.name} WHERE id = ${id}`;
  }
  if (body.branch_code !== undefined) {
    await sql`UPDATE branches SET branch_code = ${body.branch_code} WHERE id = ${id}`;
  }
  if (body.phone !== undefined) {
    await sql`UPDATE branches SET phone = ${body.phone} WHERE id = ${id}`;
  }
  if (body.address !== undefined) {
    await sql`UPDATE branches SET address = ${body.address} WHERE id = ${id}`;
  }
  if (body.active !== undefined) {
    await sql`UPDATE branches SET active = ${!!body.active} WHERE id = ${id}`;
  }
  if (body.app_code !== undefined && body.app_code !== existing[0].app_code) {
    await sql`UPDATE branches SET app_code = ${body.app_code} WHERE id = ${id}`;
  }

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${admin.email}, 'Sua chi nhanh', 'Branches', ${'Sua chi nhanh: ' + String(existing[0].name)})
  `;

  const [updated] = await sql`SELECT * FROM branches WHERE id = ${id}`;
  return NextResponse.json(updated, { headers: corsHeaders() });
}

export async function DELETE(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const existing = await sql`SELECT id, name, app_code FROM branches WHERE id = ${id}`;
  if (existing.length === 0) {
    return NextResponse.json({ error: 'Khong tim thay chi nhanh' }, { status: 404, headers: corsHeaders() });
  }

  await sql`DELETE FROM licenses WHERE app_code = ${existing[0].app_code}`;
  await sql`DELETE FROM branches WHERE id = ${id}`;

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${admin.email}, 'Xoa chi nhanh', 'Branches', ${'Xoa chi nhanh: ' + String(existing[0].name)})
  `;

  return NextResponse.json({ ok: true }, { headers: corsHeaders() });
}
