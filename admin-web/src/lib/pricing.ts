export type Plan = {
  key: string;
  label: string;
  days: number;
  price: number;
  trial: boolean;
  forever?: boolean;
};

export const PLANS: Record<string, Plan> = {
  trial: { key: 'trial', label: 'Dùng thử 7 ngày', days: 7, price: 0, trial: true },
  yearly: { key: 'yearly', label: '365 ngày', days: 365, price: 899000, trial: false },
  forever: { key: 'forever', label: 'Vĩnh Viễn', days: 0, price: 2999000, trial: false, forever: true },
};

export function getPlan(plan: string): Plan {
  return PLANS[plan] || PLANS.yearly;
}

export function formatVND(amount: number) {
  return new Intl.NumberFormat('vi-VN', {
    style: 'currency',
    currency: 'VND',
    maximumFractionDigits: 0,
  }).format(amount);
}

export function newOrderCode() {
  const ts = Date.now().toString(36).toUpperCase();
  const rand = Math.random().toString(36).slice(2, 6).toUpperCase();
  return `KN${ts}${rand}`;
}

// Gioi han so thiet bi (device) duoc phep chay tren 1 license
export const MAX_DEVICES = 2;

// Trial 7 ngay khi dang ky cua hang qua Web / Zalo Mini App
export const STORE_TRIAL_DAYS = 7;

// App code mặc định dùng cho license cua hang (neu khong truyen app_code)
export const STORE_LICENSE_APP_CODE = 'pos';

// Cac module POS cua hang duoc phep chon khi dang ky (khop AppModule ben Flutter)
export const STORE_MODULES: { app_code: string; name: string }[] = [
  { app_code: 'kanposvncafe', name: 'Cafe' },
  { app_code: 'kanposvnnhahangquanan', name: 'Nhà Hàng / Quán Ăn' },
  { app_code: 'kanposvnnhathuoc', name: 'Nhà Thuốc' },
  { app_code: 'kanposvnvlxd', name: 'VLXD' },
  { app_code: 'kanposvngara', name: 'Gara' },
  { app_code: 'kanposvnbida', name: 'Quản Lý Bida' },
  { app_code: 'kanposvnspa', name: 'Spa & Dưỡng Sinh' },
  { app_code: 'kanposvnkhachsan', name: 'Khách Sạn' },
  { app_code: 'kanhot_one', name: 'Khách Sạn Thiên Nhiên' },
  { app_code: 'kanposvnbanvevantai', name: 'Vận Tải & Vé' },
  { app_code: 'kanposvnqlcd', name: 'QLCD (Cắt Ghép & Vé)' },
  { app_code: 'kanposvnnhatro200', name: 'Nhà Trọ' },
  { app_code: 'kanposvnnbatdongsan', name: 'Bất Động Sản' },
  { app_code: 'kanposvnhrpayroll', name: 'HR Payroll' },
  { app_code: 'nhansu', name: 'Nhân Sự' },
];

export const STORE_MODULE_CODES = STORE_MODULES.map((m) => m.app_code);
