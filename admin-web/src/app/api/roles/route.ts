import { NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

export async function GET() {
  const sql = getSql();
  const roles = await sql`SELECT id, role_name FROM roles ORDER BY role_name`;
  return NextResponse.json(roles);
}
