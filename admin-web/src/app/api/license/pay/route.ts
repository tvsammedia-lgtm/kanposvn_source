import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { getPlan } from '@/lib/pricing';
import { ensureDefaultBranch } from '@/lib/default_branch';

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
  const sql = getSql();
  try {
    const { order_code } = await req.json();
    if (!order_code) {
      return NextResponse.json(
        { error: 'Thiếu order_code' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const orderRows = await sql`SELECT * FROM orders WHERE order_code = ${order_code}`;
    if (orderRows.length === 0) {
      return NextResponse.json(
        { error: 'Đơn hàng không tồn tại' },
        { status: 404, headers: corsHeaders() },
      );
    }
    const order = orderRows[0];

    if (order.status === 'paid') {
      return NextResponse.json(
        { success: true, message: 'Đơn hàng đã được thanh toán trước đó', order },
        { headers: corsHeaders() },
      );
    }
    if (order.status !== 'pending') {
      return NextResponse.json(
        { error: `Trạng thái đơn hàng không hợp lệ: ${order.status}` },
        { status: 400, headers: corsHeaders() },
      );
    }

    const planInfo = getPlan(order.plan);
    const now = new Date();
    const paidAt = now.toISOString();

    await sql`
      UPDATE orders SET status = 'paid', paid_at = ${paidAt} WHERE id = ${order.id}
    `;

    const licRows = await sql`
      SELECT * FROM licenses WHERE user_id = ${order.user_id} AND app_code = ${order.app_code}
    `;
    const days = planInfo.days;
    const newExpiry: string | null = planInfo.forever
      ? null
      : (() => {
          const base = licRows.length > 0 && licRows[0].expires_at
            ? new Date(Math.max(new Date(licRows[0].expires_at).getTime(), now.getTime()))
            : now;
          return new Date(base.getTime() + days * 24 * 60 * 60 * 1000).toISOString();
        })();

    let licenseId = '';
    if (licRows.length === 0) {
      // Migration 016: license mới phải gắn branch mặc định "Cửa hàng chính".
      const created = await sql`
        INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at)
        VALUES (${order.user_id}, ${order.app_code}, '', ${planInfo.key}, 'active', ${now.toISOString()}, ${newExpiry})
        RETURNING id
      `;
      licenseId = created[0]?.id ?? '';
    } else {
      await sql`
        UPDATE licenses SET plan = ${planInfo.key}, status = 'active', expires_at = ${newExpiry}, started_at = ${licRows[0].started_at}
        WHERE id = ${licRows[0].id}
      `;
      if (!licRows[0].branch_id) licenseId = String(licRows[0].id);
    }

    if (licenseId) {
      await ensureDefaultBranch(sql, {
        userId: String(order.user_id),
        appCode: String(order.app_code),
        licenseId,
      });
    }

    await sql`
      UPDATE users SET subscription_plan = ${planInfo.key}, subscription_start = ${now.toISOString()}, subscription_end = ${newExpiry}, active = true
      WHERE id = ${order.user_id}
    `;

    const userRows = await sql`SELECT * FROM users WHERE id = ${order.user_id}`;
    const user = userRows[0];

    await sql`
      INSERT INTO audit_logs (user_name, action, module, details)
      VALUES (${user.email}, 'Thanh toán đơn hàng', 'License', ${'Đơn ' + order.order_code + ' | gói ' + planInfo.key + ' | ' + planInfo.price + ' VND'})
    `;

    return NextResponse.json(
      {
        success: true,
        message: 'Thanh toán thành công! Gói đã được kích hoạt.',
        order_code: order.order_code,
        plan: planInfo.key,
        forever: planInfo.forever || false,
        days_added: days,
        expires_at: newExpiry,
        subscription_end: newExpiry,
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
