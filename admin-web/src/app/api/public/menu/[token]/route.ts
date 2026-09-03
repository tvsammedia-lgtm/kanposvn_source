import { NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

export async function GET(
  request: Request,
  { params }: { params: { token: string } }
) {
  try {
    const token = params.token;
    const sql = getSql();

    // Verify token first to get branch
    const tables = await sql`
      SELECT app_code, branch_id, active 
      FROM dining_tables 
      WHERE qr_token = ${token} 
      LIMIT 1
    `;

    if (tables.length === 0 || !tables[0].active) {
      return NextResponse.json({ error: 'Invalid or inactive QR' }, { status: 403 });
    }

    const { app_code, branch_id } = tables[0];

    // Fetch categories
    const categories = await sql`
      SELECT id, name, sort_order
      FROM menu_categories
      WHERE app_code = ${app_code} AND branch_id = ${branch_id} AND active = true
      ORDER BY sort_order ASC
    `;

    // Fetch menu items
    const items = await sql`
      SELECT id, category_id, code, name, description, image_url, price, allow_qr_order, kitchen_station, sort_order
      FROM menu_items
      WHERE app_code = ${app_code} AND branch_id = ${branch_id} AND active = true AND allow_qr_order = true
      ORDER BY sort_order ASC
    `;

    return NextResponse.json({
      categories,
      items
    });

  } catch (error: any) {
    console.error('Error fetching menu:', error);
    return NextResponse.json({ error: 'SERVER_ERROR' }, { status: 500 });
  }
}
