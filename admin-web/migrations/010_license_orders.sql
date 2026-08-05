-- Migration 010: License & subscription cho Zalo Mini App + Flutter POS
-- Chay tren Neon Console hoac psql

-- 0. Them cot zalo_id cho bang users (dang ky qua Zalo Mini App)
DO $$ BEGIN
  ALTER TABLE users ADD COLUMN IF NOT EXISTS zalo_id VARCHAR(64) DEFAULT '';
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- 1. Bang orders: don hang thanh toan (dang ky / gia han)
CREATE TABLE IF NOT EXISTS orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_code VARCHAR(32) UNIQUE NOT NULL,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  zalo_id VARCHAR(64) DEFAULT '',
  app_code VARCHAR(100) NOT NULL DEFAULT 'kanposvncafe',
  plan VARCHAR(50) NOT NULL DEFAULT 'monthly',
  amount INTEGER NOT NULL DEFAULT 0,
  currency VARCHAR(10) DEFAULT 'VND',
  status VARCHAR(20) NOT NULL DEFAULT 'pending',
  payment_method VARCHAR(20) DEFAULT 'zalo_miniapp',
  zalo_trans_id VARCHAR(64) DEFAULT '',
  description TEXT DEFAULT '',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  paid_at TIMESTAMP WITH TIME ZONE
);

CREATE INDEX IF NOT EXISTS idx_orders_user ON orders(user_id);
CREATE INDEX IF NOT EXISTS idx_orders_code ON orders(order_code);
CREATE INDEX IF NOT EXISTS idx_orders_status ON orders(status);
CREATE INDEX IF NOT EXISTS idx_orders_zalo ON orders(zalo_id);

-- 2. Bang licenses: gia han theo tung thiet bi / app
CREATE TABLE IF NOT EXISTS licenses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  app_code VARCHAR(100) NOT NULL,
  device_id VARCHAR(255) NOT NULL DEFAULT '',
  plan VARCHAR(50) NOT NULL DEFAULT 'trial',
  status VARCHAR(20) NOT NULL DEFAULT 'active',
  started_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  expires_at TIMESTAMP WITH TIME ZONE,
  last_check_at TIMESTAMP WITH TIME ZONE,
  UNIQUE(user_id, app_code, device_id)
);

CREATE INDEX IF NOT EXISTS idx_licenses_user ON licenses(user_id);
CREATE INDEX IF NOT EXISTS idx_licenses_app ON licenses(app_code);
CREATE INDEX IF NOT EXISTS idx_licenses_device ON licenses(device_id);
