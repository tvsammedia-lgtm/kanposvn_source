import { getSql } from '@/lib/db';

type SqlFn = ReturnType<typeof getSql>;

// Migration 017 — Kho mặc định theo chi nhánh:
// Mỗi chi nhánh được tự cấp 1 Kho mặc định "Kho chính" (BRANCH, is_default = true).
// Mô hình: Customer → Branch → Warehouse → Stock.
//   - Warehouse là thực thể độc lập thuộc Customer; kho trung tâm có branch_id = NULL (CENTRAL).
//   - 1 chi nhánh có thể có NHIỀU kho (Kho bán hàng, Kho hàng hóa, Kho phụ...).
//   - MỌI thay đổi tồn kho đều qua stock_transactions / phiếu chuyển kho, không sửa trực tiếp.
export async function ensureDefaultWarehouse(
  sql: SqlFn,
  opts: { customerId: string; branchId: string; branchName?: string },
): Promise<string> {
  const { customerId, branchId, branchName } = opts;

  // 1. Tìm kho mặc định của chi nhánh (ưu tiên kho có is_default).
  const rows = await sql`
    SELECT * FROM warehouses
    WHERE branch_id = ${branchId}
    ORDER BY is_default DESC, created_at ASC LIMIT 1
  `;
  let warehouse = rows[0];
  if (warehouse) return String(warehouse.id);

  // 2. Chưa có → tạo "Kho chính" với mã tuần tự W001, W002... theo customer.
  const countRows = await sql`
    SELECT COUNT(*)::int AS n FROM warehouses WHERE customer_id = ${customerId}
  `;
  const n = countRows[0]?.n ?? 0;
  const warehouseCode = 'W' + String(n + 1).padStart(3, '0');
  const warehouseName = (branchName || 'Cửa hàng') + ' - Kho chính';

  const created = await sql`
    INSERT INTO warehouses (customer_id, branch_id, warehouse_code, warehouse_name, warehouse_type, is_default, status)
    VALUES (${customerId}, ${branchId}, ${warehouseCode}, ${warehouseName}, 'BRANCH', true, 'active')
    RETURNING *
  `;
  return String(created[0]?.id ?? '');
}
