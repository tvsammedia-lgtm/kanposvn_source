import { NextRequest, NextResponse } from 'next/server';

const GITHUB_REPO = process.env.GITHUB_REPO || 'tvsammedia-lgtm/kanposvn_source';
const GITHUB_TOKEN = process.env.GITHUB_TOKEN || '';
let cache: { at: number; release: any; fromNightly: boolean } | null = null;
const CACHE_MS = 60_000;

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

function versionFromNightlyName(name: string): string {
  const m = name.match(/\bv(\d+\.\d+\.\d+)/);
  return m ? m[1] : '';
}

async function loadRelease() {
  const base = `https://api.github.com/repos/${GITHUB_REPO}/releases`;
  // Ưu tiên bản phát hành chính thức (endpoint /latest bỏ qua prerelease).
  let release: any = await fetchRelease(`${base}/latest`);
  let fromNightly = false;
  // Chưa có bản chính thức -> dùng nightly (prerelease) làm bản mới nhất.
  if (!release) {
    release = await fetchRelease(`${base}/tags/nightly`);
    fromNightly = !!release;
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
    ? versionFromNightlyName(release.name || '') || 'nightly'
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

export async function GET(req: NextRequest) {
  const appCode = req.nextUrl.searchParams.get('app_code') || 'kanposvncafe';
  try {
    const now = Date.now();
    if (!cache || now - cache.at >= CACHE_MS) {
      cache = { at: now, ...(await loadRelease()) };
    }

    if (!cache.release) {
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
