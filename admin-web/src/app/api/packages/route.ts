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
  try {
    return verifyToken(auth.split(' ')[1]);
  } catch {
    return null;
  }
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

// GET công khai: gói đang mở bán (dùng cho màn đăng ký chọn gói).
// GET ?all=1 (admin): tất cả gói.
export async function GET(req: NextRequest) {
  const sql = getSql();
  const all = req.nextUrl.searchParams.get('all') === '1';
  const admin = getToken(req);
  if (all && !admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const rows = all
    ? await sql`SELECT * FROM packages ORDER BY sort`
    : await sql`SELECT * FROM packages WHERE active = true ORDER BY sort`;
  return NextResponse.json(rows, { headers: corsHeaders() });
}

// POST (admin): upsert danh sách gói — gửi toàn bộ [{ key, label, days, price, trial, forever, active, sort }].
export async function POST(req: NextRequest) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const { items } = await req.json();
  if (!Array.isArray(items) || items.length === 0) {
    return NextResponse.json(
      { error: 'items phải là mảng không rỗng' },
      { status: 400, headers: corsHeaders() },
    );
  }
  for (const item of items) {
    if (!item.key || !item.label || typeof item.price !== 'number') {
      return NextResponse.json(
        { error: 'Mỗi gói cần key, label, price' },
        { status: 400, headers: corsHeaders() },
      );
    }
    const existing = await sql`SELECT id FROM packages WHERE key = ${item.key}`;
    if (existing.length > 0) {
      await sql`
        UPDATE packages SET
          label = ${item.label},
          days = ${item.days || 0},
          price = ${item.price},
          trial = ${item.trial ? true : false},
          forever = ${item.forever ? true : false},
          active = ${item.active === false ? false : true},
          sort = ${item.sort || 0},
          updated_at = NOW()
        WHERE key = ${item.key}
      `;
    } else {
      await sql`
        INSERT INTO packages (key, label, days, price, trial, forever, active, sort)
        VALUES (
          ${item.key},
          ${item.label},
          ${item.days || 0},
          ${item.price},
          ${item.trial ? true : false},
          ${item.forever ? true : false},
          ${item.active === false ? false : true},
          ${item.sort || 0}
        )
      `;
    }
  }
  const rows = await sql`SELECT * FROM packages ORDER BY sort`;
  return NextResponse.json(rows, { headers: corsHeaders() });
}
