'use client';
import { useEffect, useState } from 'react';

interface SyncItem {
  owner: { id: string; name: string; email: string; phone: string };
  store: { id: string; name: string };
  app: { code: string; name: string };
  today: { invoices: number; revenue: number; cost: number; profit: number; debt: number };
  display: { invoices: string; revenue: string; cost: string; profit: string; debt: string };
  lastSync: string | null;
}

export default function SyncSummaryPage() {
  const [items, setItems] = useState<SyncItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  useEffect(() => {
    fetch('/api/sync/summary', { headers: { Authorization: `Bearer ${token}` } })
      .then((r) => r.json())
      .then((d) => {
        if (d.error) {
          setError(d.error);
          return;
        }
        setItems(d.items || []);
      })
      .catch(() => setError('Lỗi tải dữ liệu'))
      .finally(() => setLoading(false));
  }, [token]);

  // Gộp theo owner (chủ cửa hàng), bên trong là từng app_code.
  const byOwner = new Map<string, { owner: SyncItem['owner']; list: SyncItem[] }>();
  for (const item of items) {
    if (!byOwner.has(item.owner.id)) {
      byOwner.set(item.owner.id, { owner: item.owner, list: [] });
    }
    byOwner.get(item.owner.id)!.list.push(item);
  }
  const owners = Array.from(byOwner.values());

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Xem đồng bộ - Tổng hợp hôm nay</h1>
      <p className="text-sm text-gray-500 mb-6">
        Phân theo chủ cửa hàng (Owner) và ứng dụng (app_code), kèm ngày giờ đồng bộ cuối.
      </p>

      {error && (
        <div className="bg-red-50 border border-red-200 text-red-600 rounded-xl p-4 mb-6">
          {error}
        </div>
      )}

      {loading && <p className="text-gray-400 text-center py-12">Đang tải...</p>}

      {!loading && !error && owners.length === 0 && (
        <div className="bg-white rounded-xl shadow-sm p-12 text-center text-gray-400">
          Chưa có dữ liệu đồng bộ
        </div>
      )}

      {owners.map(({ owner, list }) => (
        <div key={owner.id} className="mb-8">
          <div className="flex items-center gap-3 mb-4">
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
  );
}
