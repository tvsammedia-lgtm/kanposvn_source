import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { ZALOPAY_CONFIG, sign } from '@/lib/zalopay';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

// GET /api/payment/query?order_code=xxx
export async function GET(req: NextRequest) {
  const sql = getSql();
  try {
    const orderCode = req.nextUrl.searchParams.get('order_code');
    if (!orderCode) {
      return NextResponse.json({ error: 'Thieu order_code' }, { status: 400, headers: corsHeaders() });
    }

    // 1. Tim order
    const orderRows = await sql`
      SELECT id, order_code, user_id, app_code, plan, amount, status, paid_at, zalo_trans_id, zalopay_app_trans_id
      FROM orders
      WHERE order_code = ${orderCode}
      LIMIT 1
    `;

    if (orderRows.length === 0) {
      return NextResponse.json({ error: 'Khong tim thay don hang' }, { status: 404, headers: corsHeaders() });
    }

    const order = orderRows[0];

    // 2. Neu da thanh toan, tra ve ngay
    if (order.status === 'paid') {
      const licRows = await sql`
        SELECT plan, status, started_at, expires_at
        FROM licenses
        WHERE user_id = ${order.user_id} AND app_code = ${order.app_code} AND device_id = ''
        ORDER BY started_at DESC LIMIT 1
      `;
      return NextResponse.json(
        {
          success: true,
          order_code: order.order_code,
          status: 'paid',
          paid_at: order.paid_at,
          zalo_trans_id: order.zalo_trans_id,
          license: licRows[0] || null,
        },
        { headers: corsHeaders() },
      );
    }

    // 3. Chua thanh toan -> query ZaloPay
    if (order.zalopay_app_trans_id) {
      const appTransId = order.zalopay_app_trans_id;
      const reqDate = Date.now();
      const data = `${ZALOPAY_CONFIG.app_id}|${appTransId}|${reqDate}`;
      const mac = sign(data, ZALOPAY_CONFIG.key1);

      try {
        const queryUrl = `${ZALOPAY_CONFIG.query_endpoint}?app_id=${ZALOPAY_CONFIG.app_id}&app_trans_id=${appTransId}&req_time=${reqDate}&mac=${mac}`;
        const zalopayRes = await fetch(queryUrl);
        const zalopayData = await zalopayRes.json();

        if (zalopayData.return_code === 1) {
          // ZaloPay xac nhan da thanh toan -> cap nhat DB
          await sql`UPDATE orders SET status = 'paid', paid_at = NOW(), zalo_trans_id = ${String(zalopayData.zp_trans_id || '')} WHERE id = ${order.id}`;

          // Kich hoat license (giong nhu callback)
          const now = new Date();
          const expiresAt = new Date(now.getTime() + 365 * 24 * 60 * 60 * 1000);
          const existingLicense = await sql`
            SELECT id, plan, status, expires_at
            FROM licenses
            WHERE user_id = ${order.user_id} AND app_code = ${order.app_code} AND device_id = ''
            ORDER BY started_at DESC LIMIT 1
          `;
          if (existingLicense.length > 0) {
            const lic = existingLicense[0];
            if (lic.plan === 'trial' && lic.expires_at) {
              const remaining = new Date(lic.expires_at).getTime() - now.getTime();
              if (remaining > 0) expiresAt.setTime(expiresAt.getTime() + remaining);
            }
            await sql`
              UPDATE licenses
              SET plan = ${order.plan}, status = 'active', started_at = ${now.toISOString()}, expires_at = ${expiresAt.toISOString()}
              WHERE id = ${lic.id}
            `;
          } else {
            await sql`
              INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at, branch_id)
              VALUES (${order.user_id}, ${order.app_code}, '', ${order.plan}, 'active', ${now.toISOString()}, ${expiresAt.toISOString()}, ${order.branch_id || null})
            `;
          }
          await sql`UPDATE users SET active = true WHERE id = ${order.user_id}`;

          return NextResponse.json(
            { success: true, order_code: order.order_code, status: 'paid', zalo_trans_id: zalopayData.zp_trans_id },
            { headers: corsHeaders() },
          );
        }

        return NextResponse.json(
          {
            success: false,
            order_code: order.order_code,
            status: order.status,
            zalopay_status: zalopayData.return_code,
            zalopay_message: zalopayData.sub_return_message,
          },
          { headers: corsHeaders() },
        );
      } catch (qErr) {
        return NextResponse.json(
          { success: false, order_code: order.order_code, status: order.status, error: 'Query ZaloPay that bai: ' + String(qErr) },
          { headers: corsHeaders() },
        );
      }
    }

    // 4. Chua co zalopay_app_trans_id
    return NextResponse.json(
      { success: false, order_code: order.order_code, status: order.status, message: 'Chua co giao dich ZaloPay' },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json(
      { error: 'Loi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
