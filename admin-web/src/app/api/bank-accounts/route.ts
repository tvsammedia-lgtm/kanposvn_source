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

// GET công khai: danh sách tài khoản ngân hàng đang hiển thị cho khách chuyển khoản.
// GET ?all=1 (admin): tất cả tài khoản.
export async function GET(req: NextRequest) {
  const sql = getSql();
  const all = req.nextUrl.searchParams.get('all') === '1';
  const admin = getToken(req);
  if (all && !admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const rows = all
    ? await sql`SELECT * FROM bank_accounts ORDER BY bank_code`
    : await sql`SELECT * FROM bank_accounts WHERE active = true ORDER BY bank_code`;
  return NextResponse.json(rows, { headers: corsHeaders() });
}

// POST (admin): tạo tài khoản ngân hàng mới.
export async function POST(req: NextRequest) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const { bank_code, bank_name, account_number, account_holder, branch, active } = await req.json();
  if (!bank_code || !bank_name) {
    return NextResponse.json(
      { error: 'bank_code và bank_name là bắt buộc' },
      { status: 400, headers: corsHeaders() },
    );
  }
  const existing = await sql`SELECT id FROM bank_accounts WHERE bank_code = ${bank_code}`;
  if (existing.length > 0) {
    return NextResponse.json(
      { error: 'bank_code đã tồn tại' },
      { status: 409, headers: corsHeaders() },
    );
  }
  const [row] = await sql`
    INSERT INTO bank_accounts (bank_code, bank_name, account_number, account_holder, branch, active)
    VALUES (${bank_code}, ${bank_name}, ${account_number || ''}, ${account_holder || ''}, ${branch || ''}, active === false ? false : true)
    RETURNING *
  `;
  return NextResponse.json(row, { status: 201, headers: corsHeaders() });
}
