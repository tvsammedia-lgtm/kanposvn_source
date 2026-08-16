import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

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

// Hồ sơ OWNER CLOUD USER của một app_code (POS gọi để in tiêu đề bill/báo cáo "Họ tên - SĐT").
// GET /api/owner/info?app_code=kanvlxd_one
// Trả về: { full_name, name, phone, email, shop_name, shop_address, app_code }
export async function GET(req: NextRequest) {
  const sql = getSql();
  try {
    const appCode = req.nextUrl.searchParams.get('app_code') || '';
    if (!appCode) {
      return NextResponse.json(
        { error: 'Thiếu app_code' },
        { status: 400, headers: corsHeaders() },
      );
    }

    // Owner = user sở hữu license của app_code (ưu tiên license active, mới nhất).
    const [ownerLic] = await sql`
      SELECT user_id FROM licenses
      WHERE app_code = ${appCode}
      ORDER BY CASE WHEN status = 'active' THEN 0 ELSE 1 END, started_at DESC
      LIMIT 1
    `;

    if (!ownerLic?.user_id) {
      return NextResponse.json(
        { error: `Không tìm thấy owner cho app ${appCode}` },
        { status: 404, headers: corsHeaders() },
      );
    }

    const [user] = await sql`
      SELECT id, email, phone, full_name, shop_name, shop_address, active
      FROM users WHERE id = ${ownerLic.user_id}
    `;

    if (!user) {
      return NextResponse.json(
        { error: 'Không tìm thấy tài khoản owner' },
        { status: 404, headers: corsHeaders() },
      );
    }

    // Tên cửa hàng đăng ký qua Web / Zalo Mini App (nếu có).
    const [store] = await sql`
      SELECT name, phone FROM stores WHERE owner_user_id = ${user.id} LIMIT 1
    `;

    const fullName = user.full_name || '';
    const shopName = user.shop_name || store?.name || '';

    return NextResponse.json(
      {
        full_name: fullName,
        name: fullName,
        phone: user.phone || '',
        email: user.email || '',
        shop_name: shopName,
        shop_address: user.shop_address || '',
        app_code: appCode,
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
