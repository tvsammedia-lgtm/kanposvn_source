-- Migration 011: Store đăng ký qua Web (admin-web) hoặc Zalo Mini App
-- Mỗi cửa hàng = 1 User + 1 Store + 1 License Trial (30 ngày), không cần tạo app mới.

-- 1. Bang stores: thong tin cua hang
CREATE TABLE IF NOT EXISTS stores (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  owner_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(phone)
);

CREATE INDEX IF NOT EXISTS idx_stores_phone ON stores(phone);
CREATE INDEX IF NOT EXISTS idx_stores_owner ON stores(owner_user_id);

-- 2. Gan store_id cho bang licenses (de truy van nhanh)
ALTER TABLE licenses ADD COLUMN IF NOT EXISTS store_id UUID REFERENCES stores(id);
CREATE INDEX IF NOT EXISTS idx_licenses_store ON licenses(store_id);
