'use client';
import { useEffect, useState } from 'react';

interface User {
  id: string;
  email: string;
  full_name: string;
  active: boolean;
  created_at: string;
  birth_year: number | null;
  cccd: string;
  phone: string;
  subscription_plan: string;
  subscription_start: string | null;
  subscription_end: string | null;
  permissions: { app_code: string; app_name: string; role_name: string; can_login: boolean }[];
}

const PLANS = [
  { value: '7', label: '7 ngày' },
  { value: '30', label: '30 ngày' },
  { value: '60', label: '60 ngày' },
  { value: '90', label: '90 ngày' },
  { value: '365', label: '365 ngày' },
];

const EMPTY_FORM = { email: '', password: '', full_name: '', birth_year: '', cccd: '', phone: '', subscription_plan: '30' };

function calcEndDate(planDays: string): string {
  const days = parseInt(planDays) || 0;
  if (days <= 0) return '—';
  const end = new Date();
  end.setDate(end.getDate() + days);
  return end.toLocaleDateString('vi-VN');
}

export default function UsersPage() {
  const [users, setUsers] = useState<User[]>([]);
  const [showCreate, setShowCreate] = useState(false);
  const [form, setForm] = useState(EMPTY_FORM);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(true);
  const [loadError, setLoadError] = useState('');
  const [changingPwUser, setChangingPwUser] = useState<User | null>(null);
  const [newPassword, setNewPassword] = useState('');
  const [pwError, setPwError] = useState('');
  const [pwSuccess, setPwSuccess] = useState('');

  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  const loadUsers = async () => {
    setLoading(true);
    setLoadError('');
    try {
      const res = await fetch('/api/users', { headers: { Authorization: `Bearer ${token}` } });
      const data = await res.json();
      if (!res.ok) {
        setLoadError(data.error || `Lỗi ${res.status}: Không thể tải danh sách user`);
        setUsers([]);
      } else {
        setUsers(Array.isArray(data) ? data : []);
      }
    } catch (e) {
      setLoadError('Lỗi kết nối: ' + String(e));
      setUsers([]);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => { loadUsers(); }, []);

  const handleCreate = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    const res = await fetch('/api/users', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({
        ...form,
        birth_year: form.birth_year ? parseInt(form.birth_year) : null,
      }),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error); return; }
    setShowCreate(false);
    setForm(EMPTY_FORM);
    loadUsers();
  };

  const toggleActive = async (user: User) => {
    await fetch(`/api/users/${user.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ active: !user.active }),
    });
    loadUsers();
  };

  const deleteUser = async (userId: string, email: string) => {
    if (!confirm(`Xac nhan xoa user ${email}?`)) return;
    await fetch(`/api/users/${userId}`, { method: 'DELETE', headers: { Authorization: `Bearer ${token}` } });
    loadUsers();
  };

  const handleChangePassword = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!changingPwUser) return;
    setPwError('');
    setPwSuccess('');
    if (newPassword.length < 6) { setPwError('Mat khau toi thieu 6 ky tu'); return; }
    const res = await fetch(`/api/users/${changingPwUser.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ password: newPassword }),
    });
    const data = await res.json();
    if (!res.ok) { setPwError(data.error); return; }
    setPwSuccess('Da doi mat khau thanh cong!');
    setNewPassword('');
    setTimeout(() => { setChangingPwUser(null); setPwSuccess(''); }, 1500);
  };

  const permBadges = (perms: User['permissions']) => {
    if (!perms || perms.length === 0) return <span className="text-xs text-gray-400">Chua phan quyen</span>;
    return (
      <div className="flex flex-wrap gap-1">
        {perms.filter(p => p.can_login).map(p => (
          <span key={p.app_code} className="text-[10px] px-1.5 py-0.5 rounded-full bg-blue-100 text-blue-700">
            {p.app_name}: {p.role_name}
          </span>
        ))}
      </div>
    );
  };

  const formatDate = (d: string | null) => {
    if (!d) return '—';
    return new Date(d).toLocaleDateString('vi-VN');
  };

  return (
    <div>
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-2xl font-bold">Quan ly Users</h1>
        <button onClick={() => { setShowCreate(true); setForm(EMPTY_FORM); }} className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">+ Tao User moi</button>
      </div>

      {showCreate && (
        <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
          <h3 className="font-bold mb-4">Tao User moi</h3>
          <form onSubmit={handleCreate} className="grid grid-cols-3 gap-4">
            <input placeholder="Email *" value={form.email} onChange={(e) => setForm({ ...form, email: e.target.value })} className="border rounded-lg px-4 py-2" required />
            <input type="password" placeholder="Mat khau *" value={form.password} onChange={(e) => setForm({ ...form, password: e.target.value })} className="border rounded-lg px-4 py-2" required />
            <input placeholder="Ho ten" value={form.full_name} onChange={(e) => setForm({ ...form, full_name: e.target.value })} className="border rounded-lg px-4 py-2" />
            <input type="number" placeholder="Nam sinh" value={form.birth_year} onChange={(e) => setForm({ ...form, birth_year: e.target.value })} className="border rounded-lg px-4 py-2" />
            <input placeholder="So CCCD" value={form.cccd} onChange={(e) => setForm({ ...form, cccd: e.target.value })} className="border rounded-lg px-4 py-2" />
            <input placeholder="So DT" value={form.phone} onChange={(e) => setForm({ ...form, phone: e.target.value })} className="border rounded-lg px-4 py-2" />
            <select value={form.subscription_plan} onChange={(e) => setForm({ ...form, subscription_plan: e.target.value })} className="border rounded-lg px-4 py-2">
              {PLANS.map(p => <option key={p.value} value={p.value}>{p.label}</option>)}
            </select>
            <div className="flex items-center gap-2 text-sm text-gray-600">
              <span>Ngay bat dau: <strong>{new Date().toLocaleDateString('vi-VN')}</strong></span>
            </div>
            <div className="flex items-center gap-2 text-sm text-gray-600">
              <span>Ngay ket thuc: <strong>{calcEndDate(form.subscription_plan)}</strong></span>
            </div>
            <div className="col-span-3 flex gap-2">
              <button type="submit" className="bg-green-600 text-white px-4 py-2 rounded-lg">Tao</button>
              <button type="button" onClick={() => setShowCreate(false)} className="bg-gray-300 px-4 py-2 rounded-lg">Huy</button>
            </div>
          </form>
          {error && <div className="text-red-500 text-sm mt-2">{error}</div>}
        </div>
      )}

      <div className="bg-white rounded-xl shadow-sm overflow-x-auto">
        {loadError && (
          <div className="p-4 border-b border-red-100">
            <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg text-sm">{loadError}</div>
          </div>
        )}
        <table className="w-full">
          <thead className="bg-gray-50">
            <tr>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Email</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Ho ten</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Nam sinh</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">CCCD</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">SDT</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Goi</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Ngay ket thuc</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Quyen ung dung</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Trang thai</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Thao tac</th>
            </tr>
          </thead>
          <tbody className="divide-y">
            {loading ? (
              <tr>
                <td colSpan={10} className="text-center py-8 text-gray-500">Dang tai du lieu...</td>
              </tr>
            ) : users.length === 0 ? (
              <tr>
                <td colSpan={10} className="text-center py-8 text-gray-500">Chua co user nao</td>
              </tr>
            ) : (
              users.map((u) => (
                <tr key={u.id} className="hover:bg-gray-50">
                  <td className="px-4 py-3 text-sm font-medium">{u.email}</td>
                  <td className="px-4 py-3 text-sm">{u.full_name || '-'}</td>
                  <td className="px-4 py-3 text-sm">{u.birth_year ?? '-'}</td>
                  <td className="px-4 py-3 text-sm">{u.cccd || '-'}</td>
                  <td className="px-4 py-3 text-sm">{u.phone || '-'}</td>
                  <td className="px-4 py-3 text-sm">
                    {u.subscription_plan ? `${u.subscription_plan} ngay` : '-'}
                  </td>
                  <td className="px-4 py-3 text-sm">{formatDate(u.subscription_end)}</td>
                  <td className="px-4 py-3">{permBadges(u.permissions)}</td>
                  <td className="px-4 py-3">
                    <span className={`text-xs px-2 py-1 rounded-full ${u.active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                      {u.active ? 'Hoat dong' : 'Bi khoa'}
                    </span>
                  </td>
                  <td className="px-4 py-3">
                    <div className="flex gap-1">
                      <button onClick={() => { setChangingPwUser(u); setNewPassword(''); setPwError(''); setPwSuccess(''); }} className="text-xs px-2 py-1 rounded bg-yellow-100 text-yellow-600 hover:bg-yellow-200">Doi MK</button>
                      <button onClick={() => toggleActive(u)} className={`text-xs px-2 py-1 rounded ${u.active ? 'bg-red-100 text-red-600 hover:bg-red-200' : 'bg-green-100 text-green-600 hover:bg-green-200'}`}>
                        {u.active ? 'Khoa' : 'Mo'}
                      </button>
                      <button onClick={() => deleteUser(u.id, u.email)} className="text-xs px-2 py-1 rounded bg-red-100 text-red-600 hover:bg-red-200">Xoa</button>
                    </div>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>

      {changingPwUser && (
        <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50">
          <div className="bg-white rounded-xl shadow-xl p-6 w-full max-w-md">
            <h3 className="font-bold text-lg mb-4">Doi mat khau: {changingPwUser.email}</h3>
            <form onSubmit={handleChangePassword} className="space-y-4">
              <input
                type="password"
                placeholder="Mat khau moi (toi thieu 6 ky tu)"
                value={newPassword}
                onChange={(e) => setNewPassword(e.target.value)}
                className="w-full border rounded-lg px-4 py-2"
                autoFocus
                required
              />
              <div className="flex gap-2">
                <button type="submit" className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">Xac nhan</button>
                <button type="button" onClick={() => setChangingPwUser(null)} className="bg-gray-300 px-4 py-2 rounded-lg">Huy</button>
              </div>
              {pwError && <div className="text-red-500 text-sm">{pwError}</div>}
              {pwSuccess && <div className="text-green-600 text-sm">{pwSuccess}</div>}
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
