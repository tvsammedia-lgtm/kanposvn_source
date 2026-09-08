require('dotenv').config();
const express = require('express');
const cors = require('cors');

const authRoutes = require('./routes/auth.routes');
const syncRoutes = require('./routes/sync.routes');
const customersRoutes = require('./routes/customers.routes');
const ordersRoutes = require('./routes/orders.routes');
const { ensureSchema } = require('./schema');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/sync', syncRoutes);
app.use('/api/customers', customersRoutes);
app.use('/api/orders', ordersRoutes);

// Health check
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', mode: 'local' });
});

// Giống admin-web: thông tin cửa hàng/chi nhánh (bản Local không có chi nhánh).
app.get('/api/owner/info', (req, res) => {
  res.json({ branch_id: null });
});

app.get('/api/owner/branches', (req, res) => {
  res.json({ branches: [] });
});

// Root route
app.get('/', (req, res) => {
  res.send(`<h1>KanPosVN Local Web (như admin-web)</h1>
<p>API Endpoint: /api/ — Đăng nhập: POST /api/auth/login</p>
<p>Demo accounts (mật khẩu 123456): <b>owner</b> (mọi module), <b>nhanvien</b>, <b>admin</b>.</p>`);
});

ensureSchema()
  .then(() => {
    app.listen(PORT, () => {
      console.log(`[Local Web] Running on http://localhost:${PORT}`);
    });
  })
  .catch((err) => {
    console.error('[Local Web] Khởi tạo schema thất bại:', err);
    process.exit(1);
  });