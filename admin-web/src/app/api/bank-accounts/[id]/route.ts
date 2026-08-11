import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,PATCH,DELETE,OPTIONS',
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

// GET (admin): chi tiết tài khoản ngân hàng.
export async function GET(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const { id } = await params;
  const rows = await sql`SELECT * FROM bank_accounts WHERE id = ${id}`;
  if (rows.length === 0) {
    return NextResponse.json({ error: 'Không tìm thấy' }, { status: 404, headers: corsHeaders() });
  }
  return NextResponse.json(rows[0], { headers: corsHeaders() });
}

// PATCH (admin): cập nhật tài khoản ngân hàng.
export async function PATCH(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const { id } = await params;
  const body = await req.json();
  const [row] = await sql`
    UPDATE bank_accounts SET
      bank_code = ${body.bank_code !== undefined ? body.bank_code : sql`bank_code`},
      bank_name = ${body.bank_name !== undefined ? body.bank_name : sql`bank_name`},
      account_number = ${body.account_number !== undefined ? body.account_number : sql`account_number`},
      account_holder = ${body.account_holder !== undefined ? body.account_holder : sql`account_holder`},
      branch = ${body.branch !== undefined ? body.branch : sql`branch`},
      active = ${body.active !== undefined ? body.active : sql`active`},
      updated_at = NOW()
    WHERE id = ${id}
    RETURNING *
  `;
  if (!row) {
    return NextResponse.json({ error: 'Không tìm thấy' }, { status: 404, headers: corsHeaders() });
  }
  return NextResponse.json(row, { headers: corsHeaders() });
}

// DELETE (admin): xóa tài khoản ngân hàng.
export async function DELETE(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const { id } = await params;
  const rows = await sql`DELETE FROM bank_accounts WHERE id = ${id} RETURNING id`;
  if (rows.length === 0) {
    return NextResponse.json({ error: 'Không tìm thấy' }, { status: 404, headers: corsHeaders() });
  }
  return NextResponse.json({ ok: true }, { headers: corsHeaders() });
}
