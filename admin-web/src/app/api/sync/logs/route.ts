import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

export async function GET(req: NextRequest) {
  const sql = getSql();
  const { searchParams } = new URL(req.url);
  const appCode = searchParams.get('appCode');

  try {
    let query = sql`SELECT * FROM sync_logs ORDER BY created_at DESC LIMIT 100`;
    if (appCode) {
      query = sql`SELECT * FROM sync_logs WHERE app_code = ${appCode} ORDER BY created_at DESC LIMIT 100`;
    }

    const logs = await query;

    return NextResponse.json(logs);
  } catch (err) {
    return NextResponse.json(
      { error: 'Internal server error', message: String(err) },
      { status: 500 },
    );
  }
}
