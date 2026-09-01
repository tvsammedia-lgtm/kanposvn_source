import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

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
    const rows = await sql`
      SELECT
        c.id, c.customer_code, c.owner_user_id, c.name, c.phone, c.email, c.active, c.created_at,
        u.email AS owner_email,
        u.full_name AS owner_full_name,
        COALESCE(
          (SELECT COUNT(*)::int FROM branches b WHERE b.customer_id = c.id), 0
        ) AS branch_count,
        COALESCE(
          (SELECT COUNT(*)::int
           FROM branches b
           JOIN licenses l ON l.app_code = b.app_code AND l.status = 'active'
             AND (l.branch_id = b.id OR (l.branch_id IS NULL AND b.is_default = true))
           WHERE b.customer_id = c.id), 0
        ) AS license_count
      FROM customers c
      JOIN users u ON u.id = c.owner_user_id
      ORDER BY c.created_at DESC
    `;
    return NextResponse.json(rows, { headers: corsHeaders() });
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

  const { name, phone, email, owner_user_id, owner_email } = await req.json();
  if (!name) {
    return NextResponse.json({ error: 'Ten khach hang la bat buoc' }, { status: 400, headers: corsHeaders() });
  }
  if (!owner_user_id && !owner_email) {
    return NextResponse.json(
      { error: 'Can owner_user_id hoac owner_email (tai khoan chinh cua chu doanh nghiep)' },
      { status: 400, headers: corsHeaders() },
    );
  }

  try {
    let ownerUserId: string;
    if (owner_user_id) {
      const u = await sql`SELECT id FROM users WHERE id = ${owner_user_id}`;
      if (u.length === 0) {
        return NextResponse.json({ error: 'Khong tim thay user owner' }, { status: 404, headers: corsHeaders() });
      }
      ownerUserId = String(u[0].id);
    } else {
      const u = await sql`SELECT id FROM users WHERE email = ${String(owner_email).trim().toLowerCase()}`;
      if (u.length === 0) {
        return NextResponse.json(
          { error: 'Khong tim thay user voi email nay. Tao user truoc hoac dung owner_user_id.' },
          { status: 404, headers: corsHeaders() },
        );
      }
      ownerUserId = String(u[0].id);
    }

    const code = 'C' + String(Date.now()).slice(-6);
    const result = await sql`
      INSERT INTO customers (customer_code, owner_user_id, name, phone, email)
      VALUES (${code}, ${ownerUserId}, ${name}, ${phone || ''}, ${email || ''})
      RETURNING *
    `;

    await sql`
      INSERT INTO audit_logs (user_name, action, module, details)
      VALUES (${admin.email}, 'Tao khach hang', 'Customers', ${'Tao khach hang: ' + name + ' (owner: ' + ownerUserId + ')'})
    `;

    return NextResponse.json(result[0], { status: 201, headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { error: 'Loi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
