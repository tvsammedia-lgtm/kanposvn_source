import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'PATCH,DELETE,OPTIONS',
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

export async function PATCH(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const body = await req.json();

  const existing = await sql`SELECT id, app_code FROM apps WHERE id = ${id}`;
  if (existing.length === 0) {
    return NextResponse.json({ error: 'Khong tim thay app' }, { status: 404, headers: corsHeaders() });
  }

  if (body.app_code !== undefined) {
    const dup = await sql`SELECT id FROM apps WHERE app_code = ${body.app_code} AND id != ${id}`;
    if (dup.length > 0) {
      return NextResponse.json({ error: 'app_code đã tồn tại' }, { status: 409, headers: corsHeaders() });
    }
  }

  if (body.app_code !== undefined) await sql`UPDATE apps SET app_code = ${body.app_code} WHERE id = ${id}`;
  if (body.app_name !== undefined) await sql`UPDATE apps SET app_name = ${body.app_name} WHERE id = ${id}`;
  if (body.description !== undefined) await sql`UPDATE apps SET description = ${body.description} WHERE id = ${id}`;
  if (body.package_name !== undefined) await sql`UPDATE apps SET package_name = ${body.package_name} WHERE id = ${id}`;
  if (body.app_url !== undefined) await sql`UPDATE apps SET app_url = ${body.app_url} WHERE id = ${id}`;
  if (body.platform !== undefined) await sql`UPDATE apps SET platform = ${body.platform} WHERE id = ${id}`;
  if (body.show_in_registration !== undefined) await sql`UPDATE apps SET show_in_registration = ${body.show_in_registration} WHERE id = ${id}`;
  if (body.price !== undefined) {
    await sql`UPDATE apps SET price = ${typeof body.price === 'number' && body.price > 0 ? body.price : null} WHERE id = ${id}`;
  }

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${admin.email}, 'Cập nhật app', 'Apps', ${'Cập nhật app: ' + existing[0].app_code})
  `;

  const updated = await sql`SELECT id, app_code, app_name, description, package_name, app_url, platform, show_in_registration, price, created_at FROM apps WHERE id = ${id}`;
  return NextResponse.json(updated[0], { headers: corsHeaders() });
}

export async function DELETE(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const target = await sql`SELECT app_code FROM apps WHERE id = ${id}`;
  if (target.length === 0) {
    return NextResponse.json({ error: 'Khong tim thay app' }, { status: 404, headers: corsHeaders() });
  }

  await sql`DELETE FROM role_permissions WHERE app_id = ${id}`;
  await sql`DELETE FROM user_permissions WHERE app_id = ${id}`;
  await sql`DELETE FROM apps WHERE id = ${id}`;

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${admin.email}, 'Xóa app', 'Apps', ${'Xóa app: ' + target[0].app_code})
  `;

  return NextResponse.json({ ok: true }, { headers: corsHeaders() });
}
