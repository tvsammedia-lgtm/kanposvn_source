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
/// Hỗ trợ cả số nguyên microgiây của các module như kanposvngara
/// (orderDate, updatedAt, transactionDate...) -> chia 1000 thành millis.
function parseTs(value: unknown): number | null {
  if (value == null || value === '') return null;
  if (typeof value === 'number' && Number.isFinite(value)) {
    return value >= 1e14 ? value / 1000 : value;
  }
  const s = String(value).trim();
  if (/^\d{12,}$/.test(s)) {
    const n = Number(s);
    if (!Number.isNaN(n)) return n >= 1e14 ? n / 1000 : n;
  }
  let t = Date.parse(s);
  if (Number.isNaN(t)) return null;
  if (!/[zZ]|[+-]\d\d:?\d\d$/.test(s)) {
    t -= VN_OFFSET_MS;
  }
  return t;
}

/// Trạng thái hóa đơn đã thanh toán: chấp nhận cả chuỗi trạng thái cũ và
/// dạng SỐ của các module như gara (status: 2 = hoàn thành, 3 = đã giao xe).
function isPaidStatus(d: Record<string, unknown>): boolean {
  const raw = d.status;
  const s = String(raw ?? '').trim();
  if (s === 'daThanhToan' || s === 'paid' || s === 'DA_THANH_TOAN') return true;
  if (typeof raw === 'number' && raw >= 2) return true;
  if (s !== '' && !Number.isNaN(Number(s)) && Number(s) >= 2) return true;
  return false;
}

function parseData(data: unknown): Record<string, unknown> {
  if (typeof data === 'string') {
    try { return JSON.parse(data) as Record<string, unknown>; } catch { return {}; }
  }
  if (data && typeof data === 'object') return data as Record<string, unknown>;
  return {};
}

/// Định dạng giờ VN: dd/MM/yyyy HH:mm
function fmtDateTime(d: Date): string {
  const vn = new Date(d.getTime() + VN_OFFSET_MS);
  const dd = String(vn.getUTCDate()).padStart(2, '0');
  const MM = String(vn.getUTCMonth() + 1).padStart(2, '0');
  const yyyy = vn.getUTCFullYear();
  const hh = String(vn.getUTCHours()).padStart(2, '0');
  const mm = String(vn.getUTCMinutes()).padStart(2, '0');
  return `${dd}/${MM}/${yyyy} ${hh}:${mm}`;
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
  c === 'cafe_orders' ||
  c === 'orders' ||
  c.endsWith('_orders') ||
  c === 'GaraRepairOrder' ||
  c === 'GaraInvoice';
const isTxColl = (c: string) =>
  c.includes('cash_transactions') ||
  c.includes('transactions') ||
  c.includes('expense') ||
  c === 'GaraFinanceTransaction';
const DEBT_COLLS = [
  'cafe_customers',
  'cafe_suppliers',
  'customers',
  'suppliers',
  'customer_debts',
  'supplier_debts',
  'GaraCustomer',
  'GaraSupplier',
];

interface BoundedAgg {
  key: string;
  name: string;
  invoices: number;
  revenue: number;
  cost: number;
  debt: number;
  lastSync: string | null;
}

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

    // Chi nhánh của chủ doanh nghiệp này (qua customers.owner_user_id): từng
    // chi nhánh có branch_id + tên (vd "GARA THIÊN KIM 01"). Nếu chưa có chi
    // nhánh thì gộp toàn bộ vào chính cửa hàng (store.name) như trước.
    const branchRows = await sql`
      SELECT b.id AS branch_id, b.name AS branch_name, b.app_code
      FROM branches b
      JOIN customers c ON c.id = b.customer_id
      WHERE c.owner_user_id = ${auth.id} AND b.active = true
      ORDER BY b.name
    `;
    const branchesByApp = new Map<string, Array<{ id: string; name: string }>>();
    const ownerBranchIds = new Set<string>();
    for (const br of branchRows) {
      const code = String(br.app_code);
      const list = branchesByApp.get(code) ?? [];
      list.push({ id: String(br.branch_id), name: String(br.branch_name || '') });
      branchesByApp.set(code, list);
      ownerBranchIds.add(String(br.branch_id));
    }

    // Danh sách app_code cửa hàng đã có: từ dữ liệu thật đã đồng bộ (storeId
    // nhúng trong sync_data) + license active + chi nhánh. Ưu tiên dữ liệu thật
    // vì license có thể là 'pos' trong khi app đẩy 'kanposvncafe'.
    const dataAppRows = await sql`
      SELECT DISTINCT app_code FROM sync_data WHERE data->>'storeId' = ${storeId}
    `;
    const licRows = await sql`
      SELECT DISTINCT app_code FROM licenses WHERE user_id = ${auth.id} AND status = 'active'
    `;
    // App được gán cho owner (user_permissions can_login) — vd owner chỉ có license
    // 'pos' nhưng được gán kanvlxd_one trên Admin dashboard.
    const permRows = await sql`
      SELECT DISTINCT a.app_code FROM user_permissions p
      JOIN apps a ON a.id = p.app_id
      WHERE p.user_id = ${auth.id} AND p.can_login = true
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
    for (const r of permRows) {
      const code = String(r.app_code);
      if (!codeNames.has(code)) codeNames.set(code, nameMap.get(code) || code);
    }
    for (const code of branchesByApp.keys()) {
      if (!codeNames.has(code)) codeNames.set(code, nameMap.get(code) || code);
    }
    const appCodes = Array.from(codeNames.entries()).map(([code, name]) => ({ code, name }));

    const appCode = selected || appCodes[0]?.code || 'kanposvncafe';

    // Combo gom dữ liệu: 1 combo cho CHÍNH CỬA HÀNG (branch rỗng) + 1 combo cho
    // MỖI CHI NHÁNH của owner theo app_code đang xem.
    const combos = new Map<string, BoundedAgg>();
    const makeCombo = (key: string, name: string) =>
      combos.set(key, {
        key,
        name,
        invoices: 0,
        revenue: 0,
        cost: 0,
        debt: 0,
        lastSync: null,
      });
    const branchList = branchesByApp.get(appCode) ?? [];
    for (const br of branchList) {
      if (!combos.has(br.id)) makeCombo(br.id, br.name || store.name);
    }
    // Combo gộp cho dữ liệu cũ chưa gắn chi nhánh (branch_id NULL) hoặc dữ liệu
    // module đơn cửa hàng (có storeId). App đa chi nhánh thì KHÔNG tạo combo gộp
    // để hiển thị sạch theo từng chi nhánh.
    if (branchList.length === 0 && !combos.has('')) makeCombo('', store.name);

    // Hôm nay theo giờ Việt Nam.
    const vnNow = new Date(Date.now() + VN_OFFSET_MS);
    const startOfTodayVn =
      Date.UTC(vnNow.getUTCFullYear(), vnNow.getUTCMonth(), vnNow.getUTCDate()) -
      VN_OFFSET_MS;

    const rows = await sql`
      SELECT collection, branch_id, data FROM sync_data
      WHERE app_code = ${appCode}
    `;
    for (const row of rows) {
      const collection = String(row.collection || '');
      const branchId = row.branch_id ? String(row.branch_id) : '';
      const d = parseData(row.data);
      const rowStoreId = d.storeId ? String(d.storeId) : null;

      // Bỏ qua dữ liệu không thuộc owner này.
      if (branchId) {
        if (!ownerBranchIds.has(branchId)) continue;
      } else if (rowStoreId) {
        if (rowStoreId !== storeId) continue;
      } else {
        // Module đa chi nhánh không nhúng storeId: chỉ nhận khi owner này có
        // license/chỉ nhánh cho app_code này (dữ liệu cũ chưa gắn branch_id).
        if (branchList.length === 0) continue;
      }
      const combo = combos.get(branchId || '');
      if (!combo) continue;

      if (isInvoiceColl(collection)) {
        if (isPaidStatus(d)) {
          const t = parseTs(d.paidAt)
            ?? parseTs(d.orderDate)
            ?? parseTs(d.transactionDate)
            ?? parseTs(d.createdAt)
            ?? parseTs(d.updatedAt);
          if (t != null && t >= startOfTodayVn) {
            const total =
              Number(d.paidAmount ?? d.grandTotal ?? d.totalAmount ?? d.total ?? 0) || 0;
            if (total > 0) {
              combo.invoices += 1;
              combo.revenue += total;
            }
          }
        }
      } else if (isTxColl(collection)) {
        const rawType = d.type;
        const type = String(rawType ?? '').trim();
        const isExpense =
          type === 'EXPENSE' ||
          type === 'expense' ||
          (typeof rawType === 'number' && rawType > 0);
        if (isExpense) {
          const t = parseTs(d.transactionDate)
            ?? parseTs(d.timestamp)
            ?? parseTs(d.createdAt);
          if (t != null && t >= startOfTodayVn) {
            combo.cost += Number(d.amount ?? d.total ?? 0) || 0;
          }
        }
      } else if (DEBT_COLLS.includes(collection)) {
        combo.debt +=
          Number(d.currentDebt ?? d.debtAmount ?? d.debt ?? d.balance ?? 0) || 0;
      }
    }

    // Thời gian đồng bộ cuối.
    const logRows = await sql`
      SELECT created_at FROM sync_logs
      WHERE app_code = ${appCode}
      ORDER BY created_at DESC LIMIT 1
    `;
    const lastSync = logRows.length > 0 ? fmtVn(new Date(logRows[0].created_at)) : null;
    for (const combo of combos.values()) combo.lastSync = lastSync;

    const branchItems = Array.from(combos.values())
      // Luôn hiện CHI NHÁNH thật (id != '') dù chưa có dữ liệu hôm nay, để user
      // thấy đủ tên chi nhánh của app. Combo gộp ('') chỉ hiện khi có dữ liệu.
      .filter((c) => c.key !== '' || c.invoices > 0 || c.revenue > 0 || c.cost > 0 || c.debt > 0)
      .map((c) => {
        const profit = c.revenue - c.cost;
        return {
          id: c.key,
          name: c.name,
          today: {
            invoices: c.invoices,
            revenue: Math.round(c.revenue),
            cost: Math.round(c.cost),
            profit: Math.round(profit),
            debt: Math.round(c.debt),
          },
          display: {
            invoices: String(c.invoices),
            revenue: fmtMoney(c.revenue),
            cost: fmtMoney(c.cost),
            profit: fmtMoney(profit),
            debt: fmtMoney(c.debt),
          },
        };
      });

    // Tổng toàn app (hợp tất cả combo) để giữ khối tổng cho các module đơn cửa hàng.
    const total = Array.from(combos.values()).reduce(
      (acc, c) => {
        acc.invoices += c.invoices;
        acc.revenue += c.revenue;
        acc.cost += c.cost;
        acc.debt += c.debt;
        return acc;
      },
      { invoices: 0, revenue: 0, cost: 0, debt: 0 },
    );
    const profit = total.revenue - total.cost;

    return NextResponse.json({
      ok: true,
      storeId,
      storeName: store.name,
      appCode,
      appCodes,
      branches: branchItems,
      today: {
        invoices: total.invoices,
        revenue: Math.round(total.revenue),
        cost: Math.round(total.cost),
        profit: Math.round(profit),
        debt: Math.round(total.debt),
      },
      display: {
        invoices: String(total.invoices),
        revenue: fmtMoney(total.revenue),
        cost: fmtMoney(total.cost),
        profit: fmtMoney(profit),
        debt: fmtMoney(total.debt),
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