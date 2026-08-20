-- Migration 019: Error logs table for Flutter error logging system
-- Chạy trên Neon Console hoặc psql

CREATE TABLE IF NOT EXISTS error_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  module VARCHAR(100) NOT NULL,
  screen VARCHAR(200) DEFAULT '',
  action VARCHAR(200) DEFAULT '',
  level VARCHAR(20) NOT NULL DEFAULT 'error',
  error_code VARCHAR(50) DEFAULT '',
  message TEXT NOT NULL,
  stack_trace TEXT DEFAULT '',
  device_info TEXT DEFAULT '',
  user_id VARCHAR(255) DEFAULT '',
  user_name VARCHAR(255) DEFAULT '',
  phone VARCHAR(50) DEFAULT '',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  synced_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_error_logs_module ON error_logs(module);
CREATE INDEX IF NOT EXISTS idx_error_logs_level ON error_logs(level);
CREATE INDEX IF NOT EXISTS idx_error_logs_error_code ON error_logs(error_code);
CREATE INDEX IF NOT EXISTS idx_error_logs_created ON error_logs(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_error_logs_user ON error_logs(user_id);
