import { NextRequest, NextResponse } from 'next/server';
import { getSql } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

function getToken(req: NextRequest) {
  const auth = req.headers.get('authorization');
  if (!auth?.startsWith('Bearer ')) return null;
  try { return verifyToken(auth.split(' ')[1]); } catch { return null; }
}

export async function GET(req: NextRequest) {
  const sql = getSql();
  const user = getToken(req);
  if (!user) return NextResponse.json({ error: 'Chua dang nhap' }, { status: 401 });

  const totalUsers = await sql`SELECT COUNT(*)::int as count FROM users`;
  const activeUsers = await sql`SELECT COUNT(*)::int as count FROM users WHERE active = true`;
  const lockedUsers = await sql`SELECT COUNT(*)::int as count FROM users WHERE active = false`;
  const totalApps = await sql`SELECT COUNT(*)::int as count FROM apps`;
  const totalPerms = await sql`SELECT COUNT(*)::int as count FROM user_permissions WHERE can_login = true`;
  const recentLogs = await sql`SELECT COUNT(*)::int as count FROM audit_logs WHERE created_at > NOW() - INTERVAL '24 hours'`;

  return NextResponse.json({
    totalUsers: totalUsers[0].count,
    activeUsers: activeUsers[0].count,
    lockedUsers: lockedUsers[0].count,
    totalApps: totalApps[0].count,
    totalPermissions: totalPerms[0].count,
    recentLogs: recentLogs[0].count,
  });
}
