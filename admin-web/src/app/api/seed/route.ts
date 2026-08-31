import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { hashPassword } from '@/lib/auth';

const SEED_SECRET = process.env.SEED_SECRET || 'kanposvn_seed_2026';

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

export async function POST(req: NextRequest) {
  try {
    const sql = getSql();
    const { secret } = await req.json();

    if (secret !== SEED_SECRET) {
      return NextResponse.json({ error: 'Sai secret key' }, { status: 403, headers: corsHeaders() });
    }

    const results: string[] = [];

    await sql`DROP TABLE IF EXISTS user_permissions CASCADE`;
    await sql`DROP TABLE IF EXISTS role_permissions CASCADE`;
    await sql`DROP TABLE IF EXISTS audit_logs CASCADE`;
    await sql`DROP TABLE IF EXISTS users CASCADE`;
    await sql`DROP TABLE IF EXISTS apps CASCADE`;
    await sql`DROP TABLE IF EXISTS roles CASCADE`;
    results.push('Dropped old tables');

    await sql`
      CREATE TABLE IF NOT EXISTS users (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        email VARCHAR(255) UNIQUE NOT NULL,
        password_hash VARCHAR(255) NOT NULL,
        full_name VARCHAR(255) DEFAULT '',
        active BOOLEAN DEFAULT true,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
        last_login TIMESTAMP WITH TIME ZONE,
        role VARCHAR(50) DEFAULT 'user',
        status VARCHAR(50) DEFAULT 'active',
        shop_name VARCHAR(255) DEFAULT '',
        shop_address VARCHAR(255) DEFAULT '',
        shop_phone VARCHAR(50) DEFAULT '',
        cccd VARCHAR(50) DEFAULT '',
        phone VARCHAR(20) DEFAULT '',
        birth_year INTEGER DEFAULT NULL,
        subscription_plan VARCHAR(50) DEFAULT '',
        subscription_start TIMESTAMP WITH TIME ZONE,
        subscription_end TIMESTAMP WITH TIME ZONE
      )
    `;
    results.push('Table users ready');

    await sql`
      CREATE TABLE IF NOT EXISTS apps (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        app_code VARCHAR(100) UNIQUE NOT NULL,
        app_name VARCHAR(255) NOT NULL,
        description TEXT DEFAULT '',
        package_name VARCHAR(255) DEFAULT '',
        app_url VARCHAR(500) DEFAULT '',
        platform VARCHAR(50) DEFAULT 'flutter',
        created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
      )
    `;
    results.push('Table apps ready');

    await sql`
      CREATE TABLE IF NOT EXISTS roles (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        role_name VARCHAR(100) UNIQUE NOT NULL
      )
    `;
    results.push('Table roles ready');

    await sql`
      CREATE TABLE IF NOT EXISTS user_permissions (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        user_id UUID REFERENCES users(id) ON DELETE CASCADE,
        app_id UUID REFERENCES apps(id) ON DELETE CASCADE,
        role_id UUID REFERENCES roles(id) ON DELETE CASCADE,
        can_login BOOLEAN DEFAULT true,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
        UNIQUE(user_id, app_id)
      )
    `;
    results.push('Table user_permissions ready');

    await sql`
      CREATE TABLE IF NOT EXISTS audit_logs (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        user_name VARCHAR(255),
        action VARCHAR(255),
        module VARCHAR(255),
        details TEXT,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
      )
    `;
    results.push('Table audit_logs ready');

    await sql`
      CREATE TABLE IF NOT EXISTS role_permissions (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        app_id UUID REFERENCES apps(id) ON DELETE CASCADE,
        role_id UUID REFERENCES roles(id) ON DELETE CASCADE,
        can_view BOOLEAN DEFAULT true,
        can_edit BOOLEAN DEFAULT false,
        can_delete BOOLEAN DEFAULT false,
        UNIQUE(app_id, role_id)
      )
    `;
    results.push('Table role_permissions ready');

    const seedRoles = ['Admin', 'Manager', 'Staff', 'User', 'HR Manager', 'Employee'];
    for (const r of seedRoles) {
      await sql`INSERT INTO roles (role_name) VALUES (${r}) ON CONFLICT (role_name) DO NOTHING`;
    }
    results.push('Roles seeded: ' + seedRoles.join(', '));

    const seedApps = [
      { code: 'kannhathuoc', name: 'Nha Thuoc', desc: 'Ung dung quan ly kho thuoc', pkg: '', plat: 'flutter' },
      { code: 'kancafetrasua', name: 'Cafe & Tra Sua', desc: 'Quan ly cafe va tra sua', pkg: '', plat: 'flutter' },
      { code: 'nhansu', name: 'Nhan Su', desc: 'Ung dung quan ly nhan su va tien luong', pkg: '', plat: 'flutter' },
      { code: 'vlxd', name: 'VLXD', desc: 'Quan ly vat lieu xay dung', pkg: '', plat: 'flutter' },
      { code: 'kanposvncafe', name: 'KanPosVN Cafe (Isar+Neon)', desc: 'Quan ly cafe - phien ban Isar+Neon', pkg: '', plat: 'flutter' },
      { code: 'kanhot_one', name: 'KHACH SAN THIEN NHIEN', desc: 'Khach san - nha hang', pkg: '', plat: 'flutter' },
      { code: 'KANCAFE_ONE', name: 'CAFE - KANCAFE_ONE', desc: 'Quan ly cafe - KANCAFE_ONE', pkg: '', plat: 'flutter' },
      { code: 'kanposvnvideocall', name: 'KanPosVN Video Call / Chat', desc: 'Nhan tin va goi video truc tuyen', pkg: '', plat: 'flutter' },
      { code: 'kanposvnairbook', name: 'KanPosVN AirBook', desc: 'Dat ve may bay - tim chuyen bay', pkg: '', plat: 'flutter' },
      { code: 'kanposvntruyenthong', name: 'KanPosVN Truyen Thong', desc: 'Quan ly sap cho rau cu qua', pkg: '', plat: 'flutter' },
      { code: 'kanposvndoichieuketoan', name: 'KanPosVN Doi Chieu Ke Toan', desc: 'Doi chieu so sach ke toan giua cac file Excel/CSV', pkg: '', plat: 'flutter' },
    ];
    for (const a of seedApps) {
      await sql`
        INSERT INTO apps (app_code, app_name, description, package_name, platform)
        VALUES (${a.code}, ${a.name}, ${a.desc}, ${a.pkg}, ${a.plat})
        ON CONFLICT (app_code) DO UPDATE SET app_name = ${a.name}, package_name = ${a.pkg}
      `;
    }
    results.push('Apps seeded: ' + seedApps.map(a => a.code).join(', '));

    for (const a of seedApps) {
      const app = await sql`SELECT id FROM apps WHERE app_code = ${a.code}`;
      if (app.length === 0) continue;
      const allRoles = await sql`SELECT id, role_name FROM roles`;
      for (const r of allRoles) {
        const isAdmin = r.role_name === 'Admin';
        await sql`
          INSERT INTO role_permissions (app_id, role_id, can_view, can_edit, can_delete)
          VALUES (${app[0].id}, ${r.id}, true, ${isAdmin}, ${isAdmin})
          ON CONFLICT (app_id, role_id) DO NOTHING
        `;
      }
    }
    results.push('Role permissions seeded');

    const seedUsers = [
      { email: 'admin@kanposvn.com', password: 'admin123', name: 'Admin KanPosVN' },
      { email: 'user@kanposvn.com', password: 'user123', name: 'User KanPosVN' },
      { email: 'user@nhansu.com', password: 'nhansu123', name: 'User Nhan Su' },
      { email: 'admin@nhansu.com', password: 'admin123', name: 'Admin Nhan Su' },
      { email: 'admin@kancafetrasua.com', password: 'admin123', name: 'Admin Cafe Tra Sua', apps: ['kancafetrasua'], role: 'Admin' },
      { email: 'user@kancafetrasua.com', password: 'cafe123', name: 'User Cafe Tra Sua', apps: ['kancafetrasua'], role: 'Staff' },
      { email: 'user@kannhathuoc.com', password: '123456', name: 'User Nha Thuoc', apps: ['kannhathuoc'], role: 'Staff' },
      { email: 'admin@kannhathuoc.com', password: 'admin123', name: 'Admin Nha Thuoc', apps: ['kannhathuoc'], role: 'Admin' },
      { email: 'admin@kanposvncafe.com', password: 'admin123', name: 'Admin KanPosVN Cafe', apps: ['kanposvncafe'], role: 'Admin' },
      { email: 'user@kanposvncafe.com', password: 'cafe123', name: 'User KanPosVN Cafe', apps: ['kanposvncafe'], role: 'Staff' },
    ];

    const hrApp = await sql`SELECT id FROM apps WHERE app_code = 'nhansu'`;
    const allApps = await sql`SELECT id, app_code FROM apps`;
    const employeeRole = await sql`SELECT id FROM roles WHERE role_name = 'Employee'`;
    const adminRole = await sql`SELECT id FROM roles WHERE role_name = 'Admin'`;
    const userRole = await sql`SELECT id FROM roles WHERE role_name = 'User'`;
    const staffRole = await sql`SELECT id FROM roles WHERE role_name = 'Staff'`;

    for (const u of seedUsers) {
      const existing = await sql`SELECT id FROM users WHERE email = ${u.email}`;
      if (existing.length > 0) {
        results.push(`${u.email}: already exists, checking permissions...`);

        // Admin users get Admin role on all apps
        if (u.email.startsWith('admin')) {
          for (const app of allApps) {
            const hasPerm = await sql`SELECT id FROM user_permissions WHERE user_id = ${existing[0].id} AND app_id = ${app.id}`;
            if (hasPerm.length === 0 && adminRole.length > 0) {
              await sql`INSERT INTO user_permissions (user_id, app_id, role_id, can_login) VALUES (${existing[0].id}, ${app.id}, ${adminRole[0].id}, true)`;
              results.push(`${u.email}: granted ${app.app_code} as Admin`);
            }
          }
        }
        continue;
      }

      const hash = await hashPassword(u.password);
      const [newUser] = await sql`
        INSERT INTO users (email, password_hash, full_name, active)
        VALUES (${u.email}, ${hash}, ${u.name}, true)
        RETURNING id
      `;
      results.push(`${u.email}: created`);

      // Users with specific apps and role
      if ((u as any).apps && (u as any).role) {
        const targetRole = (u as any).role === 'Admin' ? adminRole : staffRole;
        for (const appCode of (u as any).apps) {
          const targetApp = allApps.find((a: any) => a.app_code === appCode);
          if (targetApp && targetRole.length > 0) {
            await sql`INSERT INTO user_permissions (user_id, app_id, role_id, can_login) VALUES (${newUser.id}, ${targetApp.id}, ${targetRole[0].id}, true)`;
            results.push(`${u.email}: granted ${appCode} as ${(u as any).role}`);
          }
        }
      } else if (u.email.startsWith('admin')) {
        // Admin users get Admin role on ALL apps
        for (const app of allApps) {
          if (adminRole.length > 0) {
            await sql`INSERT INTO user_permissions (user_id, app_id, role_id, can_login) VALUES (${newUser.id}, ${app.id}, ${adminRole[0].id}, true)`;
            results.push(`${u.email}: granted ${app.app_code} as Admin`);
          }
        }
      } else {
        // Regular users get Employee/User role on nhansu + kannhathuoc
        if (hrApp.length > 0 && employeeRole.length > 0) {
          await sql`INSERT INTO user_permissions (user_id, app_id, role_id, can_login) VALUES (${newUser.id}, ${hrApp[0].id}, ${employeeRole[0].id}, true)`;
          results.push(`${u.email}: granted nhansu as Employee`);
        }
        const nhaThuoc = allApps.find((a: any) => a.app_code === 'kannhathuoc');
        if (nhaThuoc && userRole.length > 0) {
          await sql`INSERT INTO user_permissions (user_id, app_id, role_id, can_login) VALUES (${newUser.id}, ${nhaThuoc.id}, ${userRole[0].id}, true)`;
          results.push(`${u.email}: granted kannhathuoc as User`);
        }
      }
    }

    // Owner KANHOT: đảm bảo user + quyền Admin trên app kanhot_one
    // (re-seed an toàn: user đã tồn tại thì chỉ cập nhật permission).
    const ownerEmail = '0908567567@kanposvn.local';
    const ownerPhone = '0908567567';
    const ownerPassword = '123456';
    let ownerUser = await sql`SELECT id FROM users WHERE email = ${ownerEmail}`;
    if (ownerUser.length === 0) {
      const ownerHash = await hashPassword(ownerPassword);
      ownerUser = await sql`
        INSERT INTO users (email, password_hash, full_name, active, role, phone)
        VALUES (${ownerEmail}, ${ownerHash}, 'Owner KANHOT', true, 'admin', ${ownerPhone})
        RETURNING id
      `;
      results.push(`${ownerEmail}: created`);
    } else {
      results.push(`${ownerEmail}: already exists, checking permissions...`);
    }
    const hotApp = await sql`SELECT id FROM apps WHERE app_code = 'kanhot_one'`;
    if (hotApp.length > 0 && adminRole.length > 0) {
      await sql`
        INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
        VALUES (${ownerUser[0].id}, ${hotApp[0].id}, ${adminRole[0].id}, true)
        ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${adminRole[0].id}, can_login = true
      `;
      results.push(`${ownerEmail}: granted kanhot_one as Admin (Owner)`);
    }

    // Owner KANCAFE: đảm bảo quyền Admin trên app KANCAFE_ONE cho cùng owner
    const cafeApp = await sql`SELECT id FROM apps WHERE app_code = 'KANCAFE_ONE'`;
    if (cafeApp.length > 0 && adminRole.length > 0) {
      await sql`
        INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
        VALUES (${ownerUser[0].id}, ${cafeApp[0].id}, ${adminRole[0].id}, true)
        ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${adminRole[0].id}, can_login = true
      `;
      results.push(`${ownerEmail}: granted KANCAFE_ONE as Admin (Owner)`);
    }

    // Owner kanposvnvideocall: đảm bảo quyền Admin trên app kanposvnvideocall cho cùng owner
    const videocallApp = await sql`SELECT id FROM apps WHERE app_code = 'kanposvnvideocall'`;
    if (videocallApp.length > 0 && adminRole.length > 0) {
      await sql`
        INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
        VALUES (${ownerUser[0].id}, ${videocallApp[0].id}, ${adminRole[0].id}, true)
        ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${adminRole[0].id}, can_login = true
      `;
      results.push(`${ownerEmail}: granted kanposvnvideocall as Admin (Owner)`);
    }

    // Owner kanposvnairbook: đảm bảo quyền Admin trên app kanposvnairbook cho cùng owner
    const airbookApp = await sql`SELECT id FROM apps WHERE app_code = 'kanposvnairbook'`;
    if (airbookApp.length > 0 && adminRole.length > 0) {
      await sql`
        INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
        VALUES (${ownerUser[0].id}, ${airbookApp[0].id}, ${adminRole[0].id}, true)
        ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${adminRole[0].id}, can_login = true
      `;
      results.push(`${ownerEmail}: granted kanposvnairbook as Admin (Owner)`);
    }

    // Owner kanposvntruyenthong: đảm bảo quyền Admin trên app kanposvntruyenthong cho cùng owner
    const truyenthongApp = await sql`SELECT id FROM apps WHERE app_code = 'kanposvntruyenthong'`;
    if (truyenthongApp.length > 0 && adminRole.length > 0) {
      await sql`
        INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
        VALUES (${ownerUser[0].id}, ${truyenthongApp[0].id}, ${adminRole[0].id}, true)
        ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${adminRole[0].id}, can_login = true
      `;
      results.push(`${ownerEmail}: granted kanposvntruyenthong as Admin (Owner)`);
    }

    // Owner kanposvndoichieuketoan: đảm bảo quyền Admin trên app kanposvndoichieuketoan cho cùng owner
    const doichieuketoanApp = await sql`SELECT id FROM apps WHERE app_code = 'kanposvndoichieuketoan'`;
    if (doichieuketoanApp.length > 0 && adminRole.length > 0) {
      await sql`
        INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
        VALUES (${ownerUser[0].id}, ${doichieuketoanApp[0].id}, ${adminRole[0].id}, true)
        ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${adminRole[0].id}, can_login = true
      `;
      results.push(`${ownerEmail}: granted kanposvndoichieuketoan as Admin (Owner)`);
    }

    return NextResponse.json({ ok: true, results }, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json({ error: String(e) }, { status: 500, headers: corsHeaders() });
  }
}
