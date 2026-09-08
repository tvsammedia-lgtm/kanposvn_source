CREATE TABLE IF NOT EXISTS users (
    id TEXT PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role TEXT DEFAULT 'STAFF',
    app_code TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    id TEXT PRIMARY KEY,
    customer_id TEXT,
    total_amount REAL,
    status TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_deleted INTEGER DEFAULT 0
);

INSERT OR IGNORE INTO users (id, username, password_hash, role, app_code)
VALUES ('uuid-1234', 'admin', '123456', 'ADMIN', 'KANPOS-VN'),
       ('uuid-1235', 'staff', '123456', 'STAFF', 'KANPOS-VN'),
       ('uuid-1236', 'driver', '123456', 'DRIVER', 'KANPOS-VN'),
       ('uuid-1237', 'customer', '123456', 'CUSTOMER', 'KANPOS-VN');

CREATE TABLE IF NOT EXISTS customers (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT,
    address TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_deleted INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS trips (
    id TEXT PRIMARY KEY,
    vehicle_id TEXT,
    status TEXT DEFAULT 'PENDING',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_deleted INTEGER DEFAULT 0
);

-- Insert dummy data for customers
INSERT OR IGNORE INTO customers (id, name, phone, address)
VALUES ('cust-1', 'Nguyen Van A', '0123456789', 'Hanoi');

-- Insert dummy data for trips
INSERT OR IGNORE INTO trips (id, vehicle_id, status)
VALUES ('trip-1', '29A-12345', 'IN_PROGRESS');

-- Insert dummy data for orders
INSERT OR IGNORE INTO orders (id, customer_id, total_amount, status)
VALUES ('order-1', 'cust-1', 150000, 'COMPLETED');

-- Bảng lưu trữ linh hoạt cho Isar Documents của kanposvndailynongsan
-- Do Isar sử dụng định dạng schema-less cục bộ, ta có thể tạo một bảng generic cho backend SQLite
-- Hoặc tạo các bảng chi tiết. Ở đây tạo bảng chi tiết cho những model chính:

CREATE TABLE IF NOT EXISTS nongsan_suppliers (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT,
    address TEXT,
    credit_limit REAL DEFAULT 0,
    debt_amount REAL DEFAULT 0,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_deleted INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS nongsan_products (
    id TEXT PRIMARY KEY,
    code TEXT,
    name TEXT NOT NULL,
    unit TEXT,
    reference_price REAL DEFAULT 0,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_deleted INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS nongsan_weighing_tickets (
    id TEXT PRIMARY KEY,
    ticket_number TEXT NOT NULL,
    supplier_id TEXT,
    vehicle_plate TEXT,
    driver_name TEXT,
    gross_weight REAL DEFAULT 0,
    tare_weight REAL DEFAULT 0,
    packaging_weight REAL DEFAULT 0,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_deleted INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS nongsan_lots (
    id TEXT PRIMARY KEY,
    lot_id TEXT NOT NULL,
    product_id TEXT,
    supplier_id TEXT,
    warehouse_id TEXT,
    import_date DATETIME,
    initial_quantity REAL DEFAULT 0,
    current_quantity REAL DEFAULT 0,
    cost_price REAL DEFAULT 0,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_deleted INTEGER DEFAULT 0
);
