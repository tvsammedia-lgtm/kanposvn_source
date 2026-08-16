-- Migration 016: Branch mặc định "Cửa hàng chính" (is_default) khi khách mua app.
-- Chạy trên Neon Console hoặc psql (hoặc gọi /api/migrate sau khi bổ sung).
-- CHỈ THÊM MỚI, KHÔNG phá luồng cũ (khách không bao giờ rơi vào branch_id = null).

-- 1. Đánh dấu chi nhánh mặc định (branch đầu tiên miễn phí của customer).
ALTER TABLE branches ADD COLUMN IF NOT EXISTS is_default BOOLEAN NOT NULL DEFAULT false;

-- 2. Backfill: chi nhánh đầu tiên (theo created_at) của mỗi customer là branch mặc định.
UPDATE branches b
SET is_default = true
WHERE b.id IN (
  SELECT DISTINCT ON (customer_id) id
  FROM branches
  ORDER BY customer_id, created_at ASC, id ASC
)
AND NOT EXISTS (
  SELECT 1 FROM branches x WHERE x.customer_id = b.customer_id AND x.is_default = true
);

CREATE INDEX IF NOT EXISTS idx_branches_default ON branches(customer_id, is_default);
