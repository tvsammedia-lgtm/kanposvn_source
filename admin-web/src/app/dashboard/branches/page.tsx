'use client';
import { Suspense, useEffect, useState } from 'react';
import { useSearchParams } from 'next/navigation';
import Link from 'next/link';
import { isSuperAdminEmail, isCafeAdminEmail } from '@/lib/admin';

interface Branch {
  id: string;
  branch_code: string;
  name: string;
  phone: string;
  address: string;
  app_code: string;
  app_name: string;
  active: boolean;
  created_at: string;
  license_id: string | null;
  plan: string | null;
  license_status: string | null;
  started_at: string | null;
  expires_at: string | null;
}

interface Customer {
  id: string;
  customer_code: string;
  name: string;
  phone: string;
  email: string;
  owner_full_name: string;
  owner_email: string;
}

interface UserOption {
  id: string;
  email: string;
  full_name: string;
  phone: string;
}

interface RoleOption {
  id: string;
  role_name: string;
}

const EMPTY_BRANCH = { branch_code: '', name: '', phone: '', address: '', app_code: '', license_plan: 'trial' };

export default function BranchesPage() {
  return (
    <Suspense fallback={<div className="py-8 text-center text-gray-500">Dang tai...</div>}>
      <BranchesPageInner />
    </Suspense>
  );
}

function BranchesPageInner() {
  const searchParams = useSearchParams();
  const customerId = searchParams.get('customer');

  const [customer, setCustomer] = useState<Customer | null>(null);
  const [branches, setBranches] = useState<Branch[]>([]);
  const [showCreate, setShowCreate] = useState(false);
  const [form, setForm] = useState(EMPTY_BRANCH);
  const [error, setError] = useState('');
  const [currentUser, setCurrentUser] = useState<{ email: string } | null>(null);

  // License modal
  const [licBranch, setLicBranch] = useState<Branch | null>(null);
  const [licPlan, setLicPlan] = useState('trial');
  const [licError, setLicError] = useState('');

  // Users modal
  const [userBranch, setUserBranch] = useState<Branch | null>(null);
  const [users, setUsers] = useState<UserOption[]>([]);
  const [roles, setRoles] = useState<RoleOption[]>([]);
  const [assigned, setAssigned] = useState<Record<string, { role_id: string; can_login: boolean }>>({});
  const [usersError, setUsersError] = useState('');

  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  useEffect(() => {
    const userData = localStorage.getItem('admin_user');
    if (userData) setCurrentUser(JSON.parse(userData));
  }, []);

  const isSuperAdmin = isSuperAdminEmail(currentUser?.email);
  const isCafeAdmin = isCafeAdminEmail(currentUser?.email);

  const load = async () => {
    if (!customerId) return;
    const res = await fetch(`/api/customers/${customerId}`, { headers: { Authorization: `Bearer ${token}` } });
    const data = await res.json();
    if (data.error) { setError(data.error); return; }
    const { branches: bs, ...c } = data;
    setCustomer(c);
    setBranches(bs || []);
  };

  useEffect(() => { load(); }, [customerId]);

  const handleCreate = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    const res = await fetch(`/api/customers/${customerId}/branches`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify(form),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error); return; }
    setShowCreate(false);
    setForm(EMPTY_BRANCH);
    load();
  };

  const toggleActive = async (b: Branch) => {
    await fetch(`/api/branches/${b.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ active: !b.active }),
    });
    load();
  };

  const deleteBranch = async (b: Branch) => {
    if (!isSuperAdmin) { alert('Chi super admin moi co xoa chi nhanh'); return; }
    if (!confirm(`Xoa chi nhanh "${b.name}" (${b.app_code}) va license?`)) return;
    await fetch(`/api/branches/${b.id}`, { method: 'DELETE', headers: { Authorization: `Bearer ${token}` } });
    load();
  };

  const openLicModal = (b: Branch) => {
    setLicBranch(b);
    setLicPlan(b.plan || 'trial');
    setLicError('');
  };

  const submitLicense = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!licBranch) return;
    setLicError('');
    const res = await fetch(`/api/branches/${licBranch.id}/license`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ plan: licPlan }),
    });
    const data = await res.json();
    if (!res.ok) { setLicError(data.error); return; }
    setLicBranch(null);
    load();
  };

  const openUsersModal = async (b: Branch) => {
    setUserBranch(b);
    setUsersError('');
    const [uRes, rRes] = await Promise.all([
      fetch('/api/users', { headers: { Authorization: `Bearer ${token}` } }),
      fetch(`/api/branches/${b.id}/users`, { headers: { Authorization: `Bearer ${token}` } }),
    ]);
    const uData = await uRes.json();
    const rData = await rRes.json();
    setUsers(Array.isArray(uData) ? uData : []);
    setRoles(rData.roles || []);
    const map: Record<string, { role_id: string; can_login: boolean }> = {};
    for (const u of rData.users || []) {
      map[u.id] = { role_id: u.role_id || '', can_login: u.can_login !== false };
    }
    setAssigned(map);
  };

  const toggleAssign = (uid: string) => {
    setAssigned((prev) => {
      const next = { ...prev };
      if (next[uid]) {
        delete next[uid];
      } else {
        next[uid] = { role_id: roles[0]?.id || '', can_login: true };
      }
      return next;
    });
  };

  const submitUsers = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!userBranch) return;
    setUsersError('');
    const payload = Object.entries(assigned).map(([uid, v]) => ({
      user_id: uid,
      role_id: v.role_id || null,
      can_login: v.can_login,
    }));
    const res = await fetch(`/api/branches/${userBranch.id}/users`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ users: payload }),
    });
    const data = await res.json();
    if (!res.ok) { setUsersError(data.error); return; }
    setUserBranch(null);
  };

  const formatDate = (d: string | null) => {
    if (!d) return '—';
    return new Date(d).toLocaleDateString('vi-VN');
  };

  const planLabel = (p: string | null) => {
    if (!p) return '—';
    if (p === 'yearly') return '365 ngày';
    if (p === 'trial') return 'Dùng thử';
    if (p === 'forever') return 'Vĩnh Viễn';
    return p;
  };

  if (!customerId) {
    return (
      <div>
        <h1 className="text-2xl font-bold mb-6">Quản lý Chi nhánh</h1>
        <div className="bg-white rounded-xl shadow-sm p-6">
          <p className="text-gray-500 mb-4">Vui lòng chọn một khách hàng để xem / thêm chi nhánh.</p>
          <Link href="/dashboard/customers" className="bg-blue-600 text-white px-4 py-2 rounded-lg inline-block">← Quay lại danh sách khách hàng</Link>
        </div>
      </div>
    );
  }

  return (
    <div>
      <div className="flex justify-between items-center mb-6">
        <div>
          <h1 className="text-2xl font-bold">Chi nhánh: {customer?.name || '...'}</h1>
          <p className="text-sm text-gray-500">
            Mã KH: {customer?.customer_code} · Owner: {customer?.owner_full_name} ({customer?.owner_email})
          </p>
        </div>
        <div className="flex gap-2">
          <Link href="/dashboard/customers" className="bg-gray-300 px-4 py-2 rounded-lg hover:bg-gray-400">← Khách hàng</Link>
          {isSuperAdmin && (
            <button onClick={() => { setShowCreate(true); setForm(EMPTY_BRANCH); setError(''); }} className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">
              + Thêm Chi nhánh
            </button>
          )}
        </div>
      </div>

      {showCreate && (
        <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
          <h3 className="font-bold mb-4">Thêm chi nhánh mới (tự tạo license dùng thử)</h3>
          <form onSubmit={handleCreate} className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Tên cửa hàng / chi nhánh (hiển thị trên POS) *</label>
              <input placeholder="VD: Tạp hóa Nguyễn Văn A - CN2" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })} className="border rounded-lg px-4 py-2 w-full" required />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">app_code (1 chi nhánh = 1 app_code) *</label>
              <input placeholder="VD: kantaphoaA_002" value={form.app_code} onChange={(e) => setForm({ ...form, app_code: e.target.value })} className="border rounded-lg px-4 py-2 w-full font-mono" required />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Mã chi nhánh</label>
              <input placeholder="VD: 001" value={form.branch_code} onChange={(e) => setForm({ ...form, branch_code: e.target.value })} className="border rounded-lg px-4 py-2 w-full" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">SĐT chi nhánh</label>
              <input placeholder="VD: 0901234567" value={form.phone} onChange={(e) => setForm({ ...form, phone: e.target.value })} className="border rounded-lg px-4 py-2 w-full" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Địa chỉ</label>
              <input placeholder="VD: 12 Nguyễn Trãi, Q1" value={form.address} onChange={(e) => setForm({ ...form, address: e.target.value })} className="border rounded-lg px-4 py-2 w-full" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">License mặc định</label>
              <select value={form.license_plan} onChange={(e) => setForm({ ...form, license_plan: e.target.value })} className="border rounded-lg px-4 py-2 w-full">
                <option value="trial">Dùng thử (7 ngày)</option>
                <option value="yearly">365 ngày</option>
                <option value="forever">Vĩnh Viễn</option>
              </select>
            </div>
            <div className="col-span-2 flex gap-2">
              <button type="submit" className="bg-green-600 text-white px-4 py-2 rounded-lg">Tạo chi nhánh</button>
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
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Mã CN</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Tên cửa hàng (POS)</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">app_code</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">SĐT / Địa chỉ</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">License</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Hết hạn</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Trạng thái</th>
              <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Thao tác</th>
            </tr>
          </thead>
          <tbody className="divide-y">
            {branches.map((b) => (
              <tr key={b.id} className="hover:bg-gray-50">
                <td className="px-4 py-3 text-sm font-mono text-blue-600">{b.branch_code || '-'}</td>
                <td className="px-4 py-3 text-sm font-medium">{b.name}</td>
                <td className="px-4 py-3 text-sm font-mono text-blue-600">{b.app_code}</td>
                <td className="px-4 py-3 text-sm">
                  <div>{b.phone || '-'}</div>
                  <div className="text-gray-400 text-xs">{b.address || ''}</div>
                </td>
                <td className="px-4 py-3 text-sm">
                  <span className={`text-xs px-2 py-1 rounded-full ${b.license_status === 'active' ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                    {planLabel(b.plan)}
                  </span>
                </td>
                <td className="px-4 py-3 text-sm">{b.expires_at ? formatDate(b.expires_at) : (b.plan === 'forever' ? 'Vĩnh Viễn' : '—')}</td>
                <td className="px-4 py-3">
                  <span className={`text-xs px-2 py-1 rounded-full ${b.active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                    {b.active ? 'Hoạt động' : 'Ngưng'}
                  </span>
                </td>
                <td className="px-4 py-3">
                  <div className="flex gap-1 flex-wrap">
                    {(isSuperAdmin || isCafeAdmin) && (
                      <button onClick={() => openLicModal(b)} className="text-xs px-2 py-1 rounded bg-green-100 text-green-700 hover:bg-green-200">License</button>
                    )}
                    {isSuperAdmin && (
                      <button onClick={() => openUsersModal(b)} className="text-xs px-2 py-1 rounded bg-purple-100 text-purple-600 hover:bg-purple-200">User</button>
                    )}
                    {isSuperAdmin && (
                      <button onClick={() => toggleActive(b)} className={`text-xs px-2 py-1 rounded ${b.active ? 'bg-yellow-100 text-yellow-600 hover:bg-yellow-200' : 'bg-green-100 text-green-600 hover:bg-green-200'}`}>
                        {b.active ? 'Ngưng' : 'Kích hoạt'}
                      </button>
                    )}
                    {isSuperAdmin && (
                      <button onClick={() => deleteBranch(b)} className="text-xs px-2 py-1 rounded bg-red-100 text-red-600 hover:bg-red-200">Xóa</button>
                    )}
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        {branches.length === 0 && <div className="text-center py-8 text-gray-400">Chưa có chi nhánh nào</div>}
      </div>

      {licBranch && (
        <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50">
          <div className="bg-white rounded-xl shadow-xl p-6 w-full max-w-md">
            <h3 className="font-bold text-lg mb-1">Cấp / Gia hạn License</h3>
            <p className="text-sm text-gray-500 mb-4">{licBranch.name} ({licBranch.app_code})</p>
            <form onSubmit={submitLicense} className="space-y-4">
              <label className="block">
                <span className="text-sm text-gray-600">Gói</span>
                <select value={licPlan} onChange={(e) => setLicPlan(e.target.value)} className="w-full mt-1 border rounded-lg px-4 py-2">
                  <option value="trial">Dùng thử (7 ngày)</option>
                  <option value="yearly">365 ngày</option>
                  <option value="forever">Vĩnh Viễn</option>
                </select>
              </label>
              <div className="flex gap-2">
                <button type="submit" className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">Lưu</button>
                <button type="button" onClick={() => setLicBranch(null)} className="bg-gray-300 px-4 py-2 rounded-lg">Hủy</button>
              </div>
              {licError && <div className="text-red-500 text-sm">{licError}</div>}
            </form>
          </div>
        </div>
      )}

      {userBranch && (
        <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50">
          <div className="bg-white rounded-xl shadow-xl p-6 w-full max-w-2xl max-h-[80vh] overflow-y-auto">
            <h3 className="font-bold text-lg mb-1">Phân quyền User vào chi nhánh</h3>
            <p className="text-sm text-gray-500 mb-4">{userBranch.name} ({userBranch.app_code})</p>
            <form onSubmit={submitUsers}>
              <table className="w-full">
                <thead className="bg-gray-50">
                  <tr>
                    <th className="text-left px-3 py-2 text-sm font-semibold text-gray-600">Chọn</th>
                    <th className="text-left px-3 py-2 text-sm font-semibold text-gray-600">User</th>
                    <th className="text-left px-3 py-2 text-sm font-semibold text-gray-600">Role</th>
                    <th className="text-left px-3 py-2 text-sm font-semibold text-gray-600">Cho vào</th>
                  </tr>
                </thead>
                <tbody className="divide-y">
                  {users.map((u) => {
                    const isAssigned = !!assigned[u.id];
                    const role = assigned[u.id];
                    return (
                      <tr key={u.id}>
                        <td className="px-3 py-2">
                          <input type="checkbox" checked={isAssigned} onChange={() => toggleAssign(u.id)} />
                        </td>
                        <td className="px-3 py-2 text-sm">
                          <div className="font-medium">{u.email}</div>
                          <div className="text-gray-400 text-xs">{u.full_name || ''} {u.phone || ''}</div>
                        </td>
                        <td className="px-3 py-2">
                          {isAssigned && (
                            <select
                              value={role?.role_id || ''}
                              onChange={(e) => setAssigned((prev) => ({ ...prev, [u.id]: { ...prev[u.id], role_id: e.target.value } }))}
                              className="border rounded px-2 py-1 text-sm"
                            >
                              {roles.map((r) => (
                                <option key={r.id} value={r.id}>{r.role_name}</option>
                              ))}
                            </select>
                          )}
                        </td>
                        <td className="px-3 py-2">
                          {isAssigned && (
                            <input
                              type="checkbox"
                              checked={role?.can_login !== false}
                              onChange={(e) => setAssigned((prev) => ({ ...prev, [u.id]: { ...prev[u.id], can_login: e.target.checked } }))}
                            />
                          )}
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
              <div className="flex gap-2 mt-4">
                <button type="submit" className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">Lưu</button>
                <button type="button" onClick={() => setUserBranch(null)} className="bg-gray-300 px-4 py-2 rounded-lg">Hủy</button>
              </div>
              {usersError && <div className="text-red-500 text-sm mt-2">{usersError}</div>}
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
