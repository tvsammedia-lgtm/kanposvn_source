const db = require('./src/db');
const fs = require('fs');
const path = require('path');
const sqlite3 = require('sqlite3').verbose();

async function runTests() {
  console.log('--- BẮT ĐẦU TEST DATABASE VÀ API TƯƠNG ĐƯƠNG ---');
  
  try {
    // Test 1: Kiểm tra lấy danh sách customers
    console.log('\n[Test 1] Lấy danh sách khách hàng...');
    const customers = await db.query('SELECT * FROM customers WHERE is_deleted = 0');
    console.log('=> Trả về:', customers.rows.length, 'khách hàng.');

    // Test 2: Kiểm tra insert với RETURNING
    console.log('\n[Test 2] Thêm mới order với RETURNING...');
    const orderId = 'order-test-' + Date.now();
    const newOrder = await db.query(
      'INSERT INTO orders (id, customer_id, total_amount, status) VALUES ($1, $2, $3, $4) RETURNING *',
      [orderId, 'cust-1', 250000, 'PENDING']
    );
    console.log('=> Trả về kết quả thêm mới:', newOrder.rows);
    
    // Test 3: Kiểm tra xử lý thứ tự tham số ($1, $2 -> ?1, ?2)
    console.log('\n[Test 3] Kiểm tra xử lý nhiều tham số giống nhau ($1, $1)...');
    const duplicateParamTest = await db.query(
      'SELECT * FROM users WHERE id = $1 OR username = $1',
      ['uuid-1234']
    );
    console.log('=> Trả về user:', duplicateParamTest.rows);
    
    console.log('\n--- TẤT CẢ CÁC TEST ĐÃ XONG ---');
  } catch (error) {
    console.error('Lỗi khi chạy test:', error);
  }
}

runTests();
