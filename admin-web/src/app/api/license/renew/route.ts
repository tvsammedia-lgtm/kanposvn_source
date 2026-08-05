import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { getPlan, newOrderCode } from '@/lib/pricing';

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

async function resolveUser(sql: ReturnType<typeof getSql>, req: NextRequest, body: Record<string, string>) {
  const auth = req.headers.get('authorization');
  if (auth?.startsWith('Bearer ')) {
    try {
      const payload = verifyToken(auth.split(' ')[1]) as { id: string };
      const rows = await sql`SELECT * FROM users WHERE id = ${payload.id}`;
      if (rows.length > 0) return rows[0];
    } catch {
      /* fallthrough */
    }
  }
  for (const key of ['zalo_id', 'phone', 'email']) {
    if (body[key]) {
      const rows = await sql`SELECT * FROM users WHERE ${key} = ${body[key]}`;
      if (rows.length > 0) return rows[0];
    }
  }
  return null;
}

export async function POST(req: NextRequest) {
  const sql = getSql();
  try {
    const body = await req.json();
    const { app_code, plan } = body;
    const appCode = (app_code || 'kanposvncafe') as string;
    const planInfo = getPlan(plan || 'monthly');

    const user = await resolveUser(sql, req, body);
    if (!user) {
      return NextResponse.json(
        { error: 'Không tìm thấy tài khoản' },
        { status: 401, headers: corsHeaders() },
      );
    }

    const now = new Date();
    const orderCode = newOrderCode();
    await sql`
      INSERT INTO orders (order_code, user_id, zalo_id, app_code, plan, amount, currency, status, payment_method, paid_at, description)
      VALUES (${orderCode}, ${user.id}, ${user.zalo_id || ''}, ${appCode}, ${planInfo.key}, ${planInfo.price}, 'VND', 'paid', 'zalo_miniapp', ${now.toISOString()}, ${`Gia hạn gói ${planInfo.label}`})
    `;

    const licRows = await sql`
      SELECT * FROM licenses WHERE user_id = ${user.id} AND app_code = ${appCode}
    `;
    const days = planInfo.days;
    const base = licRows.length > 0 && licRows[0].expires_at
      ? new Date(Math.max(new Date(licRows[0].expires_at).getTime(), now.getTime()))
      : now;
    const newExpiry = new Date(base.getTime() + days * 24 * 60 * 60 * 1000);

    if (licRows.length === 0) {
      await sql`
        INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at)
        VALUES (${user.id}, ${appCode}, '', ${planInfo.key}, 'active', ${now.toISOString()}, ${newExpiry.toISOString()})
      `;
    } else {
      await sql`
        UPDATE licenses SET plan = ${planInfo.key}, status = 'active', expires_at = ${newExpiry.toISOString()}
        WHERE id = ${licRows[0].id}
      `;
    }

    await sql`
      UPDATE users SET subscription_plan = ${planInfo.key}, subscription_start = ${now.toISOString()}, subscription_end = ${newExpiry.toISOString()}
      WHERE id = ${user.id}
    `;

    await sql`
      INSERT INTO audit_logs (user_name, action, module, details)
      VALUES (${user.email}, 'Gia hạn gói', 'License', ${'Đơn ' + orderCode + ' | gói ' + planInfo.key})
    `;

    return NextResponse.json(
      {
        success: true,
        message: 'Gia hạn thành công!',
        order_code: orderCode,
        plan: planInfo.key,
        days_added: days,
        amount: planInfo.price,
        expires_at: newExpiry.toISOString(),
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
