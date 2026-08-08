'use client';
import { useEffect, useState } from 'react';
import Link from 'next/link';
import { STORE_MODULES } from '@/lib/pricing';

type RegisterResult = {
  ok: boolean;
  message?: string;
  userId?: string;
  storeId?: string;
  storeName?: string;
  appCode?: string;
  moduleName?: string;
  trial?: boolean;
  expiresAt?: string | null;
  error?: string;
};

export default function RegisterPage() {
  const [storeName, setStoreName] = useState('');
  const [phone, setPhone] = useState('');
  const [password, setPassword] = useState('');
  const [confirm, setConfirm] = useState('');
  const [appCode, setAppCode] = useState<string>('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<RegisterResult | null>(null);
  const [modules, setModules] = useState<{ app_code: string; app_name: string }[]>([]);

  useEffect(() => {
    (async () => {
      if (typeof window !== 'undefined') {
        const phoneParam = new URLSearchParams(window.location.search).get('phone');
        if (phoneParam) setPhone(phoneParam);
      }
      try {
        const res = await fetch('/api/apps?registration=1');
        if (!res.ok) throw new Error();
        const data = await res.json();
        if (Array.isArray(data) && data.length > 0) {
          setModules(
            data.map((m: { app_code: string; app_name: string }) => ({
              app_code: m.app_code,
              app_name: m.app_name,
            })),
          );
          return;
        }
      } catch {
        /* fallback ben duoi */
      }
      setModules(STORE_MODULES.map((m) => ({ app_code: m.app_code, app_name: m.name })));
    })();
  }, []);

  const handleRegister = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    if (password.length < 6) {
      setError('Mật khẩu tối thiểu 6 ký tự');
      return;
    }
    if (password !== confirm) {
      setError('Mật khẩu xác nhận không khớp');
      return;
    }
    if (!appCode) {
      setError('Vui lòng chọn ngành nghề / module cho cửa hàng');
      return;
    }
    setLoading(true);
    try {
      const res = await fetch('/api/auth/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ store_name: storeName, phone, password, app_code: appCode }),
      });
      const data: RegisterResult = await res.json();
      if (!res.ok) {
        setError(data.error || 'Đăng ký thất bại');
        setLoading(false);
        return;
      }
      setResult(data);
      setLoading(false);
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
          <div className="inline-flex items-center justify-center w-16 h-16 bg-green-600 rounded-2xl mb-4">
            <svg className="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
            </svg>
          </div>
          <h1 className="text-2xl font-bold text-gray-900">Đăng ký cửa hàng</h1>
          <p className="text-gray-500 mt-1">Tạo tài khoản KanPosVN - dùng thử 7 ngày</p>
        </div>

        {result?.ok ? (
          <div className="text-center">
            <div className="bg-green-50 text-green-700 px-4 py-4 rounded-lg text-sm mb-6">
              <div className="font-semibold text-base mb-1">Đăng ký thành công 🎉</div>
              <div>Cửa hàng: <b>{result.storeName}</b></div>
              <div>Module: <b>{result.moduleName || result.appCode}</b></div>
              <div>Trial 7 ngày, hết hạn: {result.expiresAt ? new Date(result.expiresAt).toLocaleDateString('vi-VN') : '-'}</div>
            </div>
            <Link href="/login" className="block w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors text-center">
              Đăng nhập ngay
            </Link>
            <Link href="/download" className="block w-full mt-3 text-blue-600 text-sm font-medium hover:underline">
              Tải POS về máy
            </Link>
          </div>
        ) : (
          <>
            <form onSubmit={handleRegister} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Tên cửa hàng</label>
                <input
                  type="text"
                  value={storeName}
                  onChange={(e) => setStoreName(e.target.value)}
                  className={inputCls}
                  placeholder="Ví dụ: Cafe ABC"
                  required
                />
              </div>
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
                  placeholder="Tối thiểu 6 ký tự"
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Xác nhận mật khẩu</label>
                <input
                  type="password"
                  value={confirm}
                  onChange={(e) => setConfirm(e.target.value)}
                  className={inputCls}
                  placeholder="Nhập lại mật khẩu"
                  required
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Ngành nghề / Module</label>
                {modules.length === 0 ? (
                  <div className="text-sm text-gray-400">Đang tải danh sách module...</div>
                ) : (
                  <div className="grid grid-cols-2 gap-2">
                    {modules.map((m) => (
                      <button
                        key={m.app_code}
                        type="button"
                        onClick={() => setAppCode(m.app_code)}
                        className={`px-3 py-2 rounded-lg border text-left text-sm font-medium transition-colors ${
                          appCode === m.app_code
                            ? 'border-green-600 bg-green-50 text-green-700'
                            : 'border-gray-300 text-gray-700 hover:border-green-400'
                        }`}
                      >
                        {m.app_name}
                      </button>
                    ))}
                  </div>
                )}
              </div>

              {error && (
                <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg text-sm">{error}</div>
              )}

              <button
                type="submit"
                disabled={loading}
                className="w-full bg-green-600 text-white py-3 rounded-lg font-semibold hover:bg-green-700 disabled:opacity-50 transition-colors"
              >
                {loading ? 'Đang đăng ký...' : 'ĐĂNG KÝ'}
              </button>
            </form>

            <div className="mt-6 text-center text-sm text-gray-500 space-y-1">
              <div>
                Đã có tài khoản?{' '}
                <Link href="/login" className="text-blue-600 font-medium hover:underline">
                  Đăng nhập
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
