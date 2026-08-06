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

const VN_OFFSET_MS = 7 * 60 * 60 * 1000;

function getToken(req: NextRequest) {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try { return verifyToken(auth.split(' ')[1]); } catch { return null; }
}

/// Chuyển timestamp từ dữ liệu điện thoại (Dart toIso8601String không có offset)
/// thành thời điểm thực. Nếu chuỗi không có múi giờ -> coi là giờ VN (+07:00).
function parseTs(value: unknown): number | null {
  if (value == null || value === '') return null;
  const s = String(value);
  let t = Date.parse(s);
  if (Number.isNaN(t)) return null;
  if (!/[zZ]|[+-]\d\d:?\d\d$/.test(s)) {
    t -= VN_OFFSET_MS;
  }
  return t;
}

function parseData(data: unknown): Record<string, any> {
  if (typeof data === 'string') {
    try { return JSON.parse(data); } catch { return {}; }
  }
  if (data && typeof data === 'object') return data as Record<string, any>;
  return {};
}

function fmtVn(d: Date): string {
  const vn = new Date(d.getTime() + VN_OFFSET_MS);
  const hh = String(vn.getUTCHours()).padStart(2, '0');
  const mm = String(vn.getUTCMinutes()).padStart(2, '0');
  return `${hh}:${mm}`;
}

function fmtMoney(v: number): string {
  return Math.round(v).toLocaleString('vi-VN') + ' đ';
}

export async function GET(req: NextRequest) {
  const sql = getSql();
  try {
    const auth = getToken(req);
    if (!auth) {
      return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
    }

    const [store] = await sql`SELECT id, name FROM stores WHERE owner_user_id = ${auth.id}`;
    if (!store) {
      return NextResponse.json({ error: 'Khong tim thay cua hang' }, { status: 404, headers: corsHeaders() });
    }
    const storeId: string = store.id;

    // App chạy thực tế được xác định từ dữ liệu cửa hàng đã đồng bộ (không dựa
    // vào license vì license có thể là 'pos' trong khi app đẩy 'kanposvncafe').
    const appRows = await sql`
      SELECT DISTINCT app_code FROM sync_data WHERE data->>'storeId' = ${storeId}
    `;
    const appCodes: string[] = appRows.map((r) => String(r.app_code));
    const appCode: string = appCodes[0] || 'kanposvncafe';

    const scope = sql`data->>'storeId' = ${storeId}`;

    const ordersRows = await sql`SELECT data FROM sync_data WHERE ${scope} AND collection = 'cafe_orders'`;
    const txRows = await sql`SELECT data FROM sync_data WHERE ${scope} AND collection = 'cafe_cash_transactions'`;
    const customerRows = await sql`SELECT data FROM sync_data WHERE ${scope} AND collection = 'cafe_customers'`;
    const supplierRows = await sql`SELECT data FROM sync_data WHERE ${scope} AND collection = 'cafe_suppliers'`;

    // Hôm nay theo giờ Việt Nam.
    const vnNow = new Date(Date.now() + VN_OFFSET_MS);
    const startOfTodayVn =
      Date.UTC(vnNow.getUTCFullYear(), vnNow.getUTCMonth(), vnNow.getUTCDate()) -
      VN_OFFSET_MS;

    let invoices = 0;
    let revenue = 0;
    for (const row of ordersRows) {
      const o = parseData(row.data);
      if (o.status !== 'daThanhToan') continue;
      const t = parseTs(o.paidAt) ?? parseTs(o.createdAt);
      if (t == null || t < startOfTodayVn) continue;
      invoices += 1;
      revenue += Number(o.grandTotal ?? 0) || 0;
    }

    let cost = 0;
    for (const row of txRows) {
      const c = parseData(row.data);
      if (c.type !== 'EXPENSE') continue;
      const t = parseTs(c.timestamp);
      if (t == null || t < startOfTodayVn) continue;
      cost += Number(c.amount ?? 0) || 0;
    }

    let debt = 0;
    for (const row of customerRows) {
      debt += Number(parseData(row.data).debtAmount ?? 0) || 0;
    }
    for (const row of supplierRows) {
      debt += Number(parseData(row.data).debtAmount ?? 0) || 0;
    }

    let lastSync: string | null = null;
    if (appCodes.length > 0) {
      const logRows = await sql`
        SELECT created_at FROM sync_logs
        WHERE app_code = ANY(${appCodes})
        ORDER BY created_at DESC LIMIT 1
      `;
      if (logRows.length > 0) lastSync = fmtVn(new Date(logRows[0].created_at));
    }

    const profit = revenue - cost;

    return NextResponse.json({
      ok: true,
      storeId,
      storeName: store.name,
      appCode,
      today: {
        invoices,
        revenue: Math.round(revenue),
        cost: Math.round(cost),
        profit: Math.round(profit),
        debt: Math.round(debt),
      },
      display: {
        invoices: String(invoices),
        revenue: fmtMoney(revenue),
        cost: fmtMoney(cost),
        profit: fmtMoney(profit),
        debt: fmtMoney(debt),
      },
      lastSync,
    }, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { error: 'Loi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
