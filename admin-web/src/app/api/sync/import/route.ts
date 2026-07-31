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
    const { appCode, apiKey, collections } = body;

    if (!apiKey || apiKey !== process.env.SYNC_API_KEY) {
      return NextResponse.json(
        { success: false, error: 'Invalid API key' },
        { status: 403, headers: corsHeaders() },
      );
    }

    if (!appCode || !collections || typeof collections !== 'object') {
      return NextResponse.json(
        { success: false, error: 'Missing appCode or collections' },
        { status: 400, headers: corsHeaders() },
      );
    }

    // Replace all data for this app with the imported snapshot
    await sql`DELETE FROM sync_data WHERE app_code = ${appCode}`;

    let count = 0;
    const entries = Object.entries(collections as Record<string, unknown[]>);
    for (const [collection, items] of entries) {
      if (!Array.isArray(items)) continue;
      for (const item of items) {
        const record = (item ?? {}) as Record<string, unknown>;
        const itemId = String(record.itemId ?? record.id ?? '');
        if (!itemId) continue;
        await sql`
          INSERT INTO sync_data (app_code, collection, item_id, data, operation, updated_at)
          VALUES (
            ${appCode},
            ${collection},
            ${itemId},
            ${JSON.stringify(record)},
            'UPSERT',
            NOW()
          )
          ON CONFLICT (app_code, collection, item_id)
          DO UPDATE SET
            data = EXCLUDED.data,
            operation = 'UPSERT',
            updated_at = NOW()
        `;
        count++;
      }
    }

    await sql`
      INSERT INTO sync_logs (app_code, direction, items_count, status)
      VALUES (${appCode}, 'pull', ${count}, 'success')
    `;

    return NextResponse.json(
      {
        success: true,
        message: `Đã import ${count} bản ghi vào Neon DB`,
        count,
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
