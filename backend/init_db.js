const fs = require('fs');
const path = require('path');
const sqlite3 = require('sqlite3').verbose();

const dbPath = path.resolve(__dirname, './database/kanposvn_local.db');
const schema = fs.readFileSync(path.resolve(__dirname, './database/schema.sql'), 'utf8');

const db = new sqlite3.Database(dbPath);

db.exec(schema, (err) => {
    if (err) {
        console.error('Lỗi khởi tạo DB:', err);
    } else {
        console.log('Khởi tạo SQLite Database thành công tại:', dbPath);
    }
    db.close();
});
