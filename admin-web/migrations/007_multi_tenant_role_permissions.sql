-- Migration 007: Multi-Tenant + Role Permissions
-- Chạy trên Neon Console hoặc psql

-- 1. Tạo bảng role_permissions (thiếu trong migration cũ)
CREATE TABLE IF NOT EXISTS role_permissions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  app_id UUID REFERENCES apps(id) ON DELETE CASCADE,
  role_id UUID REFERENCES roles(id) ON DELETE CASCADE,
  can_view BOOLEAN DEFAULT true,
  can_edit BOOLEAN DEFAULT false,
  can_delete BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(app_id, role_id)
);

CREATE INDEX IF NOT EXISTS idx_role_permissions_app ON role_permissions(app_id);
CREATE INDEX IF NOT EXISTS idx_role_permissions_role ON role_permissions(role_id);

-- 2. Seed 4 app mới (multi-tenant)
INSERT INTO apps (app_code, app_name, description, package_name, platform) VALUES
  ('kannhathuoc_A', 'Nhà Thuốc A', 'Quản lý kho thuốc - Chi nhánh A', '', 'flutter'),
  ('kannhathuoc_B', 'Nhà Thuốc B', 'Quản lý kho thuốc - Chi nhánh B', '', 'flutter'),
  ('kannhansuD', 'Nhân Sự D', 'Quản lý nhân sự - Công ty D', '', 'flutter'),
  ('kanvlxd_A', 'VLXD A', 'Quản lý vật liệu xây dựng - Cửa hàng A', '', 'flutter')
ON CONFLICT (app_code) DO NOTHING;

-- 3. Seed role_permissions cho tất cả apps
-- Lấy app_id và role_id tự động
DO $$
DECLARE
  app_record RECORD;
  role_record RECORD;
BEGIN
  FOR app_record IN SELECT id FROM apps WHERE app_code IN (
    'kannhathuoc', 'kannhathuoc_A', 'kannhathuoc_B',
    'kannhansuhrpayroll', 'kannhansuD',
    'kanvlxd', 'kanvlxd_A',
    'kancafetrasua'
  ) LOOP
    FOR role_record IN SELECT id, role_name FROM roles LOOP
      INSERT INTO role_permissions (app_id, role_id, can_view, can_edit, can_delete)
      VALUES (
        app_record.id,
        role_record.id,
        true,  -- can_view: tất cả role đều xem được
        CASE WHEN role_record.role_name IN ('Admin', 'Manager') THEN true ELSE false END,
        CASE WHEN role_record.role_name = 'Admin' THEN true ELSE false END
      )
      ON CONFLICT (app_id, role_id) DO NOTHING;
    END LOOP;
  END LOOP;
END $$;

-- 4. Verify
SELECT a.app_code, r.role_name, rp.can_view, rp.can_edit, rp.can_delete
FROM role_permissions rp
JOIN apps a ON a.id = rp.app_id
JOIN roles r ON r.id = rp.role_id
ORDER BY a.app_code, r.role_name;
