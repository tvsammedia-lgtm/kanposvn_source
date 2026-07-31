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

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

export async function GET(req: NextRequest) {
  try {
    const sql = getSql();

    const auth = req.headers.get('authorization');
    if (!auth?.startsWith('Bearer ')) {
      return NextResponse.json({ error: 'Chua dang nhap', has_access: false }, { status: 401, headers: corsHeaders() });
    }

    let user;
    try {
      user = verifyToken(auth.split(' ')[1]);
    } catch {
      return NextResponse.json({ error: 'Token khong hop le', has_access: false }, { status: 401, headers: corsHeaders() });
    }

    const appCode = req.nextUrl.searchParams.get('app');
    if (!appCode) {
      return NextResponse.json({ error: 'Thieu tham so app' }, { status: 400, headers: corsHeaders() });
    }

    const appResult = await sql`SELECT id FROM apps WHERE app_code = ${appCode}`;
    if (appResult.length === 0) {
      return NextResponse.json({ has_access: false, role: null }, { headers: corsHeaders() });
    }

    const result = await sql`
      SELECT p.can_login, r.role_name
      FROM user_permissions p
      JOIN roles r ON r.id = p.role_id
      WHERE p.user_id = ${user.id} AND p.app_id = ${appResult[0].id}
    `;

    const hasAccess = result.length > 0 && result[0].can_login;

    return NextResponse.json({
      has_access: hasAccess,
      role: hasAccess ? result[0].role_name : null,
    }, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json({ error: 'Loi server: ' + String(e), has_access: false }, { status: 500, headers: corsHeaders() });
  }
}
