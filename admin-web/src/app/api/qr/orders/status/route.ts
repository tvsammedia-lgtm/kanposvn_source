import { NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

/**
 * Cập nhật trạng thái đơn QR online. POS (đã đăng ký bàn bằng apiKey) đổi
 * trạng thái đơn do khách web gửi lên.
 *
 * Body: { apiKey, app_code, order_id, status }
 * Status hợp lệ (khớp orders.status trong schema QR):
 *   NEW, CONFIRMED, PREPARING, READY, SERVED, PAID, COMPLETED, CANCELLED
 */

const ALLOWED_STATUSES = new Set([
  'NEW',
  'CONFIRMED',
  'PREPARING',
  'READY',
  'SERVED',
  'PAID',
  'COMPLETED',
  'CANCELLED',
]);

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { apiKey, app_code, order_id, status } = body;

    if (!apiKey || apiKey !== process.env.SYNC_API_KEY) {
      return NextResponse.json({ error: 'Invalid API key' }, { status: 403 });
    }
    if (!app_code || !order_id || !status) {
      return NextResponse.json({ error: 'MISSING_CREDENTIALS' }, { status: 400 });
    }
    const s = String(status).trim().toUpperCase();
    if (!ALLOWED_STATUSES.has(s)) {
      return NextResponse.json({ error: 'INVALID_STATUS' }, { status: 400 });
    }

    const sql = getSql();

    const updated = await sql`
      UPDATE orders
      SET status = ${s}, updated_at = NOW()
      WHERE id = ${order_id} AND app_code = ${app_code}
      RETURNING id, status, order_no, table_id
    `;
    if (updated.length === 0) {
      return NextResponse.json({ error: 'ORDER_NOT_FOUND' }, { status: 404 });
    }

    return NextResponse.json({ success: true, order: updated[0] });
  } catch (error: any) {
    console.error('Error updating order status:', error);
    return NextResponse.json({ error: 'SERVER_ERROR' }, { status: 500 });
  }
}