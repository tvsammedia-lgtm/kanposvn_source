-- Migration 012: Dem so lan gia han free 7 ngay cho user
-- Chay tren Neon Console hoac psql

DO $$ BEGIN
  ALTER TABLE users ADD COLUMN IF NOT EXISTS free_renewal_count INTEGER NOT NULL DEFAULT 0;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
