-- Migration 015: 1 module (app_code) = nhiều chi nhánh (multi-branch per module)
-- Chạy trên Neon Console hoặc psql (hoặc gọi /api/migrate sau khi bổ sung).
-- CHỈ THÊM MỚI / BỎ RÀNG BUỘC CŨ, KHÔNG phá luồng cũ.

-- 1. Bỏ UNIQUE trên branches.app_code: cho phép nhiều chi nhánh dùng chung 1 app_code/module.
--    (index thường idx_branches_app giữ nguyên để truy vấn nhanh.)
ALTER TABLE branches DROP CONSTRAINT IF EXISTS branches_app_code_key;

-- 2. License theo chi nhánh: bỏ UNIQUE(user_id, app_code, device_id) vì 1 user giờ có thể có
--    nhiều license của CÙNG app_code (mỗi chi nhánh 1 license, phân biệt bằng branch_id).
ALTER TABLE licenses DROP CONSTRAINT IF EXISTS licenses_user_id_app_code_device_id_key;

--    a. License CÓ branch_id (mô hình chi nhánh): unique theo (user_id, branch_id, device_id).
CREATE UNIQUE INDEX IF NOT EXISTS idx_licenses_user_branch_device
  ON licenses(user_id, branch_id, device_id) WHERE branch_id IS NOT NULL;

--    b. License KHÔNG có branch_id (cửa hàng đăng ký Web/Zalo cũ): giữ hành vi cũ —
--       unique theo (user_id, app_code, device_id).
CREATE UNIQUE INDEX IF NOT EXISTS idx_licenses_user_app_device_legacy
  ON licenses(user_id, app_code, device_id) WHERE branch_id IS NULL;
