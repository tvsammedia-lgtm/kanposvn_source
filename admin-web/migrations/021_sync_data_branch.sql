-- Migration 021: Gắn branch_id cho dữ liệu đồng bộ (sync_data)
-- Với mô hình 1 module = nhiều chi nhánh (Gara/VLXD...), mỗi thiết bị push dữ
-- liệu kèm chi nhánh hiện tại để admin "Dashboard hôm nay" tách được theo chi
-- nhánh. Cột branch_id NULL tương thích dữ liệu cũ (trước khi có chi nhánh).

ALTER TABLE sync_data ADD COLUMN IF NOT EXISTS branch_id VARCHAR(100) DEFAULT NULL;

CREATE INDEX IF NOT EXISTS idx_sync_data_branch ON sync_data(branch_id);
CREATE INDEX IF NOT EXISTS idx_sync_data_app_branch ON sync_data(app_code, branch_id);