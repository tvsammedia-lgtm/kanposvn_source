import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { hashPassword, signToken } from '@/lib/auth';
import { getPlan } from '@/lib/pricing';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

export async function POST(req: NextRequest) {
  const sql = getSql();
  try {
    const body = await req.json();
    const {
      zalo_id,
      phone,
      email,
      full_name,
      shop_name,
      shop_address,
      app_code,
      password,
    } = body;
    const appCode = (app_code || 'kanposvncafe') as string;

    if (!phone && !email) {
      return NextResponse.json(
        { error: 'Vui lòng cung cấp số điện thoại hoặc email' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const appRows = await sql`SELECT * FROM apps WHERE app_code = ${appCode}`;
    if (appRows.length === 0) {
      return NextResponse.json(
        { error: `Ứng dụng "${appCode}" không tồn tại` },
        { status: 404, headers: corsHeaders() },
      );
    }
    const app = appRows[0];

    let user = null;
    if (phone) {
      const rows = await sql`SELECT * FROM users WHERE phone = ${phone}`;
      if (rows.length > 0) user = rows[0];
    }
    if (!user && email) {
      const rows = await sql`SELECT * FROM users WHERE email = ${email}`;
      if (rows.length > 0) user = rows[0];
    }
    if (!user && zalo_id) {
      const rows = await sql`SELECT * FROM users WHERE zalo_id = ${zalo_id}`;
      if (rows.length > 0) user = rows[0];
    }

    const finalEmail =
      email || (phone ? `${phone}@zalo.kanposvn` : `${zalo_id}@zalo.kanposvn`);

    if (!user) {
      const hash = await hashPassword(password || `kn@${Math.random().toString(36).slice(2, 10)}`);
      const created = await sql`
        INSERT INTO users (email, password_hash, full_name, role, active, phone, shop_name, shop_address, zalo_id, subscription_plan)
        VALUES (${finalEmail}, ${hash}, ${full_name || ''}, 'user', true, ${phone || ''}, ${shop_name || ''}, ${shop_address || ''}, ${zalo_id || ''}, 'trial')
        RETURNING *
      `;
      user = created[0];
    } else {
      if (zalo_id && !user.zalo_id) {
        await sql`UPDATE users SET zalo_id = ${zalo_id} WHERE id = ${user.id}`;
        user.zalo_id = zalo_id;
      }
    }

    const userId = user.id;

    const roleRows = await sql`SELECT id FROM roles WHERE role_name = 'Admin'`;
    const roleId = roleRows.length > 0
      ? roleRows[0].id
      : await (async () => {
          const r = await sql`INSERT INTO roles (role_name) VALUES ('Admin') RETURNING id`;
          return r[0].id;
        })();

    const permRows = await sql`
      SELECT id FROM user_permissions WHERE user_id = ${userId} AND app_id = ${app.id}
    `;
    if (permRows.length === 0) {
      await sql`
        INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
        VALUES (${userId}, ${app.id}, ${roleId}, true)
      `;
    }

    const trialPlan = getPlan('trial');
    const now = new Date();
    const trialEnd = new Date(now.getTime() + trialPlan.days * 24 * 60 * 60 * 1000);

    const licRows = await sql`
      SELECT * FROM licenses WHERE user_id = ${userId} AND app_code = ${appCode}
    `;
    if (licRows.length === 0) {
      await sql`
        INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at)
        VALUES (${userId}, ${appCode}, '', 'trial', 'active', ${now.toISOString()}, ${trialEnd.toISOString()})
      `;
    }

    await sql`
      UPDATE users SET subscription_plan = 'trial', subscription_start = ${now.toISOString()}, subscription_end = ${trialEnd.toISOString()}
      WHERE id = ${userId}
    `;

    await sql`
      INSERT INTO audit_logs (user_name, action, module, details)
      VALUES (${finalEmail}, 'Đăng ký tài khoản qua Zalo', 'License', ${'Đăng ký: ' + finalEmail + ' | app: ' + appCode})
    `;

    const token = signToken({ id: userId, email: finalEmail, role: 'user' });

    return NextResponse.json(
      {
        success: true,
        token,
        trial: true,
        message: `Đăng ký thành công! Được dùng thử ${trialPlan.days} ngày.`,
        user: {
          id: userId,
          email: finalEmail,
          full_name: user.full_name || '',
          phone: user.phone || '',
          shop_name: user.shop_name || '',
          subscription_plan: 'trial',
          subscription_end: trialEnd.toISOString(),
          app_code: appCode,
        },
      },
      { status: 200, headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json(
      { error: 'Lỗi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
