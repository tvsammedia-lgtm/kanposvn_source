# ĐẶC TẢ ỨNG DỤNG QUẢN LÝ SẠP CHỢ RAU – CỦ – QUẢ

## 1. Mục tiêu

Xây dựng ứng dụng Flutter quản lý sạp chợ truyền thống chuyên kinh doanh rau, củ, quả, hoạt động **offline-first 100%** tại thiết bị và đồng bộ dữ liệu lên **Neon PostgreSQL thông qua Vercel API** khi có Internet.

Ứng dụng phải phù hợp với đặc thù hàng nông sản:

- Bán theo kg, gram, bó, túi, quả, củ, thùng, bao...
- Giá nhập thay đổi thường xuyên.
- Giá bán có thể thay đổi theo ngày/khách hàng.
- Hàng dễ hư hỏng, có hạn sử dụng/thời gian bảo quản.
- Có hao hụt, hư hỏng, dập úng.
- Quản lý nhập – xuất – tồn.
- Quản lý công nợ khách hàng và nhà cung cấp.
- Quản lý khách hàng thân thiết và điểm thưởng.
- Theo dõi doanh thu, chi phí, lãi/lỗ.
- Báo cáo tổng hợp và chi tiết.
- In/xuất PDF các báo cáo và chứng từ thanh toán.

---

# 2. Công nghệ

## Mobile/Desktop

- Flutter
- Dart
- Android
- Windows
- Có thể mở rộng iOS

## Local Database

- Isar
- Offline-first
- UUID cho ID bản ghi
- Soft delete
- Audit fields

## Cloud Database

- Neon PostgreSQL

## Backend API

- Vercel Serverless Functions / Vercel API
- REST API
- JSON
- HTTPS
- JWT hoặc token/session phù hợp

## State Management

Khuyến nghị:

- Riverpod

## PDF

Khuyến nghị:

- `pdf`
- `printing`

## File/Export

- PDF
- CSV/Excel ở giai đoạn mở rộng

---

# 3. Nguyên tắc kiến trúc

```text
Flutter App
    |
    +-- UI
    |
    +-- Riverpod
    |
    +-- Repository
    |
    +-- Isar Local DB
    |
    +-- Sync Engine
            |
            v
        Vercel API
            |
            v
       Neon PostgreSQL
```

## Offline-first

Mọi nghiệp vụ bán hàng, nhập hàng, thu tiền, chi tiền, cập nhật tồn kho phải thực hiện được khi mất Internet.

Không được bắt người dùng chờ server khi:

- Tạo hóa đơn
- Nhập hàng
- Thu tiền
- Chi tiền
- Ghi công nợ
- Cập nhật khách hàng
- Cập nhật sản phẩm
- Ghi hao hụt

Sau khi có Internet, Sync Engine tự động đồng bộ.

---

# 4. Đối tượng hàng hóa

Danh mục mẫu:

- Cải xanh
- Cải ngọt
- Cải thìa
- Bắp cải
- Khoai lang
- Khoai sọ
- Rau má
- Dưa leo
- Củ tỏi
- Cà chua
- Cà tím
- Hành lá
- Hành củ
- Tỏi
- Su hào
- Rau muống
- Đậu cô ve
- Đậu đũa
- Các loại rau/củ/quả khác

Không hard-code danh sách trên.

Người dùng phải có thể:

- Thêm
- Sửa
- Xóa/ngừng kinh doanh
- Phân loại
- Đặt đơn vị tính
- Đặt giá nhập
- Đặt giá bán
- Đặt tồn tối thiểu
- Đặt tồn tối đa
- Đặt thời gian bảo quản/hạn sử dụng

---

# 5. Đơn vị tính

Hỗ trợ:

- kg
- gram
- bó
- túi
- quả
- củ
- thùng
- bao
- rổ
- khay
- cái

Cho phép quy đổi.

Ví dụ:

```text
1 bao = 25 kg
1 thùng = 10 kg
1 bó = 0.5 kg
```

Phải lưu đơn vị gốc để tính tồn kho chính xác.

---

# 6. Quản lý sản phẩm

## Product

Các trường chính:

```text
id
sku
barcode
name
categoryId
baseUnit
purchaseUnit
saleUnit
conversionRate
defaultPurchasePrice
defaultSalePrice
minStock
maxStock
reorderLevel
shelfLifeDays
isPerishable
isActive
createdAt
updatedAt
deletedAt
syncStatus
deviceId
version
```

## Đặc thù hàng nông sản

Cho phép:

- Giá nhập theo từng lô.
- Giá bán theo từng thời điểm.
- Tính giá vốn theo lô.
- Ghi nhận hao hụt.
- Ghi nhận hàng hư hỏng.
- Ghi nhận hàng trả lại.
- Theo dõi ngày nhập.
- Theo dõi hạn sử dụng/thời gian bảo quản.

---

# 7. Quản lý nhà cung cấp

## Supplier

```text
id
code
name
phone
address
taxCode
note
openingDebt
currentDebt
totalPurchase
totalPayment
createdAt
updatedAt
syncStatus
```

Chức năng:

- Danh sách nhà cung cấp
- Chi tiết nhà cung cấp
- Lịch sử nhập hàng
- Công nợ
- Thanh toán
- Lịch sử thanh toán
- Đối chiếu công nợ

---

# 8. Quản lý khách hàng

## Customer

```text
id
code
name
phone
address
customerType
openingDebt
currentDebt
totalPurchase
totalPayment
loyaltyPoint
loyaltyRank
createdAt
updatedAt
syncStatus
```

Phân loại:

- Khách lẻ
- Khách quen
- Quán ăn
- Nhà hàng
- Quán nước
- Cửa hàng
- Khách sỉ
- Đại lý

---

# 9. Hệ thống điểm thưởng

## Mục tiêu

Khuyến khích khách hàng quay lại mua hàng.

## LoyaltyRule

```text
id
ruleName
amountPerPoint
pointPerAmount
minimumInvoice
isActive
```

Ví dụ:

```text
100.000 VNĐ = 1 điểm
1 điểm = 1.000 VNĐ
```

Có thể cấu hình:

- Điểm khi mua hàng.
- Điểm khi thanh toán đủ.
- Điểm thưởng sinh nhật.
- Điểm thưởng chương trình đặc biệt.
- Điểm đổi quà.
- Điểm trừ khi hoàn hàng.

## LoyaltyTransaction

```text
id
customerId
invoiceId
type
points
balanceAfter
description
createdAt
syncStatus
```

Các loại:

```text
EARN
REDEEM
ADJUST
EXPIRE
REFUND
```

Không được sửa trực tiếp lịch sử điểm; phải tạo transaction điều chỉnh.

---

# 10. Quản lý nhập hàng

## PurchaseInvoice

```text
id
invoiceNumber
supplierId
purchaseDate
totalAmount
discount
paidAmount
debtAmount
paymentMethod
note
createdAt
updatedAt
syncStatus
```

## PurchaseItem

```text
id
purchaseInvoiceId
productId
lotId
quantity
unit
unitPrice
discount
amount
expiryDate
createdAt
```

Quy trình:

```text
Chọn nhà cung cấp
        ↓
Thêm hàng
        ↓
Nhập số lượng
        ↓
Nhập giá
        ↓
Nhập hạn sử dụng
        ↓
Tính tiền
        ↓
Thanh toán
        ↓
Tạo công nợ nếu chưa trả đủ
        ↓
Cộng tồn kho
```

---

# 11. Quản lý bán hàng

## SalesInvoice

```text
id
invoiceNumber
customerId
saleDate
subtotal
discount
loyaltyDiscount
totalAmount
paidAmount
debtAmount
paymentMethod
status
note
createdAt
updatedAt
syncStatus
```

## SalesItem

```text
id
salesInvoiceId
productId
lotId
quantity
unit
unitPrice
costPrice
discount
amount
createdAt
```

Khi bán hàng:

```text
Tồn kho giảm
       +
Doanh thu tăng
       +
Tiền mặt/tài khoản tăng
       hoặc
Công nợ khách hàng tăng
       +
Điểm thưởng tăng
       +
Giá vốn được ghi nhận
```

---

# 12. Quản lý xuất kho

Các loại xuất:

- Xuất bán hàng
- Xuất trả nhà cung cấp
- Xuất hao hụt
- Xuất hư hỏng
- Xuất sử dụng nội bộ
- Xuất điều chỉnh

## StockIssue

```text
id
issueNumber
issueType
date
note
totalCost
createdAt
syncStatus
```

---

# 13. Quản lý tồn kho

## StockLot

```text
id
productId
lotNumber
purchaseDate
expiryDate
quantityIn
quantityOut
quantityRemaining
unitCost
supplierId
createdAt
updatedAt
```

## StockMovement

```text
id
productId
lotId
movementType
referenceId
quantity
unitCost
totalCost
createdAt
syncStatus
```

Các movement:

```text
PURCHASE
SALE
SALE_RETURN
PURCHASE_RETURN
DAMAGE
WASTE
ADJUSTMENT_IN
ADJUSTMENT_OUT
INTERNAL_USE
```

---

# 14. Tính giá vốn

Khuyến nghị hỗ trợ:

## FIFO

Hàng nhập trước được xuất trước.

Ví dụ:

```text
Ngày 01:
10 kg cà chua × 15.000 = 150.000

Ngày 02:
20 kg cà chua × 18.000 = 360.000

Ngày 03 bán:
15 kg
```

Giá vốn:

```text
10 kg × 15.000
+
5 kg × 18.000
=
240.000
```

Hệ thống phải lưu giá vốn thực tế của từng dòng bán.

Không tính lại lịch sử bằng giá nhập hiện tại.

---

# 15. Hao hụt và hư hỏng

Hàng rau củ có thể:

- Dập
- Héo
- Úng
- Mốc
- Hết hạn
- Mất trọng lượng

Cho phép ghi:

```text
Sản phẩm
Số lượng
Loại hao hụt
Lý do
Giá vốn
Ngày
Người thực hiện
```

Hao hụt phải ảnh hưởng:

- Tồn kho
- Giá trị tồn
- Chi phí/hao hụt
- Báo cáo lãi/lỗ nếu được cấu hình

---

# 16. Quản lý hạn sử dụng

## ExpiryAlert

Hệ thống cảnh báo:

```text
Đã hết hạn
Còn 1 ngày
Còn 3 ngày
Còn 7 ngày
Còn 15 ngày
```

Cho phép cấu hình số ngày cảnh báo.

Màn hình:

```text
HÀNG SẮP HẾT HẠN

Cà chua       10 kg     còn 2 ngày
Rau má         5 kg     còn 1 ngày
Đậu cô ve      8 kg     còn 5 ngày
```

Màu sắc cảnh báo:

- Bình thường
- Sắp hết hạn
- Khẩn cấp
- Đã hết hạn

---

# 17. Cảnh báo tồn kho

Cảnh báo:

```text
Tồn dưới mức tối thiểu
Tồn bằng 0
Tồn vượt mức tối đa
```

Ví dụ:

```text
Rau muống
Tồn: 3 kg
Tối thiểu: 10 kg

→ CẢNH BÁO CẦN NHẬP HÀNG
```

---

# 18. Quản lý thu tiền

## Receipt

```text
id
receiptNumber
customerId
supplierId
amount
paymentMethod
date
referenceInvoiceId
note
createdAt
syncStatus
```

Loại:

```text
CUSTOMER_PAYMENT
SUPPLIER_PAYMENT
OTHER_INCOME
```

---

# 19. Quản lý chi tiền

## Expense

```text
id
expenseNumber
categoryId
amount
paymentMethod
date
description
createdAt
syncStatus
```

Nhóm chi phí:

- Tiền nhập hàng
- Tiền vận chuyển
- Tiền thuê sạp
- Tiền điện
- Tiền nước
- Tiền nhân công
- Tiền bao bì
- Tiền đá
- Tiền vệ sinh
- Chi phí khác
- Hao hụt/hư hỏng

---

# 20. Báo cáo doanh thu

## Doanh thu theo ngày

```text
Ngày
Số hóa đơn
Doanh thu
Giảm giá
Thực thu
```

## Theo tháng

```text
Tháng
Doanh thu
Giá vốn
Lãi gộp
Chi phí
Lãi ròng
```

## Theo sản phẩm

```text
Sản phẩm
Số lượng bán
Doanh thu
Giá vốn
Lãi gộp
Biên lợi nhuận
```

## Theo khách hàng

```text
Khách hàng
Số hóa đơn
Doanh thu
Đã thu
Công nợ
```

---

# 21. Báo cáo chi phí

Cho phép lọc:

- Theo ngày
- Tuần
- Tháng
- Quý
- Năm
- Khoảng ngày

Hiển thị:

```text
Nhóm chi phí
Số tiền
Tỷ lệ %
```

---

# 22. Báo cáo nhập – xuất – tồn

## Tổng hợp

```text
Sản phẩm | Tồn đầu | Nhập | Xuất | Tồn cuối | Giá trị tồn
```

## Chi tiết

```text
Ngày
Mã chứng từ
Loại giao dịch
Sản phẩm
Số lượng
Giá vốn
Thành tiền
Tồn sau giao dịch
```

---

# 23. Báo cáo công nợ khách hàng

## Tổng hợp

```text
Khách hàng
Nợ đầu kỳ
Mua hàng
Đã trả
Điều chỉnh
Nợ cuối kỳ
```

## Chi tiết

```text
Ngày
Chứng từ
Diễn giải
Phát sinh tăng
Phát sinh giảm
Số dư
```

---

# 24. Báo cáo công nợ nhà cung cấp

```text
Nhà cung cấp
Nợ đầu kỳ
Nhập hàng
Đã thanh toán
Điều chỉnh
Nợ cuối kỳ
```

Cho phép xem lịch sử từng chứng từ.

---

# 25. Báo cáo lãi/lỗ

Công thức cơ bản:

```text
Doanh thu thuần
- Giá vốn hàng bán
= Lãi gộp

Lãi gộp
- Chi phí vận hành
- Chi phí hao hụt
= Lợi nhuận ròng
```

Báo cáo tổng hợp:

```text
Doanh thu                    100.000.000
Giá vốn                       70.000.000
-----------------------------------------
Lãi gộp                       30.000.000

Chi phí vận hành               8.000.000
Hao hụt                        2.000.000
-----------------------------------------
Lợi nhuận ròng                20.000.000
```

Cho phép xem:

- Ngày
- Tuần
- Tháng
- Quý
- Năm
- Khoảng thời gian

---

# 26. Báo cáo cân đối doanh thu – chi phí

## Tổng hợp

```text
DOANH THU
----------------
Bán hàng
Thu công nợ
Thu khác

CHI PHÍ
----------------
Nhập hàng
Vận chuyển
Thuê sạp
Điện nước
Nhân công
Hao hụt
Chi khác

KẾT QUẢ
----------------
Tổng thu
Tổng chi
Chênh lệch
```

## Chi tiết

Cho phép click vào từng khoản để xem chứng từ nguồn.

---

# 27. Dashboard

Màn hình chính:

```text
┌───────────────────────────────────────┐
│       QUẢN LÝ SẠP RAU CỦ QUẢ          │
├───────────────────────────────────────┤
│ Doanh thu hôm nay       5.850.000     │
│ Đã thu                  4.900.000     │
│ Công nợ phát sinh         950.000     │
│ Chi phí hôm nay         1.200.000     │
│ Lãi tạm tính            1.800.000     │
├───────────────────────────────────────┤
│ Tồn kho                  35.600.000    │
│ Công nợ khách hàng        8.200.000   │
│ Công nợ NCC              12.500.000   │
├───────────────────────────────────────┤
│ ⚠ Hàng sắp hết              8         │
│ ⚠ Hàng sắp hết hạn          5         │
│ ⚠ Hàng đã hết hạn           2         │
└───────────────────────────────────────┘
```

---

# 28. Màn hình Flutter

## Navigation

```text
Dashboard
Bán hàng
Nhập hàng
Kho hàng
Khách hàng
Nhà cung cấp
Thu tiền
Chi tiền
Điểm thưởng
Báo cáo
Cài đặt
Đồng bộ
```

---

# 29. Màn hình bán hàng

Yêu cầu:

- Tìm sản phẩm
- Barcode
- Chọn sản phẩm
- Nhập số lượng
- Nhập trọng lượng
- Đổi giá
- Chiết khấu
- Chọn khách hàng
- Trừ điểm
- Tính tiền
- Thanh toán tiền mặt
- Chuyển khoản
- Ghi công nợ
- In phiếu

Hỗ trợ bán nhanh bằng bàn phím trên Windows.

---

# 30. Màn hình cân điện tử

Có thể mở rộng tích hợp cân điện tử qua:

- Bluetooth
- USB/Serial
- COM trên Windows

Ví dụ:

```text
Cà chua
Khối lượng: 2.35 kg
Đơn giá: 25.000
Thành tiền: 58.750
```

Nếu chưa tích hợp cân, cho phép nhập trọng lượng thủ công.

---

# 31. In PDF

Hệ thống phải có PDF cho:

- Hóa đơn bán hàng
- Phiếu nhập hàng
- Phiếu thu
- Phiếu chi
- Phiếu thanh toán công nợ
- Báo cáo doanh thu
- Báo cáo chi phí
- Báo cáo nhập xuất tồn
- Báo cáo công nợ khách hàng
- Báo cáo công nợ nhà cung cấp
- Báo cáo lãi/lỗ
- Báo cáo cân đối thu chi
- Báo cáo hạn sử dụng
- Báo cáo hàng tồn kho

Mỗi PDF phải có:

```text
Tên sạp
Địa chỉ
Số điện thoại
Thời gian báo cáo
Người lập
Ngày in
```

---

# 32. Phiếu thanh toán công nợ

Ví dụ:

```text
PHIẾU THANH TOÁN CÔNG NỢ

Khách hàng: Nguyễn Văn A
Điện thoại: 09xxxxxxxx

Công nợ trước thanh toán: 3.500.000

Thanh toán lần này: 2.000.000

Còn nợ: 1.500.000

Phương thức: Tiền mặt

Ngày: 30/08/2026

Người thu tiền: ................
Khách hàng: ....................
```

Có nút:

```text
[Xem PDF]
[In]
[Chia sẻ]
```

---

# 33. Isar Database

Các collection chính:

```text
AppConfig
Store
User
Product
Category
Unit
Supplier
Customer
CustomerGroup
LoyaltyRule
LoyaltyTransaction
SalesInvoice
SalesItem
PurchaseInvoice
PurchaseItem
StockLot
StockMovement
Receipt
Expense
ExpenseCategory
Payment
DebtTransaction
CashTransaction
ExpiryAlert
StockAlert
SyncQueue
SyncState
AuditLog
```

---

# 34. SyncQueue

Mọi thay đổi local tạo một queue.

```text
id
entityType
entityId
operation
payload
createdAt
retryCount
lastError
status
```

Operation:

```text
CREATE
UPDATE
DELETE
```

Status:

```text
PENDING
SYNCING
SYNCED
FAILED
```

---

# 35. Đồng bộ Isar → Neon

Quy trình:

```text
Người dùng thao tác
        ↓
Lưu Isar
        ↓
Tạo SyncQueue
        ↓
Kiểm tra Internet
        ↓
Gửi Vercel API
        ↓
API xác thực
        ↓
Neon PostgreSQL
        ↓
Trả kết quả
        ↓
Đánh dấu SYNCED
```

Không được gửi trực tiếp Flutter → Neon.

---

# 36. Đồng bộ Neon → Isar

Khi đăng nhập thiết bị mới:

```text
Login
  ↓
Lấy storeId
  ↓
API download dữ liệu
  ↓
Lưu Isar
  ↓
Xây index
  ↓
Hoàn tất
```

Đồng bộ incremental:

```text
GET /sync/pull?storeId=...&cursor=...
```

Chỉ tải dữ liệu thay đổi từ lần sync trước.

---

# 37. Xử lý xung đột

Mỗi record cần:

```text
updatedAt
version
deviceId
```

Khuyến nghị:

```text
Server authoritative
```

Đối với dữ liệu giao dịch:

- Không sửa/xóa lịch sử tùy tiện.
- Dùng transaction điều chỉnh.
- Server kiểm tra version.
- Ghi AuditLog.

Đặc biệt:

```text
Hóa đơn
Phiếu nhập
Phiếu thu
Phiếu chi
StockMovement
DebtTransaction
LoyaltyTransaction
```

phải có lịch sử rõ ràng.

---

# 38. Neon Database

Các bảng PostgreSQL chính:

```text
stores
users
products
categories
units
suppliers
customers
customer_groups
loyalty_rules
loyalty_transactions
sales_invoices
sales_items
purchase_invoices
purchase_items
stock_lots
stock_movements
receipts
expenses
expense_categories
payments
debt_transactions
cash_transactions
expiry_alerts
stock_alerts
sync_changes
audit_logs
```

Tất cả bảng cần:

```text
id UUID PRIMARY KEY
store_id UUID
created_at TIMESTAMP
updated_at TIMESTAMP
deleted_at TIMESTAMP NULL
version BIGINT
```

---

# 39. Vercel API

Cấu trúc đề xuất:

```text
/api/auth/login
/api/auth/register

/api/store
/api/store/profile

/api/products
/api/categories
/api/units

/api/customers
/api/suppliers

/api/sales
/api/purchases

/api/stock
/api/stock/movements
/api/stock/lots

/api/receipts
/api/expenses

/api/debts/customers
/api/debts/suppliers

/api/loyalty

/api/reports/sales
/api/reports/expenses
/api/reports/inventory
/api/reports/debts
/api/reports/profit-loss
/api/reports/cashflow

/api/sync/push
/api/sync/pull
/api/sync/status
```

---

# 40. Bảo mật API

Không để:

- Neon connection string trong Flutter.
- Database password trong APK.
- Secret key trong source Flutter.

Environment Variables trên Vercel:

```text
DATABASE_URL
JWT_SECRET
APP_SECRET
```

API phải kiểm tra:

```text
Authorization
User
Store
Permission
```

Mọi query phải lọc theo:

```text
store_id
```

Không cho một cửa hàng đọc dữ liệu của cửa hàng khác.

---

# 41. Multi-device

Một cửa hàng có thể dùng:

```text
Điện thoại chủ sạp
Điện thoại nhân viên
Máy tính Windows
Máy tính tiền
```

Tất cả cùng đồng bộ về:

```text
Neon
```

Ví dụ:

```text
Thiết bị A bán 5 kg rau
          ↓
       Neon
          ↓
Thiết bị B nhận thay đổi
```

---

# 42. Backup

Có 2 lớp:

## Local

Backup Isar:

```text
Backup/
    2026-08-30_080000/
```

## Cloud

Neon là dữ liệu trung tâm.

Có thể mở rộng:

- Export CSV
- Export Excel
- Export PDF
- Backup dữ liệu cửa hàng

---

# 43. Quyền người dùng

## Chủ sạp

Toàn quyền.

## Nhân viên bán hàng

```text
Bán hàng
Xem sản phẩm
Xem khách hàng
Thu tiền
```

Không được:

```text
Xóa hóa đơn
Xem toàn bộ lợi nhuận
Sửa giá vốn
Xóa giao dịch
```

## Nhân viên kho

```text
Nhập hàng
Xuất kho
Kiểm kho
Hao hụt
```

---

# 44. Kiểm kê kho

Chức năng:

```text
Tồn hệ thống
Tồn thực tế
Chênh lệch
Giá trị chênh lệch
Lý do
```

Ví dụ:

```text
Cà chua
Hệ thống: 30 kg
Thực tế: 28 kg
Chênh lệch: -2 kg
```

Tạo StockMovement:

```text
ADJUSTMENT_OUT
```

---

# 45. Báo cáo kiểm kê

```text
Sản phẩm
Tồn hệ thống
Tồn thực tế
Chênh lệch
Giá trị
Lý do
Người kiểm kê
Ngày kiểm kê
```

---

# 46. Báo cáo hàng bán chạy

Hiển thị:

```text
Top 10 sản phẩm bán chạy
Top 20 sản phẩm bán chạy
Doanh thu
Số lượng
Lợi nhuận
```

Cho phép lọc theo:

- Ngày
- Tuần
- Tháng

---

# 47. Báo cáo hàng chậm bán

Tìm:

```text
Không bán 3 ngày
Không bán 7 ngày
Không bán 15 ngày
Không bán 30 ngày
```

Đặc biệt hữu ích với hàng dễ hư.

---

# 48. Báo cáo hàng tồn có nguy cơ hư hỏng

Kết hợp:

```text
Tồn kho
+
Ngày nhập
+
Hạn sử dụng
+
Tốc độ bán
```

Ví dụ:

```text
Cà tím
Tồn: 20 kg
Bán trung bình: 3 kg/ngày
Còn hạn: 2 ngày

→ NGUY CƠ TỒN HƯ HỎNG CAO
```

---

# 49. Dashboard đồng bộ

Hiển thị:

```text
☁ Đồng bộ thành công

Lần sync:
30/08/2026 08:20

Đang chờ:
3

Lỗi:
0
```

Nếu lỗi:

```text
⚠ Đồng bộ thất bại

3 bản ghi chưa đồng bộ

[Đồng bộ lại]
[Xem lỗi]
```

---

# 50. Auto Sync

Khi:

```text
Có Internet
```

thì tự động:

```text
Push local changes
        ↓
Pull server changes
        ↓
Resolve conflicts
        ↓
Update cursor
```

Có thể sync:

- Khi mở app.
- Sau giao dịch.
- Khi Internet trở lại.
- Theo chu kỳ 1–5 phút khi app đang hoạt động.

---

# 51. Nguyên tắc tính báo cáo

Không lấy số liệu từ UI.

Tất cả báo cáo phải được xây từ transaction/giao dịch gốc.

Ví dụ doanh thu:

```text
SUM(SalesInvoice.totalAmount)
```

Giá vốn:

```text
SUM(SalesItem.costPrice * quantity)
```

Chi phí:

```text
SUM(Expense.amount)
```

Công nợ:

```text
OpeningDebt
+ CreditTransactions
- PaymentTransactions
```

Điểm thưởng:

```text
SUM(EARN)
- SUM(REDEEM)
- SUM(EXPIRE)
+/- ADJUST
```

---

# 52. Báo cáo tổng hợp quản trị

Màn hình đặc biệt dành cho chủ sạp:

```text
DOANH THU
Giá vốn
Lãi gộp
Chi phí
Hao hụt
Lãi ròng

TIỀN
Tiền mặt
Ngân hàng
Tổng thu
Tổng chi

CÔNG NỢ
Khách hàng
Nhà cung cấp

KHO
Tổng giá trị tồn
Hàng sắp hết
Hàng sắp hết hạn
Hàng chậm bán
```

---

# 53. Bộ lọc báo cáo

Tất cả báo cáo nên hỗ trợ:

```text
Hôm nay
Hôm qua
7 ngày
Tháng này
Tháng trước
Quý này
Năm nay
Tùy chọn ngày
```

---

# 54. UI/UX

Thiết kế:

- Chữ lớn.
- Nút lớn.
- Ít thao tác.
- Màu cảnh báo dễ nhìn.
- Tối ưu màn hình điện thoại.
- Tối ưu Windows.
- Bán hàng nhanh.
- Không bắt người dùng nhập quá nhiều thông tin.

Ưu tiên:

```text
BÁN HÀNG
NHẬP HÀNG
THU TIỀN
CHI TIỀN
```

---

# 55. Tìm kiếm

Sản phẩm:

- Tên
- Mã
- Barcode

Khách hàng:

- Tên
- Số điện thoại

Nhà cung cấp:

- Tên
- Số điện thoại

Phải hỗ trợ tìm kiếm offline từ Isar.

---

# 56. Barcode

Hỗ trợ:

- Quét barcode bằng camera.
- Nhập barcode thủ công.
- Tìm sản phẩm.
- Bán nhanh.

Barcode không bắt buộc đối với hàng bán theo cân.

---

# 57. Quy trình bán hàng mẫu

```text
Mở bán hàng
   ↓
Quét/chọn Cà chua
   ↓
Nhập 2.5 kg
   ↓
Đơn giá 25.000
   ↓
62.500
   ↓
Chọn khách hàng
   ↓
Áp dụng điểm nếu có
   ↓
Thanh toán
   ↓
In phiếu
   ↓
Trừ tồn kho
   ↓
Cộng doanh thu
   ↓
Ghi giá vốn
   ↓
Cộng điểm
   ↓
Đồng bộ
```

---

# 58. Quy trình nhập hàng

```text
Nhập hàng
   ↓
Chọn nhà cung cấp
   ↓
Chọn sản phẩm
   ↓
Nhập số kg
   ↓
Nhập giá
   ↓
Nhập hạn sử dụng
   ↓
Lưu lô hàng
   ↓
Cộng tồn
   ↓
Tạo công nợ
   ↓
In phiếu nhập
   ↓
Sync
```

---

# 59. Quy trình thu công nợ

```text
Khách hàng
   ↓
Công nợ hiện tại
   ↓
Nhập số tiền thu
   ↓
Chọn phương thức
   ↓
Lưu Receipt
   ↓
Giảm công nợ
   ↓
In phiếu
   ↓
Sync
```

---

# 60. Quy trình thanh toán nhà cung cấp

```text
Nhà cung cấp
   ↓
Công nợ
   ↓
Thanh toán
   ↓
Payment
   ↓
Giảm công nợ NCC
   ↓
In phiếu
   ↓
Sync
```

---

# 61. Cấu trúc Flutter đề xuất

```text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme.dart
│
├── core/
│   ├── database/
│   ├── network/
│   ├── sync/
│   ├── pdf/
│   ├── utils/
│   └── constants/
│
├── features/
│   ├── dashboard/
│   ├── sales/
│   ├── purchases/
│   ├── inventory/
│   ├── customers/
│   ├── suppliers/
│   ├── loyalty/
│   ├── receipts/
│   ├── expenses/
│   ├── debts/
│   ├── reports/
│   ├── expiry/
│   └── settings/
│
├── models/
├── repositories/
├── services/
└── widgets/
```

---

# 62. Repository pattern

Ví dụ:

```text
ProductRepository
CustomerRepository
SupplierRepository
SalesRepository
PurchaseRepository
StockRepository
DebtRepository
LoyaltyRepository
ReportRepository
SyncRepository
```

UI không truy cập Isar trực tiếp.

---

# 63. Transaction nghiệp vụ

Một giao dịch bán hàng phải được xử lý atomic ở local:

```text
SalesInvoice
+
SalesItems
+
StockMovement
+
LoyaltyTransaction
+
DebtTransaction
+
CashTransaction
+
SyncQueue
```

Nếu một bước thất bại, không được để dữ liệu dở dang.

---

# 64. Idempotency

API phải chống gửi trùng giao dịch.

Mỗi transaction có:

```text
clientTransactionId
```

Nếu Flutter gửi lại do mạng chập chờn:

```text
clientTransactionId giống nhau
```

Server không tạo giao dịch thứ hai.

---

# 65. API Response chuẩn

```json
{
  "success": true,
  "data": {},
  "message": "",
  "serverTime": "2026-08-30T08:20:00Z"
}
```

Lỗi:

```json
{
  "success": false,
  "errorCode": "DUPLICATE_TRANSACTION",
  "message": "Transaction already exists"
}
```

---

# 66. Giai đoạn phát triển

## Phase 1 – Core

- Flutter
- Isar
- Product
- Category
- Customer
- Supplier
- Sales
- Purchase
- Stock

## Phase 2 – Tài chính

- Thu
- Chi
- Công nợ
- Cash
- Payment

## Phase 3 – Loyalty

- Điểm thưởng
- Hạng khách hàng
- Đổi điểm

## Phase 4 – Báo cáo

- Doanh thu
- Chi phí
- Nhập xuất tồn
- Công nợ
- Lãi/lỗ
- Cân đối thu chi

## Phase 5 – Hạn sử dụng

- Lô hàng
- Expiry
- Cảnh báo
- Hàng chậm bán
- Hàng nguy cơ hư

## Phase 6 – Cloud

- Vercel API
- Neon
- Push
- Pull
- Conflict
- Multi-device

## Phase 7 – PDF

- Hóa đơn
- Phiếu thu
- Phiếu chi
- Báo cáo
- Phiếu thanh toán

## Phase 8 – Nâng cao

- Barcode
- Cân điện tử
- Dashboard nâng cao
- Excel
- Phân tích xu hướng
- AI dự báo nhập hàng

---

# 67. Tiêu chí hoàn thành

Ứng dụng được xem là hoàn thành khi:

- [ ] Có thể bán hàng offline.
- [ ] Có thể nhập hàng offline.
- [ ] Có thể thu/chi offline.
- [ ] Tự động cập nhật tồn kho.
- [ ] Quản lý lô hàng.
- [ ] Quản lý hạn sử dụng.
- [ ] Cảnh báo tồn thấp.
- [ ] Cảnh báo hết hạn.
- [ ] Quản lý công nợ khách hàng.
- [ ] Quản lý công nợ nhà cung cấp.
- [ ] Quản lý điểm thưởng.
- [ ] Báo cáo doanh thu.
- [ ] Báo cáo chi phí.
- [ ] Báo cáo nhập xuất tồn.
- [ ] Báo cáo công nợ.
- [ ] Báo cáo lãi/lỗ.
- [ ] Báo cáo cân đối thu chi.
- [ ] In PDF.
- [ ] Đồng bộ Isar → Vercel → Neon.
- [ ] Đồng bộ Neon → Vercel → Isar.
- [ ] Có retry khi mất mạng.
- [ ] Không tạo giao dịch trùng.
- [ ] Hỗ trợ nhiều thiết bị.
- [ ] Có phân quyền.
- [ ] Có audit log.
- [ ] Có backup.

---

# 68. Yêu cầu quan trọng cho AI Agent phát triển

AI Agent phải tuân thủ:

1. Không phá kiến trúc offline-first.
2. Không truy cập Neon trực tiếp từ Flutter.
3. Không đặt secret trong Flutter.
4. Không bỏ qua SyncQueue.
5. Không cập nhật tồn kho bằng cách sửa số tồn trực tiếp.
6. Tồn kho phải được hình thành từ StockMovement.
7. Công nợ phải hình thành từ DebtTransaction.
8. Điểm thưởng phải hình thành từ LoyaltyTransaction.
9. Báo cáo phải dựa trên dữ liệu giao dịch.
10. Giao dịch tài chính phải có audit.
11. Giao dịch gửi API phải có idempotency.
12. Không xóa cứng giao dịch tài chính.
13. Mọi dữ liệu phải phân vùng theo `store_id`.
14. Không làm mất dữ liệu offline khi sync.
15. Khi sửa code phải giữ tương thích dữ liệu Isar hiện tại.

---

# 69. Kết quả mong muốn

Sản phẩm cuối cùng là một hệ thống:

```text
QUẢN LÝ SẠP CHỢ
RAU – CỦ – QUẢ
        │
        ├── Bán hàng
        ├── Nhập hàng
        ├── Kho
        ├── Hạn sử dụng
        ├── Hao hụt
        ├── Khách hàng
        ├── Nhà cung cấp
        ├── Công nợ
        ├── Điểm thưởng
        ├── Thu
        ├── Chi
        ├── Doanh thu
        ├── Chi phí
        ├── Lãi/Lỗ
        ├── Nhập/Xuất/Tồn
        ├── Cân đối thu/chi
        ├── Dashboard
        ├── PDF
        └── Đồng bộ Cloud
                │
             Vercel
                │
              Neon
```

Mục tiêu là ứng dụng phải **dễ dùng như một app bán hàng tại chợ**, nhưng phía sau có hệ thống kế toán quản trị, kho, công nợ và đồng bộ cloud đủ chắc chắn để mở rộng thành phần mềm thương mại nhiều cửa hàng.
