'use client';
import { useEffect, useState } from 'react';
import Link from 'next/link';

type Module = { app_code: string; app_name: string; price: number | null };
type Branch = { name: string };

type RegisterResult = {
  ok: boolean;
  message?: string;
  userId?: string;
  storeId?: string;
  storeName?: string;
  plan?: string;
  trial?: boolean;
  modules?: { app_code: string; branches: string[]; expires_at: string; manager?: boolean }[];
  error?: string;
};

export default function RegisterPage() {
  const [step, setStep] = useState(1);
  const [storeName, setStoreName] = useState('');
  const [phone, setPhone] = useState('');
  const [password, setPassword] = useState('');
  const [confirm, setConfirm] = useState('');
  const [checked, setChecked] = useState<Set<string>>(new Set());
  const [branchesByCode, setBranchesByCode] = useState<Record<string, string[]>>({});
  const [otpCode, setOtpCode] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<RegisterResult | null>(null);
  const [modules, setModules] = useState<Module[]>([]);
  const [modulesLoaded, setModulesLoaded] = useState(false);
  const [otpSent, setOtpSent] = useState(false);
  const [otpTimer, setOtpTimer] = useState(0);
  const [devCode, setDevCode] = useState('');

  useEffect(() => {
    (async () => {
      if (typeof window !== 'undefined') {
        const phoneParam = new URLSearchParams(window.location.search).get('phone');
        if (phoneParam) setPhone(phoneParam);
      }
      try {
        const appRes = await fetch('/api/apps?registration=1');
        const appData = await appRes.json();
        if (Array.isArray(appData) && appData.length > 0) {
          setModules(appData.map((m: Module) => ({ app_code: m.app_code, app_name: m.app_name, price: m.price ?? null })));
        } else {
          setModules([]);
        }
      } catch {
        setModules([]);
      }
      setModulesLoaded(true);
    })();
  }, []);

  useEffect(() => {
    if (otpTimer <= 0) return;
    const t = setTimeout(() => setOtpTimer((v) => v - 1), 1000);
    return () => clearTimeout(t);
  }, [otpTimer]);

  const toggleModule = (code: string) => {
    setChecked((prev) => {
      const next = new Set(prev);
      if (next.has(code)) next.delete(code);
      else {
        next.add(code);
        setBranchesByCode((b) => ({ ...b, [code]: b[code]?.length ? b[code] : [''] }));
      }
      return next;
    });
  };

  const selectedModules = modules.filter((m) => checked.has(m.app_code));

  const addBranch = (code: string) => {
    setBranchesByCode((prev) => ({ ...prev, [code]: [...(prev[code] || []), ''] }));
  };

  const removeBranch = (code: string, idx: number) => {
    setBranchesByCode((prev) => ({ ...prev, [code]: (prev[code] || []).filter((_, i) => i !== idx) }));
  };

  const setBranchName = (code: string, idx: number, value: string) => {
    setBranchesByCode((prev) => {
      const list = [...(prev[code] || [])];
      list[idx] = value;
      return { ...prev, [code]: list };
    });
  };

  const sendOtp = async () => {
    setError('');
    setLoading(true);
    try {
      const res = await fetch('/api/sms/send-otp', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ phone, purpose: 'register' }),
      });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error || 'Không gửi được mã');
        setLoading(false);
        return;
      }
      setDevCode(data.dev_code || '');
      setOtpSent(true);
      setOtpTimer(60);
      setLoading(false);
    } catch {
      setError('Lỗi kết nối');
      setLoading(false);
    }
  };

  const goToOtp = async () => {
    setError('');
    if (password.length < 6) {
      setError('Mật khẩu tối thiểu 6 ký tự');
      return;
    }
    if (password !== confirm) {
      setError('Mật khẩu xác nhận không khớp');
      return;
    }
    if (checked.size === 0) {
      setError('Vui lòng chọn ít nhất 1 module');
      return;
    }
    await sendOtp();
    if (!error) {
      setStep(2);
    }
  };

  const handleRegister = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    if (!otpCode.trim()) {
      setError('Vui lòng nhập mã xác nhận SĐT');
      return;
    }
    setLoading(true);
    try {
      const modulesPayload = selectedModules.map((m) => {
        const names = (branchesByCode[m.app_code] || [])
          .map((n) => n.trim())
          .filter(Boolean);
        const branches: Branch[] = names.length > 0 ? names.map((name) => ({ name })) : [{ name: '' }];
        return { app_code: m.app_code, branches };
      });
      const res = await fetch('/api/auth/register-multi', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ store_name: storeName, phone, password, otp_code: otpCode, modules: modulesPayload }),
      });
      const data: RegisterResult = await res.json();
      if (!res.ok) {
        setError(data.error || 'Đăng ký thất bại');
        setLoading(false);
        return;
      }
      setResult(data);
      setStep(3);
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
          <p className="text-gray-500 mt-1">Chọn nhiều module & chi nhánh — dùng thử 7 ngày miễn phí</p>
        </div>

        {step === 3 ? (
          <div className="text-center">
            <div className="bg-green-50 text-green-700 px-4 py-4 rounded-lg text-sm mb-6">
              <div className="font-semibold text-base mb-1">Đăng ký thành công 🎉</div>
              <div>Store: <b>{result?.storeName}</b></div>
              <div className="mt-2 mb-1">Modules đã đăng ký:</div>
              <ul className="space-y-1">
                {(result?.modules || []).map((mod) => (
                  <li key={mod.app_code} className="bg-white rounded px-2 py-1 border border-green-200 text-left">
                    <div>
                      <b>{mod.app_code}</b>
                      {mod.manager ? ' · Quyền Manager' : ''}
                    </div>
                    <div className="text-green-800">
                      Chi nhánh: {mod.branches.length > 0 ? mod.branches.join(', ') : 'Cửa hàng chính'}
                    </div>
                    <div className="text-green-600 text-xs">
                      Dùng thử 7 ngày · hết hạn:{' '}
                      {mod.expires_at ? new Date(mod.expires_at).toLocaleDateString('vi-VN') : '-'}
                    </div>
                  </li>
                ))}
              </ul>
              <div className="mt-3 text-green-800">
                Quá 7 ngày tài khoản sẽ tự khóa. Dữ liệu đã gửi về CRM để admin duyệt.
              </div>
            </div>
            <Link href="/login" className="block w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors text-center">
              Đăng nhập ngay
            </Link>
            <Link href="/download" className="block w-full mt-3 text-blue-600 text-sm font-medium hover:underline">
              Tải POS về máy
            </Link>
          </div>
        ) : step === 2 ? (
          <form onSubmit={handleRegister} className="space-y-4">
            <div className="bg-blue-50 text-blue-700 px-4 py-3 rounded-lg text-sm">
              Đã gửi mã xác nhận đến SĐT <b>{phone}</b>. Nhập mã 6 số để hoàn tất đăng ký.
              {devCode && (
                <div className="mt-2 bg-white border border-blue-200 rounded px-2 py-1 text-center font-mono font-bold tracking-widest">
                  Mã (bản demo): {devCode}
                </div>
              )}
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Mã xác nhận</label>
              <input
                type="text"
                inputMode="numeric"
                maxLength={6}
                value={otpCode}
                onChange={(e) => setOtpCode(e.target.value)}
                className={inputCls + ' text-center font-mono text-lg tracking-widest'}
                placeholder="6 số"
                required
              />
            </div>
            {error && <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg text-sm">{error}</div>}
            <button
              type="submit"
              disabled={loading}
              className="w-full bg-green-600 text-white py-3 rounded-lg font-semibold hover:bg-green-700 disabled:opacity-50 transition-colors"
            >
              {loading ? 'Đang đăng ký...' : 'XÁC NHẬN & ĐĂNG KÝ'}
            </button>
            <button
              type="button"
              disabled={otpTimer > 0}
              onClick={sendOtp}
              className="w-full text-center text-blue-600 text-sm font-medium hover:underline disabled:opacity-50"
            >
              {otpTimer > 0 ? `Gửi lại mã sau ${otpTimer}s` : 'Gửi lại mã'}
            </button>
            <div className="text-center">
              <button type="button" onClick={() => setStep(1)} className="text-gray-500 text-sm hover:underline">
                ← Quay lại
              </button>
            </div>
          </form>
        ) : (
          <form
            onSubmit={(e) => {
              e.preventDefault();
              goToOtp();
            }}
            className="space-y-4"
          >
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Tên cửa hàng</label>
              <input
                type="text"
                value={storeName}
                onChange={(e) => setStoreName(e.target.value)}
                className={inputCls}
                placeholder="Ví dụ: Cửa hàng ABC"
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
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Ngành nghề / Module (chọn nhiều)
              </label>
              {!modulesLoaded ? (
                <div className="text-sm text-gray-400">Đang tải danh sách module...</div>
              ) : modules.length === 0 ? (
                <div className="text-sm text-gray-400">Không có module khả dụng</div>
              ) : (
                <div className="grid grid-cols-2 gap-2">
                  {modules.map((m) => (
                    <button
                      key={m.app_code}
                      type="button"
                      onClick={() => toggleModule(m.app_code)}
                      className={`px-3 py-2 rounded-lg border text-left text-sm font-medium transition-colors ${
                        checked.has(m.app_code)
                          ? 'border-green-600 bg-green-50 text-green-700'
                          : 'border-gray-300 text-gray-700 hover:border-green-400'
                      }`}
                    >
                      <div className="font-medium">{m.app_name}</div>
                      <div className={`text-xs mt-0.5 ${checked.has(m.app_code) ? 'text-green-700' : 'text-gray-400'}`}>
                        {m.price != null ? `${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(m.price)} / 365 ngày` : 'Giá mặc định'}
                      </div>
                    </button>
                  ))}
                </div>
              )}
            </div>

            {selectedModules.length > 0 && (
              <div className="bg-gray-50 rounded-lg p-3 space-y-3">
                <div className="text-sm font-semibold text-gray-700">Chi nhánh theo module</div>
                {selectedModules.map((m) => {
                  const names = branchesByCode[m.app_code] || [];
                  return (
                    <div key={m.app_code} className="bg-white rounded border border-gray-200 p-3 space-y-2">
                      <div className="text-sm font-semibold text-green-700">{m.app_name}</div>
                      <div className="text-xs text-gray-500">
                        Chi nhánh đầu = cửa hàng chính. Thêm chi nhánh để mua thêm (vd: Gara chi nhánh 01).
                      </div>
                      {names.length > 0 ? (
                        names.map((n, idx) => (
                          <div key={idx} className="flex items-center gap-2">
                            <input
                              type="text"
                              value={n}
                              placeholder={idx === 0 ? 'Cửa hàng chính' : `Chi nhánh ${idx}`}
                              onChange={(ev) => setBranchName(m.app_code, idx, ev.target.value)}
                              className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm outline-none focus:ring-2 focus:ring-green-500"
                            />
                            {idx > 0 && (
                              <button type="button" onClick={() => removeBranch(m.app_code, idx)} className="text-red-500 text-sm hover:underline">
                                Xoá
                              </button>
                            )}
                          </div>
                        ))
                      ) : (
                        <div className="flex items-center gap-2">
                          <input
                            type="text"
                            placeholder="Cửa hàng chính"
                            value=""
                            onChange={(ev) => setBranchName(m.app_code, 0, ev.target.value)}
                            className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm outline-none focus:ring-2 focus:ring-green-500"
                          />
                        </div>
                      )}
                      <button
                        type="button"
                        onClick={() => addBranch(m.app_code)}
                        className="text-blue-600 text-xs font-medium hover:underline"
                      >
                        + Thêm chi nhánh (mua thêm)
                      </button>
                    </div>
                  );
                })}
              </div>
            )}

            {error && <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg text-sm">{error}</div>}

            <button
              type="submit"
              disabled={loading}
              className="w-full bg-green-600 text-white py-3 rounded-lg font-semibold hover:bg-green-700 disabled:opacity-50 transition-colors"
            >
              {loading ? 'Đang gửi mã...' : 'TIẾP TỤC'}
            </button>
            <p className="text-xs text-gray-400 text-center">
              Dùng thử 7 ngày miễn phí, quá hạn tài khoản tự khóa. Dữ liệu gửi về CRM để admin duyệt.
            </p>
          </form>
        )}

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
      </div>
    </div>
  );
}
