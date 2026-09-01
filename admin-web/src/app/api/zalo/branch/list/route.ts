import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

// GET /api/zalo/branch/list?zalo_id=...
// Tra ve danh sach chi nhanh cua user theo module (gom theo app_code).
export async function GET(req: NextRequest) {
  const sql = getSql();
  try {
    const zaloId = req.nextUrl.searchParams.get('zalo_id') || '';
    if (!zaloId) {
      return NextResponse.json({ error: 'Thieu zalo_id' }, { status: 400, headers: corsHeaders() });
    }

    const [user] = await sql`SELECT id FROM users WHERE zalo_id = ${zaloId}`;
    if (!user) {
      return NextResponse.json({ branches: [] }, { headers: corsHeaders() });
    }

    const branches = await sql`
      SELECT
        b.id, b.branch_code, b.name, b.phone, b.address, b.app_code, b.is_default, b.active, b.created_at,
        a.app_name,
        l.id AS license_id, l.plan AS license_plan, l.status AS license_status, l.expires_at AS license_expires_at
      FROM branches b
      JOIN customers c ON c.id = b.customer_id
      LEFT JOIN apps a ON a.app_code = b.app_code
      LEFT JOIN licenses l ON l.branch_id = b.id AND l.user_id = ${user.id} AND l.device_id = ''
      WHERE c.owner_user_id = ${user.id} AND b.active = true
      ORDER BY b.app_code ASC, b.is_default DESC, b.created_at ASC
    `;

    return NextResponse.json(
      {
        branches: branches.map((b: any) => ({
          id: b.id,
          branch_code: b.branch_code,
          name: b.name,
          phone: b.phone,
          address: b.address,
          app_code: b.app_code,
          app_name: b.app_name || b.app_code,
          is_default: b.is_default === true,
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
