'use client';
import { useEffect, useState } from 'react';
import Link from 'next/link';

type Package = {
  key: string;
  label: string;
  days: number;
  price: number;
  trial: boolean;
  forever: boolean;
  sort: number;
};

type BankAccount = {
  id: string;
  bank_code: string;
  bank_name: string;
  account_number: string;
  account_holder: string;
  branch: string;
};

type RegisterResult = {
  ok: boolean;
  message?: string;
  userId?: string;
  storeId?: string;
  storeName?: string;
  appCode?: string;
  moduleName?: string;
  plan?: string;
  trial?: boolean;
  expiresAt?: string | null;
  order_code?: string;
  amount?: number;
  bank?: BankAccount;
  error?: string;
};

const formatVND = (n: number) =>
  new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND', maximumFractionDigits: 0 }).format(n);

export default function RegisterPage() {
  const [step, setStep] = useState(1);
  const [storeName, setStoreName] = useState('');
  const [phone, setPhone] = useState('');
  const [password, setPassword] = useState('');
  const [confirm, setConfirm] = useState('');
  const [appCode, setAppCode] = useState<string>('');
  const [planKey, setPlanKey] = useState<string>('trial');
  const [otpCode, setOtpCode] = useState('');
  const [bankAccountId, setBankAccountId] = useState<string>('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<RegisterResult | null>(null);
  const [modules, setModules] = useState<{ app_code: string; app_name: string; price: number | null }[]>([]);
  const [modulesLoaded, setModulesLoaded] = useState(false);
  const [packages, setPackages] = useState<Package[]>([]);
  const [banks, setBanks] = useState<BankAccount[]>([]);
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
        const [appRes, pkgRes, bankRes] = await Promise.all([
          fetch('/api/apps?registration=1'),
          fetch('/api/packages'),
          fetch('/api/bank-accounts'),
        ]);
        const appData = await appRes.json();
        if (Array.isArray(appData) && appData.length > 0) {
          setModules(appData.map((m: { app_code: string; app_name: string; price?: number | null }) => ({ app_code: m.app_code, app_name: m.app_name, price: m.price ?? null })));
        } else {
          // API trả rỗng = tất cả module đang bị ẩn -> KHÔNG fallback danh sách tĩnh
          setModules([]);
        }
        setModulesLoaded(true);
        if (pkgRes.ok) setPackages((await pkgRes.json()).filter((p: { forever?: boolean }) => !p.forever));
        if (bankRes.ok) {
          const data = await bankRes.json();
          setBanks(Array.isArray(data) ? data : []);
          if (Array.isArray(data) && data.length > 0) setBankAccountId(data[0].id);
        }
      } catch {
        // Lỗi kết nối -> giữ danh sách rỗng, không fallback danh sách tĩnh
        setModules([]);
        setModulesLoaded(true);
      }
      // Fallback gói nếu API chưa trả về (server mới hoặc lỗi mạng)
      setPackages((prev) =>
        prev.length > 0
          ? prev
          : [
              { key: 'trial', label: 'Dùng thử 7 ngày', days: 7, price: 0, trial: true, forever: false, sort: 1 },
              { key: 'yearly', label: '365 ngày', days: 365, price: 899000, trial: false, forever: false, sort: 2 },
            ],
      );
    })();
  }, []);

  useEffect(() => {
    if (otpTimer <= 0) return;
    const t = setTimeout(() => setOtpTimer((v) => v - 1), 1000);
    return () => clearTimeout(t);
  }, [otpTimer]);

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
    if (!appCode) {
      setError('Vui lòng chọn ngành nghề / module cho cửa hàng');
      return;
    }
    const selected = packages.find((p) => p.key === planKey);
    if (selected && !selected.trial && !bankAccountId) {
      setError('Vui lòng chọn tài khoản ngân hàng');
      return;
    }
    await sendOtp();
    if (otpSent || !error) {
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
      const body: Record<string, unknown> = {
        store_name: storeName,
        phone,
        password,
        app_code: appCode,
        plan: planKey,
        otp_code: otpCode,
      };
      if (bankAccountId) body.bank_account_id = bankAccountId;
      const res = await fetch('/api/auth/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body),
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
  const selectedPlan = packages.find((p) => p.key === planKey);
  const selectedModule = modules.find((m) => m.app_code === appCode);

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
          <p className="text-gray-500 mt-1">Tạo tài khoản KanPosVN - chọn gói phù hợp</p>
        </div>

        {step === 3 ? (
          <div className="text-center">
            {result?.trial ? (
              <div className="bg-green-50 text-green-700 px-4 py-4 rounded-lg text-sm mb-6">
                <div className="font-semibold text-base mb-1">Đăng ký thành công 🎉</div>
                <div>Cửa hàng: <b>{result.storeName}</b></div>
                <div>Module: <b>{result.moduleName || result.appCode}</b></div>
                <div>Gói dùng thử 7 ngày, hết hạn: {result.expiresAt ? new Date(result.expiresAt).toLocaleDateString('vi-VN') : '-'}</div>
                <div className="mt-2 text-green-800">Xác nhận SĐT thành công, bạn có thể dùng ngay!</div>
              </div>
            ) : (
              <div className="bg-blue-50 text-blue-700 px-4 py-4 rounded-lg text-sm mb-6">
                <div className="font-semibold text-base mb-1">Đăng ký thành công 🎉</div>
                <div>Cửa hàng: <b>{result?.storeName}</b></div>
                <div>Module: <b>{result?.moduleName || result?.appCode}</b></div>
                <div>Gói: <b>{result?.plan === 'yearly' ? '365 ngày' : 'Vĩnh Viễn'}</b></div>
              </div>
            )}

            {!result?.trial && result?.order_code && result?.bank && (
              <div className="bg-amber-50 border border-amber-200 rounded-lg px-4 py-4 text-left text-sm mb-4 space-y-1">
                <div className="font-semibold text-amber-800 mb-2">Bước cuối: chuyển khoản để kích hoạt gói</div>
                <div className="flex justify-between"><span className="text-amber-700">Số tiền:</span><b>{formatVND(result.amount || 0)}</b></div>
                <div className="flex justify-between"><span className="text-amber-700">Ngân hàng:</span><b>{result.bank.bank_name}</b></div>
                <div className="flex justify-between"><span className="text-amber-700">Số tài khoản:</span><b>{result.bank.account_number}</b></div>
                <div className="flex justify-between"><span className="text-amber-700">Chủ tài khoản:</span><b>{result.bank.account_holder}</b></div>
                <div className="flex justify-between"><span className="text-amber-700">Chi nhánh:</span><b>{result.bank.branch}</b></div>
                <div className="pt-2 border-t border-amber-200">
                  <span className="text-amber-700">Nội dung chuyển khoản:</span>
                  <div className="font-mono bg-white rounded px-2 py-1 border border-amber-300 text-center font-bold text-base tracking-widest mt-1">
                    {result.order_code}
                  </div>
                </div>
                <p className="text-xs text-amber-600 mt-2">
                  Nhập đúng mã đơn hàng ở trên vào nội dung chuyển khoản. Quản trị viên sẽ xác nhận và kích hoạt gói trong ít phút.
                </p>
              </div>
            )}

            {result?.trial ? (
              <>
                <Link href="/login" className="block w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors text-center">
                  Đăng nhập ngay
                </Link>
                <Link href="/download" className="block w-full mt-3 text-blue-600 text-sm font-medium hover:underline">
                  Tải POS về máy
                </Link>
              </>
            ) : (
              <>
                <Link href="/login" className="block w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors text-center">
                  Vào kiểm tra tài khoản
                </Link>
                <div className="mt-3 text-xs text-gray-500">
                  Đơn hàng của bạn đang chờ xác nhận. Khi được kích hoạt, đăng nhập là dùng được ngay.
                </div>
              </>
            )}
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
          <>
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
                <label className="block text-sm font-medium text-gray-700 mb-1">Gói dịch vụ</label>
                {packages.length === 0 ? (
                  <div className="text-sm text-gray-400">Đang tải gói...</div>
                ) : (
                  <>
                    <div className="grid grid-cols-3 gap-2">
                      {packages.map((p) => (
                        <button
                          key={p.key}
                          type="button"
                          onClick={() => setPlanKey(p.key)}
                          className={`px-2 py-3 rounded-lg border text-center transition-colors ${
                            planKey === p.key
                              ? 'border-green-600 bg-green-50 text-green-700'
                              : 'border-gray-300 text-gray-700 hover:border-green-400'
                          }`}
                        >
                          <div className="text-xs font-semibold">{p.label}</div>
                          <div className="text-sm font-bold mt-1">
                            {p.price === 0
                              ? 'Miễn phí'
                              : p.key === 'yearly' && selectedModule?.price != null
                                ? formatVND(selectedModule.price)
                                : formatVND(p.price)}
                          </div>
                        </button>
                      ))}
                    </div>
                    {selectedPlan && !selectedPlan.trial && selectedModule?.price != null && (
                      <p className="text-xs text-gray-500 mt-1">
                        Giá gói 365 ngày của <b>{selectedModule.app_name}</b>:{' '}
                        <b className="text-green-700">{formatVND(selectedModule.price)}</b>
                      </p>
                    )}
                  </>
                )}
              </div>

              {selectedPlan && !selectedPlan.trial && (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Chuyển khoản đến tài khoản</label>
                  {banks.length === 0 ? (
                    <div className="text-sm text-gray-400">Đang tải tài khoản ngân hàng...</div>
                  ) : (
                    <div className="space-y-2">
                      {banks.map((b) => (
                        <button
                          key={b.id}
                          type="button"
                          onClick={() => setBankAccountId(b.id)}
                          className={`w-full px-3 py-2 rounded-lg border text-left text-sm transition-colors ${
                            bankAccountId === b.id
                              ? 'border-green-600 bg-green-50 text-green-700'
                              : 'border-gray-300 text-gray-700 hover:border-green-400'
                          }`}
                        >
                          <div className="font-semibold">{b.bank_name}</div>
                          <div className="text-xs opacity-80">
                            {b.account_number} - {b.account_holder}
                            {b.branch ? ` | ${b.branch}` : ''}
                          </div>
                        </button>
                      ))}
                    </div>
                  )}
                </div>
              )}

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Ngành nghề / Module</label>
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
                        onClick={() => setAppCode(m.app_code)}
                        className={`px-3 py-2 rounded-lg border text-left text-sm font-medium transition-colors ${
                          appCode === m.app_code
                            ? 'border-green-600 bg-green-50 text-green-700'
                            : 'border-gray-300 text-gray-700 hover:border-green-400'
                        }`}
                      >
                        <div className="font-medium">{m.app_name}</div>
                        <div className={`text-xs mt-0.5 ${appCode === m.app_code ? 'text-green-700' : 'text-gray-400'}`}>
                          {m.price != null ? formatVND(m.price) + ' / 365 ngày' : 'Giá mặc định'}
                        </div>
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
                {loading ? 'Đang gửi mã...' : 'TIẾP TỤC'}
              </button>
              <p className="text-xs text-gray-400 text-center">
                Gói dùng thử được dùng ngay sau khi xác nhận SĐT. Gói trả phí kích hoạt sau khi chuyển khoản được xác nhận.
              </p>
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
