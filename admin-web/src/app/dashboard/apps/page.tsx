'use client';
import { useEffect, useState } from 'react';
import { isSuperAdminEmail, isCafeAdminEmail } from '@/lib/admin';

interface App {
  id: string;
  app_code: string;
  app_name: string;
  description: string;
  package_name: string;
  app_url: string;
  platform: string;
  price: number | null;
  created_at: string;
}

const EMPTY_FORM = { app_code: '', app_name: '', description: '', package_name: '', app_url: '', platform: 'flutter', price: '' };

const toPrice = (v: string): number | null => {
  const n = Number(v);
  return v.trim() !== '' && !isNaN(n) && n > 0 ? n : null;
};

const formatVND = (n: number) =>
  new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND', maximumFractionDigits: 0 }).format(n);

export default function AppsPage() {
  const [apps, setApps] = useState<App[]>([]);
  const [showCreate, setShowCreate] = useState(false);
  const [editingApp, setEditingApp] = useState<App | null>(null);
  const [form, setForm] = useState(EMPTY_FORM);
  const [error, setError] = useState('');
  const [currentUser, setCurrentUser] = useState<{ email: string } | null>(null);

  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  useEffect(() => {
    const userData = localStorage.getItem('admin_user');
    if (userData) {
      setCurrentUser(JSON.parse(userData));
    }
  }, []);

  const isSuperAdmin = isSuperAdminEmail(currentUser?.email);
  const isCafeAdmin = isCafeAdminEmail(currentUser?.email);

  const loadApps = async () => {
    const res = await fetch('/api/apps', { headers: { Authorization: `Bearer ${token}` } });
    setApps(await res.json());
  };

  useEffect(() => { loadApps(); }, []);

  const handleCreate = async (e: React.FormEvent) => {
    if (!isSuperAdmin && !isCafeAdmin) {
      alert('Chi super admin moi co tao app moi');
      return;
    }
    e.preventDefault();
    setError('');
    const res = await fetch('/api/apps', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ ...form, price: toPrice(form.price) }),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error); return; }
    setShowCreate(false);
    setForm(EMPTY_FORM);
    loadApps();
  };

  const handleEdit = async (e: React.FormEvent) => {
    if (!isSuperAdmin && !isCafeAdmin) {
      alert('Chi super admin moi co chinh sua app');
      return;
    }
    if (isCafeAdmin && editingApp?.app_code !== 'kanposvncafe') {
      alert('Cafe admin chi co chinh sua kanposvncafe');
      return;
    }
    e.preventDefault();
    if (!editingApp) return;
    setError('');
    const res = await fetch(`/api/apps/${editingApp.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ ...form, price: toPrice(form.price) }),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error); return; }
    setEditingApp(null);
    setForm(EMPTY_FORM);
    loadApps();
  };

  const deleteApp = async (app: App) => {
    if (!isSuperAdmin) {
      alert('Chi super admin moi co xoa app');
      return;
    }
    if (!confirm(`Xác nhận xóa app "${app.app_name}" (${app.app_code})?`)) return;
    await fetch(`/api/apps/${app.id}`, {
      method: 'DELETE',
      headers: { Authorization: `Bearer ${token}` },
    });
    loadApps();
  };

  const startEdit = (app: App) => {
    setForm({
      app_code: app.app_code,
      app_name: app.app_name,
      description: app.description || '',
      package_name: app.package_name || '',
      app_url: app.app_url || '',
      platform: app.platform || 'flutter',
      price: app.price != null ? String(app.price) : '',
    });
    setEditingApp(app);
    setShowCreate(false);
    setError('');
  };

  const cancelForm = () => {
    setShowCreate(false);
    setEditingApp(null);
    setForm(EMPTY_FORM);
    setError('');
  };

  return (
    <div>
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-2xl font-bold">Quản lý Apps</h1>
        {isSuperAdmin && (
          <button onClick={() => { setShowCreate(true); setEditingApp(null); setForm(EMPTY_FORM); }} className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">+ Tạo App mới</button>
        )}
      </div>

      {(showCreate || editingApp) && (
        <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
          <h3 className="font-bold mb-4">{editingApp ? 'Sửa App' : 'Tạo App mới'}</h3>
          <form onSubmit={editingApp ? handleEdit : handleCreate} className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">App Code *</label>
              <input placeholder="VD: kannhathuoc" value={form.app_code} onChange={(e) => setForm({ ...form, app_code: e.target.value })} className="border rounded-lg px-4 py-2 w-full" required />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">App Name *</label>
              <input placeholder="VD: Kho Nhà Thuốc" value={form.app_name} onChange={(e) => setForm({ ...form, app_name: e.target.value })} className="border rounded-lg px-4 py-2 w-full" required />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Mô tả</label>
              <input placeholder="Mô tả ứng dụng" value={form.description} onChange={(e) => setForm({ ...form, description: e.target.value })} className="border rounded-lg px-4 py-2 w-full" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Package Name</label>
              <input placeholder="VD: com.example.kannhathuoc" value={form.package_name} onChange={(e) => setForm({ ...form, package_name: e.target.value })} className="border rounded-lg px-4 py-2 w-full" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">App URL</label>
              <input placeholder="https://..." value={form.app_url} onChange={(e) => setForm({ ...form, app_url: e.target.value })} className="border rounded-lg px-4 py-2 w-full" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Platform</label>
              <select value={form.platform} onChange={(e) => setForm({ ...form, platform: e.target.value })} className="border rounded-lg px-4 py-2 w-full">
                <option value="flutter">Flutter</option>
                <option value="web">Web</option>
                <option value="react_native">React Native</option>
                <option value="native">Native</option>
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Giá (VND / 365 ngày)</label>
              <input
                type="number"
                min="0"
                placeholder="VD: 899000 (để trống = dùng giá mặc định)"
                value={form.price}
                onChange={(e) => setForm({ ...form, price: e.target.value })}
                className="border rounded-lg px-4 py-2 w-full"
              />
            </div>
            <div className="col-span-2 flex gap-2">
              <button type="submit" className="bg-green-600 text-white px-4 py-2 rounded-lg">{editingApp ? 'Cập nhật' : 'Tạo'}</button>
              <button type="button" onClick={cancelForm} className="bg-gray-300 px-4 py-2 rounded-lg">Hủy</button>
            </div>
          </form>
          {error && <div className="text-red-500 text-sm mt-2">{error}</div>}
        </div>
      )}

      <div className="bg-white rounded-xl shadow-sm overflow-x-auto">
        <table className="w-full">
          <thead className="bg-gray-50">
            <tr>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">App Code</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">App Name</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Mô tả</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Package</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Platform</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Giá (365 ngày)</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Thao tác</th>
            </tr>
          </thead>
          <tbody className="divide-y">
            {apps.map((app) => (
              <tr key={app.id} className="hover:bg-gray-50">
                <td className="px-4 py-3 text-sm font-mono font-medium text-blue-600">{app.app_code}</td>
                <td className="px-4 py-3 text-sm font-medium">{app.app_name}</td>
                <td className="px-4 py-3 text-sm text-gray-500">{app.description || '-'}</td>
                <td className="px-4 py-3 text-xs font-mono text-gray-500">{app.package_name || '-'}</td>
                <td className="px-4 py-3">
                  <span className="text-xs px-2 py-1 rounded-full bg-purple-100 text-purple-700">{app.platform}</span>
                </td>
                <td className="px-4 py-3 text-sm font-semibold text-gray-700">
                  {app.price != null ? formatVND(app.price) : <span className="text-gray-400">Mặc định</span>}
                </td>
                <td className="px-4 py-3">
                  <div className="flex gap-1">
                    {(isSuperAdmin || (isCafeAdmin && app.app_code === 'kanposvncafe')) && (
                      <button onClick={() => startEdit(app)} className="text-xs px-2 py-1 rounded bg-blue-100 text-blue-600 hover:bg-blue-200">Sửa</button>
                    )}
                    {isSuperAdmin && (
                      <button onClick={() => deleteApp(app)} className="text-xs px-2 py-1 rounded bg-red-100 text-red-600 hover:bg-red-200">Xóa</button>
                    )}
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        {apps.length === 0 && <div className="text-center py-8 text-gray-400">Chưa có app nào</div>}
      </div>
    </div>
  );
}
