import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken, hashPassword } from '@/lib/auth';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,POST,OPTIONS',
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
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  try {
    const users = await sql`
      SELECT
        u.id, u.email, u.full_name, u.active, u.created_at,
        u.birth_year, u.cccd, u.phone, u.subscription_plan, u.subscription_start, u.subscription_end,
        COALESCE(
          (SELECT json_agg(json_build_object(
            'app_code', a.app_code,
            'app_name', a.app_name,
            'role_name', r.role_name,
            'can_login', p.can_login
          ))
           FROM user_permissions p
           JOIN apps a ON a.id = p.app_id
           JOIN roles r ON r.id = p.role_id
           WHERE p.user_id = u.id), '[]'
        ) as permissions
      FROM users u
      ORDER BY u.created_at DESC
    `;
    return NextResponse.json(users, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { error: 'Loi truy van CSDL: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}

export async function POST(req: NextRequest) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { email, password, full_name, birth_year, cccd, phone, subscription_plan } = await req.json();
  if (!email || !password) {
    return NextResponse.json({ error: 'Email va mat khau la bat buoc' }, { status: 400, headers: corsHeaders() });
  }

  const existing = await sql`SELECT id FROM users WHERE email = ${email}`;
  if (existing.length > 0) {
    return NextResponse.json({ error: 'Email da ton tai' }, { status: 409, headers: corsHeaders() });
  }

  const hash = await hashPassword(password);
  const planDays = parseInt(subscription_plan) || 0;
  const subscriptionStart = new Date();
  const subscriptionEnd = planDays > 0
    ? new Date(subscriptionStart.getTime() + planDays * 24 * 60 * 60 * 1000)
    : null;

  const result = await sql`
    INSERT INTO users (email, password_hash, full_name, active, birth_year, cccd, phone, subscription_plan, subscription_start, subscription_end)
    VALUES (${email}, ${hash}, ${full_name || ''}, true, ${birth_year || null}, ${cccd || ''}, ${phone || ''}, ${subscription_plan || ''}, ${subscriptionStart.toISOString()}, ${subscriptionEnd?.toISOString() || null})
    RETURNING id, email, full_name, active, created_at, birth_year, cccd, phone, subscription_plan, subscription_start, subscription_end
  `;

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${admin.email}, 'Tao user moi', 'Users', ${'Tao user: ' + email})
  `;

  return NextResponse.json(result[0], { status: 201, headers: corsHeaders() });
}
