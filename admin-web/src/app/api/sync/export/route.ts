import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

export async function POST(req: NextRequest) {
  const sql = getSql();
  const start = Date.now();

  try {
    const body = await req.json();
    const { appCode, apiKey } = body;

    if (!apiKey || apiKey !== process.env.SYNC_API_KEY) {
      return NextResponse.json(
        { success: false, error: 'Invalid API key' },
        { status: 403, headers: corsHeaders() },
      );
    }

    if (!appCode) {
      return NextResponse.json(
        { success: false, error: 'Missing appCode' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const rows = (await sql`
      SELECT collection, item_id, data, updated_at
      FROM sync_data
      WHERE app_code = ${appCode}
      ORDER BY collection, item_id
    `) as Array<{
      collection: string;
      item_id: string;
      data: Record<string, unknown>;
      updated_at: string;
    }>;

    const collections: Record<string, Array<Record<string, unknown>>> = {};
    for (const r of rows) {
      if (!collections[r.collection]) collections[r.collection] = [];
      const data = typeof r.data === 'string' ? JSON.parse(r.data) : r.data;
      collections[r.collection].push({ ...data, id: r.item_id });
    }

    return NextResponse.json(
      {
        success: true,
        app: 'kanposvncafe',
        appCode,
        exportDate: new Date().toISOString(),
        version: 1,
        collections,
        count: rows.length,
        elapsed: Date.now() - start,
      },
      { headers: corsHeaders() },
    );
  } catch (err) {
    return NextResponse.json(
      { success: false, error: 'Internal server error', message: String(err) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
