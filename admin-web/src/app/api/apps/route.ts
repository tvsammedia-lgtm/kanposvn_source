import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

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

export async function GET(req: NextRequest) {
  const sql = getSql();
  const registration = req.nextUrl.searchParams.get('registration') === '1';
  if (registration) {
    const apps = await sql`
      SELECT id, app_code, app_name, show_in_registration
      FROM apps
      WHERE show_in_registration = true
      ORDER BY app_name
    `;
    return NextResponse.json(apps, { headers: corsHeaders() });
  }
  const apps = await sql`
    SELECT id, app_code, app_name, description, package_name, app_url, platform, show_in_registration, created_at
    FROM apps ORDER BY app_name
  `;
  return NextResponse.json(apps, { headers: corsHeaders() });
}

export async function POST(req: NextRequest) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { app_code, app_name, description, package_name, app_url, platform } = await req.json();
  if (!app_code || !app_name) {
    return NextResponse.json({ error: 'app_code và app_name là bắt buộc' }, { status: 400, headers: corsHeaders() });
  }

  const existing = await sql`SELECT id FROM apps WHERE app_code = ${app_code}`;
  if (existing.length > 0) {
    return NextResponse.json({ error: 'app_code đã tồn tại' }, { status: 409, headers: corsHeaders() });
  }

  const result = await sql`
    INSERT INTO apps (app_code, app_name, description, package_name, app_url, platform)
    VALUES (${app_code}, ${app_name}, ${description || ''}, ${package_name || ''}, ${app_url || ''}, ${platform || 'flutter'})
    RETURNING id, app_code, app_name, description, package_name, app_url, platform, created_at
  `;

  await sql`
    INSERT INTO audit_logs (user_name, action, module, details)
    VALUES (${admin.email}, 'Tạo app mới', 'Apps', ${'Tạo app: ' + app_code})
  `;

  return NextResponse.json(result[0], { status: 201, headers: corsHeaders() });
}
