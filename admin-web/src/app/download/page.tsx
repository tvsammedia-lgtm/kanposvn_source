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
  prerelease?: boolean;
  assets?: Asset[];
  message?: string;
}

const FALLBACK_TAG = 'nightly';

// Danh sách bản tải luôn hiển thị (đóng cứng) để user luôn có nút tải,
// không phụ thuộc vào việc API có trả về release hay không.
const DEFAULT_APK_ASSETS: Asset[] = [
  {
    name: 'app-release.apk',
    size: 0,
    download_count: 0,
    browser_download_url: '',
  },
  {
    name: 'app-arm64-v8a-release.apk',
    size: 0,
    download_count: 0,
    browser_download_url: '',
  },
  {
    name: 'app-armeabi-v7a-release.apk',
    size: 0,
    download_count: 0,
    browser_download_url: '',
  },
  {
    name: 'app-x86_64-release.apk',
    size: 0,
    download_count: 0,
    browser_download_url: '',
  },
];

const DEFAULT_WIN_ASSETS: Asset[] = [
  {
    name: 'kanposvn-windows-x64.zip',
    size: 0,
    download_count: 0,
    browser_download_url: '',
  },
  {
    name: 'kanposvn.exe',
    size: 0,
    download_count: 0,
    browser_download_url: '',
  },
];

function formatBytes(bytes: number): string {
  if (!bytes) return '';
  const mb = bytes / 1024 / 1024;
  return mb > 1024 ? `${(mb / 1024).toFixed(1)} GB` : `${mb.toFixed(1)} MB`;
}

function assetLabel(name: string): string {
  if (name === 'app-release.apk') return 'APK phổ thông (mọi máy)';
  if (name === 'kanposvn-windows-x64.zip') return 'Bản Windows 64-bit (.zip)';
  if (name === 'kanposvn.exe') return 'Bản Windows 64-bit (.exe)';
  return name
    .replace('app-', '')
    .replace('-release.apk', '')
    .replace('arm64-v8a', 'Chip ARM 64-bit (Android 9+)')
    .replace('armeabi-v7a', 'Chip ARM 32-bit (máy cũ)')
    .replace('x86_64', 'Chip x86_64 (máy ảo)');
}

// Tạo URL tải qua proxy của admin-web (hoạt động cả khi repo private).
function proxyUrl(tag: string, name: string): string {
  return `/api/update/download?tag=${encodeURIComponent(
    tag,
  )}&asset=${encodeURIComponent(name)}`;
}

// Nếu API không trả về asset thật thì dùng danh sách mặc định,
// nếu có thì ưu tiên dữ liệu thật từ GitHub.
function mergeAssets(
  live: Asset[] | undefined,
  defaults: Asset[],
  tag: string,
): Asset[] {
  if (!live || live.length === 0) {
    return defaults.map((a) => ({ ...a, browser_download_url: proxyUrl(tag, a.name) }));
  }
  return live.map((a) => ({
    ...a,
    browser_download_url: a.browser_download_url || proxyUrl(tag, a.name),
  }));
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

  const tag = info?.tag_name || FALLBACK_TAG;
  const hasRelease = !!info && info.has_update;

  const apkAssets = mergeAssets(
    info?.assets?.filter((a) => a.name.endsWith('.apk')),
    DEFAULT_APK_ASSETS,
    tag,
  );
  const winAssets = mergeAssets(
    info?.assets?.filter(
      (a) => a.name.endsWith('.zip') || a.name.endsWith('.exe'),
    ),
    DEFAULT_WIN_ASSETS,
    tag,
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

        {info?.has_update && (
          <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-6">
            <div className="flex items-center justify-between mb-4">
              <div>
                <div className="text-sm text-gray-500">Phiên bản mới nhất</div>
                <div className="text-2xl font-bold">
                  v{info.latest_version}
                  {info.prerelease ? (
                    <span className="ml-2 text-xs font-normal text-amber-600 align-middle">
                      (bản thử nghiệm)
                    </span>
                  ) : null}
                </div>
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
          </div>
        )}

        {info && !info.has_update && (
          <div className="bg-amber-50 border border-amber-200 text-amber-800 rounded-xl p-4 mb-6 text-sm">
            Bản phát hành mới đang được chuẩn bị. Các nút tải bên dưới sẽ kích hoạt
            ngay khi có bản build mới nhất (bản nightly).
          </div>
        )}

        {!info && !error && (
          <div className="text-center text-gray-400 py-4">
            Đang tải thông tin phiên bản...
          </div>
        )}

        <section className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-6">
          <div className="flex items-center justify-between mb-4">
            <div>
              <h2 className="font-bold text-lg">Tải KanPosVN về máy</h2>
              <p className="text-sm text-gray-500">
                Chọn bản phù hợp với thiết bị của bạn.
              </p>
            </div>
            {info?.latest_version && (
              <div className="text-sm text-gray-400 text-right">
                <div>Phiên bản: v{info.latest_version}</div>
                {info.published_at && (
                  <div>
                    Phát hành:{' '}
                    {new Date(info.published_at).toLocaleDateString('vi-VN')}
                  </div>
                )}
                {info.prerelease && (
                  <span className="text-xs text-amber-600">(bản thử nghiệm)</span>
                )}
              </div>
            )}
          </div>

          {info?.notes && info.has_update && (
            <div className="mb-4 p-3 bg-gray-50 rounded-lg border border-gray-200">
              <div className="text-xs font-semibold text-gray-600 mb-1">
                Ghi chú bản cập nhật
              </div>
              <div className="text-sm text-gray-700 whitespace-pre-line">
                {info.notes.slice(0, 500)}
                {info.notes.length > 500 ? '...' : ''}
              </div>
            </div>
          )}

          <h3 className="text-sm font-semibold text-gray-500 mb-2">
            Android (.apk)
          </h3>
          <div className="space-y-3 mb-6">
            {apkAssets.map((asset) => (
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
                    {asset.name}
                    {asset.size > 0
                      ? ` · ${formatBytes(asset.size)}`
                      : ''}
                    {asset.download_count > 0
                      ? ` · ${asset.download_count.toLocaleString('vi-VN')} lượt tải`
                      : ''}
                  </div>
                </div>
                <span className="text-2xl">⬇</span>
              </a>
            ))}
          </div>

          <h3 className="text-sm font-semibold text-gray-500 mb-2">
            Windows (máy tính)
          </h3>
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
                    {asset.name}
                    {asset.size > 0
                      ? ` · ${formatBytes(asset.size)}`
                      : ''}
                    {asset.download_count > 0
                      ? ` · ${asset.download_count.toLocaleString('vi-VN')} lượt tải`
                      : ''}
                  </div>
                </div>
                <span className="text-2xl">⬇</span>
              </a>
            ))}
          </div>
        </section>

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
