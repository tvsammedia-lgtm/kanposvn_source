const express = require('express');
const db = require('../db');

const router = express.Router();

// Lấy danh sách orders
router.get('/', async (req, res) => {
  try {
    const { rows } = await db.query(
      'SELECT * FROM orders WHERE is_deleted = 0'
    );
    res.json({ success: true, data: rows });
  } catch (error) {
    console.error('[Get Orders Error]', error);
    res.status(500).json({ success: false, message: 'Lỗi server' });
  }
});

// Thêm mới order
router.post('/', async (req, res) => {
  const { id, customer_id, total_amount, status } = req.body;
  try {
    // Test lệnh RETURNING với SQLite
    const result = await db.query(
      'INSERT INTO orders (id, customer_id, total_amount, status) VALUES ($1, $2, $3, $4) RETURNING *',
      [id, customer_id, total_amount, status]
    );
    res.json({ success: true, message: 'Thêm đơn hàng thành công', data: result.rows });
  } catch (error) {
    console.error('[Add Order Error]', error);
    res.status(500).json({ success: false, message: 'Lỗi server' });
  }
});

module.exports = router;
