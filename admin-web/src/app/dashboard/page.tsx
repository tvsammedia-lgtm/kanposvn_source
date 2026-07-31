'use client';
import { useEffect, useState } from 'react';

interface Stats {
  totalUsers: number;
  activeUsers: number;
  lockedUsers: number;
  totalApps: number;
  recentLogs: number;
}

export default function DashboardPage() {
  const [stats, setStats] = useState<Stats | null>(null);

  useEffect(() => {
    const token = localStorage.getItem('admin_token');
    fetch('/api/dashboard', { headers: { Authorization: `Bearer ${token}` } })
      .then((r) => r.json())
      .then(setStats);
  }, []);

  const cards = stats
    ? [
        { label: 'Tổng Users', value: stats.totalUsers, color: 'bg-blue-500', icon: '👥' },
        { label: 'Đang hoạt động', value: stats.activeUsers, color: 'bg-green-500', icon: '✅' },
        { label: 'Đã khóa', value: stats.lockedUsers, color: 'bg-red-500', icon: '🔒' },
        { label: 'Ứng dụng', value: stats.totalApps, color: 'bg-purple-500', icon: '📱' },
        { label: 'Log 24h', value: stats.recentLogs, color: 'bg-yellow-500', icon: '📝' },
      ]
    : [];

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Tổng quan hệ thống</h1>
      <div className="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-5 gap-4">
        {cards.map((card) => (
          <div key={card.label} className="bg-white rounded-xl shadow-sm p-6">
            <div className="flex items-center justify-between mb-3">
              <span className="text-2xl">{card.icon}</span>
              <div className={`w-3 h-3 rounded-full ${card.color}`} />
            </div>
            <div className="text-3xl font-bold">{card.value ?? '...'}</div>
            <div className="text-sm text-gray-500 mt-1">{card.label}</div>
          </div>
        ))}
      </div>
    </div>
  );
}
