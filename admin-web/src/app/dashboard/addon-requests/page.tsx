'use client';
import { useEffect, useState } from 'react';

interface AddonRequest {
  id: string;
  user_id: string;
  payload: string;
  status: string;
  plan: string | null;
  requested_at: string;
  resolved_at: string | null;
  resolved_by: string | null;
  note: string;
  full_name: string | null;
  phone: string | null;
  email: string | null;
  store_id: string | null;
  store_name: string | null;
}

interface PayloadModule { app_code: string; branches: { name?: string; phone?: string; address?: string }[] }

function parsePayload(p: string): { modules: PayloadModule[] } {
  try { return JSON.parse(p); } catch { return { modules: [] }; }
}

function planLabel(plan: string | null) {
  if (plan === 'trial') return 'Dùng thử';
  if (plan === 'yearly') return 'Theo năm';
  if (plan === 'forever') return 'Vĩnh viễn';
  return plan ? plan : '—';
}

export default function AddonRequestsPage() {
  const [requests, setRequests] = useState<AddonRequest[]>([]);
  const [filter, setFilter] = useState<'pending' | 'all'>('pending');
  const [error, setError] = useState('');
  const [busyId, setBusyId] = useState<string | null>(null);
  const [approvePlan, setApprovePlan] = useState('trial');
  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  const load = async () => {
    const qs = filter === 'pending' ? '?status=pending' : '';
    const res = await fetch(`/api/crm/addon-requests${qs}`, { headers: { Authorization: `Bearer ${token}` } });
    const data = await res.json();
    setRequests(Array.isArray(data) ? data : []);
  };

  useEffect(() => { load(); }, [filter]);

  const act = async (id: string, action: 'approve' | 'reject', plan?: string) => {
    setError('');
    setBusyId(id);
    try {
      const res = await fetch(`/api/crm/addon-requests/${id}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
        body: JSON.stringify({ action, plan: action === 'approve' ? plan : undefined }),
      });
      const data = await res.json();
      if (!res.ok) { setError(data.error || 'Lỗi xử lý'); return; }
      load();
    } catch (e) {
      setError('Lỗi mạng');
    } finally {
      setBusyId(null);
    }
  };

  return (
    <div>
      <h1 className="text-2xl font-bold mb-2">Duyệt mua thêm Module / Chi nhánh</h1>
      <p className="text-gray-500 text-sm mb-4">Duyệt yêu cầu thêm module/chi nhánh của user đã tồn tại.</p>

      {error && <div className="bg-red-50 text-red-700 px-4 py-2 rounded mb-4 text-sm">{error}</div>}

      <div className="flex gap-2 mb-4">
        {(['pending', 'all'] as const).map((f) => (
          <button
            key={f}
            onClick={() => setFilter(f)}
            className={`px-4 py-2 rounded-lg text-sm font-medium ${filter === f ? 'bg-blue-600 text-white' : 'bg-gray-200 text-gray-700'}`}
          >
            {f === 'pending' ? '⏳ Đang chờ' : '📋 Tất cả'}
          </button>
        ))}
      </div>

      {requests.length === 0 ? (
        <div className="bg-white rounded-lg p-8 text-center text-gray-400 border">Không có yêu cầu nào.</div>
      ) : (
        <div className="space-y-4">
          {requests.map((r) => {
            const payload = parsePayload(r.payload);
            const isPending = r.status === 'pending';
            return (
              <div key={r.id} className="bg-white rounded-lg border p-4">
                <div className="flex flex-wrap items-center justify-between gap-2 mb-3">
                  <div>
                    <div className="font-semibold">{r.store_name || r.full_name || '—'}</div>
                    <div className="text-sm text-gray-500">{r.phone || r.email || ''}</div>
                  </div>
                  <div className="text-sm text-gray-400">{new Date(r.requested_at).toLocaleString('vi-VN')}</div>
                  <div className="text-sm">
                    {isPending ? (
                      <span className="bg-amber-100 text-amber-800 px-3 py-1 rounded-full">⏳ Đang chờ</span>
                    ) : r.status === 'approved' ? (
                      <span className="bg-green-100 text-green-800 px-3 py-1 rounded-full">✅ Đã duyệt · {planLabel(r.plan)}</span>
                    ) : (
                      <span className="bg-red-100 text-red-800 px-3 py-1 rounded-full">❌ Đã từ chối</span>
                    )}
                  </div>
                </div>

                <div className="space-y-2">
                  {payload.modules.map((m) => (
                    <div key={m.app_code} className="border rounded-lg p-3 bg-gray-50">
                      <div className="font-semibold text-sm">{m.app_code}</div>
                      <div className="text-sm text-gray-600 mt-1">
                        Chi nhánh:{' '}
                        {m.branches.map((b, i) => (
                          <span key={i} className="inline-block bg-white border rounded px-2 py-0.5 mr-2 mb-1">
                            {b.name || `Chi nhánh ${i + 1}`}
                            {b.phone ? ` · ${b.phone}` : ''}
                          </span>
                        ))}
                      </div>
                    </div>
                  ))}
                </div>

                {!isPending && (r.note || r.resolved_by) && (
                  <div className="text-xs text-gray-400 mt-3">
                    {r.resolved_by ? `Xử lý bởi: ${r.resolved_by}` : ''}
                    {r.note ? ` · Ghi chú: ${r.note}` : ''}
                  </div>
                )}

                {isPending && (
                  <div className="mt-4 flex flex-wrap items-center gap-3">
                    <label className="text-sm text-gray-600">Chọn gói cấp:</label>
                    <select
                      value={approvePlan}
                      onChange={(e) => setApprovePlan(e.target.value)}
                      className="border rounded-lg px-3 py-2 text-sm"
                    >
                      <option value="trial">Dùng thử 7 ngày</option>
                      <option value="yearly">Theo năm (365 ngày)</option>
                      <option value="forever">Vĩnh viễn</option>
                    </select>
                    <button
                      disabled={busyId === r.id}
                      onClick={() => act(r.id, 'approve', approvePlan)}
                      className="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-medium disabled:opacity-50"
                    >
                      {busyId === r.id ? 'Đang xử lý...' : '✅ Duyệt & cấp gói'}
                    </button>
                    <button
                      disabled={busyId === r.id}
                      onClick={() => act(r.id, 'reject')}
                      className="bg-red-100 text-red-700 px-4 py-2 rounded-lg text-sm font-medium disabled:opacity-50"
                    >
                      Từ chối
                    </button>
                  </div>
                )}
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}
