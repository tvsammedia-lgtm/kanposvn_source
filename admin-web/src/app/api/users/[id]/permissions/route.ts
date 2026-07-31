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

export async function GET(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const user = getToken(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const permissions = await sql`
    SELECT
      p.app_id,
      a.app_code,
      a.app_name,
      p.role_id,
      r.role_name,
      p.can_login
    FROM user_permissions p
    JOIN apps a ON a.id = p.app_id
    JOIN roles r ON r.id = p.role_id
    WHERE p.user_id = ${id}
    ORDER BY a.app_name
  `;
  return NextResponse.json(permissions, { headers: corsHeaders() });
}

export async function PUT(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const { permissions } = await req.json();

  await sql`DELETE FROM user_permissions WHERE user_id = ${id}`;

  for (const p of permissions) {
    await sql`
      INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
      VALUES (${id}, ${p.app_id}, ${p.role_id}, ${p.can_login})
    `;
  }

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${admin.email}, 'Cap nhat quyen', 'Permissions', ${'User: ' + id + ', Count: ' + permissions.length})
  `;

  return NextResponse.json({ ok: true }, { headers: corsHeaders() });
}
