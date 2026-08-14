'use client';
import { useEffect, useState } from 'react';

interface Stats {
  totalUsers: number;
  activeUsers: number;
  lockedUsers: number;
  totalApps: number;
  recentLogs: number;
}

interface SyncItem {
  owner: { id: string; name: string; email: string; phone: string };
  store: { id: string; name: string };
  app: { code: string; name: string };
  today: { invoices: number; revenue: number; cost: number; profit: number; debt: number };
  display: { invoices: string; revenue: string; cost: string; profit: string; debt: string };
  lastSync: string | null;
}

export default function DashboardPage() {
  const [stats, setStats] = useState<Stats | null>(null);
  const [syncItems, setSyncItems] = useState<SyncItem[]>([]);
  const [syncLoading, setSyncLoading] = useState(true);
  const [syncError, setSyncError] = useState('');
  const [selectedOwnerId, setSelectedOwnerId] = useState('');
  const [selectedAppCode, setSelectedAppCode] = useState('');

  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  useEffect(() => {
    fetch('/api/dashboard', { headers: { Authorization: `Bearer ${token}` } })
      .then((r) => r.json())
      .then(setStats)
      .catch(() => setStats(null));
  }, [token]);

  useEffect(() => {
    fetch('/api/sync/summary', { headers: { Authorization: `Bearer ${token}` } })
      .then((r) => r.json())
      .then((d) => {
        if (d.error) {
          setSyncError(d.error);
          return;
        }
        setSyncItems(d.items || []);
      })
      .catch(() => setSyncError('Lỗi tải dữ liệu đồng bộ'))
      .finally(() => setSyncLoading(false));
  }, [token]);

  const cards = stats
    ? [
        { label: 'Tổng Users', value: stats.totalUsers, color: 'bg-blue-500', icon: '👥' },
        { label: 'Đang hoạt động', value: stats.activeUsers, color: 'bg-green-500', icon: '✅' },
        { label: 'Đã khóa', value: stats.lockedUsers, color: 'bg-red-500', icon: '🔒' },
        { label: 'Ứng dụng', value: stats.totalApps, color: 'bg-purple-500', icon: '📱' },
        { label: 'Log 24h', value: stats.recentLogs, color: 'bg-yellow-500', icon: '📝' },
      ]
    : [];

  // Gộp theo owner (chủ cửa hàng), bên trong là từng app_code.
  const byOwner = new Map<string, { owner: SyncItem['owner']; list: SyncItem[] }>();
  for (const item of syncItems) {
    if (!byOwner.has(item.owner.id)) {
      byOwner.set(item.owner.id, { owner: item.owner, list: [] });
    }
    byOwner.get(item.owner.id)!.list.push(item);
  }
  const owners = Array.from(byOwner.values());

  // Dropdown chọn user cloud (Owner) + app_code tương ứng của user đó.
  const ownerOptions = owners.map(({ owner }) => ({
    id: owner.id,
    label: `${owner.name || owner.email || owner.phone || owner.id} — ${owner.phone || owner.email || ''}`,
  }));
  const availableApps = selectedOwnerId
    ? (owners.find((o) => o.owner.id === selectedOwnerId)?.list ?? [])
    : syncItems;
  const appOptions = Array.from(
    new Map(availableApps.map((it) => [it.app.code, it.app.name])).entries(),
  ).map(([code, name]) => ({ code, name }));

  const filtered = syncItems.filter(
    (it) =>
      (!selectedOwnerId || it.owner.id === selectedOwnerId) &&
      (!selectedAppCode || it.app.code === selectedAppCode),
  );
  const filteredByOwner = new Map<string, { owner: SyncItem['owner']; list: SyncItem[] }>();
  for (const item of filtered) {
    if (!filteredByOwner.has(item.owner.id)) {
      filteredByOwner.set(item.owner.id, { owner: item.owner, list: [] });
    }
    filteredByOwner.get(item.owner.id)!.list.push(item);
  }
  const filteredOwners = Array.from(filteredByOwner.values());

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Tổng quan hệ thống</h1>
      <div className="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-5 gap-4 mb-8">
        {cards.map((card) => (
          <div key={card.label} className="bg-white rounded-xl shadow-sm p-6">
            <div className="flex items-center justify-between mb-3">
              <span className="text-2xl">{card.icon}</span>
              <div className={`w-3 h-3 rounded-full ${card.color}`} />
            </div>
            <div className="text-3xl font-bold">{card.value ?? '...'}</div>
            <div className="text-sm text-gray-500 mt-1">{card.label}</div>
          </div>
        ))}
      </div>

      <div className="mb-6">
        <h2 className="text-xl font-bold mb-2">Tóm tắt đồng bộ dữ liệu theo user owner</h2>
        <p className="text-sm text-gray-500 mb-4">
          Phân theo chủ cửa hàng (Owner) và ứng dụng (app_code), kèm ngày giờ đồng bộ cuối.
        </p>

        {syncError && (
          <div className="bg-red-50 border border-red-200 text-red-600 rounded-xl p-4 mb-4">
            {syncError}
          </div>
        )}

        {syncLoading && <p className="text-gray-400 text-center py-8">Đang tải...</p>}

        {!syncLoading && !syncError && (
          <div className="flex flex-wrap items-center gap-3 mb-6 bg-white rounded-xl shadow-sm p-4">
            <div className="flex-1 min-w-[220px]">
              <label className="block text-xs font-medium text-gray-500 mb-1">
                Chủ cửa hàng (Owner)
              </label>
              <select
                value={selectedOwnerId}
                onChange={(e) => {
                  setSelectedOwnerId(e.target.value);
                  setSelectedAppCode('');
                }}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm outline-none bg-white"
              >
                <option value="">Tất cả chủ cửa hàng</option>
                {ownerOptions.map((o) => (
                  <option key={o.id} value={o.id}>
                    {o.label}
                  </option>
                ))}
              </select>
            </div>
            <div className="flex-1 min-w-[220px]">
              <label className="block text-xs font-medium text-gray-500 mb-1">
                Ứng dụng / app_code
              </label>
              <select
                value={selectedAppCode}
                onChange={(e) => setSelectedAppCode(e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm outline-none bg-white"
              >
                <option value="">Tất cả app</option>
                {appOptions.map((a) => (
                  <option key={a.code} value={a.code}>
                    {a.name} ({a.code})
                  </option>
                ))}
              </select>
            </div>
            {(selectedOwnerId || selectedAppCode) && (
              <button
                onClick={() => {
                  setSelectedOwnerId('');
                  setSelectedAppCode('');
                }}
                className="px-4 py-2 text-sm text-blue-600 font-medium hover:underline self-end"
              >
                Xóa lọc
              </button>
            )}
          </div>
        )}

        {!syncLoading && !syncError && filteredOwners.length === 0 && (
          <div className="bg-white rounded-xl shadow-sm p-10 text-center text-gray-400">
            Chưa có dữ liệu đồng bộ
          </div>
        )}

        {filteredOwners.map(({ owner, list }) => (
          <div key={owner.id} className="mb-6">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-10 h-10 rounded-full bg-amber-500 text-white flex items-center justify-center font-bold">
                {(owner.name || owner.email || '?').charAt(0).toUpperCase()}
              </div>
              <div>
                <div className="font-semibold text-gray-800">
                  {owner.name || 'Chủ cửa hàng'}
                  <span className="ml-2 text-xs text-gray-400">#{owner.id.slice(0, 8)}</span>
                </div>
                <div className="text-sm text-gray-500">
                  {[owner.phone, owner.email].filter(Boolean).join(' · ') || 'Chưa có thông tin liên hệ'}
                </div>
              </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
              {list.map((item) => (
                <div
                  key={`${item.app.code}-${item.store.id}`}
                  className="bg-white rounded-xl shadow-sm overflow-hidden"
                >
                  <div className="px-6 py-4 border-b bg-amber-50 flex items-center justify-between">
                    <div>
                      <div className="font-bold text-gray-800">{item.app.name}</div>
                      <div className="text-xs text-gray-500 font-mono">app_code: {item.app.code}</div>
                    </div>
                    <span className="text-xs px-2 py-1 rounded-full bg-blue-100 text-blue-700">
                      {item.store.name || 'Chưa có tên cửa hàng'}
                    </span>
                  </div>

                  <pre className="px-6 py-4 font-mono text-sm text-gray-800 leading-7 whitespace-pre-wrap">
{`DASHBOARD HÔM NAY
${'='.repeat(30)}
🧾 Hóa đơn      ${item.display.invoices}
💰 Doanh thu    ${item.display.revenue}
💸 Chi phí      ${item.display.cost}
📈 Lợi nhuận    ${item.display.profit}
📒 Công nợ      ${item.display.debt}
⏰ Đồng bộ      ${item.lastSync ?? 'chưa đồng bộ'}`}
                  </pre>
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
