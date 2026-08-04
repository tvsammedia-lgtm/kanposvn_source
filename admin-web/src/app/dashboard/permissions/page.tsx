'use client';
import { useEffect, useState } from 'react';

interface User { id: string; email: string; full_name: string; }
interface App { id: string; app_code: string; app_name: string; platform: string; package_name: string; }
interface Role { id: string; role_name: string; }
interface UserPerm {
  app_id: string;
  app_code: string;
  app_name: string;
  role_id: string;
  role_name: string;
  can_login: boolean;
}

const PLATFORM_BADGE: Record<string, { bg: string; text: string; label: string }> = {
  flutter: { bg: 'bg-sky-100', text: 'text-sky-700', label: 'Flutter' },
  web: { bg: 'bg-green-100', text: 'text-green-700', label: 'Web' },
  android: { bg: 'bg-emerald-100', text: 'text-emerald-700', label: 'Android' },
  ios: { bg: 'bg-gray-100', text: 'text-gray-700', label: 'iOS' },
};

export default function PermissionsPage() {
  const [users, setUsers] = useState<User[]>([]);
  const [apps, setApps] = useState<App[]>([]);
  const [roles, setRoles] = useState<Role[]>([]);
  const [userPerms, setUserPerms] = useState<UserPerm[]>([]);
  const [selectedUser, setSelectedUser] = useState<string>('');
  const [saved, setSaved] = useState(false);
  const [currentUser, setCurrentUser] = useState<{ email: string } | null>(null);

  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  useEffect(() => {
    const userData = localStorage.getItem('admin_user');
    if (userData) {
      setCurrentUser(JSON.parse(userData));
    }
  }, []);

  const isSuperAdmin = currentUser?.email === 'admin@kanposvn.com';
  const isCafeAdmin = currentUser?.email === 'admin@kanposvncafe.com';

  useEffect(() => {
    fetch('/api/users', { headers: { Authorization: `Bearer ${token}` } }).then(r => r.json()).then((data: User[]) => setUsers(data));
    fetch('/api/apps', { headers: { Authorization: `Bearer ${token}` } }).then(r => r.json()).then(setApps);
    fetch('/api/roles', { headers: { Authorization: `Bearer ${token}` } }).then(r => r.json()).then(setRoles);
  }, []);

  useEffect(() => {
    if (!selectedUser) { setUserPerms([]); return; }
    fetch(`/api/users/${selectedUser}/permissions`, { headers: { Authorization: `Bearer ${token}` } })
      .then(r => r.json())
      .then((data: UserPerm[]) => setUserPerms(data));
    setSaved(false);
  }, [selectedUser]);

  const getPerm = (appCode: string) => {
    return userPerms.find(p => p.app_code === appCode);
  };

  const toggleApp = (app: App) => {
    if (!isSuperAdmin && !isCafeAdmin) {
      alert('Chi super admin moi co thay doi quyen');
      return;
    }
    if (isCafeAdmin && app.app_code !== 'kanposvncafe') {
      alert('Cafe admin chi co thay doi quyen kanposvncafe');
      return;
    }
    const existing = getPerm(app.app_code);
    if (existing) {
      setUserPerms(userPerms.filter(p => p.app_code !== app.app_code));
    } else {
      const defaultRole = roles[0];
      setUserPerms([...userPerms, {
        app_id: app.id,
        app_code: app.app_code,
        app_name: app.app_name,
        role_id: defaultRole?.id || '',
        role_name: defaultRole?.role_name || '',
        can_login: true,
      }]);
    }
  };

  const setRole = (appCode: string, roleId: string) => {
    if (!isSuperAdmin && !isCafeAdmin) {
      alert('Chi super admin moi co thay doi quyen');
      return;
    }
    if (isCafeAdmin && appCode !== 'kanposvncafe') {
      alert('Cafe admin chi co thay doi quyen kanposvncafe');
      return;
    }
    const role = roles.find(r => r.id === roleId);
    setUserPerms(userPerms.map(p =>
      p.app_code === appCode ? { ...p, role_id: roleId, role_name: role?.role_name || '' } : p
    ));
  };

  const savePermissions = async () => {
    if (!isSuperAdmin && !isCafeAdmin) {
      alert('Chi super admin moi co thay doi quyen');
      return;
    }
    const perms = userPerms.map(p => ({
      app_id: p.app_id,
      role_id: p.role_id,
      can_login: p.can_login,
    }));
    await fetch(`/api/users/${selectedUser}/permissions`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({ permissions: perms }),
    });
    setSaved(true);
    setTimeout(() => setSaved(false), 2000);
  };

  const selectedUserInfo = users.find(u => u.id === selectedUser);

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Phân quyền Ứng dụng</h1>

      <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
        <label className="block text-sm font-medium text-gray-700 mb-2">Chọn User</label>
        <select
          value={selectedUser}
          onChange={(e) => setSelectedUser(e.target.value)}
          className="border rounded-lg px-4 py-2 w-full max-w-md"
        >
          <option value="">-- Chọn user --</option>
          {users.map(u => (
            <option key={u.id} value={u.id}>{u.email} ({u.full_name})</option>
          ))}
        </select>
      </div>

      {selectedUser && selectedUserInfo && (
        <div className="bg-white rounded-xl shadow-sm p-6">
          <div className="flex justify-between items-center mb-6">
            <div>
              <h3 className="font-bold text-lg">{selectedUserInfo.full_name}</h3>
              <p className="text-sm text-gray-500">{selectedUserInfo.email}</p>
            </div>
            <button onClick={savePermissions} className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">
              {saved ? 'Da luu!' : 'Luu quyen'}
            </button>
          </div>

          <div className="space-y-4">
            {apps.map(app => {
              const perm = getPerm(app.app_code);
              const checked = !!perm;
              const badge = PLATFORM_BADGE[app.platform] || PLATFORM_BADGE.web;

              return (
                <div key={app.app_code} className={`border rounded-xl p-4 transition-all ${checked ? 'border-blue-300 bg-blue-50/50' : 'border-gray-200 bg-white'}`}>
                  <div className="flex items-center gap-4">
                    <input
                      type="checkbox"
                      checked={checked}
                      onChange={() => toggleApp(app)}
                      className="w-5 h-5 rounded text-blue-600"
                    />
                    <div className="flex-1">
                      <div className="flex items-center gap-2">
                        <span className="font-semibold">{app.app_name}</span>
                        <span className={`text-[10px] px-1.5 py-0.5 rounded-full font-medium ${badge.bg} ${badge.text}`}>
                          {badge.label}
                        </span>
                        {app.package_name && (
                          <span className="text-[10px] text-gray-400 font-mono">{app.package_name}</span>
                        )}
                      </div>
                      <div className="text-xs text-gray-400 mt-0.5">
                        app_code: <code className="bg-gray-100 px-1 rounded">{app.app_code}</code>
                      </div>
                    </div>
                    {checked && (
                      <div className="flex items-center gap-2">
                        <label className="text-sm text-gray-600">Role:</label>
                        <select
                          value={perm?.role_id || ''}
                          onChange={(e) => setRole(app.app_code, e.target.value)}
                          className="border rounded-lg px-3 py-1.5 text-sm"
                        >
                          {roles.map(r => (
                            <option key={r.id} value={r.id}>{r.role_name}</option>
                          ))}
                        </select>
                      </div>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      )}
    </div>
  );
}
