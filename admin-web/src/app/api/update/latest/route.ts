import { NextRequest, NextResponse } from 'next/server';

const GITHUB_REPO = process.env.GITHUB_REPO || 'tvsammedia-lgtm/kanposvn_source';
const GITHUB_TOKEN = process.env.GITHUB_TOKEN || '';
let cache: { at: number; data: unknown } | null = null;
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

export async function GET(req: NextRequest) {
  const appCode = req.nextUrl.searchParams.get('app_code') || 'kanposvncafe';
  try {
    if (cache && Date.now() - cache.at < CACHE_MS) {
      return NextResponse.json(cache.data, { headers: corsHeaders() });
    }

    const headers: Record<string, string> = {
      Accept: 'application/vnd.github+json',
      'User-Agent': 'kanposvn-update-check',
    };
    if (GITHUB_TOKEN) headers.Authorization = `Bearer ${GITHUB_TOKEN}`;

    const ghRes = await fetch(
      `https://api.github.com/repos/${GITHUB_REPO}/releases/latest`,
      { headers, cache: 'no-store' },
    );

    if (!ghRes.ok) {
      const data = {
        success: false,
        has_update: false,
        message: `Chưa có bản phát hành nào (${ghRes.status})`,
        app_code: appCode,
        latest_version: null,
      };
      cache = { at: Date.now(), data };
      return NextResponse.json(data, { headers: corsHeaders() });
    }

    const release = await ghRes.json();
    const assets = (release.assets || []).map((a: { name: string; size: number; download_count?: number; browser_download_url: string }) => ({
      name: a.name,
      size: a.size,
      download_count: a.download_count || 0,
      browser_download_url: a.browser_download_url,
    }));

    const data = {
      success: true,
      has_update: true,
      app_code: appCode,
      latest_version: (release.tag_name || '').replace(/^v/, ''),
      tag_name: release.tag_name || '',
      name: release.name || release.tag_name || '',
      notes: release.body || '',
      published_at: release.published_at || null,
      prerelease: !!release.prerelease,
      download_url:
        assets.find((a: { name: string }) => a.name === 'app-release.apk')?.browser_download_url ||
        assets[0]?.browser_download_url ||
        release.html_url ||
        '',
      assets,
    };
    cache = { at: Date.now(), data };
    return NextResponse.json(data, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json(
      { success: false, has_update: false, message: 'Lỗi: ' + String(e), latest_version: null },
      { headers: corsHeaders() },
    );
  }
}
