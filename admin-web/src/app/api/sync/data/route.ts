import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

export async function GET(req: NextRequest) {
  const sql = getSql();
  const { searchParams } = new URL(req.url);
  const appCode = searchParams.get('appCode');

  try {
    let query = sql`SELECT id, app_code, collection, item_id, updated_at FROM sync_data ORDER BY updated_at DESC LIMIT 100`;
    if (appCode) {
      query = sql`SELECT id, app_code, collection, item_id, updated_at FROM sync_data WHERE app_code = ${appCode} ORDER BY updated_at DESC LIMIT 100`;
    }

    const data = await query;

    return NextResponse.json(data);
  } catch (err) {
    return NextResponse.json(
      { error: 'Internal server error', message: String(err) },
      { status: 500 },
    );
  }
}
