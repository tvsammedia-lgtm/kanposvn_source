import { NextResponse } from 'next/server';
import { randomUUID } from 'crypto';
import { getSql } from '@/lib/db';

/**
 * Đăng bộ catalog QR lên web (không login): bàn + mã QR, danh mục, món ăn.
 * Gọi từ Flutter POS (restaurant / cafe) bằng SYNC_API_KEY.
 *
 * Body:
 * {
 *   apiKey, appCode,
 *   branchId?,        // id đã resolve; nếu thiếu hoặc sai → tự resolve theo branchCode/storeId
 *   branchCode?,      // khóa nghiệp vụ của chi nhánh (storeId / module key)
 *   branchName,
 *   tables:  [{ code, name, zone?, capacity? , active? }],
 *   categories: [{ name, sortOrder? }],
 *   items:   [{ code, name, category?, price?, description?, kitchenStation?, imageUrl?, active? }]
 * }
 */

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  };
}

const ALLOWED_STATIONS = ['KITCHEN', 'BAR', 'BAKERY', 'OTHER'];

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { apiKey, appCode } = body;

    if (!apiKey || apiKey !== process.env.SYNC_API_KEY) {
      return NextResponse.json(
        { error: 'Invalid API key' },
        { status: 403, headers: corsHeaders() },
      );
    }
    if (!appCode || typeof appCode !== 'string') {
      return NextResponse.json(
        { error: 'MISSING_APP_CODE' },
        { status: 400, headers: corsHeaders() },
      );
    }

    const sql = getSql();

    // ---------------------------------------------------------------
    // 1. Resolve / tạo branch (app_code + branch_code = branchId UUID)
    // ---------------------------------------------------------------
    let branchId: string | null =
      typeof body.branchId === 'string' && body.branchId.trim() ? body.branchId.trim() : null;
    if (branchId) {
      const br = await sql`SELECT id FROM branches WHERE id = ${branchId} AND app_code = ${appCode} LIMIT 1`;
      if (br.length === 0) branchId = null;
    }

    if (!branchId) {
      const rawCode = String(body.branchCode || '').trim();
      const branchCode = (rawCode || 'CN-' + appCode).slice(0, 32);
      const existing = await sql`
        SELECT id FROM branches
        WHERE app_code = ${appCode} AND branch_code = ${branchCode}
        LIMIT 1
      `;
      if (existing.length > 0) {
        branchId = existing[0].id;
      } else {
        const branchName = String(body.branchName || '').trim().slice(0, 255) || appCode;
        const ins = await sql`
          INSERT INTO branches (branch_code, name, app_code, is_default, active)
          VALUES (${branchCode}, ${branchName}, ${appCode}, false, true)
          RETURNING id
        `;
        branchId = ins[0].id;
      }
    } else {
      const branchName = String(body.branchName || '').trim().slice(0, 255);
      if (branchName) {
        await sql`UPDATE branches SET name = ${branchName} WHERE id = ${branchId}`;
      }
    }

    const base = new URL(request.url).origin;

    // ---------------------------------------------------------------
    // 2. Bàn + QR token (theo app_code + branch_id + code, giữ token cũ)
    // ---------------------------------------------------------------
    const tablesOut: { code: string; id: string; name: string; qrToken: string; url: string }[] = [];
    for (const t of Array.isArray(body.tables) ? body.tables : []) {
      const code = String(t.code || '').trim().slice(0, 50);
      if (!code) continue;
      const name = String(t.name || code).slice(0, 100);
      const zone = String(t.zone || t.area || t.areaName || '').trim().slice(0, 100);
      const capacity = Number(t.capacity) || 4;
      const active = t.active === false ? false : true;

      const ex = await sql`
        SELECT id, qr_token FROM dining_tables
        WHERE app_code = ${appCode} AND branch_id = ${branchId} AND code = ${code}
        LIMIT 1
      `;
      if (ex.length > 0) {
        await sql`
          UPDATE dining_tables
          SET name = ${name}, area_name = ${zone}, capacity = ${capacity},
              active = ${active}, updated_at = NOW()
          WHERE id = ${ex[0].id}
        `;
        tablesOut.push({ code, id: String(ex[0].id), name, qrToken: String(ex[0].qr_token), url: `${base}/o/${ex[0].qr_token}` });
      } else {
        const token = randomUUID();
        const ins = await sql`
          INSERT INTO dining_tables (app_code, branch_id, code, name, area_name, capacity, active, qr_token)
          VALUES (${appCode}, ${branchId}, ${code}, ${name}, ${zone}, ${capacity}, ${active}, ${token})
          RETURNING id, qr_token
        `;
        tablesOut.push({ code, id: String(ins[0].id), name, qrToken: String(ins[0].qr_token), url: `${base}/o/${ins[0].qr_token}` });
      }
    }

    // ---------------------------------------------------------------
    // 3. Danh mục (theo app_code + branch_id + name)
    // ---------------------------------------------------------------
    const catIdByName: Record<string, string> = {};
    for (const c of Array.isArray(body.categories) ? body.categories : []) {
      const name = String(c.name || '').trim().slice(0, 255);
      if (!name) continue;
      const sortOrder = Number(c.sortOrder) || 0;
      const ex = await sql`
        SELECT id FROM menu_categories
        WHERE app_code = ${appCode} AND branch_id = ${branchId} AND name = ${name}
        LIMIT 1
      `;
      if (ex.length > 0) {
        await sql`
          UPDATE menu_categories
          SET sort_order = ${sortOrder}, active = true, updated_at = NOW()
          WHERE id = ${ex[0].id}
        `;
        catIdByName[name] = String(ex[0].id);
      } else {
        const ins = await sql`
          INSERT INTO menu_categories (app_code, branch_id, name, sort_order, active)
          VALUES (${appCode}, ${branchId}, ${name}, ${sortOrder}, true)
          RETURNING id
        `;
        catIdByName[name] = String(ins[0].id);
      }
    }

    // ---------------------------------------------------------------
    // 4. Món (theo app_code + branch_id + code, allow_qr_order theo active)
    // ---------------------------------------------------------------
    let itemCount = 0;
    for (const it of Array.isArray(body.items) ? body.items : []) {
      const name = String(it.name || '').trim().slice(0, 255);
      if (!name) continue;
      const code = String(it.code || it.itemId || name).trim().slice(0, 100);
      const catId = it.category ? (catIdByName[String(it.category)] ?? null) : null;
      const price = Number(it.price) || 0;
      let station = String(it.kitchenStation || it.kitchen_station || 'KITCHEN').trim().toUpperCase();
      if (!ALLOWED_STATIONS.includes(station)) station = 'KITCHEN';
      const description = String(it.description || '').slice(0, 1000);
      const imageUrl = String(it.imageUrl || '').trim().slice(0, 500);
      const active = it.active === false ? false : true;
      const allowQrOrder =
        typeof it.allowQrOrder === 'boolean' ? it.allowQrOrder : active;

      const ex = await sql`
        SELECT id FROM menu_items
        WHERE app_code = ${appCode} AND branch_id = ${branchId} AND code = ${code}
        LIMIT 1
      `;
      if (ex.length > 0) {
        await sql`
          UPDATE menu_items
          SET name = ${name}, category_id = ${catId}, price = ${price},
              description = ${description}, image_url = ${imageUrl || null},
              kitchen_station = ${station}, active = ${active},
              allow_qr_order = ${allowQrOrder}, updated_at = NOW()
          WHERE id = ${ex[0].id}
        `;
      } else {
        await sql`
          INSERT INTO menu_items
            (app_code, branch_id, category_id, code, name, description, image_url,
             price, kitchen_station, active, allow_qr_order)
          VALUES
            (${appCode}, ${branchId}, ${catId}, ${code}, ${name}, ${description}, ${imageUrl || null},
             ${price}, ${station}, ${active}, ${allowQrOrder})
        `;
      }
      itemCount++;
    }

    return NextResponse.json({
      success: true,
      branchId,
      branchName: String(body.branchName || '').slice(0, 255),
      tableCount: tablesOut.length,
      categoryCount: Object.keys(catIdByName).length,
      itemCount,
      tables: tablesOut,
    }, { headers: corsHeaders() });
  } catch (error: any) {
    console.error('Error publishing QR catalog:', error);
    return NextResponse.json(
      { error: 'SERVER_ERROR', message: String(error) },
      { status: 500, headers: corsHeaders() },
    );
  }
}