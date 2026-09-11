# ĐẶC TẢ MODULE THUẾ HỘ KINH DOANH
## KanPosVN – Flutter + Isar + Neon PostgreSQL + Vercel API

> Tài liệu dành cho AI coding agent triển khai module quản lý, tính toán, đối chiếu và hỗ trợ lập hồ sơ khai thuế cho hộ kinh doanh tại Việt Nam.
>
> **Lưu ý pháp lý:** Quy định thuế có thể thay đổi theo từng năm, ngành nghề và phương pháp tính thuế. Không hard-code mức thuế hoặc thời hạn vào mã nguồn. Mọi công thức, biểu mẫu, ngưỡng doanh thu và thời hạn phải được cấu hình theo `tax_policy_version` và được quản trị viên cập nhật.

---

## 1. Mục tiêu

Xây dựng module Thuế Hộ Kinh Doanh tích hợp trong KanPosVN, liên kết trực tiếp với:

- Bán hàng/POS
- Hóa đơn điện tử
- Kho hàng
- Nhập hàng
- Chi phí
- Công nợ phải thu
- Công nợ phải trả
- Kế toán
- Thanh toán
- Doanh thu theo chi nhánh và kênh bán
- Tờ khai thuế
- Đối chiếu dữ liệu thuế

Module phải hỗ trợ offline-first bằng Isar và đồng bộ dữ liệu lên Neon PostgreSQL thông qua Vercel API.

---

## 2. Phạm vi chức năng

### 2.1. Hồ sơ hộ kinh doanh

Quản lý:

- Mã hộ kinh doanh
- Mã số thuế
- Tên hộ kinh doanh
- Tên chủ hộ
- Số định danh/CCCD
- Địa chỉ đăng ký
- Địa chỉ kinh doanh
- Ngành nghề chính
- Ngành nghề phụ
- Ngày bắt đầu kinh doanh
- Phương pháp tính thuế
- Chu kỳ khai thuế
- Tài khoản ngân hàng
- Ví điện tử
- Thông tin người đại diện
- Thông tin cơ quan thuế quản lý
- Trạng thái hoạt động

Không lưu dữ liệu nhạy cảm không cần thiết. Số định danh phải được mã hóa hoặc che một phần khi hiển thị.

### 2.2. Nhiều chi nhánh/địa điểm kinh doanh

Mỗi giao dịch phải gắn với:

```text
tenant_id
business_id
branch_id
```

Hỗ trợ:

- Cửa hàng chính
- Chi nhánh
- Địa điểm kinh doanh
- Kho tổng
- Kho chi nhánh
- Doanh thu theo từng địa điểm
- Báo cáo hợp nhất toàn hộ

### 2.3. Nguồn doanh thu

Hỗ trợ các kênh:

- POS tại cửa hàng
- Website
- Facebook
- TikTok
- Shopee
- Lazada
- Tiki
- Zalo
- Bán sỉ
- Bán lẻ
- Chuyển khoản
- Tiền mặt
- Ví điện tử
- COD
- Doanh thu khác

Mỗi giao dịch phải có:

- Ngày ghi nhận
- Ngày thanh toán
- Kênh bán
- Chi nhánh
- Số chứng từ
- Số hóa đơn
- Khách hàng
- Tổng tiền hàng
- Chiết khấu
- Phụ thu
- Trợ giá
- Phí vận chuyển
- Thuế
- Tổng thanh toán
- Trạng thái hủy/trả hàng

### 2.4. Chi phí

Quản lý:

- Nhập hàng
- Thuê mặt bằng
- Điện
- Nước
- Internet
- Lương
- Vận chuyển
- Marketing
- Bao bì
- Phí ngân hàng
- Phí sàn thương mại điện tử
- Sửa chữa
- Khấu hao
- Công cụ dụng cụ
- Chi phí khác

Mỗi chi phí có:

- Loại chi phí
- Ngày phát sinh
- Nhà cung cấp
- Số tiền trước thuế
- Thuế
- Tổng tiền
- Phương thức thanh toán
- Chứng từ
- Hóa đơn đính kèm
- File scan
- Trạng thái hợp lệ
- Ghi chú

### 2.5. Hóa đơn điện tử

Quản lý:

- Hóa đơn bán ra
- Hóa đơn mua vào
- Hóa đơn điều chỉnh
- Hóa đơn thay thế
- Hóa đơn hủy
- Hóa đơn trả hàng
- Mã cơ quan thuế
- Số hóa đơn
- Ký hiệu
- Ngày lập
- Trạng thái phát hành
- Trạng thái đồng bộ
- Nhà cung cấp dịch vụ hóa đơn
- File XML
- File PDF
- Mã tra cứu

Không tự phát hành hóa đơn nếu chưa tích hợp nhà cung cấp hóa đơn điện tử hợp lệ.

### 2.6. Tờ khai thuế

Hỗ trợ:

- Tạo kỳ khai thuế
- Tự tổng hợp doanh thu
- Tự tổng hợp chi phí
- Phân loại ngành nghề
- Tính thuế dự kiến
- Kiểm tra dữ liệu thiếu
- Lập bản nháp
- Xuất Excel
- Xuất PDF
- Xuất XML nếu có đặc tả chính thức
- Lưu phiên bản tờ khai
- Khóa kỳ khai
- Ghi nhận ngày nộp
- Ghi nhận tiền thuế đã nộp
- Đối chiếu số phải nộp và số đã nộp

---

## 3. Nguyên tắc pháp lý và kiến trúc thuế

### 3.1. Không hard-code chính sách thuế

Tất cả dữ liệu sau phải cấu hình:

- Năm áp dụng
- Ngày bắt đầu hiệu lực
- Ngày kết thúc hiệu lực
- Ngưỡng doanh thu
- Phương pháp tính thuế
- Tỷ lệ thuế theo ngành nghề
- Loại thuế
- Chu kỳ khai
- Hạn nộp
- Biểu mẫu
- Phiên bản biểu mẫu
- Quy tắc làm tròn
- Quy tắc doanh thu tính thuế
- Quy tắc xử lý trả hàng
- Quy tắc xử lý sàn thương mại điện tử

### 3.2. Không coi phần mềm là cơ quan tư vấn thuế

Mọi màn hình tính thuế phải hiển thị:

- Chính sách đang áp dụng
- Phiên bản chính sách
- Ngày cập nhật
- Nguồn văn bản
- Cảnh báo cần kiểm tra với kế toán/cơ quan thuế

### 3.3. Tách số liệu gốc và số liệu tính thuế

Không sửa trực tiếp doanh thu POS để phục vụ khai thuế.

Sử dụng:

```text
Doanh thu gốc
    ↓
Bút toán điều chỉnh thuế
    ↓
Doanh thu tính thuế
```

Mọi điều chỉnh phải có lý do, người thực hiện, thời gian và lịch sử.

---

## 4. Kiến trúc tổng thể

```text
Flutter App
 ├── POS
 ├── Kho
 ├── Mua hàng
 ├── Chi phí
 ├── Công nợ
 ├── Hóa đơn điện tử
 └── Thuế hộ kinh doanh
       ├── Hồ sơ thuế
       ├── Chính sách thuế
       ├── Kỳ khai
       ├── Doanh thu tính thuế
       ├── Chi phí được ghi nhận
       ├── Bộ tính thuế
       ├── Tờ khai
       ├── Đối chiếu
       └── Lịch nộp

Local Isar
    ↓ Sync Queue
Vercel API
    ↓
Neon PostgreSQL
```

---

## 5. Phân quyền

### Owner

- Xem toàn bộ dữ liệu
- Cấu hình hồ sơ thuế
- Xác nhận kỳ khai
- Khóa kỳ khai
- Xem và xuất báo cáo

### Accountant

- Nhập chi phí
- Đối chiếu doanh thu
- Lập bản nháp tờ khai
- Xuất báo cáo
- Không được thay đổi chính sách đã khóa

### Branch Manager

- Xem dữ liệu chi nhánh
- Xác nhận doanh thu chi nhánh
- Xem cảnh báo sai lệch
- Không được sửa tờ khai hợp nhất

### Cashier

- Chỉ tạo doanh thu và chứng từ bán hàng
- Không được xem toàn bộ thông tin thuế

### Admin hệ thống

- Quản lý phiên bản chính sách
- Quản lý biểu mẫu
- Quản lý kết nối hóa đơn điện tử
- Không tự ý sửa số liệu kinh doanh của khách hàng

---

## 6. Mô hình dữ liệu Isar

### 6.1. TaxBusinessProfile

```dart
@collection
class TaxBusinessProfile {
  Id id = Isar.autoIncrement;

  late String tenantId;
  late String businessId;

  String? taxCode;
  String? businessRegistrationCode;
  String? businessName;
  String? ownerName;
  String? maskedIdentityNumber;
  String? address;
  String? provinceCode;
  String? districtCode;
  String? wardCode;
  String? mainBusinessCategory;
  String? taxAuthorityCode;

  String? taxMethod;
  String? filingFrequency;
  int? taxPolicyVersion;

  DateTime? startDate;
  DateTime? updatedAt;

  bool isActive = true;
  bool isSynced = false;
}
```

### 6.2. TaxPolicy

```dart
@collection
class TaxPolicy {
  Id id = Isar.autoIncrement;

  late String policyCode;
  late int year;
  late DateTime effectiveFrom;

  DateTime? effectiveTo;
  String? taxType;
  String? businessCategory;
  String? calculationMethod;
  double? revenueThreshold;
  double? taxRate;
  String? formCode;
  String? sourceDocument;
  String? notes;

  bool isActive = true;
  bool isSynced = false;
}
```

### 6.3. TaxPeriod

```dart
@collection
class TaxPeriod {
  Id id = Isar.autoIncrement;

  late String tenantId;
  late String businessId;

  late int year;
  int? quarter;
  int? month;

  late String periodType;
  late DateTime fromDate;
  late DateTime toDate;

  String status = 'draft';
  DateTime? submittedAt;
  DateTime? lockedAt;
  String? lockedBy;

  double revenue = 0;
  double taxableRevenue = 0;
  double vatAmount = 0;
  double pitAmount = 0;
  double otherTaxAmount = 0;
  double totalTaxAmount = 0;
  double paidTaxAmount = 0;
  double remainingTaxAmount = 0;

  bool isSynced = false;
}
```

### 6.4. TaxRevenueEntry

```dart
@collection
class TaxRevenueEntry {
  Id id = Isar.autoIncrement;

  late String tenantId;
  late String businessId;
  late String branchId;

  String? sourceType;
  String? sourceId;
  String? invoiceNumber;
  String? salesChannel;
  String? businessCategory;

  late DateTime transactionDate;
  DateTime? paymentDate;

  double grossAmount = 0;
  double discountAmount = 0;
  double surchargeAmount = 0;
  double returnAmount = 0;
  double taxAmount = 0;
  double taxableAmount = 0;

  bool includedInTaxPeriod = false;
  bool isAdjustment = false;
  String? adjustmentReason;

  bool isSynced = false;
}
```

### 6.5. TaxExpenseEntry

```dart
@collection
class TaxExpenseEntry {
  Id id = Isar.autoIncrement;

  late String tenantId;
  late String businessId;
  late String branchId;

  String? expenseType;
  String? supplierId;
  String? invoiceNumber;
  String? documentId;

  late DateTime expenseDate;

  double amountBeforeTax = 0;
  double taxAmount = 0;
  double totalAmount = 0;

  bool hasValidDocument = false;
  bool isTaxDeductible = false;
  bool isIncludedInTaxPeriod = false;

  String? rejectionReason;
  bool isSynced = false;
}
```

### 6.6. TaxReturn

```dart
@collection
class TaxReturn {
  Id id = Isar.autoIncrement;

  late String tenantId;
  late String businessId;
  late String taxPeriodId;

  late String formCode;
  late int formVersion;

  String status = 'draft';
  String? xmlContent;
  String? pdfPath;
  String? excelPath;

  double declaredRevenue = 0;
  double declaredVat = 0;
  double declaredPit = 0;
  double declaredOtherTax = 0;
  double declaredTotal = 0;

  DateTime? createdAt;
  DateTime? submittedAt;
  DateTime? approvedAt;
  DateTime? rejectedAt;

  String? submissionReference;
  String? rejectionReason;

  bool isSynced = false;
}
```

### 6.7. TaxPayment

```dart
@collection
class TaxPayment {
  Id id = Isar.autoIncrement;

  late String tenantId;
  late String businessId;
  late String taxPeriodId;

  late DateTime paymentDate;
  double amount = 0;

  String? treasuryCode;
  String? paymentReference;
  String? bankReference;
  String? note;

  bool isSynced = false;
}
```

### 6.8. TaxAdjustment

```dart
@collection
class TaxAdjustment {
  Id id = Isar.autoIncrement;

  late String tenantId;
  late String businessId;
  late String taxPeriodId;

  late String adjustmentType;
  late double amount;
  late String reason;

  String? sourceDocumentId;
  String? createdBy;
  DateTime? createdAt;

  bool approved = false;
  bool isSynced = false;
}
```

---

## 7. Mô hình dữ liệu Neon PostgreSQL

Các bảng tối thiểu:

```text
tax_business_profiles
tax_policies
tax_policy_rates
tax_periods
tax_revenue_entries
tax_expense_entries
tax_returns
tax_return_lines
tax_payments
tax_adjustments
tax_documents
tax_submission_logs
tax_audit_logs
tax_sync_queue
```

### Quy tắc bắt buộc

- Tất cả bảng có `tenant_id`
- Dùng UUID cho khóa chính
- Có `created_at`, `updated_at`
- Có `deleted_at` nếu dùng soft delete
- Có `version` để xử lý đồng bộ
- Có unique key chống tạo trùng
- Có audit log
- Không cho tenant truy cập dữ liệu tenant khác
- API phải kiểm tra quyền ở server, không chỉ ở Flutter

---

## 8. API Vercel

### 8.1. Hồ sơ

```http
GET    /api/tax/profile
POST   /api/tax/profile
PUT    /api/tax/profile
```

### 8.2. Chính sách

```http
GET    /api/tax/policies?year=2026
POST   /api/tax/policies
PUT    /api/tax/policies/:id
```

### 8.3. Kỳ khai

```http
GET    /api/tax/periods
POST   /api/tax/periods
GET    /api/tax/periods/:id
POST   /api/tax/periods/:id/calculate
POST   /api/tax/periods/:id/lock
```

### 8.4. Doanh thu và chi phí

```http
GET    /api/tax/revenue
POST   /api/tax/revenue/adjustment
GET    /api/tax/expenses
POST   /api/tax/expenses
```

### 8.5. Tờ khai

```http
POST   /api/tax/returns/generate
GET    /api/tax/returns/:id
PUT    /api/tax/returns/:id
POST   /api/tax/returns/:id/export
POST   /api/tax/returns/:id/submit
```

### 8.6. Đối chiếu

```http
POST   /api/tax/reconciliation/run
GET    /api/tax/reconciliation/results
```

### 8.7. Đồng bộ

```http
POST   /api/sync/push
POST   /api/sync/pull
GET    /api/sync/status
```

---

## 9. Bộ tính thuế

### 9.1. Input

- Hồ sơ hộ kinh doanh
- Năm tính thuế
- Kỳ tính thuế
- Ngành nghề
- Phương pháp tính thuế
- Doanh thu gốc
- Doanh thu điều chỉnh
- Chi phí hợp lệ
- Chính sách thuế hiệu lực
- Hóa đơn và chứng từ

### 9.2. Output

```json
{
  "period": "2026-Q1",
  "grossRevenue": 0,
  "taxableRevenue": 0,
  "deductibleExpense": 0,
  "vatAmount": 0,
  "pitAmount": 0,
  "otherTaxAmount": 0,
  "totalTaxAmount": 0,
  "warnings": [],
  "policyVersion": 1
}
```

### 9.3. Quy tắc tính

Không viết công thức cố định trực tiếp trong UI.

Tạo interface:

```dart
abstract class TaxCalculator {
  TaxCalculationResult calculate(TaxCalculationInput input);
}
```

Các implementation:

```text
RevenueBasedTaxCalculator
IncomeBasedTaxCalculator
MixedTaxCalculator
ExemptRevenueCalculator
```

### 9.4. Làm tròn

- Tính toán bằng `Decimal` hoặc thư viện số chính xác
- Không dùng `double` cho số tiền cuối cùng nếu có thể tránh
- Làm tròn theo chính sách
- Lưu cả giá trị trước và sau làm tròn
- Hiển thị sai số làm tròn nếu có

---

## 10. Luồng tính thuế

```text
Chọn hộ kinh doanh
    ↓
Chọn năm/kỳ khai
    ↓
Tải chính sách thuế
    ↓
Tổng hợp doanh thu POS
    ↓
Tổng hợp doanh thu online
    ↓
Tổng hợp doanh thu sàn
    ↓
Trừ giao dịch trả hàng hợp lệ
    ↓
Tổng hợp chi phí
    ↓
Kiểm tra chứng từ
    ↓
Phân loại ngành nghề
    ↓
Tính GTGT
    ↓
Tính TNCN
    ↓
Tính thuế khác
    ↓
Sinh cảnh báo
    ↓
Người dùng kiểm tra
    ↓
Tạo bản nháp tờ khai
    ↓
Khóa kỳ khai
    ↓
Xuất hồ sơ
    ↓
Nộp qua hệ thống được hỗ trợ
    ↓
Ghi nhận kết quả và tiền thuế
```

---

## 11. Kiểm tra dữ liệu trước khi khai

Các cảnh báo bắt buộc:

- Thiếu mã số thuế
- Thiếu ngành nghề
- Thiếu phương pháp tính thuế
- Doanh thu POS khác doanh thu khai thuế
- Có hóa đơn bán hàng chưa đồng bộ
- Có hóa đơn bị hủy nhưng vẫn tính doanh thu
- Có giao dịch trả hàng chưa xử lý
- Có chi phí không có chứng từ
- Có doanh thu chưa phân loại ngành nghề
- Có nhiều chi nhánh chưa hợp nhất
- Có dữ liệu trùng
- Có kỳ khai đã khóa nhưng phát sinh giao dịch mới
- Có chính sách thuế hết hiệu lực
- Có số thuế âm bất thường
- Có chênh lệch giữa số phải nộp và số đã nộp

Mức độ:

```text
error   = không cho tạo tờ khai
warning = cho tạo nhưng phải xác nhận
info    = chỉ thông báo
```

---

## 12. Màn hình Flutter

### 12.1. Dashboard Thuế

Hiển thị:

- Doanh thu tháng
- Doanh thu quý
- Doanh thu năm
- Doanh thu tính thuế
- Thuế GTGT dự kiến
- Thuế TNCN dự kiến
- Thuế khác
- Tổng thuế dự kiến
- Đã nộp
- Còn phải nộp
- Kỳ khai sắp đến hạn
- Hóa đơn chưa đồng bộ
- Chứng từ thiếu
- Chênh lệch cần xử lý

### 12.2. Hồ sơ thuế

Tabs:

- Thông tin chung
- Ngành nghề
- Phương pháp tính thuế
- Chu kỳ khai
- Tài khoản/ví
- Cơ quan thuế
- Lịch sử thay đổi

### 12.3. Doanh thu tính thuế

Bộ lọc:

- Thời gian
- Chi nhánh
- Kênh bán
- Ngành nghề
- Loại chứng từ
- Trạng thái đối chiếu

Chức năng:

- Xem chi tiết
- Đánh dấu loại trừ
- Tạo điều chỉnh
- Xuất Excel
- Đối chiếu với POS

### 12.4. Chi phí

Bộ lọc:

- Thời gian
- Loại chi phí
- Nhà cung cấp
- Có hóa đơn/không có hóa đơn
- Hợp lệ/không hợp lệ
- Đã đưa vào kỳ khai/chưa

### 12.5. Kỳ khai thuế

Trạng thái:

```text
draft
calculating
reviewing
ready
locked
submitted
accepted
rejected
amended
```

### 12.6. Tờ khai

Chức năng:

- Sinh tờ khai
- Xem từng chỉ tiêu
- Xem nguồn dữ liệu
- Xem công thức
- Sửa điều chỉnh có lý do
- Xuất Excel/PDF
- Lưu phiên bản
- Khóa tờ khai
- Ghi nhận nộp
- Ghi nhận phản hồi

---

## 13. Báo cáo

### 13.1. Báo cáo doanh thu

- Theo ngày
- Theo tháng
- Theo quý
- Theo năm
- Theo chi nhánh
- Theo ngành nghề
- Theo kênh bán
- Theo khách hàng
- Theo nhóm hàng

### 13.2. Báo cáo thuế

- Doanh thu tính thuế
- Thuế GTGT
- Thuế TNCN
- Thuế khác
- Tổng thuế
- Đã nộp
- Còn phải nộp
- Lịch sử kỳ khai
- Tờ khai đã lập
- Tờ khai đã nộp
- Tờ khai bị từ chối

### 13.3. Báo cáo đối chiếu

```text
Doanh thu POS
    vs
Doanh thu hóa đơn
    vs
Doanh thu ngân hàng
    vs
Doanh thu sàn
    vs
Doanh thu khai thuế
```

Hiển thị:

- Số khớp
- Số lệch
- Giá trị lệch
- Nguyên nhân dự kiến
- Chứng từ liên quan
- Người xử lý
- Trạng thái xử lý

---

## 14. Đồng bộ offline-first

### 14.1. Nguyên tắc

- Mọi thao tác tạo/sửa được lưu Isar trước
- Đưa sự kiện vào sync queue
- Đồng bộ nền khi có mạng
- Có retry
- Có exponential backoff
- Có idempotency key
- Không tạo trùng giao dịch
- Không mất dữ liệu khi mất mạng

### 14.2. Xung đột

Ưu tiên:

1. Bản ghi đã khóa không được ghi đè
2. Dữ liệu thuế đã nộp chỉ được điều chỉnh bằng bản ghi mới
3. Xung đột phải tạo log
4. Người có quyền phải xác nhận
5. Không tự động ghi đè tờ khai đã khóa

### 14.3. Trạng thái đồng bộ

```text
pending
uploading
synced
failed
conflict
locked
```

---

## 15. Bảo mật

- JWT hoặc cơ chế xác thực hiện tại của KanPosVN
- Kiểm tra `tenant_id` ở server
- Phân quyền theo vai trò
- Mã hóa dữ liệu nhạy cảm
- Không ghi mã số thuế/CCCD đầy đủ vào log
- Audit mọi thay đổi
- Không cho xóa cứng tờ khai đã khóa
- Giới hạn tốc độ API
- Kiểm tra file upload
- Giới hạn kích thước file
- Quét tên và loại file
- Không cho thực thi file đính kèm

---

## 16. Audit log

Mỗi hành động quan trọng phải lưu:

```text
id
tenant_id
business_id
user_id
action
entity_type
entity_id
old_value
new_value
reason
ip_hash
created_at
```

Các hành động cần audit:

- Sửa doanh thu tính thuế
- Loại trừ chứng từ
- Sửa chi phí
- Thay đổi chính sách
- Tạo tờ khai
- Khóa tờ khai
- Mở khóa
- Ghi nhận nộp thuế
- Điều chỉnh tờ khai
- Đồng bộ dữ liệu

---

## 17. Kiểm thử

### Unit test

- Tính doanh thu
- Tính doanh thu sau trả hàng
- Phân loại ngành nghề
- Áp dụng chính sách theo ngày hiệu lực
- Tính thuế theo từng phương pháp
- Làm tròn
- Tạo cảnh báo
- Tạo tờ khai
- Đối chiếu

### Integration test

- POS → Thuế
- Mua hàng → Chi phí
- Hóa đơn điện tử → Thuế
- Isar → Vercel → Neon
- Đồng bộ khi mất mạng
- Đồng bộ trùng dữ liệu
- Khóa kỳ khai
- Phân quyền tenant

### Acceptance test

- Hộ có một cửa hàng
- Hộ có nhiều chi nhánh
- Hộ có nhiều ngành nghề
- Hộ bán online và offline
- Hộ có trả hàng
- Hộ có chi phí thiếu chứng từ
- Hộ thay đổi phương pháp tính thuế
- Hộ có kỳ khai bị từ chối
- Hộ lập tờ khai điều chỉnh

---

## 18. Cấu trúc thư mục Flutter đề xuất

```text
lib/
 ├── core/
 │    ├── constants/
 │    ├── errors/
 │    ├── network/
 │    ├── security/
 │    └── utils/
 │
 ├── features/
 │    └── tax/
 │         ├── data/
 │         │    ├── datasources/
 │         │    ├── models/
 │         │    ├── repositories/
 │         │    └── sync/
 │         │
 │         ├── domain/
 │         │    ├── entities/
 │         │    ├── calculators/
 │         │    ├── services/
 │         │    └── validators/
 │         │
 │         └── presentation/
 │              ├── providers/
 │              ├── screens/
 │              ├── widgets/
 │              └── controllers/
 │
 └── shared/
      ├── database/
      ├── widgets/
      └── services/
```

---

## 19. Lộ trình triển khai

### Giai đoạn 1

- Hồ sơ hộ kinh doanh
- Kỳ khai
- Tổng hợp doanh thu
- Dashboard
- Chính sách thuế cấu hình
- Báo cáo cơ bản

### Giai đoạn 2

- Chi phí
- Hóa đơn mua/bán
- Đối chiếu
- Tính thuế theo phương pháp
- Xuất Excel/PDF

### Giai đoạn 3

- Tờ khai
- Phiên bản tờ khai
- Khóa kỳ
- Audit log
- Ghi nhận nộp thuế

### Giai đoạn 4

- Tích hợp nhà cung cấp hóa đơn điện tử
- Tích hợp hệ thống nộp hồ sơ nếu có API chính thức
- Tự động đồng bộ
- Cảnh báo hạn nộp
- Báo cáo hợp nhất nhiều chi nhánh

---

## 20. Tiêu chí hoàn thành

Module được xem là hoàn thành khi:

- Có thể khai báo hồ sơ hộ kinh doanh
- Có thể quản lý nhiều chi nhánh
- Có thể lấy doanh thu từ POS
- Có thể lấy chi phí từ hệ thống mua hàng/kế toán
- Có thể phân loại doanh thu theo ngành nghề
- Có thể áp dụng chính sách thuế theo năm hiệu lực
- Có thể tính thuế dự kiến
- Có thể phát hiện dữ liệu thiếu
- Có thể đối chiếu doanh thu
- Có thể tạo bản nháp tờ khai
- Có thể xuất báo cáo
- Có thể khóa kỳ khai
- Có audit log
- Có đồng bộ Isar/Neon
- Có phân quyền tenant
- Có unit test và integration test
- Không hard-code mức thuế
- Không làm mất dữ liệu khi offline

---

## 21. Yêu cầu dành cho coding agent

Coding agent phải thực hiện theo thứ tự:

1. Đọc kiến trúc hiện tại của KanPosVN.
2. Không phá vỡ module POS, kho, công nợ và đồng bộ hiện có.
3. Kiểm tra phiên bản Flutter, Dart, Isar và các package đang dùng.
4. Tạo migration database an toàn.
5. Tạo entity/model.
6. Tạo repository.
7. Tạo service tính thuế.
8. Tạo API Vercel.
9. Tạo migration Neon.
10. Tạo provider/controller Riverpod.
11. Tạo màn hình Flutter.
12. Tạo báo cáo.
13. Tạo kiểm thử.
14. Tạo tài liệu cấu hình.
15. Chạy `flutter analyze`.
16. Chạy `flutter test`.
17. Kiểm tra build Windows và Android.
18. Không tự suy đoán mức thuế pháp lý nếu chưa có nguồn chính sách được cấu hình.
19. Mọi công thức phải có test.
20. Mọi thay đổi dữ liệu thuế quan trọng phải có audit log.

---

## 22. Kết luận

Module Thuế Hộ Kinh Doanh phải được xây dựng như một phân hệ nghiệp vụ độc lập nhưng liên kết chặt với POS, kho, mua hàng, chi phí, công nợ, hóa đơn điện tử và kế toán.

Kiến trúc đúng:

```text
POS
 + Kho
 + Mua hàng
 + Chi phí
 + Công nợ
 + Hóa đơn
 + Kế toán
        ↓
  Tax Data Layer
        ↓
  Tax Policy Engine
        ↓
  Tax Calculator
        ↓
  Tax Return Generator
        ↓
  Reconciliation
        ↓
  Reports / Export / Submission
```

Không được coi module này chỉ là một màn hình nhập doanh thu và nhân với một tỷ lệ thuế cố định.
