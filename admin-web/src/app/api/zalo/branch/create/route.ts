import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
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

// POST /api/zalo/branch/create
// Body: { zalo_id, app_code, branch_name?, phone?, address? }
// Zalo owner them 1 chi nhanh (chi nhanh mua them) cho module dang duoc phep dung.
// Mo hinh giong web: moi chi nhanh co kho mac dinh + license trial 7 ngay rieng.
export async function POST(req: NextRequest) {
  const sql = getSql();
  try {
    const body = await req.json();
    const { zalo_id, app_code, branch_name, phone, address } = body;

    if (!zalo_id || !app_code) {
      return NextResponse.json(
        { error: 'Thieu zalo_id hoac app_code' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const [user] = await sql`SELECT id, full_name, phone, zalo_id FROM users WHERE zalo_id = ${String(zalo_id)}`;
    if (!user) {
      return NextResponse.json({ error: 'Khong tim thay tai khoan Zalo' }, { status: 404, headers: corsHeaders() });
    }

    // App phai ton tai (hoac thuoc danh sach STORE_MODULES) de license/check hoat dong.
    let appRows = await sql`SELECT id, app_name FROM apps WHERE app_code = ${app_code}`;
    if (appRows.length === 0) {
      const fallback = STORE_MODULES.find((m: { app_code: string }) => m.app_code === app_code);
      await sql`
        INSERT INTO apps (app_code, app_name, description, platform)
        VALUES (${app_code}, ${fallback?.name || app_code}, ${'Chi nhanh: ' + (branch_name || app_code)}, 'flutter')
      `;
      appRows = await sql`SELECT id, app_name FROM apps WHERE app_code = ${app_code}`;
    }
    const [app] = appRows;

    // Tim customer chinh cua user.
    const custRows = await sql`
      SELECT id, owner_user_id FROM customers WHERE owner_user_id = ${user.id} ORDER BY created_at ASC LIMIT 1
    `;
    if (custRows.length === 0) {
      return NextResponse.json({ error: 'Khong tim thay thong tin khach hang' }, { status: 404, headers: corsHeaders() });
    }
    const customer = custRows[0];

    const now = new Date();
    const name = (branch_name && String(branch_name).trim()) || `${app.app_name || app_code} chi nhanh`;
    const countRows = await sql`SELECT COUNT(*)::int AS n FROM branches WHERE customer_id = ${customer.id}`;
    const n = countRows[0]?.n ?? 0;

    const [branch] = await sql`
      INSERT INTO branches (customer_id, branch_code, name, phone, address, app_code, is_default)
      VALUES (${customer.id}, ${'B' + String(n + 1).padStart(3, '0')}, ${name}, ${phone || user.phone || ''}, ${address || ''}, ${app_code}, false)
      RETURNING *
    `;

    // Kho mac dinh cho chi nhanh (migration 017).
    await ensureDefaultWarehouse(sql, {
      customerId: customer.id,
      branchId: branch.id,
      branchName: name,
    });

    // License trial 7 ngay cho chi nhanh (1 license / branch, device_id = '').
    const expiresAt = new Date(now.getTime() + STORE_TRIAL_DAYS * 24 * 60 * 60 * 1000);
    await sql`
      INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at, branch_id)
      VALUES (${user.id}, ${app_code}, '', 'trial', 'active', ${now.toISOString()}, ${expiresAt.toISOString()}, ${branch.id})
      ON CONFLICT (user_id, branch_id, device_id) WHERE branch_id IS NOT NULL DO UPDATE SET
        plan = 'trial', status = 'active', started_at = ${now.toISOString()}, expires_at = ${expiresAt.toISOString()}
    `;

    // Cap nhat danh sach module dang ky (neu app chua co trong danh sach).
    const [mainCustomer] = await sql`SELECT id, registered_modules FROM customers WHERE id = ${customer.id}`;
    if (mainCustomer) {
      let regs: string[] = [];
      try {
        regs = Array.isArray(mainCustomer.registered_modules) ? mainCustomer.registered_modules : JSON.parse(mainCustomer.registered_modules || '[]');
      } catch {
        regs = [];
      }
      if (!regs.includes(app_code)) {
        regs.push(app_code);
        await sql`UPDATE customers SET registered_modules = ${JSON.stringify(regs)} WHERE id = ${customer.id}`;
      }
    }

    // Owner duoc login vao app (quyen Manager mac dinh, khop zalo/login).
    const [managerRole] = await sql`SELECT id FROM roles WHERE role_name = 'Manager'`;
    if (managerRole) {
      await sql`
        INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
        VALUES (${user.id}, ${app.id}, ${managerRole.id}, true)
        ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${managerRole.id}, can_login = true
      `;
    }

    return NextResponse.json(
      {
        ok: true,
        message: 'Da them chi nhanh. Ban co 7 ngay dung thu.',
        branch: {
          id: branch.id,
          branch_code: branch.branch_code,
          name: branch.name,
          app_code: branch.app_code,
          is_default: false,
        },
        license: {
          plan: 'trial',
          status: 'active',
          started_at: now.toISOString(),
          expires_at: expiresAt.toISOString(),
        },
      },
      { status: 201, headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json(
      { error: 'Loi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
