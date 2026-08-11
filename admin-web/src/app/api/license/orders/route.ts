import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { getPlan } from '@/lib/pricing';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

function getAdmin(req: NextRequest) {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try {
    return verifyToken(auth.split(' ')[1]);
  } catch {
    return null;
  }
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

// GET (admin): danh sách đơn hàng. Lọc theo ?status=pending|paid|all (mặc định pending).
export async function GET(req: NextRequest) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const status = req.nextUrl.searchParams.get('status') || 'pending';
  const rows =
    status === 'all'
      ? await sql`
          SELECT o.*, u.phone, u.full_name
          FROM orders o
          LEFT JOIN users u ON u.id = o.user_id
          ORDER BY o.created_at DESC
        `
      : await sql`
          SELECT o.*, u.phone, u.full_name
          FROM orders o
          LEFT JOIN users u ON u.id = o.user_id
          WHERE o.status = ${status}
          ORDER BY o.created_at DESC
        `;
  return NextResponse.json(rows, { headers: corsHeaders() });
}

// POST (admin): xác nhận đã nhận tiền chuyển khoản -> đơn paid + kích hoạt license.
// Body: { order_code, confirm_note }
export async function POST(req: NextRequest) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const { order_code, confirm_note } = await req.json();
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
      { success: true, message: 'Đơn hàng đã được xác nhận trước đó', order },
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
    UPDATE orders
    SET status = 'paid', paid_at = ${paidAt}, confirm_note = ${confirm_note || ''}
    WHERE id = ${order.id}
  `;

  // Kích hoạt license (giống luồng /api/license/pay)
  const licRows = await sql`
    SELECT * FROM licenses WHERE user_id = ${order.user_id} AND app_code = ${order.app_code}
  `;
  const days = planInfo.days;
  const newExpiry: string | null = planInfo.forever
    ? null
    : (() => {
        const base =
          licRows.length > 0 && licRows[0].expires_at
            ? new Date(
                Math.max(
                  new Date(licRows[0].expires_at).getTime(),
                  now.getTime(),
                ),
              )
            : now;
        return new Date(base.getTime() + days * 24 * 60 * 60 * 1000).toISOString();
      })();

  if (licRows.length === 0) {
    await sql`
      INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at)
      VALUES (${order.user_id}, ${order.app_code}, '', ${planInfo.key}, 'active', ${now.toISOString()}, ${newExpiry})
    `;
  } else {
    await sql`
      UPDATE licenses SET plan = ${planInfo.key}, status = 'active', expires_at = ${newExpiry}, started_at = ${licRows[0].started_at}
      WHERE id = ${licRows[0].id}
    `;
  }

  await sql`
    UPDATE users SET subscription_plan = ${planInfo.key}, subscription_start = ${now.toISOString()}, subscription_end = ${newExpiry}, active = true
    WHERE id = ${order.user_id}
  `;

  const userRows = await sql`SELECT * FROM users WHERE id = ${order.user_id}`;
  const user = userRows[0];

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${user.email}, 'Xác nhận chuyển khoản', 'License', ${'Đơn ' + order.order_code + ' | gói ' + planInfo.key + ' | ' + planInfo.price + ' VND'})
  `;

  return NextResponse.json(
    {
      success: true,
      message: 'Đã xác nhận chuyển khoản và kích hoạt gói.',
      order_code: order.order_code,
      plan: planInfo.key,
      forever: planInfo.forever || false,
      expires_at: newExpiry,
    },
    { headers: corsHeaders() },
  );
}
