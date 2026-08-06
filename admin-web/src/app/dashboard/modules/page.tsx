'use client';
import { useEffect, useState } from 'react';
import { isSuperAdminEmail, isCafeAdminEmail } from '@/lib/admin';

interface App {
  id: string;
  app_code: string;
  app_name: string;
  description: string;
  platform: string;
  show_in_registration: boolean;
}

export default function ModulesPage() {
  const [apps, setApps] = useState<App[]>([]);
  const [loading, setLoading] = useState(true);
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
    setLoading(true);
    setError('');
    try {
      const res = await fetch('/api/apps', { headers: { Authorization: `Bearer ${token}` } });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error || 'Không tải được danh sách app');
        setApps([]);
      } else {
        setApps(Array.isArray(data) ? data : []);
      }
    } catch (e) {
      setError('Lỗi kết nối: ' + String(e));
      setApps([]);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => { loadApps(); }, []);

  const canToggle = (app: App) =>
    isSuperAdmin || (isCafeAdmin && app.app_code === 'kanposvncafe');

  const toggle = async (app: App) => {
    if (!canToggle(app)) {
      alert('Chi super admin (hoac cafe admin voi kanposvncafe) moi co doi trang thai module');
      return;
    }
    const next = !app.show_in_registration;
    const res = await fetch(`/api/apps/${app.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ show_in_registration: next }),
    });
    const data = await res.json();
    if (!res.ok) {
      alert(data.error || 'Khong doi duoc trang thai');
      return;
    }
    setApps((prev) => prev.map((a) => (a.id === app.id ? { ...a, show_in_registration: next } : a)));
  };

  const visibleCount = apps.filter((a) => a.show_in_registration).length;

  return (
    <div>
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-2xl font-bold">Quản lý Modules đăng ký</h1>
        <span className="text-sm text-gray-500 bg-white rounded-lg px-4 py-2 shadow-sm">
          Hiện: <b className="text-green-600">{visibleCount}</b> / {apps.length} module
        </span>
      </div>

      <div className="bg-amber-50 border border-amber-200 rounded-xl px-4 py-3 text-sm text-amber-800 mb-6">
        Bật/tắt hiển thị module khi <b>user mới đăng ký</b> (Web & Zalo Mini App). Module bị ẩn sẽ
        không xuất hiện trong danh sách chọn ngành nghề và không thể đăng ký mới.
      </div>

      <div className="bg-white rounded-xl shadow-sm overflow-x-auto">
        {error && (
          <div className="p-4 border-b border-red-100">
            <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg text-sm">{error}</div>
          </div>
        )}
        <table className="w-full">
          <thead className="bg-gray-50">
            <tr>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">App Code</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Tên Module</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Platform</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Hiển thị khi đăng ký</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Thao tác</th>
            </tr>
          </thead>
          <tbody className="divide-y">
            {loading ? (
              <tr>
                <td colSpan={5} className="text-center py-8 text-gray-500">Đang tải...</td>
              </tr>
            ) : apps.length === 0 ? (
              <tr>
                <td colSpan={5} className="text-center py-8 text-gray-500">Chưa có app nào</td>
              </tr>
            ) : (
              apps.map((app) => (
                <tr key={app.id} className="hover:bg-gray-50">
                  <td className="px-4 py-3 text-sm font-mono font-medium text-blue-600">{app.app_code}</td>
                  <td className="px-4 py-3 text-sm font-medium">{app.app_name}</td>
                  <td className="px-4 py-3">
                    <span className="text-xs px-2 py-1 rounded-full bg-purple-100 text-purple-700">{app.platform}</span>
                  </td>
                  <td className="px-4 py-3">
                    <span className={`text-xs px-2 py-1 rounded-full ${app.show_in_registration ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                      {app.show_in_registration ? 'Hiện' : 'Ẩn'}
                    </span>
                  </td>
                  <td className="px-4 py-3">
                    <button
                      onClick={() => toggle(app)}
                      className={`text-xs px-3 py-1.5 rounded-lg font-medium transition-colors ${
                        !canToggle(app)
                          ? 'bg-gray-100 text-gray-400 cursor-not-allowed'
                          : app.show_in_registration
                            ? 'bg-red-100 text-red-600 hover:bg-red-200'
                            : 'bg-green-100 text-green-600 hover:bg-green-200'
                      }`}
                      disabled={!canToggle(app)}
                    >
                      {app.show_in_registration ? 'Ẩn bớt' : 'Hiện lại'}
                    </button>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}
