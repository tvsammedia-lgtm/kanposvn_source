const express = require('express');
const router = express.Router();

// Middleware giả lập kiểm tra token
const checkAuth = (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return res.status(401).json({ success: false, message: 'Unauthorized' });
  }
  next();
};

router.post('/push', checkAuth, async (req, res) => {
  const { device_id, operations } = req.body;
  
  console.log(`[Sync Push] Nhận ${operations?.length || 0} thao tác từ thiết bị ${device_id}`);

  if (operations && operations.length > 0) {
    const db = require('../db');
    for (const op of operations) {
      if (op.collection === 'NongSanWeighingTicket' && op.data) {
        const data = op.data;
        const query = `
          INSERT OR REPLACE INTO nongsan_weighing_tickets 
          (id, ticket_number, supplier_id, vehicle_plate, driver_name, gross_weight, tare_weight, packaging_weight, updated_at)
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
        `;
        const params = [
          data.id, 
          data.ticketNumber, 
          data.supplierId, 
          data.vehiclePlate, 
          data.driverName, 
          data.grossWeight || 0, 
          data.tareWeight || 0, 
          data.packagingWeight || 0, 
          data.updatedAt || new Date().toISOString()
        ];
        try {
          await db.query(query, params);
        } catch (err) {
          console.error(`[Sync Push Error] Failed to save NongSanWeighingTicket ${data.id}:`, err);
        }
      }
    }
  }

  res.json({
    success: true,
    message: 'Đã nhận dữ liệu đồng bộ',
    conflicts: [],
    failed: []
  });
});

router.post('/pull', checkAuth, async (req, res) => {
  const { device_id, last_sync_cursor } = req.body;
  
  console.log(`[Sync Pull] Yêu cầu kéo dữ liệu từ thiết bị ${device_id} (cursor: ${last_sync_cursor})`);
  
  try {
    // Trong thực tế, chúng ta nên lọc theo last_sync_cursor.
    // Ở đây demo lấy toàn bộ dữ liệu mới nhất chưa bị xoá.
    const db = require('../db');
    
    const [ordersRes, customersRes, tripsRes, nongsanSuppliersRes, nongsanProductsRes, nongsanTicketsRes, nongsanLotsRes] = await Promise.all([
      db.query('SELECT * FROM orders WHERE is_deleted = 0'),
      db.query('SELECT * FROM customers WHERE is_deleted = 0'),
      db.query('SELECT * FROM trips WHERE is_deleted = 0'),
      db.query('SELECT * FROM nongsan_suppliers WHERE is_deleted = 0'),
      db.query('SELECT * FROM nongsan_products WHERE is_deleted = 0'),
      db.query('SELECT * FROM nongsan_weighing_tickets WHERE is_deleted = 0'),
      db.query('SELECT * FROM nongsan_lots WHERE is_deleted = 0')
    ]);

    res.json({
      success: true,
      cursor: Date.now().toString(),
      changes: {
        orders: ordersRes.rows,
        customers: customersRes.rows,
        trips: tripsRes.rows,
        nongsan_suppliers: nongsanSuppliersRes.rows,
        nongsan_products: nongsanProductsRes.rows,
        nongsan_weighing_tickets: nongsanTicketsRes.rows,
        nongsan_lots: nongsanLotsRes.rows
      }
    });
  } catch (error) {
    console.error('[Sync Pull Error]', error);
    res.status(500).json({ success: false, message: 'Lỗi server khi đồng bộ pull' });
  }
});

module.exports = router;
