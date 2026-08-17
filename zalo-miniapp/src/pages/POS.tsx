import type { ZaloUser, AppModule, Branch } from '../config';

interface Props {
  user: ZaloUser;
  app: AppModule;
  branch: Branch;
  onBack: () => void;
}

export default function POS({ user, app, branch, onBack }: Props) {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-blue-600 text-white p-4">
        <div className="flex items-center justify-between">
          <button onClick={onBack} className="text-sm opacity-80">
            ← Quay lai
          </button>
          <span className="text-sm font-mono">{branch.branch_code}</span>
        </div>
        <h1 className="text-lg font-bold mt-1">{branch.name}</h1>
        <p className="text-blue-100 text-xs">
          Xin chao, {user.full_name}
        </p>
      </div>

      {/* Content */}
      <div className="p-4">
        <div className="bg-white rounded-xl shadow-sm p-6 text-center">
          <div className="text-6xl mb-4">🏪</div>
          <h2 className="text-xl font-bold text-gray-800 mb-2">
            {app.app_name}
          </h2>
          <p className="text-gray-500 text-sm mb-6">
            {branch.name}
          </p>

          <div className="space-y-3">
            <button className="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 rounded-xl transition">
              📋 Danh sach don hang
            </button>
            <button className="w-full bg-green-600 hover:bg-green-700 text-white font-bold py-3 rounded-xl transition">
              ➕ Tao don hang moi
            </button>
            <button className="w-full bg-purple-600 hover:bg-purple-700 text-white font-bold py-3 rounded-xl transition">
              📊 Bao cao doanh thu
            </button>
          </div>
        </div>

        {/* Info card */}
        <div className="mt-4 bg-white rounded-xl shadow-sm p-4">
          <h3 className="font-bold text-gray-800 mb-2">Thong tin chi nhanh</h3>
          <div className="text-sm text-gray-600 space-y-1">
            <div>📱 SĐT: {branch.phone || 'Chua cap nhat'}</div>
            <div>📍 Dia chi: {branch.address || 'Chua cap nhat'}</div>
            <div>🔑 Ma chi nhanh: {branch.branch_code}</div>
          </div>
        </div>
      </div>
    </div>
  );
}
