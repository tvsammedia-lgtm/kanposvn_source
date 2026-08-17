import crypto from 'crypto';

// ZaloPay Sandbox credentials (thay bang production khi deploy)
export const ZALOPAY_CONFIG = {
  app_id: parseInt(process.env.ZALOPAY_APP_ID || '2553'),
  key1: process.env.ZALOPAY_KEY1 || 'trwHkIUDItvVLqwHoxaHzYhXaQmFMXbi',
  key2: process.env.ZALOPAY_KEY2 || 'kwTGnNWh8kSOKB0lGi6jJHU2OInHjAkb',
  endpoint: process.env.ZALOPAY_ENDPOINT || 'https://sandbox.zalopay.vn/v001/tpe/create',
  query_endpoint: process.env.ZALOPAY_QUERY_ENDPOINT || 'https://sandbox.zalopay.vn/v001/tpe/query',
};

// Tao order_code: KPVN + YYYYMMDD + 6 so
export function newPaymentOrderCode(): string {
  const d = new Date();
  const ds = d.getFullYear().toString() +
    String(d.getMonth() + 1).padStart(2, '0') +
    String(d.getDate()).padStart(2, '0');
  const rand = String(Math.floor(Math.random() * 1000000)).padStart(6, '0');
  return `KPVN-${ds}-${rand}`;
}

// Tao ZaloPay app_trans_id: YYMMDD + order_code
export function newAppTransId(orderCode: string): string {
  const d = new Date();
  const prefix = d.getFullYear().toString().slice(-2) +
    String(d.getMonth() + 1).padStart(2, '0') +
    String(d.getDate()).padStart(2, '0');
  return prefix + '_' + orderCode;
}

// HMAC-SHA256 signature
export function sign(data: string, key: string): string {
  return crypto.createHmac('sha256', key).update(data).digest('hex');
}

// Tao signature cho CreateOrder
export function createOrderSignature(params: {
  app_id: number;
  app_user: string;
  app_time: number;
  amount: number;
  app_trans_id: string;
  embed_data: string;
  item: string;
}): string {
  const data = [
    params.app_id,
    params.app_user,
    params.app_time,
    params.amount,
    params.app_trans_id,
    params.embed_data,
    params.item,
  ].join('|');
  return sign(data, ZALOPAY_CONFIG.key1);
}

// Verify callback signature tu ZaloPay
export function verifyCallbackSignature(params: Record<string, any>, signature: string): boolean {
  const data = [
    params.app_id,
    params.app_trans_id,
    params.user_fee_amount,
    params.amount,
    params.callback_count,
  ].join('|');
  const expectedSignature = sign(data, ZALOPAY_CONFIG.key1);
  return expectedSignature === signature;
}
