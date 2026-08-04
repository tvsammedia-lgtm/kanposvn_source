import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { comparePassword, signToken } from '@/lib/auth';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

export async function POST(req: NextRequest) {
  try {
    const sql = getSql();
    const body = await req.json();
    const { email, password, app_code, app } = body;
    const appCode = app_code || app;

    if (!email || !password) {
      return NextResponse.json(
        { error: 'Email và mật khẩu là bắt buộc' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const [userRows, permRows] = await Promise.all([
      sql`SELECT * FROM users WHERE email = ${email}`,
      sql`
        SELECT a.app_code, a.app_name, r.role_name, p.can_login
        FROM user_permissions p
        JOIN users u ON u.id = p.user_id
        JOIN apps a ON a.id = p.app_id
        JOIN roles r ON r.id = p.role_id
        WHERE u.email = ${email}
      `,
    ]);
    const result = userRows;
    if (result.length === 0) {
      return NextResponse.json(
        { error: 'Email hoặc mật khẩu không đúng' },
        { status: 401, headers: corsHeaders() },
      );
    }

    const user = result[0];
    if (!user.active) {
      return NextResponse.json(
        { error: 'Tài khoản đã bị khóa' },
        { status: 403, headers: corsHeaders() },
      );
    }

    const valid = await comparePassword(password, user.password_hash);
    if (!valid) {
      return NextResponse.json(
        { error: 'Email hoặc mật khẩu không đúng' },
        { status: 401, headers: corsHeaders() },
      );
    }

    const allPerms = permRows;

    if (appCode) {
      const appPerm = allPerms.find(
        (p: { app_code: string }) => p.app_code === appCode,
      );
      if (!appPerm || !appPerm.can_login) {
        return NextResponse.json(
          { error: 'Bạn không có quyền sử dụng ứng dụng này' },
          { status: 403, headers: corsHeaders() },
        );
      }
    }

    const isAdmin = allPerms.some(
      (p: { role_name: string }) => p.role_name === 'Admin',
    );

    const permissions = allPerms.map((p: { app_code: string; role_name: string; can_login: boolean }) => ({
      app_code: p.app_code,
      role_name: p.role_name,
      can_login: p.can_login,
      permission_key: p.app_code,
      granted: p.can_login,
    }));

    const token = signToken({ id: user.id, email: user.email, role: isAdmin ? 'admin' : 'user' });

    return NextResponse.json(
      {
        user: {
          id: user.id,
          name: user.full_name,
          full_name: user.full_name,
          email: user.email,
          role: isAdmin ? 'admin' : 'user',
          phone: user.phone ?? '',
          shop_name: user.shop_name ?? '',
          shop_address: user.shop_address ?? '',
          subscription_plan: user.subscription_plan ?? '',
          subscription_start: user.subscription_start ?? null,
          subscription_end: user.subscription_end ?? null,
        },
        token,
        permissions,
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
