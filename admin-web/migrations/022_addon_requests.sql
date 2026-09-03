-- Migration 022: Yêu cầu thêm module / chi nhánh cho user đã tồn tại
-- Luồng: user đăng nhập (trang admin-web) gửi yêu cầu 'mua thêm module/chi nhánh'
--        -> admin duyệt trong admin-web & kanposvnCRM.
-- Khi admin duyệt (chọn gói trial/yearly/forever), tạo branch + license + quyền Manager
-- cho module/chi nhánh mới.

CREATE TABLE IF NOT EXISTS addon_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  -- JSON: { modules: [ { app_code, branches: [ {name, phone, address} ] } ] }
  payload TEXT NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'pending', -- pending | approved | rejected
  plan VARCHAR(20) DEFAULT 'trial',              -- gói admin chọn khi duyệt
  requested_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  resolved_at TIMESTAMP WITH TIME ZONE,
  resolved_by VARCHAR(100),
  note TEXT DEFAULT ''
);

CREATE INDEX IF NOT EXISTS idx_addon_requests_user ON addon_requests(user_id);
CREATE INDEX IF NOT EXISTS idx_addon_requests_status ON addon_requests(status);
