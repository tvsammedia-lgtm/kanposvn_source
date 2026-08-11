// Dịch vụ gửi SMS. Mặc định chạy chế độ MOCK: mã OTP được in ra server log
// và trả về trong response (chỉ dùng để chạy được ngay khi chưa có nhà cung cấp).
// Khi có nhà cung cấp SMS thật, gán env SMS_PROVIDER='speedsms' (hoặc khác)
// và cài API key tương ứng, đồng thời trả false từ mockMode().

export type SendSmsResult = {
  ok: boolean;
  mock: boolean;
  error?: string;
};

export function smsMockMode(): boolean {
  return !process.env.SMS_PROVIDER;
}

// Giao diện chuẩn để plug nhà cung cấp SMS thật.
// Mỗi provider triển khai một hàm send(phone, message) và được route
// /api/sms/send-otp chọn theo SMS_PROVIDER.
async function sendWithRealProvider(
  _provider: string,
  _phone: string,
  _message: string,
): Promise<SendSmsResult> {
  // TODO: tích hợp Speedsms.vn / Esms / Vietnamobile... theo SMS_PROVIDER.
  // Ví dụ Speedsms.vn: POST https://api.speedsms.vn/index.php/sms/send
  // với Basic auth access_token và body {to, content, type: 5}.
  return { ok: false, mock: false, error: 'Nhà cung cấp SMS chưa được cấu hình' };
}

export async function sendSms(phone: string, message: string): Promise<SendSmsResult> {
  const provider = process.env.SMS_PROVIDER || '';
  if (provider) {
    return sendWithRealProvider(provider, phone, message);
  }
  // MOCK: chỉ ghi log, không gửi SMS thật.
  console.log(`[SMS-MOCK] Gửi SMS tới ${phone}: ${message}`);
  return { ok: true, mock: true };
}

export function generateOtp(length = 6): string {
  let code = '';
  for (let i = 0; i < length; i++) {
    code += Math.floor(Math.random() * 10).toString();
  }
  return code;
}
