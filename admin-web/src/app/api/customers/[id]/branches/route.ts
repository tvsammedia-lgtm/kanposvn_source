import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { getPlan } from '@/lib/pricing';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

function getToken(req: NextRequest) {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try { return verifyToken(auth.split(' ')[1]); } catch { return null; }
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

export async function GET(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const user = getToken(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const [customer] = await sql`SELECT id, owner_user_id FROM customers WHERE id = ${id}`;
  if (!customer) {
    return NextResponse.json({ error: 'Khong tim thay khach hang' }, { status: 404, headers: corsHeaders() });
  }

  const branches = await sql`
    SELECT
      b.id, b.branch_code, b.name, b.phone, b.address, b.app_code, b.active, b.created_at,
      a.app_name,
      l.id AS license_id, l.plan, l.status AS license_status, l.started_at, l.expires_at
    FROM branches b
    LEFT JOIN apps a ON a.app_code = b.app_code
    LEFT JOIN licenses l ON l.branch_id = b.id AND l.user_id = ${customer.owner_user_id} AND l.device_id = ''
    WHERE b.customer_id = ${id}
    ORDER BY b.created_at ASC
  `;

  return NextResponse.json({ branches }, { headers: corsHeaders() });
}

export async function POST(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const body = await req.json();
  const { branch_code, name, phone, address, app_code, license_plan, license_days } = body;

  if (!name) {
    return NextResponse.json({ error: 'Ten chi nhanh la bat buoc' }, { status: 400, headers: corsHeaders() });
  }
  if (!app_code) {
    return NextResponse.json({ error: 'app_code cua chi nhanh la bat buoc' }, { status: 400, headers: corsHeaders() });
  }

  const [customer] = await sql`SELECT id, owner_user_id FROM customers WHERE id = ${id}`;
  if (!customer) {
    return NextResponse.json({ error: 'Khong tim thay khach hang' }, { status: 404, headers: corsHeaders() });
  }
  const ownerUserId: string = String(customer.owner_user_id);

  try {
    // Migration 015: 1 module (app_code) có thể có NHIỀU chi nhánh — bỏ check
    // "app_code đã được dùng bởi chi nhánh khác". Cùng 1 module được dùng bởi
    // nhiều chi nhánh của cùng customer (vd: CAFE-01, CAFE-02 cùng kanposvncafe).

    // Dam bao app_code ton tai trong bang apps (de license/check + owner/info hoat dong).
    const appRows = await sql`SELECT id FROM apps WHERE app_code = ${app_code}`;
    if (appRows.length === 0) {
      await sql`
        INSERT INTO apps (app_code, app_name, description, platform)
        VALUES (${app_code}, ${name}, ${'Chi nhanh: ' + name}, 'flutter')
      `;
    }
    const [app] = await sql`SELECT id FROM apps WHERE app_code = ${app_code}`;

    const result = await sql`
      INSERT INTO branches (customer_id, branch_code, name, phone, address, app_code)
      VALUES (${id}, ${branch_code || ''}, ${name}, ${phone || ''}, ${address || ''}, ${app_code})
      RETURNING *
    `;

    // Tao license cho owner user theo chi nhanh (1 branch = 1 license, device_id = '').
    const planKey = license_plan || 'trial';
    const planInfo = getPlan(planKey);
    const now = new Date();
    const days = Number(license_days) > 0 ? Number(license_days) : planInfo.days;
    const expiresAt = planInfo.forever ? null : new Date(now.getTime() + days * 24 * 60 * 60 * 1000);

    await sql`
      INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at, branch_id)
      VALUES (${ownerUserId}, ${app_code}, '', ${planKey}, 'active', ${now.toISOString()}, ${expiresAt?.toISOString() || null}, ${result[0].id})
      ON CONFLICT (user_id, branch_id, device_id) WHERE branch_id IS NOT NULL DO UPDATE SET
        plan = ${planKey}, status = 'active', started_at = ${now.toISOString()}, expires_at = ${expiresAt?.toISOString() || null}
    `;

    // Owner duoc login vao app cua chi nhanh (quyen Admin).
    const [adminRole] = await sql`SELECT id FROM roles WHERE role_name = 'Admin'`;
    if (adminRole) {
      await sql`
        INSERT INTO user_permissions (user_id, app_id, role_id, can_login)
        VALUES (${ownerUserId}, ${app.id}, ${adminRole.id}, true)
        ON CONFLICT (user_id, app_id) DO UPDATE SET role_id = ${adminRole.id}, can_login = true
      `;
    }

    await sql`
      INSERT INTO audit_logs (user_name, action, module, details)
      VALUES (${admin.email}, 'Tao chi nhanh', 'Branches', ${'Tao chi nhanh: ' + name + ' (app: ' + app_code + ') cho khach hang ' + id})
    `;

    return NextResponse.json(
      {
        ...result[0],
        license: {
          plan: planKey,
          status: 'active',
          expires_at: expiresAt?.toISOString() || null,
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
