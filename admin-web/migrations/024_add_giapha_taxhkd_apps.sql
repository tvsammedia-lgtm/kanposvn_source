-- Migration 024: Add kanposvngiapha + kanposvntaxhkd apps (new modules)
-- Chạy trên Neon console hoặc psql sau migration 023.

-- 1. Seed app kanposvngiapha (Gia Phả / Family Tree)
--    Khớp AppModule.kanposvngiapha bên Flutter.
INSERT INTO apps (app_code, app_name, description, package_name, platform, show_in_registration, price)
SELECT 'kanposvngiapha', 'KanPosVN Gia Phả', 'Quản lý gia phả, dòng họ, cây phả hệ', 'com.kanposvn.giapha', 'flutter', true, 499000
WHERE NOT EXISTS (SELECT 1 FROM apps WHERE app_code = 'kanposvngiapha')
ON CONFLICT (app_code) DO UPDATE SET show_in_registration = true;

-- 2. Seed app kanposvntaxhkd (Thuế Hộ Kinh Doanh)
--    Khớp AppModule.kanposvntaxhkd bên Flutter.
INSERT INTO apps (app_code, app_name, description, package_name, platform, show_in_registration, price)
SELECT 'kanposvntaxhkd', 'KanPosVN Thuế HKD', 'Quản lý thuế hộ kinh doanh, tờ khai, hóa đơn điện tử', 'com.kanposvn.taxhkd', 'flutter', true, 699000
WHERE NOT EXISTS (SELECT 1 FROM apps WHERE app_code = 'kanposvntaxhkd')
ON CONFLICT (app_code) DO UPDATE SET show_in_registration = true;

-- 3. Seed role_permissions cho cả 2 app mới (Admin/Manager sửa - can_edit;
--    Admin xoá - can_delete; mọi role xem được).
DO $$
DECLARE
  app_record RECORD;
  role_record RECORD;
BEGIN
  FOR app_record IN
    SELECT id FROM apps
    WHERE app_code IN ('kanposvngiapha', 'kanposvntaxhkd')
  LOOP
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