import { NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { qr_token, items, customer_note, idempotency_key, customer_name } = body;

    if (!qr_token || !items || !Array.isArray(items) || items.length === 0) {
      return NextResponse.json({ error: 'INVALID_REQUEST' }, { status: 400 });
    }

    const sql = getSql();

    // 1. Validate QR & get table
    const tables = await sql`
      SELECT id, app_code, branch_id, active 
      FROM dining_tables 
      WHERE qr_token = ${qr_token} 
      LIMIT 1
    `;

    if (tables.length === 0 || !tables[0].active) {
      return NextResponse.json({ error: 'INVALID_OR_DISABLED_QR' }, { status: 403 });
    }
    const table = tables[0];

    // 2. Idempotency Check
    if (idempotency_key) {
      const existing = await sql`
        SELECT id, order_no, status, total 
        FROM qr_orders 
        WHERE idempotency_key = ${idempotency_key} 
        LIMIT 1
      `;
      if (existing.length > 0) {
        return NextResponse.json({
          success: true,
          order_id: existing[0].id,
          order_no: existing[0].order_no,
          status: existing[0].status,
          total: Number(existing[0].total),
          message: 'DUPLICATED_REQUEST_HANDLED'
        });
      }
    }

    // 3. Get Menu Items to calculate correct prices
    const itemIds = items.map((i: any) => i.menu_item_id);
    const dbItems = await sql`
      SELECT id, name, price, kitchen_station, allow_qr_order 
      FROM menu_items 
      WHERE id = ANY(${itemIds}) AND active = true
    `;

    let subtotal = 0;
    const orderItemsToInsert = [];

    for (const item of items) {
      const dbItem = dbItems.find(di => di.id === item.menu_item_id);
      if (!dbItem || !dbItem.allow_qr_order) {
        continue; // Skip invalid items
      }
      const qty = Number(item.quantity) || 1;
      const itemSubtotal = Number(dbItem.price) * qty;
      subtotal += itemSubtotal;

      orderItemsToInsert.push({
        menu_item_id: dbItem.id,
        item_name_snapshot: dbItem.name,
        unit_price_snapshot: dbItem.price,
        quantity: qty,
        subtotal: itemSubtotal,
        note: item.note || '',
        kitchen_station: dbItem.kitchen_station
      });
    }

    if (orderItemsToInsert.length === 0) {
      return NextResponse.json({ error: 'NO_VALID_ITEMS' }, { status: 400 });
    }

    // Handle Table Session (create if none open)
    let sessionId = null;
    const sessions = await sql`
      SELECT id FROM table_sessions 
      WHERE table_id = ${table.id} AND status = 'OPEN' 
      LIMIT 1
    `;
    if (sessions.length > 0) {
      sessionId = sessions[0].id;
    } else {
      const sessionCode = 'SES-' + Date.now().toString() + '-' + Math.floor(Math.random()*1000).toString();
      const newSession = await sql`
        INSERT INTO table_sessions (app_code, branch_id, table_id, session_code)
        VALUES (${table.app_code}, ${table.branch_id}, ${table.id}, ${sessionCode})
        RETURNING id
      `;
      sessionId = newSession[0].id;
    }

    // 4. Generate Order No & Insert Order
    const orderNo = 'QR-' + Date.now().toString().slice(-6);
    const total = subtotal; // Assuming no tax/discount applied on QR by default

    // We do transaction-like inserts by inserting order then items
    const newOrder = await sql`
      INSERT INTO qr_orders (
        app_code, branch_id, table_id, session_id, order_no, 
        source, status, subtotal, total, customer_note, customer_name, idempotency_key
      )
      VALUES (
        ${table.app_code}, ${table.branch_id}, ${table.id}, ${sessionId}, ${orderNo},
        'QR', 'NEW', ${subtotal}, ${total}, ${customer_note || null}, ${customer_name || null}, ${idempotency_key || null}
      )
      RETURNING id, order_no, status, total
    `;
    const orderId = newOrder[0].id;

    // Insert Order Items
    for (const oi of orderItemsToInsert) {
      await sql`
        INSERT INTO qr_order_items (
          order_id, menu_item_id, item_name_snapshot, unit_price_snapshot, 
          quantity, subtotal, note, kitchen_station
        ) VALUES (
          ${orderId}, ${oi.menu_item_id}, ${oi.item_name_snapshot}, ${oi.unit_price_snapshot},
          ${oi.quantity}, ${oi.subtotal}, ${oi.note}, ${oi.kitchen_station}
        )
      `;
    }

    return NextResponse.json({
      success: true,
      order_id: orderId,
      order_no: newOrder[0].order_no,
      status: newOrder[0].status,
      total: Number(newOrder[0].total)
    });

  } catch (error: any) {
    console.error('Error creating order:', error);
    return NextResponse.json({ error: 'SERVER_ERROR' }, { status: 500 });
  }
}
