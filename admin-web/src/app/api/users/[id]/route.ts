import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken, hashPassword } from '@/lib/auth';
import { isProtectedAdminEmail } from '@/lib/admin';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'PATCH,DELETE,OPTIONS',
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

export async function PATCH(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const body = await req.json();

  const target = await sql`SELECT email FROM users WHERE id = ${id}`;
  if (target.length === 0) {
    return NextResponse.json({ error: 'Khong tim thay user' }, { status: 404, headers: corsHeaders() });
  }
  const targetEmail: string = target[0].email;

  if (body.email !== undefined && body.email !== targetEmail) {
    if (isProtectedAdminEmail(targetEmail)) {
      return NextResponse.json({ error: 'Khong the doi email tai khoan admin' }, { status: 400, headers: corsHeaders() });
    }
    const dup = await sql`SELECT id FROM users WHERE email = ${body.email} AND id <> ${id}`;
    if (dup.length > 0) {
      return NextResponse.json({ error: 'Email da ton tai' }, { status: 409, headers: corsHeaders() });
    }
    await sql`UPDATE users SET email = ${body.email} WHERE id = ${id}`;
    await sql`INSERT INTO audit_logs (user_name, action, module, details) VALUES (${admin.email}, 'Sua user', 'Users', ${'Doi email user: ' + targetEmail + ' -> ' + body.email})`;
  }

  if (body.active !== undefined) {
    await sql`UPDATE users SET active = ${body.active} WHERE id = ${id}`;
    await sql`INSERT INTO audit_logs (user_name, action, module, details) VALUES (${admin.email}, ${body.active ? 'Mo khoa tai khoan' : 'Khoa tai khoan'}, 'Users', ${'User: ' + id})`;
  }

  if (body.password) {
    const hash = await hashPassword(body.password);
    await sql`UPDATE users SET password_hash = ${hash} WHERE id = ${id}`;
    await sql`INSERT INTO audit_logs (user_name, action, module, details) VALUES (${admin.email}, 'Reset mat khau', 'Users', ${'User: ' + id})`;
  }

  if (body.full_name !== undefined) {
    await sql`UPDATE users SET full_name = ${body.full_name} WHERE id = ${id}`;
  }

  if (body.birth_year !== undefined) {
    await sql`UPDATE users SET birth_year = ${body.birth_year} WHERE id = ${id}`;
  }

  if (body.cccd !== undefined) {
    await sql`UPDATE users SET cccd = ${body.cccd} WHERE id = ${id}`;
  }

  if (body.phone !== undefined) {
    await sql`UPDATE users SET phone = ${body.phone} WHERE id = ${id}`;
  }

  if (body.subscription_plan !== undefined) {
    const planDays = parseInt(body.subscription_plan) || 0;
    const subStart = body.subscription_start ? new Date(body.subscription_start) : new Date();
    const subEnd = planDays > 0
      ? new Date(subStart.getTime() + planDays * 24 * 60 * 60 * 1000)
      : null;
    await sql`
      UPDATE users SET subscription_plan = ${body.subscription_plan}, subscription_start = ${subStart.toISOString()}, subscription_end = ${subEnd?.toISOString() || null}
      WHERE id = ${id}
    `;
  }

  await sql`INSERT INTO audit_logs (user_name, action, module, details) VALUES (${admin.email}, 'Sua thong tin', 'Users', ${'Sua user: ' + targetEmail})`;

  const updated = await sql`SELECT id, email, full_name, active, created_at, birth_year, cccd, phone, subscription_plan, subscription_start, subscription_end FROM users WHERE id = ${id}`;
  return NextResponse.json(updated[0], { headers: corsHeaders() });
}

export async function DELETE(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getToken(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const { id } = await params;
  const target = await sql`SELECT email FROM users WHERE id = ${id}`;
  if (target.length === 0) {
    return NextResponse.json({ error: 'Khong tim thay user' }, { status: 404, headers: corsHeaders() });
  }

  await sql`DELETE FROM user_permissions WHERE user_id = ${id}`;
  await sql`DELETE FROM users WHERE id = ${id}`;
  await sql`INSERT INTO audit_logs (user_name, action, module, details) VALUES (${admin.email}, 'Xoa user', 'Users', ${'Xoa user: ' + target[0].email})`;

  return NextResponse.json({ ok: true }, { headers: corsHeaders() });
}
