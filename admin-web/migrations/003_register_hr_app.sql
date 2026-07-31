-- Migration: Register kannhansuhrpayroll app in apps table
-- Run this on Neon console or psql

INSERT INTO apps (id, name, slug, description, package_name, app_url, platform)
VALUES (
  gen_random_uuid(),
  'Nhan su - Tien luong',
  'kannhansuhrpayroll',
  'Ung dung quan ly nhan su, tai xe, chuyen xe, cham cong va tinh luong',
  'com.example.kannhansuhrpayroll',
  '',
  'flutter'
)
ON CONFLICT (slug) DO UPDATE SET
  package_name = EXCLUDED.package_name,
  platform = EXCLUDED.platform;
