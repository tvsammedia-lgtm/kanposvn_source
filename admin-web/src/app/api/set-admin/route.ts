import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

const SEED_SECRET = process.env.SEED_SECRET || 'kanposvn_seed_2026';

export async function POST(req: NextRequest) {
  const sql = getSql();
  const { email, secret } = await req.json();

  if (secret !== SEED_SECRET) {
    return NextResponse.json({ error: 'Sai secret key' }, { status: 403 });
  }

  const user = await sql`SELECT id FROM users WHERE email = ${email}`;
  if (user.length === 0) {
    return NextResponse.json({ error: 'Khong tim thay user' }, { status: 404 });
  }

  const adminRole = await sql`SELECT id FROM roles WHERE role_name = 'Admin'`;
  if (adminRole.length === 0) {
    return NextResponse.json({ error: 'Role Admin chua ton tai' }, { status: 500 });
  }

  const apps = await sql`SELECT id FROM apps`;
  for (const app of apps) {
    await sql`
      INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
      VALUES (${user[0].id}, ${app.id}, ${adminRole[0].id}, true)
      ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${adminRole[0].id}, can_login = true
    `;
  }

  return NextResponse.json({ ok: true, message: `Da set role Admin cho ${email} tren tat ca apps` });
}
