import { NextRequest, NextResponse } from 'next/server';

const GITHUB_REPO = process.env.GITHUB_REPO || 'tvsammedia-lgtm/kanposvn_source';
const GITHUB_TOKEN = process.env.GITHUB_TOKEN || '';

function authHeaders(): Record<string, string> {
  const headers: Record<string, string> = {
    'User-Agent': 'kanposvn-update-check',
  };
  if (GITHUB_TOKEN) headers.Authorization = `Bearer ${GITHUB_TOKEN}`;
  return headers;
}

export async function GET(req: NextRequest) {
  const tag = req.nextUrl.searchParams.get('tag') || 'latest';
  const asset = req.nextUrl.searchParams.get('asset') || '';
  if (!asset) {
    return new NextResponse('Missing asset param', { status: 400 });
  }

  try {
    const releaseUrl =
      tag === 'latest'
        ? `https://api.github.com/repos/${GITHUB_REPO}/releases/latest`
        : `https://api.github.com/repos/${GITHUB_REPO}/releases/tags/${encodeURIComponent(
            tag,
          )}`;

    const rel = await fetch(releaseUrl, {
      headers: { ...authHeaders(), Accept: 'application/vnd.github+json' },
      cache: 'no-store',
    });
    if (!rel.ok) {
      return new NextResponse(`Release not found (${rel.status})`, {
        status: 404,
      });
    }

    const release = await rel.json();
    const assetMeta = (release.assets || []).find(
      (a: { name: string }) => a.name === asset,
    );
    if (!assetMeta) {
      return new NextResponse('Asset not found', { status: 404 });
    }

    const rangeHeader = req.headers.get('range');
    const upstream = await fetch(assetMeta.url, {
      headers: {
        ...authHeaders(),
        Accept: 'application/octet-stream',
        ...(rangeHeader ? { Range: rangeHeader } : {}),
      },
      redirect: 'follow',
      cache: 'no-store',
    });
    if (!upstream.ok || !upstream.body) {
      return new NextResponse(`Download failed (${upstream.status})`, {
        status: 502,
      });
    }

    const headers: Record<string, string> = {
      'Content-Type':
        upstream.headers.get('content-type') || 'application/octet-stream',
      'Content-Disposition': `attachment; filename="${asset}"`,
      'Access-Control-Allow-Origin': '*',
      'Cache-Control': 'public, max-age=60',
    };
    const len = upstream.headers.get('content-length');
    if (len) headers['Content-Length'] = len;
    const contentRange = upstream.headers.get('content-range');
    if (contentRange) headers['Content-Range'] = contentRange;
    if (upstream.status === 206) headers['Accept-Ranges'] = 'bytes';

    const status =
      upstream.status === 200 || upstream.status === 206 ? upstream.status : 200;
    return new NextResponse(upstream.body as unknown as BodyInit, {
      status,
      headers,
    });
  } catch (e) {
    return new NextResponse('Download error: ' + String(e), { status: 500 });
  }
}
