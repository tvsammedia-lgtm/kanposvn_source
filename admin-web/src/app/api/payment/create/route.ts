import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { ZALOPAY_CONFIG, newPaymentOrderCode, newAppTransId, createOrderSignature } from '@/lib/zalopay';

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

// POST /api/payment/create
// Body: { user_id, app_code, branch_id, plan, amount, zalo_id? }
export async function POST(req: NextRequest) {
  const sql = getSql();
  try {
    const body = await req.json();
    const { user_id, app_code, branch_id, plan, amount, zalo_id } = body;

    if (!user_id || !app_code || !plan || !amount) {
      return NextResponse.json(
        { error: 'Thieu thong tin bat buoc: user_id, app_code, plan, amount' },
        { status: 400, headers: corsHeaders() },
      );
    }

    // 1. Kiem tra user ton tai
    const userRows = await sql`SELECT id, email, full_name, phone, zalo_id FROM users WHERE id = ${user_id}`;
    if (userRows.length === 0) {
      return NextResponse.json({ error: 'Khong tim thay tai khoan' }, { status: 404, headers: corsHeaders() });
    }
    const user = userRows[0];

    // 2. Kiem tra app ton tai
    const appRows = await sql`SELECT id, app_name, price FROM apps WHERE app_code = ${app_code}`;
    if (appRows.length === 0) {
      return NextResponse.json({ error: 'Khong tim thay app' }, { status: 404, headers: corsHeaders() });
    }
    const app = appRows[0];

    // 3. Kiem tra gia tien (app.price override hoac tu amount gui len)
    const expectedAmount = app.price || amount;
    if (Math.abs(expectedAmount - amount) > 1000) {
      return NextResponse.json(
        { error: `So tien khong khop. Du kien: ${expectedAmount}d, Gui len: ${amount}d` },
        { status: 400, headers: corsHeaders() },
      );
    }

    // 4. Tao order
    const orderCode = newPaymentOrderCode();
    const appTransId = newAppTransId(orderCode);
    const appTime = Date.now();
    const userPhone = user.phone || user.email || String(user.zalo_id || user.id);
    const callbackUrl = `${process.env.NEXT_PUBLIC_BASE_URL || 'https://kanposvn-admin.vercel.app'}/api/payment/callback`;

    const [order] = await sql`
      INSERT INTO orders (order_code, user_id, zalo_id, app_code, plan, amount, currency, status, payment_method, provider, callback_url, branch_id)
      VALUES (${orderCode}, ${user_id}, ${zalo_id || user.zalo_id || ''}, ${app_code}, ${plan}, ${amount}, 'VND', 'pending', 'zalo_miniapp', 'zalopay', ${callbackUrl}, ${branch_id || null})
      RETURNING *
    `;

    // 5. Goi ZaloPay CreateOrder API
    const embedData = JSON.stringify({ order_code: orderCode, user_id, app_code, branch_id: branch_id || null });
    const item = JSON.stringify([{ app_code, plan, amount }]);
    const description = `KanPOS - ${app.app_name || app_code} - ${plan}`;
    const signature = createOrderSignature({
      app_id: ZALOPAY_CONFIG.app_id,
      app_user: userPhone,
      app_time: appTime,
      amount: amount,
      app_trans_id: appTransId,
      embed_data: embedData,
      item: item,
    });

    const zalopayBody = {
      app_id: ZALOPAY_CONFIG.app_id,
      app_user: userPhone,
      app_time: appTime,
      amount: amount,
      app_trans_id: appTransId,
      embed_data: embedData,
      item: item,
      description: description,
      bank_code: '',
      callback_url: callbackUrl,
      device_info: 'zalo-miniapp',
      mac: signature,
    };

    const zalopayRes = await fetch(ZALOPAY_CONFIG.endpoint, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(zalopayBody),
    });
    const zalopayData = await zalopayRes.json();

    // 6. Neu ZaloPay tra ve order_url, dieu huong khach thanh toan
    if (zalopayData.order_url) {
      // Cap nhat order voi app_trans_id
      await sql`UPDATE orders SET zalopay_app_trans_id = ${appTransId} WHERE id = ${order.id}`;

      return NextResponse.json(
        {
          success: true,
          order_code: orderCode,
          order_id: order.id,
          amount: amount,
          order_url: zalopayData.order_url,
          app_trans_id: appTransId,
          qr_code: zalopayData.qr_code || null,
        },
        { headers: corsHeaders() },
      );
    }

    // 7. Neu ZaloPay tra ve loi
    return NextResponse.json(
      {
        success: false,
        error: 'ZaloPay tu choi thanh toan',
        zalopay_response: zalopayData,
        order_code: orderCode,
      },
      { status: 400, headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json(
      { error: 'Loi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
