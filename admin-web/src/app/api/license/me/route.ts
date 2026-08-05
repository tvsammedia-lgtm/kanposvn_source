import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

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
    let user = null;

    if (auth?.startsWith('Bearer ')) {
      try {
        const payload = verifyToken(auth.split(' ')[1]) as { id: string };
        const rows = await sql`SELECT * FROM users WHERE id = ${payload.id}`;
        if (rows.length > 0) user = rows[0];
      } catch {
        /* fallthrough */
      }
    }
    if (!user) {
      const zaloId = req.nextUrl.searchParams.get('zalo_id');
      const phone = req.nextUrl.searchParams.get('phone');
      const email = req.nextUrl.searchParams.get('email');
      if (zaloId) {
        const rows = await sql`SELECT * FROM users WHERE zalo_id = ${zaloId}`;
        if (rows.length > 0) user = rows[0];
      }
      if (!user && phone) {
        const rows = await sql`SELECT * FROM users WHERE phone = ${phone}`;
        if (rows.length > 0) user = rows[0];
      }
      if (!user && email) {
        const rows = await sql`SELECT * FROM users WHERE email = ${email}`;
        if (rows.length > 0) user = rows[0];
      }
    }
    if (!user) {
      return NextResponse.json(
        { error: 'Không tìm thấy tài khoản' },
        { status: 404, headers: corsHeaders() },
      );
    }

    const [licenses, orders] = await Promise.all([
      sql`SELECT * FROM licenses WHERE user_id = ${user.id} ORDER BY created_at DESC`,
      sql`SELECT order_code, app_code, plan, amount, status, created_at, paid_at FROM orders WHERE user_id = ${user.id} ORDER BY created_at DESC LIMIT 10`,
    ]);

    const now = new Date();
    const licensesWithStatus = licenses.map((lic: { [k: string]: unknown }) => {
      const expired = lic.expires_at && new Date(lic.expires_at as string) < now;
      const daysLeft = lic.expires_at
        ? Math.max(0, Math.ceil((new Date(lic.expires_at as string).getTime() - now.getTime()) / (24 * 60 * 60 * 1000)))
        : 36500;
      return {
        app_code: lic.app_code,
        plan: lic.plan,
        status: expired ? 'expired' : lic.status,
        started_at: lic.started_at,
        expires_at: lic.expires_at,
        days_left: daysLeft,
        device_id: lic.device_id,
      };
    });

    return NextResponse.json(
      {
        success: true,
        user: {
          id: user.id,
          email: user.email,
          full_name: user.full_name || '',
          phone: user.phone || '',
          shop_name: user.shop_name || '',
          shop_address: user.shop_address || '',
          subscription_plan: user.subscription_plan || '',
          subscription_start: user.subscription_start || null,
          subscription_end: user.subscription_end || null,
          zalo_id: user.zalo_id || '',
          created_at: user.created_at,
        },
        licenses: licensesWithStatus,
        orders,
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
