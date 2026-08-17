import { useState, useEffect } from 'react';
import { API_BASE } from '../config';

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

interface Props {
  onBack: () => void;
}

const FALLBACK_TAG = 'nightly';

const DEFAULT_APK_ASSETS: Asset[] = [
  { name: 'app-release.apk', size: 0, download_count: 0, browser_download_url: '' },
  { name: 'app-arm64-v8a-release.apk', size: 0, download_count: 0, browser_download_url: '' },
  { name: 'app-armeabi-v7a-release.apk', size: 0, download_count: 0, browser_download_url: '' },
  { name: 'app-x86_64-release.apk', size: 0, download_count: 0, browser_download_url: '' },
];

const DEFAULT_WIN_ASSETS: Asset[] = [
  { name: 'kanposvn-windows-x64.zip', size: 0, download_count: 0, browser_download_url: '' },
  { name: 'kanposvn.exe', size: 0, download_count: 0, browser_download_url: '' },
];

function formatBytes(bytes: number): string {
  if (!bytes) return '';
  const mb = bytes / 1024 / 1024;
  return mb > 1024 ? `${(mb / 1024).toFixed(1)} GB` : `${mb.toFixed(1)} MB`;
}

function assetLabel(name: string): string {
  if (name === 'app-release.apk') return 'APK pho thong (moi may)';
  if (name === 'kanposvn-windows-x64.zip') return 'Ban Windows 64-bit (.zip)';
  if (name === 'kanposvn.exe') return 'Ban Windows 64-bit (.exe)';
  return name
    .replace('app-', '')
    .replace('-release.apk', '')
    .replace('arm64-v8a', 'Chip ARM 64-bit (Android 9+)')
    .replace('armeabi-v7a', 'Chip ARM 32-bit (may cu)')
    .replace('x86_64', 'Chip x86_64 (may ao)');
}

function proxyUrl(tag: string, name: string): string {
  return `${API_BASE}/api/update/download?tag=${encodeURIComponent(tag)}&asset=${encodeURIComponent(name)}`;
}

function mergeAssets(live: Asset[] | undefined, defaults: Asset[], tag: string): Asset[] {
  if (!live || live.length === 0) {
    return defaults.map((a) => ({ ...a, browser_download_url: proxyUrl(tag, a.name) }));
  }
  return live.map((a) => ({
    ...a,
    browser_download_url: a.browser_download_url || proxyUrl(tag, a.name),
  }));
}

function DownloadButton({ asset }: { asset: Asset }) {
  const [copied, setCopied] = useState(false);
  const [showUrl, setShowUrl] = useState(false);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(asset.browser_download_url);
      setCopied(true);
      setTimeout(() => setCopied(false), 3000);
    } catch {
      setShowUrl(!showUrl);
    }
  };

  return (
    <div>
      <button
        onClick={handleCopy}
        className="w-full flex items-center justify-between bg-blue-600 hover:bg-blue-700 text-white rounded-xl px-4 py-3 transition text-left"
      >
        <div>
          <div className="font-semibold text-sm">{assetLabel(asset.name)}</div>
          <div className="text-xs text-blue-200">
            {asset.name}
            {asset.size > 0 ? ` · ${formatBytes(asset.size)}` : ''}
          </div>
        </div>
        <span className="text-xs bg-blue-500 px-2 py-1 rounded-lg whitespace-nowrap ml-2">
          {copied ? '✓ Da copy' : '📋 Copy link'}
        </span>
      </button>
      {showUrl && (
        <div className="bg-gray-100 rounded-lg p-2 mt-1 text-xs text-gray-600 break-all select-all">
          {asset.browser_download_url}
        </div>
      )}
    </div>
  );
}

export default function Download({ onBack }: Props) {
  const [info, setInfo] = useState<UpdateInfo | null>(null);
  const [error, setError] = useState('');

  useEffect(() => {
    fetch(`${API_BASE}/api/update/latest`)
      .then((r) => r.json())
      .then(setInfo)
      .catch((e) => setError(String(e)));
  }, []);

  const tag = info?.tag_name || FALLBACK_TAG;

  const apkAssets = mergeAssets(
    info?.assets?.filter((a) => a.name.endsWith('.apk')),
    DEFAULT_APK_ASSETS,
    tag,
  );
  const winAssets = mergeAssets(
    info?.assets?.filter((a) => a.name.endsWith('.zip') || a.name.endsWith('.exe')),
    DEFAULT_WIN_ASSETS,
    tag,
  );

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-purple-600 text-white p-4">
        <button onClick={onBack} className="text-sm mb-2 opacity-80">
          ← Quay lai
        </button>
        <h1 className="text-xl font-bold">Tai KanPosVN POS</h1>
        <p className="text-purple-100 text-sm">
          Phan mem quan ly ban hang da nganh cho Android / Windows
        </p>
      </div>

      {error && (
        <div className="bg-red-50 text-red-600 text-sm p-3 m-4 rounded-lg">{error}</div>
      )}

      {info?.has_update && (
        <div className="bg-white rounded-xl shadow-sm p-4 mx-4 mt-4">
          <div className="flex items-center justify-between mb-2">
            <div>
              <div className="text-sm text-gray-500">Phien ban moi nhat</div>
              <div className="text-xl font-bold">
                v{info.latest_version}
                {info.prerelease && (
                  <span className="ml-2 text-xs text-orange-500">(ban thu nghiem)</span>
                )}
              </div>
            </div>
            {info.published_at && (
              <div className="text-sm text-gray-400">
                {new Date(info.published_at).toLocaleDateString('vi-VN')}
              </div>
            )}
          </div>
          {info.notes && (
            <div className="text-sm text-gray-600 whitespace-pre-line border-t pt-2 mt-2">
              {info.notes.slice(0, 800)}
            </div>
          )}
        </div>
      )}

      {info && !info.has_update && (
        <div className="bg-orange-50 text-orange-700 text-sm p-3 m-4 rounded-lg">
          Ban phat hanh moi dang duoc chuan bi.
        </div>
      )}

      {!info && !error && (
        <div className="text-center text-gray-400 py-4">Dang tai thong tin phien ban...</div>
      )}

      {/* Huong dan */}
      <div className="bg-blue-50 text-blue-800 text-sm p-3 mx-4 mt-4 rounded-lg">
        💡 Nhan <strong>"Copy link"</strong> de sao chep dia chi tai, sau do mo trinh duyet tren di dong/ may tinh va dan vao thanh dia chi de tai ve.
      </div>

      {/* Android APK */}
      <div className="bg-white rounded-xl shadow-sm p-4 mx-4 mt-3">
        <div className="flex items-center gap-3 mb-3">
          <div className="text-3xl">📱</div>
          <div>
            <h3 className="font-bold text-gray-800">Android (.apk)</h3>
            <p className="text-sm text-gray-500">Cho di dong Android</p>
          </div>
        </div>
        <div className="space-y-2">
          {apkAssets.map((asset) => (
            <DownloadButton key={asset.name} asset={asset} />
          ))}
        </div>
      </div>

      {/* Windows */}
      <div className="bg-white rounded-xl shadow-sm p-4 mx-4 mt-3">
        <div className="flex items-center gap-3 mb-3">
          <div className="text-3xl">🖥️</div>
          <div>
            <h3 className="font-bold text-gray-800">Windows (may tinh)</h3>
            <p className="text-sm text-gray-500">Cho may tinh Windows</p>
          </div>
        </div>
        <div className="space-y-2">
          {winAssets.map((asset) => (
            <DownloadButton key={asset.name} asset={asset} />
          ))}
        </div>
      </div>

      {/* Instructions */}
      <div className="bg-white rounded-xl shadow-sm p-4 mx-4 mt-3 mb-6">
        <h4 className="font-bold text-gray-800 mb-2">Huong dan cai dat</h4>
        <ol className="text-sm text-gray-600 space-y-1 list-decimal pl-4">
          <li>Nhan "Copy link" de sao chep dia chi tai.</li>
          <li>Mo trinh duyet tren di dong (Chrome, Safari...).</li>
          <li>Dan dia chi vao thanh dia chi → nhan Enter de tai ve.</li>
          <li>Vao Cai dat → Bao mat, bat "Cho phep cai dat tu nguon khong xac dinh".</li>
          <li>Mo file APK da tai va cai dat.</li>
          <li>Dang nhap trong POS bang tai khoan Zalo.</li>
        </ol>
      </div>
    </div>
  );
}
