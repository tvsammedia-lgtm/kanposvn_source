import { useState, useEffect } from 'react';
import { API_BASE } from '../config';
import type { ZaloUser, SoftwareItem, UserLicense } from '../config';

interface Props {
  user: ZaloUser;
  licenses: UserLicense[];
  onBrowseSoftware: () => void;
  onMyLicenses: () => void;
  onDownload: () => void;
  onLogout: () => void;
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

function formatPrice(price: number | null) {
  if (!price) return 'Mien phi';
  return new Intl.NumberFormat('vi-VN').format(price) + 'd/nam';
}

function daysLeft(expiresAt: string | null) {
  if (!expiresAt) return null;
  const diff = new Date(expiresAt).getTime() - Date.now();
  return Math.max(0, Math.ceil(diff / (1000 * 60 * 60 * 24)));
}

export default function Home({ user, licenses, onBrowseSoftware, onMyLicenses, onDownload, onLogout }: Props) {
  const activeCount = licenses.filter((l) => l.status === 'active').length;
  const trialCount = licenses.filter((l) => l.plan === 'trial' && l.status === 'active').length;

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-gradient-to-b from-blue-600 to-blue-700 text-white p-5 pb-6">
        <div className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-3">
            <div className="w-12 h-12 bg-white/20 rounded-full flex items-center justify-center text-2xl">
              🏪
            </div>
            <div>
              <h1 className="text-xl font-bold">KanPOS</h1>
              <p className="text-blue-200 text-xs">He thong ban hang</p>
            </div>
          </div>
          <button onClick={onLogout} className="text-sm opacity-70">
            Dang xuat
          </button>
        </div>

        <div className="bg-white/10 rounded-xl p-3">
          <p className="text-sm">Xin chao, <span className="font-bold">{user.full_name}</span></p>
          <p className="text-xs text-blue-200">{user.phone || user.email || user.zalo_id}</p>
        </div>
      </div>

      {/* Stats */}
      <div className="px-4 -mt-3">
        <div className="grid grid-cols-2 gap-3">
          <div className="bg-white rounded-xl shadow-sm p-4 text-center">
            <div className="text-2xl font-bold text-blue-600">{activeCount}</div>
            <div className="text-xs text-gray-500">Goi dang su dung</div>
          </div>
          <div className="bg-white rounded-xl shadow-sm p-4 text-center">
            <div className="text-2xl font-bold text-orange-500">{trialCount}</div>
            <div className="text-xs text-gray-500">Dung thu con lai</div>
          </div>
        </div>
      </div>

      {/* Menu */}
      <div className="p-4 space-y-3">
        <h2 className="text-sm font-bold text-gray-400 uppercase">Chuc nang</h2>

        <button
          onClick={onBrowseSoftware}
          className="w-full bg-white rounded-xl shadow-sm p-4 flex items-center gap-4 hover:shadow-md transition text-left"
        >
          <div className="w-12 h-12 bg-blue-100 text-blue-600 rounded-xl flex items-center justify-center text-2xl">
            📦
          </div>
          <div className="flex-1">
            <div className="font-bold text-gray-800">Danh sach phan mem</div>
            <div className="text-sm text-gray-500">Xem tat ca ung dung POS</div>
          </div>
          <span className="text-gray-300">›</span>
        </button>

        <button
          onClick={onMyLicenses}
          className="w-full bg-white rounded-xl shadow-sm p-4 flex items-center gap-4 hover:shadow-md transition text-left"
        >
          <div className="w-12 h-12 bg-green-100 text-green-600 rounded-xl flex items-center justify-center text-2xl">
            🎫
          </div>
          <div className="flex-1">
            <div className="font-bold text-gray-800">Goi dang su dung</div>
            <div className="text-sm text-gray-500">Quan ly license & goi dich vu</div>
          </div>
          <span className="text-gray-300">›</span>
        </button>

        <button
          onClick={onDownload}
          className="w-full bg-white rounded-xl shadow-sm p-4 flex items-center gap-4 hover:shadow-md transition text-left"
        >
          <div className="w-12 h-12 bg-purple-100 text-purple-600 rounded-xl flex items-center justify-center text-2xl">
            📥
          </div>
          <div className="flex-1">
            <div className="font-bold text-gray-800">Tai ung dung</div>
            <div className="text-sm text-gray-500">Tai APK/Installer cho may tinh</div>
          </div>
          <span className="text-gray-300">›</span>
        </button>

        <div className="bg-white rounded-xl shadow-sm p-4 flex items-center gap-4 text-left opacity-60">
          <div className="w-12 h-12 bg-orange-100 text-orange-600 rounded-xl flex items-center justify-center text-2xl">
            💳
          </div>
          <div className="flex-1">
            <div className="font-bold text-gray-800">Thanh toan</div>
            <div className="text-sm text-gray-500">Nap tien / thanh toan goi</div>
          </div>
          <span className="text-gray-300">›</span>
        </div>

        <div className="bg-white rounded-xl shadow-sm p-4 flex items-center gap-4 text-left opacity-60">
          <div className="w-12 h-12 bg-red-100 text-red-600 rounded-xl flex items-center justify-center text-2xl">
            💬
          </div>
          <div className="flex-1">
            <div className="font-bold text-gray-800">Ho tro</div>
            <div className="text-sm text-gray-500">Lien he ho tro ky thuat</div>
          </div>
          <span className="text-gray-300">›</span>
        </div>
      </div>

      {/* Active licenses preview */}
      {licenses.length > 0 && (
        <div className="px-4 pb-6">
          <h2 className="text-sm font-bold text-gray-400 uppercase mb-3">Goi dang kich hoat</h2>
          <div className="space-y-2">
            {licenses.slice(0, 3).map((lic) => {
              const icon = APP_ICONS[lic.app_code] || '📱';
              const left = daysLeft(lic.expires_at);
              return (
                <div key={lic.id} className="bg-white rounded-xl shadow-sm p-3 flex items-center gap-3">
                  <div className="text-2xl">{icon}</div>
                  <div className="flex-1 min-w-0">
                    <div className="font-bold text-gray-800 text-sm truncate">{lic.app_name || lic.app_code}</div>
                    <div className="text-xs text-gray-500">
                      {lic.plan === 'trial' ? 'Dung thu' : lic.plan === 'yearly' ? '365 ngay' : lic.plan}
                      {left !== null && left > 0 && ` · Con ${left} ngay`}
                    </div>
                  </div>
                  <span className={`text-xs px-2 py-1 rounded-full ${
                    lic.status === 'active'
                      ? 'bg-green-100 text-green-700'
                      : 'bg-gray-100 text-gray-500'
                  }`}>
                    {lic.status === 'active' ? 'Hoat dong' : lic.status}
                  </span>
                </div>
              );
            })}
          </div>
        </div>
      )}
    </div>
  );
}
