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

function getAdmin(req: NextRequest) {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try { return verifyToken(auth.split(' ')[1]); } catch { return null; }
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

export async function GET(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const { id } = await params;
  try {
    const rows = await sql`
      SELECT id, customer_code, owner_user_id, name, phone, email, active, approval_status,
             registration_plan, registered_modules, approved_at, created_at
      FROM customers WHERE id = ${id}
    `;
    if (rows.length === 0) {
      return NextResponse.json({ error: 'Không tìm thấy khách hàng' }, { status: 404, headers: corsHeaders() });
    }
    return NextResponse.json(rows[0], { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json({ error: 'Lỗi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}

// POST: admin duyệt / từ chối khách hàng đăng ký (approval_status + active).
// action = 'approve' | 'reject'
export async function POST(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }
  const { id } = await params;
  const { action } = await req.json();
  try {
    const [customer] = await sql`
      SELECT id, owner_user_id, name, approval_status FROM customers WHERE id = ${id}
    `;
    if (!customer) {
      return NextResponse.json({ error: 'Không tìm thấy khách hàng' }, { status: 404, headers: corsHeaders() });
    }

    let status = customer.approval_status;
    let active = true;
    if (action === 'reject') {
      status = 'rejected';
      active = false;
    } else if (action === 'approve') {
      status = 'approved';
      active = true;
    }

    // Cập nhật customer + kích hoạt/khóa user tương ứng (auto-lock theo license vẫn riêng).
    await sql`
      UPDATE customers
      SET approval_status = ${status}, active = ${active}, approved_at = ${status === 'approved' ? new Date().toISOString() : customer.approved_at}
      WHERE id = ${id}
    `;
    await sql`
      UPDATE users SET active = ${active} WHERE id = ${customer.owner_user_id}
    `;

    await sql`
      INSERT INTO audit_logs (user_name, action, module, details)
      VALUES (${admin.email}, ${action === 'reject' ? 'Từ chối khách hàng' : 'Duyệt khách hàng'}, 'CRM', ${'Khách hàng: ' + customer.name + ' -> ' + status})
    `;

    return NextResponse.json(
      { ok: true, approval_status: status, active },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json({ error: 'Lỗi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}
