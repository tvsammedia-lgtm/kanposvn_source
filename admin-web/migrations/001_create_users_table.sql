-- Migration: Create users table for Neon DB
-- Run this on Neon console or psql

CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  full_name VARCHAR(255) DEFAULT '',
  role VARCHAR(50) DEFAULT 'user',
  status VARCHAR(50) DEFAULT 'active',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  last_login TIMESTAMP WITH TIME ZONE,
  shop_name VARCHAR(255) DEFAULT '',
  shop_address VARCHAR(255) DEFAULT '',
  shop_phone VARCHAR(50) DEFAULT '',
  cccd VARCHAR(50) DEFAULT '',
  subscription_plan VARCHAR(50) DEFAULT 'free',
  subscription_start TIMESTAMP WITH TIME ZONE,
  subscription_end TIMESTAMP WITH TIME ZONE
);

CREATE TABLE IF NOT EXISTS apps (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE NOT NULL,
  description TEXT DEFAULT '',
  package_name VARCHAR(255) DEFAULT '',
  app_url VARCHAR(500) DEFAULT '',
  platform VARCHAR(50) DEFAULT 'web',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS user_permissions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  app_name VARCHAR(255) NOT NULL,
  permission_key VARCHAR(255) NOT NULL,
  granted BOOLEAN DEFAULT true,
  UNIQUE(user_id, app_name, permission_key)
);

CREATE TABLE IF NOT EXISTS audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_name VARCHAR(255),
  action VARCHAR(255),
  module VARCHAR(255),
  details TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_apps_slug ON apps(slug);
CREATE INDEX IF NOT EXISTS idx_user_permissions_user_id ON user_permissions(user_id);
CREATE INDEX IF NOT EXISTS idx_user_permissions_app ON user_permissions(user_id, app_name);
CREATE INDEX IF NOT EXISTS idx_audit_logs_created_at ON audit_logs(created_at);

-- Alter existing apps table to add new columns (safe to run multiple times)
DO $$ BEGIN
  ALTER TABLE apps ADD COLUMN IF NOT EXISTS package_name VARCHAR(255) DEFAULT '';
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE apps ADD COLUMN IF NOT EXISTS app_url VARCHAR(500) DEFAULT '';
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE apps ADD COLUMN IF NOT EXISTS platform VARCHAR(50) DEFAULT 'web';
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
