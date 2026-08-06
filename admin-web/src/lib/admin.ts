const SUPER_ADMINS = ['admin@kanposvn.com', 'admin@kanposvn'];
const CAFE_ADMINS = ['admin@kanposvncafe.com', 'admin@kanposvncafe'];

function norm(email?: string | null): string {
  return (email || '').trim().toLowerCase();
}

export function isSuperAdminEmail(email?: string | null): boolean {
  return SUPER_ADMINS.includes(norm(email));
}

export function isCafeAdminEmail(email?: string | null): boolean {
  return CAFE_ADMINS.includes(norm(email));
}

export function isProtectedAdminEmail(email?: string | null): boolean {
  return isSuperAdminEmail(email) || isCafeAdminEmail(email);
}
