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
  // Số nguyên: < 1e14 là millis giữ nguyên; >= 1e14 là microgiây -> chia 1000.
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
  // status dạng số nguyên của gara: coi >= 2 (hoàn thành/giao xe) là đã thanh toán.
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

function fmtMoney(v: number): string {
  return Math.round(v).toLocaleString('vi-VN') + ' đ';
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

interface OwnerCombo {
  ownerId: string;
  ownerName: string;
  ownerEmail: string;
  ownerPhone: string;
  storeId: string;
  storeName: string;
  appCode: string;
  appName: string;
  invoices: number;
  revenue: number;
  cost: number;
  debt: number;
  lastSync: string | null;
}

/// Tóm tắt dashboard hôm nay theo (owner, app_code) + thời gian đồng bộ cuối.
/// Dữ liệu lấy từ sync_data (do app Flutter đẩy lên), phân theo chủ cửa hàng
/// thông qua storeId nhúng trong từng bản ghi.
export async function GET(req: NextRequest) {
  const sql = getSql();
  const auth = getToken(req);
  if (!auth) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }
  try {
    const stores = await sql`
      SELECT s.id AS store_id, s.name AS store_name,
             u.id AS owner_id, u.email AS owner_email,
             u.full_name AS owner_name, u.phone AS owner_phone
      FROM stores s
      JOIN users u ON u.id = s.owner_user_id
      ORDER BY u.full_name, s.name
    `;

    const licenses = await sql`
      SELECT DISTINCT user_id, app_code, store_id FROM licenses WHERE status = 'active'
    `;

    const apps = await sql`SELECT app_code, app_name FROM apps`;
    const appNameMap = new Map<string, string>();
    for (const a of apps) {
      appNameMap.set(a.app_code, a.app_name || a.app_code);
    }

    // App được gán cho user bên "Phân quyền ứng dụng" (user_permissions can_login)
    // mà chưa có license / chưa đẩy dữ liệu vẫn phải hiện trong tóm tắt.
    const permRows = await sql`
      SELECT DISTINCT p.user_id, a.app_code
      FROM user_permissions p
      JOIN apps a ON a.id = p.app_id
      WHERE p.can_login = true
    `;

    const dataRows = await sql`SELECT app_code, collection, data FROM sync_data`;

    // Định danh collection cho mọi module (kể cả gara với tên viết hoa):
    // - Hóa đơn: cafe_orders / orders / *__orders / GaraRepairOrder / GaraInvoice
    // - Giao dịch thu chi: cash_transactions / transactions / expense / GaraFinanceTransaction
    // - Công nợ: khách hàng / nhà cung cấp / *__Debt (gara dùng GaraCustomer.currentDebt)
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

    const lastLogs = await sql`
      SELECT DISTINCT ON (app_code) app_code, created_at
      FROM sync_logs ORDER BY app_code, created_at DESC
    `;
    const lastSyncByApp = new Map<string, string>();
    for (const l of lastLogs) {
      lastSyncByApp.set(l.app_code, String(l.created_at));
    }

    const storeById = new Map<string, { ownerId: string; storeName: string }>();
    for (const s of stores) {
      storeById.set(s.store_id, { ownerId: s.owner_id, storeName: s.store_name });
    }

    // Bản đồ app_code -> owner dành cho MODULE ĐA CHI NHÁNH (Gara, VLXD, ...)
    // mà dữ liệu sync_data KHÔNG nhúng storeId (chỉ gắn app_code).
    // Quy về chủ sở hữu qua customers.owner_user_id; nếu có nhiều owner cùng
    // dùng một app_code thì ưu tiên owner có cửa hàng đăng ký (stores), rồi mới
    // đến owner có license active.
    const branchRows = await sql`
      SELECT b.app_code, c.owner_user_id, c.name AS customer_name
      FROM branches b
      JOIN customers c ON c.id = b.customer_id
      WHERE c.owner_user_id IS NOT NULL
      GROUP BY b.app_code, c.owner_user_id, c.name
    `;
    const ownerByApp = new Map<string, { ownerId: string; customerName: string }>();
    const storeOwnerIds = new Set(stores.map((s) => String(s.owner_id)));
    const branchOwnersByApp = new Map<string, Array<{ ownerId: string; customerName: string }>>();
    for (const br of branchRows) {
      const code = String(br.app_code);
      const owner = { ownerId: String(br.owner_user_id), customerName: String(br.customer_name || '') };
      const list = branchOwnersByApp.get(code);
      if (list) {
        if (!list.some((o) => o.ownerId === owner.ownerId)) list.push(owner);
      } else {
        branchOwnersByApp.set(code, [owner]);
      }
    }
    const pickOwner = (candidates: Array<{ ownerId: string; customerName: string }>) => {
      if (!candidates.length) return null;
      const withStore = candidates.find((o) => storeOwnerIds.has(o.ownerId));
      const owner = withStore ?? candidates[0];
      // Khớp store (nếu tồn tại) để lấy tên chuẩn.
      return {
        ownerId: owner.ownerId,
        customerName: owner.customerName,
      };
    };
    const licenseOwnersByApp = new Map<string, Array<{ ownerId: string; customerName: string }>>();
    for (const lic of licenses) {
      const code = String(lic.app_code);
      const list = licenseOwnersByApp.get(code) ?? [];
      list.push({ ownerId: String(lic.user_id), customerName: '' });
      licenseOwnersByApp.set(code, list);
    }
    for (const code of new Set([...branchOwnersByApp.keys(), ...licenseOwnersByApp.keys()])) {
      const candidates = branchOwnersByApp.get(code) ?? [];
      const picked = pickOwner(candidates);
      if (picked) {
        ownerByApp.set(code, picked);
      } else {
        const licCandidates = licenseOwnersByApp.get(code) ?? [];
        const licPicked = pickOwner(licCandidates);
        if (licPicked) ownerByApp.set(code, licPicked);
      }
    }

    const combos = new Map<string, OwnerCombo>();
    const comboKey = (ownerId: string, appCode: string) => `${ownerId}|${appCode}`;

    for (const lic of licenses) {
      const store = storeById.get(lic.store_id);
      const ownerId = store ? store.ownerId : String(lic.user_id);
      const key = comboKey(ownerId, String(lic.app_code));
      if (!combos.has(key)) {
        combos.set(key, {
          ownerId,
          ownerName: '',
          ownerEmail: '',
          ownerPhone: '',
          storeId: lic.store_id,
          storeName: store?.storeName || '',
          appCode: String(lic.app_code),
          appName: appNameMap.get(String(lic.app_code)) || String(lic.app_code),
          invoices: 0,
          revenue: 0,
          cost: 0,
          debt: 0,
          lastSync: lastSyncByApp.get(String(lic.app_code)) || null,
        });
      }
    }

    // Ngoài license: nếu app đã thực sự đẩy dữ liệu lên (có storeId) mà chưa có
    // combo tương ứng thì vẫn tạo combo, để dữ liệu đồng bộ không bị ẩn khi
    // license chưa khớp đúng app_code (vd license 'pos' nhưng app đẩy 'kanposvncafe').
    for (const row of dataRows) {
      const appCode = String(row.app_code);
      const d = parseData(row.data);
      const storeId = d.storeId ? String(d.storeId) : null;
      if (!storeId) {
        // Module đa chi nhánh (Gara/VLXD...): dữ liệu không có storeId nhưng có
        // app_code → quy về owner qua customers.owner_user_id để không bị 0.
        const appOwner = ownerByApp.get(appCode);
        if (!appOwner) continue;
        const key = comboKey(appOwner.ownerId, appCode);
        const existing = combos.get(key);
        if (existing) {
          // Đã có combo (từ license): điền tên chi nhánh/customer cho dễ nhận diện.
          if (!existing.storeName && appOwner.customerName) {
            existing.storeName = appOwner.customerName;
          }
          continue;
        }
        combos.set(key, {
          ownerId: appOwner.ownerId,
          ownerName: '',
          ownerEmail: '',
          ownerPhone: '',
          storeId: '',
          storeName: appOwner.customerName,
          appCode,
          appName: appNameMap.get(appCode) || appCode,
          invoices: 0,
          revenue: 0,
          cost: 0,
          debt: 0,
          lastSync: lastSyncByApp.get(appCode) || null,
        });
        continue;
      }
      const store = storeById.get(storeId);
      if (!store) continue;
      const key = comboKey(store.ownerId, appCode);
      if (combos.has(key)) continue;
      combos.set(key, {
        ownerId: store.ownerId,
        ownerName: '',
        ownerEmail: '',
        ownerPhone: '',
        storeId,
        storeName: store.storeName,
        appCode,
        appName: appNameMap.get(appCode) || appCode,
        invoices: 0,
        revenue: 0,
        cost: 0,
        debt: 0,
        lastSync: lastSyncByApp.get(appCode) || null,
      });
    }

    for (const s of stores) {
      for (const combo of combos.values()) {
        if (combo.ownerId === s.owner_id) {
          combo.ownerName = combo.ownerName || s.owner_name || '';
          combo.ownerEmail = combo.ownerEmail || s.owner_email || '';
          combo.ownerPhone = combo.ownerPhone || s.owner_phone || '';
        }
      }
    }

    // App gán bên "Phân quyền ứng dụng": nếu chưa có combo (license/dữ liệu) thì tạo
    // combo theo store của owner tương ứng để xuất hiện trong dropdown tóm tắt.
    for (const row of permRows) {
      const userId = String(row.user_id);
      const appCode = String(row.app_code);
      const store = stores.find((s) => s.owner_id === userId);
      const key = comboKey(userId, appCode);
      if (combos.has(key)) continue;
      combos.set(key, {
        ownerId: userId,
        ownerName: store?.owner_name || '',
        ownerEmail: store?.owner_email || '',
        ownerPhone: store?.owner_phone || '',
        storeId: store?.store_id || '',
        storeName: store?.store_name || '',
        appCode,
        appName: appNameMap.get(appCode) || appCode,
        invoices: 0,
        revenue: 0,
        cost: 0,
        debt: 0,
        lastSync: lastSyncByApp.get(appCode) || null,
      });
    }

    // Hôm nay theo giờ Việt Nam.
    const vnNow = new Date(Date.now() + VN_OFFSET_MS);
    const startOfTodayVn =
      Date.UTC(vnNow.getUTCFullYear(), vnNow.getUTCMonth(), vnNow.getUTCDate()) -
      VN_OFFSET_MS;

    for (const row of dataRows) {
      const appCode = String(row.app_code);
      const collection = String(row.collection || '');
      const d = parseData(row.data);
      const storeId = d.storeId ? String(d.storeId) : null;
      let ownerId: string;
      if (storeId) {
        const store = storeById.get(storeId);
        if (!store) continue;
        ownerId = store.ownerId;
      } else {
        // Module đa chi nhánh (Gara/VLXD...): không có storeId → quy về owner
        // theo app_code qua customers.owner_user_id.
        const appOwner = ownerByApp.get(appCode);
        if (!appOwner) continue;
        ownerId = appOwner.ownerId;
      }
      const combo = combos.get(comboKey(ownerId, appCode));
      if (!combo) continue;

      if (isInvoiceColl(collection)) {
        if (isPaidStatus(d)) {
          // Thời gian: gara dùng orderDate/paidDate/updatedAt dạng Unix millis.
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
        // Gara finance: type dạng SỐ (0 = thu, 1/2 = chi...). Chấp nhận cả chuỗi.
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
        // Gara customer/supplier dùng currentDebt.
        combo.debt +=
          Number(d.currentDebt ?? d.debtAmount ?? d.debt ?? d.balance ?? 0) || 0;
      }
    }

    const items = Array.from(combos.values())
      .filter(
        (c) =>
          c.invoices > 0 || c.revenue > 0 || c.cost > 0 || c.debt > 0 || c.lastSync != null,
      )
      .map((c) => {
      const profit = c.revenue - c.cost;
      return {
        owner: {
          id: c.ownerId,
          name: c.ownerName,
          email: c.ownerEmail,
          phone: c.ownerPhone,
        },
        store: { id: c.storeId, name: c.storeName },
        app: { code: c.appCode, name: c.appName },
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
        lastSync: c.lastSync ? fmtDateTime(new Date(c.lastSync)) : null,
      };
    });

    return NextResponse.json({
      ok: true,
      date: fmtDateTime(new Date()),
      items,
    }, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { error: 'Loi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
