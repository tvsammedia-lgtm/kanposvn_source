-- IAM Migration: Tạo lại schema theo mô hình Identity & Access Management
-- Chạy trên Neon console hoặc psql

-- 1. Bảng users (đơn giản hóa)
CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  full_name VARCHAR(255) DEFAULT '',
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Bảng apps (liệt kê các ứng dụng)
CREATE TABLE IF NOT EXISTS apps (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  app_code VARCHAR(100) UNIQUE NOT NULL,
  app_name VARCHAR(255) NOT NULL,
  description TEXT DEFAULT '',
  package_name VARCHAR(255) DEFAULT '',
  app_url VARCHAR(500) DEFAULT '',
  platform VARCHAR(50) DEFAULT 'flutter',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Bảng roles (các vai trò)
CREATE TABLE IF NOT EXISTS roles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  role_name VARCHAR(100) UNIQUE NOT NULL
);

-- 4. Bảng user_permissions (bảng quan trọng nhất)
CREATE TABLE IF NOT EXISTS user_permissions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  app_id UUID REFERENCES apps(id) ON DELETE CASCADE,
  role_id UUID REFERENCES roles(id) ON DELETE CASCADE,
  can_login BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id, app_id)
);

-- 5. Bảng audit_logs
CREATE TABLE IF NOT EXISTS audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_name VARCHAR(255),
  action VARCHAR(255),
  module VARCHAR(255),
  details TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_apps_app_code ON apps(app_code);
CREATE INDEX IF NOT EXISTS idx_roles_role_name ON roles(role_name);
CREATE INDEX IF NOT EXISTS idx_user_permissions_user_id ON user_permissions(user_id);
CREATE INDEX IF NOT EXISTS idx_user_permissions_app_id ON user_permissions(app_id);
CREATE INDEX IF NOT EXISTS idx_user_permissions_lookup ON user_permissions(user_id, app_id);
CREATE INDEX IF NOT EXISTS idx_audit_logs_created_at ON audit_logs(created_at);

-- Seed roles
INSERT INTO roles (id, role_name) VALUES
  (gen_random_uuid(), 'Admin'),
  (gen_random_uuid(), 'Manager'),
  (gen_random_uuid(), 'Staff'),
  (gen_random_uuid(), 'User'),
  (gen_random_uuid(), 'HR Manager'),
  (gen_random_uuid(), 'Employee')
ON CONFLICT (role_name) DO NOTHING;

-- Seed apps
INSERT INTO apps (id, app_code, app_name, description, package_name, platform)
VALUES
  (gen_random_uuid(), 'kannhathuoc', 'Kho Nha Thuoc', 'Ung dung quan ly kho thuoc', '', 'flutter'),
  (gen_random_uuid(), 'kannhansuhrpayroll', 'HR Payroll', 'Ung dung quan ly nhan su va tien luong', 'com.example.kannhansuhrpayroll', 'flutter')
ON CONFLICT (app_code) DO NOTHING;
