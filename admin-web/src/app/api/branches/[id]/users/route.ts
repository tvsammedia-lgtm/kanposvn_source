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
  const users = await sql`
    SELECT u.id, u.email, u.full_name, u.phone, r.role_name, bu.role_id, bu.can_login
    FROM branch_users bu
    JOIN users u ON u.id = bu.user_id
    LEFT JOIN roles r ON r.id = bu.role_id
    WHERE bu.branch_id = ${id}
    ORDER BY u.full_name
  `;

  const roles = await sql`SELECT id, role_name FROM roles ORDER BY role_name`;

  return NextResponse.json({ users, roles }, { headers: corsHeaders() });
}

// PUT /api/branches/[id]/users — thay the toan bo danh sach user cua chi nhanh.
// Body: { users: [{ user_id, role_id, can_login }] }
export async function PUT(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const branch = await sql`SELECT id, name FROM branches WHERE id = ${id}`;
  if (branch.length === 0) {
    return NextResponse.json({ error: 'Khong tim thay chi nhanh' }, { status: 404, headers: corsHeaders() });
  }

  const { users } = await req.json();
  if (!Array.isArray(users)) {
    return NextResponse.json({ error: 'Thieu danh sach users' }, { status: 400, headers: corsHeaders() });
  }

  await sql`DELETE FROM branch_users WHERE branch_id = ${id}`;

  for (const u of users) {
    if (!u.user_id) continue;
    await sql`
      INSERT INTO branch_users (branch_id, user_id, role_id, can_login)
      VALUES (${id}, ${u.user_id}, ${u.role_id || null}, ${u.can_login !== false})
    `;
  }

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${admin.email}, 'Phan quyen chi nhanh', 'Branches', ${'Phan quyen ' + users.length + ' user cho chi nhanh: ' + String(branch[0].name)})
  `;

  return NextResponse.json({ ok: true, count: users.length }, { headers: corsHeaders() });
}
