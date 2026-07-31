'use client';
import { useEffect, useState } from 'react';

interface Log {
  id: string;
  timestamp: string;
  user_name: string;
  action: string;
  module: string;
  details: string;
}

export default function LogsPage() {
  const [logs, setLogs] = useState<Log[]>([]);
  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  useEffect(() => {
    fetch('/api/logs', { headers: { Authorization: `Bearer ${token}` } })
      .then(r => r.json())
      .then(setLogs);
  }, []);

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Nhật ký hoạt động</h1>
      <div className="bg-white rounded-xl shadow-sm overflow-hidden">
        <table className="w-full">
          <thead className="bg-gray-50">
            <tr>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Thời gian</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">User</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Hành động</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Module</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Chi tiết</th>
            </tr>
          </thead>
          <tbody className="divide-y">
            {logs.map(log => (
              <tr key={log.id} className="hover:bg-gray-50">
                <td className="px-6 py-4 text-sm text-gray-500">{new Date(log.timestamp).toLocaleString()}</td>
                <td className="px-6 py-4 text-sm">{log.user_name}</td>
                <td className="px-6 py-4">
                  <span className="text-xs px-2 py-1 rounded-full bg-blue-100 text-blue-700">{log.action}</span>
                </td>
                <td className="px-6 py-4 text-sm text-gray-500">{log.module}</td>
                <td className="px-6 py-4 text-sm text-gray-600">{log.details}</td>
              </tr>
            ))}
          </tbody>
        </table>
        {logs.length === 0 && <p className="text-center py-8 text-gray-400">Chưa có nhật ký</p>}
      </div>
    </div>
  );
}
