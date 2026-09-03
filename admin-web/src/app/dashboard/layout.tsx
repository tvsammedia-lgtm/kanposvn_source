'use client';
import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { usePathname } from 'next/navigation';

export default function DashboardLayout({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<{ email: string; full_name: string } | null>(null);
  const router = useRouter();
  const pathname = usePathname();

  useEffect(() => {
    const token = localStorage.getItem('admin_token');
    const userData = localStorage.getItem('admin_user');
    if (!token || !userData) {
      router.push('/');
      return;
    }
    setUser(JSON.parse(userData));
  }, [router]);

  const handleLogout = () => {
    localStorage.removeItem('admin_token');
    localStorage.removeItem('admin_user');
    router.push('/');
  };

  const navItems = [
    { href: '/dashboard', label: 'Tong quan', icon: '📊' },
    { href: '/dashboard/apps', label: 'Quan ly Apps', icon: '📱' },
    { href: '/dashboard/modules', label: 'Ẩn/Hiện Ngành nghề & Module', icon: '🧩' },
    { href: '/dashboard/pricing', label: 'Gia & Ban quyen', icon: '💳' },
    { href: '/dashboard/users', label: 'Quan ly Users', icon: '👥' },
    { href: '/dashboard/customers', label: 'Khach hang & Chi nhanh', icon: '🏢' },
    { href: '/dashboard/permissions', label: 'Quyen User - Apps', icon: '🔐' },
    { href: '/dashboard/role-permissions', label: 'Quyen Roles', icon: '🛡️' },
    { href: '/dashboard/sync', label: 'Dong bo', icon: '🔄' },
    { href: '/dashboard/sync-summary', label: 'Xem dong bo', icon: '📊' },
    { href: '/dashboard/logs', label: 'Nhat ky', icon: '📝' },
    { href: '/dashboard/addon-requests', label: 'Duyet mua them', icon: '🧩' },
  ];

  return (
    <div className="min-h-screen bg-gray-100 flex">
      <aside className="w-64 bg-gray-900 text-white flex flex-col">
        <div className="p-6 border-b border-gray-800">
          <h2 className="text-lg font-bold">🛡️ KanPosVN Admin</h2>
          <p className="text-gray-400 text-sm mt-1">Quan ly he thong</p>
        </div>
        <nav className="flex-1 p-4 space-y-1">
          {navItems.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className={`flex items-center gap-3 px-4 py-3 rounded-lg text-sm transition-colors ${
                pathname === item.href
                  ? 'bg-blue-600 text-white'
                  : 'text-gray-400 hover:bg-gray-800 hover:text-white'
              }`}
            >
              <span>{item.icon}</span>
              <span>{item.label}</span>
            </Link>
          ))}
        </nav>
        <div className="p-4 border-t border-gray-800">
          <div className="text-sm text-gray-400 mb-2">{user?.email}</div>
          <button
            onClick={handleLogout}
            className="w-full text-left px-4 py-2 text-sm text-red-400 hover:bg-gray-800 rounded-lg transition-colors"
          >
            Đăng xuất
          </button>
        </div>
      </aside>
      <main className="flex-1 p-8">{children}</main>
    </div>
  );
}
