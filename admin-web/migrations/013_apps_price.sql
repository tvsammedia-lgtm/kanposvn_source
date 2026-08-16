-- Migration 013: Giá bán theo từng app_code + tắt gói Vĩnh Viễn
-- Chạy trên Neon Console hoặc psql (hoặc gọi /api/migrate)

-- 1. Giá bán (VND) cho gói 365 ngày của từng app_code.
--    NULL = chưa đặt giá, sẽ dùng giá mặc định của gói (packages).
ALTER TABLE apps ADD COLUMN IF NOT EXISTS price INTEGER DEFAULT NULL;

-- 2. Ngừng bán gói Vĩnh Viễn (forever) — đã có license Vĩnh Viễn không bị ảnh hưởng.
UPDATE packages SET active = false WHERE key = 'forever';
