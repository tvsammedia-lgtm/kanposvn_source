import { NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

export async function GET(request: Request) {
  try {
    const { searchParams } = new URL(request.url);
    const app_code = searchParams.get('app_code');
    const branch_id = searchParams.get('branch_id');
    const updated_after = searchParams.get('updated_after'); // ISO String

    if (!app_code || !branch_id) {
      return NextResponse.json({ error: 'MISSING_CREDENTIALS' }, { status: 400 });
    }

    const sql = getSql();

    let orders;
    if (updated_after) {
      orders = await sql`
        SELECT o.*, d.code AS table_code, d.name AS table_name, d.qr_token AS table_qr_token
        FROM orders o
        LEFT JOIN dining_tables d ON d.id = o.table_id
        WHERE o.app_code = ${app_code} 
          AND o.branch_id = ${branch_id} 
          AND o.updated_at >= ${updated_after}
        ORDER BY o.updated_at ASC
      `;
    } else {
      orders = await sql`
        SELECT o.*, d.code AS table_code, d.name AS table_name, d.qr_token AS table_qr_token
        FROM orders o
        LEFT JOIN dining_tables d ON d.id = o.table_id
        WHERE o.app_code = ${app_code} 
          AND o.branch_id = ${branch_id} 
          AND o.status IN ('NEW', 'CONFIRMED', 'PREPARING', 'READY', 'SERVED')
        ORDER BY o.created_at DESC
        LIMIT 100
      `;
    }

    if (orders.length === 0) {
      return NextResponse.json({ orders: [] });
    }

    const orderIds = orders.map(o => o.id);
    const orderItems = await sql`
      SELECT * FROM order_items 
      WHERE order_id = ANY(${orderIds})
    `;

    // Group items by order
    const result = orders.map(order => ({
      ...order,
      items: orderItems.filter(item => item.order_id === order.id)
    }));

    return NextResponse.json({ orders: result });

  } catch (error: any) {
    console.error('Error syncing orders:', error);
    return NextResponse.json({ error: 'SERVER_ERROR' }, { status: 500 });
  }
}
