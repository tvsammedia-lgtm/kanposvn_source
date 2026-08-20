import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,POST,DELETE,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization, x-api-key',
  };
}

function getAdmin(req: NextRequest) {
  const auth = req.headers.get('authorization');
  if (auth?.startsWith('Bearer ')) {
    try { return verifyToken(auth.split(' ')[1]); } catch { return null; }
  }
  const apiKey = req.headers.get('x-api-key');
  if (apiKey === process.env.SYNC_API_KEY) return { role: 'api' };
  return null;
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

// GET: Danh sách error logs từ Neon
export async function GET(req: NextRequest) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }

  const url = new URL(req.url);
  const module = url.searchParams.get('module') || '';
  const level = url.searchParams.get('level') || '';
  const limit = parseInt(url.searchParams.get('limit') || '200', 10);
  const offset = parseInt(url.searchParams.get('offset') || '0', 10);

  try {
    let logs;
    if (module && level) {
      logs = await sql`SELECT * FROM error_logs WHERE module = ${module} AND level = ${level} ORDER BY created_at DESC LIMIT ${limit} OFFSET ${offset}`;
    } else if (module) {
      logs = await sql`SELECT * FROM error_logs WHERE module = ${module} ORDER BY created_at DESC LIMIT ${limit} OFFSET ${offset}`;
    } else if (level) {
      logs = await sql`SELECT * FROM error_logs WHERE level = ${level} ORDER BY created_at DESC LIMIT ${limit} OFFSET ${offset}`;
    } else {
      logs = await sql`SELECT * FROM error_logs ORDER BY created_at DESC LIMIT ${limit} OFFSET ${offset}`;
    }
    return NextResponse.json(logs, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { error: 'Lỗi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}

// POST: Nhận error logs từ Flutter sync
export async function POST(req: NextRequest) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa xác thực' }, { status: 401, headers: corsHeaders() });
  }

  try {
    const body = await req.json();
    const { logs } = body;

    if (!logs || !Array.isArray(logs) || logs.length === 0) {
      return NextResponse.json({ error: 'Thiếu logs' }, { status: 400, headers: corsHeaders() });
    }

    const inserted: string[] = [];
    for (const log of logs) {
      await sql`
        INSERT INTO error_logs (id, module, screen, action, level, error_code, message, stack_trace, device_info, user_id, user_name, phone, created_at)
        VALUES (
          gen_random_uuid(),
          ${log.module || ''},
          ${log.screen || ''},
          ${log.action || ''},
          ${log.level || 'error'},
          ${log.errorCode || ''},
          ${log.message || ''},
          ${log.stackTrace || ''},
          ${log.deviceInfo || ''},
          ${log.userId || ''},
          ${log.userName || ''},
          ${log.phone || ''},
          ${log.createdAt || new Date().toISOString()}
        )
      `;
      inserted.push(log.logId || '');
    }

    return NextResponse.json({ success: true, inserted: inserted.length }, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { error: 'Lỗi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}

// DELETE: Xóa error log theo id
export async function DELETE(req: NextRequest) {
  const sql = getSql();
  const admin = getAdmin(req);
  if (!admin) {
    return NextResponse.json({ error: 'Chưa đăng nhập' }, { status: 401, headers: corsHeaders() });
  }

  const url = new URL(req.url);
  const id = url.searchParams.get('id');
  if (!id) {
    return NextResponse.json({ error: 'Thiếu id' }, { status: 400, headers: corsHeaders() });
  }

  try {
    await sql`DELETE FROM error_logs WHERE id = ${id}`;
    return NextResponse.json({ success: true }, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { error: 'Lỗi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
