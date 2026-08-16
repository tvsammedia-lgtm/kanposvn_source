import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';
import { resolveCustomer, accessibleWarehouses } from '@/lib/warehouse_scope';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,POST,OPTIONS',
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

// GET /api/owner/warehouses?app_code=kanposvncafe&branch_id=...
// Danh sách KHO theo mô hình: Customer → Branch → Warehouse → Stock.
//   - owner: mọi kho của customer (kể cả kho trung tâm CENTRAL).
//   - nhân viên: kho của chi nhánh được phân quyền.
export async function GET(req: NextRequest) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const appCode = req.nextUrl.searchParams.get('app_code') || '';
  const branchId = req.nextUrl.searchParams.get('branch_id') || '';
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

    const wh = await sql`
      SELECT
        w.id, w.customer_id, w.branch_id, w.warehouse_code, w.warehouse_name,
        w.warehouse_type, w.is_default, w.status, w.created_at,
        b.name AS branch_name, b.branch_code,
        COALESCE(s.product_count, 0)::int AS product_count,
        COALESCE(s.total_quantity, 0)::numeric AS total_quantity
      FROM warehouses w
      LEFT JOIN branches b ON b.id = w.branch_id
      LEFT JOIN (
        SELECT warehouse_id, COUNT(*)::int AS product_count, SUM(quantity) AS total_quantity
        FROM warehouse_stock GROUP BY warehouse_id
      ) s ON s.warehouse_id = w.id
      WHERE w.customer_id = ${customer.id}
        AND (w.branch_id IS NOT NULL OR w.warehouse_type = 'CENTRAL')
        ${branchId ? sql`AND w.branch_id = ${branchId}` : sql``}
        ${scope.all ? sql`` : sql`AND w.id = ANY(${scopedIds})`}
      ORDER BY w.is_default DESC, w.warehouse_type = 'CENTRAL' DESC, w.created_at ASC
    `;

    return NextResponse.json(
      { customer: { id: customer.id, customer_code: customer.customer_code, name: customer.name }, warehouses: wh },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json({ error: 'Loi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}

// POST /api/owner/warehouses
// Body: { app_code, branch_id?, warehouse_name, warehouse_code?, warehouse_type?, is_default? }
//   - warehouse_type = 'CENTRAL' → branch_id để trống (kho trung tâm).
//   - warehouse_type = 'BRANCH' → bắt buộc branch_id.
export async function POST(req: NextRequest) {
  const sql = getSql();
  const user = getUserId(req);
  if (!user) {
    return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401, headers: corsHeaders() });
  }

  const body = await req.json();
  const { app_code, branch_id, warehouse_name, warehouse_code, warehouse_type, is_default } = body;

  if (!app_code) {
    return NextResponse.json({ error: 'Thieu app_code' }, { status: 400, headers: corsHeaders() });
  }
  if (!warehouse_name) {
    return NextResponse.json({ error: 'Ten kho la bat buoc' }, { status: 400, headers: corsHeaders() });
  }
  const type = (warehouse_type || 'BRANCH').toUpperCase();
  if (type !== 'CENTRAL' && type !== 'BRANCH') {
    return NextResponse.json({ error: 'warehouse_type phai la CENTRAL hoac BRANCH' }, { status: 400, headers: corsHeaders() });
  }

  try {
    const customer = await resolveCustomer(sql, user.id, app_code);
    if (!customer) {
      return NextResponse.json({ error: 'Khong tim thay khach hang' }, { status: 404, headers: corsHeaders() });
    }
    const [customerRow] = await sql`SELECT id, owner_user_id FROM customers WHERE id = ${customer.id}`;
    if (String(customerRow.owner_user_id) !== user.id) {
      return NextResponse.json({ error: 'Chi chu doanh nghiep duoc tao kho' }, { status: 403, headers: corsHeaders() });
    }

    if (type === 'CENTRAL') {
      // Kho trung tâm: không thuộc chi nhánh nào (branch_id = NULL), mỗi customer 1 kho.
      const dup = await sql`SELECT id FROM warehouses WHERE customer_id = ${customer.id} AND warehouse_type = 'CENTRAL'`;
      if (dup.length > 0) {
        return NextResponse.json({ error: 'Kho trung tam da ton tai' }, { status: 409, headers: corsHeaders() });
      }
    } else {
      if (!branch_id) {
        return NextResponse.json({ error: 'Kho chi nhanh can branch_id' }, { status: 400, headers: corsHeaders() });
      }
      const [branch] = await sql`SELECT id FROM branches WHERE id = ${branch_id} AND customer_id = ${customer.id}`;
      if (!branch) {
        return NextResponse.json({ error: 'Chi nhanh khong thuoc khach hang nay' }, { status: 400, headers: corsHeaders() });
      }
    }

    const countRows = await sql`SELECT COUNT(*)::int AS n FROM warehouses WHERE customer_id = ${customer.id}`;
    const n = countRows[0]?.n ?? 0;
    const code = warehouse_code || 'W' + String(n + 1).padStart(3, '0');

    const created = await sql`
      INSERT INTO warehouses (customer_id, branch_id, warehouse_code, warehouse_name, warehouse_type, is_default, status)
      VALUES (${customer.id}, ${type === 'CENTRAL' ? null : branch_id}, ${code}, ${warehouse_name}, ${type}, ${
        is_default === true
      }, 'active')
      RETURNING *
    `;

    // Nếu is_default thì bỏ default của các kho khác cùng customer.
    if (is_default === true) {
      await sql`
        UPDATE warehouses SET is_default = false
        WHERE customer_id = ${customer.id} AND id <> ${created[0].id}
      `;
    }

    return NextResponse.json(created[0], { status: 201, headers: corsHeaders() });
  } catch (e) {
    return NextResponse.json({ error: 'Loi server: ' + String(e) }, { status: 500, headers: corsHeaders() });
  }
}
