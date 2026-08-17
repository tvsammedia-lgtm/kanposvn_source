-- Migration 018: ZaloPay integration + license improvements
-- Adds ZaloPay-specific columns to orders table

-- Thêm cột ZaloPay vào orders (nếu chưa có)
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'orders' AND column_name = 'zalopay_app_trans_id') THEN
    ALTER TABLE orders ADD COLUMN zalopay_app_trans_id VARCHAR(64) DEFAULT '';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'orders' AND column_name = 'callback_url') THEN
    ALTER TABLE orders ADD COLUMN callback_url VARCHAR(500) DEFAULT '';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'orders' AND column_name = 'provider') THEN
    ALTER TABLE orders ADD COLUMN provider VARCHAR(50) DEFAULT 'zalopay';
  END IF;
END $$;

-- Index cho orders
CREATE INDEX IF NOT EXISTS idx_orders_user_id ON orders(user_id);
CREATE INDEX IF NOT EXISTS idx_orders_status ON orders(status);
CREATE INDEX IF NOT EXISTS idx_orders_zalopay_app_trans_id ON orders(zalopay_app_trans_id);
