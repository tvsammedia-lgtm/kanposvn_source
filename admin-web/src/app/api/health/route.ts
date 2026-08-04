import { NextResponse } from 'next/server';
import { getSql } from '@/lib/db';

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };
}

export async function OPTIONS() {
  return new NextResponse(null, { status: 204, headers: corsHeaders() });
}

export async function GET() {
  try {
    const sql = getSql();
    await sql`SELECT 1`;
    return NextResponse.json(
      {
        success: true,
        status: 'ok',
        service: 'kanposvn-admin',
        db: 'connected',
        timestamp: new Date().toISOString(),
      },
      { headers: corsHeaders() },
    );
  } catch (e) {
    return NextResponse.json(
      {
        success: false,
        status: 'error',
        service: 'kanposvn-admin',
        db: 'disconnected',
        error: String(e),
        timestamp: new Date().toISOString(),
      },
      { status: 500, headers: corsHeaders() },
    );
  }
}
