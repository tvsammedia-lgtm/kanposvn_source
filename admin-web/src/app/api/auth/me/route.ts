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

export async function GET(req: NextRequest) {
  try {
    const authHeader = req.headers.get('authorization');
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return NextResponse.json(
        { error: 'Không tìm thấy token' },
        { status: 401, headers: corsHeaders() },
      );
    }

    const token = authHeader.split(' ')[1];
    let decoded;
    try {
      decoded = verifyToken(token);
    } catch {
      return NextResponse.json(
        { error: 'Token không hợp lệ hoặc đã hết hạn' },
        { status: 401, headers: corsHeaders() },
      );
    }

    const sql = getSql();
    const result = await sql`SELECT id, email, full_name, active FROM users WHERE id = ${decoded.id}`;

    if (result.length === 0) {
      return NextResponse.json(
        { error: 'Không tìm thấy người dùng' },
        { status: 404, headers: corsHeaders() },
      );
    }

    const user = result[0];

    const permissions = await sql`
      SELECT
        a.app_code,
        r.role_name,
        p.can_login
      FROM user_permissions p
      JOIN apps a ON a.id = p.app_id
      JOIN roles r ON r.id = p.role_id
      WHERE p.user_id = ${user.id}
    `;

    const formattedPermissions = permissions.map((p: { app_code: string; role_name: string; can_login: boolean }) => ({
      app_code: p.app_code,
      role_name: p.role_name,
      can_login: p.can_login,
      permission_key: p.app_code,
      granted: p.can_login,
    }));

    return NextResponse.json(
      {
        user: { full_name: user.full_name, email: user.email },
        permissions: formattedPermissions,
      },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json(
      { error: 'Lỗi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
