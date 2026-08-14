import { NextRequest, NextResponse } from 'next/server';
import { readdirSync } from 'fs';
import path from 'path';

const GITHUB_REPO = process.env.GITHUB_REPO || 'tvsammedia-lgtm/kanposvn_source';
const GITHUB_TOKEN = process.env.GITHUB_TOKEN || '';
let cache: { at: number; release: any; fromNightly: boolean } | null = null;
const CACHE_MS = 60_000;

// Các file binary mặc định mà CI (build-apk.yml) deploy vào admin-web/public/downloads/
const KNOWN_ASSETS = [
  'app-release.apk',
  'app-arm64-v8a-release.apk',
  'app-armeabi-v7a-release.apk',
  'app-x86_64-release.apk',
  'kanposvn.exe',
  'kanposvn-windows-x64.zip',
];

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

function ghHeaders(): Record<string, string> {
  const headers: Record<string, string> = {
    Accept: 'application/vnd.github+json',
    'User-Agent': 'kanposvn-update-check',
  };
  if (GITHUB_TOKEN) headers.Authorization = `Bearer ${GITHUB_TOKEN}`;
  return headers;
}

async function fetchRelease(url: string) {
  const res = await fetch(url, { headers: ghHeaders(), cache: 'no-store' });
  if (!res.ok) return null;
  return res.json();
}

async function loadRelease() {
  const base = `https://api.github.com/repos/${GITHUB_REPO}/releases`;
  const releases: any[] = (await fetchRelease(base)) || [];
  // Ưu tiên nightly có tag động (nightly-YYYYMMDD-HHMM-sha) để luôn lấy
  // bản build mới nhất do GitHub Action tạo ra. Nếu chưa có nightly thì mới
  // rơi về release chính thức.
  let release = releases.find((r) => typeof r?.tag_name === 'string' && r.tag_name.startsWith('nightly-'));
  let fromNightly = !!release;
  if (!release) {
    release = await fetchRelease(`${base}/latest`);
    fromNightly = false;
  }
  return { release, fromNightly };
}

function buildPayload(
  release: any,
  fromNightly: boolean,
  appCode: string,
  origin: string,
) {
  // Repo private -> không cho tải thẳng từ github.com. Trỏ về proxy của admin-web.
  const proxy = (name: string) =>
    `${origin}/api/update/download?tag=${encodeURIComponent(
      release.tag_name || 'nightly',
    )}&asset=${encodeURIComponent(name)}`;

  const assets = (release.assets || []).map(
    (a: {
      name: string;
      size: number;
      download_count?: number;
    }) => ({
      name: a.name,
      size: a.size,
      download_count: a.download_count || 0,
      browser_download_url: proxy(a.name),
    }),
  );

  const primary =
    assets.find((a: { name: string }) => a.name === 'app-release.apk') ||
    assets[0];

  const latestVersion = fromNightly
    ? `${release.name || 'nightly'}`
    : (release.tag_name || '').replace(/^v/, '');

  return {
    success: true,
    has_update: true,
    app_code: appCode,
    latest_version: latestVersion,
    tag_name: release.tag_name || '',
    name: release.name || release.tag_name || '',
    notes: release.body || '',
    published_at: release.published_at || null,
    prerelease: !!release.prerelease,
    download_url: primary?.browser_download_url || release.html_url || '',
    assets,
  };
}

// Scan local public/downloads/ for available binary files.
function localDownloadAssets(origin: string): any[] {
  const downloadDir = path.join(process.cwd(), 'public', 'downloads');
  try {
    const files = readdirSync(downloadDir);
    return files
      .filter((f) => KNOWN_ASSETS.includes(f))
      .map((name) => ({
        name,
        size: 0,
        download_count: 0,
        browser_download_url: `${origin}/api/update/download?tag=local&asset=${encodeURIComponent(name)}`,
      }));
  } catch {
    return [];
  }
}

export async function GET(req: NextRequest) {
  const appCode = req.nextUrl.searchParams.get('app_code') || 'kanposvncafe';
  try {
    const now = Date.now();
    if (!cache || now - cache.at >= CACHE_MS) {
      cache = { at: now, ...(await loadRelease()) };
    }

     if (!cache.release) {
      // Không có GitHub Release — thử phục vụ từ local public/downloads/
      // (được CI copy binary vào khi build thành công).
      const localFiles = localDownloadAssets(req.nextUrl.origin);
      if (localFiles.length > 0) {
        const data = {
          success: true,
          has_update: true,
          app_code: appCode,
          latest_version: 'latest',
          tag_name: localFiles[0].name,
          name: 'Bản build mới nhất (local)',
          notes: 'Bản build mới nhất đã sẵn sàng tải về.',
          published_at: null,
          prerelease: false,
          download_url: localFiles[0].browser_download_url,
          assets: localFiles,
        };
        return NextResponse.json(data, { headers: corsHeaders() });
      }

      const data = {
        success: false,
        has_update: false,
        message: 'Chưa có bản phát hành nào',
        app_code: appCode,
        latest_version: null,
      };
      return NextResponse.json(data, { headers: corsHeaders() });
    }

    const data = buildPayload(
      cache.release,
      cache.fromNightly,
      appCode,
      req.nextUrl.origin,
    );
    return NextResponse.json(data, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { success: false, has_update: false, message: 'Lỗi: ' + String(e), latest_version: null },
      { headers: corsHeaders() },
    );
  }
}
