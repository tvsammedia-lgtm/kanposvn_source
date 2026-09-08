// Khởi tạo schema + seed dữ liệu demo cho Local Web (localhost:3000).
// Bản local web hoạt động GIỐNG admin-web trên Vercel: đăng nhập kiểm tra user
// qua /api/auth/login trả về đúng cấu trúc {user, token, permissions, storeId,...}.
const db = require('./db');

// Danh sách app_code của MỌI module trong app KanPosVN (module_enum/appCode)
// + KANPOS-VN (app code đăng nhập local của module KanPosVN Account).
const APPS = [
  'kanposvncafe', 'kanposvnkhachsan', 'nhansu', 'kanposvnvlxd', 'kanposvngara',
  'kanposvnnhathuoc', 'kanposvnqlcd', 'kanposvnnbatdongsan', 'kanposvnbanvevantai',
  'kanposvnbida', 'kanposvnpawn', 'kanposvnnhahangquanan', 'kanposvnnhatro200',
  'kanposvnspa', 'kanposvnbarber', 'kanposvntaphoasmmini', 'kanposvncrm',
  'kanposvngym', 'kanposvnparking', 'kanposvnviec', 'kanposvnride',
  'kanposvneshop', 'kanposvnairbook', 'kanposvnvideocall', 'kanposvnhrpayroll',
  'kanposvnengpic', 'kanposvnkanji', 'kanposvnnemda', 'kanposvntruyenthong',
  'kanposvndoichieuketoan', 'kanposvntramxang', 'kanposvncongtrinh',
  'kanposvnordertq', 'KANPOS-VN',
];

async function columnExists(table, column) {
  const { rows } = await db.query(`SELECT * FROM pragma_table_info('${table}')`);
  return rows.some((r) => r.name === column);
}

async function ensureSchema() {
  await db.query(`
    CREATE TABLE IF NOT EXISTS users (
      id TEXT PRIMARY KEY,
      username TEXT UNIQUE,
      email TEXT,
      phone TEXT,
      full_name TEXT,
      password_hash TEXT,
      role TEXT,
      app_code TEXT,
      active INTEGER DEFAULT 1,
      shop_name TEXT,
      shop_address TEXT
    )
  `);

  // Nâng cấp bảng users cũ (chỉ có id, username, password_hash, role, app_code).
  for (const col of ['email', 'phone', 'full_name', 'active', 'shop_name', 'shop_address']) {
    if (!(await columnExists('users', col))) {
      await db.query(`ALTER TABLE users ADD COLUMN ${col} ${col === 'active' ? 'INTEGER DEFAULT 1' : 'TEXT'}`);
    }
  }

  await db.query(`
    CREATE TABLE IF NOT EXISTS stores (
      id TEXT PRIMARY KEY,
      owner_user_id TEXT,
      name TEXT,
      phone TEXT,
      app_code TEXT
    )
  `);
  await db.query(`
    CREATE TABLE IF NOT EXISTS apps (
      id TEXT PRIMARY KEY,
      app_code TEXT UNIQUE,
      app_name TEXT
    )
  `);
  await db.query(`
    CREATE TABLE IF NOT EXISTS roles (
      id TEXT PRIMARY KEY,
      role_name TEXT UNIQUE
    )
  `);
  await db.query(`
    CREATE TABLE IF NOT EXISTS user_permissions (
      id TEXT PRIMARY KEY,
      user_id TEXT,
      app_id TEXT,
      role_id TEXT,
      can_login INTEGER DEFAULT 1
    )
  `);

  // ---- Seed idempotent (INSERT OR IGNORE) — chạy được với cả DB cũ lẫn mới ----

  // Apps: toàn bộ module của KanPosVN.
  for (let idx = 0; idx < APPS.length; idx++) {
    const code = APPS[idx];
    await db.query(
      'INSERT OR IGNORE INTO apps (id, app_code, app_name) VALUES ($1, $2, $3)',
      [`app_${idx}`, code, code],
    );
  }

  await db.query("INSERT OR IGNORE INTO roles (id, role_name) VALUES ('role_admin', 'Admin')");
  await db.query("INSERT OR IGNORE INTO roles (id, role_name) VALUES ('role_user', 'User')");

  // Demo users (bỏ qua nếu username đã tồn tại trong DB cũ).
  const users = [
    {
      id: 'u_owner', username: 'owner', email: 'owner@kanposvn.com',
      phone: '0901234567', full_name: 'Chủ cửa hàng KanPosVN',
      password_hash: '123456', role: 'admin', app_code: 'kanposvncafe',
      active: 1, shop_name: 'Cửa hàng demo KanPosVN', shop_address: 'TP Hồ Chí Minh',
    },
    {
      id: 'u_nhanvien', username: 'nhanvien', email: 'nhanvien@kanposvn.com',
      phone: '0912345678', full_name: 'Nhân viên demo',
      password_hash: '123456', role: 'user', app_code: 'kanposvncafe',
      active: 1, shop_name: 'Cửa hàng demo KanPosVN', shop_address: 'TP Hồ Chí Minh',
    },
    {
      id: 'u_quantri', username: 'quantri', email: 'quantri@kanposvn.com',
      phone: '0900000000', full_name: 'Quản trị viên Local',
      password_hash: '123456', role: 'admin', app_code: 'KANPOS-VN',
      active: 1, shop_name: '', shop_address: '',
    },
  ];
  for (const u of users) {
    await db.query(
      `INSERT OR IGNORE INTO users (id, username, email, phone, full_name, password_hash, role, app_code, active, shop_name, shop_address)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)`,
      [u.id, u.username, u.email, u.phone, u.full_name, u.password_hash, u.role, u.app_code, u.active, u.shop_name, u.shop_address],
    );
  }

  await db.query(
    `INSERT OR IGNORE INTO stores (id, owner_user_id, name, phone, app_code)
     VALUES ('store-demo-1', 'u_owner', 'Cửa hàng demo KanPosVN', '0901234567', 'kanposvncafe')`,
  );

  // Phân quyền: u_owner + u_quantri (admin) → TẤT CẢ module (localhost áp dụng
  // cho MỌI module); u_nhanvien → một số module demo.
  // Lưu ý: nếu username 'owner' đã tồn tại từ cũ (id khác) thì perm vẫn gắn theo
  // id cố định — demo nhắm tới DB mới hoặc các user chưa tồn tại.
  let p = 0;
  for (let idx = 0; idx < APPS.length; idx++) {
    const appId = `app_${idx}`;
    for (const uid of ['u_owner', 'u_quantri']) {
      await db.query(
        `INSERT OR IGNORE INTO user_permissions (id, user_id, app_id, role_id, can_login)
         VALUES ($1, $2, $3, 'role_admin', 1)`,
        [`perm_${p}`, uid, appId],
      );
      p += 1;
    }
  }
  const nvAppCodes = ['kanposvncafe', 'kanposvnnhathuoc', 'kanposvnnhahangquanan', 'kanposvnordertq'];
  for (const code of nvAppCodes) {
    await db.query(
      `INSERT OR IGNORE INTO user_permissions (id, user_id, app_id, role_id, can_login)
       VALUES ($1, $2, $3, 'role_user', 1)`,
      [`perm_nv_${code}`, 'u_nhanvien', `app_${APPS.indexOf(code)}`],
    );
  }

  console.log('[Schema] Local DB đã sẵn sàng: demo users owner/nhanvien/quantri (mật khẩu 123456).');
}

module.exports = { ensureSchema };