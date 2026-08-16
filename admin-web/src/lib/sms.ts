// Dịch vụ gửi OTP. Mặc định chạy chế độ MOCK: mã OTP được in ra server log
// và trả về trong response (chỉ dùng để chạy được ngay khi chưa có nhà cung cấp).
// Nhà cung cấp: SpeedSMS.vn (đăng ký miễn phí tại connect.speedsms.vn, trả trước).
// Gán env:
//   SMS_PROVIDER='speedsms'        → gửi qua SMS brandname mặc định (Verify/Notify)
//   SMS_PROVIDER='speedsms_voice'  → gửi qua cuộc gọi voice đọc mã OTP (rẻ hơn ~50%)
//   SPEEDSMS_API_TOKEN='<access token>'
// Voice OTP chỉ phát sinh chi phí khi người dùng nhấc máy.

export type SendSmsResult = {
  ok: boolean;
  mock: boolean;
  error?: string;
};

export function smsMockMode(): boolean {
  return !process.env.SMS_PROVIDER;
}

// SpeedSMS.vn — gửi SMS brandname mặc định (Verify/Notify), không cần đăng ký brandname.
async function sendWithSpeedsms(phone: string, message: string): Promise<SendSmsResult> {
  const token = process.env.SPEEDSMS_API_TOKEN || '';
  if (!token) {
    return { ok: false, mock: false, error: 'Thiếu SPEEDSMS_API_TOKEN (lấy tại connect.speedsms.vn)' };
  }
  try {
    const res = await fetch('https://api.speedsms.vn/index.php/sms/send', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Basic ' + Buffer.from(token + ':').toString('base64'),
      },
      body: JSON.stringify({
        to: [phone.replace(/^\+/, '')],
        content: message,
        sms_type: 4,
        sender: '',
      }),
    });
    const data = await res.json().catch(() => ({}));
    if (res.ok && data.status === 'success' && data.code === '00') {
      return { ok: true, mock: false };
    }
    return { ok: false, mock: false, error: (data && data.message) || `SpeedSMS gửi thất bại (HTTP ${res.status})` };
  } catch (e) {
    return { ok: false, mock: false, error: 'Lỗi kết nối SpeedSMS: ' + String(e) };
  }
}

// SpeedSMS.vn — Voice OTP: gọi điện đọc mã OTP cho người nhận (rẻ hơn SMS, chỉ tính phí khi nhấc máy).
async function sendVoiceWithSpeedsms(phone: string, code: string): Promise<SendSmsResult> {
  const token = process.env.SPEEDSMS_API_TOKEN || '';
  if (!token) {
    return { ok: false, mock: false, error: 'Thiếu SPEEDSMS_API_TOKEN (lấy tại connect.speedsms.vn)' };
  }
  try {
    const res = await fetch('https://api.speedsms.vn/index.php/voice/otp', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Basic ' + Buffer.from(token + ':').toString('base64'),
      },
      body: JSON.stringify({
        to: phone.replace(/^\+/, ''),
        content: code,
      }),
    });
    const data = await res.json().catch(() => ({}));
    if (res.ok && data.status === 'success' && data.code === '00') {
      return { ok: true, mock: false };
    }
    return { ok: false, mock: false, error: (data && data.message) || `SpeedSMS voice gửi thất bại (HTTP ${res.status})` };
  } catch (e) {
    return { ok: false, mock: false, error: 'Lỗi kết nối SpeedSMS voice: ' + String(e) };
  }
}

// Giao diện chuẩn để plug nhà cung cấp SMS thật.
// Mỗi provider triển khai một hàm send(phone, message) và được route
// /api/sms/send-otp chọn theo SMS_PROVIDER.
async function sendWithRealProvider(
  _provider: string,
  _phone: string,
  _message: string,
): Promise<SendSmsResult> {
  // TODO: tích hợp Esms / Vietnamobile... theo SMS_PROVIDER.
  return { ok: false, mock: false, error: 'Nhà cung cấp SMS chưa được cấu hình' };
}

export async function sendSms(phone: string, message: string, code?: string): Promise<SendSmsResult> {
  const provider = (process.env.SMS_PROVIDER || '').toLowerCase();
  if (provider === 'speedsms') {
    return sendWithSpeedsms(phone, message);
  }
  if (provider === 'speedsms_voice') {
    return sendVoiceWithSpeedsms(phone, code || '');
  }
  if (provider) {
    return sendWithRealProvider(provider, phone, message);
  }
  // MOCK: chỉ ghi log, không gửi SMS thật.
  console.log(`[SMS-MOCK] Gửi OTP tới ${phone}: ${code || message}`);
  return { ok: true, mock: true };
}

export function generateOtp(length = 6): string {
  let code = '';
  for (let i = 0; i < length; i++) {
    code += Math.floor(Math.random() * 10).toString();
  }
  return code;
}
