-- Migration 020: Multi-Module Registration + HR Payroll app + CRM admin approval
-- Chạy trên Neon console hoặc psql sau migration 019.

-- 1. Đảm bảo cột show_in_registration / price tồn tại (migration 013 dùng cho apps).
ALTER TABLE apps ADD COLUMN IF NOT EXISTS show_in_registration BOOLEAN NOT NULL DEFAULT true;
ALTER TABLE apps ADD COLUMN IF NOT EXISTS price INTEGER DEFAULT NULL;

-- 2. Seed app kanposvnhrpayroll (HR Payroll) — module mới cho đăng ký nhiều module.
--    Khớp AppModule.kanposvnhrpayroll bên Flutter. Giá 365 ngày mặc định 899000.
INSERT INTO apps (app_code, app_name, description, package_name, platform, show_in_registration, price)
SELECT 'kanposvnhrpayroll', 'HR Payroll', 'Quản lý nhân sự & chấm công - HR Payroll', 'com.kanposvn.hrpayroll', 'flutter', true, 899000
WHERE NOT EXISTS (SELECT 1 FROM apps WHERE app_code = 'kanposvnhrpayroll')
ON CONFLICT (app_code) DO UPDATE SET show_in_registration = true;

-- 3. Đảm bảo mọi app đăng ký được (STORE_MODULES) đều có role_permissions cho từng role
--    (Admin/Manager được sửa - can_edit; Admin được xoá - can_delete; mọi role xem được).
--    Đặc biệt quan trọng cho app mới kanposvnhrpayroll vừa seed ở bước 2.
DO $$
DECLARE
  app_record RECORD;
  role_record RECORD;
BEGIN
  FOR app_record IN
    SELECT id FROM apps
    WHERE show_in_registration = true
       OR app_code IN ('kanposvnhrpayroll', 'kanposvncafe', 'kanposvnnhahangquanan', 'kanposvnnhathuoc', 'kanposvnvlxd', 'kanposvngara', 'kanposvnbida', 'kanposvnspa', 'kanposvnkhachsan', 'kanhot_one', 'kanposvnbanvevantai', 'kanposvnqlcd', 'kanposvnnhatro200', 'kanposvnnbatdongsan', 'nhansu')
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

-- 4. Trạng thái duyệt (admin approval) cho khách hàng đăng ký nhiều module.
--    registration_plan: kế hoạch đăng ký (vd 'free_trial')
--    approval_status:   'pending' (chờ admin duyệt trong kanposvncrm) / 'approved' / 'rejected'
ALTER TABLE customers ADD COLUMN IF NOT EXISTS registration_plan VARCHAR(50) DEFAULT '';
ALTER TABLE customers ADD COLUMN IF NOT EXISTS approval_status VARCHAR(20) DEFAULT 'pending';
ALTER TABLE customers ADD COLUMN IF NOT EXISTS registered_modules TEXT DEFAULT '';
ALTER TABLE customers ADD COLUMN IF NOT EXISTS approved_at TIMESTAMP WITH TIME ZONE;

-- 5. Backfill: khách hàng đăng ký sẵn có coi như đã duyệt.
UPDATE customers SET approval_status = 'approved' WHERE approval_status = 'pending' AND active = true AND approved_at IS NULL;
