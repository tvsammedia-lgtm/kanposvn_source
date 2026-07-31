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
    const { email, password, secret } = await req.json();

    if (secret !== SEED_SECRET) {
      return NextResponse.json({ error: 'Sai secret key' }, { status: 403, headers: corsHeaders() });
    }

    if (!email || !password) {
      return NextResponse.json({ error: 'Email va password la bat buoc' }, { status: 400, headers: corsHeaders() });
    }

    const sql = getSql();
    const users = await sql`SELECT id, email FROM users WHERE email = ${email}`;
    if (users.length === 0) {
      return NextResponse.json({ error: 'Khong tim thay user' }, { status: 404, headers: corsHeaders() });
    }

    const hash = await hashPassword(password);
    await sql`UPDATE users SET password_hash = ${hash} WHERE email = ${email}`;

    return NextResponse.json({ ok: true, message: `Da reset mat khau cho ${email}` }, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json({ error: 'Loi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}
