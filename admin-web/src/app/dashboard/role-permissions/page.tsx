'use client';
import { useEffect, useState } from 'react';

interface App { id: string; app_code: string; app_name: string; }
interface Role { id: string; role_name: string; }
interface RolePerm {
  id: string;
  app_code: string;
  app_name: string;
  role_name: string;
  can_view: boolean;
  can_edit: boolean;
  can_delete: boolean;
}

export default function RolePermissionsPage() {
  const [apps, setApps] = useState<App[]>([]);
  const [roles, setRoles] = useState<Role[]>([]);
  const [perms, setPerms] = useState<RolePerm[]>([]);
  const [selectedApp, setSelectedApp] = useState('');
  const [saved, setSaved] = useState(false);

  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  useEffect(() => {
    fetch('/api/apps', { headers: { Authorization: `Bearer ${token}` } }).then(r => r.json()).then(setApps);
    fetch('/api/roles', { headers: { Authorization: `Bearer ${token}` } }).then(r => r.json()).then(setRoles);
    fetch('/api/role-permissions', { headers: { Authorization: `Bearer ${token}` } }).then(r => r.json()).then(setPerms);
  }, []);

  const getPerm = (appCode: string, roleName: string) => {
    return perms.find(p => p.app_code === appCode && p.role_name === roleName);
  };

  const toggle = async (appCode: string, roleName: string, field: 'can_view' | 'can_edit' | 'can_delete') => {
    const current = getPerm(appCode, roleName);
    const next: RolePerm = current
      ? { ...current, [field]: !current[field] }
      : {
          id: '',
          app_code: appCode,
          app_name: '',
          role_name: roleName,
          can_view: field === 'can_view',
          can_edit: field === 'can_edit',
          can_delete: field === 'can_delete',
        };

    setPerms(prev => {
      const idx = prev.findIndex(p => p.app_code === appCode && p.role_name === roleName);
      if (idx === -1) return [...prev, next];
      const copy = [...prev];
      copy[idx] = next;
      return copy;
    });

    const res = await fetch('/api/role-permissions', {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
      body: JSON.stringify({
        app_code: appCode,
        role_name: roleName,
        can_view: next.can_view,
        can_edit: next.can_edit,
        can_delete: next.can_delete,
      }),
    });

    if (res.ok) {
      setSaved(true);
      setTimeout(() => setSaved(false), 1500);
    }
  };

  const filteredApps = selectedApp ? apps.filter(a => a.app_code === selectedApp) : apps;

  return (
    <div>
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-2xl font-bold">Phan quyen Roles</h1>
        {saved && <span className="text-green-600 text-sm font-medium">Da luu!</span>}
      </div>

      <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
        <label className="block text-sm font-medium text-gray-700 mb-2">Chon Ung dung</label>
        <select
          value={selectedApp}
          onChange={(e) => setSelectedApp(e.target.value)}
          className="border rounded-lg px-4 py-2 w-full max-w-md"
        >
          <option value="">-- Tat ca ung dung --</option>
          {apps.map(a => (
            <option key={a.app_code} value={a.app_code}>{a.app_name} ({a.app_code})</option>
          ))}
        </select>
      </div>

      {filteredApps.map(app => (
        <div key={app.app_code} className="bg-white rounded-xl shadow-sm p-6 mb-4">
          <h3 className="font-bold text-lg mb-4">{app.app_name}</h3>
          <table className="w-full border">
            <thead>
              <tr className="bg-gray-50">
                <th className="text-left px-4 py-3 border text-sm">Role</th>
                <th className="text-center px-4 py-3 border text-sm">Xem</th>
                <th className="text-center px-4 py-3 border text-sm">Sua</th>
                <th className="text-center px-4 py-3 border text-sm">Xoa</th>
              </tr>
            </thead>
            <tbody>
              {roles.map(r => {
                const p = getPerm(app.app_code, r.role_name);
                return (
                  <tr key={r.id} className="hover:bg-gray-50">
                    <td className="px-4 py-3 border text-sm font-medium">{r.role_name}</td>
                    {(['can_view', 'can_edit', 'can_delete'] as const).map(field => (
                      <td key={field} className="text-center px-4 py-3 border">
                        <input
                          type="checkbox"
                          checked={p?.[field] ?? (field === 'can_view')}
                          onChange={() => toggle(app.app_code, r.role_name, field)}
                          className="w-5 h-5 rounded text-blue-600"
                        />
                      </td>
                    ))}
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      ))}
    </div>
  );
}
