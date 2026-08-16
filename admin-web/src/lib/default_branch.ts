import { getSql } from '@/lib/db';

type SqlFn = ReturnType<typeof getSql>;

// Migration 016 — Branch mặc định "Cửa hàng chính":
// Khách mua app chưa có chi nhánh → hệ thống tự cấp 1 Branch mặc định miễn phí
// thuộc license đầu tiên. Khách KHÔNG BAO GIỜ rơi vào trạng thái license.branch_id = null.
//
// Quy tắc:
//   - customer: nếu user chưa có customer nào thì tự tạo 1 customer (C###).
//   - branch: với (customer, app_code) chưa có branch thì tạo branch "Cửa hàng chính",
//     branch_code = B### (B001, B002...), is_default = true nếu là branch đầu tiên.
//   - license: gắn branch_id vừa tạo/tìm được vào license.
export async function ensureDefaultBranch(
  sql: SqlFn,
  opts: { userId: string; appCode: string; licenseId: string },
): Promise<string> {
  const { userId, appCode, licenseId } = opts;

  // 1. User (lấy tên cho customer nếu cần tạo mới).
  const userRows = await sql`SELECT * FROM users WHERE id = ${userId}`;
  const user = userRows[0];

  // 2. Tìm customer sở hữu bởi user (chỉ 1 customer chính).
  let custRows = await sql`
    SELECT * FROM customers WHERE owner_user_id = ${userId} ORDER BY created_at ASC LIMIT 1
  `;
  let customer = custRows[0];
  if (!customer) {
    const code = 'C' + String(Date.now()).slice(-6);
    const name = user?.full_name || user?.shop_name || user?.phone || 'Khách hàng';
    const created = await sql`
      INSERT INTO customers (customer_code, owner_user_id, name, phone)
      VALUES (${code}, ${userId}, ${name}, ${user?.phone || ''})
      RETURNING *
    `;
    customer = created[0];
  }

  // 3. Tìm branch cho (customer, app_code); chưa có thì tạo "Cửa hàng chính".
  let branchRows = await sql`
    SELECT * FROM branches
    WHERE customer_id = ${customer.id} AND app_code = ${appCode}
    ORDER BY created_at ASC LIMIT 1
  `;
  let branch = branchRows[0];
  if (!branch) {
    const countRows = await sql`
      SELECT COUNT(*)::int AS n FROM branches WHERE customer_id = ${customer.id}
    `;
    const n = countRows[0]?.n ?? 0;
    const branchCode = 'B' + String(n + 1).padStart(3, '0');
    const created = await sql`
      INSERT INTO branches (customer_id, branch_code, name, app_code, is_default)
      VALUES (${customer.id}, ${branchCode}, 'Cửa hàng chính', ${appCode}, ${n === 0})
      RETURNING *
    `;
    branch = created[0];
  }

  // 4. Gắn license đầu tiên vào branch (không bao giờ để branch_id = null).
  if (branch && licenseId) {
    await sql`
      UPDATE licenses SET branch_id = ${branch.id} WHERE id = ${licenseId}
    `;
  }

  return branch?.id ?? '';
}
