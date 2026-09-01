import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyCallbackSignature } from '@/lib/zalopay';

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

// POST /api/payment/callback
// ZaloPay IPN callback - KHONG duoc chi danh vao Flutter success
export async function POST(req: NextRequest) {
  const sql = getSql();
  try {
    const body = await req.json();
    const { app_id, app_trans_id, zp_trans_id, amount, user_fee_amount, callback_count, mac } = body;

    console.log('[ZaloPay Callback] Received:', { app_trans_id, zp_trans_id, amount, callback_count });

    // 1. Verify signature
    if (!verifyCallbackSignature(body, mac)) {
      console.error('[ZaloPay Callback] Invalid MAC signature');
      return NextResponse.json(
        { return_code: -1, return_message: 'Invalid MAC signature' },
        { status: 400, headers: corsHeaders() },
      );
    }

    // 2. Tim order theo app_trans_id
    const orderRows = await sql`
      SELECT id, order_code, user_id, app_code, plan, amount, status, branch_id
      FROM orders
      WHERE zalopay_app_trans_id = ${app_trans_id}
      LIMIT 1
    `;

    if (orderRows.length === 0) {
      console.error('[ZaloPay Callback] Order not found:', app_trans_id);
      return NextResponse.json(
        { return_code: -1, return_message: 'Order not found' },
        { status: 404, headers: corsHeaders() },
      );
    }

    const order = orderRows[0];

    // 3. Kiem tra amount
    if (order.amount !== amount) {
      console.error('[ZaloPay Callback] Amount mismatch:', { order_amount: order.amount, callback_amount: amount });
      return NextResponse.json(
        { return_code: -1, return_message: 'Amount mismatch' },
        { status: 400, headers: corsHeaders() },
      );
    }

    // 4. Kiem tra order chua duoc thanh toan
    if (order.status === 'paid') {
      console.log('[ZaloPay Callback] Order already paid:', order.order_code);
      return NextResponse.json(
        { return_code: 1, return_message: 'Already processed' },
        { headers: corsHeaders() },
      );
    }

    // 5. Xac nhan thanh toan - CAP NHAT ORDER + KICH HOAT LICENSE
    await sql`UPDATE orders SET status = 'paid', paid_at = NOW(), zalo_trans_id = ${String(zp_trans_id || '')} WHERE id = ${order.id}`;

    // 6. Kich hoat license
    const now = new Date();
    const expiresAt = new Date(now.getTime() + 365 * 24 * 60 * 60 * 1000); // 1 nam

    // Neu order theo 1 chi nhanh cu the (branch_id) thi kich hoat dung license cua chi nhanh do.
    const branchScope = order.branch_id
      ? sql`AND branch_id = ${order.branch_id}`
      : sql`AND branch_id IS NULL`;

    // Kiem tra license dang trial cua user + app nay
    const existingLicense = await sql`
      SELECT id, plan, status, expires_at
      FROM licenses
      WHERE user_id = ${order.user_id} AND app_code = ${order.app_code} AND device_id = ''
      ${branchScope}
      ORDER BY started_at DESC LIMIT 1
    `;

    if (existingLicense.length > 0) {
      const lic = existingLicense[0];
      // Neu dang trial, chuyen thanh paid - giu them thoi gian trial con lai
      if (lic.plan === 'trial' && lic.expires_at) {
        const trialEnd = new Date(lic.expires_at);
        const remaining = trialEnd.getTime() - now.getTime();
        if (remaining > 0) {
          // Con thoi gian trial -> paid_end = paid_start + 1 nam + thoi gian con lai trial
          expiresAt.setTime(expiresAt.getTime() + remaining);
        }
      }
      // Cap nhat license
      await sql`
        UPDATE licenses
        SET plan = ${order.plan}, status = 'active', started_at = ${now.toISOString()}, expires_at = ${expiresAt.toISOString()}
        WHERE id = ${lic.id}
      `;
    } else {
      // Chua co license -> tao moi
      await sql`
        INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at, branch_id)
        VALUES (${order.user_id}, ${order.app_code}, '', ${order.plan}, 'active', ${now.toISOString()}, ${expiresAt.toISOString()}, ${order.branch_id || null})
      `;
    }

    // 7. Kich hoat user
    await sql`UPDATE users SET active = true WHERE id = ${order.user_id}`;

    // 8. Dam bao co permission
    const [app] = await sql`SELECT id FROM apps WHERE app_code = ${order.app_code}`;
    if (app) {
      const [adminRole] = await sql`SELECT id FROM roles WHERE role_name = 'Admin'`;
      if (adminRole) {
        await sql`
          INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
          VALUES (${order.user_id}, ${app.id}, ${adminRole.id}, true)
          ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${adminRole.id}, can_login = true
        `;
      }
    }

    console.log('[ZaloPay Callback] Payment confirmed + license activated:', order.order_code);

    return NextResponse.json(
      { return_code: 1, return_message: 'OK' },
      { headers: corsHeaders() },
    );
  } catch (e) {
    console.error('[ZaloPay Callback] Error:', e);
    return NextResponse.json(
      { return_code: -1, return_message: 'Server error: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
