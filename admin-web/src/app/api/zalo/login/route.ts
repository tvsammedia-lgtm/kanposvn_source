import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { getPlan } from '@/lib/pricing';

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
// Body: { zalo_id, name?, phone?, avatar? }
// Response: { user, apps: [{ app_code, app_name, branches: [...], license }] }
export async function POST(req: NextRequest) {
  const sql = getSql();
  try {
    const body = await req.json();
    const { zalo_id, name, phone, avatar } = body;

    if (!zalo_id) {
      return NextResponse.json({ error: 'Thieu zalo_id' }, { status: 400, headers: corsHeaders() });
    }

    // 1. Tim user theo zalo_id
    let userRows = await sql`SELECT * FROM users WHERE zalo_id = ${String(zalo_id)}`;
    let user = userRows[0];
    let isNew = false;

    if (!user) {
      // 2. Tao tai khoan moi (trial)
      isNew = true;
      const email = `zalo_${zalo_id}@kanposvn.mini`;
      const passwordHash = 'zalo_sso_no_password';
      const fullName = name || `Khach Zalo ${String(zalo_id).slice(-4)}`;

      const created = await sql`
        INSERT INTO users (email, password_hash, full_name, phone, zalo_id, active)
        VALUES (${email}, ${passwordHash}, ${fullName}, ${phone || ''}, ${String(zalo_id)}, true)
        RETURNING *
      `;
      user = created[0];

      // 3. Tao license trial cho TAT CA cac app trong STORE_MODULES
      const moduleCodes = [
        'kanposvncafe', 'kanposvnnhahangquanan', 'kanposvnnhathuoc',
        'kanposvnvlxd', 'kanposvngara', 'kanposvnbida', 'kanposvnspa',
        'kanposvnkhachsan', 'kanhot_one', 'kanposvnbanvevantai',
        'kanposvnqlcd', 'kanposvnnhatro200', 'kanposvnnbatdongsan', 'nhansu',
      ];

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
          VALUES (${user.id}, ${appCode}, 'zalo_trial', 'trial', 'active', ${now.toISOString()}, ${expiresAt.toISOString()})
          ON CONFLICT DO NOTHING
          RETURNING *
        `;

        // Tao customer + branch mac dinh neu chua co
        if (licRows.length > 0) {
          // Customer
          let custRows = await sql`SELECT * FROM customers WHERE owner_user_id = ${user.id} ORDER BY created_at ASC LIMIT 1`;
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
            SELECT * FROM branches WHERE customer_id = ${customer.id} AND app_code = ${appCode} ORDER BY created_at ASC LIMIT 1
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
                ON CONFLICT (user_id, app_id) DO UPDATE SET can_login = true
              `;
            }
          }
        }
      }
    }

    // 4. Lay danh sach apps ma user co quyen (qua user_permissions)
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
        ORDER BY b.is_default DESC, b.created_at ASC
      `;

      // License gan nhat
      const licRows = await sql`
        SELECT plan, status, expires_at
        FROM licenses
        WHERE user_id = ${user.id} AND app_code = ${app.app_code} AND device_id = 'zalo_trial'
        ORDER BY created_at DESC LIMIT 1
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

    return NextResponse.json(
      {
        user: {
          id: user.id,
          full_name: user.full_name,
          phone: user.phone,
          zalo_id: user.zalo_id,
        },
        is_new: isNew,
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
