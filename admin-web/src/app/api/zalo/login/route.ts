import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { getPlan } from '@/lib/pricing';
import { hashPassword } from '@/lib/auth';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

// POST /api/zalo/login
// Body: { zalo_id, name?, phone?, avatar?, app_code? }
// Response: { user, licenses: [...], apps: [...] }
export async function POST(req: NextRequest) {
  const sql = getSql();
  try {
    const body = await req.json();
    const { zalo_id, name, phone, avatar, app_code: trialAppCode } = body;

    if (!zalo_id) {
      return NextResponse.json({ error: 'Thieu zalo_id' }, { status: 400, headers: corsHeaders() });
    }

    // 1. Tim user theo zalo_id
    let userRows = await sql`SELECT * FROM users WHERE zalo_id = ${String(zalo_id)}`;
    let user = userRows[0];
    let isNew = false;

    // Fix user cu co password placeholder
    if (user && user.password_hash === 'zalo_sso_no_password') {
      const newHash = await hashPassword('kanpos123');
      await sql`UPDATE users SET password_hash = ${newHash} WHERE id = ${user.id}`;
      user.password_hash = newHash;
    }

    if (!user) {
      // 2. Tao tai khoan moi (trial)
      isNew = true;
      const email = `zalo_${zalo_id}@kanposvn.mini`;
      const defaultPassword = 'kanpos123';
      const passwordHash = await hashPassword(defaultPassword);
      const fullName = name || `Khach Zalo ${String(zalo_id).slice(-4)}`;

      const created = await sql`
        INSERT INTO users (email, password_hash, full_name, phone, zalo_id, active)
        VALUES (${email}, ${passwordHash}, ${fullName}, ${phone || ''}, ${String(zalo_id)}, true)
        RETURNING *
      `;
      user = created[0];

      // 3. Tao license trial cho cac app co show_in_registration = true
      const visibleApps = await sql`SELECT app_code FROM apps WHERE show_in_registration = true`;
      const moduleCodes = visibleApps.map((a: any) => a.app_code);

      for (const appCode of moduleCodes) {
        // Dam bao app ton tai trong bang apps
        const appRows = await sql`SELECT id FROM apps WHERE app_code = ${appCode}`;
        if (appRows.length === 0) {
          await sql`
            INSERT INTO apps (app_code, app_name, description, platform)
            VALUES (${appCode}, ${appCode}, ${'Auto-created for zalo user'}, 'flutter')
          `;
        }

        // Tao license trial 7 ngay
        const now = new Date();
        const expiresAt = new Date(now.getTime() + 7 * 24 * 60 * 60 * 1000);
        const [app] = await sql`SELECT id FROM apps WHERE app_code = ${appCode}`;

        const licRows = await sql`
          INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at)
          VALUES (${user.id}, ${appCode}, '', 'trial', 'active', ${now.toISOString()}, ${expiresAt.toISOString()})
          ON CONFLICT DO NOTHING
          RETURNING *
        `;

        // Tao customer + branch mac dinh neu chua co
        if (licRows.length > 0) {
          // Customer
          let custRows = await sql`SELECT * FROM customers WHERE owner_user_id = ${user.id} ORDER BY id ASC LIMIT 1`;
          if (custRows.length === 0) {
            const code = 'C' + String(Date.now()).slice(-6);
            custRows = await sql`
              INSERT INTO customers (customer_code, owner_user_id, name, phone)
              VALUES (${code}, ${user.id}, ${fullName}, ${phone || ''})
              RETURNING *
            `;
          }
          const customer = custRows[0];

          // Branch mac dinh
          let branchRows = await sql`
            SELECT * FROM branches WHERE customer_id = ${customer.id} AND app_code = ${appCode} ORDER BY id ASC LIMIT 1
          `;
          if (branchRows.length === 0) {
            const countRows = await sql`SELECT COUNT(*)::int AS n FROM branches WHERE customer_id = ${customer.id}`;
            const n = countRows[0]?.n ?? 0;
            branchRows = await sql`
              INSERT INTO branches (customer_id, branch_code, name, app_code, is_default)
              VALUES (${customer.id}, ${'B' + String(n + 1).padStart(3, '0')}, 'Cua hang chinh', ${appCode}, ${n === 0})
              RETURNING *
            `;
            // Gan license vao branch
            await sql`UPDATE licenses SET branch_id = ${branchRows[0].id} WHERE id = ${licRows[0].id}`;
          }

          // Gán quyền user cho app
          if (app) {
            const [adminRole] = await sql`SELECT id FROM roles WHERE role_name = 'Admin'`;
            if (adminRole) {
              await sql`
                INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
                VALUES (${user.id}, ${app.id}, ${adminRole.id}, true)
                ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${adminRole.id}, can_login = true
              `;
            }
          }
        }
      }
    }

    // 5b. Tao trial cho 1 app cu the neu co app_code
    if (trialAppCode) {
      const appRows = await sql`SELECT id FROM apps WHERE app_code = ${trialAppCode}`;
      if (appRows.length === 0) {
        await sql`
          INSERT INTO apps (app_code, app_name, description, platform)
          VALUES (${trialAppCode}, ${trialAppCode}, ${'Auto-created for zalo user'}, 'flutter')
        `;
      }
      const [app] = await sql`SELECT id FROM apps WHERE app_code = ${trialAppCode}`;
      const now = new Date();
      const expiresAt = new Date(now.getTime() + 7 * 24 * 60 * 60 * 1000);
      const licRows = await sql`
        INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at)
        VALUES (${user.id}, ${trialAppCode}, '', 'trial', 'active', ${now.toISOString()}, ${expiresAt.toISOString()})
        ON CONFLICT DO NOTHING
        RETURNING *
      `;
      if (licRows.length > 0) {
        let custRows = await sql`SELECT * FROM customers WHERE owner_user_id = ${user.id} ORDER BY id ASC LIMIT 1`;
        if (custRows.length === 0) {
          const code = 'C' + String(Date.now()).slice(-6);
          custRows = await sql`
            INSERT INTO customers (customer_code, owner_user_id, name, phone)
            VALUES (${code}, ${user.id}, ${user.full_name}, ${user.phone || ''})
            RETURNING *
          `;
        }
        const customer = custRows[0];
        let branchRows = await sql`
          SELECT * FROM branches WHERE customer_id = ${customer.id} AND app_code = ${trialAppCode} ORDER BY id ASC LIMIT 1
        `;
        if (branchRows.length === 0) {
          const countRows = await sql`SELECT COUNT(*)::int AS n FROM branches WHERE customer_id = ${customer.id}`;
          const n = countRows[0]?.n ?? 0;
          branchRows = await sql`
            INSERT INTO branches (customer_id, branch_code, name, app_code, is_default)
            VALUES (${customer.id}, ${'B' + String(n + 1).padStart(3, '0')}, 'Cua hang chinh', ${trialAppCode}, ${n === 0})
            RETURNING *
          `;
          await sql`UPDATE licenses SET branch_id = ${branchRows[0].id} WHERE id = ${licRows[0].id}`;
        }
        if (app) {
          const [adminRole] = await sql`SELECT id FROM roles WHERE role_name = 'Admin'`;
          if (adminRole) {
            await sql`
              INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
              VALUES (${user.id}, ${app.id}, ${adminRole.id}, true)
              ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${adminRole.id}, can_login = true
            `;
          }
        }
      }
    }

    // 6. Lay danh sach apps ma user co quyen (qua user_permissions)
    const apps = await sql`
      SELECT DISTINCT a.app_code, a.app_name
      FROM apps a
      JOIN user_permissions up ON up.app_id = a.id
      WHERE up.user_id = ${user.id} AND up.can_login = true
      ORDER BY a.app_code
    `;

    // 5. Lay branches + license cho moi app
    const appsWithDetails = [];
    for (const app of apps) {
      // Branches
      const branches = await sql`
        SELECT b.id, b.branch_code, b.name, b.phone, b.address, b.app_code, b.is_default
        FROM branches b
        JOIN customers c ON c.id = b.customer_id
        WHERE c.owner_user_id = ${user.id} AND b.app_code = ${app.app_code} AND b.active = true
        ORDER BY b.is_default DESC, b.id ASC
      `;

      // License gan nhat
      const licRows = await sql`
        SELECT plan, status, expires_at
        FROM licenses
        WHERE user_id = ${user.id} AND app_code = ${app.app_code} AND device_id = ''
        ORDER BY started_at DESC LIMIT 1
      `;
      const license = licRows[0] || null;

      appsWithDetails.push({
        app_code: app.app_code,
        app_name: app.app_name,
        branches: branches.map((b: any) => ({
          id: b.id,
          branch_code: b.branch_code,
          name: b.name,
          phone: b.phone,
          address: b.address,
          is_default: b.is_default === true,
        })),
        license,
      });
    }

    // Lay licenses cua user
    const allLicenses = await sql`
      SELECT l.id, l.app_code, a.app_name, l.plan, l.status, l.started_at, l.expires_at, l.branch_id
      FROM licenses l
      LEFT JOIN apps a ON a.app_code = l.app_code
      WHERE l.user_id = ${user.id} AND l.device_id = ''
      ORDER BY l.started_at DESC
    `;

    return NextResponse.json(
      {
        user: {
          id: user.id,
          full_name: user.full_name,
          phone: user.phone,
          zalo_id: user.zalo_id,
        },
        is_new: isNew,
        licenses: allLicenses.map((l: any) => ({
          id: l.id,
          app_code: l.app_code,
          app_name: l.app_name || l.app_code,
          plan: l.plan,
          status: l.status,
          started_at: l.started_at,
          expires_at: l.expires_at,
          branch_id: l.branch_id,
        })),
        apps: appsWithDetails,
      },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json(
      { error: 'Loi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
