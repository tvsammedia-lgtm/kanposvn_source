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
  try { return verifyToken(auth.split(' ')[1]); } catch { return null; }
}

// GET (admin): danh sách yêu cầu mua thêm module/chi nhánh.
// Tham số ?status=pending lọc theo trạng thái.
export async function GET(req: NextRequest) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  try {
    const status = req.nextUrl.searchParams.get('status');
    const cond = status ? sql`WHERE r.status = ${status}` : sql``;
    const rows = await sql`
      SELECT r.id, r.user_id, r.payload, r.status, r.plan, r.requested_at, r.resolved_at, r.resolved_by, r.note,
             u.full_name, u.phone, u.email,
             s.id AS store_id, s.name AS store_name
      FROM addon_requests r
      LEFT JOIN users u ON u.id = r.user_id
      LEFT JOIN stores s ON s.owner_user_id = r.user_id
      ${cond}
      ORDER BY r.requested_at DESC
    `;
    return NextResponse.json(rows, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json({ error: 'Lỗi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}
