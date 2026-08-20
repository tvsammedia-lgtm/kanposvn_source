'use client';
import { useEffect, useState } from 'react';

interface ErrorLog {
  id: string;
  module: string;
  screen: string;
  action: string;
  level: string;
  error_code: string;
  message: string;
  stack_trace: string;
  device_info: string;
  user_id: string;
  user_name: string;
  phone: string;
  created_at: string;
}

const LEVEL_COLORS: Record<string, string> = {
  critical: 'bg-red-100 text-red-800',
  error: 'bg-red-50 text-red-700',
  warning: 'bg-yellow-100 text-yellow-700',
  info: 'bg-blue-100 text-blue-700',
};

const MODULES = [
  '', 'kanposvncafe', 'kanposvngara', 'kanposvncrm', 'nhansu',
  'kanposvnkhachsan', 'kanposvnvlxd', 'kanposvnnhathuoc', 'kanposvnbida',
  'kanposvnpawn', 'kanposvnspa', 'kanposvnbarber',
];

const LEVELS = ['', 'info', 'warning', 'error', 'critical'];

export default function ErrorLogsPage() {
  const [logs, setLogs] = useState<ErrorLog[]>([]);
  const [filterModule, setFilterModule] = useState('');
  const [filterLevel, setFilterLevel] = useState('');
  const [expandedId, setExpandedId] = useState<string | null>(null);
  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  const fetchLogs = () => {
    const params = new URLSearchParams();
    if (filterModule) params.set('module', filterModule);
    if (filterLevel) params.set('level', filterLevel);
    params.set('limit', '200');

    fetch(`/api/crm/error-logs?${params}`, { headers: { Authorization: `Bearer ${token}` } })
      .then(r => r.json())
      .then(data => setLogs(Array.isArray(data) ? data : []));
  };

  useEffect(() => { fetchLogs(); }, [filterModule, filterLevel]);

  const handleDelete = async (id: string) => {
    if (!confirm('Xóa log này?')) return;
    await fetch(`/api/crm/error-logs?id=${id}`, {
      method: 'DELETE',
      headers: { Authorization: `Bearer ${token}` },
    });
    fetchLogs();
  };

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Log Báo Lỗi</h1>

      {/* Filters */}
      <div className="flex gap-4 mb-6">
        <div>
          <label className="text-sm text-gray-600 mr-2">Module:</label>
          <select
            value={filterModule}
            onChange={e => setFilterModule(e.target.value)}
            className="border rounded-lg px-3 py-2 text-sm"
          >
            <option value="">Tất cả</option>
            {MODULES.filter(Boolean).map(m => (
              <option key={m} value={m}>{m}</option>
            ))}
          </select>
        </div>
        <div>
          <label className="text-sm text-gray-600 mr-2">Mức:</label>
          <select
            value={filterLevel}
            onChange={e => setFilterLevel(e.target.value)}
            className="border rounded-lg px-3 py-2 text-sm"
          >
            <option value="">Tất cả</option>
            {LEVELS.filter(Boolean).map(l => (
              <option key={l} value={l}>{l}</option>
            ))}
          </select>
        </div>
        <button
          onClick={fetchLogs}
          className="bg-blue-500 text-white px-4 py-2 rounded-lg text-sm hover:bg-blue-600"
        >
          Tải lại
        </button>
      </div>

      {/* Table */}
      <div className="bg-white rounded-xl shadow-sm overflow-hidden">
        <table className="w-full">
          <thead className="bg-gray-50">
            <tr>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Thời gian</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Mức</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Mã lỗi</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Module</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Màn hình</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Action</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Thông báo</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">User</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600">Số ĐT</th>
              <th className="text-left px-6 py-3 text-sm font-semibold text-gray-600"></th>
            </tr>
          </thead>
          <tbody className="divide-y">
            {logs.map(log => (
              <>
                <tr
                  key={log.id}
                  className="hover:bg-gray-50 cursor-pointer"
                  onClick={() => setExpandedId(expandedId === log.id ? null : log.id)}
                >
                  <td className="px-6 py-4 text-sm text-gray-500">
                    {new Date(log.created_at).toLocaleString()}
                  </td>
                  <td className="px-6 py-4">
                    <span className={`text-xs px-2 py-1 rounded-full ${LEVEL_COLORS[log.level] || 'bg-gray-100 text-gray-700'}`}>
                      {log.level}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-xs font-mono text-gray-500">{log.error_code}</td>
                  <td className="px-6 py-4 text-sm text-gray-600">{log.module}</td>
                  <td className="px-6 py-4 text-sm text-gray-600">{log.screen}</td>
                  <td className="px-6 py-4 text-sm text-gray-600">{log.action}</td>
                  <td className="px-6 py-4 text-sm max-w-xs truncate">{log.message}</td>
                  <td className="px-6 py-4 text-sm text-gray-500">{log.user_name || log.user_id}</td>
                  <td className="px-6 py-4 text-sm text-gray-500">{log.phone}</td>
                  <td className="px-6 py-4">
                    <button
                      onClick={e => { e.stopPropagation(); handleDelete(log.id); }}
                      className="text-red-500 hover:text-red-700 text-sm"
                    >
                      Xóa
                    </button>
                  </td>
                </tr>
                {expandedId === log.id && (
                  <tr key={`${log.id}-detail`}>
                    <td colSpan={10} className="px-6 py-4 bg-gray-50">
                      <div className="grid grid-cols-3 gap-4 text-sm">
                        <div>
                          <span className="font-semibold text-gray-600">Mã lỗi:</span> {log.error_code}
                        </div>
                        <div>
                          <span className="font-semibold text-gray-600">Action:</span> {log.action}
                        </div>
                        <div>
                          <span className="font-semibold text-gray-600">Số ĐT:</span> {log.phone}
                        </div>
                        <div>
                          <span className="font-semibold text-gray-600">Thiết bị:</span> {log.device_info}
                        </div>
                        <div>
                          <span className="font-semibold text-gray-600">User ID:</span> {log.user_id}
                        </div>
                      </div>
                      {log.stack_trace && (
                        <div className="mt-3">
                          <span className="font-semibold text-gray-600 text-sm">Stack Trace:</span>
                          <pre className="mt-1 p-3 bg-gray-800 text-green-400 rounded-lg text-xs overflow-x-auto max-h-64">
                            {log.stack_trace}
                          </pre>
                        </div>
                      )}
                    </td>
                  </tr>
                )}
              </>
            ))}
          </tbody>
        </table>
        {logs.length === 0 && <p className="text-center py-8 text-gray-400">Chưa có log lỗi nào</p>}
      </div>
    </div>
  );
}
