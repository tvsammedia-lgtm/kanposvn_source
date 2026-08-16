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
  const [branch] = await sql`SELECT id, app_code FROM branches WHERE id = ${id}`;
  if (!branch) {
    return NextResponse.json({ error: 'Khong tim thay chi nhanh' }, { status: 404, headers: corsHeaders() });
  }

  const licenses = await sql`
    SELECT id, user_id, app_code, device_id, plan, status, started_at, expires_at, created_at
    FROM licenses WHERE app_code = ${branch.app_code}
    ORDER BY started_at DESC
  `;

  return NextResponse.json({ licenses }, { headers: corsHeaders() });
}

// POST /api/branches/[id]/license — cap hoac gia han license cho chi nhanh.
// Body: { user_id?, plan?, days? }
//   user_id: mac dinh = owner user cua khach hang.
//   plan: 'trial' | 'yearly' | 'forever' (dung getPlan). Mac dinh 'trial'.
//   days: so ngay tu 0 (gioi han khi co 'days' hoac tinh theo plan).
export async function POST(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const body = await req.json();

  const [branch] = await sql`
    SELECT b.id, b.app_code, b.name, c.owner_user_id
    FROM branches b
    JOIN customers c ON c.id = b.customer_id
    WHERE b.id = ${id}
  `;
  if (!branch) {
    return NextResponse.json({ error: 'Khong tim thay chi nhanh' }, { status: 404, headers: corsHeaders() });
  }

  const userId = body.user_id || String(branch.owner_user_id);
  const planKey = body.plan || 'trial';
  const planInfo = getPlan(planKey);
  const now = new Date();
  const days = Number(body.days) > 0 ? Number(body.days) : planInfo.days;
  const expiresAt = planInfo.forever ? null : new Date(now.getTime() + days * 24 * 60 * 60 * 1000);

  try {
    await sql`
      INSERT INTO licenses (user_id, app_code, device_id, plan, status, started_at, expires_at, branch_id)
      VALUES (${userId}, ${branch.app_code}, '', ${planKey}, 'active', ${now.toISOString()}, ${expiresAt?.toISOString() || null}, ${id})
      ON CONFLICT (user_id, app_code, device_id) DO UPDATE SET
        plan = ${planKey}, status = 'active', started_at = ${now.toISOString()}, expires_at = ${expiresAt?.toISOString() || null}
    `;

    await sql`
      INSERT INTO audit_logs (user_name, action, module, details)
      VALUES (${admin.email}, 'Cap license chi nhanh', 'Branches', ${'Cap license ' + planKey + ' cho chi nhanh: ' + String(branch.name) + ' (app: ' + String(branch.app_code) + ')'})
    `;

    return NextResponse.json(
      {
        ok: true,
        user_id: userId,
        app_code: branch.app_code,
        plan: planKey,
        status: 'active',
        expires_at: expiresAt?.toISOString() || null,
        forever: planInfo.forever || false,
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
