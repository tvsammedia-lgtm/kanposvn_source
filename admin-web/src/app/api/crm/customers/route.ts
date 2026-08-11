import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

function getAdmin(req: NextRequest) {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try {
    return verifyToken(auth.split(' ')[1]);
  } catch {
    return null;
  }
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

// GET (admin): danh sách khách hàng = user đã đăng ký (stores) kèm license/gói.
// Dữ liệu phục vụ kanposvncrm (quản lý khách hàng + bán đơn giản).
export async function GET(req: NextRequest) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  try {
    const rows = await sql`
      SELECT DISTINCT ON (u.id)
             u.id AS user_id, u.full_name, u.phone, u.email, u.active AS user_active,
             u.subscription_plan, u.subscription_start, u.subscription_end,
             s.id AS store_id, s.name AS store_name,
             l.plan AS license_plan, l.status AS license_status, l.expires_at AS license_expires_at,
             l.app_code,
             o.order_code, o.status AS order_status, o.amount, o.created_at AS order_created_at
      FROM users u
      LEFT JOIN stores s ON s.owner_user_id = u.id
      LEFT JOIN licenses l ON l.user_id = u.id
      LEFT JOIN orders o ON o.user_id = u.id AND o.status = 'paid'
      ORDER BY u.id, u.created_at DESC
    `;
    return NextResponse.json(rows, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { error: 'Lỗi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
