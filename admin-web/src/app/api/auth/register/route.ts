import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { hashPassword } from '@/lib/auth';
import { STORE_TRIAL_DAYS, STORE_MODULES, STORE_LICENSE_APP_CODE } from '@/lib/pricing';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

function normalizePhone(phone: string) {
  return phone.trim().replace(/[\s-]/g, '');
}

function isValidPhone(phone: string) {
  return /^\+?[0-9]{8,15}$/.test(phone);
}

export async function POST(req: NextRequest) {
  const sql = getSql();
  try {
    const { store_name, phone, password, app_code } = await req.json();

    if (!store_name || !phone || !password) {
      return NextResponse.json(
        { error: 'Tên cửa hàng, SĐT và mật khẩu là bắt buộc' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const appCode = (app_code || STORE_LICENSE_APP_CODE) as string;

    // Module phai ton tai trong apps va dang hien thi cho dang ky
    const appRows = await sql`
      SELECT app_code, app_name, show_in_registration FROM apps WHERE app_code = ${appCode}
    `;
    const visibleApps = await sql`
      SELECT app_code FROM apps WHERE show_in_registration = true
    `;
    const visibleCodes = visibleApps.length > 0
      ? new Set(visibleApps.map((a: { app_code: string }) => a.app_code))
      : new Set(STORE_MODULES.map((m) => m.app_code));
    const appRow = appRows[0] as { app_code?: string; app_name?: string; show_in_registration?: boolean } | undefined;

    const moduleInfo = STORE_MODULES.find((m) => m.app_code === appCode);
    const moduleName = appRow?.app_name || moduleInfo?.name || appCode;

    if (!appRow || !visibleCodes.has(appCode) || appRow.show_in_registration === false) {
      return NextResponse.json(
        { error: `Module "${appCode}" đang ẩn hoặc không tồn tại. Vui lòng chọn ngành nghề.` },
        { status: 400, headers: corsHeaders() },
      );
    }

    const normalizedPhone = normalizePhone(phone);
    if (!isValidPhone(normalizedPhone)) {
      return NextResponse.json(
        { error: 'SĐT không hợp lệ' },
        { status: 400, headers: corsHeaders() },
      );
    }

    if (String(password).length < 6) {
      return NextResponse.json(
        { error: 'Mật khẩu tối thiểu 6 ký tự' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const existing = await sql`SELECT id FROM users WHERE phone = ${normalizedPhone}`;
    if (existing.length > 0) {
      return NextResponse.json(
        { error: 'SĐT đã được đăng ký. Vui lòng đăng nhập.' },
        { status: 409, headers: corsHeaders() },
      );
    }

    const storeName = store_name.trim();
    const email = `store${normalizedPhone.replace(/\D/g, '')}@kanposvn.local`;
    const hash = await hashPassword(password);

    const [user] = await sql`
      INSERT INTO users (email, password_hash, full_name, phone, active)
      VALUES (${email}, ${hash}, ${storeName}, ${normalizedPhone}, true)
      RETURNING id
    `;

    const [store] = await sql`
      INSERT INTO stores (name, phone, owner_user_id)
      VALUES (${storeName}, ${normalizedPhone}, ${user.id})
      RETURNING id
    `;

    const now = new Date();
    const expiresAt = new Date(now.getTime() + STORE_TRIAL_DAYS * 24 * 60 * 60 * 1000);

    const [license] = await sql`
      INSERT INTO licenses (user_id, store_id, app_code, device_id, plan, status, started_at, expires_at)
      VALUES (${user.id}, ${store.id}, ${appCode}, '', 'trial', 'active', ${now.toISOString()}, ${expiresAt.toISOString()})
      RETURNING plan, expires_at
    `;

    return NextResponse.json(
      {
        ok: true,
        message: 'Đăng ký thành công',
        userId: user.id,
        storeId: store.id,
        storeName,
        appCode,
        moduleName,
        trial: true,
        expiresAt: license.expires_at,
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
