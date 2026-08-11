import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { STORE_MODULES } from '@/lib/pricing';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

function getAdmin(req: NextRequest) {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try {
    return verifyToken(auth.split(' ')[1]);
  } catch {
    return null;
  }
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

// GET (admin): danh sách sản phẩm bán = các module POS đăng ký được trên admin-web.
export async function GET(req: NextRequest) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  try {
    const appRows = await sql`SELECT app_code, app_name FROM apps ORDER BY app_name`;
    const map = new Map<string, string>();
    for (const a of appRows) {
      map.set(a.app_code, a.app_name || a.app_code);
    }
    const products = STORE_MODULES.map((m) => ({
      product_code: m.app_code,
      product_name: map.get(m.app_code) || m.name,
    }));
    return NextResponse.json(products, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { error: 'Lỗi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
