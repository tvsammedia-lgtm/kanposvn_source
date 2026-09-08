# ĐẶC TẢ ỨNG DỤNG QUẢN LÝ ĐẠI LÝ THU MUA NÔNG – LÂM – THỦY – HẢI SẢN

## 1. Tổng quan

Tên đề xuất: **AgriTrade Manager / KanAgriTrade**

Ứng dụng quản lý đại lý thu mua, sơ chế, nhập kho, xuất bán và phân phối nông sản, lâm sản, thủy sản, hải sản với quy mô tương đương một công ty nhỏ.

### Công nghệ

- **Frontend:** Flutter
- **Database local:** Isar
- **Cloud Database:** Neon PostgreSQL
- **Backend/API:** Vercel Serverless Functions / Node.js / TypeScript
- **Authentication:** JWT + refresh token, phân quyền RBAC
- **Đồng bộ:** Isar ↔ Vercel API ↔ Neon DB
- **Báo cáo:** Flutter + fl_chart
- **PDF/Excel:** xuất báo cáo, phiếu nhập/xuất, công nợ, sổ kế toán
- **QR/Barcode:** mobile_scanner
- **Offline-first:** nghiệp vụ bán hàng, nhập hàng, kho, công nợ và kế toán vẫn hoạt động khi mất Internet.

---

# 2. Mục tiêu nghiệp vụ

Hệ thống quản lý toàn bộ chu trình:

```text
Nhà cung cấp / Người bán
        ↓
Đặt mua / Thu mua
        ↓
Cân hàng / Kiểm phẩm
        ↓
Phiếu nhập mua
        ↓
Kho
        ↓
Sơ chế / Phân loại / Hao hụt
        ↓
Xuất bán
        ↓
Khách hàng
        ↓
Thu tiền / Công nợ
        ↓
Kế toán
        ↓
Doanh thu - Giá vốn - Lãi gộp - Chi phí - Lợi nhuận
```

Hệ thống phải hỗ trợ nhiều nhóm hàng:

- Nông sản
- Lâm sản
- Thủy sản
- Hải sản
- Hàng tươi sống
- Hàng đông lạnh
- Hàng khô
- Hàng đã sơ chế
- Hàng phân loại theo chất lượng/size
- Hàng mua bán theo kg, tấn, tạ, con, bó, kiện, thùng, bao...

---

# 3. Kiến trúc hệ thống

```text
                    ┌─────────────────────┐
                    │      Flutter        │
                    │ Android / Windows   │
                    └──────────┬──────────┘
                               │
                    ┌──────────▼──────────┐
                    │        Isar         │
                    │ Local Offline DB    │
                    └──────────┬──────────┘
                               │ Sync Queue
                               ▼
                    ┌─────────────────────┐
                    │    Vercel API       │
                    │ Auth / Business API │
                    │ Sync / Accounting   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │    Neon PostgreSQL  │
                    │      Cloud DB       │
                    └─────────────────────┘
```

## Nguyên tắc

1. Local-first.
2. Mọi chứng từ có UUID.
3. Không phụ thuộc ID tự tăng của local.
4. Có `created_at`, `updated_at`, `deleted_at`.
5. Có `version` hoặc `updated_at` để đồng bộ.
6. Sync hai chiều.
7. Có hàng đợi `sync_queue`.
8. Có cơ chế retry.
9. Có idempotency để tránh tạo trùng chứng từ.
10. Có nhật ký thao tác.

---

# 4. Phân hệ người dùng

## 4.1 Vai trò

### SUPER_ADMIN

Toàn quyền.

### ADMIN

Quản lý doanh nghiệp.

### KẾ TOÁN

- Chứng từ
- Hạch toán
- Công nợ
- Thu chi
- Báo cáo kế toán
- Khóa sổ

### THỦ KHO

- Nhập kho
- Xuất kho
- Kiểm kê
- Điều chỉnh
- Theo dõi tồn

### NHÂN VIÊN THU MUA

- Nhà cung cấp
- Phiếu cân
- Phiếu thu mua
- Kiểm phẩm
- Nhập mua

### NHÂN VIÊN BÁN HÀNG

- Khách hàng
- Báo giá
- Đơn bán
- Phiếu xuất
- Hóa đơn

### QUẢN LÝ

- Xem báo cáo
- Phê duyệt
- Theo dõi lợi nhuận
- Công nợ
- Kho

---

# 5. Quản lý công ty

- Thông tin doanh nghiệp
- Mã số thuế
- Địa chỉ
- Điện thoại
- Logo
- Năm tài chính
- Kỳ kế toán
- Tiền tệ
- Phương pháp tính giá xuất kho
- Chính sách công nợ
- Danh sách chi nhánh
- Kho
- Quỹ tiền mặt
- Tài khoản ngân hàng

---

# 6. Quản lý nhà cung cấp / người bán

Thông tin:

- Mã nhà cung cấp
- Tên
- Số điện thoại
- Địa chỉ
- CCCD/MST nếu cần
- Khu vực
- Loại nhà cung cấp
- Tài khoản ngân hàng
- Hạn mức công nợ
- Điều khoản thanh toán
- Người liên hệ

Theo dõi:

- Tổng mua
- Đã thanh toán
- Còn nợ
- Tuổi nợ
- Lịch sử giao dịch
- Lịch sử giá mua
- Lịch sử chất lượng hàng

---

# 7. Quản lý khách hàng

- Mã khách hàng
- Tên
- Công ty
- MST
- Địa chỉ
- Điện thoại
- Người liên hệ
- Hạn mức tín dụng
- Thời hạn thanh toán
- Tài khoản ngân hàng

Báo cáo:

- Tổng doanh số
- Đã thu
- Còn phải thu
- Quá hạn
- Lịch sử mua
- Sản phẩm đã mua
- Giá bán
- Lợi nhuận theo khách hàng

---

# 8. Danh mục hàng hóa

## 8.1 Thông tin hàng hóa

- SKU
- Mã hàng
- Tên hàng
- Nhóm hàng
- Loại hàng
- Đơn vị tính
- Đơn vị mua
- Đơn vị bán
- Quy đổi đơn vị
- Thuế suất
- Giá mua tham khảo
- Giá bán tham khảo
- Tài khoản hàng tồn kho
- Tài khoản doanh thu
- Tài khoản giá vốn

## 8.2 Quản lý chất lượng

Cho phép khai báo:

- Loại
- Size
- Cỡ
- Hạng
- Grade
- Độ ẩm
- Tạp chất
- Màu sắc
- Trọng lượng
- Tỷ lệ đạt
- Tỷ lệ hao hụt
- Tiêu chuẩn chất lượng

---

# 9. Thu mua hàng hóa

## 9.1 Đơn mua

Thông tin:

- Nhà cung cấp
- Ngày mua
- Hàng hóa
- Số lượng dự kiến
- Giá dự kiến
- Kho nhập
- Người phụ trách

## 9.2 Phiếu cân

Quản lý:

- Số phiếu
- Xe
- Biển số
- Người giao
- Nhà cung cấp
- Trọng lượng xe vào
- Trọng lượng xe ra
- Trọng lượng bì
- Trọng lượng hàng

Công thức:

```text
Trọng lượng hàng =
Trọng lượng xe có hàng - Trọng lượng xe không hàng
```

## 9.3 Kiểm phẩm

- Độ ẩm
- Tạp chất
- Hàng đạt
- Hàng loại
- Hàng hỏng
- Hao hụt
- Trừ chất lượng
- Giá điều chỉnh

## 9.4 Phiếu nhập mua

```text
Số lượng thực tế
×
Đơn giá mua thực tế
=
Tiền hàng
```

Có thể thêm:

- Phí vận chuyển
- Phí bốc xếp
- Phí sơ chế
- Phí hao hụt
- Chi phí thu mua

Các chi phí liên quan có thể phân bổ vào giá vốn hàng tồn kho.

---

# 10. Quản lý kho

## 10.1 Kho

- Kho nguyên liệu
- Kho thành phẩm
- Kho hàng khô
- Kho đông lạnh
- Kho hải sản
- Kho tạm
- Kho chi nhánh

## 10.2 Nghiệp vụ

- Nhập kho
- Xuất kho
- Chuyển kho
- Kiểm kê
- Điều chỉnh tăng
- Điều chỉnh giảm
- Hủy hàng
- Hàng trả lại
- Nhập lại hàng bán

## 10.3 Theo dõi tồn

Theo:

- Hàng hóa
- Kho
- Lô
- Ngày nhập
- Nhà cung cấp
- Chất lượng
- Size
- Grade

---

# 11. Sơ chế và chế biến

Hỗ trợ:

```text
Nguyên liệu
   ↓
Sơ chế
   ↓
Hao hụt
   ↓
Phân loại
   ↓
Thành phẩm
```

Ví dụ:

```text
1.000 kg nguyên liệu
↓
50 kg hao hụt
↓
950 kg thành phẩm
```

Hệ thống tính:

- Tỷ lệ hao hụt
- Chi phí sơ chế
- Giá thành
- Giá vốn thành phẩm

---

# 12. Bán hàng

## 12.1 Báo giá

- Khách hàng
- Sản phẩm
- Số lượng
- Giá
- Điều khoản
- Thời hạn

## 12.2 Đơn bán

- Khách hàng
- Kho
- Hàng hóa
- Số lượng
- Giá bán
- Chiết khấu
- Thuế
- Phí vận chuyển

## 12.3 Phiếu xuất kho

Tạo từ đơn bán.

## 12.4 Hóa đơn bán hàng

Tính:

```text
Tiền hàng
- Chiết khấu
+ Thuế
+ Phí
=
Tổng thanh toán
```

---

# 13. Hàng bán bị trả lại

Quản lý:

- Khách hàng
- Chứng từ bán hàng gốc
- Sản phẩm
- Số lượng
- Lý do
- Tình trạng hàng
- Nhập lại kho
- Hủy hàng

Đồng thời điều chỉnh:

- Doanh thu
- Giá vốn
- Công nợ
- Thuế
- Lợi nhuận

---

# 14. Công nợ nhà cung cấp

Theo dõi:

```text
Dư đầu kỳ
+ Mua hàng
+ Chi phí phải trả
- Đã thanh toán
- Giảm trừ
=
Dư cuối kỳ
```

Báo cáo:

- Công nợ tổng hợp
- Chi tiết từng nhà cung cấp
- Tuổi nợ
- Nợ đến hạn
- Nợ quá hạn
- Lịch sử thanh toán

---

# 15. Công nợ khách hàng

```text
Dư đầu kỳ
+ Doanh số bán chịu
- Khách hàng thanh toán
- Hàng bán trả lại
- Chiết khấu
=
Dư cuối kỳ
```

Báo cáo:

- Tổng phải thu
- Đã thu
- Còn phải thu
- Nợ quá hạn
- Tuổi nợ
- Theo khách hàng
- Theo nhân viên bán hàng

---

# 16. Quản lý tiền mặt và ngân hàng

## Quỹ

- Phiếu thu
- Phiếu chi
- Tạm ứng
- Hoàn ứng

## Ngân hàng

- Thu tiền
- Chuyển khoản
- Thanh toán nhà cung cấp
- Phí ngân hàng

## Đối chiếu

- Số dư sổ
- Số dư ngân hàng
- Chênh lệch
- Điều chỉnh

---

# 17. Hệ thống kế toán

Thiết kế theo mô hình kế toán doanh nghiệp nhỏ.

## 17.1 Danh mục tài khoản

Cho phép cấu hình hệ thống tài khoản theo chế độ kế toán doanh nghiệp áp dụng.

Ví dụ nhóm tài khoản:

```text
111 - Tiền mặt
112 - Tiền gửi ngân hàng
131 - Phải thu khách hàng
133 - Thuế GTGT được khấu trừ
156 - Hàng hóa
331 - Phải trả người bán
333 - Thuế và các khoản phải nộp
511 - Doanh thu
632 - Giá vốn
641 - Chi phí bán hàng
642 - Chi phí quản lý
515 - Doanh thu tài chính
635 - Chi phí tài chính
711 - Thu nhập khác
811 - Chi phí khác
911 - Xác định kết quả kinh doanh
421 - Lợi nhuận sau thuế chưa phân phối
```

Danh mục tài khoản phải cho phép:

- Thêm
- Sửa
- Ngừng sử dụng
- Tài khoản cha
- Tài khoản con
- Theo dõi đối tượng
- Theo dõi công nợ
- Theo dõi kho
- Theo dõi chi tiết

---

# 18. Bút toán kế toán

## 18.1 Bút toán thủ công

Cho phép nhập:

- Ngày chứng từ
- Số chứng từ
- Diễn giải
- Tài khoản Nợ
- Tài khoản Có
- Số tiền
- Đối tượng
- Khoản mục
- Trung tâm chi phí

Kiểm tra:

```text
Tổng Nợ = Tổng Có
```

Không cho ghi sổ nếu bút toán không cân.

## 18.2 Bút toán tự động

Các nghiệp vụ tạo bút toán tự động.

### Mua hàng

Ví dụ:

```text
Nợ 156
Nợ 133
    Có 331
```

### Thanh toán nhà cung cấp

```text
Nợ 331
    Có 111/112
```

### Bán hàng

```text
Nợ 111/112/131
    Có 511
    Có 333
```

### Giá vốn

```text
Nợ 632
    Có 156
```

### Thu tiền khách hàng

```text
Nợ 111/112
    Có 131
```

### Chi phí

```text
Nợ 641/642
Nợ 133
    Có 111/112/331
```

> Các tài khoản và cách hạch toán phải cho phép doanh nghiệp cấu hình theo chế độ kế toán và chính sách thực tế đang áp dụng.

---

# 19. Sổ kế toán

## Sổ nhật ký

- Nhật ký chung
- Nhật ký thu tiền
- Nhật ký chi tiền
- Nhật ký mua hàng
- Nhật ký bán hàng

## Sổ cái

- Sổ cái từng tài khoản
- Sổ chi tiết tài khoản

## Công nợ

- Sổ chi tiết 131
- Sổ chi tiết 331

## Kho

- Thẻ kho
- Sổ chi tiết hàng hóa
- Nhập - xuất - tồn

---

# 20. Tính giá vốn

Hỗ trợ các phương pháp:

- Bình quân gia quyền
- Bình quân cuối kỳ
- Bình quân sau mỗi lần nhập
- FIFO

Có thể cấu hình phương pháp theo doanh nghiệp.

---

# 21. Tính doanh thu

Báo cáo:

```text
Doanh thu bán hàng
- Hàng bán bị trả lại
- Giảm giá hàng bán
- Chiết khấu
=
Doanh thu thuần
```

Theo:

- Ngày
- Tháng
- Quý
- Năm
- Sản phẩm
- Nhóm hàng
- Khách hàng
- Nhân viên
- Kho
- Chi nhánh

---

# 22. Tính lợi nhuận

## Lợi nhuận gộp

```text
Doanh thu thuần - Giá vốn
```

## Lợi nhuận kinh doanh

```text
Lợi nhuận gộp
+ Doanh thu tài chính
- Chi phí tài chính
- Chi phí bán hàng
- Chi phí quản lý
```

## Kết quả cuối kỳ

```text
Thu nhập khác
- Chi phí khác
+
Lợi nhuận kinh doanh
=
Lợi nhuận trước thuế
```

---

# 23. Báo cáo lãi/lỗ

Dashboard:

- Doanh thu
- Giá vốn
- Lãi gộp
- Chi phí
- Lợi nhuận
- Biên lợi nhuận %
- Công nợ phải thu
- Công nợ phải trả
- Giá trị tồn kho
- Tiền mặt
- Tiền ngân hàng

Biểu đồ:

- Doanh thu theo tháng
- Lợi nhuận theo tháng
- Giá vốn
- Chi phí
- Top hàng hóa
- Top khách hàng
- Top nhà cung cấp

---

# 24. Báo cáo nhập - xuất - tồn

Các cột:

```text
Mã hàng
Tên hàng
Đơn vị
Tồn đầu
Nhập
Xuất
Điều chỉnh
Tồn cuối
Đơn giá
Giá trị tồn
```

Lọc:

- Kho
- Nhóm hàng
- Hàng hóa
- Lô
- Thời gian

---

# 25. Báo cáo mua hàng

- Tổng tiền mua
- Số lượng mua
- Theo nhà cung cấp
- Theo mặt hàng
- Theo nhân viên
- Theo kho
- Giá mua bình quân
- So sánh giá mua

---

# 26. Báo cáo bán hàng

- Doanh số
- Số lượng
- Chiết khấu
- Thuế
- Công nợ
- Lợi nhuận
- Biên lợi nhuận

---

# 27. Báo cáo chi phí

Phân loại:

- Vận chuyển
- Bốc xếp
- Kho bãi
- Điện
- Nước
- Nhân công
- Sơ chế
- Đóng gói
- Bao bì
- Nhiên liệu
- Khấu hao
- Văn phòng
- Bán hàng
- Quản lý
- Chi phí tài chính
- Chi phí khác

---

# 28. Báo cáo tài chính

Hỗ trợ xây dựng:

- Bảng cân đối kế toán
- Báo cáo kết quả hoạt động kinh doanh
- Báo cáo lưu chuyển tiền tệ
- Bảng cân đối số phát sinh
- Thuyết minh báo cáo
- Sổ nhật ký chung
- Sổ cái
- Sổ chi tiết

Các biểu mẫu phải cho phép cấu hình theo chế độ kế toán và quy định doanh nghiệp đang áp dụng.

---

# 29. Định khoản tự động theo nghiệp vụ

Mỗi loại chứng từ có cấu hình:

```text
document_type
debit_account
credit_account
tax_account
inventory_account
receivable_account
payable_account
```

Ví dụ:

```text
PURCHASE
→ Inventory + Input Tax + Payable

SALE
→ Cash/Receivable + Revenue + Output Tax

COGS
→ Cost of Goods Sold + Inventory

RECEIPT
→ Cash/Bank + Receivable

PAYMENT
→ Payable + Cash/Bank
```

Cho phép kế toán sửa cấu hình trước khi áp dụng.

---

# 30. Khóa sổ kế toán

Theo:

- Ngày
- Tháng
- Quý
- Năm

Khi khóa:

- Không sửa chứng từ cũ
- Không xóa chứng từ
- Chỉ cho phép lập chứng từ điều chỉnh
- Lưu nhật ký thay đổi

Chỉ ADMIN/KẾ TOÁN TRƯỞNG được mở khóa.

---

# 31. Kiểm kê kho

Quy trình:

```text
Tạo phiếu kiểm kê
↓
Nhập số lượng thực tế
↓
So sánh tồn sổ
↓
Tính chênh lệch
↓
Phê duyệt
↓
Tạo phiếu điều chỉnh
↓
Sinh bút toán
```

---

# 32. Quản lý phương tiện

Theo dõi xe giao nhận:

- Biển số
- Tài xế
- Loại xe
- Trọng tải
- Nhà vận chuyển
- Chi phí chuyến
- Km
- Nhiên liệu

Có thể liên kết xe với:

- Phiếu cân
- Phiếu nhập
- Phiếu xuất
- Đơn hàng
- Chi phí vận chuyển

---

# 33. Quản lý lô hàng

Mỗi lô:

- Lot ID
- Ngày nhập
- Nhà cung cấp
- Kho
- Hàng hóa
- Số lượng
- Giá vốn
- Chất lượng
- Hạn sử dụng nếu có

Hỗ trợ truy xuất:

```text
Nhà cung cấp
→ Lô hàng
→ Kho
→ Xuất bán
→ Khách hàng
```

---

# 34. Dashboard quản trị

## KPI

```text
Doanh thu hôm nay
Doanh thu tháng
Giá vốn
Lợi nhuận
Tồn kho
Phải thu
Phải trả
Tiền mặt
Ngân hàng
```

## Cảnh báo

- Công nợ quá hạn
- Tồn kho thấp
- Hàng tồn lâu ngày
- Giá vốn tăng
- Giá bán thấp
- Lợi nhuận âm
- Hàng hỏng
- Hao hụt vượt định mức
- Nhà cung cấp có giá tăng mạnh
- Khách hàng vượt hạn mức tín dụng

---

# 35. Mô hình dữ liệu Isar

Các collection chính:

```text
User
Role
Permission
Company
Branch
Warehouse
Supplier
Customer
Product
ProductCategory
ProductUnit
ProductQuality
ProductLot
PurchaseOrder
PurchaseReceipt
WeighingTicket
QualityInspection
StockReceipt
StockIssue
StockTransfer
StockAdjustment
StockTake
ProcessingOrder
SalesOrder
SalesInvoice
SalesReturn
PurchaseReturn
PaymentReceipt
PaymentVoucher
BankTransaction
Expense
AccountingAccount
JournalEntry
JournalEntryLine
CostCenter
Tax
SyncQueue
AuditLog
AppSetting
```

---

# 36. Mô hình Neon PostgreSQL

Các bảng cloud tương ứng với Isar.

Mọi bảng nghiệp vụ nên có:

```text
id UUID PRIMARY KEY
company_id UUID
branch_id UUID
created_at TIMESTAMPTZ
updated_at TIMESTAMPTZ
deleted_at TIMESTAMPTZ NULL
version BIGINT
created_by UUID
updated_by UUID
device_id TEXT
sync_status TEXT
```

Các bảng chi tiết dùng khóa:

```text
id UUID
header_id UUID
product_id UUID
quantity NUMERIC
unit_price NUMERIC
amount NUMERIC
```

Không sử dụng `double` cho tiền trong database.

Dùng:

```text
NUMERIC(18,2)
```

hoặc độ chính xác cao hơn nếu cần cho số lượng.

---

# 37. Sync Engine

## Local → Cloud

```text
Isar transaction
↓
sync_queue
↓
API
↓
Neon PostgreSQL
```

## Cloud → Local

```text
GET /sync/pull?cursor=...
↓
API
↓
Isar
```

## Endpoint đề xuất

```text
POST /api/auth/login
POST /api/auth/refresh

GET  /api/sync/pull
POST /api/sync/push

GET  /api/products
GET  /api/customers
GET  /api/suppliers

POST /api/purchases
POST /api/sales

POST /api/inventory/receipt
POST /api/inventory/issue
POST /api/inventory/transfer

POST /api/accounting/journal
GET  /api/accounting/ledger

GET /api/reports/sales
GET /api/reports/purchase
GET /api/reports/inventory
GET /api/reports/receivable
GET /api/reports/payable
GET /api/reports/profit-loss
GET /api/reports/balance-sheet
```

---

# 38. Đồng bộ xung đột

Ưu tiên:

1. Chứng từ đã ghi sổ không tự động ghi đè.
2. Dữ liệu danh mục dùng `updated_at`.
3. Chứng từ tài chính dùng trạng thái:
   - DRAFT
   - POSTED
   - CANCELLED
   - LOCKED
4. Nếu hai thiết bị sửa cùng chứng từ:
   - phát hiện conflict
   - tạo `SyncConflict`
   - cho người có quyền xử lý.

---

# 39. API Security

- HTTPS
- JWT
- Refresh token
- Password hashing
- Role-based authorization
- Rate limiting
- Validate request
- UUID
- Idempotency key
- Audit log
- Không trả SQL trực tiếp ra client
- Không để Neon credentials trong Flutter
- Secret chỉ nằm ở Vercel Environment Variables.

---

# 40. Phân quyền dữ liệu

Mỗi người dùng có thể bị giới hạn:

```text
Company
 └── Branch
      └── Warehouse
           └── Data
```

Ví dụ:

- Nhân viên kho chỉ xem kho được cấp quyền.
- Nhân viên mua hàng chỉ tạo phiếu mua.
- Kế toán xem và hạch toán.
- Quản lý xem toàn bộ báo cáo.
- Admin quản lý cấu hình.

---

# 41. Màn hình Flutter

## Dashboard

```text
Trang chủ
├── Doanh thu
├── Lợi nhuận
├── Tồn kho
├── Công nợ
├── Thu chi
└── Cảnh báo
```

## Thu mua

```text
Nhà cung cấp
Đơn mua
Phiếu cân
Kiểm phẩm
Phiếu nhập
Trả hàng mua
```

## Kho

```text
Tồn kho
Nhập kho
Xuất kho
Chuyển kho
Kiểm kê
Điều chỉnh
Lô hàng
Sơ chế
```

## Bán hàng

```text
Khách hàng
Báo giá
Đơn bán
Phiếu xuất
Hóa đơn
Trả hàng
```

## Tài chính

```text
Thu tiền
Chi tiền
Công nợ
Ngân hàng
Chi phí
```

## Kế toán

```text
Hệ thống tài khoản
Bút toán
Nhật ký chung
Sổ cái
Sổ chi tiết
Khóa sổ
```

## Báo cáo

```text
Doanh thu
Mua hàng
Bán hàng
Nhập-Xuất-Tồn
Công nợ
Chi phí
Lãi/Lỗ
Bảng cân đối
Kết quả kinh doanh
Lưu chuyển tiền tệ
```

---

# 42. Quy trình nhập hàng mẫu

```text
Nhà cung cấp
↓
Tạo phiếu cân
↓
Cân lần 1
↓
Cân lần 2
↓
Tính trọng lượng
↓
Kiểm phẩm
↓
Tính giá mua
↓
Phiếu nhập kho
↓
Công nợ 331
↓
Bút toán kế toán
```

---

# 43. Quy trình bán hàng mẫu

```text
Khách hàng
↓
Đơn bán
↓
Duyệt đơn
↓
Xuất kho
↓
Hóa đơn
↓
Ghi nhận doanh thu
↓
Ghi nhận giá vốn
↓
Công nợ 131
↓
Thu tiền
↓
Bút toán
```

---

# 44. Tính giá trị tồn kho

```text
Tồn đầu
+ Nhập
- Xuất
± Điều chỉnh
=
Tồn cuối
```

Giá trị:

```text
Số lượng tồn × Giá vốn
```

Giá vốn phải được tính nhất quán với phương pháp doanh nghiệp lựa chọn.

---

# 45. Báo cáo quản trị nâng cao

## Lợi nhuận theo mặt hàng

```text
Doanh thu
- Giá vốn
- Chi phí trực tiếp
=
Lợi nhuận
```

## Lợi nhuận theo khách hàng

Xác định khách hàng mang lại lợi nhuận cao/thấp.

## Lợi nhuận theo nhà cung cấp

So sánh:

- Giá mua
- Chất lượng
- Hao hụt
- Chi phí thu mua
- Giá bán đầu ra
- Lợi nhuận.

## Phân tích giá

Theo dõi:

```text
Giá mua hôm qua
Giá mua hôm nay
Giá mua bình quân
Giá bán
Biên lợi nhuận
```

---

# 46. Xuất Excel/PDF

Cho phép xuất:

- Phiếu nhập
- Phiếu xuất
- Phiếu cân
- Hóa đơn
- Công nợ
- Nhập xuất tồn
- Doanh thu
- Lãi lỗ
- Sổ cái
- Nhật ký chung
- Báo cáo tài chính

Bộ lọc:

```text
Từ ngày
Đến ngày
Kho
Chi nhánh
Khách hàng
Nhà cung cấp
Hàng hóa
Nhân viên
```

---

# 47. Nhật ký audit

Lưu:

```text
user_id
device_id
action
module
record_id
old_data
new_data
timestamp
ip
```

Theo dõi:

- Ai tạo
- Ai sửa
- Ai xóa
- Ai duyệt
- Ai hủy
- Ai ghi sổ
- Ai khóa sổ

---

# 48. Trạng thái chứng từ

Chuẩn hóa:

```text
DRAFT
PENDING
APPROVED
POSTED
PAID
PARTIAL
CANCELLED
LOCKED
```

Không cho xóa chứng từ đã POSTED.

---

# 49. Quy tắc kế toán quan trọng

Mọi nghiệp vụ tài chính phải có liên kết:

```text
Business Document
        ↓
Accounting Event
        ↓
Journal Entry
        ↓
Journal Entry Lines
        ↓
General Ledger
        ↓
Reports
```

Không nên cho phép báo cáo kế toán lấy dữ liệu trực tiếp từ màn hình bán hàng/mua hàng mà bỏ qua sổ nhật ký.

---

# 50. Nguyên tắc số liệu

- Tiền: `Decimal/Numeric`
- Số lượng: Decimal
- Không dùng floating point để tính tiền.
- Làm tròn theo cấu hình.
- Lưu nguyên giá trị chứng từ.
- Không sửa trực tiếp chứng từ đã ghi sổ.
- Điều chỉnh bằng chứng từ mới.
- Báo cáo phải có thời điểm chạy.
- Báo cáo kế toán phải dựa trên dữ liệu đã POSTED.

---

# 51. Cấu trúc thư mục Flutter

```text
lib/
├── core/
│   ├── constants/
│   ├── database/
│   ├── network/
│   ├── sync/
│   ├── security/
│   ├── utils/
│   └── errors/
│
├── models/
│
├── features/
│   ├── auth/
│   ├── dashboard/
│   ├── suppliers/
│   ├── customers/
│   ├── products/
│   ├── purchasing/
│   ├── weighing/
│   ├── quality/
│   ├── inventory/
│   ├── processing/
│   ├── sales/
│   ├── payments/
│   ├── banking/
│   ├── accounting/
│   ├── reports/
│   └── settings/
│
├── repositories/
├── services/
├── providers/
└── main.dart
```

---

# 52. Kiến trúc Repository

Ví dụ:

```text
ProductRepository
 ├── getLocal()
 ├── saveLocal()
 ├── create()
 ├── update()
 ├── delete()
 └── sync()

PurchaseRepository
SalesRepository
InventoryRepository
AccountingRepository
ReportRepository
```

UI không truy cập trực tiếp Isar hoặc HTTP.

---

# 53. Transaction nghiệp vụ

Các nghiệp vụ quan trọng phải dùng transaction.

Ví dụ bán hàng:

```text
BEGIN

Create Sales Invoice
Create Stock Issue
Decrease Inventory
Create COGS
Create Receivable
Create Journal Entry

COMMIT
```

Nếu một bước lỗi:

```text
ROLLBACK
```

Ở local và server phải có cơ chế đảm bảo tính nhất quán.

---

# 54. Offline

Khi mất Internet:

```text
User
 ↓
Flutter
 ↓
Isar
 ↓
Sync Queue
```

Người dùng vẫn có thể:

- Nhập hàng
- Xuất hàng
- Bán hàng
- Thu tiền
- Chi tiền
- Kiểm kê
- Xem báo cáo local

Khi có mạng:

```text
Sync Queue
↓
Vercel
↓
Neon
```

---

# 55. Backup

## Local

- Export database
- Backup định kỳ
- Khôi phục dữ liệu

## Cloud

- Neon backup
- Soft delete
- Audit log
- Versioning

---

# 56. Quy mô nhiều thiết bị

Ví dụ:

```text
Máy chủ / Cloud
      │
 ┌────┼────┬────┐
 │    │    │    │
PC   Android Android Laptop
 │    │    │    │
Isar Isar Isar Isar
```

Tất cả đồng bộ qua:

```text
Vercel API
      ↓
Neon PostgreSQL
```

Không cho client Flutter kết nối trực tiếp Neon.

---

# 57. Giai đoạn phát triển

## Phase 1 — Core

- Authentication
- Company
- User
- Role
- Isar
- Neon
- Vercel API
- Sync

## Phase 2 — Danh mục

- Hàng hóa
- Khách hàng
- Nhà cung cấp
- Kho
- Đơn vị tính

## Phase 3 — Thu mua

- Phiếu cân
- Kiểm phẩm
- Nhập mua
- Công nợ nhà cung cấp

## Phase 4 — Kho

- Nhập
- Xuất
- Chuyển
- Kiểm kê
- Tồn kho
- Lô hàng

## Phase 5 — Bán hàng

- Đơn hàng
- Xuất kho
- Hóa đơn
- Trả hàng
- Công nợ khách hàng

## Phase 6 — Tài chính

- Thu
- Chi
- Ngân hàng
- Chi phí

## Phase 7 — Kế toán

- Hệ thống tài khoản
- Bút toán
- Nhật ký
- Sổ cái
- Khóa sổ

## Phase 8 — Báo cáo

- Doanh thu
- Giá vốn
- Nhập xuất tồn
- Công nợ
- Lãi lỗ
- Báo cáo tài chính

## Phase 9 — Nâng cao

- Sơ chế
- Giá thành
- Quản lý lô
- Phân tích lợi nhuận
- Cảnh báo
- Dashboard quản trị

---

# 58. Tiêu chí nghiệm thu

Hệ thống được xem là hoàn thành khi:

- [ ] Có đăng nhập và phân quyền.
- [ ] Hoạt động offline.
- [ ] Đồng bộ Isar ↔ Vercel ↔ Neon.
- [ ] Quản lý nhà cung cấp.
- [ ] Quản lý khách hàng.
- [ ] Quản lý hàng hóa.
- [ ] Quản lý kho.
- [ ] Có phiếu cân.
- [ ] Có kiểm phẩm.
- [ ] Có nhập mua.
- [ ] Có bán hàng.
- [ ] Có xuất kho.
- [ ] Có trả hàng.
- [ ] Có công nợ 131.
- [ ] Có công nợ 331.
- [ ] Có thu/chi.
- [ ] Có tài khoản kế toán.
- [ ] Có bút toán tự động.
- [ ] Có bút toán thủ công.
- [ ] Có nhật ký chung.
- [ ] Có sổ cái.
- [ ] Có nhập xuất tồn.
- [ ] Có tính giá vốn.
- [ ] Có doanh thu.
- [ ] Có chi phí.
- [ ] Có lợi nhuận.
- [ ] Có báo cáo lãi/lỗ.
- [ ] Có báo cáo tài chính.
- [ ] Có khóa sổ.
- [ ] Có audit log.
- [ ] Có export Excel/PDF.
- [ ] Có xử lý xung đột đồng bộ.
- [ ] Không để lộ Neon credentials trong Flutter.

---

# 59. Gợi ý package Flutter

```yaml
dependencies:
  flutter:
  flutter_riverpod:
  isar:
  isar_flutter_libs:
  http:
  intl:
  uuid:
  path_provider:
  shared_preferences:
  fl_chart:
  file_picker:
  mobile_scanner:
  pdf:
  printing:
  excel:
```

Có thể bổ sung:

- freezed/json_serializable cho model
- go_router cho routing
- connectivity_plus cho trạng thái mạng
- internet_connection_checker_plus cho kiểm tra Internet
- crypto cho các chức năng mã hóa phù hợp

---

# 60. Nguyên tắc thiết kế cuối cùng

Ứng dụng phải được thiết kế như một **ERP mini chuyên ngành thu mua nông – lâm – thủy – hải sản**, không chỉ là phần mềm bán hàng.

Ba lớp dữ liệu phải tách biệt:

```text
1. Nghiệp vụ
   Mua - Bán - Kho - Công nợ

2. Tài chính
   Thu - Chi - Ngân hàng - Chi phí

3. Kế toán
   Chứng từ - Bút toán - Sổ cái - Báo cáo
```

Luồng chuẩn:

```text
NGHIỆP VỤ
   ↓
CHỨNG TỪ
   ↓
KHO / CÔNG NỢ
   ↓
BÚT TOÁN
   ↓
SỔ CÁI
   ↓
BÁO CÁO
   ↓
DOANH THU - GIÁ VỐN - CHI PHÍ - LỢI NHUẬN
```

Đây là nền tảng phù hợp để phát triển ứng dụng Flutter + Isar + Vercel API + Neon PostgreSQL có khả năng mở rộng từ đại lý nhỏ lên doanh nghiệp nhiều kho/nhiều chi nhánh.
