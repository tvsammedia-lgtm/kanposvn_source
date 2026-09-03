import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ token: string }> }
) {
  try {
    const resolvedParams = await params;
    const token = resolvedParams.token;
    if (!token) {
      return NextResponse.json({ valid: false, reason: 'MISSING_TOKEN' }, { status: 400 });
    }

    const sql = getSql();
    
    // Validate QR token and fetch table info
    const tables = await sql`
      SELECT 
        t.id as table_id,
        t.name as table_name,
        t.app_code,
        t.branch_id,
        t.active,
        b.name as store_name
      FROM dining_tables t
      JOIN branches b ON t.branch_id = b.id
      WHERE t.qr_token = ${token}
      LIMIT 1
    `;

    if (tables.length === 0) {
      return NextResponse.json({ valid: false, reason: 'INVALID_TOKEN' }, { status: 404 });
    }

    const table = tables[0];

    if (!table.active) {
      return NextResponse.json({ valid: false, reason: 'QR_DISABLED' }, { status: 403 });
    }

    return NextResponse.json({
      valid: true,
      app_code: table.app_code,
      branch_id: table.branch_id,
      table_id: table.table_id,
      table_name: table.table_name,
      store_name: table.store_name
    });

  } catch (error: any) {
    console.error('Error validating QR token:', error);
    return NextResponse.json({ valid: false, reason: 'SERVER_ERROR' }, { status: 500 });
  }
}
