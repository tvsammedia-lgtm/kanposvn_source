-- Migration 009: Add kanposvncafe app + seed user admin@kanposvncafe.com
-- Chạy trên Neon Console hoặc psql
-- Password mặc định: admin123 (đặt qua seed API hoặc /api/set-admin sau khi chạy migration)

-- 1. Thêm app kanposvncafe
INSERT INTO apps (app_code, app_name, description, package_name, platform) VALUES
  ('kanposvncafe', 'KanPosVN Cafe (Isar+Neon)', 'Quản lý quán cafe - phiên bản Isar+Neon', '', 'flutter')
ON CONFLICT (app_code) DO NOTHING;

-- 2. Seed role_permissions cho kanposvncafe
DO $$
DECLARE
  app_record RECORD;
  role_record RECORD;
BEGIN
  FOR app_record IN SELECT id FROM apps WHERE app_code IN ('kanposvncafe') LOOP
    FOR role_record IN SELECT id, role_name FROM roles LOOP
      INSERT INTO role_permissions (app_id, role_id, can_view, can_edit, can_delete)
      VALUES (
        app_record.id,
        role_record.id,
        true,
        CASE WHEN role_record.role_name IN ('Admin', 'Manager') THEN true ELSE false END,
        CASE WHEN role_record.role_name = 'Admin' THEN true ELSE false END
      )
      ON CONFLICT (app_id, role_id) DO NOTHING;
    END LOOP;
  END LOOP;
END $$;
