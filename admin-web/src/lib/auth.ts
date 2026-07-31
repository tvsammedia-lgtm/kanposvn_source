import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';

const JWT_SECRET = process.env.JWT_SECRET || 'kanposvn_admin_secret_2026';

export function signToken(user: { id: string; email: string; role: string }) {
  return jwt.sign({ id: user.id, email: user.email, role: user.role }, JWT_SECRET, { expiresIn: '7d' });
}

export function verifyToken(token: string) {
  return jwt.verify(token, JWT_SECRET) as { id: string; email: string; role: string };
}

export function hashPassword(password: string) {
  return bcrypt.hash(password, 10);
}

export function comparePassword(password: string, hash: string) {
  return bcrypt.compare(password, hash);
}
