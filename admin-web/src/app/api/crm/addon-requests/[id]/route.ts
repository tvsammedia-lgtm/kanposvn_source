import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { getPlan, STORE_TRIAL_DAYS } from '@/lib/pricing';
import { ensureDefaultWarehouse } from '@/lib/default_warehouse';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

function getAdmin(req: NextRequest) {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try { return verifyToken(auth.split(' ')[1]); } catch { return null; }
}

// Tạo 1 branch MỚI + kho mặc định + license cho user, gắn vào customer.
// Lưu ý: với yêu cầu mua thêm, mỗi chi nhánh khách yêu cầu đều là branch MỚI
// (không tái sử dụng branch "Cửa hàng chính" đã có như luồng đăng ký lần đầu).
async function createBranchAndLicense(
  sql: ReturnType<typeof getSql>,
  opts: {
    ownerUserId: string;
    appCode: string;
    branchName: string;
    phone?: string;
    address?: string;
    plan: string;
    now: Date;
  },
) {
  const { ownerUserId, appCode, branchName, phone, address, plan, now } = opts;

  let customer: any = null;
  const custRows = await sql`
    SELECT id, name FROM customers WHERE owner_user_id = ${ownerUserId} ORDER BY created_at ASC LIMIT 1
  `;
  customer = custRows[0];

  if (!customer) {
    const code = 'C' + String(Date.now()).slice(-6);
    const created = await sql`
      INSERT INTO customers (customer_code, owner_user_id, name, phone, approval_status, registration_plan, active)
      VALUES (${code}, ${ownerUserId}, ${branchName}, ${phone || ''}, 'approved', 'free_trial', true)
      RETURNING *
    `;
    customer = created[0];
  } else {
    // Nếu customer chưa active/duyệt thì duyệt luôn.
    if (customer.active === false || customer.approval_status === 'pending') {
      await sql`UPDATE customers SET active = true, approval_status = 'approved' WHERE id = ${customer.id}`;
    }
  }

  const countRows = await sql`
    SELECT COUNT(*)::int AS n FROM branches WHERE customer_id = ${customer.id}
  `;
  const n = countRows[0]?.n ?? 0;
  const branchCode = 'B' + String(n + 1).padStart(3, '0');
  const created = await sql`
    INSERT INTO branches (customer_id, branch_code, name, phone, address, app_code, is_default)
    VALUES (${customer.id}, ${branchCode}, ${branchName}, ${phone || ''}, ${address || ''}, ${appCode}, false)
    RETURNING *
  `;
  const branch = created[0];

  await ensureDefaultWarehouse(sql, {
    customerId: customer.id,
    branchId: branch.id,
    branchName: branch.name,
  });

  // Tính ngày hết hạn theo gói admin chọn.
  const planDef = getPlan(plan);
  let expiresAt: Date | null = null;
  let status = 'active';
  if (plan === 'trial') {
    expiresAt = new Date(now.getTime() + STORE_TRIAL_DAYS * 24 * 60 * 60 * 1000);
  } else if (plan === 'yearly') {
    expiresAt = new Date(now.getTime() + 365 * 24 * 60 * 60 * 1000);
  } else {
    // forever: expires_at = null
    expiresAt = null;
  }

  await sql`
    INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at, branch_id)
    VALUES (${ownerUserId}, ${appCode}, '', ${plan}, ${status}, ${now.toISOString()}, ${
      expiresAt ? expiresAt.toISOString() : null
    }, ${branch.id})
    ON CONFLICT (user_id, branch_id, device_id) WHERE branch_id IS NOT NULL DO UPDATE SET
      plan = ${plan}, status = 'active', started_at = ${now.toISOString()}, expires_at = ${
        expiresAt ? expiresAt.toISOString() : null
      }
  `;

  return { customer, branch, expiresAt };
}

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

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

// POST (admin): action = 'approve' | 'reject'. body: { action, plan?, note? }
// Khi approve: tạo/duyệt branch + license + quyền Manager theo payload của request.
export async function POST(
  req: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const { id } = await params;

  try {
    const body = await req.json();
    const action = body.action;
    if (action !== 'approve' && action !== 'reject') {
      return NextResponse.json({ error: 'Thiếu action (approve/reject)' }, { status: 400, headers: corsHeaders() });
    }

    const [reqRow] = await sql`SELECT * FROM addon_requests WHERE id = ${id}`;
    if (!reqRow) {
      return NextResponse.json({ error: 'Không tìm thấy yêu cầu' }, { status: 404, headers: corsHeaders() });
    }
    if (reqRow.status !== 'pending') {
      return NextResponse.json({ error: 'Yêu cầu đã được xử lý' }, { status: 409, headers: corsHeaders() });
    }

    const now = new Date();
    let result: any = null;

    if (action === 'reject') {
      await sql`
        UPDATE addon_requests SET status = 'rejected', resolved_at = ${now.toISOString()}, resolved_by = ${admin.email}, note = ${
          body.note || ''
        }
        WHERE id = ${id}
      `;
    } else {
      const plan = body.plan || 'trial';
      const planDef = getPlan(plan);
      let payload: { modules: { app_code: string; branches: { name?: string; phone?: string; address?: string }[] }[] };
      try {
        payload = typeof reqRow.payload === 'string' ? JSON.parse(reqRow.payload) : reqRow.payload;
      } catch {
        payload = { modules: [] };
      }

      const createdModules: { app_code: string; branches: string[]; plan: string; expires_at: string | null }[] = [];

      for (const m of payload.modules || []) {
        const code = String(m.app_code || '').trim();
        if (!code) continue;
        const branches = (m.branches && m.branches.length > 0 ? m.branches : [{ name: '' }]) as { name?: string; phone?: string; address?: string }[];
        const storeName = reqRow.store_name || 'Cửa hàng';
        const branchNames = branches
          .map((b, idx) => (b && b.name && String(b.name).trim() ? String(b.name).trim() : `${storeName} ${idx + 1}`))
          .filter((n: string, i: number, arr: string[]) => arr.indexOf(n) === i);

        const createdBranchNames: string[] = [];
        let expiresAt: Date | null = null;
        for (let idx = 0; idx < branchNames.length; idx += 1) {
          const br = branches[idx] || {};
          const res = await createBranchAndLicense(sql, {
            ownerUserId: reqRow.user_id,
            appCode: code,
            branchName: branchNames[idx],
            phone: br.phone ? String(br.phone) : '',
            address: br.address ? String(br.address) : '',
            plan,
            now,
          });
          expiresAt = res.expiresAt;
          createdBranchNames.push(res.branch.name);
        }

        await grantManager(sql, reqRow.user_id, code);

        createdModules.push({
          app_code: code,
          branches: createdBranchNames,
          plan: planDef.key,
          expires_at: expiresAt ? expiresAt.toISOString() : null,
        });
      }

      await sql`
        UPDATE addon_requests SET status = 'approved', plan = ${plan}, resolved_at = ${now.toISOString()}, resolved_by = ${
          admin.email
        }, note = ${body.note || ''}
        WHERE id = ${id}
      `;

      result = { modules: createdModules };
    }

    return NextResponse.json(
      { ok: true, action, plan: action === 'approve' ? (body.plan || 'trial') : null, modules: result?.modules || [] },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json({ error: 'Lỗi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}
