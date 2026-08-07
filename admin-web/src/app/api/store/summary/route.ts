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

/// Nhận diện collection chung cho mọi module (giống /api/sync/summary):
/// hóa đơn, giao dịch thu/chi, công nợ.
const isInvoiceColl = (c: string) =>
  c === 'cafe_orders' || c === 'orders' || c.endsWith('_orders');
const isTxColl = (c: string) =>
  c.includes('cash_transactions') || c.includes('transactions') || c.includes('expense');
const DEBT_COLLS = [
  'cafe_customers',
  'cafe_suppliers',
  'customers',
  'suppliers',
  'customer_debts',
  'supplier_debts',
];

export async function GET(req: NextRequest) {
  const sql = getSql();
  try {
    const auth = getToken(req);
    if (!auth) {
      return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
    }
    const selected = req.nextUrl.searchParams.get('app_code');

    const [store] = await sql`SELECT id, name FROM stores WHERE owner_user_id = ${auth.id}`;
    if (!store) {
      return NextResponse.json({ error: 'Khong tim thay cua hang' }, { status: 404, headers: corsHeaders() });
    }
    const storeId: string = store.id;

    // Danh sách app_code cửa hàng đã có: từ dữ liệu thật đã đồng bộ (storeId
    // nhúng trong sync_data) + license active. Ưu tiên dữ liệu thật vì license
    // có thể là 'pos' trong khi app đẩy 'kanposvncafe'.
    const dataAppRows = await sql`
      SELECT DISTINCT app_code FROM sync_data WHERE data->>'storeId' = ${storeId}
    `;
    const licRows = await sql`
      SELECT DISTINCT app_code FROM licenses WHERE user_id = ${auth.id} AND status = 'active'
    `;
    const appNameRows = await sql`SELECT app_code, app_name FROM apps`;
    const nameMap = new Map<string, string>();
    for (const a of appNameRows) nameMap.set(a.app_code, a.app_name || a.app_code);

    const codeNames = new Map<string, string>();
    for (const r of dataAppRows) {
      const code = String(r.app_code);
      codeNames.set(code, nameMap.get(code) || code);
    }
    for (const r of licRows) {
      const code = String(r.app_code);
      if (!codeNames.has(code)) codeNames.set(code, nameMap.get(code) || code);
    }
    const appCodes = Array.from(codeNames.entries()).map(([code, name]) => ({ code, name }));

    const appCode = selected || appCodes[0]?.code || 'kanposvncafe';

    // Hôm nay theo giờ Việt Nam.
    const vnNow = new Date(Date.now() + VN_OFFSET_MS);
    const startOfTodayVn =
      Date.UTC(vnNow.getUTCFullYear(), vnNow.getUTCMonth(), vnNow.getUTCDate()) -
      VN_OFFSET_MS;

    let invoices = 0;
    let revenue = 0;
    let cost = 0;
    let debt = 0;

    const rows = await sql`
      SELECT collection, data FROM sync_data
      WHERE data->>'storeId' = ${storeId} AND app_code = ${appCode}
    `;
    for (const row of rows) {
      const collection = String(row.collection || '');
      const d = parseData(row.data);

      if (isInvoiceColl(collection)) {
        const status = String(d.status || '');
        if (status === 'daThanhToan' || status === 'paid' || status === 'DA_THANH_TOAN') {
          const t = parseTs(d.paidAt) ?? parseTs(d.createdAt) ?? parseTs(d.updatedAt);
          if (t != null && t >= startOfTodayVn) {
            const total = Number(d.grandTotal ?? d.totalAmount ?? d.total ?? 0) || 0;
            if (total > 0) {
              invoices += 1;
              revenue += total;
            }
          }
        }
      } else if (isTxColl(collection)) {
        const type = String(d.type || '');
        if (type === 'EXPENSE' || type === 'expense') {
          const t = parseTs(d.timestamp) ?? parseTs(d.createdAt);
          if (t != null && t >= startOfTodayVn) {
            cost += Number(d.amount ?? d.total ?? 0) || 0;
          }
        }
      } else if (DEBT_COLLS.includes(collection)) {
        debt += Number(d.debtAmount ?? d.debt ?? d.balance ?? 0) || 0;
      }
    }

    let lastSync: string | null = null;
    const logRows = await sql`
      SELECT created_at FROM sync_logs
      WHERE app_code = ${appCode}
      ORDER BY created_at DESC LIMIT 1
    `;
    if (logRows.length > 0) lastSync = fmtVn(new Date(logRows[0].created_at));

    const profit = revenue - cost;

    return NextResponse.json({
      ok: true,
      storeId,
      storeName: store.name,
      appCode,
      appCodes,
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
