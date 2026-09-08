const sqlite3 = require('sqlite3').verbose();
const path = require('path');

// Tạo file DB ngay trong thư mục database
const dbPath = path.resolve(__dirname, '../database/kanposvn_local.db');
const db = new sqlite3.Database(dbPath);

module.exports = {
  // Hàm giả lập giống hệt API của 'pg' để mã nguồn route không đổi
  query: (text, params) => {
    return new Promise((resolve, reject) => {
      // Chuyển đổi tham số $1, $2 của Postgres thành ?1, ?2 của SQLite để đảm bảo đúng thứ tự
      const sqliteText = text.replace(/\$(\d+)/g, '?$1');
      
      const isSelectQuery = text.trim().toUpperCase().startsWith('SELECT') || text.toUpperCase().includes('RETURNING');

      if (isSelectQuery) {
        db.all(sqliteText, params, (err, rows) => {
          if (err) reject(err);
          else resolve({ rows });
        });
      } else {
        db.run(sqliteText, params, function(err) {
          if (err) reject(err);
          else resolve({ rows: [], changes: this.changes, lastID: this.lastID });
        });
      }
    });
  }
};
