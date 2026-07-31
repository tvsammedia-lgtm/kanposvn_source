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
