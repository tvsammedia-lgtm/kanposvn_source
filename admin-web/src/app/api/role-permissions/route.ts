import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,PUT,OPTIONS',
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

export async function GET(req: NextRequest) {
  const sql = getSql();
  const user = getToken(req);
  if (!user) return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });

  const appCode = req.nextUrl.searchParams.get('app');
  if (!appCode) {
    const all = await sql`
      SELECT rp.id, a.app_code, a.app_name, r.role_name, rp.can_view, rp.can_edit, rp.can_delete
      FROM role_permissions rp
      JOIN apps a ON a.id = rp.app_id
      JOIN roles r ON r.id = rp.role_id
      ORDER BY a.app_name, r.role_name
    `;
    return NextResponse.json(all, { headers: corsHeaders() });
  }

  const perms = await sql`
    SELECT rp.id, a.app_code, a.app_name, r.role_name, rp.can_view, rp.can_edit, rp.can_delete
    FROM role_permissions rp
    JOIN apps a ON a.id = rp.app_id
    JOIN roles r ON r.id = rp.role_id
    WHERE a.app_code = ${appCode}
    ORDER BY r.role_name
  `;
  return NextResponse.json(perms, { headers: corsHeaders() });
}

export async function PUT(req: NextRequest) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });

  const { app_code, role_name, can_view, can_edit, can_delete } = await req.json();
  if (!app_code || !role_name) {
    return NextResponse.json({ error: 'Thieu app_code hoac role_name' }, { status: 400, headers: corsHeaders() });
  }

  const app = await sql`SELECT id FROM apps WHERE app_code = ${app_code}`;
  const role = await sql`SELECT id FROM roles WHERE role_name = ${role_name}`;
  if (app.length === 0 || role.length === 0) {
    return NextResponse.json({ error: 'App hoac role khong ton tai' }, { status: 404, headers: corsHeaders() });
  }

  await sql`
    INSERT INTO role_permissions (app_id, role_id, can_view, can_edit, can_delete)
    VALUES (${app[0].id}, ${role[0].id}, ${can_view}, ${can_edit}, ${can_delete})
    ON CONFLICT (app_id, role_id) DO UPDATE SET can_view = ${can_view}, can_edit = ${can_edit}, can_delete = ${can_delete}
  `;

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${admin.email}, 'Cap nhat quyen role', 'RolePermissions', ${app_code + ' / ' + role_name})
  `;

  return NextResponse.json({ ok: true }, { headers: corsHeaders() });
}
