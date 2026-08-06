import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { MAX_DEVICES } from '@/lib/pricing';

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
  const sql = getSql();
  try {
    const auth = req.headers.get('authorization');
    const appCode = req.nextUrl.searchParams.get('app_code') || 'kanposvncafe';
    const deviceId = req.nextUrl.searchParams.get('device_id') || '';

    let userId: string | null = null;
    if (auth?.startsWith('Bearer ')) {
      try {
        const payload = verifyToken(auth.split(' ')[1]) as { id: string };
        userId = payload.id;
      } catch {
        return NextResponse.json(
          { valid: false, message: 'Phiên đăng nhập hết hạn' },
          { status: 401, headers: corsHeaders() },
        );
      }
    }
    if (!userId) {
      const phone = req.nextUrl.searchParams.get('phone');
      const email = req.nextUrl.searchParams.get('email');
      if (phone) {
        const rows = await sql`SELECT id FROM users WHERE phone = ${phone}`;
        if (rows.length > 0) userId = rows[0].id;
      } else if (email) {
        const rows = await sql`SELECT id FROM users WHERE email = ${email}`;
        if (rows.length > 0) userId = rows[0].id;
      }
    }
    if (!userId) {
      return NextResponse.json(
        { valid: false, message: 'Không xác định được tài khoản' },
        { status: 401, headers: corsHeaders() },
      );
    }

    const now = new Date();
    const appRows = await sql`SELECT id FROM apps WHERE app_code = ${appCode}`;
    if (appRows.length === 0) {
      return NextResponse.json(
        { valid: false, message: `App ${appCode} không tồn tại` },
        { status: 404, headers: corsHeaders() },
      );
    }

    let lic = null;
    if (deviceId) {
      const rows = await sql`
        SELECT * FROM licenses WHERE user_id = ${userId} AND app_code = ${appCode} AND device_id = ${deviceId}
      `;
      if (rows.length > 0) lic = rows[0];
    }

    if (!lic) {
      const accountRows = await sql`
        SELECT * FROM licenses WHERE user_id = ${userId} AND app_code = ${appCode} AND device_id = ''
      `;
      if (accountRows.length > 0) {
        lic = accountRows[0];
        if (deviceId) {
          const countRows = await sql`
            SELECT COUNT(*)::int AS n FROM licenses WHERE user_id = ${userId} AND app_code = ${appCode} AND status = 'active'
          `;
          const activeCount = countRows[0]?.n ?? 0;
          if (activeCount < MAX_DEVICES) {
            const newLic = await sql`
              INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at)
              VALUES (${userId}, ${appCode}, ${deviceId}, ${lic.plan}, ${lic.status}, ${lic.started_at}, ${lic.expires_at})
              RETURNING *
            `;
            lic = newLic[0];
          } else {
            lic = null;
          }
        }
      }
    }

    if (!lic) {
      return NextResponse.json(
        {
          valid: false,
          message: 'Chưa có license. Vui lòng đăng ký hoặc mua gói trên Zalo Mini App.',
          plan: 'none',
        },
        { headers: corsHeaders() },
      );
    }

    if (lic.status !== 'active') {
      return NextResponse.json(
        { valid: false, message: `License đã bị ${lic.status}` },
        { headers: corsHeaders() },
      );
    }

    if (lic.expires_at && new Date(lic.expires_at) < now) {
      await sql`UPDATE licenses SET status = 'expired', last_check_at = ${now.toISOString()} WHERE id = ${lic.id}`;
      await sql`UPDATE users SET active = false WHERE id = ${userId}`;
      return NextResponse.json(
        {
          valid: false,
          expired: true,
          message: 'License đã hết hạn. Tài khoản đã bị khóa. Vui lòng gia hạn trên Zalo Mini App.',
          plan: lic.plan,
          expires_at: lic.expires_at,
        },
        { headers: corsHeaders() },
      );
    }

    await sql`UPDATE licenses SET last_check_at = ${now.toISOString()} WHERE id = ${lic.id}`;

    const forever = !lic.expires_at;
    const daysLeft = forever
      ? 36500
      : Math.max(0, Math.ceil((new Date(lic.expires_at).getTime() - now.getTime()) / (24 * 60 * 60 * 1000)));

    return NextResponse.json(
      {
        valid: true,
        plan: lic.plan,
        forever,
        started_at: lic.started_at,
        expires_at: lic.expires_at,
        days_left: daysLeft,
        device_id: deviceId,
        message: forever
          ? 'License hợp lệ · Vĩnh Viễn'
          : daysLeft <= 7
            ? `License còn ${daysLeft} ngày. Hãy gia hạn trên Zalo Mini App.`
            : 'License hợp lệ',
      },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json(
      { valid: false, message: 'Lỗi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
