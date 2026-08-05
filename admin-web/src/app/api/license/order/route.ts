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
  if (body.zalo_id) {
    const rows = await sql`SELECT * FROM users WHERE zalo_id = ${body.zalo_id}`;
    if (rows.length > 0) return rows[0];
  }
  if (body.phone) {
    const rows = await sql`SELECT * FROM users WHERE phone = ${body.phone}`;
    if (rows.length > 0) return rows[0];
  }
  if (body.email) {
    const rows = await sql`SELECT * FROM users WHERE email = ${body.email}`;
    if (rows.length > 0) return rows[0];
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
        { error: 'Không tìm thấy tài khoản. Vui lòng đăng ký trước.' },
        { status: 401, headers: corsHeaders() },
      );
    }

    if (planInfo.trial) {
      return NextResponse.json(
        { error: 'Gói dùng thử không cần thanh toán' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const orderCode = newOrderCode();
    const created = await sql`
      INSERT INTO orders (order_code, user_id, zalo_id, app_code, plan, amount, currency, status, payment_method, description)
      VALUES (${orderCode}, ${user.id}, ${user.zalo_id || ''}, ${appCode}, ${planInfo.key}, ${planInfo.price}, 'VND', 'pending', 'zalo_miniapp', ${`Thanh toán gói ${planInfo.label} KanPosVN`})
      RETURNING *
    `;
    const order = created[0];

    return NextResponse.json(
      {
        success: true,
        order_code: order.order_code,
        app_code: appCode,
        plan: planInfo.key,
        plan_label: planInfo.label,
        days: planInfo.days,
        amount: planInfo.price,
        currency: 'VND',
        status: order.status,
        // Mock payment: sau khi co merchant ZaloPay, thay bang du lieu goi CreateOrder cua ZaloPay
        payment: {
          method: 'zalo_miniapp',
          mock: true,
          hint: 'ZaloPay sẽ được tích hợp sau. Hiện tại dùng /api/license/pay để xác nhận đơn.',
        },
        created_at: order.created_at,
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
