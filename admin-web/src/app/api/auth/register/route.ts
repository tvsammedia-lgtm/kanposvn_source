import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { hashPassword } from '@/lib/auth';
import {
  STORE_TRIAL_DAYS,
  STORE_MODULES,
  STORE_LICENSE_APP_CODE,
  getPlan,
  newOrderCode,
} from '@/lib/pricing';
import { ensureDefaultBranch } from '@/lib/default_branch';

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
    const { store_name, phone, password, app_code, plan, otp_code, bank_account_id } = await req.json();

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

    // Xác thực SĐT bằng OTP (mock hiện tại, đổi nhà cung cấp qua env SMS_PROVIDER)
    if (!otp_code || !String(otp_code).trim()) {
      return NextResponse.json(
        { error: 'Vui lòng nhập mã xác nhận SĐT' },
        { status: 400, headers: corsHeaders() },
      );
    }
    const otpRows = await sql`
      SELECT * FROM sms_otps
      WHERE phone = ${normalizedPhone} AND purpose = 'register' AND used = false
      ORDER BY created_at DESC LIMIT 1
    `;
    if (otpRows.length === 0) {
      return NextResponse.json(
        { error: 'Không tìm thấy mã xác nhận. Vui lòng gửi lại mã.' },
        { status: 400, headers: corsHeaders() },
      );
    }
    const otp = otpRows[0];
    if (new Date(otp.expires_at).getTime() < Date.now()) {
      await sql`UPDATE sms_otps SET used = true WHERE id = ${otp.id}`;
      return NextResponse.json(
        { error: 'Mã xác nhận đã hết hạn. Vui lòng gửi lại mã.' },
        { status: 400, headers: corsHeaders() },
      );
    }
    if (String(otp_code).trim() !== otp.code) {
      await sql`UPDATE sms_otps SET attempts = attempts + 1 WHERE id = ${otp.id}`;
      return NextResponse.json(
        { error: 'Sai mã xác nhận. Vui lòng kiểm tra lại.' },
        { status: 400, headers: corsHeaders() },
      );
    }
    await sql`UPDATE sms_otps SET used = true WHERE id = ${otp.id}`;

    // Gói dịch vụ: trial = dùng ngay 7 ngày; yearly = chuyển khoản rồi kích hoạt
    const selectedPlan = getPlan((plan as string) || 'trial');
    if (selectedPlan.key === 'forever') {
      return NextResponse.json(
        { error: 'Gói Vĩnh Viễn đã ngừng bán. Vui lòng chọn gói 365 ngày.' },
        { status: 400, headers: corsHeaders() },
      );
    }
    // Giá bán theo từng app_code (apps.price) — chưa đặt giá thì dùng giá mặc định của gói
    const appPriceRows = await sql`SELECT price FROM apps WHERE app_code = ${appCode}`;
    const appPrice: number | null = appPriceRows.length > 0 && appPriceRows[0].price ? appPriceRows[0].price : null;
    const amount = selectedPlan.trial || selectedPlan.key === 'trial' ? 0 : (appPrice ?? selectedPlan.price);
    if (selectedPlan.trial !== true && selectedPlan.key !== 'trial') {
      // gói trả phí phải kèm tài khoản ngân hàng đích
      if (!bank_account_id) {
        return NextResponse.json(
          { error: 'Vui lòng chọn tài khoản ngân hàng để chuyển khoản' },
          { status: 400, headers: corsHeaders() },
        );
      }
      const bankRows = await sql`
        SELECT * FROM bank_accounts WHERE id = ${bank_account_id} AND active = true
      `;
      if (bankRows.length === 0) {
        return NextResponse.json(
          { error: 'Tài khoản ngân hàng không hợp lệ' },
          { status: 400, headers: corsHeaders() },
        );
      }
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

    if (selectedPlan.trial || selectedPlan.key === 'trial') {
      // Gói dùng thử: kích hoạt license 7 ngày ngay lập tức.
      const expiresAt = new Date(now.getTime() + STORE_TRIAL_DAYS * 24 * 60 * 60 * 1000);

      const [license] = await sql`
        INSERT INTO licenses (user_id, store_id, app_code, device_id, plan, status, started_at, expires_at)
        VALUES (${user.id}, ${store.id}, ${appCode}, '', 'trial', 'active', ${now.toISOString()}, ${expiresAt.toISOString()})
        RETURNING id, plan, expires_at
      `;

      await ensureDefaultBranch(sql, { userId: user.id, appCode, licenseId: license.id });

      await sql`
        UPDATE users SET subscription_plan = 'trial', subscription_start = ${now.toISOString()}, subscription_end = ${expiresAt.toISOString()}
        WHERE id = ${user.id}
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
          plan: 'trial',
          trial: true,
          expiresAt: license.expires_at,
        },
        { headers: corsHeaders() },
      );
    }

    // Gói trả phí: tạo đơn hàng chuyển khoản chờ xác nhận, chưa kích hoạt license.
    const bankRows = await sql`SELECT * FROM bank_accounts WHERE id = ${bank_account_id}`;
    const bank = bankRows[0];
    const orderCode = newOrderCode();

    const [order] = await sql`
      INSERT INTO orders (
        order_code, user_id, app_code, plan, amount, currency, status,
        payment_method, bank_code, bank_account_id, description
      )
      VALUES (
        ${orderCode}, ${user.id}, ${appCode}, ${selectedPlan.key}, ${amount}, 'VND',
        'pending', 'bank_transfer', ${bank.bank_code}, ${bank.id},
        ${'Thanh toán gói ' + selectedPlan.label + ' qua chuyển khoản - Mã đơn: ' + orderCode}
      )
      RETURNING order_code, amount, created_at
    `;

    // Tạo khách hàng + chi nhánh + kho mặc định ngay khi đăng ký.
    // License chưa có (chờ chuyển khoản) nên chưa gắn branch; bước thanh toán
    // (/api/license/pay) sẽ gắn branch_id vào license khi kích hoạt.
    await ensureDefaultBranch(sql, { userId: user.id, appCode, licenseId: '' });

    return NextResponse.json(
      {
        ok: true,
        message: 'Đăng ký thành công. Vui lòng chuyển khoản theo mã đơn hàng để kích hoạt.',
        userId: user.id,
        storeId: store.id,
        storeName,
        appCode,
        moduleName,
        plan: selectedPlan.key,
        trial: false,
        order_code: order.order_code,
        amount: order.amount,
        bank: {
          bank_code: bank.bank_code,
          bank_name: bank.bank_name,
          account_number: bank.account_number,
          account_holder: bank.account_holder,
          branch: bank.branch,
        },
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
