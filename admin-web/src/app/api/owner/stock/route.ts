import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { resolveCustomer, accessibleWarehouses } from '@/lib/warehouse_scope';

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

function getUserId(req: NextRequest): { id: string } | null {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try { return verifyToken(auth.split(' ')[1]) as { id: string }; } catch { return null; }
}

// GET /api/owner/stock?app_code=kanposvncafe&warehouse_id=...
// Tồn kho theo TỪNG kho (mô hình Customer → Branch → Warehouse → Stock).
//   - Có warehouse_id: trả tồn của kho đó (kèm thông tin kho).
//   - Không có warehouse_id: trả tồn của MỌI kho user được phép truy cập (kèm tên kho/chi nhánh).
export async function GET(req: NextRequest) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const appCode = req.nextUrl.searchParams.get('app_code') || '';
  const warehouseId = req.nextUrl.searchParams.get('warehouse_id') || '';
  if (!appCode) {
    return NextResponse.json({ error: 'Thieu app_code' }, { status: 400, headers: corsHeaders() });
  }

  try {
    const customer = await resolveCustomer(sql, user.id, appCode);
    if (!customer) {
      return NextResponse.json({ error: 'Khong tim thay khach hang' }, { status: 404, headers: corsHeaders() });
    }
    const scope = await accessibleWarehouses(sql, user.id, customer.id, appCode);
    const scopedIds = scope.all ? null : scope.rows.map(r => r.id);

    const whereClause = warehouseId
      ? sql`ws.warehouse_id = ${warehouseId}`
      : sql`ws.warehouse_id IN (SELECT id FROM warehouses WHERE customer_id = ${customer.id})`;
    const scopeClause = scope.all ? sql`` : sql`AND ws.warehouse_id = ANY(${scopedIds})`;

    const stock = await sql`
      SELECT
        ws.id, ws.warehouse_id, ws.product_id, ws.quantity, ws.min_quantity, ws.max_quantity, ws.updated_at,
        p.product_code, p.name AS product_name, p.unit, p.price,
        w.warehouse_name, w.warehouse_code, w.warehouse_type,
        b.name AS branch_name, b.branch_code
      FROM warehouse_stock ws
      JOIN products p ON p.id = ws.product_id
      JOIN warehouses w ON w.id = ws.warehouse_id
      LEFT JOIN branches b ON b.id = w.branch_id
      WHERE ${whereClause} ${scopeClause}
      ORDER BY w.warehouse_code, p.name ASC
    `;

    // Nếu hỏi theo 1 kho cụ thể, kèm cả sản phẩm chưa có tồn (để dễ nhập kho từ danh mục).
    let products: any[] = [];
    if (warehouseId) {
      const prodRows = await sql`
        SELECT id, product_code, name, unit, price
        FROM products WHERE customer_id = ${customer.id}
        ORDER BY name ASC
      `;
      const inStock = new Set(stock.map((r: any) => r.product_id));
      products = prodRows.filter((p) => !inStock.has(String(p.id)));
    }

    return NextResponse.json({ stock, productsWithNoStock: products }, { headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json({ error: 'Loi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}
