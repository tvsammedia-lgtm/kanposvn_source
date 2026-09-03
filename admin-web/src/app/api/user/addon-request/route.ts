import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { STORE_MODULES } from '@/lib/pricing';

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

// GET: lịch sử yêu cầu mua thêm của user đã đăng nhập.
export async function GET(req: NextRequest) {
  const sql = getSql();
  const user = getToken(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }
  try {
    const rows = await sql`
      SELECT id, payload, status, plan, requested_at, resolved_at, note
      FROM addon_requests WHERE user_id = ${user.id}
      ORDER BY requested_at DESC
    `;
    return NextResponse.json(rows, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json({ error: 'Lỗi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}

// POST: user gửi yêu cầu mua thêm module / chi nhánh.
// body: { modules: [ { app_code, branches: [ { name, phone, address } ] } ] }
export async function POST(req: NextRequest) {
  const sql = getSql();
  const user = getToken(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }
  try {
    const body = await req.json();
    const modules = body.modules;
    if (!Array.isArray(modules) || modules.length === 0) {
      return NextResponse.json({ error: 'Vui lòng chọn ít nhất 1 module cần thêm' }, { status: 400, headers: corsHeaders() });
    }

    // Validate các module tồn tại + đang hiển thị đăng ký.
    const appendedRows = await sql`
      SELECT app_code FROM apps WHERE show_in_registration = true
    `;
    const availableCodes = new Set(appendedRows.map((a: { app_code: string }) => a.app_code));

    const payloadModules: { app_code: string; branches: { name: string; phone?: string; address?: string }[] }[] = [];
    for (const m of modules) {
      const code = String(m?.app_code || '').trim();
      if (!code) {
        return NextResponse.json({ error: 'Thiếu mã module trong yêu cầu' }, { status: 400, headers: corsHeaders() });
      }
      if (!availableCodes.has(code)) {
        return NextResponse.json({ error: `Module "${code}" không tồn tại hoặc đang ẩn` }, { status: 400, headers: corsHeaders() });
      }
      const branches = (Array.isArray(m.branches) && m.branches.length > 0 ? m.branches : [{}]).map((b: { name?: string; phone?: string; address?: string }) => ({
        name: (b?.name && String(b.name).trim()) ? String(b.name).trim() : '',
        phone: b?.phone ? String(b.phone) : '',
        address: b?.address ? String(b.address) : '',
      }));
      payloadModules.push({ app_code: code, branches });
    }

    if (payloadModules.length === 0) {
      return NextResponse.json({ error: 'Vui lòng chọn ít nhất 1 module cần thêm' }, { status: 400, headers: corsHeaders() });
    }

    const result = await sql`
      INSERT INTO addon_requests (user_id, payload, status)
      VALUES (${user.id}, ${JSON.stringify({ modules: payloadModules })}, 'pending')
      RETURNING id, status, requested_at
    `;

    return NextResponse.json(
      { ok: true, request: result[0], message: 'Yêu cầu mua thêm đã gửi về CRM để admin duyệt.' },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json({ error: 'Lỗi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}
