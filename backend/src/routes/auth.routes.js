const express = require('express');
const jwt = require('jsonwebtoken');
const db = require('../db');

const router = express.Router();

// Đăng nhập GIỐNG admin-web trên Vercel (dùng cho chế độ Ngoại tuyến).
// - Nhận: email/phone (app KanPosVN) hoặc username (module Account), + password.
// - Trả về: {user, token, permissions, storeId, storeName, storePhone, appCode,...}
//   + data.access_token/refresh_token (tương thích phần Account trong module kanposvncrm).
router.post('/login', async (req, res) => {
  const { email, phone, username, password, app_code } = req.body;

  try {
    if ((!email && !phone && !username) || !password) {
      return res.status(400).json({ error: 'Thông tin đăng nhập là bắt buộc' });
    }

    const conds = [];
    const params = [];
    if (username) {
      conds.push('username = $');
      params.push(username);
    }
    if (email) {
      conds.push('email = $');
      params.push(email);
    }
    if (phone) {
      // Giống admin-web: tìm theo phone; nếu không thấy thì fallback theo email.
      conds.push('phone = $');
      params.push(phone);
      conds.push('(email = $');
      params.push(phone);
    }

    // Đảm bảo placeholder nhận dạng $N liền mạch (với nhánh email fallback).
    const where = conds
      .map((c, idx) => {
        const v = `${c}${idx + 1}`;
        return c.startsWith('(') ? `${v})` : v;
      })
      .join(' OR ');
    const { rows } = await db.query(`SELECT * FROM users WHERE ${where}`, params);
    const user = rows[0];

    if (!user) {
      return res.status(404).json({
        error: 'Tài khoản chưa có trên Web Localhost. Vui lòng đăng nhập Online để đồng bộ hoặc liên hệ Admin.',
      });
    }

    if (!user.active) {
      return res.status(403).json({ error: 'Tài khoản đã bị khóa' });
    }

    // Demo local: so sánh plain-text. Production phải dùng bcrypt.compare.
    if (user.password_hash !== password) {
      return res.status(401).json({ error: 'SĐT/Email hoặc mật khẩu không đúng' });
    }

    const permRes = await db.query(
      `SELECT a.app_code, a.app_name, r.role_name, p.can_login
       FROM user_permissions p
       JOIN apps a ON a.id = p.app_id
       JOIN roles r ON r.id = p.role_id
       WHERE p.user_id = $1`,
      [user.id],
    );
    const allPerms = permRes.rows;

    // Nếu client gửi app_code → chỉ được vào nếu user có quyền cho module đó.
    if (app_code) {
      const appPerm = allPerms.find((p) => p.app_code === app_code);
      if (!appPerm || !appPerm.can_login) {
        return res.status(403).json({ error: 'Bạn không có quyền sử dụng ứng dụng này' });
      }
    }

    const isAdmin = allPerms.some((p) => p.role_name === 'Admin');
    const permissions = allPerms.map((p) => ({
      app_code: p.app_code,
      role_name: p.role_name,
      can_login: p.can_login,
      permission_key: p.app_code,
      granted: p.can_login,
    }));

    const token = jwt.sign(
      { userId: user.id, email: user.email, role: isAdmin ? 'admin' : 'user' },
      process.env.JWT_SECRET || 'super_secret_local_key_kanposvn',
      { expiresIn: '1d' },
    );

    // Thông tin cửa hàng (đăng ký qua Web/Zalo Mini App).
    const storeRes = await db.query(
      'SELECT id, name, phone, app_code FROM stores WHERE owner_user_id = $1',
      [user.id],
    );
    const store = storeRes.rows[0];

    return res.json({
      user: {
        id: user.id,
        name: user.full_name,
        full_name: user.full_name,
        email: user.email ?? '',
        phone: user.phone ?? '',
        role: isAdmin ? 'admin' : 'user',
        shop_name: user.shop_name ?? '',
        shop_address: user.shop_address ?? '',
        subscription_plan: '',
        subscription_start: null,
        subscription_end: null,
      },
      token,
      permissions,
      storeId: store?.id ?? null,
      storeName: store?.name ?? null,
      storePhone: store?.phone ?? null,
      appCode: store?.app_code ?? null,
      plan: 'trial',
      trial: true,
      forever: false,
      expiresAt: null,
      // Tương thích phần Account trong module kanposvncrm (đăng nhập local).
      data: {
        access_token: token,
        refresh_token: 'mock-refresh-token',
      },
    });
  } catch (error) {
    console.error('[Login Error]', error);
    return res.status(500).json({ error: 'Lỗi server kết nối DB' });
  }
});

module.exports = router;