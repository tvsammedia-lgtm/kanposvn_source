'use client';
import { useEffect, useState } from 'react';

interface App {
  id: string;
  app_code: string;
  app_name: string;
}

interface SyncLog {
  id: string;
  app_code: string;
  direction: string;
  items_count: number;
  status: string;
  error_message: string;
  created_at: string;
}

interface SyncData {
  id: string;
  app_code: string;
  collection: string;
  item_id: string;
  updated_at: string;
}

export default function SyncPage() {
  const [apps, setApps] = useState<App[]>([]);
  const [selectedApp, setSelectedApp] = useState('');
  const [logs, setLogs] = useState<SyncLog[]>([]);
  const [syncData, setSyncData] = useState<SyncData[]>([]);
  const [activeTab, setActiveTab] = useState<'logs' | 'data'>('logs');
  const token = typeof window !== 'undefined' ? localStorage.getItem('admin_token') : '';

  useEffect(() => {
    fetch('/api/apps', { headers: { Authorization: `Bearer ${token}` } })
      .then(r => r.json())
      .then(setApps);
  }, [token]);

  useEffect(() => {
    if (!selectedApp) {
      setLogs([]);
      setSyncData([]);
      return;
    }
    loadSyncData();
  }, [selectedApp, activeTab]);

  const loadSyncData = () => {
    if (activeTab === 'logs') {
      fetch(`/api/sync/logs?appCode=${selectedApp}`, { headers: { Authorization: `Bearer ${token}` } })
        .then(r => r.json())
        .then(setLogs);
    } else {
      fetch(`/api/sync/data?appCode=${selectedApp}`, { headers: { Authorization: `Bearer ${token}` } })
        .then(r => r.json())
        .then(setSyncData);
    }
  };

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Đồng bộ dữ liệu</h1>

      <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
        <label className="block text-sm font-medium text-gray-700 mb-2">Chọn App</label>
        <select
          value={selectedApp}
          onChange={(e) => setSelectedApp(e.target.value)}
          className="border rounded-lg px-4 py-2 w-full max-w-md"
        >
          <option value="">-- Chọn app --</option>
          {apps.map(a => (
            <option key={a.id} value={a.app_code}>{a.app_name} ({a.app_code})</option>
          ))}
        </select>
      </div>

      {selectedApp && (
        <div className="bg-white rounded-xl shadow-sm">
          <div className="border-b">
            <div className="flex">
              <button
                onClick={() => setActiveTab('logs')}
                className={`px-6 py-3 font-medium ${activeTab === 'logs' ? 'border-b-2 border-blue-600 text-blue-600' : 'text-gray-500'}`}
              >
                Nhật ký đồng bộ
              </button>
              <button
                onClick={() => setActiveTab('data')}
                className={`px-6 py-3 font-medium ${activeTab === 'data' ? 'border-b-2 border-blue-600 text-blue-600' : 'text-gray-500'}`}
              >
                Dữ liệu đồng bộ
              </button>
            </div>
          </div>

          <div className="p-6">
            {activeTab === 'logs' ? (
              <div>
                <table className="w-full">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Thời gian</th>
                      <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Hướng</th>
                      <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Số bản ghi</th>
                      <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Trạng thái</th>
                      <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Lỗi</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y">
                    {logs.map(log => (
                      <tr key={log.id} className="hover:bg-gray-50">
                        <td className="px-4 py-3 text-sm text-gray-500">{new Date(log.created_at).toLocaleString()}</td>
                        <td className="px-4 py-3">
                          <span className={`text-xs px-2 py-1 rounded-full ${log.direction === 'push' ? 'bg-blue-100 text-blue-700' : 'bg-green-100 text-green-700'}`}>
                            {log.direction}
                          </span>
                        </td>
                        <td className="px-4 py-3 text-sm">{log.items_count}</td>
                        <td className="px-4 py-3">
                          <span className={`text-xs px-2 py-1 rounded-full ${log.status === 'success' ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                            {log.status}
                          </span>
                        </td>
                        <td className="px-4 py-3 text-sm text-red-500">{log.error_message || '-'}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
                {logs.length === 0 && <p className="text-center py-8 text-gray-400">Chưa có nhật ký</p>}
              </div>
            ) : (
              <div>
                <table className="w-full">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Collection</th>
                      <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Item ID</th>
                      <th className="text-left px-4 py-3 text-sm font-semibold text-gray-600">Cập nhật</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y">
                    {syncData.map(data => (
                      <tr key={data.id} className="hover:bg-gray-50">
                        <td className="px-4 py-3 text-sm font-mono">{data.collection}</td>
                        <td className="px-4 py-3 text-sm font-mono text-gray-500">{data.item_id}</td>
                        <td className="px-4 py-3 text-sm text-gray-500">{new Date(data.updated_at).toLocaleString()}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
                {syncData.length === 0 && <p className="text-center py-8 text-gray-400">Chưa có dữ liệu</p>}
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );
}
