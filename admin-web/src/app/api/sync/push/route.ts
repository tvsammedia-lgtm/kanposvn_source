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
    const { appCode, apiKey, items, branchId } = body;

    if (!apiKey || apiKey !== process.env.SYNC_API_KEY) {
      return NextResponse.json(
        { success: false, error: 'Invalid API key' },
        { status: 403, headers: corsHeaders() },
      );
    }

    if (!appCode || !items || !Array.isArray(items)) {
      return NextResponse.json(
        { success: false, error: 'Missing appCode or items' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const syncedIds: string[] = [];

    for (const item of items) {
      const { operationId, collectionName, operationType, payload } = item;

      let parsedPayload: Record<string, unknown>;
      try {
        parsedPayload = typeof payload === 'string' ? JSON.parse(payload) : payload;
      } catch {
        parsedPayload = payload || {};
      }

      const itemId = parsedPayload.itemId as string
        || parsedPayload.id as string
        || operationId;

      // Mô hình 1 module = nhiều chi nhánh: gắn branch vào row để tách dữ liệu theo
      // chi nhánh ở admin. Chuẩn hóa item_id thành "branchId:itemId" để UNIQUE
      // (app_code, collection, item_id) không ghi đè giữa các chi nhánh dùng chung app.
      const branch = branchId ? String(branchId).trim() : null;
      const rowItemId = branch ? `${branch}:${itemId}` : itemId;

      if (operationType === 'DELETE') {
        await sql`
          DELETE FROM sync_data
          WHERE app_code = ${appCode}
            AND collection = ${collectionName}
            AND item_id = ${rowItemId}
        `;
      } else {
        await sql`
          INSERT INTO sync_data (app_code, collection, item_id, data, operation, branch_id, updated_at)
          VALUES (
            ${appCode},
            ${collectionName},
            ${rowItemId},
            ${JSON.stringify(parsedPayload)},
            'UPSERT',
            ${branch},
            NOW()
          )
          ON CONFLICT (app_code, collection, item_id)
          DO UPDATE SET
            data = EXCLUDED.data,
            operation = 'UPSERT',
            branch_id = COALESCE(EXCLUDED.branch_id, sync_data.branch_id),
            updated_at = NOW()
        `;
      }

      syncedIds.push(operationId || itemId);
    }

    await sql`
      INSERT INTO sync_logs (app_code, direction, items_count, status)
      VALUES (${appCode}, 'push', ${items.length}, 'success')
    `;

    return NextResponse.json({
      success: true,
      message: `Đã đồng bộ ${items.length} bản ghi lên Neon DB`,
      syncedIds,
      pulledRecords: [],
      elapsed: Date.now() - start,
    }, { headers: corsHeaders() });
  } catch (err) {
    return NextResponse.json(
      { success: false, error: 'Internal server error', message: String(err) },
      { status: 500, headers: corsHeaders() },
    );
  }
}
