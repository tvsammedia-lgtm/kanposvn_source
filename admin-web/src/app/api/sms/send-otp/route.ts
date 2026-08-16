import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { generateOtp, sendSms, smsMockMode } from '@/lib/sms';

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

function isValidPhone(phone: string) {
  return /^\+?[0-9]{8,15}$/.test(phone);
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

export async function POST(req: NextRequest) {
  const sql = getSql();
  try {
    const { phone, purpose } = await req.json();
    const normalizedPhone = normalizePhone(phone || '');
    if (!isValidPhone(normalizedPhone)) {
      return NextResponse.json(
        { error: 'SĐT không hợp lệ' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const otpPurpose = purpose || 'register';

    // Chống spam: chỉ cho gửi lại sau 60 giây nếu mã cũ còn hiệu lực.
    const recent = await sql`
      SELECT id, created_at FROM sms_otps
      WHERE phone = ${normalizedPhone} AND purpose = ${otpPurpose} AND used = false
      ORDER BY created_at DESC LIMIT 1
    `;
    if (recent.length > 0) {
      const last = new Date(recent[0].created_at).getTime();
      const elapsed = Date.now() - last;
      if (elapsed < 60_000) {
        return NextResponse.json(
          { error: `Vui lòng đợi ${Math.ceil((60_000 - elapsed) / 1000)} giây để gửi lại mã` },
          { status: 429, headers: corsHeaders() },
        );
      }
    }

    const code = generateOtp(6);
    const expiresAt = new Date(Date.now() + 5 * 60 * 1000).toISOString();

    await sql`
      INSERT INTO sms_otps (phone, code, purpose, expires_at, attempts, used)
      VALUES (${normalizedPhone}, ${code}, ${otpPurpose}, ${expiresAt}, 0, false)
    `;

    const smsResult = await sendSms(
      normalizedPhone,
      `Ma xac nhan KanPosVN cua ban la: ${code}. Hieu luc 5 phut.`,
      code,
    );
    if (!smsResult.ok) {
      return NextResponse.json(
        { error: smsResult.error || 'Không gửi được mã xác nhận' },
        { status: 502, headers: corsHeaders() },
      );
    }

    const mock = smsResult.mock;
    return NextResponse.json(
      {
        ok: true,
        message: 'Đã gửi mã xác nhận',
        // Chế độ MOCK trả kèm mã để chạy ngay khi chưa có nhà cung cấp SMS.
        // Bỏ trường này khi bật nhà cung cấp SMS thật (SMS_PROVIDER).
        ...(mock ? { dev_code: code } : {}),
      },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json(
      { error: 'Lỗi server: ' + String(e) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
