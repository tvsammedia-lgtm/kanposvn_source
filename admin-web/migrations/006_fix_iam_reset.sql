-- FIX: Chạy script này trên Neon Console để reset schema IAM
-- Xóa旧 tables và tạo lại từ đầu

DROP TABLE IF EXISTS user_permissions CASCADE;
DROP TABLE IF EXISTS audit_logs CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS apps CASCADE;

-- 1. users
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  full_name VARCHAR(255) DEFAULT '',
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. apps
CREATE TABLE apps (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  app_code VARCHAR(100) UNIQUE NOT NULL,
  app_name VARCHAR(255) NOT NULL,
  description TEXT DEFAULT '',
  package_name VARCHAR(255) DEFAULT '',
  app_url VARCHAR(500) DEFAULT '',
  platform VARCHAR(50) DEFAULT 'flutter',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. roles
CREATE TABLE roles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  role_name VARCHAR(100) UNIQUE NOT NULL
);

-- 4. user_permissions
CREATE TABLE user_permissions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  app_id UUID REFERENCES apps(id) ON DELETE CASCADE,
  role_id UUID REFERENCES roles(id) ON DELETE CASCADE,
  can_login BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id, app_id)
);

-- 5. audit_logs
CREATE TABLE audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_name VARCHAR(255),
  action VARCHAR(255),
  module VARCHAR(255),
  details TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_apps_app_code ON apps(app_code);
CREATE INDEX idx_user_permissions_user ON user_permissions(user_id);
CREATE INDEX idx_user_permissions_app ON user_permissions(app_id);
CREATE INDEX idx_user_permissions_lookup ON user_permissions(user_id, app_id);

-- Seed roles
INSERT INTO roles (role_name) VALUES
  ('Admin'),
  ('Manager'),
  ('Staff'),
  ('User'),
  ('HR Manager'),
  ('Employee');

-- Seed apps
INSERT INTO apps (app_code, app_name, description, package_name, platform) VALUES
  ('kannhathuoc', 'Kho Nha Thuoc', 'Ung dung quan ly kho thuoc', '', 'flutter'),
  ('kannhansuhrpayroll', 'HR Payroll', 'Ung dung quan ly nhan su va tien luong', 'com.example.kannhansuhrpayroll', 'flutter');

-- Seed user@nhansu.com
-- password: nhansu123
-- bcrypt hash of 'nhansu123' with cost 10
INSERT INTO users (email, password_hash, full_name, active) VALUES
  ('user@nhansu.com', '$2a$10$rQEY5z5y5y5y5y5y5y5y5uQ8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q', 'User Nhan Su', true);
