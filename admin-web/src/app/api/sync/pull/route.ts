import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

export async function GET(req: NextRequest) {
  const sql = getSql();
  const start = Date.now();

  try {
    const { searchParams } = new URL(req.url);
    const appCode = searchParams.get('appCode');
    const apiKey = searchParams.get('apiKey');
    const collection = searchParams.get('collection');
    const since = searchParams.get('since');

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

    let query = sql`SELECT * FROM sync_data WHERE app_code = ${appCode}`;
    if (collection) {
      query = sql`SELECT * FROM sync_data WHERE app_code = ${appCode} AND collection = ${collection}`;
    }
    if (since) {
      const sinceDate = new Date(since);
      query = sql`SELECT * FROM sync_data WHERE app_code = ${appCode} AND updated_at > ${sinceDate.toISOString()}`;
    }
    if (collection && since) {
      query = sql`SELECT * FROM sync_data WHERE app_code = ${appCode} AND collection = ${collection} AND updated_at > ${since}`;
    }

    const rows = await query;

    const records = (rows as Array<{
      id: string;
      app_code: string;
      collection: string;
      item_id: string;
      data: Record<string, unknown>;
      operation: string;
      updated_at: string;
    }>).map((r) => ({
      id: r.id,
      appCode: r.app_code,
      collection: r.collection,
      itemId: r.item_id,
      data: typeof r.data === 'string' ? JSON.parse(r.data) : r.data,
      operation: r.operation,
      updatedAt: r.updated_at,
    }));

    await sql`
      INSERT INTO sync_logs (app_code, direction, items_count, status)
      VALUES (${appCode}, 'pull', ${records.length}, 'success')
    `;

    return NextResponse.json({
      success: true,
      records,
      count: records.length,
      elapsed: Date.now() - start,
    }, { headers: corsHeaders() });
  } catch (err) {
    return NextResponse.json(
      { success: false, error: 'Internal server error', message: String(err) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
