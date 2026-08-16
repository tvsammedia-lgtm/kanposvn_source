'use client';
import { useEffect, useState } from 'react';
import Link from 'next/link';
import { isSuperAdminEmail } from '@/lib/admin';

interface Customer {
  id: string;
  customer_code: string;
  owner_user_id: string;
  name: string;
  phone: string;
  email: string;
  active: boolean;
  created_at: string;
  owner_email: string;
  owner_full_name: string;
  branch_count: number;
  license_count: number;
}

interface UserOption {
  id: string;
  email: string;
  full_name: string;
}

const EMPTY_FORM = { name: '', phone: '', email: '', owner_email: '' };

export default function CustomersPage() {
  const [customers, setCustomers] = useState<Customer[]>([]);
  const [users, setUsers] = useState<UserOption[]>([]);
  const [showCreate, setShowCreate] = useState(false);
  const [form, setForm] = useState(EMPTY_FORM);
  const [error, setError] = useState('');
  const [editingCustomer, setEditingCustomer] = useState<Customer | null>(null);
  const [editForm, setEditForm] = useState({ name: '', phone: '', email: '', active: true });
  const [editError, setEditError] = useState('');
  const [currentUser, setCurrentUser] = useState<{ email: string } | null>(null);

  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  useEffect(() => {
    const userData = localStorage.getItem('admin_user');
    if (userData) setCurrentUser(JSON.parse(userData));
  }, []);

  const isSuperAdmin = isSuperAdminEmail(currentUser?.email);

  const loadCustomers = async () => {
    const res = await fetch('/api/customers', { headers: { Authorization: `Bearer ${token}` } });
    const data = await res.json();
    setCustomers(Array.isArray(data) ? data : []);
  };

  useEffect(() => { loadCustomers(); }, []);

  const loadUsers = async () => {
    const res = await fetch('/api/users', { headers: { Authorization: `Bearer ${token}` } });
    const data = await res.json();
    setUsers(Array.isArray(data) ? data : []);
  };

  const handleCreate = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    const res = await fetch('/api/customers', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify(form),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error); return; }
    setShowCreate(false);
    setForm(EMPTY_FORM);
    loadCustomers();
  };

  const openEdit = (c: Customer) => {
    setEditForm({ name: c.name, phone: c.phone || '', email: c.email || '', active: c.active });
    setEditingCustomer(c);
    setEditError('');
  };

  const handleEdit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!editingCustomer) return;
    setEditError('');
    const res = await fetch(`/api/customers/${editingCustomer.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify(editForm),
    });
    const data = await res.json();
    if (!res.ok) { setEditError(data.error || 'Loi khi sua'); return; }
    setEditingCustomer(null);
    loadCustomers();
  };

  const deleteCustomer = async (c: Customer) => {
    if (!isSuperAdmin) { alert('Chi super admin moi co xoa khach hang'); return; }
    if (!confirm(`Xoa khach hang "${c.name}" va toan bo chi nhanh + license?`)) return;
    await fetch(`/api/customers/${c.id}`, { method: 'DELETE', headers: { Authorization: `Bearer ${token}` } });
    loadCustomers();
  };

  return (
    <div>
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-2xl font-bold">Quản lý Khách hàng (Owner Cloud)</h1>
        {isSuperAdmin && (
          <button
            onClick={() => { setShowCreate(true); setForm(EMPTY_FORM); setError(''); loadUsers(); }}
            className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700"
          >
            + Tạo Khách hàng
          </button>
        )}
      </div>

      {showCreate && (
        <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
          <h3 className="font-bold mb-4">Tạo Khách hàng mới</h3>
          <form onSubmit={handleCreate} className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Tên khách hàng / chủ doanh nghiệp *</label>
              <input placeholder="VD: Nguyễn Văn A" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })} className="border rounded-lg px-4 py-2 w-full" required />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">SĐT khách hàng</label>
              <input placeholder="VD: 0901234567" value={form.phone} onChange={(e) => setForm({ ...form, phone: e.target.value })} className="border rounded-lg px-4 py-2 w-full" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Email khách hàng</label>
              <input type="email" placeholder="VD: a@email.com" value={form.email} onChange={(e) => setForm({ ...form, email: e.target.value })} className="border rounded-lg px-4 py-2 w-full" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Tài khoản Owner (email đăng nhập Cloud) *</label>
              <select
                value={form.owner_email}
                onChange={(e) => setForm({ ...form, owner_email: e.target.value })}
                className="border rounded-lg px-4 py-2 w-full"
                required
              >
                <option value="">-- Chọn user owner --</option>
                {users.map((u) => (
                  <option key={u.id} value={u.email}>{u.email} ({u.full_name || 'no ten'})</option>
                ))}
              </select>
            </div>
            <div className="col-span-2 flex gap-2">
              <button type="submit" className="bg-green-600 text-white px-4 py-2 rounded-lg">Tạo</button>
              <button type="button" onClick={() => setShowCreate(false)} className="bg-gray-300 px-4 py-2 rounded-lg">Hủy</button>
            </div>
          </form>
          {error && <div className="text-red-500 text-sm mt-2">{error}</div>}
        </div>
      )}

      <div className="bg-white rounded-xl shadow-sm overflow-x-auto">
        <table className="w-full">
          <thead className="bg-gray-50">
            <tr>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Mã KH</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Tên khách hàng</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">SĐT / Email</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Owner (tài khoản login)</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Chi nhánh</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">License active</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Trạng thái</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Thao tác</th>
            </tr>
          </thead>
          <tbody className="divide-y">
            {customers.map((c) => (
              <tr key={c.id} className="hover:bg-gray-50">
                <td className="px-4 py-3 text-sm font-mono text-blue-600">{c.customer_code}</td>
                <td className="px-4 py-3 text-sm font-medium">{c.name}</td>
                <td className="px-4 py-3 text-sm">
                  <div>{c.phone || '-'}</div>
                  <div className="text-gray-400 text-xs">{c.email || ''}</div>
                </td>
                <td className="px-4 py-3 text-sm">
                  <div className="font-medium">{c.owner_full_name || '-'}</div>
                  <div className="text-gray-400 text-xs">{c.owner_email}</div>
                </td>
                <td className="px-4 py-3 text-sm font-semibold text-blue-600">{c.branch_count}</td>
                <td className="px-4 py-3 text-sm font-semibold text-green-600">{c.license_count}</td>
                <td className="px-4 py-3">
                  <span className={`text-xs px-2 py-1 rounded-full ${c.active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                    {c.active ? 'Hoạt động' : 'Ngưng'}
                  </span>
                </td>
                <td className="px-4 py-3">
                  <div className="flex gap-1 flex-wrap">
                    <Link
                      href={`/dashboard/branches?customer=${c.id}`}
                      className="text-xs px-2 py-1 rounded bg-purple-100 text-purple-600 hover:bg-purple-200"
                    >
                      Chi nhánh
                    </Link>
                    {isSuperAdmin && (
                      <>
                        <button onClick={() => openEdit(c)} className="text-xs px-2 py-1 rounded bg-blue-100 text-blue-600 hover:bg-blue-200">Sửa</button>
                        <button onClick={() => deleteCustomer(c)} className="text-xs px-2 py-1 rounded bg-red-100 text-red-600 hover:bg-red-200">Xóa</button>
                      </>
                    )}
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        {customers.length === 0 && <div className="text-center py-8 text-gray-400">Chưa có khách hàng nào</div>}
      </div>

      {editingCustomer && (
        <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50">
          <div className="bg-white rounded-xl shadow-xl p-6 w-full max-w-lg">
            <h3 className="font-bold text-lg mb-4">Sửa khách hàng: {editingCustomer.name}</h3>
            <form onSubmit={handleEdit} className="space-y-4">
              <label className="block">
                <span className="text-sm text-gray-600">Tên khách hàng</span>
                <input value={editForm.name} onChange={(e) => setEditForm({ ...editForm, name: e.target.value })} className="w-full mt-1 border rounded-lg px-4 py-2" required />
              </label>
              <label className="block">
                <span className="text-sm text-gray-600">SĐT</span>
                <input value={editForm.phone} onChange={(e) => setEditForm({ ...editForm, phone: e.target.value })} className="w-full mt-1 border rounded-lg px-4 py-2" />
              </label>
              <label className="block">
                <span className="text-sm text-gray-600">Email</span>
                <input value={editForm.email} onChange={(e) => setEditForm({ ...editForm, email: e.target.value })} className="w-full mt-1 border rounded-lg px-4 py-2" />
              </label>
              <label className="block">
                <span className="text-sm text-gray-600">Trạng thái</span>
                <select value={editForm.active ? 'true' : 'false'} onChange={(e) => setEditForm({ ...editForm, active: e.target.value === 'true' })} className="w-full mt-1 border rounded-lg px-4 py-2">
                  <option value="true">Hoạt động</option>
                  <option value="false">Ngưng</option>
                </select>
              </label>
              <div className="flex gap-2">
                <button type="submit" className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">Lưu</button>
                <button type="button" onClick={() => setEditingCustomer(null)} className="bg-gray-300 px-4 py-2 rounded-lg">Hủy</button>
              </div>
              {editError && <div className="text-red-500 text-sm">{editError}</div>}
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
