import { useState, useEffect } from 'react';
import { API_BASE } from '../config';
import type { ZaloUser, CustomerBranch } from '../config';

interface Props {
  user: ZaloUser;
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
  kanposvnhrpayroll: '💼',
  nhansu: '👥',
};

function daysLeft(expiresAt: string | null) {
  if (!expiresAt) return null;
  const diff = new Date(expiresAt).getTime() - Date.now();
  return Math.max(0, Math.ceil(diff / (1000 * 60 * 60 * 24)));
}

export default function Branches({ user, onBack }: Props) {
  const [branches, setBranches] = useState<CustomerBranch[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const [addingApp, setAddingApp] = useState<string | null>(null);
  const [branchName, setBranchName] = useState('');
  const [submitting, setSubmitting] = useState(false);

  const refresh = async () => {
    try {
      const res = await fetch(`${API_BASE}/api/zalo/branch/list?zalo_id=${user.zalo_id}`);
      const data = await res.json();
      setBranches(Array.isArray(data.branches) ? data.branches : []);
    } catch {}
    setLoading(false);
  };

  useEffect(() => { refresh(); }, []);

  const grouped = branches.reduce<Record<string, CustomerBranch[]>>((acc, b) => {
    (acc[b.app_code] = acc[b.app_code] || []).push(b);
    return acc;
  }, {});

  const handleAdd = async (appCode: string) => {
    if (!branchName.trim()) {
      setError('Vui long nhap ten chi nhanh');
      return;
    }
    setSubmitting(true);
    setError('');
    setSuccess('');
    try {
      const res = await fetch(`${API_BASE}/api/zalo/branch/create`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          zalo_id: user.zalo_id,
          app_code: appCode,
          branch_name: branchName.trim(),
        }),
      });
      const data = await res.json();
      if (data.error) throw new Error(data.error);
      setSuccess('Da them chi nhanh thanh cong!');
      setBranchName('');
      setAddingApp(null);
      await refresh();
    } catch (e: any) {
      setError('Loi: ' + String(e?.message || e));
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-teal-600 text-white p-4">
        <button onClick={onBack} className="text-sm mb-2 opacity-80">← Quay lai</button>
        <h1 className="text-xl font-bold">Quan ly chi nhanh</h1>
        <p className="text-teal-100 text-sm">Them chi nhanh cho tung phan mem cua ban</p>
      </div>

      {error && <div className="bg-red-50 text-red-600 text-sm p-3 m-4 rounded-lg">{error}</div>}
      {success && <div className="bg-green-50 text-green-600 text-sm p-3 m-4 rounded-lg">{success}</div>}

      {loading ? (
        <div className="p-8 text-center text-gray-400">Dang tai...</div>
      ) : Object.keys(grouped).length === 0 ? (
        <div className="px-4 py-10 text-center text-gray-400">
          <div className="text-4xl mb-3">🏪</div>
          <p>Ban chua co chi nhanh nao.</p>
          <p className="text-sm mt-1">Chon phan mem de dung thu truoc.</p>
        </div>
      ) : (
        <div className="p-4 space-y-3">
          {Object.entries(grouped).map(([appCode, list]) => {
            const icon = APP_ICONS[appCode] || '📱';
            const appName = list[0]?.app_name || appCode;
            return (
              <div key={appCode} className="bg-white rounded-xl shadow-sm p-4">
                <div className="flex items-center gap-2 mb-3">
                  <span className="text-2xl">{icon}</span>
                  <h3 className="font-bold text-gray-800">{appName}</h3>
                </div>

                <div className="space-y-2">
                  {list.map((b) => {
                    const left = b.license ? daysLeft(b.license.expires_at) : null;
                    const isTrial = b.license?.plan === 'trial';
                    return (
                      <div key={b.id} className="flex items-center justify-between bg-gray-50 rounded-lg px-3 py-2">
                        <div>
                          <div className="font-medium text-gray-700 text-sm">
                            {b.is_default && <span className="text-xs bg-blue-100 text-blue-700 px-1.5 py-0.5 rounded mr-1">CHINH</span>}
                            {b.name}
                          </div>
                          <div className="text-xs text-gray-500">
                            {b.branch_code}
                            {isTrial && left !== null ? ` · Con ${left} ngay dung thu` : b.license ? ` · ${b.license.plan}` : ' · Chua co license'}
                          </div>
                        </div>
                        {isTrial && (
                          <span className="text-xs bg-orange-100 text-orange-700 px-2 py-0.5 rounded-full">Dung thu</span>
                        )}
                      </div>
                    );
                  })}
                </div>

                {addingApp === appCode ? (
                  <div className="mt-3 flex gap-2">
                    <input
                      value={branchName}
                      onChange={(e) => setBranchName(e.target.value)}
                      placeholder="Ten chi nhanh (vd: Cua hang 2)"
                      className="flex-1 border rounded-lg px-3 py-2 text-sm"
                    />
                    <button
                      onClick={() => handleAdd(appCode)}
                      disabled={submitting}
                      className="bg-teal-600 hover:bg-teal-700 disabled:bg-teal-300 text-white font-bold px-4 rounded-lg text-sm"
                    >
                      {submitting ? 'Dang them...' : 'Them'}
                    </button>
                    <button onClick={() => { setAddingApp(null); setBranchName(''); }} className="text-gray-400 px-2 text-sm">
                      Huy
                    </button>
                  </div>
                ) : (
                  <button
                    onClick={() => setAddingApp(appCode)}
                    className="mt-3 w-full border border-dashed border-teal-400 text-teal-600 hover:bg-teal-50 font-bold py-2 rounded-lg text-sm transition"
                  >
                    + Them chi nhanh ({appName})
                  </button>
                )}
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}
