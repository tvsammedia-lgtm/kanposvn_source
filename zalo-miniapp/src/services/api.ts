// API base (Vercel Admin Web)
export const API_BASE = "https://kanposvn-admin.vercel.app";

export async function postJson(
  path: string,
  body: Record<string, unknown>,
): Promise<any> {
  const res = await fetch(`${API_BASE}${path}`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });
  const data = await res.json().catch(() => ({}));
  if (!res.ok) {
    throw new Error(data.error || data.message || `Lỗi HTTP ${res.status}`);
  }
  return data;
}

export async function getJson(path: string, token?: string): Promise<any> {
  const res = await fetch(`${API_BASE}${path}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  });
  const data = await res.json().catch(() => ({}));
  if (!res.ok) {
    throw new Error(data.error || data.message || `Lỗi HTTP ${res.status}`);
  }
  return data;
}

export function formatVND(amount: number): string {
  return new Intl.NumberFormat("vi-VN", {
    style: "currency",
    currency: "VND",
    maximumFractionDigits: 0,
  }).format(amount);
}
