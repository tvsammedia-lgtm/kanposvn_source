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
    const { email, phone, password, app_code, app } = body;
    const appCode = app_code || app;

    if ((!email && !phone) || !password) {
      return NextResponse.json(
        { error: 'Email/SĐT và mật khẩu là bắt buộc' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const [user] = email
      ? await sql`SELECT * FROM users WHERE email = ${email}`
      : await sql`SELECT * FROM users WHERE phone = ${phone}`;

    if (!user) {
      const byPhone = !!phone && !email;
      return NextResponse.json(
        byPhone
          ? {
              error: 'SĐT chưa đăng ký tài khoản Cloud. Vui lòng Đăng ký trước.',
              notRegistered: true,
            }
          : { error: 'Email hoặc mật khẩu không đúng' },
        { status: 404, headers: corsHeaders() },
      );
    }

    // Thong tin cua hang (dang ky qua Web / Zalo Mini App)
    const [store] = await sql`SELECT id, name, phone FROM stores WHERE owner_user_id = ${user.id}`;
    let license = null;
    if (store) {
      const licRows = await sql`
        SELECT id, plan, status, expires_at, app_code FROM licenses
        WHERE user_id = ${user.id}
        ORDER BY (store_id = ${store.id}) DESC, started_at DESC LIMIT 1
      `;
      license = licRows[0] || null;
    }

    const now = new Date();
    const expired = license?.expires_at && new Date(license.expires_at as string) < now;

    if (expired) {
      await sql`UPDATE users SET active = false WHERE id = ${user.id}`;
      await sql`UPDATE licenses SET status = 'expired' WHERE id = ${license.id}`;
      return NextResponse.json(
        { error: 'Gói bản quyền đã hết hạn. Tài khoản đã bị khóa. Vui lòng gia hạn trên Zalo Mini App.' },
        { status: 403, headers: corsHeaders() },
      );
    }

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

    const allPerms = await sql`
      SELECT a.app_code, a.app_name, r.role_name, p.can_login
      FROM user_permissions p
      JOIN apps a ON a.id = p.app_id
      JOIN roles r ON r.id = p.role_id
      WHERE p.user_id = ${user.id}
    `;

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

    // Thong tin cua hang (dang ky qua Web / Zalo Mini App)
    return NextResponse.json(
      {
        user: {
          id: user.id,
          name: user.full_name,
          full_name: user.full_name,
          email: user.email,
          phone: user.phone ?? '',
          role: isAdmin ? 'admin' : 'user',
          shop_name: user.shop_name ?? '',
          shop_address: user.shop_address ?? '',
          subscription_plan: user.subscription_plan ?? '',
          subscription_start: user.subscription_start ?? null,
          subscription_end: user.subscription_end ?? null,
        },
        token,
        permissions,
        storeId: store?.id ?? null,
        storeName: store?.name ?? null,
        storePhone: store?.phone ?? null,
        appCode: license?.app_code ?? null,
        plan: license?.plan ?? null,
        trial: license?.plan === 'trial',
        forever: !license?.expires_at && !!license,
        expiresAt: license?.expires_at ?? null,
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
