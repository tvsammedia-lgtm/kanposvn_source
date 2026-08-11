import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };
}

function normalizePhone(phone: string) {
  return phone.trim().replace(/[\s-]/g, '');
}

const MAX_ATTEMPTS = 5;

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

export async function POST(req: NextRequest) {
  const sql = getSql();
  try {
    const { phone, purpose, code } = await req.json();
    const normalizedPhone = normalizePhone(phone || '');
    const otpPurpose = purpose || 'register';

    if (!code || !String(code).trim()) {
      return NextResponse.json(
        { error: 'Vui lòng nhập mã xác nhận' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const rows = await sql`
      SELECT * FROM sms_otps
      WHERE phone = ${normalizedPhone} AND purpose = ${otpPurpose} AND used = false
      ORDER BY created_at DESC LIMIT 1
    `;
    if (rows.length === 0) {
      return NextResponse.json(
        { error: 'Không tìm thấy mã xác nhận. Vui lòng gửi lại mã.' },
        { status: 400, headers: corsHeaders() },
      );
    }
    const otp = rows[0];

    if (otp.attempts >= MAX_ATTEMPTS) {
      await sql`UPDATE sms_otps SET used = true WHERE id = ${otp.id}`;
      return NextResponse.json(
        { error: 'Quá số lần thử. Vui lòng gửi lại mã mới.' },
        { status: 400, headers: corsHeaders() },
      );
    }

    if (new Date(otp.expires_at).getTime() < Date.now()) {
      await sql`UPDATE sms_otps SET used = true WHERE id = ${otp.id}`;
      return NextResponse.json(
        { error: 'Mã xác nhận đã hết hạn. Vui lòng gửi lại mã.' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const trimmedCode = String(code).trim();
    if (trimmedCode !== otp.code) {
      await sql`
        UPDATE sms_otps SET attempts = attempts + 1 WHERE id = ${otp.id}
      `;
      const remaining = MAX_ATTEMPTS - otp.attempts - 1;
      return NextResponse.json(
        {
          error:
            remaining > 0
              ? `Sai mã xác nhận. Còn ${remaining} lần thử.`
              : 'Sai mã xác nhận. Vui lòng gửi lại mã mới.',
        },
        { status: 400, headers: corsHeaders() },
      );
    }

    await sql`UPDATE sms_otps SET used = true WHERE id = ${otp.id}`;

    return NextResponse.json(
      { ok: true, message: 'Xác nhận SĐT thành công' },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json(
      { error: 'Lỗi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
