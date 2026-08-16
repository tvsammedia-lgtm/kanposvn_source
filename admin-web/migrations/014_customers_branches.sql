-- Migration 014: Mô hình Khách hàng → Chi nhánh → License (Owner Cloud theo chi nhánh)
-- Chạy trên Neon Console hoặc psql (hoặc gọi /api/migrate sau khi bổ sung).
-- Chỉ THÊM MỚI, KHÔNG đụng bảng/API cũ (users, apps, licenses, stores giữ nguyên).

-- 1. Bảng customers: chủ doanh nghiệp (khách hàng) sở hữu nhiều chi nhánh.
--    owner_user_id = tài khoản login chính của chủ doanh nghiệp (users.id).
CREATE TABLE IF NOT EXISTS customers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_code VARCHAR(32) UNIQUE,
  owner_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL DEFAULT '',
  phone VARCHAR(20) DEFAULT '',
  email VARCHAR(255) DEFAULT '',
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_customers_owner ON customers(owner_user_id);
CREATE INDEX IF NOT EXISTS idx_customers_active ON customers(active);

-- 2. Bảng branches: từng cửa hàng / chi nhánh của khách hàng.
--    name = tên cửa hàng HIỂN THỊ trên POS (khác user.full_name).
--    app_code = license/app của riêng chi nhánh này (1 branch = 1 app_code, UNIQUE).
CREATE TABLE IF NOT EXISTS branches (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
  branch_code VARCHAR(32) DEFAULT '',
  name VARCHAR(255) NOT NULL DEFAULT '',
  phone VARCHAR(20) DEFAULT '',
  address VARCHAR(500) DEFAULT '',
  app_code VARCHAR(100) UNIQUE NOT NULL,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_branches_customer ON branches(customer_id);
CREATE INDEX IF NOT EXISTS idx_branches_app ON branches(app_code);

-- 3. Bảng branch_users: user nào được phép vào chi nhánh nào (phân quyền theo chi nhánh).
CREATE TABLE IF NOT EXISTS branch_users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  role_id UUID REFERENCES roles(id) ON DELETE CASCADE,
  can_login BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(branch_id, user_id)
);

CREATE INDEX IF NOT EXISTS idx_branch_users_branch ON branch_users(branch_id);
CREATE INDEX IF NOT EXISTS idx_branch_users_user ON branch_users(user_id);

-- 4. Gắn branch_id vào license (license theo chi nhánh). Cột cũ giữ nguyên, không phá.
DO $$ BEGIN
  ALTER TABLE licenses ADD COLUMN IF NOT EXISTS branch_id UUID REFERENCES branches(id);
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

CREATE INDEX IF NOT EXISTS idx_licenses_branch ON licenses(branch_id);
