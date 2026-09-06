# Đặc tả ứng dụng quản lý trạm xăng dầu + POS tạp hóa

**Tên đề xuất:** FuelStationPOS  
**Nền tảng:** Flutter Android/Windows  
**Kiến trúc:** Offline-first  
**Local DB:** Isar  
**Cloud DB:** Neon PostgreSQL  
**Backend/API:** Vercel Serverless Functions  
**Đồng bộ:** Isar ↔ API Vercel ↔ Neon  
**Mục tiêu:** Quản lý đầy đủ nghiệp vụ trạm bán xăng dầu, nhớt, hàng hóa phụ trợ, POS tạp hóa nhỏ, kho bồn, công nợ, doanh thu, kế toán, bút toán, thuế và báo cáo.

---

## 1. Mục tiêu nghiệp vụ

Ứng dụng phải quản lý:

- Bán xăng dầu theo từng vòi/bơm.
- Xăng RON95, E5 RON92, dầu DO và các sản phẩm nhiên liệu khác.
- Nhập nhiên liệu vào từng bồn.
- Theo dõi tồn thực tế, tồn sổ sách và hao hụt.
- Đọc dữ liệu từ máy bơm/trụ bơm nếu thiết bị hỗ trợ giao tiếp.
- Quản lý bồn chứa: dung tích, mức tồn, nhiệt độ, cảnh báo.
- Bán nhớt, phụ tùng, nước, hàng tạp hóa.
- POS bán hàng.
- Hóa đơn bán hàng.
- Ca bán hàng và nhân viên.
- Tiền mặt, chuyển khoản, QR.
- Công nợ khách hàng.
- Công nợ nhà cung cấp.
- Nhập hàng, trả hàng.
- Doanh thu, giá vốn, lợi nhuận.
- Kế toán tổng hợp.
- Tạo và quản lý bút toán.
- Công cụ khóa sổ.
- Báo cáo ngày/tháng/quý/năm.
- Báo cáo tồn kho bồn và kho hàng.
- Báo cáo thuế.
- Đồng bộ nhiều thiết bị.
- Hoạt động offline khi mất Internet.

> Lưu ý: Các quy định thuế/hóa đơn điện tử phải được cấu hình theo quy định hiện hành tại thời điểm triển khai; không hard-code mức thuế hoặc biểu mẫu pháp lý.

---

# 2. Kiến trúc tổng thể

```text
Flutter Android / Windows
        |
        +-- Riverpod
        |
        +-- Repository
        |
        +-- Isar Local DB
        |
        +-- Sync Engine
                 |
                 | HTTPS/JSON
                 v
          Vercel API
                 |
        +--------+---------+
        |                  |
   Authentication      Business API
        |                  |
        +--------+---------+
                 |
             Neon DB
          PostgreSQL
```

### Nguyên tắc

1. Offline-first.
2. Mọi giao dịch quan trọng được lưu Isar trước.
3. Có `UUID` cho toàn bộ chứng từ.
4. Có `created_at`, `updated_at`, `deleted_at`.
5. Có `device_id`.
6. Có `sync_status`.
7. Server quyết định trạng thái đồng bộ cuối cùng.
8. Không xóa vật lý chứng từ kế toán; dùng soft-delete/reversal.
9. Chứng từ đã khóa sổ không được sửa trực tiếp.
10. Sai chứng từ phải lập chứng từ điều chỉnh/hủy theo nghiệp vụ.

---

# 3. Phân hệ

```text
01. Đăng nhập & phân quyền
02. Cấu hình doanh nghiệp/trạm
03. Danh mục hàng hóa
04. Quản lý bồn xăng dầu
05. Quản lý trụ/vòi bơm
06. Tích hợp máy bơm
07. Nhập nhiên liệu
08. Xuất/bán nhiên liệu
09. POS tạp hóa
10. Nhớt/phụ tùng
11. Ca bán hàng
12. Thu/chi
13. Khách hàng
14. Nhà cung cấp
15. Công nợ
16. Kho hàng
17. Kế toán
18. Bút toán
19. Giá vốn
20. Thuế
21. Hóa đơn điện tử
22. Báo cáo
23. Đồng bộ
24. Backup/Restore
25. Audit Log
```

---

# 4. Cấu trúc tổ chức

## Company

- id
- code
- name
- tax_code
- address
- phone
- email
- accounting_method
- fiscal_year
- currency
- active

## Station

- id
- company_id
- code
- name
- address
- timezone
- active

## Branch

Cho phép một doanh nghiệp có nhiều trạm.

- id
- company_id
- station_id
- code
- name

---

# 5. Người dùng và phân quyền

## User

- id
- username
- password_hash
- employee_id
- station_id
- role_id
- active

## Role

Các role:

- OWNER
- ADMIN
- ACCOUNTANT
- MANAGER
- CASHIER
- SALE
- WAREHOUSE
- AUDITOR

### Permission

Ví dụ:

```text
SALE_CREATE
SALE_CANCEL
SALE_VIEW
PURCHASE_CREATE
PURCHASE_APPROVE
STOCK_ADJUST
TANK_VIEW
TANK_IMPORT
ACCOUNTING_POST
ACCOUNTING_CLOSE
DEBT_RECEIVE
DEBT_PAY
REPORT_VIEW
TAX_VIEW
USER_MANAGE
```

---

# 6. Danh mục hàng hóa

## Product

```text
id
sku
barcode
name
product_type
unit
brand
category_id
tax_rate
cost_method
track_inventory
track_batch
track_expiry
min_stock
max_stock
active
```

### ProductType

```text
FUEL
LUBRICANT
SPARE_PART
GROCERY
SERVICE
OTHER
```

### Đơn vị

```text
L
ML
KG
BOX
BOTTLE
CAN
PIECE
PACK
```

---

# 7. Quản lý nhiên liệu

Mỗi loại nhiên liệu phải là một Product.

Ví dụ:

```text
E5 RON92
RON95-III
DO 0.001S
DO 0.05S
```

Có thể cấu hình:

- giá nhập
- giá bán
- giá bán theo thời điểm
- thuế
- định mức hao hụt
- bồn mặc định

---

# 8. Quản lý bồn chứa

## Tank

```text
id
station_id
code
name
product_id
capacity_liter
safe_capacity_liter
min_level_liter
critical_level_liter
current_quantity
opening_quantity
active
```

## TankReading

Ghi nhận:

```text
id
tank_id
reading_time
quantity
height
temperature
water_level
density
source
employee_id
```

`source`:

```text
MANUAL
SENSOR
IMPORT
PUMP_SYSTEM
```

---

# 9. Tồn bồn

Công thức:

```text
Tồn cuối =
Tồn đầu
+ Nhập bồn
- Xuất bán theo máy bơm
± Điều chỉnh
```

Phải theo dõi đồng thời:

```text
Tồn sổ sách
Tồn đo thực tế
Chênh lệch
Hao hụt
Tỷ lệ hao hụt
```

## Cảnh báo

- Bồn gần đầy.
- Bồn dưới mức tối thiểu.
- Bồn dưới mức nguy hiểm.
- Hao hụt vượt định mức.
- Chênh lệch giữa đồng hồ và tồn kho.
- Cảm biến mất kết nối.
- Dữ liệu cảm biến bất thường.

---

# 10. Tích hợp máy bơm/trụ bơm

## Pump

```text
id
station_id
code
name
manufacturer
model
ip_address
port
protocol
active
```

## PumpNozzle

```text
id
pump_id
nozzle_no
product_id
tank_id
totalizer_open
totalizer_close
meter_type
```

## PumpTransaction

```text
id
station_id
pump_id
nozzle_id
transaction_time
totalizer_before
totalizer_after
quantity
unit_price
amount
employee_id
sale_id
```

### Kiến trúc Adapter

Không khóa ứng dụng vào một hãng máy bơm.

```text
PumpAdapter
    |
    +-- ProtocolAAdapter
    +-- ProtocolBAdapter
    +-- SerialAdapter
    +-- TCPAdapter
    +-- ModbusAdapter
    +-- FileImportAdapter
    +-- ManualAdapter
```

> Giao thức thực tế phải căn cứ tài liệu kỹ thuật/API của từng máy bơm. Không tự giả định giao thức của nhà sản xuất.

### Đồng bộ totalizer

Mỗi lần lấy số liệu:

```text
previous_totalizer
current_totalizer

quantity = current_totalizer - previous_totalizer
```

Nếu:

```text
current < previous
```

thì đánh dấu:

```text
RESET_OR_ERROR
```

và không tự động ghi nhận doanh thu.

---

# 11. Quy trình bán xăng

```text
Khách hàng
   ↓
Chọn vòi/trụ
   ↓
Nhập số tiền hoặc số lít
   ↓
Máy bơm chạy
   ↓
Nhận totalizer
   ↓
Tính số lít
   ↓
Áp giá bán
   ↓
Tạo Sale
   ↓
Thu tiền
   ↓
Giảm tồn bồn
   ↓
Tạo bút toán
   ↓
In/PDF hóa đơn
```

## Sale

```text
id
sale_no
station_id
shift_id
customer_id
sale_type
payment_method
subtotal
discount
tax
total
paid
debt
status
created_by
created_at
```

## SaleLine

```text
sale_id
product_id
quantity
unit
unit_price
discount
tax_rate
tax_amount
cost_price
cost_amount
amount
tank_id
pump_id
nozzle_id
```

---

# 12. Bán theo tiền hoặc theo lít

## Theo lít

```text
quantity = 20 L
price = 23,500
amount = 470,000
```

## Theo tiền

```text
amount = 500,000
price = 23,500
quantity = 500000 / 23500
```

Lưu chính xác số lượng thực tế từ máy bơm.

Không làm tròn dữ liệu gốc; chỉ làm tròn ở giao diện/in theo cấu hình.

---

# 13. POS tạp hóa

POS dùng chung Product/Sale nhưng có nghiệp vụ riêng:

```text
Barcode scanner
Category
Cart
Discount
Voucher
Customer
Cash
Transfer
QR
Print receipt
Return
Exchange
```

### POS Screen

```text
┌────────────────────────────────────┐
│ TÌM HÀNG / BARCODE                 │
├──────────────┬─────────────────────┤
│ DANH MỤC     │ GIỎ HÀNG            │
│ Nước         │ Coca      2 x 10k   │
│ Bánh         │ Mì        3 x 5k    │
│ Sữa          │                       │
│ Nhớt         │ Tổng:       35,000  │
├──────────────┴─────────────────────┤
│ TIỀN MẶT | QR | CHUYỂN KHOẢN       │
└────────────────────────────────────┘
```

---

# 14. Quản lý ca bán hàng

## Shift

```text
id
station_id
employee_id
opened_at
closed_at
opening_cash
closing_cash
expected_cash
actual_cash
difference
status
```

### Cuối ca

Tính:

```text
Tiền đầu ca
+ Doanh thu tiền mặt
+ Thu công nợ
- Chi tiền
= Tiền phải có
```

So sánh:

```text
Tiền thực tế - Tiền phải có
```

Nếu chênh lệch:

```text
SHORT
OVER
BALANCED
```

---

# 15. Nhập nhiên liệu

## Purchase

```text
purchase_id
supplier_id
station_id
invoice_no
invoice_date
product_id
tank_id
quantity
unit_cost
tax_rate
tax_amount
total
```

Quy trình:

```text
Xe bồn đến
↓
Kiểm tra chứng từ
↓
Đo bồn trước nhập
↓
Nhập nhiên liệu
↓
Đo bồn sau nhập
↓
Đối chiếu số lượng
↓
Nhập kho/bồn
↓
Ghi nhận công nợ
↓
Tạo bút toán
```

---

# 16. Kho nhớt và tạp hóa

Tạo Location:

```text
TANK-RON95
TANK-E5
TANK-DO
WAREHOUSE
SHOP
```

Mỗi giao dịch tồn kho có:

```text
InventoryTransaction
```

```text
id
warehouse_id
product_id
document_type
document_id
in_qty
out_qty
unit_cost
balance_qty
balance_value
created_at
```

Không sửa trực tiếp `balance_qty`; số dư được hình thành từ transaction.

---

# 17. Giá vốn

Hỗ trợ:

```text
FIFO
WEIGHTED_AVERAGE
```

Khuyến nghị:

```text
Xăng dầu:
WEIGHTED_AVERAGE

Tạp hóa/nhớt:
WEIGHTED_AVERAGE hoặc FIFO
```

Cấu hình theo Product.

---

# 18. Công nợ khách hàng

## Customer

```text
id
code
name
phone
tax_code
address
credit_limit
payment_term
opening_balance
active
```

## Receivable

```text
id
customer_id
document_id
debit
credit
balance
due_date
status
```

### Nghiệp vụ

```text
Bán chịu
↓
Tăng phải thu

Khách trả tiền
↓
Giảm phải thu
```

Cảnh báo:

- quá hạn
- vượt hạn mức
- sắp đến hạn

---

# 19. Công nợ nhà cung cấp

## Supplier

```text
id
code
name
tax_code
phone
address
payment_term
opening_balance
```

## Payable

```text
id
supplier_id
document_id
debit
credit
balance
due_date
```

### Nghiệp vụ

```text
Nhập hàng chưa thanh toán
↓
Tăng phải trả

Thanh toán NCC
↓
Giảm phải trả
```

---

# 20. Thu/chi

## CashTransaction

```text
id
station_id
shift_id
transaction_no
transaction_type
account_id
counterparty_type
counterparty_id
amount
payment_method
description
document_id
created_by
```

TransactionType:

```text
RECEIPT
PAYMENT
TRANSFER
ADJUSTMENT
```

---

# 21. Kế toán

Ứng dụng sử dụng hệ thống tài khoản có thể cấu hình.

Ví dụ:

```text
111  Tiền mặt
112  Tiền gửi ngân hàng
131  Phải thu khách hàng
133  Thuế GTGT được khấu trừ
156  Hàng hóa
331  Phải trả nhà cung cấp
3331 Thuế GTGT
511  Doanh thu
632  Giá vốn
641  Chi phí bán hàng
642  Chi phí quản lý
```

> Danh mục tài khoản phải cho phép thay đổi theo chế độ kế toán doanh nghiệp áp dụng.

---

# 22. Bút toán kế toán

## JournalEntry

```text
id
journal_no
journal_date
document_type
document_id
description
status
created_by
posted_by
posted_at
```

## JournalLine

```text
journal_entry_id
account_id
debit
credit
customer_id
supplier_id
product_id
station_id
cost_center_id
```

### Validation

Bắt buộc:

```text
SUM(DEBIT) = SUM(CREDIT)
```

Không cho Post nếu:

```text
Debit != Credit
```

---

# 23. Bút toán bán hàng

Ví dụ bán hàng tiền mặt:

```text
Nợ 111/112
    Có 511
    Có 3331
```

Đồng thời giá vốn:

```text
Nợ 632
    Có 156
```

Đối với xăng dầu, tài khoản kho/doanh thu/thuế phải cấu hình theo mô hình kế toán thực tế.

---

# 24. Bút toán bán chịu

```text
Nợ 131
    Có 511
    Có 3331
```

Giá vốn:

```text
Nợ 632
    Có 156
```

---

# 25. Bút toán nhập hàng

Nếu chưa thanh toán:

```text
Nợ 156
Nợ 1331
    Có 331
```

Nếu thanh toán ngay:

```text
Nợ 156
Nợ 1331
    Có 111/112
```

Các tài khoản và cách hạch toán phải cho phép cấu hình.

---

# 26. Bút toán thu công nợ

```text
Nợ 111/112
    Có 131
```

# 27. Bút toán trả nhà cung cấp

```text
Nợ 331
    Có 111/112
```

---

# 28. Chi phí

Ví dụ chi phí điện:

```text
Nợ 642
Nợ 1331
    Có 111/112/331
```

Cho phép người dùng chọn:

- tài khoản chi phí
- bộ phận
- trạm
- nhà cung cấp
- thuế

---

# 29. Điều chỉnh tồn kho

Không sửa trực tiếp kho.

Tạo:

```text
InventoryAdjustment
```

Các trường hợp:

```text
THỪA
THIẾU
HỦY
HỎNG
HAO HỤT
```

Sinh transaction kho và bút toán tương ứng.

---

# 30. Đối chiếu bồn

Báo cáo:

```text
Tồn đầu
+ Nhập
- Bán
= Tồn lý thuyết

Tồn đo thực tế

Chênh lệch
```

Ví dụ:

```text
Tồn lý thuyết     10,250 L
Tồn thực tế       10,210 L
Chênh lệch           -40 L
Định mức hao hụt     -20 L
Vượt định mức        -20 L
```

Cảnh báo nếu vượt ngưỡng.

---

# 31. Đối chiếu máy bơm

Theo từng:

```text
Trạm
Trụ
Vòi
Ca
Ngày
Nhân viên
```

Báo cáo:

```text
Totalizer đầu
Totalizer cuối
Số lít
Doanh thu
Tiền thu
Chênh lệch
```

---

# 32. Báo cáo doanh thu

## Ngày

- doanh thu xăng
- doanh thu nhớt
- doanh thu tạp hóa
- doanh thu dịch vụ
- chiết khấu
- thuế
- tổng tiền
- tiền mặt
- chuyển khoản
- công nợ

## Tháng/quý/năm

```text
Doanh thu
Giá vốn
Lợi nhuận gộp
Chi phí
Lợi nhuận
```

---

# 33. Báo cáo tồn kho

```text
Tồn theo bồn
Tồn theo sản phẩm
Tồn theo kho
Nhập
Xuất
Điều chỉnh
Hao hụt
Giá trị tồn
```

---

# 34. Báo cáo công nợ

### Khách hàng

```text
Dư đầu
Phát sinh tăng
Đã thu
Dư cuối
Quá hạn
```

### Nhà cung cấp

```text
Dư đầu
Mua hàng
Đã trả
Dư cuối
Quá hạn
```

---

# 35. Báo cáo lợi nhuận

```text
Doanh thu
- Giá vốn
= Lợi nhuận gộp

- Chi phí bán hàng
- Chi phí quản lý
= Lợi nhuận trước thuế
```

Cho phép xem:

```text
Theo trạm
Theo nhóm hàng
Theo sản phẩm
Theo nhân viên
Theo ca
Theo tháng
```

---

# 36. Báo cáo thuế

Phải thiết kế theo cấu hình và kỳ kê khai.

Các báo cáo dữ liệu nên có:

```text
Doanh thu chịu thuế
Doanh thu không chịu thuế
Thuế đầu ra
Thuế đầu vào
Thuế phải nộp
Hóa đơn đầu vào
Hóa đơn đầu ra
```

Có bộ lọc:

```text
Từ ngày
Đến ngày
Thuế suất
Trạng thái hóa đơn
```

Cho phép:

```text
Excel
CSV
PDF
```

> Không hard-code biểu mẫu thuế. Thiết kế `TaxReportTemplate` để cập nhật khi quy định thay đổi.

---

# 37. Hóa đơn

## Invoice

```text
id
invoice_no
invoice_series
invoice_date
customer_id
tax_code
subtotal
tax
total
status
e_invoice_provider
external_id
```

Trạng thái:

```text
DRAFT
PENDING
ISSUED
CANCELLED
ADJUSTED
REPLACED
```

Có adapter:

```text
EInvoiceProvider
```

để tích hợp nhà cung cấp hóa đơn điện tử sau này.

---

# 38. Đồng bộ Isar ↔ Neon

## SyncRecord

```text
id
entity
entity_id
operation
payload
version
device_id
created_at
synced_at
status
retry_count
error_message
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
CONFLICT
```

---

# 39. Quy tắc đồng bộ

### Ghi dữ liệu

```text
UI
 ↓
Repository
 ↓
Isar transaction
 ↓
SyncQueue
 ↓
API Vercel
 ↓
Neon
```

### Khi online

```text
Push local changes
↓
Server validate
↓
Commit Neon
↓
Return server_version
↓
Mark SYNCED
```

### Pull

```text
GET /api/sync/pull?cursor=...
↓
Download changes
↓
Validate version
↓
Upsert Isar
```

---

# 40. Conflict Resolution

Dữ liệu master:

```text
Last server version wins
```

Dữ liệu giao dịch:

```text
Không merge mù.
```

Nếu hai thiết bị cùng sửa:

```text
CONFLICT
```

Kế toán/chứng từ đã Post:

```text
Không Update
```

Phải tạo:

```text
REVERSAL
ADJUSTMENT
```

---

# 41. API Vercel

Đề xuất:

```text
/api/auth/login
/api/auth/refresh
/api/company
/api/stations
/api/products
/api/customers
/api/suppliers
/api/tanks
/api/tanks/readings
/api/pumps
/api/pumps/readings
/api/sales
/api/purchases
/api/inventory
/api/inventory/adjustments
/api/shifts
/api/cash
/api/receivables
/api/payables
/api/journals
/api/journals/post
/api/reports
/api/tax
/api/invoices
/api/sync/push
/api/sync/pull
```

---

# 42. API Security

Bắt buộc:

```text
HTTPS
JWT access token
Refresh token
Role-based authorization
Rate limiting
Input validation
Audit log
Idempotency key
```

Không lưu:

```text
password plaintext
JWT secret
database password
API secret
```

trong Flutter.

Secrets chỉ nằm phía server/Vercel.

---

# 43. Idempotency

Các giao dịch tài chính phải có:

```text
idempotency_key
```

Ví dụ:

```text
device_id + transaction_uuid
```

Nếu request gửi lại do mất mạng:

```text
Server nhận lần 2
→ phát hiện key đã tồn tại
→ không tạo giao dịch thứ hai
```

Điều này đặc biệt quan trọng với:

- bán hàng
- thanh toán
- nhập hàng
- thu tiền
- trả tiền
- bút toán

---

# 44. Audit Log

## AuditLog

```text
id
user_id
device_id
action
entity
entity_id
old_value
new_value
ip
created_at
```

Theo dõi:

```text
Ai tạo
Ai sửa
Ai hủy
Ai Post
Ai khóa sổ
Ai điều chỉnh kho
Ai thay đổi giá
```

---

# 45. Khóa sổ

## AccountingPeriod

```text
year
month
status
closed_by
closed_at
```

Trạng thái:

```text
OPEN
CLOSED
```

Khi CLOSED:

- không sửa chứng từ
- không xóa chứng từ
- không sửa bút toán
- chỉ cho phép chứng từ điều chỉnh theo quyền

---

# 46. Dashboard

Màn hình chính:

```text
┌───────────────────────────────────────┐
│ DOANH THU HÔM NAY       125,500,000   │
│ LỢI NHUẬN                 18,200,000  │
├───────────────────────────────────────┤
│ XĂNG                    105,000,000   │
│ NHỚT                     12,000,000   │
│ TẠP HÓA                   8,500,000   │
├───────────────────────────────────────┤
│ BỒN RON95                  62%        │
│ BỒN E5                     48%        │
│ BỒN DO                     71%        │
├───────────────────────────────────────┤
│ PHẢI THU                  85,000,000  │
│ PHẢI TRẢ                 120,000,000  │
└───────────────────────────────────────┘
```

---

# 47. Cảnh báo

Dashboard cảnh báo:

```text
🔴 Bồn dưới mức nguy hiểm
🟠 Bồn dưới mức tối thiểu
🟠 Công nợ quá hạn
🟠 Hao hụt vượt định mức
🟠 Hàng sắp hết
🟠 Hàng sắp hết hạn
🔴 Máy bơm mất kết nối
🔴 Dữ liệu totalizer bất thường
🔴 Chứng từ chưa đồng bộ
```

---

# 48. Backup

## Local

Backup Isar theo lịch:

```text
Daily
Weekly
Manual
```

Có:

```text
Export encrypted backup
Import backup
```

## Cloud

Neon là nguồn dữ liệu cloud.

Có thể tạo:

```text
Cloud backup
Restore point
```

Việc backup PostgreSQL nên thực hiện ở tầng hạ tầng/Neon, không phụ thuộc hoàn toàn vào Flutter.

---

# 49. Mô hình Isar

Các collection chính:

```text
AppConfig
User
Role
Permission
Company
Station
Product
Category
Customer
Supplier
Tank
TankReading
Pump
PumpNozzle
PumpTransaction
Shift
Sale
SaleLine
Purchase
PurchaseLine
InventoryTransaction
InventoryAdjustment
CashTransaction
Receivable
Payable
Account
JournalEntry
JournalLine
TaxRate
Invoice
AccountingPeriod
SyncRecord
AuditLog
```

---

# 50. Mô hình Neon PostgreSQL

Các bảng chính:

```sql
companies
stations
users
roles
permissions
products
categories
customers
suppliers
tanks
tank_readings
pumps
pump_nozzles
pump_transactions
shifts
sales
sale_lines
purchases
purchase_lines
inventory_transactions
inventory_adjustments
cash_transactions
receivables
payables
accounts
journal_entries
journal_lines
tax_rates
invoices
accounting_periods
sync_records
audit_logs
```

Tất cả bảng giao dịch nên có:

```text
id UUID PRIMARY KEY
company_id UUID
station_id UUID
created_at
updated_at
deleted_at
version
```

---

# 51. Multi-device

Ví dụ:

```text
Máy POS 1
Máy POS 2
Máy kế toán
Laptop quản lý
```

Tất cả:

```text
        Neon
       /    \
    Isar    Isar
     |        |
   POS 1    POS 2
```

Mỗi thiết bị có:

```text
device_id
```

---

# 52. Offline

Khi mất Internet:

```text
Bán hàng → Isar
Nhập hàng → Isar
Thu tiền → Isar
Bán POS → Isar
```

Ứng dụng vẫn chạy.

Khi có mạng:

```text
Sync Queue
→ Vercel
→ Neon
```

Riêng các chức năng yêu cầu server hoặc thiết bị ngoại vi online có thể hiển thị:

```text
ONLINE REQUIRED
```

---

# 53. Màn hình Flutter

```text
Splash
Login
Dashboard

Trạm
├── Ca bán hàng
├── Máy bơm
├── Bồn
└── Đo bồn

Bán hàng
├── Xăng dầu
├── POS tạp hóa
├── Nhớt
└── Lịch sử

Kho
├── Nhập
├── Xuất
├── Tồn
├── Điều chỉnh
└── Hao hụt

Công nợ
├── Khách hàng
└── Nhà cung cấp

Kế toán
├── Chứng từ
├── Bút toán
├── Sổ cái
├── Công nợ
└── Khóa sổ

Thuế
├── Thuế đầu vào
├── Thuế đầu ra
└── Báo cáo

Báo cáo
├── Doanh thu
├── Lợi nhuận
├── Tồn kho
├── Bồn
├── Máy bơm
├── Công nợ
├── Thuế
└── Theo tháng/quý/năm

Cài đặt
├── Người dùng
├── Phân quyền
├── Máy bơm
├── Thuế
├── Tài khoản kế toán
├── Sao lưu
└── Đồng bộ
```

---

# 54. Flutter State Management

Khuyến nghị:

```text
Riverpod
```

Pattern:

```text
Screen
 ↓
Provider
 ↓
Controller
 ↓
Repository
 ↓
Isar
```

Không truy cập Isar trực tiếp từ Widget.

---

# 55. Repository

```text
ProductRepository
SaleRepository
PurchaseRepository
InventoryRepository
TankRepository
PumpRepository
CustomerRepository
SupplierRepository
AccountingRepository
ReportRepository
SyncRepository
```

---

# 56. Transaction Safety

Các nghiệp vụ phải dùng transaction.

Ví dụ bán hàng:

```text
BEGIN

Create Sale
Create SaleLine
Create InventoryTransaction
Create Receivable/CashTransaction
Create JournalEntry
Create SyncRecord

COMMIT
```

Nếu một bước lỗi:

```text
ROLLBACK
```

Không để xảy ra:

```text
Đã thu tiền
nhưng chưa giảm kho
```

hoặc:

```text
Đã giảm kho
nhưng chưa ghi doanh thu
```

---

# 57. Quy trình bán xăng + kế toán hoàn chỉnh

```text
1. Máy bơm phát sinh giao dịch
2. Đọc totalizer
3. Xác định số lít
4. Lấy giá bán
5. Tạo Sale
6. Tạo SaleLine
7. Giảm tồn bồn
8. Tính doanh thu
9. Tính thuế
10. Tính giá vốn
11. Ghi nhận tiền/công nợ
12. Sinh JournalEntry
13. Ghi AuditLog
14. Đưa SyncQueue
15. In hóa đơn/biên nhận
```

---

# 58. Quy trình nhập xăng

```text
1. Tạo Purchase
2. Chọn nhà cung cấp
3. Chọn nhiên liệu
4. Chọn bồn
5. Nhập số lượng
6. Ghi số đo bồn trước
7. Ghi số đo sau
8. Đối chiếu
9. Tăng tồn bồn
10. Tăng công nợ NCC
11. Tạo thuế đầu vào
12. Sinh bút toán
13. Audit
14. Sync
```

---

# 59. Báo cáo quản trị trạm

### Báo cáo bán hàng theo ca

```text
Nhân viên
Trụ
Vòi
Loại nhiên liệu
Số lít
Doanh thu
Tiền mặt
Chuyển khoản
Công nợ
```

### Báo cáo hiệu suất vòi

```text
Vòi
Số giao dịch
Số lít
Doanh thu
```

### Báo cáo hao hụt

```text
Bồn
Tồn đầu
Nhập
Xuất
Tồn lý thuyết
Tồn thực tế
Chênh lệch
Định mức
Vượt định mức
```

---

# 60. Báo cáo tài chính/quản trị

Tối thiểu:

```text
Sổ nhật ký chung
Sổ cái
Bảng cân đối phát sinh
Doanh thu
Giá vốn
Lãi lỗ
Công nợ phải thu
Công nợ phải trả
Tồn kho
Dòng tiền
Thuế
```

Các báo cáo chính thức phải được cấu hình theo chế độ kế toán mà doanh nghiệp áp dụng.

---

# 61. Export

Tất cả báo cáo hỗ trợ:

```text
PDF
Excel
CSV
```

Bộ lọc:

```text
Ngày
Tháng
Quý
Năm
Trạm
Kho
Nhân viên
Sản phẩm
Nhóm hàng
Khách hàng
Nhà cung cấp
```

---

# 62. Hiệu năng

Isar:

- Index `sku`
- Index `barcode`
- Index `sale_no`
- Index `invoice_no`
- Index `created_at`
- Index `station_id`
- Index `product_id`
- Index `customer_id`
- Index `supplier_id`
- Index `sync_status`

Báo cáo lớn không tính lại toàn bộ giao dịch mỗi lần mở.

Có thể xây:

```text
DailySummary
MonthlySummary
```

---

# 63. Quy tắc số liệu

Tiền:

```text
Decimal
```

Không dùng `double` cho tiền kế toán.

Số lượng nhiên liệu:

```text
Decimal
```

Ví dụ:

```text
0.001 L
```

hoặc độ chính xác theo thiết bị thực tế.

---

# 64. Thuế

Tạo bảng:

```text
TaxRate
```

```text
id
code
name
rate
effective_from
effective_to
active
```

Không hard-code:

```text
VAT = ...
```

Mọi chứng từ lấy thuế từ cấu hình có hiệu lực tại ngày chứng từ.

---

# 65. Quy tắc nghiệp vụ quan trọng

### Không cho:

```text
Bán vượt tồn
```

trừ khi Admin cho phép âm kho.

### Không cho:

```text
Post bút toán không cân
```

### Không cho:

```text
Sửa chứng từ đã khóa sổ
```

### Không cho:

```text
Xóa giao dịch tài chính đã Post
```

### Không cho:

```text
Tạo giao dịch trùng idempotency key
```

---

# 66. Test bắt buộc

## Unit test

```text
Tính tiền
Tính thuế
Tính giá vốn
Tính tồn
Tính công nợ
Tính hao hụt
Tạo bút toán
Validate Debit/Credit
```

## Integration test

```text
Sale → Inventory → Accounting
Purchase → Inventory → Payable
Receipt → Receivable
Payment → Payable
Pump → Sale → Tank
```

## Offline test

```text
Mất mạng
→ 100 giao dịch
→ bật mạng
→ sync
→ không duplicate
```

## Conflict test

```text
Device A update
Device B update
→ server conflict
```

---

# 67. Lộ trình phát triển

## Phase 1 — Core

```text
Login
Company
Station
User
Product
Customer
Supplier
Isar
```

## Phase 2 — POS

```text
POS
Sale
Payment
Shift
Receipt
```

## Phase 3 — Fuel

```text
Tank
Pump
Nozzle
Tank reading
Pump transaction
```

## Phase 4 — Inventory

```text
Purchase
Inventory
Adjustment
Cost
Hao hụt
```

## Phase 5 — Accounting

```text
Chart of accounts
Journal
AR/AP
Cash
General ledger
Closing
```

## Phase 6 — Tax

```text
Tax
Invoice
Tax reports
Export
```

## Phase 7 — Sync

```text
Vercel API
Neon
Push
Pull
Conflict
Audit
```

## Phase 8 — Hardware

```text
Pump adapter
Sensor adapter
Serial/TCP/Protocol
```

## Phase 9 — Advanced Reports

```text
Daily
Monthly
Quarterly
Yearly
Management dashboard
```

---

# 68. Cấu trúc thư mục Flutter

```text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme.dart
│
├── core/
│   ├── constants/
│   ├── database/
│   ├── network/
│   ├── security/
│   ├── sync/
│   ├── utils/
│   └── printing/
│
├── data/
│   ├── isar/
│   ├── api/
│   └── repositories/
│
├── features/
│   ├── auth/
│   ├── dashboard/
│   ├── station/
│   ├── fuel/
│   ├── pump/
│   ├── tank/
│   ├── pos/
│   ├── inventory/
│   ├── customer/
│   ├── supplier/
│   ├── receivable/
│   ├── payable/
│   ├── cash/
│   ├── accounting/
│   ├── tax/
│   ├── invoice/
│   ├── reports/
│   └── settings/
│
└── shared/
    ├── widgets/
    ├── dialogs/
    └── models/
```

---

# 69. Vercel API structure

```text
api/
├── auth/
├── companies/
├── stations/
├── products/
├── customers/
├── suppliers/
├── tanks/
├── pumps/
├── sales/
├── purchases/
├── inventory/
├── shifts/
├── cash/
├── receivables/
├── payables/
├── accounting/
├── invoices/
├── tax/
├── reports/
└── sync/
```

---

# 70. Neon database design

Sử dụng PostgreSQL.

Khuyến nghị:

```text
UUID
TIMESTAMPTZ
NUMERIC
JSONB
INDEX
FOREIGN KEY
UNIQUE
CHECK CONSTRAINT
```

Đặc biệt:

```sql
CHECK (
    total_debit = total_credit
)
```

hoặc validation tương đương tại transaction/service layer.

---

# 71. Multi-tenant

Mỗi dữ liệu phải thuộc:

```text
company_id
```

Không cho user công ty A đọc dữ liệu công ty B.

API phải kiểm tra:

```text
JWT
→ user
→ company
→ station
→ permission
```

Không tin `company_id` gửi từ Flutter nếu JWT đã xác định tenant.

---

# 72. Cấu hình giá bán

## PriceList

```text
id
product_id
station_id
price
effective_from
effective_to
```

Cho phép:

```text
Giá hiện tại
Giá tương lai
Lịch sử giá
```

Khi tạo Sale:

```text
Snapshot giá vào SaleLine
```

Không phụ thuộc giá hiện tại sau này.

---

# 73. Quản lý bảng giá xăng

Cho phép nhập:

```text
RON95
E5
DO
```

và cập nhật giá.

Khi đổi giá:

```text
PriceHistory
```

Lưu:

```text
old_price
new_price
effective_time
approved_by
```

---

# 74. Kiểm soát gian lận

Audit các sự kiện:

```text
Giảm giá bất thường
Hủy giao dịch
Điều chỉnh tồn
Điều chỉnh bồn
Sửa giá
Xóa khách hàng
Sửa công nợ
Post bút toán
Mở khóa kỳ
```

Dashboard quản trị hiển thị:

```text
Top giao dịch bất thường
Top ca chênh lệch
Top nhân viên hủy giao dịch
Top điều chỉnh kho
```

---

# 75. Kết quả cuối cùng

Ứng dụng sau khi hoàn thành sẽ có mô hình:

```text
                  ┌───────────────┐
                  │   Flutter     │
                  │ Android/Win   │
                  └───────┬───────┘
                          │
                     Isar Offline
                          │
                    Sync Engine
                          │
                     Vercel API
                          │
                    Neon PostgreSQL
                          │
       ┌──────────────────┼──────────────────┐
       │                  │                  │
     POS              KẾ TOÁN            BÁO CÁO
       │                  │                  │
   Xăng dầu           Bút toán            Thuế
   Nhớt               Công nợ             Doanh thu
   Tạp hóa            Giá vốn             Lợi nhuận
       │                  │                  │
       └──────────────┬───┴──────────────────┘
                      │
              TRẠM XĂNG DẦU
                      │
             ┌────────┴────────┐
             │                 │
          Bồn chứa          Máy bơm
             │                 │
        Tồn/hao hụt       Totalizer
```

---

# 76. Tiêu chí nghiệm thu

Ứng dụng chỉ được xem là hoàn thành khi:

- [ ] Bán xăng offline.
- [ ] POS tạp hóa offline.
- [ ] Quản lý ca.
- [ ] Quản lý bồn.
- [ ] Nhập nhiên liệu.
- [ ] Theo dõi tồn bồn.
- [ ] Đối chiếu tồn bồn.
- [ ] Theo dõi hao hụt.
- [ ] Tích hợp được máy bơm theo adapter phù hợp.
- [ ] Quản lý kho.
- [ ] Quản lý khách hàng.
- [ ] Quản lý NCC.
- [ ] Công nợ phải thu.
- [ ] Công nợ phải trả.
- [ ] Thu/chi.
- [ ] Giá vốn.
- [ ] Tạo bút toán.
- [ ] Debit = Credit.
- [ ] Khóa sổ.
- [ ] Audit Log.
- [ ] Đồng bộ Isar → Vercel → Neon.
- [ ] Đồng bộ Neon → Vercel → Isar.
- [ ] Chống duplicate.
- [ ] Xử lý conflict.
- [ ] Báo cáo ngày.
- [ ] Báo cáo tháng.
- [ ] Báo cáo quý.
- [ ] Báo cáo năm.
- [ ] Báo cáo doanh thu.
- [ ] Báo cáo lợi nhuận.
- [ ] Báo cáo tồn kho.
- [ ] Báo cáo bồn.
- [ ] Báo cáo máy bơm.
- [ ] Báo cáo công nợ.
- [ ] Báo cáo thuế.
- [ ] Export Excel/CSV/PDF.
- [ ] Backup/Restore.
- [ ] Phân quyền.
- [ ] Audit.
- [ ] Chạy được Android.
- [ ] Chạy được Windows.

---

# 77. Gợi ý triển khai thực tế

Nên triển khai theo nguyên tắc:

```text
CORE ACCOUNTING
       +
INVENTORY
       +
FUEL MANAGEMENT
       +
POS
       +
SYNC
```

Không nên làm phần máy bơm trước khi xác định rõ:

```text
Hãng máy bơm
Model
Giao thức
Cổng giao tiếp
Tài liệu protocol/API
Cách lấy totalizer
Cách lấy transaction
Cơ chế điều khiển bơm nếu có
```

Phần mềm nên thiết kế **Pump Adapter Layer** ngay từ đầu để sau này có thể thay đổi hãng/model mà không phải sửa toàn bộ hệ thống.

