import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

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
    ['orders_indexes', `CREATE INDEX IF NOT EXISTS idx_orders_user ON orders(user_id);
      CREATE INDEX IF NOT EXISTS idx_orders_code ON orders(order_code);
      CREATE INDEX IF NOT EXISTS idx_licenses_user ON licenses(user_id);
      CREATE INDEX IF NOT EXISTS idx_licenses_app ON licenses(app_code);
      CREATE INDEX IF NOT EXISTS idx_licenses_device ON licenses(device_id)`],
  ];

  for (const [name, sqlStr] of migrations) {
    try {
      await sql(tsa(sqlStr));
      results.push('OK: ' + name);
    } catch (e) {
      results.push('ERR: ' + name + ' -> ' + String(e));
    }
  }

  return NextResponse.json({ ok: true, results }, { headers: corsHeaders() });
}
