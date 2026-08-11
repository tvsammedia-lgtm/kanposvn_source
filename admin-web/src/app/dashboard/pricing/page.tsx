'use client';
import { useEffect, useState } from 'react';

type Package = {
  id: string;
  key: string;
  label: string;
  days: number;
  price: number;
  trial: boolean;
  forever: boolean;
  active: boolean;
  sort: number;
};

type BankAccount = {
  id: string;
  bank_code: string;
  bank_name: string;
  account_number: string;
  account_holder: string;
  branch: string;
  active: boolean;
};

type Order = {
  id: string;
  order_code: string;
  user_id: string;
  app_code: string;
  plan: string;
  amount: number;
  status: string;
  payment_method: string;
  bank_code: string;
  bank_account_id: string;
  description: string;
  confirm_note: string;
  created_at: string;
  paid_at: string;
  phone: string;
  full_name: string;
};

const formatVND = (n: number) =>
  new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND', maximumFractionDigits: 0 }).format(n);

const planLabel = (key: string) => {
  if (key === 'trial') return 'Dùng thử 7 ngày';
  if (key === 'yearly') return '365 ngày';
  if (key === 'forever') return 'Vĩnh Viễn';
  return key;
};

export default function PricingPage() {
  const [tab, setTab] = useState<'packages' | 'banks' | 'orders'>('orders');
  const [packages, setPackages] = useState<Package[]>([]);
  const [banks, setBanks] = useState<BankAccount[]>([]);
  const [orders, setOrders] = useState<Order[]>([]);
  const [error, setError] = useState('');
  const [saving, setSaving] = useState(false);

  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  const loadPackages = async () => {
    const res = await fetch('/api/packages?all=1', { headers: { Authorization: `Bearer ${token}` } });
    if (res.ok) setPackages(await res.json());
  };
  const loadBanks = async () => {
    const res = await fetch('/api/bank-accounts?all=1', { headers: { Authorization: `Bearer ${token}` } });
    if (res.ok) setBanks(await res.json());
  };
  const loadOrders = async (status: string) => {
    const res = await fetch(`/api/license/orders?status=${status}`, { headers: { Authorization: `Bearer ${token}` } });
    if (res.ok) setOrders(await res.json());
  };

  useEffect(() => {
    loadPackages();
    loadBanks();
    loadOrders('pending');
  }, []);

  const savePackages = async () => {
    setSaving(true);
    setError('');
    const items = packages.map((p) => ({
      key: p.key,
      label: p.label,
      days: Number(p.days) || 0,
      price: Number(p.price) || 0,
      trial: p.trial,
      forever: p.forever,
      active: p.active,
      sort: Number(p.sort) || 0,
    }));
    const res = await fetch('/api/packages', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ items }),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error || 'Lỗi lưu gói'); }
    else { setPackages(data); }
    setSaving(false);
  };

  const saveBank = async (bank: BankAccount) => {
    setError('');
    const res = await fetch(`/api/bank-accounts/${bank.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify(bank),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error || 'Lỗi cập nhật ngân hàng'); return; }
    loadBanks();
  };

  const addBank = async () => {
    setError('');
    const res = await fetch('/api/bank-accounts', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ bank_code: 'NEW', bank_name: 'Ngân hàng mới', account_number: '', account_holder: '', branch: '', active: true }),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error || 'Lỗi thêm ngân hàng'); return; }
    loadBanks();
  };

  const deleteBank = async (id: string) => {
    if (!confirm('Xóa tài khoản ngân hàng này?')) return;
    setError('');
    const res = await fetch(`/api/bank-accounts/${id}`, {
      method: 'DELETE',
      headers: { Authorization: `Bearer ${token}` },
    });
    if (!res.ok) { setError('Lỗi xóa ngân hàng'); return; }
    loadBanks();
  };

  const confirmOrder = async (order: Order) => {
    if (!confirm(`Xác nhận đã nhận chuyển khoản đơn ${order.order_code} (${formatVND(order.amount)}) và kích hoạt gói?`)) return;
    setError('');
    const res = await fetch('/api/license/orders', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ order_code: order.order_code, confirm_note: 'Xác nhận thủ công bởi admin' }),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error || 'Lỗi xác nhận'); return; }
    alert(data.message || 'Đã xác nhận');
    loadOrders('pending');
  };

  const tabCls = (t: string) =>
    `px-4 py-2 rounded-lg text-sm font-semibold transition-colors ${
      tab === t ? 'bg-blue-600 text-white' : 'bg-white text-gray-600 border border-gray-200 hover:border-blue-400'
    }`;

  const inputCls =
    'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none';

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">💳 Giá & Bản quyền</h1>
        <div className="flex gap-2">
          <button onClick={() => { setTab('orders'); loadOrders('pending'); }} className={tabCls('orders')}>
            Đơn chờ xác nhận ({orders.filter((o) => o.status === 'pending').length})
          </button>
          <button onClick={() => setTab('packages')} className={tabCls('packages')}>Gói dịch vụ</button>
          <button onClick={() => setTab('banks')} className={tabCls('banks')}>Ngân hàng</button>
        </div>
      </div>

      {error && <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg text-sm">{error}</div>}

      {tab === 'orders' && (
        <div className="bg-white rounded-xl shadow p-6">
          {orders.length === 0 ? (
            <p className="text-gray-400 text-sm">Không có đơn chờ xác nhận.</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="text-left text-gray-500 border-b">
                    <th className="py-2 pr-4">Mã đơn</th>
                    <th className="py-2 pr-4">Khách hàng</th>
                    <th className="py-2 pr-4">SĐT</th>
                    <th className="py-2 pr-4">Module</th>
                    <th className="py-2 pr-4">Gói</th>
                    <th className="py-2 pr-4">Số tiền</th>
                    <th className="py-2 pr-4">Ngân hàng</th>
                    <th className="py-2 pr-4">Ngày tạo</th>
                    <th className="py-2">Thao tác</th>
                  </tr>
                </thead>
                <tbody>
                  {orders.map((o) => (
                    <tr key={o.id} className="border-b border-gray-100">
                      <td className="py-3 pr-4 font-mono font-bold">{o.order_code}</td>
                      <td className="py-3 pr-4">{o.full_name || '-'}</td>
                      <td className="py-3 pr-4">{o.phone || '-'}</td>
                      <td className="py-3 pr-4">{o.app_code}</td>
                      <td className="py-3 pr-4">{planLabel(o.plan)}</td>
                      <td className="py-3 pr-4 font-semibold">{formatVND(o.amount)}</td>
                      <td className="py-3 pr-4">{o.bank_code}</td>
                      <td className="py-3 pr-4">{new Date(o.created_at).toLocaleString('vi-VN')}</td>
                      <td className="py-3">
                        <button
                          onClick={() => confirmOrder(o)}
                          className="bg-green-600 text-white px-3 py-1.5 rounded-lg text-xs font-semibold hover:bg-green-700"
                        >
                          Đã nhận tiền
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      )}

      {tab === 'packages' && (
        <div className="bg-white rounded-xl shadow p-6 space-y-4">
          <p className="text-sm text-gray-500">Điều chỉnh giá, số ngày, trạng thái của từng gói. Sửa xong bấm <b>Lưu gói</b>.</p>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="text-left text-gray-500 border-b">
                  <th className="py-2 pr-4">Khóa</th>
                  <th className="py-2 pr-4">Tên gói</th>
                  <th className="py-2 pr-4 w-24">Số ngày</th>
                  <th className="py-2 pr-4 w-32">Giá (VND)</th>
                  <th className="py-2 pr-4">Dùng thử</th>
                  <th className="py-2 pr-4">Vĩnh viễn</th>
                  <th className="py-2 pr-4">Bán</th>
                  <th className="py-2 pr-4 w-20">Thứ tự</th>
                </tr>
              </thead>
              <tbody>
                {packages.map((p) => (
                  <tr key={p.key} className="border-b border-gray-100">
                    <td className="py-2 pr-4 font-mono text-xs">{p.key}</td>
                    <td className="py-2 pr-4">
                      <input className={inputCls} value={p.label} onChange={(e) => setPackages(packages.map((x) => (x.key === p.key ? { ...x, label: e.target.value } : x)))} />
                    </td>
                    <td className="py-2 pr-4">
                      <input type="number" className={inputCls} value={p.days} onChange={(e) => setPackages(packages.map((x) => (x.key === p.key ? { ...x, days: Number(e.target.value) } : x)))} />
                    </td>
                    <td className="py-2 pr-4">
                      <input type="number" className={inputCls} value={p.price} onChange={(e) => setPackages(packages.map((x) => (x.key === p.key ? { ...x, price: Number(e.target.value) } : x)))} />
                    </td>
                    <td className="py-2 pr-4">
                      <input type="checkbox" checked={p.trial} onChange={(e) => setPackages(packages.map((x) => (x.key === p.key ? { ...x, trial: e.target.checked } : x)))} />
                    </td>
                    <td className="py-2 pr-4">
                      <input type="checkbox" checked={p.forever} onChange={(e) => setPackages(packages.map((x) => (x.key === p.key ? { ...x, forever: e.target.checked } : x)))} />
                    </td>
                    <td className="py-2 pr-4">
                      <input type="checkbox" checked={p.active} onChange={(e) => setPackages(packages.map((x) => (x.key === p.key ? { ...x, active: e.target.checked } : x)))} />
                    </td>
                    <td className="py-2 pr-4">
                      <input type="number" className={inputCls} value={p.sort} onChange={(e) => setPackages(packages.map((x) => (x.key === p.key ? { ...x, sort: Number(e.target.value) } : x)))} />
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          <button
            onClick={savePackages}
            disabled={saving}
            className="bg-green-600 text-white px-4 py-2 rounded-lg text-sm font-semibold hover:bg-green-700 disabled:opacity-50"
          >
            {saving ? 'Đang lưu...' : 'Lưu gói'}
          </button>
        </div>
      )}

      {tab === 'banks' && (
        <div className="bg-white rounded-xl shadow p-6 space-y-4">
          <div className="flex items-center justify-between">
            <p className="text-sm text-gray-500">Tài khoản ngân hàng nhận chuyển khoản, hiển thị cho khách ở màn đăng ký.</p>
            <button onClick={addBank} className="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-semibold hover:bg-blue-700">
              + Thêm ngân hàng
            </button>
          </div>
          <div className="space-y-3">
            {banks.map((b) => (
              <div key={b.id} className="grid grid-cols-6 gap-3 items-center border border-gray-200 rounded-lg p-3">
                <div>
                  <label className="block text-xs text-gray-500 mb-1">Mã NH</label>
                  <input className={inputCls} value={b.bank_code} onChange={(e) => setBanks(banks.map((x) => (x.id === b.id ? { ...x, bank_code: e.target.value } : x)))} />
                </div>
                <div>
                  <label className="block text-xs text-gray-500 mb-1">Tên ngân hàng</label>
                  <input className={inputCls} value={b.bank_name} onChange={(e) => setBanks(banks.map((x) => (x.id === b.id ? { ...x, bank_name: e.target.value } : x)))} />
                </div>
                <div>
                  <label className="block text-xs text-gray-500 mb-1">Số tài khoản</label>
                  <input className={inputCls} value={b.account_number} onChange={(e) => setBanks(banks.map((x) => (x.id === b.id ? { ...x, account_number: e.target.value } : x)))} />
                </div>
                <div>
                  <label className="block text-xs text-gray-500 mb-1">Chủ tài khoản</label>
                  <input className={inputCls} value={b.account_holder} onChange={(e) => setBanks(banks.map((x) => (x.id === b.id ? { ...x, account_holder: e.target.value } : x)))} />
                </div>
                <div>
                  <label className="block text-xs text-gray-500 mb-1">Chi nhánh</label>
                  <input className={inputCls} value={b.branch} onChange={(e) => setBanks(banks.map((x) => (x.id === b.id ? { ...x, branch: e.target.value } : x)))} />
                </div>
                <div className="flex items-end gap-2">
                  <button onClick={() => saveBank(b)} className="bg-green-600 text-white px-3 py-2 rounded-lg text-xs font-semibold hover:bg-green-700">
                    Lưu
                  </button>
                  <button onClick={() => deleteBank(b.id)} className="bg-red-100 text-red-600 px-3 py-2 rounded-lg text-xs font-semibold hover:bg-red-200">
                    Xóa
                  </button>
                </div>
              </div>
            ))}
            {banks.length === 0 && <p className="text-gray-400 text-sm">Chưa có tài khoản ngân hàng nào.</p>}
          </div>
        </div>
      )}
    </div>
  );
}
