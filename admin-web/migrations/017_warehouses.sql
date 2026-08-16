-- Migration 017: Mô hình KHO đa chi nhánh (Warehouse = thực thể độc lập thuộc Customer)
-- Theo đề xuất: Customer → Branch → Warehouse → Stock.
--   - Kho thuộc Customer; kho của chi nhánh có branch_id; kho trung tâm có branch_id = NULL (warehouse_type = 'CENTRAL').
--   - 1 chi nhánh có thể có NHIỀU kho (Kho bán hàng, Kho hàng hóa, Kho phụ...).
--   - Product thuộc Customer (dùng chung mọi chi nhánh); số lượng tồn thuộc Warehouse (tồn riêng từng kho).
--   - MỌI thay đổi tồn đều qua stock_transactions / phiếu chuyển kho (stock_transfers) — KHÔNG sửa trực tiếp số lượng tồn.
-- Chỉ THÊM MỚI, không đụng bảng/API cũ.

-- 1. Bảng warehouses: Kho. branch_id NULL = Kho trung tâm (CENTRAL).
CREATE TABLE IF NOT EXISTS warehouses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  branch_id UUID REFERENCES branches(id) ON DELETE SET NULL,
  warehouse_code VARCHAR(32) DEFAULT '',
  warehouse_name VARCHAR(255) NOT NULL DEFAULT '',
  warehouse_type VARCHAR(20) NOT NULL DEFAULT 'BRANCH', -- CENTRAL | BRANCH
  is_default BOOLEAN NOT NULL DEFAULT false,
  status VARCHAR(20) NOT NULL DEFAULT 'active',         -- active | inactive
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_warehouses_customer ON warehouses(customer_id);
CREATE INDEX IF NOT EXISTS idx_warehouses_branch ON warehouses(branch_id);
CREATE INDEX IF NOT EXISTS idx_warehouses_default ON warehouses(customer_id, is_default);
CREATE UNIQUE INDEX IF NOT EXISTS idx_warehouses_customer_code ON warehouses(customer_id, warehouse_code) WHERE warehouse_code <> '';

-- 2. Bảng products: sản phẩm thuộc Customer (dùng chung mọi chi nhánh / kho).
CREATE TABLE IF NOT EXISTS products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  product_code VARCHAR(64) DEFAULT '',
  name VARCHAR(255) NOT NULL DEFAULT '',
  unit VARCHAR(50) DEFAULT '',
  price NUMERIC(18,2) NOT NULL DEFAULT 0,
  active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_products_customer ON products(customer_id);
CREATE UNIQUE INDEX IF NOT EXISTS idx_products_customer_code ON products(customer_id, product_code) WHERE product_code <> '';

-- 3. Bảng warehouse_stock: tồn kho theo TỪNG KHO (không theo app_code).
CREATE TABLE IF NOT EXISTS warehouse_stock (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  warehouse_id UUID NOT NULL REFERENCES warehouses(id) ON DELETE CASCADE,
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  quantity NUMERIC(18,3) NOT NULL DEFAULT 0 CHECK (quantity >= 0),
  min_quantity NUMERIC(18,3) NOT NULL DEFAULT 0,
  max_quantity NUMERIC(18,3) NOT NULL DEFAULT 0,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(warehouse_id, product_id)
);

CREATE INDEX IF NOT EXISTS idx_warehouse_stock_warehouse ON warehouse_stock(warehouse_id);
CREATE INDEX IF NOT EXISTS idx_warehouse_stock_product ON warehouse_stock(product_id);

-- 4. Bảng stock_transactions: mọi biến động tồn (nhập/xuất/điều chỉnh/chuyển/bán).
--    quantity luôn DƯƠNG; hướng xuất/nhập thể hiện qua tx_type.
CREATE TABLE IF NOT EXISTS stock_transactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  warehouse_id UUID NOT NULL REFERENCES warehouses(id) ON DELETE CASCADE,
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  tx_type VARCHAR(20) NOT NULL DEFAULT 'ADJUSTMENT', -- IMPORT | EXPORT | ADJUSTMENT | TRANSFER_IN | TRANSFER_OUT | SALE
  quantity NUMERIC(18,3) NOT NULL DEFAULT 0 CHECK (quantity > 0),
  ref_type VARCHAR(30) DEFAULT '',   -- INVOICE | STOCK_TRANSFER | PURCHASE ...
  ref_id VARCHAR(64) DEFAULT '',
  note TEXT DEFAULT '',
  created_by UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_stock_tx_warehouse ON stock_transactions(warehouse_id);
CREATE INDEX IF NOT EXISTS idx_stock_tx_product ON stock_transactions(product_id);
CREATE INDEX IF NOT EXISTS idx_stock_tx_customer_created ON stock_transactions(customer_id, created_at);

-- 5. Bảng stock_transfers: PHIẾU CHUYỂN KHO (hàng đang vận chuyển).
--    Trạng thái: DRAFT → CONFIRMED → SHIPPING → RECEIVED (hoặc CANCELLED).
--    Không được sửa trực tiếp số lượng tồn; mọi chuyển kho đều qua phiếu này.
CREATE TABLE IF NOT EXISTS stock_transfers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  transfer_code VARCHAR(32) DEFAULT '',
  from_warehouse_id UUID NOT NULL REFERENCES warehouses(id) ON DELETE RESTRICT,
  to_warehouse_id UUID NOT NULL REFERENCES warehouses(id) ON DELETE RESTRICT,
  status VARCHAR(20) NOT NULL DEFAULT 'DRAFT', -- DRAFT | CONFIRMED | SHIPPING | RECEIVED | CANCELLED
  note TEXT DEFAULT '',
  created_by UUID REFERENCES users(id) ON DELETE SET NULL,
  confirmed_at TIMESTAMP WITH TIME ZONE,
  shipped_at TIMESTAMP WITH TIME ZONE,
  received_at TIMESTAMP WITH TIME ZONE,
  cancelled_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  CHECK (from_warehouse_id <> to_warehouse_id)
);

CREATE INDEX IF NOT EXISTS idx_stock_transfers_customer ON stock_transfers(customer_id);
CREATE INDEX IF NOT EXISTS idx_stock_transfers_from ON stock_transfers(from_warehouse_id);
CREATE INDEX IF NOT EXISTS idx_stock_transfers_to ON stock_transfers(to_warehouse_id);

CREATE TABLE IF NOT EXISTS stock_transfer_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  transfer_id UUID NOT NULL REFERENCES stock_transfers(id) ON DELETE CASCADE,
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  quantity NUMERIC(18,3) NOT NULL DEFAULT 0 CHECK (quantity > 0),
  UNIQUE(transfer_id, product_id)
);

CREATE INDEX IF NOT EXISTS idx_stock_transfer_items_transfer ON stock_transfer_items(transfer_id);

-- 6. Backfill: tạo Kho mặc định "Kho chính" cho TỪNG chi nhánh hiện có
--    (mã W001, W002... tuần tự theo từng customer — đồng bộ logic ensureDefaultWarehouse).
INSERT INTO warehouses (customer_id, branch_id, warehouse_code, warehouse_name, warehouse_type, is_default, status)
SELECT
  b.customer_id,
  b.id,
  'W' || lpad(row_number() OVER (PARTITION BY b.customer_id ORDER BY b.created_at, b.id)::text, 3, '0'),
  b.name || ' - Kho chính',
  'BRANCH',
  true,
  'active'
FROM branches b
WHERE NOT EXISTS (SELECT 1 FROM warehouses w WHERE w.branch_id = b.id);
