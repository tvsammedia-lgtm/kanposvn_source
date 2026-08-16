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
// GET /api/owner/info?app_code=kanposvncafe&branch_id=<id>   (mô hình 1 module = nhiều chi nhánh)
// Trả về: { full_name, name, phone, email, shop_name, shop_address, app_code }
export async function GET(req: NextRequest) {
  const sql = getSql();
  try {
    const appCode = req.nextUrl.searchParams.get('app_code') || '';
    const branchId = req.nextUrl.searchParams.get('branch_id') || '';
    if (!appCode) {
      return NextResponse.json(
        { error: 'Thiếu app_code' },
        { status: 400, headers: corsHeaders() },
      );
    }

    // Mô hình chi nhánh (customers → branches): nếu app_code thuộc một chi nhánh
    // thì tên cửa hàng HIỂN THỊ trên POS là branch.name (KHÔNG phải user.full_name).
    // Khi có branch_id thì trả đúng chi nhánh đó (1 module có thể có nhiều chi nhánh);
    // không có branch_id thì dùng app_code (trả chi nhánh đầu tiên — tương thích ngược).
    // Bọc try/catch để khi chưa chạy migration (bảng chưa tồn tại) vẫn rơi về logic cũ.
    let branch: any = null;
    try {
      const branchRows = branchId
        ? await sql`
          SELECT b.*, c.name AS customer_name, c.owner_user_id
          FROM branches b
          JOIN customers c ON c.id = b.customer_id
          WHERE b.id = ${branchId} AND b.app_code = ${appCode}
          LIMIT 1
        `
        : await sql`
          SELECT b.*, c.name AS customer_name, c.owner_user_id
          FROM branches b
          JOIN customers c ON c.id = b.customer_id
          WHERE b.app_code = ${appCode}
          ORDER BY b.is_default DESC, b.created_at ASC
          LIMIT 1
        `;
      branch = branchRows[0] ?? null;
    } catch {
      branch = null;
    }

    if (branch) {
      const [user] = await sql`
        SELECT id, email, phone, full_name, shop_name, shop_address, active
        FROM users WHERE id = ${branch.owner_user_id}
      `;
      if (!user) {
        return NextResponse.json(
          { error: 'Không tìm thấy tài khoản owner' },
          { status: 404, headers: corsHeaders() },
        );
      }
      const fullName = user.full_name || branch.customer_name || '';
      const branchName = branch.name || user.shop_name || branch.customer_name || '';
      return NextResponse.json(
        {
          full_name: fullName,
          name: fullName,
          phone: branch.phone || user.phone || '',
          email: user.email || '',
          shop_name: branchName,
          shop_address: branch.address || user.shop_address || '',
          branch_code: branch.branch_code || '',
          branch_id: branch.id,
          is_default: branch.is_default === true,
          customer_name: branch.customer_name || '',
          app_code: appCode,
        },
        { headers: corsHeaders() },
      );
    }

    // Owner = user có quyền dùng app_code này. Ưu tiên:
    //   1. user sở hữu license của app_code (active, mới nhất);
    //   2. chủ store (stores.owner_user_id) nếu app_code đang dùng gói chung ('pos');
    //   3. bất kỳ user có permission cho app_code (mới nhất theo license).
    const ownerLicRows = await sql`
      SELECT user_id FROM licenses
      WHERE app_code = ${appCode}
      ORDER BY CASE WHEN status = 'active' THEN 0 ELSE 1 END, started_at DESC
      LIMIT 1
    `;

    let ownerId: string | null = ownerLicRows[0]?.user_id ?? null;

    if (!ownerId) {
      const storeRows = await sql`
        SELECT u.id FROM user_permissions p
        JOIN apps a ON a.id = p.app_id
        JOIN users u ON u.id = p.user_id
        JOIN stores s ON s.owner_user_id = u.id
        WHERE a.app_code = ${appCode} AND p.can_login = true
        LIMIT 1
      `;
      ownerId = storeRows[0]?.id ?? null;
    }

    if (!ownerId) {
      const permRows = await sql`
        SELECT u.id FROM user_permissions p
        JOIN apps a ON a.id = p.app_id
        JOIN users u ON u.id = p.user_id
        LEFT JOIN licenses l ON l.user_id = u.id
        WHERE a.app_code = ${appCode} AND p.can_login = true
        ORDER BY l.started_at DESC
        LIMIT 1
      `;
      ownerId = permRows[0]?.id ?? null;
    }

    if (!ownerId) {
      return NextResponse.json(
        { error: `Không tìm thấy owner cho app ${appCode}` },
        { status: 404, headers: corsHeaders() },
      );
    }

    const [user] = await sql`
      SELECT id, email, phone, full_name, shop_name, shop_address, active
      FROM users WHERE id = ${ownerId}
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
