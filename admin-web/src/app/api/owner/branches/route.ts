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

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

// Danh sách CHI NHÁNH của module (app_code) mà user đang đăng nhập được phép dùng.
// GET /api/owner/branches?app_code=kanposvncafe
// Trả về: { branches: [{ id, branch_code, name, phone, address, app_code, customer_name,
//           license: { plan, status, expires_at } | null }] }
// Quyền: user là owner của customer (customer.owner_user_id) HOẶC có tài khoản
//        nhân viên (branch_users) cho chi nhánh đó.
export async function GET(req: NextRequest) {
  const sql = getSql();
  try {
    const auth = req.headers.get('authorization');
    if (!auth?.startsWith('Bearer ')) {
      return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
    }
    let payload: { id: string };
    try {
      payload = verifyToken(auth.split(' ')[1]) as { id: string };
    } catch {
      return NextResponse.json({ error: 'Phien dang nhap het han' }, { status: 401, headers: corsHeaders() });
    }

    const appCode = req.nextUrl.searchParams.get('app_code') || '';
    if (!appCode) {
      return NextResponse.json({ error: 'Thieu app_code' }, { status: 400, headers: corsHeaders() });
    }

    const branches = await sql`
      SELECT
        b.id, b.branch_code, b.name, b.phone, b.address, b.app_code, b.active, b.created_at,
        c.name AS customer_name,
        l.id AS license_id, l.plan AS license_plan, l.status AS license_status, l.expires_at AS license_expires_at
      FROM branches b
      JOIN customers c ON c.id = b.customer_id
      LEFT JOIN licenses l ON l.branch_id = b.id AND l.user_id = ${payload.id} AND l.device_id = ''
      WHERE b.app_code = ${appCode}
        AND b.active = true
        AND (
          c.owner_user_id = ${payload.id}
          OR EXISTS (
            SELECT 1 FROM branch_users bu WHERE bu.branch_id = b.id AND bu.user_id = ${payload.id} AND bu.can_login = true
          )
        )
      ORDER BY b.created_at ASC
    `;

    return NextResponse.json(
      {
        branches: branches.map((b) => ({
          id: b.id,
          branch_code: b.branch_code,
          name: b.name,
          phone: b.phone,
          address: b.address,
          app_code: b.app_code,
          customer_name: b.customer_name,
          license: b.license_id
            ? {
                plan: b.license_plan,
                status: b.license_status,
                expires_at: b.license_expires_at,
              }
            : null,
        })),
      },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json(
      { error: 'Loi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
