import { useState, useEffect } from 'react';
import { API_BASE } from '../config';
import type { SoftwareItem, UserLicense } from '../config';

interface Props {
  user: { id: string; zalo_id: string; full_name: string; phone: string };
  licenses: UserLicense[];
  onBack: () => void;
  onTrial: (appCode: string) => void;
  onRefresh: (licenses: UserLicense[]) => void;
}

const APP_ICONS: Record<string, string> = {
  kanposvncafe: '☕',
  kanposvnnhahangquanan: '🍜',
  kanposvnnhathuoc: '💊',
  kanposvnvlxd: '🏗️',
  kanposvngara: '🔧',
  kanposvnbida: '🎱',
  kanposvnspa: '💆',
  kanposvnkhachsan: '🏨',
  kanhot_one: '🌿',
  kanposvnbanvevantai: '🚌',
  kanposvnqlcd: '🎬',
  kanposvnnhatro200: '🏠',
  kanposvnnbatdongsan: '🏢',
  nhansu: '👥',
};

const APP_DESCS: Record<string, string> = {
  kanposvncafe: 'Quan ly ban hang, kho hang, doanh thu cho cafe',
  kanposvnnhahangquanan: 'Quan ly ban hang, ban goi, thuc don nha hang',
  kanposvnnhathuoc: 'Quan ly ban thuoc, kho thuoc, don thuoc',
  kanposvnvlxd: 'Quan ly ban hang VLXD, kho hang, don hang',
  kanposvngara: 'Quan ly sua chua, phu tung, kho hang gara',
  kanposvnbida: 'Quan ly ban, gio choi, thanh toan bida',
  kanposvnspa: 'Quan ly dich vu, lich hen, nhan vien spa',
  kanposvnkhachsan: 'Quan ly phong, dat phong, check-in/out',
  kanhot_one: 'Quan ly hoa don, kho hang tap hoa',
  kanposvnbanvevantai: 'Ban ve, quan ly chuyen di',
  kanposvnqlcd: 'Quan ly can ho, cu dan, phi quan ly',
  kanposvnnhatro200: 'Quan ly nha tro, phong, khach thue',
  kanposvnnbatdongsan: 'Quan ly bat dong san, tin dang',
  nhansu: 'Quan ly nhan su, luong, cham cong',
};

function formatPrice(price: number | null) {
  if (!price) return 'Mien phi';
  return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price) + '/nam';
}

function daysLeft(expiresAt: string | null) {
  if (!expiresAt) return null;
  const diff = new Date(expiresAt).getTime() - Date.now();
  return Math.max(0, Math.ceil(diff / (1000 * 60 * 60 * 24)));
}

type LicenseState = 'none' | 'trial' | 'trial_expired' | 'paid';

function getLicenseState(licenses: UserLicense[], appCode: string): { state: LicenseState; license: UserLicense | null } {
  const lic = licenses.find((l) => l.app_code === appCode && l.device_id === '');
  if (!lic) return { state: 'none', license: null };
  if (lic.plan === 'trial' && lic.status === 'active') {
    const left = daysLeft(lic.expires_at);
    if (left !== null && left <= 0) return { state: 'trial_expired', license: lic };
    return { state: 'trial', license: lic };
  }
  if (lic.plan !== 'trial' && lic.status === 'active') {
    return { state: 'paid', license: lic };
  }
  return { state: 'none', license: lic };
}

export default function SoftwareList({ user, licenses, onBack, onTrial, onRefresh }: Props) {
  const [softwares, setSoftwares] = useState<SoftwareItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [trialing, setTrialing] = useState<string | null>(null);
  const [paying, setPaying] = useState<string | null>(null);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  useEffect(() => {
    fetch(`${API_BASE}/api/apps?registration=1`)
      .then((r) => r.json())
      .then((data) => {
        setSoftwares(Array.isArray(data) ? data : []);
        setLoading(false);
      })
      .catch(() => setLoading(false));
  }, []);

  const handleTrial = async (appCode: string) => {
    setTrialing(appCode);
    setError('');
    setSuccess('');
    try {
      await onTrial(appCode);
      setSuccess('Tao dung thu thanh cong!');
    } catch (e: any) {
      setError('Loi: ' + String(e?.message || e));
    } finally {
      setTrialing(null);
    }
  };

  const handleBuy = async (sw: SoftwareItem) => {
    setPaying(sw.app_code);
    setError('');
    setSuccess('');
    try {
      const res = await fetch(`${API_BASE}/api/payment/create`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          user_id: user.id,
          app_code: sw.app_code,
          plan: 'yearly',
          amount: sw.price || 899000,
          zalo_id: user.zalo_id,
        }),
      });
      const data = await res.json();
      if (data.error) throw new Error(data.error);
      if (data.order_url) {
        // Mo trang thanh toan ZaloPay
        window.open(data.order_url, '_blank');
        setSuccess('Da tao don hang ' + data.order_code + '. Vui long thanh toan.');
        // Poll payment status
        pollPaymentStatus(data.order_code);
      } else {
        throw new Error('Khong nhan duoc link thanh toan');
      }
    } catch (e: any) {
      setError('Loi: ' + String(e?.message || e));
    } finally {
      setPaying(null);
    }
  };

  const pollPaymentStatus = async (orderCode: string) => {
    for (let i = 0; i < 30; i++) {
      await new Promise((r) => setTimeout(r, 3000));
      try {
        const res = await fetch(`${API_BASE}/api/payment/query?order_code=${orderCode}`);
        const data = await res.json();
        if (data.status === 'paid') {
          setSuccess('Thanh toan thanh cong! License da duoc kich hoat.');
          // Refresh licenses
          const licRes = await fetch(`${API_BASE}/api/license/me?zalo_id=${user.zalo_id}`);
          const licData = await licRes.json();
          if (licData.licenses) onRefresh(licData.licenses);
          return;
        }
      } catch {}
    }
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-blue-600 text-white p-4">
        <button onClick={onBack} className="text-sm mb-2 opacity-80">
          ← Quay lai
        </button>
        <h1 className="text-xl font-bold">Danh sach phan mem</h1>
        <p className="text-blue-100 text-sm">Chon phan mem de dung thu hoac mua goi</p>
      </div>

      {error && <div className="bg-red-50 text-red-600 text-sm p-3 m-4 rounded-lg">{error}</div>}
      {success && <div className="bg-green-50 text-green-600 text-sm p-3 m-4 rounded-lg">{success}</div>}

      {loading ? (
        <div className="p-8 text-center text-gray-400">Dang tai...</div>
      ) : (
        <div className="p-4 space-y-3">
          {softwares.map((sw) => {
            const icon = APP_ICONS[sw.app_code] || '📱';
            const desc = APP_DESCS[sw.app_code] || sw.description || '';
            const { state, license } = getLicenseState(licenses, sw.app_code);
            const isTrialing = trialing === sw.app_code;
            const isPaying = paying === sw.app_code;
            const left = license ? daysLeft(license.expires_at) : null;

            return (
              <div key={sw.app_code} className="bg-white rounded-xl shadow-sm p-4">
                <div className="flex items-start gap-3">
                  <div className="text-3xl mt-1">{icon}</div>
                  <div className="flex-1 min-w-0">
                    <h3 className="font-bold text-gray-800">{sw.app_name}</h3>
                    {desc && <p className="text-sm text-gray-500 mt-0.5">{desc}</p>}
                    <div className="flex items-center gap-2 mt-2">
                      <span className="text-lg font-bold text-blue-600">{formatPrice(sw.price)}</span>
                    </div>
                  </div>
                </div>

                {/* Trang thai license */}
                {state === 'trial' && (
                  <div className="mt-2 bg-orange-50 text-orange-700 text-sm px-3 py-2 rounded-lg">
                    Dang dung thu · Con {left} ngay · Het han: {license?.expires_at ? new Date(license.expires_at).toLocaleDateString('vi-VN') : ''}
                  </div>
                )}
                {state === 'trial_expired' && (
                  <div className="mt-2 bg-red-50 text-red-700 text-sm px-3 py-2 rounded-lg">
                    Dung thu da het han
                  </div>
                )}
                {state === 'paid' && (
                  <div className="mt-2 bg-green-50 text-green-700 text-sm px-3 py-2 rounded-lg">
                    Da mua goi · Het han: {license?.expires_at ? new Date(license.expires_at).toLocaleDateString('vi-VN') : 'Vo thoi han'}
                  </div>
                )}

                {/* Nut hanh dong */}
                <div className="flex gap-2 mt-3">
                  {state === 'none' && (
                    <>
                      <button
                        onClick={() => handleTrial(sw.app_code)}
                        disabled={isTrialing || trialing !== null}
                        className="flex-1 bg-orange-500 hover:bg-orange-600 disabled:bg-orange-300 text-white font-bold py-2.5 rounded-xl text-sm transition"
                      >
                        {isTrialing ? 'Dang tao...' : 'Dung thu 7 ngay'}
                      </button>
                      <button
                        onClick={() => handleBuy(sw)}
                        disabled={isPaying || paying !== null}
                        className="flex-1 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white font-bold py-2.5 rounded-xl text-sm transition"
                      >
                        {isPaying ? 'Dang tao don...' : 'Mua goi'}
                      </button>
                    </>
                  )}
                  {state === 'trial' && (
                    <button
                      onClick={() => handleBuy(sw)}
                      disabled={isPaying || paying !== null}
                      className="w-full bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white font-bold py-2.5 rounded-xl text-sm transition"
                    >
                      {isPaying ? 'Dang tao don...' : 'Mua goi ngay'}
                    </button>
                  )}
                  {state === 'trial_expired' && (
                    <button
                      onClick={() => handleBuy(sw)}
                      disabled={isPaying || paying !== null}
                      className="w-full bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white font-bold py-2.5 rounded-xl text-sm transition"
                    >
                      {isPaying ? 'Dang tao don...' : 'Mua goi'}
                    </button>
                  )}
                  {state === 'paid' && (
                    <button
                      onClick={() => handleBuy(sw)}
                      disabled={isPaying || paying !== null}
                      className="w-full bg-green-600 hover:bg-green-700 disabled:bg-green-400 text-white font-bold py-2.5 rounded-xl text-sm transition"
                    >
                      {isPaying ? 'Dang tao don...' : 'Gia han'}
                    </button>
                  )}
                </div>
              </div>
            );
          })}

          {softwares.length === 0 && (
            <div className="text-center text-gray-400 py-8">Chua co phan mem nao</div>
          )}
        </div>
      )}
    </div>
  );
}
