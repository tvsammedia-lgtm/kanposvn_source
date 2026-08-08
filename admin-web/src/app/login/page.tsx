'use client';
import { useState } from 'react';
import Link from 'next/link';

type LoginResult = {
  user?: { full_name: string; email: string; phone: string; role: string };
  token?: string;
  storeId?: string | null;
  storeName?: string | null;
  plan?: string | null;
  trial?: boolean;
  forever?: boolean;
  expiresAt?: string | null;
  error?: string;
  notRegistered?: boolean;
};

type AppCodeOption = { code: string; name: string };

type StoreSummary = {
  appCode?: string;
  appCodes?: AppCodeOption[];
  today: { invoices: number; revenue: number; cost: number; profit: number; debt: number };
  display: { invoices: string; revenue: string; cost: string; profit: string; debt: string };
  lastSync: string | null;
};

export default function StoreLoginPage() {
  const [phone, setPhone] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [notRegistered, setNotRegistered] = useState(false);
  const [result, setResult] = useState<LoginResult | null>(null);
  const [daysLeft, setDaysLeft] = useState<number | null>(null);
  const [summary, setSummary] = useState<StoreSummary | null>(null);
  const [summaryLoading, setSummaryLoading] = useState(false);
  const [summaryError, setSummaryError] = useState('');
  const [appCodes, setAppCodes] = useState<AppCodeOption[]>([]);
  const [selectedApp, setSelectedApp] = useState('');

  const loadSummary = async (token: string, appCode?: string) => {
    setSummaryLoading(true);
    setSummaryError('');
    setSummary(null);
    try {
      const url = appCode
        ? `/api/store/summary?app_code=${encodeURIComponent(appCode)}`
        : '/api/store/summary';
      const sres = await fetch(url, {
        headers: { Authorization: `Bearer ${token}` },
      });
      const sdata = await sres.json();
      if (sres.ok && sdata.ok) {
        setSummary(sdata);
        setAppCodes(sdata.appCodes || []);
        if (!appCode && sdata.appCode) setSelectedApp(sdata.appCode);
      } else {
        setSummaryError(sdata.error || 'Không tải được tóm tắt cửa hàng');
      }
    } catch {
      setSummaryError('Không tải được tóm tắt cửa hàng');
    } finally {
      setSummaryLoading(false);
    }
  };

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setNotRegistered(false);
    setLoading(true);
    try {
      const res = await fetch('/api/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ phone, password }),
      });
      const data: LoginResult = await res.json();
      if (!res.ok) {
        setError(data.error || 'Đăng nhập thất bại');
        setNotRegistered(!!data.notRegistered);
        setLoading(false);
        return;
      }
      if (data.token) {
        localStorage.setItem('store_token', data.token);
        localStorage.setItem('store_user', JSON.stringify({ ...data.user, storeId: data.storeId, storeName: data.storeName }));
      }
      setDaysLeft(
        data.expiresAt
          ? Math.max(0, Math.ceil((new Date(data.expiresAt).getTime() - Date.now()) / (24 * 60 * 60 * 1000)))
          : null,
      );
      setResult(data);
      setLoading(false);
      if (data.token) {
        loadSummary(data.token);
      }
    } catch {
      setError('Lỗi kết nối');
      setLoading(false);
    }
  };

  const inputCls =
    'w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none';

  return (
    <div className="min-h-screen bg-gray-100 flex items-center justify-center p-4">
      <div className="bg-white rounded-2xl shadow-xl p-8 w-full max-w-md">
        <div className="text-center mb-8">
          <div className="inline-flex items-center justify-center w-16 h-16 bg-blue-600 rounded-2xl mb-4">
            <svg className="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
            </svg>
          </div>
          <h1 className="text-2xl font-bold text-gray-900">KanPosVN</h1>
          <p className="text-gray-500 mt-1">Đăng nhập cửa hàng bằng SĐT</p>
        </div>

        {result?.token ? (
          <div className="text-center">
            <div className="bg-blue-50 text-gray-800 px-4 py-4 rounded-lg text-sm mb-6">
              <div className="font-semibold text-base mb-1">Xin chào, {result.user?.full_name || result.storeName}</div>
              <div className="flex justify-between mt-2">
                <span className="text-gray-500">Cửa hàng</span>
                <b>{result.storeName || '-'}</b>
              </div>
              <div className="flex justify-between mt-1">
                <span className="text-gray-500">Gói</span>
                <b>{result.forever ? 'Vĩnh Viễn' : result.trial ? 'Dùng thử 7 ngày' : result.plan === 'yearly' ? '365 ngày' : result.plan ? `${result.plan}` : 'Đã mua'}</b>
              </div>
              {result.forever ? (
                <div className="flex justify-between mt-1">
                  <span className="text-gray-500">Còn lại</span>
                  <b className="text-green-700">Vĩnh Viễn</b>
                </div>
              ) : daysLeft !== null ? (
                <div className="flex justify-between mt-1">
                  <span className="text-gray-500">Còn lại</span>
                  <b className={daysLeft <= 7 ? 'text-orange-600' : 'text-green-700'}>{daysLeft} ngày</b>
                </div>
              ) : null}

              <div className="mt-4 pt-4 border-t border-blue-200">
                <div className="text-center font-bold text-sm text-gray-800 mb-3">
                  📊 DASHBOARD HÔM NAY
                </div>
                {appCodes.length > 1 && (
                  <div className="mb-3">
                    <label className="block text-xs text-gray-500 text-left mb-1">
                      Ứng dụng / app_code
                    </label>
                    <select
                      value={selectedApp}
                      onChange={(e) => {
                        const code = e.target.value;
                        setSelectedApp(code);
                        if (result?.token) loadSummary(result.token, code);
                      }}
                      className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm outline-none bg-white"
                    >
                      {appCodes.map((ac) => (
                        <option key={ac.code} value={ac.code}>
                          {ac.name || ac.code} ({ac.code})
                        </option>
                      ))}
                    </select>
                  </div>
                )}
                {appCodes.length > 0 && (
                  <div className="text-xs text-gray-400 text-center mb-2">
                    Đang xem:{' '}
                    {appCodes.find((ac) => ac.code === selectedApp)?.name || selectedApp || summary?.appCode || '—'}
                  </div>
                )}
                {summaryLoading ? (
                  <div className="text-xs text-gray-400 text-center py-2">Đang tải tóm tắt...</div>
                ) : summary ? (
                  <div className="space-y-1.5 text-sm">
                    <div className="flex justify-between">
                      <span>🧾 Hóa đơn</span>
                      <b>{summary.display.invoices}</b>
                    </div>
                    <div className="flex justify-between">
                      <span>💰 Doanh thu</span>
                      <b className="text-green-700">{summary.display.revenue}</b>
                    </div>
                    <div className="flex justify-between">
                      <span>💸 Chi phí</span>
                      <b className="text-orange-600">{summary.display.cost}</b>
                    </div>
                    <div className="flex justify-between">
                      <span>📈 Lợi nhuận</span>
                      <b className="text-blue-700">{summary.display.profit}</b>
                    </div>
                    <div className="flex justify-between">
                      <span>📒 Công nợ</span>
                      <b className="text-red-600">{summary.display.debt}</b>
                    </div>
                    <div className="flex justify-between">
                      <span>⏰ Đồng bộ</span>
                      <b>{summary.lastSync || 'Chưa đồng bộ'}</b>
                    </div>
                  </div>
                ) : summaryError ? (
                  <div className="text-xs text-gray-400 text-center py-2">{summaryError}</div>
                ) : null}
              </div>
            </div>
            <Link href="/download" className="block w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors text-center">
              Tải POS về máy
            </Link>
            <button
              onClick={() => { localStorage.removeItem('store_token'); localStorage.removeItem('store_user'); setResult(null); setDaysLeft(null); setSummary(null); setSummaryError(''); setAppCodes([]); setSelectedApp(''); }}
              className="w-full mt-3 text-gray-500 text-sm font-medium hover:underline"
            >
              Đăng xuất
            </button>
          </div>
        ) : (
          <>
            <form onSubmit={handleLogin} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">SĐT</label>
                <input
                  type="tel"
                  value={phone}
                  onChange={(e) => setPhone(e.target.value)}
                  className={inputCls}
                  placeholder="0987654321"
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Mật khẩu</label>
                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  className={inputCls}
                  placeholder="••••••"
                  required
                />
              </div>

              {error && (
                <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg text-sm">{error}</div>
              )}

              {notRegistered && (
                <div className="bg-amber-50 border border-amber-200 rounded-lg p-4">
                  <div className="text-sm text-amber-800 mb-3">
                    Số điện thoại này chưa có tài khoản Cloud. Đăng ký cửa hàng ngay để dùng thử
                    7 ngày miễn phí.
                  </div>
                  <Link
                    href={`/register?phone=${encodeURIComponent(phone.trim())}`}
                    className="block w-full text-center bg-green-600 text-white py-3 rounded-lg font-semibold hover:bg-green-700 transition-colors"
                  >
                    ĐĂNG KÝ NGAY
                  </Link>
                </div>
              )}

              <button
                type="submit"
                disabled={loading}
                className="w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 disabled:opacity-50 transition-colors"
              >
                {loading ? 'Đang đăng nhập...' : 'ĐĂNG NHẬP'}
              </button>
            </form>

            <div className="mt-6 text-center text-sm text-gray-500 space-y-1">
              <div>
                Chưa có tài khoản?{' '}
                <Link href="/register" className="text-blue-600 font-medium hover:underline">
                  Đăng ký ngay
                </Link>
              </div>
              <div>
                Là quản trị viên?{' '}
                <Link href="/" className="text-gray-600 font-medium hover:underline">
                  Đăng nhập Admin
                </Link>
              </div>
            </div>
          </>
        )}
      </div>
    </div>
  );
}
