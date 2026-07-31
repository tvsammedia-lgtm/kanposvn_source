-- Migration 008: Sync tables for Flutter <=> Neon DB bi-directional sync
-- Chạy trên Neon Console hoặc psql

-- 1. Bảng sync_data: lưu dữ liệu business đồng bộ từ Flutter
CREATE TABLE IF NOT EXISTS sync_data (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  app_code VARCHAR(100) NOT NULL,
  collection VARCHAR(100) NOT NULL,
  item_id VARCHAR(255) NOT NULL,
  data JSONB NOT NULL DEFAULT '{}',
  operation VARCHAR(20) NOT NULL DEFAULT 'UPSERT',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(app_code, collection, item_id)
);

CREATE INDEX IF NOT EXISTS idx_sync_data_app ON sync_data(app_code);
CREATE INDEX IF NOT EXISTS idx_sync_data_collection ON sync_data(collection);
CREATE INDEX IF NOT EXISTS idx_sync_data_updated ON sync_data(updated_at);
CREATE INDEX IF NOT EXISTS idx_sync_data_app_collection ON sync_data(app_code, collection);

-- 2. Bảng sync_log: audit trail cho mỗi lần đồng bộ
CREATE TABLE IF NOT EXISTS sync_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  app_code VARCHAR(100) NOT NULL,
  direction VARCHAR(10) NOT NULL CHECK (direction IN ('push', 'pull')),
  items_count INTEGER DEFAULT 0,
  status VARCHAR(20) NOT NULL DEFAULT 'success',
  error_message TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_sync_logs_app ON sync_logs(app_code);
CREATE INDEX IF NOT EXISTS idx_sync_logs_created ON sync_logs(created_at);
