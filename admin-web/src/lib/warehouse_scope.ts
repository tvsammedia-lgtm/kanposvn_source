import { getSql } from '@/lib/db';

type SqlFn = ReturnType<typeof getSql>;

// Migration 017 — Phạm vi kho theo mô hình Customer → Branch → Warehouse:
// app_code CHỈ quyết định khách được phép dùng KanPosVN tại chi nhánh nào,
// KHÔNG quyết định kho. Kho thuộc Customer; kho chi nhánh có branch_id, kho trung
// tâm có branch_id = NULL (CENTRAL). 1 chi nhánh có thể có nhiều kho.
export async function resolveCustomer(
  sql: SqlFn,
  userId: string,
  appCode: string,
): Promise<{ id: string; customer_code?: string; name?: string } | undefined> {
  const rows = await sql`
    SELECT c.id, c.customer_code, c.name
    FROM customers c
    JOIN branches b ON b.customer_id = c.id
    WHERE b.app_code = ${appCode} AND b.active = true
      AND (
        c.owner_user_id = ${userId}
        OR EXISTS (
          SELECT 1 FROM branch_users bu
          WHERE bu.branch_id = b.id AND bu.user_id = ${userId} AND bu.can_login = true
        )
      )
    ORDER BY c.created_at ASC LIMIT 1
  `;
  return rows[0] as { id: string; customer_code?: string; name?: string } | undefined;
}

// Chủ doanh nghiệp: thấy MỌI kho của customer (kể cả kho trung tâm).
// Nhân viên: chỉ thấy kho của chi nhánh được phân quyền (branch_users).
export async function accessibleWarehouses(
  sql: SqlFn,
  userId: string,
  customerId: string,
  appCode: string,
): Promise<{ all: boolean; rows: { id: string }[] }> {
  const ownerRows = await sql`
    SELECT 1 FROM customers WHERE id = ${customerId} AND owner_user_id = ${userId}
  `;
  if (ownerRows.length > 0) {
    return { all: true, rows: [] };
  }
  const rows = await sql`
    SELECT DISTINCT w.id
    FROM warehouses w
    JOIN branches b ON b.id = w.branch_id
    JOIN branch_users bu ON bu.branch_id = b.id AND bu.user_id = ${userId} AND bu.can_login = true
    WHERE w.customer_id = ${customerId} AND b.app_code = ${appCode} AND w.status = 'active'
  `;
  return { all: false, rows: rows as { id: string }[] };
}

// Verify user có quyền trên một kho cụ thể.
export async function canAccessWarehouse(
  sql: SqlFn,
  userId: string,
  customerId: string,
  warehouseId: string,
): Promise<boolean> {
  const ownerRows = await sql`
    SELECT 1 FROM customers WHERE id = ${customerId} AND owner_user_id = ${userId}
  `;
  if (ownerRows.length > 0) return true;
  const rows = await sql`
    SELECT 1
    FROM warehouses w
    JOIN branches b ON b.id = w.branch_id
    JOIN branch_users bu ON bu.branch_id = b.id AND bu.user_id = ${userId} AND bu.can_login = true
    WHERE w.id = ${warehouseId} AND w.customer_id = ${customerId}
  `;
  return rows.length > 0;
}
