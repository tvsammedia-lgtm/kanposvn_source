const express = require('express');
const db = require('../db');

const router = express.Router();

// Lấy danh sách customers
router.get('/', async (req, res) => {
  try {
    const { rows } = await db.query(
      'SELECT * FROM customers WHERE is_deleted = 0'
    );
    res.json({ success: true, data: rows });
  } catch (error) {
    console.error('[Get Customers Error]', error);
    res.status(500).json({ success: false, message: 'Lỗi server' });
  }
});

// Thêm mới customer
router.post('/', async (req, res) => {
  const { id, name, phone, address } = req.body;
  try {
    await db.query(
      'INSERT INTO customers (id, name, phone, address) VALUES ($1, $2, $3, $4)',
      [id, name, phone, address]
    );
    res.json({ success: true, message: 'Thêm khách hàng thành công' });
  } catch (error) {
    console.error('[Add Customer Error]', error);
    res.status(500).json({ success: false, message: 'Lỗi server' });
  }
});

module.exports = router;
