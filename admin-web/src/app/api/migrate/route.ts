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
    ['pos_app', `INSERT INTO apps (app_code, app_name, description, package_name, platform)
      SELECT 'pos', 'KanPosVN', 'POS cho cửa hàng đăng ký qua Web/Zalo', 'kanposvn.pos', 'mobile'
      WHERE NOT EXISTS (SELECT 1 FROM apps WHERE app_code = 'pos')`],
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
