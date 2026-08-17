import { useState, useEffect } from 'react';
import { API_BASE } from '../config';
import type { ZaloUser, UserLicense } from '../config';

interface Props {
  user: ZaloUser & { id: string };
  licenses: UserLicense[];
  onRefresh: (licenses: UserLicense[]) => void;
  onBack: () => void;
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

function formatDate(d: string | null) {
  if (!d) return '';
  return new Date(d).toLocaleDateString('vi-VN');
}

function daysLeft(expiresAt: string | null) {
  if (!expiresAt) return null;
  const diff = new Date(expiresAt).getTime() - Date.now();
  return Math.max(0, Math.ceil(diff / (1000 * 60 * 60 * 24)));
}

type LicenseState = 'none' | 'trial' | 'trial_expired' | 'paid';

function getLicenseState(lic: UserLicense): LicenseState {
  if (lic.plan === 'trial' && lic.status === 'active') {
    const left = daysLeft(lic.expires_at);
    if (left !== null && left <= 0) return 'trial_expired';
    return 'trial';
  }
  if (lic.plan !== 'trial' && lic.status === 'active') return 'paid';
  return 'none';
}

export default function MyLicenses({ user, licenses, onRefresh, onBack }: Props) {
  const [loading, setLoading] = useState(false);
  const [paying, setPaying] = useState<string | null>(null);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const refresh = async () => {
    setLoading(true);
    try {
      const res = await fetch(`${API_BASE}/api/license/me?zalo_id=${user.zalo_id}`);
      const data = await res.json();
      if (data.licenses) onRefresh(data.licenses);
    } catch {}
    setLoading(false);
  };

  useEffect(() => { refresh(); }, []);

  const handleBuy = async (lic: UserLicense) => {
    setPaying(lic.app_code);
    setError('');
    setSuccess('');
    try {
      // Lay gia tu app
      const appRes = await fetch(`${API_BASE}/api/apps?registration=1`);
      const apps = await appRes.json();
      const app = Array.isArray(apps) ? apps.find((a: any) => a.app_code === lic.app_code) : null;
      const price = app?.price || 899000;

      const res = await fetch(`${API_BASE}/api/payment/create`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          user_id: user.id,
          app_code: lic.app_code,
          plan: 'yearly',
          amount: price,
          zalo_id: user.zalo_id,
        }),
      });
      const data = await res.json();
      if (data.error) throw new Error(data.error);
      if (data.order_url) {
        window.open(data.order_url, '_blank');
        setSuccess('Da tao don hang ' + data.order_code + '. Vui long thanh toan.');
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
          setSuccess('Thanh toan thanh cong!');
          refresh();
          return;
        }
      } catch {}
    }
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-green-600 text-white p-4">
        <button onClick={onBack} className="text-sm mb-2 opacity-80">← Quay lai</button>
        <h1 className="text-xl font-bold">Goi dang su dung</h1>
        <p className="text-green-100 text-sm">Quan ly license cua ban{loading && ' · Dang cap nhat...'}</p>
      </div>

      {error && <div className="bg-red-50 text-red-600 text-sm p-3 m-4 rounded-lg">{error}</div>}
      {success && <div className="bg-green-50 text-green-600 text-sm p-3 m-4 rounded-lg">{success}</div>}

      <div className="p-4 space-y-3">
        {licenses.length === 0 && (
          <div className="text-center text-gray-400 py-8">
            <div className="text-4xl mb-3">📦</div>
            <p>Ban chua co goi nao.</p>
            <p className="text-sm mt-1">Hay chon phan mem de dung thu!</p>
          </div>
        )}

        {licenses.map((lic) => {
          const icon = APP_ICONS[lic.app_code] || '📱';
          const state = getLicenseState(lic);
          const left = daysLeft(lic.expires_at);
          const isPaying = paying === lic.app_code;

          let statusColor = 'bg-gray-100 text-gray-500';
          let statusText = lic.status;
          if (state === 'trial') {
            statusColor = 'bg-orange-100 text-orange-700';
            statusText = `Dung thu · Con ${left} ngay`;
          } else if (state === 'trial_expired') {
            statusColor = 'bg-red-100 text-red-600';
            statusText = 'Het han dung thu';
          } else if (state === 'paid') {
            statusColor = 'bg-green-100 text-green-700';
            statusText = 'Dang hoat dong';
          }

          return (
            <div key={lic.id || lic.app_code} className="bg-white rounded-xl shadow-sm p-4">
              <div className="flex items-start gap-3">
                <div className="text-3xl mt-1">{icon}</div>
                <div className="flex-1 min-w-0">
                  <h3 className="font-bold text-gray-800">{lic.app_name || lic.app_code}</h3>
                  <div className="flex items-center gap-2 mt-1">
                    <span className="text-xs bg-blue-100 text-blue-700 px-2 py-0.5 rounded-full">
                      {lic.plan === 'trial' ? 'Dung thu 7 ngay' : lic.plan === 'yearly' ? '365 ngay' : lic.plan === 'forever' ? 'Vo thoi han' : lic.plan}
                    </span>
                    <span className={`text-xs px-2 py-0.5 rounded-full ${statusColor}`}>{statusText}</span>
                  </div>
                  <div className="text-sm text-gray-500 mt-2 space-y-0.5">
                    {lic.started_at && <div>Ngay bat dau: {formatDate(lic.started_at)}</div>}
                    {lic.expires_at && (
                      <div>
                        Ngay het han: {formatDate(lic.expires_at)}
                        {state === 'trial' && left !== null && left > 0 && (
                          <span className="text-orange-500 font-medium ml-1">(con {left} ngay)</span>
                        )}
                      </div>
                    )}
                    {!lic.expires_at && <div className="text-green-600 font-medium">Vo thoi han</div>}
                  </div>
                </div>
              </div>

              <div className="flex gap-2 mt-3">
                {(state === 'trial' || state === 'trial_expired') && (
                  <button
                    onClick={() => handleBuy(lic)}
                    disabled={isPaying || paying !== null}
                    className="flex-1 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white font-bold py-2.5 rounded-xl text-sm transition"
                  >
                    {isPaying ? 'Dang tao don...' : state === 'trial_expired' ? 'Mua goi' : 'Mua goi ngay'}
                  </button>
                )}
                {state === 'paid' && (
                  <button
                    onClick={() => handleBuy(lic)}
                    disabled={isPaying || paying !== null}
                    className="flex-1 bg-green-600 hover:bg-green-700 disabled:bg-green-400 text-white font-bold py-2.5 rounded-xl text-sm transition"
                  >
                    {isPaying ? 'Dang tao don...' : 'Gia han'}
                  </button>
                )}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
