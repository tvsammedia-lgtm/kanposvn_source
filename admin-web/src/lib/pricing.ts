export const PLANS: Record<
  string,
  { key: string; label: string; days: number; price: number; trial: boolean }
> = {
  trial: { key: 'trial', label: 'Dùng thử 7 ngày', days: 7, price: 0, trial: true },
  monthly: { key: 'monthly', label: '1 tháng', days: 30, price: 99000, trial: false },
  quarterly: { key: 'quarterly', label: '3 tháng', days: 90, price: 249000, trial: false },
  yearly: { key: 'yearly', label: '12 tháng', days: 365, price: 899000, trial: false },
};

export function getPlan(plan: string) {
  return PLANS[plan] || PLANS.monthly;
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

// Trial 30 ngay khi dang ky cua hang qua Web / Zalo Mini App
export const STORE_TRIAL_DAYS = 30;
export const STORE_LICENSE_APP_CODE = 'pos';
