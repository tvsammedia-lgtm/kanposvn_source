-- Migration: Add birth_year and phone to users
DO $$ BEGIN
  ALTER TABLE users ADD COLUMN IF NOT EXISTS birth_year INTEGER DEFAULT NULL;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE users ADD COLUMN IF NOT EXISTS phone VARCHAR(20) DEFAULT '';
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
