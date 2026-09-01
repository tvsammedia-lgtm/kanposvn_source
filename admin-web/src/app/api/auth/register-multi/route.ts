import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { hashPassword } from '@/lib/auth';
import { STORE_TRIAL_DAYS, STORE_MODULES } from '@/lib/pricing';
import { ensureDefaultWarehouse } from '@/lib/default_warehouse';

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

// Tạo 1 branch + kho mặc định + license trial 7 ngày cho user, gắn vào customer.
// isMain=true: dùng branch "Cửa hàng chính" có sẵn (hoặc tạo mới) cho (customer, app_code).
// Các branch phụ (chi nhánh mua thêm, vd "Gara chi nhánh 01") tạo mới thủ công.
async function createBranchAndLicense(
  sql: ReturnType<typeof getSql>,
  opts: {
    ownerUserId: string;
    appCode: string;
    branchName: string;
    phone?: string;
    address?: string;
    isMain: boolean;
    now: Date;
  },
) {
  const { ownerUserId, appCode, branchName, phone, address, isMain, now } = opts;

  // Tìm customer chính (1 user = 1 customer).
  let custRows = await sql`
    SELECT id FROM customers WHERE owner_user_id = ${ownerUserId} ORDER BY created_at ASC LIMIT 1
  `;
  let customer = custRows[0];

  let branch: any = null;
  if (isMain && customer) {
    const mainRows = await sql`
      SELECT * FROM branches
      WHERE customer_id = ${customer.id} AND app_code = ${appCode}
      ORDER BY created_at ASC LIMIT 1
    `;
    if (mainRows.length > 0) branch = mainRows[0];
  }

  if (!branch) {
    if (!customer) {
      const code = 'C' + String(Date.now()).slice(-6);
      const created = await sql`
        INSERT INTO customers (customer_code, owner_user_id, name, phone, approval_status, registration_plan, active)
        VALUES (${code}, ${ownerUserId}, ${branchName}, ${phone || ''}, 'pending', 'free_trial', true)
        RETURNING *
      `;
      customer = created[0];
    }

    const countRows = await sql`
      SELECT COUNT(*)::int AS n FROM branches WHERE customer_id = ${customer.id}
    `;
    const n = countRows[0]?.n ?? 0;
    const branchCode = 'B' + String(n + 1).padStart(3, '0');
    const created = await sql`
      INSERT INTO branches (customer_id, branch_code, name, phone, address, app_code, is_default)
      VALUES (${customer.id}, ${branchCode}, ${branchName}, ${phone || ''}, ${address || ''}, ${appCode}, ${
        isMain && n === 0
      })
      RETURNING *
    `;
    branch = created[0];
  }

  // Kho mặc định cho branch (migration 017).
  await ensureDefaultWarehouse(sql, {
    customerId: customer.id,
    branchId: branch.id,
    branchName: branch.name,
  });

  // License trial 7 ngày cho branch (1 license / branch, device_id = '').
  const expiresAt = new Date(now.getTime() + STORE_TRIAL_DAYS * 24 * 60 * 60 * 1000);
  await sql`
    INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at, branch_id)
    VALUES (${ownerUserId}, ${appCode}, '', 'trial', 'active', ${now.toISOString()}, ${expiresAt.toISOString()}, ${branch.id})
    ON CONFLICT (user_id, branch_id, device_id) WHERE branch_id IS NOT NULL DO UPDATE SET
      plan = 'trial', status = 'active', started_at = ${now.toISOString()}, expires_at = ${expiresAt.toISOString()}
  `;

  return { customer, branch, expiresAt };
}

// Gán quyền Manager cho app (chỉ gán 1 lần / app). Trả về '' nếu app không tồn tại.
async function grantManager(sql: ReturnType<typeof getSql>, userId: string, appCode: string) {
  const [appRow] = await sql`SELECT id FROM apps WHERE app_code = ${appCode}`;
  const [managerRole] = await sql`SELECT id FROM roles WHERE role_name = 'Manager'`;
  if (appRow && managerRole) {
    await sql`
      INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
      VALUES (${userId}, ${appRow.id}, ${managerRole.id}, true)
      ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${managerRole.id}, can_login = true
    `;
  }
  return appRow?.id ?? '';
}

export async function POST(req: NextRequest) {
  const sql = getSql();
  try {
    const { store_name, phone, password, otp_code, modules } = await req.json();

    if (!store_name || !phone || !password) {
      return NextResponse.json(
        { error: 'Tên cửa hàng, SĐT và mật khẩu là bắt buộc' },
        { status: 400, headers: corsHeaders() },
      );
    }

    if (!Array.isArray(modules) || modules.length === 0) {
      return NextResponse.json(
        { error: 'Vui lòng chọn ít nhất 1 module' },
        { status: 400, headers: corsHeaders() },
      );
    }

    // Validate các module đều tồn tại + đang hiển thị đăng ký.
    const visibleApps = await sql`
      SELECT app_code FROM apps WHERE show_in_registration = true
    `;
    const visibleCodes =
      visibleApps.length > 0
        ? new Set(visibleApps.map((a: { app_code: string }) => a.app_code))
        : new Set(STORE_MODULES.map((m) => m.app_code));

    const moduleSet = new Set<string>();
    for (const m of modules) {
      const code = String(m.app_code || '').trim();
      if (!code) {
        return NextResponse.json({ error: 'Thiếu mã module trong đăng ký' }, { status: 400, headers: corsHeaders() });
      }
      if (moduleSet.has(code)) {
        return NextResponse.json({ error: `Module "${code}" bị trùng lặp` }, { status: 400, headers: corsHeaders() });
      }
      moduleSet.add(code);
      const appRows = await sql`
        SELECT app_code, show_in_registration FROM apps WHERE app_code = ${code}
      `;
      const appRow = appRows[0] as { app_code?: string; show_in_registration?: boolean } | undefined;
      if (!appRow || !visibleCodes.has(code) || appRow.show_in_registration === false) {
        return NextResponse.json(
          { error: `Module "${code}" đang ẩn hoặc không tồn tại. Vui lòng chọn lại.` },
          { status: 400, headers: corsHeaders() },
        );
      }
    }

    const normalizedPhone = normalizePhone(phone);
    if (!isValidPhone(normalizedPhone)) {
      return NextResponse.json({ error: 'SĐT không hợp lệ' }, { status: 400, headers: corsHeaders() });
    }
    if (String(password).length < 6) {
      return NextResponse.json({ error: 'Mật khẩu tối thiểu 6 ký tự' }, { status: 400, headers: corsHeaders() });
    }

    // Xác thực SĐT bằng OTP.
    if (!otp_code || !String(otp_code).trim()) {
      return NextResponse.json({ error: 'Vui lòng nhập mã xác nhận SĐT' }, { status: 400, headers: corsHeaders() });
    }
    const otpRows = await sql`
      SELECT * FROM sms_otps
      WHERE phone = ${normalizedPhone} AND purpose = 'register' AND used = false
      ORDER BY created_at DESC LIMIT 1
    `;
    if (otpRows.length === 0) {
      return NextResponse.json({ error: 'Không tìm thấy mã xác nhận. Vui lòng gửi lại mã.' }, { status: 400, headers: corsHeaders() });
    }
    const otp = otpRows[0];
    if (new Date(otp.expires_at).getTime() < Date.now()) {
      await sql`UPDATE sms_otps SET used = true WHERE id = ${otp.id}`;
      return NextResponse.json({ error: 'Mã xác nhận đã hết hạn. Vui lòng gửi lại mã.' }, { status: 400, headers: corsHeaders() });
    }
    if (String(otp_code).trim() !== otp.code) {
      await sql`UPDATE sms_otps SET attempts = attempts + 1 WHERE id = ${otp.id}`;
      return NextResponse.json({ error: 'Sai mã xác nhận. Vui lòng kiểm tra lại.' }, { status: 400, headers: corsHeaders() });
    }
    await sql`UPDATE sms_otps SET used = true WHERE id = ${otp.id}`;

    const existing = await sql`SELECT id FROM users WHERE phone = ${normalizedPhone}`;
    if (existing.length > 0) {
      return NextResponse.json({ error: 'SĐT đã được đăng ký. Vui lòng đăng nhập.' }, { status: 409, headers: corsHeaders() });
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
    const createdResults: { app_code: string; branches: string[]; expires_at: string; manager?: boolean }[] = [];

    // Tạo license trial từng module + từng chi nhánh, auto gán quyền Manager.
    for (const m of modules) {
      const code = String(m.app_code).trim();
      const branches = (Array.isArray(m.branches) && m.branches.length > 0 ? m.branches : [{ name: '' }]) as {
        name?: string;
        phone?: string;
        address?: string;
      }[];
      const branchNames = branches
        .map((b, idx) => (b && b.name && String(b.name).trim() ? String(b.name).trim() : idx === 0 ? storeName : `${storeName} ${idx + 1}`))
        .filter((n: string, i: number, arr: string[]) => arr.indexOf(n) === i);

      const createdBranches: string[] = [];
      let expiresAt: Date = now;
      for (let idx = 0; idx < branchNames.length; idx += 1) {
        const br = branches[idx] || {};
        const res = await createBranchAndLicense(sql, {
          ownerUserId: user.id,
          appCode: code,
          branchName: branchNames[idx],
          phone: br.phone ? String(br.phone) : normalizedPhone,
          address: br.address ? String(br.address) : '',
          isMain: idx === 0,
          now,
        });
        expiresAt = res.expiresAt;
        createdBranches.push(res.branch.name);
      }

      const appId = await grantManager(sql, user.id, code);
      createdResults.push({
        app_code: code,
        branches: createdBranches,
        expires_at: expiresAt.toISOString(),
        manager: Boolean(appId),
      });
    }

    // Cập nhật danh sách module đã đăng ký trên customer chính.
    const [mainCustomer] = await sql`
      SELECT id FROM customers WHERE owner_user_id = ${user.id} ORDER BY created_at ASC LIMIT 1
    `;
    if (mainCustomer) {
      await sql`
        UPDATE customers
        SET registered_modules = ${JSON.stringify(createdResults.map((r) => r.app_code))}
        WHERE id = ${mainCustomer.id}
      `;
    }

    return NextResponse.json(
      {
        ok: true,
        message:
          'Đăng ký thành công. Bạn có 7 ngày dùng thử miễn phí, hết hạn tài khoản sẽ tự khóa. Dữ liệu đã gửi về CRM để admin duyệt.',
        userId: user.id,
        storeId: store.id,
        storeName,
        plan: 'trial',
        trial: true,
        modules: createdResults,
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
