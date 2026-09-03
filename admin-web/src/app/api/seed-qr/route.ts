import { NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

export async function POST(request: Request) {
  try {
    const sql = getSql();

    // Lấy một chi nhánh hiện có
    const branches = await sql`SELECT id, app_code FROM branches LIMIT 1`;
    if (branches.length === 0) {
      return NextResponse.json({ error: 'Không tìm thấy chi nhánh nào để test.' }, { status: 400 });
    }
    const branch = branches[0];
    const token = 'test-token-' + Date.now();

    // 1. Tạo Bàn test
    const tables = await sql`
      INSERT INTO dining_tables (app_code, branch_id, code, name, qr_token)
      VALUES (${branch.app_code}, ${branch.id}, 'TEST01', 'Bàn Test 01', ${token})
      RETURNING id, qr_token
    `;

    // 2. Tạo Category
    const cats = await sql`
      INSERT INTO menu_categories (app_code, branch_id, name)
      VALUES (${branch.app_code}, ${branch.id}, 'Món ăn Test')
      RETURNING id
    `;
    const catId = cats[0].id;

    // 3. Tạo Menu Item
    await sql`
      INSERT INTO menu_items (app_code, branch_id, category_id, name, price, allow_qr_order, kitchen_station)
      VALUES 
        (${branch.app_code}, ${branch.id}, ${catId}, 'Phở Bò Test', 55000, true, 'KITCHEN'),
        (${branch.app_code}, ${branch.id}, ${catId}, 'Cà Phê Sữa Test', 25000, true, 'BAR')
    `;

    return NextResponse.json({
      success: true,
      message: 'Tạo dữ liệu test QR thành công!',
      qr_token: tables[0].qr_token,
      url: `/o/${tables[0].qr_token}`
    });
  } catch (error: any) {
    console.error('Lỗi khi seed data QR:', error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
