import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { STORE_MODULES } from '@/lib/pricing';

const SEED_SECRET = process.env.SEED_SECRET || 'kanposvn_seed_2026';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 200, headers: corsHeaders() });
}

function tsa(str: string): TemplateStringsArray {
  const a = [str] as unknown as TemplateStringsArray;
  (a as any).raw = [str];
  return a;
}

export async function POST(req: NextRequest) {
  const { secret } = await req.json();
  if (secret !== SEED_SECRET) {
    return NextResponse.json({ error: 'Sai secret key' }, { status: 403, headers: corsHeaders() });
  }

  const sql = getSql();
  const results: string[] = [];

  const migrations: [string, string][] = [
    ['role', "ALTER TABLE users ADD COLUMN IF NOT EXISTS role VARCHAR(50) DEFAULT 'user'"],
    ['birth_year', 'ALTER TABLE users ADD COLUMN IF NOT EXISTS birth_year INTEGER DEFAULT NULL'],
    ['phone', "ALTER TABLE users ADD COLUMN IF NOT EXISTS phone VARCHAR(20) DEFAULT ''"],
    ['cccd', "ALTER TABLE users ADD COLUMN IF NOT EXISTS cccd VARCHAR(50) DEFAULT ''"],
    ['subscription_plan', "ALTER TABLE users ADD COLUMN IF NOT EXISTS subscription_plan VARCHAR(50) DEFAULT ''"],
    ['subscription_start', 'ALTER TABLE users ADD COLUMN IF NOT EXISTS subscription_start TIMESTAMP WITH TIME ZONE'],
    ['subscription_end', 'ALTER TABLE users ADD COLUMN IF NOT EXISTS subscription_end TIMESTAMP WITH TIME ZONE'],
    ['zalo_id', "ALTER TABLE users ADD COLUMN IF NOT EXISTS zalo_id VARCHAR(64) DEFAULT ''"],
    ['orders_table', `CREATE TABLE IF NOT EXISTS orders (
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
    )`],
    ['licenses_table', `CREATE TABLE IF NOT EXISTS licenses (
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
    )`],
    ['orders_bank_columns', 'ALTER TABLE orders ADD COLUMN IF NOT EXISTS bank_code VARCHAR(20) DEFAULT \'\''],
    ['orders_bank_account_id', 'ALTER TABLE orders ADD COLUMN IF NOT EXISTS bank_account_id UUID DEFAULT NULL'],
    ['orders_confirm_note', 'ALTER TABLE orders ADD COLUMN IF NOT EXISTS confirm_note TEXT DEFAULT \'\''],
    ['orders_index_user', 'CREATE INDEX IF NOT EXISTS idx_orders_user ON orders(user_id)'],
    ['orders_index_code', 'CREATE INDEX IF NOT EXISTS idx_orders_code ON orders(order_code)'],
    ['licenses_index_user', 'CREATE INDEX IF NOT EXISTS idx_licenses_user ON licenses(user_id)'],
    ['licenses_index_app', 'CREATE INDEX IF NOT EXISTS idx_licenses_app ON licenses(app_code)'],
    ['licenses_index_device', 'CREATE INDEX IF NOT EXISTS idx_licenses_device ON licenses(device_id)'],
    ['stores_table', `CREATE TABLE IF NOT EXISTS stores (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      name VARCHAR(255) NOT NULL,
      phone VARCHAR(20) NOT NULL,
      owner_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
      UNIQUE(phone)
    )`],
    ['stores_index_phone', 'CREATE INDEX IF NOT EXISTS idx_stores_phone ON stores(phone)'],
    ['stores_index_owner', 'CREATE INDEX IF NOT EXISTS idx_stores_owner ON stores(owner_user_id)'],
    ['licenses_store_id', 'ALTER TABLE licenses ADD COLUMN IF NOT EXISTS store_id UUID REFERENCES stores(id)'],
    ['licenses_index_store', 'CREATE INDEX IF NOT EXISTS idx_licenses_store ON licenses(store_id)'],
    ['apps_show_in_registration', 'ALTER TABLE apps ADD COLUMN IF NOT EXISTS show_in_registration BOOLEAN NOT NULL DEFAULT true'],
    ['apps_price', 'ALTER TABLE apps ADD COLUMN IF NOT EXISTS price INTEGER DEFAULT NULL'],
    ['pos_app', `INSERT INTO apps (app_code, app_name, description, package_name, platform)
      SELECT 'pos', 'KanPosVN', 'POS cho cửa hàng đăng ký qua Web/Zalo', 'kanposvn.pos', 'mobile'
      WHERE NOT EXISTS (SELECT 1 FROM apps WHERE app_code = 'pos')`],
    ['sms_otps_table', `CREATE TABLE IF NOT EXISTS sms_otps (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      phone VARCHAR(20) NOT NULL,
      code VARCHAR(10) NOT NULL,
      purpose VARCHAR(50) NOT NULL DEFAULT 'register',
      expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
      attempts INTEGER NOT NULL DEFAULT 0,
      used BOOLEAN NOT NULL DEFAULT false,
      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    )`],
    ['sms_otps_index_phone', 'CREATE INDEX IF NOT EXISTS idx_sms_otps_phone ON sms_otps(phone, purpose, used)'],
    ['bank_accounts_table', `CREATE TABLE IF NOT EXISTS bank_accounts (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      bank_code VARCHAR(20) UNIQUE NOT NULL,
      bank_name VARCHAR(100) NOT NULL DEFAULT '',
      account_number VARCHAR(50) NOT NULL DEFAULT '',
      account_holder VARCHAR(100) NOT NULL DEFAULT '',
      branch VARCHAR(200) NOT NULL DEFAULT '',
      active BOOLEAN NOT NULL DEFAULT true,
      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
      updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    )`],
    ['bank_accounts_seed', `INSERT INTO bank_accounts (bank_code, bank_name, account_number, account_holder)
      SELECT 'VCB', 'Vietcombank', '', 'CẬP NHẬT SAU' WHERE NOT EXISTS (SELECT 1 FROM bank_accounts WHERE bank_code = 'VCB')`],
    ['bank_accounts_seed_agri', `INSERT INTO bank_accounts (bank_code, bank_name, account_number, account_holder)
      SELECT 'AGRIBANK', 'Agribank', '', 'CẬP NHẬT SAU' WHERE NOT EXISTS (SELECT 1 FROM bank_accounts WHERE bank_code = 'AGRIBANK')`],
    ['packages_table', `CREATE TABLE IF NOT EXISTS packages (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      key VARCHAR(50) UNIQUE NOT NULL,
      label VARCHAR(100) NOT NULL DEFAULT '',
      days INTEGER NOT NULL DEFAULT 0,
      price INTEGER NOT NULL DEFAULT 0,
      trial BOOLEAN NOT NULL DEFAULT false,
      forever BOOLEAN NOT NULL DEFAULT false,
      active BOOLEAN NOT NULL DEFAULT true,
      sort INTEGER NOT NULL DEFAULT 0,
      updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    )`],
    ['packages_seed_trial', `INSERT INTO packages (key, label, days, price, trial, sort)
      SELECT 'trial', 'Dùng thử 7 ngày', 7, 0, true, 1
      WHERE NOT EXISTS (SELECT 1 FROM packages WHERE key = 'trial')`],
    ['packages_seed_yearly', `INSERT INTO packages (key, label, days, price, sort)
      SELECT 'yearly', '365 ngày', 365, 899000, 2
      WHERE NOT EXISTS (SELECT 1 FROM packages WHERE key = 'yearly')`],
    ['packages_seed_forever', `INSERT INTO packages (key, label, days, price, forever, active, sort)
      SELECT 'forever', 'Vĩnh Viễn', 0, 2999000, true, false, 3
      WHERE NOT EXISTS (SELECT 1 FROM packages WHERE key = 'forever')`],
    ['packages_disable_forever', "UPDATE packages SET active = false WHERE key = 'forever'"],
    ['crm_sales_table', `CREATE TABLE IF NOT EXISTS crm_sales (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      order_code VARCHAR(32) UNIQUE NOT NULL,
      user_id UUID REFERENCES users(id) ON DELETE CASCADE,
      customer_name VARCHAR(255) NOT NULL DEFAULT '',
      customer_phone VARCHAR(20) NOT NULL DEFAULT '',
      product_code VARCHAR(100) NOT NULL DEFAULT '',
      product_name VARCHAR(200) NOT NULL DEFAULT '',
      amount INTEGER NOT NULL DEFAULT 0,
      note TEXT DEFAULT '',
      status VARCHAR(20) NOT NULL DEFAULT 'active',
      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    )`],
    ['customers_table', `CREATE TABLE IF NOT EXISTS customers (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      customer_code VARCHAR(32) UNIQUE,
      owner_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
      name VARCHAR(255) NOT NULL DEFAULT '',
      phone VARCHAR(20) DEFAULT '',
      email VARCHAR(255) DEFAULT '',
      active BOOLEAN DEFAULT true,
      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    )`],
    ['customers_index_owner', 'CREATE INDEX IF NOT EXISTS idx_customers_owner ON customers(owner_user_id)'],
    ['branches_table', `CREATE TABLE IF NOT EXISTS branches (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
      branch_code VARCHAR(32) DEFAULT '',
      name VARCHAR(255) NOT NULL DEFAULT '',
      phone VARCHAR(20) DEFAULT '',
      address VARCHAR(500) DEFAULT '',
      app_code VARCHAR(100) UNIQUE NOT NULL,
      active BOOLEAN DEFAULT true,
      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    )`],
    ['branches_index_customer', 'CREATE INDEX IF NOT EXISTS idx_branches_customer ON branches(customer_id)'],
    ['branches_index_app', 'CREATE INDEX IF NOT EXISTS idx_branches_app ON branches(app_code)'],
    ['branch_users_table', `CREATE TABLE IF NOT EXISTS branch_users (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
      user_id UUID REFERENCES users(id) ON DELETE CASCADE,
      role_id UUID REFERENCES roles(id) ON DELETE CASCADE,
      can_login BOOLEAN DEFAULT true,
      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
      UNIQUE(branch_id, user_id)
    )`],
    ['branch_users_index_branch', 'CREATE INDEX IF NOT EXISTS idx_branch_users_branch ON branch_users(branch_id)'],
    ['branch_users_index_user', 'CREATE INDEX IF NOT EXISTS idx_branch_users_user ON branch_users(user_id)'],
    ['licenses_branch_id', 'ALTER TABLE licenses ADD COLUMN IF NOT EXISTS branch_id UUID REFERENCES branches(id)'],
    ['licenses_index_branch', 'CREATE INDEX IF NOT EXISTS idx_licenses_branch ON licenses(branch_id)'],
    // Migration 015: 1 module (app_code) = nhiều chi nhánh.
    // - Bỏ UNIQUE trên branches.app_code: cho phép nhiều chi nhánh dùng chung 1 module.
    // - Bỏ UNIQUE(user_id, app_code, device_id) trên licenses: 1 user có thể có nhiều
    //   license của CÙNG app_code (mỗi chi nhánh 1 license, phân biệt bằng branch_id).
    // - Thêm partial unique index: license theo (user_id, branch_id, device_id) khi có
    //   branch_id; license cũ (đăng ký Web/Zalo) vẫn unique theo (user_id, app_code, device_id).
    ['015_branches_drop_app_unique', 'ALTER TABLE branches DROP CONSTRAINT IF EXISTS branches_app_code_key'],
    ['015_licenses_drop_user_app_device_unique', 'ALTER TABLE licenses DROP CONSTRAINT IF EXISTS licenses_user_id_app_code_device_id_key'],
    ['015_licenses_branch_unique', 'CREATE UNIQUE INDEX IF NOT EXISTS idx_licenses_user_branch_device ON licenses(user_id, branch_id, device_id) WHERE branch_id IS NOT NULL'],
    ['015_licenses_legacy_unique', 'CREATE UNIQUE INDEX IF NOT EXISTS idx_licenses_user_app_device_legacy ON licenses(user_id, app_code, device_id) WHERE branch_id IS NULL'],
    // Migration 016: Branch mặc định "Cửa hàng chính" (is_default) khi khách mua app.
    // Khách mua app chưa có chi nhánh → hệ thống tự cấp 1 Branch mặc định miễn phí
    // thuộc license đầu tiên (không bao giờ để license.branch_id = null).
    ['016_branches_is_default', 'ALTER TABLE branches ADD COLUMN IF NOT EXISTS is_default BOOLEAN NOT NULL DEFAULT false'],
    ['016_branches_backfill_default', `UPDATE branches b
      SET is_default = true
      WHERE b.id IN (
        SELECT DISTINCT ON (customer_id) id
        FROM branches
        ORDER BY customer_id, created_at ASC, id ASC
      )
      AND NOT EXISTS (
        SELECT 1 FROM branches x WHERE x.customer_id = b.customer_id AND x.is_default = true
      )`],
    ['016_branches_index_default', 'CREATE INDEX IF NOT EXISTS idx_branches_default ON branches(customer_id, is_default)'],
    // Migration 017: Mô hình KHO đa chi nhánh.
    // Warehouse = thực thể độc lập thuộc Customer; kho chi nhánh có branch_id, kho trung tâm
    // có branch_id = NULL (CENTRAL). 1 chi nhánh có nhiều kho. Product thuộc Customer,
    // tồn kho thuộc TỪNG kho (warehouse_stock). Mọi biến động qua stock_transactions /
    // phiếu chuyển kho stock_transfers — KHÔNG sửa trực tiếp số lượng tồn.
    ['017_warehouses_table', `CREATE TABLE IF NOT EXISTS warehouses (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
      branch_id UUID REFERENCES branches(id) ON DELETE SET NULL,
      warehouse_code VARCHAR(32) DEFAULT '',
      warehouse_name VARCHAR(255) NOT NULL DEFAULT '',
      warehouse_type VARCHAR(20) NOT NULL DEFAULT 'BRANCH',
      is_default BOOLEAN NOT NULL DEFAULT false,
      status VARCHAR(20) NOT NULL DEFAULT 'active',
      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
      updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    )`],
    ['017_warehouses_index_customer', 'CREATE INDEX IF NOT EXISTS idx_warehouses_customer ON warehouses(customer_id)'],
    ['017_warehouses_index_branch', 'CREATE INDEX IF NOT EXISTS idx_warehouses_branch ON warehouses(branch_id)'],
    ['017_warehouses_index_default', 'CREATE INDEX IF NOT EXISTS idx_warehouses_default ON warehouses(customer_id, is_default)'],
    ['017_warehouses_index_code', 'CREATE UNIQUE INDEX IF NOT EXISTS idx_warehouses_customer_code ON warehouses(customer_id, warehouse_code) WHERE warehouse_code <> \'\''],
    ['017_products_table', `CREATE TABLE IF NOT EXISTS products (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
      product_code VARCHAR(64) DEFAULT '',
      name VARCHAR(255) NOT NULL DEFAULT '',
      unit VARCHAR(50) DEFAULT '',
      price NUMERIC(18,2) NOT NULL DEFAULT 0,
      active BOOLEAN NOT NULL DEFAULT true,
      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
      updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    )`],
    ['017_products_index_customer', 'CREATE INDEX IF NOT EXISTS idx_products_customer ON products(customer_id)'],
    ['017_products_index_code', 'CREATE UNIQUE INDEX IF NOT EXISTS idx_products_customer_code ON products(customer_id, product_code) WHERE product_code <> \'\''],
    ['017_warehouse_stock_table', `CREATE TABLE IF NOT EXISTS warehouse_stock (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      warehouse_id UUID NOT NULL REFERENCES warehouses(id) ON DELETE CASCADE,
      product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
      quantity NUMERIC(18,3) NOT NULL DEFAULT 0 CHECK (quantity >= 0),
      min_quantity NUMERIC(18,3) NOT NULL DEFAULT 0,
      max_quantity NUMERIC(18,3) NOT NULL DEFAULT 0,
      updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
      UNIQUE(warehouse_id, product_id)
    )`],
    ['017_warehouse_stock_index_warehouse', 'CREATE INDEX IF NOT EXISTS idx_warehouse_stock_warehouse ON warehouse_stock(warehouse_id)'],
    ['017_warehouse_stock_index_product', 'CREATE INDEX IF NOT EXISTS idx_warehouse_stock_product ON warehouse_stock(product_id)'],
    ['017_stock_transactions_table', `CREATE TABLE IF NOT EXISTS stock_transactions (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
      warehouse_id UUID NOT NULL REFERENCES warehouses(id) ON DELETE CASCADE,
      product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
      tx_type VARCHAR(20) NOT NULL DEFAULT 'ADJUSTMENT',
      quantity NUMERIC(18,3) NOT NULL DEFAULT 0 CHECK (quantity > 0),
      ref_type VARCHAR(30) DEFAULT '',
      ref_id VARCHAR(64) DEFAULT '',
      note TEXT DEFAULT '',
      created_by UUID REFERENCES users(id) ON DELETE SET NULL,
      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    )`],
    ['017_stock_transactions_index_warehouse', 'CREATE INDEX IF NOT EXISTS idx_stock_tx_warehouse ON stock_transactions(warehouse_id)'],
    ['017_stock_transactions_index_product', 'CREATE INDEX IF NOT EXISTS idx_stock_tx_product ON stock_transactions(product_id)'],
    ['017_stock_transactions_index_customer', 'CREATE INDEX IF NOT EXISTS idx_stock_tx_customer_created ON stock_transactions(customer_id, created_at)'],
    ['017_stock_transfers_table', `CREATE TABLE IF NOT EXISTS stock_transfers (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
      transfer_code VARCHAR(32) DEFAULT '',
      from_warehouse_id UUID NOT NULL REFERENCES warehouses(id) ON DELETE RESTRICT,
      to_warehouse_id UUID NOT NULL REFERENCES warehouses(id) ON DELETE RESTRICT,
      status VARCHAR(20) NOT NULL DEFAULT 'DRAFT',
      note TEXT DEFAULT '',
      created_by UUID REFERENCES users(id) ON DELETE SET NULL,
      confirmed_at TIMESTAMP WITH TIME ZONE,
      shipped_at TIMESTAMP WITH TIME ZONE,
      received_at TIMESTAMP WITH TIME ZONE,
      cancelled_at TIMESTAMP WITH TIME ZONE,
      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
      updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
      CHECK (from_warehouse_id <> to_warehouse_id)
    )`],
    ['017_stock_transfers_index_customer', 'CREATE INDEX IF NOT EXISTS idx_stock_transfers_customer ON stock_transfers(customer_id)'],
    ['017_stock_transfers_index_from', 'CREATE INDEX IF NOT EXISTS idx_stock_transfers_from ON stock_transfers(from_warehouse_id)'],
    ['017_stock_transfers_index_to', 'CREATE INDEX IF NOT EXISTS idx_stock_transfers_to ON stock_transfers(to_warehouse_id)'],
    ['017_stock_transfer_items_table', `CREATE TABLE IF NOT EXISTS stock_transfer_items (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      transfer_id UUID NOT NULL REFERENCES stock_transfers(id) ON DELETE CASCADE,
      product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
      quantity NUMERIC(18,3) NOT NULL DEFAULT 0 CHECK (quantity > 0),
      UNIQUE(transfer_id, product_id)
    )`],
    ['017_stock_transfer_items_index_transfer', 'CREATE INDEX IF NOT EXISTS idx_stock_transfer_items_transfer ON stock_transfer_items(transfer_id)'],
    ['017_warehouses_backfill_default', `INSERT INTO warehouses (customer_id, branch_id, warehouse_code, warehouse_name, warehouse_type, is_default, status)
      SELECT
        b.customer_id,
        b.id,
        'W' || lpad(row_number() OVER (PARTITION BY b.customer_id ORDER BY b.created_at, b.id)::text, 3, '0'),
        b.name || ' - Kho chính',
        'BRANCH',
        true,
        'active'
      FROM branches b
      WHERE NOT EXISTS (SELECT 1 FROM warehouses w WHERE w.branch_id = b.id)`],
  ];

  for (const [name, sqlStr] of migrations) {
    try {
      await sql(tsa(sqlStr));
      results.push('OK: ' + name);
    } catch (e) {
      results.push('ERR: ' + name + ' -> ' + String(e));
    }
  }

  // Seed cac app (module) de cua hang duoc phep chon luc dang ky
  for (const m of STORE_MODULES) {
    try {
      await sql`
        INSERT INTO apps (app_code, app_name, description, package_name, platform)
        SELECT ${m.app_code}, ${m.name}, 'POS module dang ky cua hang', '', 'mobile'
        WHERE NOT EXISTS (SELECT 1 FROM apps WHERE app_code = ${m.app_code})
      `;
      results.push('OK: store_app_' + m.app_code);
    } catch (e) {
      results.push('ERR: store_app_' + m.app_code + ' -> ' + String(e));
    }
  }

  return NextResponse.json({ ok: true, results }, { headers: corsHeaders() });
}
