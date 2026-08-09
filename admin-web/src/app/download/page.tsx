'use client';
import { useEffect, useState } from 'react';

interface Asset {
  name: string;
  size: number;
  download_count: number;
  browser_download_url: string;
}

interface UpdateInfo {
  success: boolean;
  has_update: boolean;
  latest_version: string | null;
  tag_name?: string;
  name?: string;
  notes?: string;
  published_at?: string | null;
  download_url?: string;
  assets?: Asset[];
  message?: string;
}

function formatBytes(bytes: number): string {
  if (!bytes) return '';
  const mb = bytes / 1024 / 1024;
  return mb > 1024 ? `${(mb / 1024).toFixed(1)} GB` : `${mb.toFixed(1)} MB`;
}

function assetLabel(name: string): string {
  if (name === 'app-release.apk') return 'APK phổ thông (mọi máy)';
  if (name === 'kanposvn-windows-x64.zip') return 'Bản Windows 64-bit (.zip)';
  return name
    .replace('app-', '')
    .replace('-release.apk', '')
    .replace('arm64-v8a', 'Chip ARM 64-bit (Android 9+)')
    .replace('armeabi-v7a', 'Chip ARM 32-bit (máy cũ)')
    .replace('x86_64', 'Chip x86_64 (máy ảo)');
}

export default function DownloadPage() {
  const [info, setInfo] = useState<UpdateInfo | null>(null);
  const [error, setError] = useState('');

  useEffect(() => {
    fetch('/api/update/latest')
      .then((r) => r.json())
      .then(setInfo)
      .catch((e) => setError(String(e)));
  }, []);

  const apkAssets = (info?.assets || []).filter((a) => a.name.endsWith('.apk'));
  const winAssets = (info?.assets || []).filter(
    (a) => a.name.endsWith('.zip') || a.name.endsWith('.exe'),
  );

  return (
    <main className="min-h-screen bg-gradient-to-b from-amber-50 via-white to-white">
      <div className="max-w-3xl mx-auto px-6 py-16">
        <header className="text-center mb-12">
          <h1 className="text-4xl font-bold text-amber-800">KanPosVN POS</h1>
          <p className="mt-3 text-lg text-gray-600">
            Phần mềm quản lý bán hàng đa ngành cho Android
          </p>
          <p className="mt-1 text-sm text-gray-400">
            Cafe · Nhà hàng · Nhà thuốc · Gara · VLXD · Bida · Spa ...
          </p>
        </header>

        {error && (
          <div className="bg-red-50 text-red-700 rounded-xl p-4 mb-6">{error}</div>
        )}

        {!info && !error && (
          <div className="text-center text-gray-400 py-10">Đang tải thông tin phiên bản...</div>
        )}

        {info?.has_update && (
          <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-6">
            <div className="flex items-center justify-between mb-4">
              <div>
                <div className="text-sm text-gray-500">Phiên bản mới nhất</div>
                <div className="text-2xl font-bold">v{info.latest_version}</div>
              </div>
              {info.published_at && (
                <div className="text-sm text-gray-400">
                  {new Date(info.published_at).toLocaleDateString('vi-VN')}
                </div>
              )}
            </div>

            {info.notes && (
              <div className="text-sm text-gray-600 whitespace-pre-line mb-4 border-t border-gray-100 pt-4">
                {info.notes.slice(0, 800)}
              </div>
            )}

            <div className="space-y-3">
              {apkAssets.length > 0 ? (
                apkAssets.map((asset) => (
                  <a
                    key={asset.name}
                    href={asset.browser_download_url}
                    target="_blank"
                    rel="noreferrer"
                    className="flex items-center justify-between bg-amber-600 hover:bg-amber-700 text-white rounded-xl px-5 py-4 transition-colors"
                  >
                    <div>
                      <div className="font-semibold">{assetLabel(asset.name)}</div>
                      <div className="text-sm text-amber-100">
                        {formatBytes(asset.size)} · {asset.download_count.toLocaleString('vi-VN')} lượt tải
                      </div>
                    </div>
                    <span className="text-2xl">⬇</span>
                  </a>
                ))
              ) : (
                <a
                  href={info.download_url}
                  target="_blank"
                  rel="noreferrer"
                  className="block text-center bg-amber-600 hover:bg-amber-700 text-white rounded-xl px-5 py-4 font-semibold transition-colors"
                >
                  Tải APK mới nhất
                </a>
              )}
            </div>
          </div>
        )}

        {info?.has_update && winAssets.length > 0 && (
          <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-6">
            <h2 className="font-bold text-lg mb-1">Bản cài cho Windows</h2>
            <p className="text-sm text-gray-600 mb-4">
              Giải nén file .zip rồi chạy{' '}
              <span className="font-medium">kanposvn.exe</span> trên máy tính.
            </p>
            <div className="space-y-3">
              {winAssets.map((asset) => (
                <a
                  key={asset.name}
                  href={asset.browser_download_url}
                  target="_blank"
                  rel="noreferrer"
                  className="flex items-center justify-between bg-amber-600 hover:bg-amber-700 text-white rounded-xl px-5 py-4 transition-colors"
                >
                  <div>
                    <div className="font-semibold">{assetLabel(asset.name)}</div>
                    <div className="text-sm text-amber-100">
                      {formatBytes(asset.size)} · {asset.download_count.toLocaleString('vi-VN')}{' '}
                      lượt tải
                    </div>
                  </div>
                  <span className="text-2xl">⬇</span>
                </a>
              ))}
            </div>
          </div>
        )}

        {info && !info.has_update && (
          <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 text-center text-gray-500">
            {info.message || 'Chưa có bản phát hành nào.'}
          </div>
        )}

        <section className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-6">
          <h2 className="font-bold text-lg mb-3">Hướng dẫn cài đặt</h2>
          <ol className="list-decimal list-inside space-y-2 text-sm text-gray-700">
            <li>Tải APK phù hợp với máy (ưu tiên APK phổ thông).</li>
            <li>Vào Cài đặt → Bảo mật, bật &quot;Cho phép cài đặt từ nguồn không xác định&quot;.</li>
            <li>Mở file APK đã tải và cài đặt.</li>
            <li>Đăng ký tài khoản trên Zalo Mini App KanPosVN để nhận 7 ngày dùng thử.</li>
            <li>Đăng nhập trong POS bằng số điện thoại đã đăng ký.</li>
          </ol>
        </section>

        <section className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6">
          <h2 className="font-bold text-lg mb-3">Tự động cập nhật</h2>
          <p className="text-sm text-gray-700">
            KanPosVN POS tự kiểm tra phiên bản mới trên GitHub Release khi khởi động.
            Nếu có bản mới, app sẽ thông báo và dẫn bạn tải về trang này.
          </p>
        </section>
      </div>
    </main>
  );
}
