import type { AppModule } from '../config';

interface Props {
  apps: AppModule[];
  onSelect: (app: AppModule) => void;
  onBack: () => void;
}

const APP_ICONS: Record<string, string> = {
  kanposvncafe: '☕',
  kanposvnnhahangquanan: '🍜',
  kanposvnnhathuoc: '💊',
  kanposvnvlxd: '🏗️',
  kanposvngara: '🔧',
  kanposvnbida: '🎱',
  kanposvnspa: '💆',
  kanposvnkhachsan: '🏨',
  kanhot_one: '🌿',
  kanposvnbanvevantai: '🚌',
  kanposvnqlcd: '🎬',
  kanposvnnhatro200: '🏠',
  kanposvnnbatdongsan: '🏢',
  nhansu: '👥',
};

function planLabel(plan: string | null) {
  if (!plan) return 'Chua co license';
  if (plan === 'trial') return 'Dung thu';
  if (plan === 'yearly') return '365 ngay';
  if (plan === 'forever') return 'Vinhh vien';
  return plan;
}

function daysLeft(expiresAt: string | null) {
  if (!expiresAt) return null;
  const diff = new Date(expiresAt).getTime() - Date.now();
  return Math.max(0, Math.ceil(diff / (1000 * 60 * 60 * 24)));
}

export default function AppSelector({ apps, onSelect, onBack }: Props) {
  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-blue-600 text-white p-4">
        <button onClick={onBack} className="text-sm mb-2 opacity-80">
          ← Dang xuat
        </button>
        <h1 className="text-xl font-bold">Chon ung dung</h1>
        <p className="text-blue-100 text-sm">
          Ban co {apps.length} ung dung
        </p>
      </div>

      <div className="p-4 space-y-3">
        {apps.map((app) => {
          const icon = APP_ICONS[app.app_code] || '📱';
          const left = daysLeft(app.license?.expires_at ?? null);

          return (
            <button
              key={app.app_code}
              onClick={() => onSelect(app)}
              className="w-full bg-white rounded-xl shadow-sm p-4 flex items-center gap-4 hover:shadow-md transition text-left"
            >
              <div className="text-4xl">{icon}</div>
              <div className="flex-1">
                <div className="font-bold text-gray-800">{app.app_name}</div>
                <div className="text-sm text-gray-500">
                  {app.branches.length} chi nhanh
                </div>
              </div>
              <div className="text-right">
                <div
                  className={`text-xs px-2 py-1 rounded-full ${
                    app.license?.status === 'active'
                      ? 'bg-green-100 text-green-700'
                      : 'bg-gray-100 text-gray-500'
                  }`}
                >
                  {planLabel(app.license?.plan ?? null)}
                </div>
                {left !== null && (
                  <div className="text-xs text-gray-400 mt-1">
                    {left > 0 ? `Con ${left} ngay` : 'Het han'}
                  </div>
                )}
              </div>
            </button>
          );
        })}
      </div>
    </div>
  );
}
