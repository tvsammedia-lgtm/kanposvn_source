# MODULE THUẾ HỘ KINH DOANH CHO KANPOSVN

## 1. Mục tiêu

Xây dựng module quản lý thuế hộ kinh doanh tích hợp vào hệ thống KanPosVN:

- Flutter mobile/desktop.
- Isar Database chạy offline.
- Neon PostgreSQL lưu trữ tập trung.
- Vercel API làm lớp backend.
- Hỗ trợ nhiều hộ kinh doanh, nhiều cửa hàng/chi nhánh.
- Liên kết dữ liệu bán hàng, mua hàng, kho, công nợ, chi phí, kế toán và hóa đơn điện tử.
- Tạo báo cáo doanh thu, thuế GTGT, thuế TNCN, tờ khai và lịch nộp thuế.
- Không tự động kết luận nghĩa vụ thuế nếu chưa xác định đúng năm áp dụng, ngành nghề, phương pháp tính thuế và hồ sơ thực tế.

> Lưu ý pháp lý: Các mức thuế, ngưỡng doanh thu, biểu mẫu và thời hạn có thể thay đổi. Không hard-code quy định vào mã nguồn. Phải xây dựng bảng cấu hình theo năm hiệu lực và cho phép cập nhật bởi quản trị viên có quyền.

---

## 2. Phạm vi chức năng

### 2.1. Hồ sơ hộ kinh doanh

Quản lý:

- Mã số thuế.
- Tên hộ kinh doanh.
- Tên chủ hộ.
- Số định danh/CCCD.
- Địa chỉ đăng ký.
- Địa chỉ từng địa điểm kinh doanh.
- Ngành nghề chính/phụ.
- Ngày bắt đầu hoạt động.
- Số điện thoại, email.
- Tài khoản ngân hàng.
- Ví điện tử.
- Phương pháp tính thuế.
- Cơ quan thuế quản lý.
- Kỳ khai thuế.
- Trạng thái hoạt động.
- Năm bắt đầu áp dụng cấu hình thuế.

Không lưu mật khẩu, mã OTP hoặc thông tin nhạy cảm không cần thiết.

### 2.2. Quản lý nhiều địa điểm kinh doanh

Cấu trúc:

```text
Business/Tenant
 ├── Branch 01
 ├── Branch 02
 ├── Branch 03
 └── Branch N
```

Mọi giao dịch phải có:

- tenantId
- businessId
- branchId
- fiscalYear
- sourceModule
- sourceDocumentId

Cho phép:

- Báo cáo từng chi nhánh.
- Báo cáo toàn hộ kinh doanh.
- Phân bổ chi phí theo chi nhánh.
- Gộp doanh thu theo kỳ khai.
- Theo dõi trạng thái hóa đơn từng chi nhánh.

---

## 3. Nguyên tắc nghiệp vụ thuế

### 3.1. Không tính thuế trực tiếp từ số tiền thu

Doanh thu phải được xác định từ chứng từ hợp lệ:

- Hóa đơn bán hàng.
- Phiếu bán hàng POS.
- Đơn hàng online.
- Doanh thu sàn thương mại điện tử.
- Doanh thu dịch vụ.
- Doanh thu khác.
- Khoản phụ thu, trợ giá, thưởng doanh số hoặc hỗ trợ nếu thuộc doanh thu tính thuế theo quy định.

Phân biệt:

- Doanh thu phát sinh.
- Doanh thu đã thu tiền.
- Doanh thu đã lập hóa đơn.
- Doanh thu bị hủy.
- Doanh thu bị trả lại.
- Doanh thu điều chỉnh.
- Doanh thu tính thuế.
- Doanh thu không tính thuế.
- Doanh thu được miễn/không chịu thuế theo cấu hình pháp lý.

### 3.2. Cấu hình theo thời gian

Mỗi quy tắc thuế phải có:

- ruleCode
- taxYear
- effectiveFrom
- effectiveTo
- businessType
- revenueMin
- revenueMax
- taxType
- calculationMethod
- rate
- fixedAmount
- deductibleRule
- sourceReference
- status

Không dùng một công thức cố định cho mọi hộ kinh doanh.

---

## 4. Phân loại ngành nghề

Tạo danh mục ngành nghề có thể mở rộng:

- Bán lẻ hàng hóa.
- Bán buôn hàng hóa.
- Dịch vụ ăn uống.
- Nhà hàng/cafe/trà sữa.
- Dịch vụ lưu trú.
- Vận tải.
- Xây dựng.
- Sản xuất.
- Đại lý.
- Môi giới.
- Dịch vụ chuyên môn.
- Dịch vụ khác.
- Ngành nghề hỗn hợp.

Một hộ có thể có nhiều ngành nghề. Mỗi ngành nghề có thể có:

- Tỷ lệ GTGT riêng.
- Tỷ lệ TNCN riêng.
- Phương pháp tính riêng.
- Doanh thu riêng.
- Quy tắc phân bổ riêng.

---

## 5. Phân hệ doanh thu

### 5.1. Nguồn doanh thu

- POS tại quầy.
- Bán hàng bằng điện thoại.
- Website.
- Facebook.
- TikTok.
- Shopee.
- Lazada.
- Tiki.
- Đơn hàng giao tận nơi.
- Chuyển khoản.
- Tiền mặt.
- Ví điện tử.
- COD.
- Doanh thu dịch vụ.
- Doanh thu khác.

### 5.2. Bảng doanh thu chuẩn hóa

```text
TaxRevenueEntry
 ├── id
 ├── tenantId
 ├── businessId
 ├── branchId
 ├── fiscalYear
 ├── taxPeriod
 ├── documentDate
 ├── documentType
 ├── documentId
 ├── invoiceNumber
 ├── salesChannel
 ├── customerId
 ├── industryCode
 ├── grossRevenue
 ├── discountAmount
 ├── returnAmount
 ├── adjustmentAmount
 ├── taxableRevenue
 ├── nonTaxableRevenue
 ├── vatTaxableRevenue
 ├── pitTaxableRevenue
 ├── paymentStatus
 ├── syncStatus
 ├── createdAt
 └── updatedAt
```

### 5.3. Quy tắc đối chiếu

Doanh thu thuế phải đối chiếu với:

```text
POS doanh thu
+ Doanh thu online
+ Doanh thu dịch vụ
+ Doanh thu khác
- Hàng bán bị trả lại
- Hóa đơn hủy hợp lệ
± Điều chỉnh
= Doanh thu chuẩn hóa
```

Không được tự động coi mọi khoản thu ngân hàng là doanh thu.

---

## 6. Phân hệ chi phí

### 6.1. Danh mục chi phí

- Giá vốn hàng bán.
- Nhập hàng.
- Thuê mặt bằng.
- Điện.
- Nước.
- Internet.
- Điện thoại.
- Lương.
- Bảo hiểm.
- Vận chuyển.
- Marketing.
- Phí sàn.
- Phí ngân hàng.
- Bao bì.
- Công cụ dụng cụ.
- Khấu hao.
- Sửa chữa.
- Thuê ngoài.
- Chi phí khác.

### 6.2. Chứng từ chi phí

```text
TaxExpenseEntry
 ├── id
 ├── tenantId
 ├── businessId
 ├── branchId
 ├── expenseDate
 ├── expenseCategoryId
 ├── supplierId
 ├── description
 ├── amountBeforeTax
 ├── vatAmount
 ├── totalAmount
 ├── invoiceNumber
 ├── invoiceDate
 ├── paymentMethod
 ├── attachmentIds
 ├── deductibleStatus
 ├── rejectionReason
 ├── accountingAccount
 ├── taxPeriod
 ├── syncStatus
 ├── createdAt
 └── updatedAt
```

### 6.3. Trạng thái chi phí

- Draft.
- Submitted.
- Verified.
- Deductible.
- NonDeductible.
- Rejected.
- Cancelled.

Phải cho phép người dùng nhập chi phí nhưng hệ thống không tự khẳng định chi phí đó chắc chắn được khấu trừ. Quyết định cuối cùng phải dựa trên quy định và hồ sơ chứng từ.

---

## 7. Phân hệ thuế GTGT

### 7.1. Dữ liệu đầu vào

- Doanh thu chịu GTGT.
- Nhóm ngành nghề.
- Tỷ lệ GTGT.
- Doanh thu không chịu GTGT.
- Doanh thu miễn/không tính thuế.
- Điều chỉnh tăng/giảm.
- Kỳ khai thuế.
- Phương pháp tính thuế.

### 7.2. Công thức cấu hình

```text
VATPayable = TaxableRevenue × VATRate + Adjustments
```

Không đặt cố định VATRate trong code. Lấy từ TaxRule theo:

- Năm.
- Ngành nghề.
- Phương pháp.
- Loại doanh thu.
- Thời gian hiệu lực.

### 7.3. Báo cáo GTGT

- Doanh thu theo nhóm ngành.
- Doanh thu chịu thuế.
- Doanh thu không chịu thuế.
- Tỷ lệ áp dụng.
- Thuế GTGT dự kiến.
- Thuế GTGT đã khai.
- Thuế GTGT đã nộp.
- Chênh lệch.
- Lịch sử điều chỉnh.

---

## 8. Phân hệ thuế TNCN

### 8.1. Các phương pháp cần hỗ trợ

Thiết kế engine có thể hỗ trợ:

1. Tính theo doanh thu.
2. Tính theo thu nhập tính thuế.
3. Phương pháp khác theo quy định từng thời kỳ.
4. Trường hợp miễn/không phát sinh nghĩa vụ.
5. Trường hợp hộ có nhiều ngành nghề.

### 8.2. Công thức tổng quát

Theo doanh thu:

```text
PITPayable = TaxableRevenue × PITRate + Adjustments
```

Theo thu nhập:

```text
TaxableIncome = Revenue - AllowedExpenses - OtherAdjustments
PITPayable = TaxableIncome × PITRate
```

Đây chỉ là công thức khung. Engine phải đọc quy tắc pháp lý tương ứng, không mặc định áp dụng cho mọi hộ.

### 8.3. Báo cáo TNCN

- Doanh thu.
- Chi phí hợp lệ dự kiến.
- Thu nhập tính thuế.
- Tỷ lệ/biểu thuế.
- Thuế TNCN dự kiến.
- Thuế đã khai.
- Thuế đã nộp.
- Chênh lệch.
- Cảnh báo thiếu chứng từ.

---

## 9. Các khoản thuế/phí khác

Thiết kế danh mục mở rộng:

- Lệ phí môn bài hoặc khoản thay thế theo quy định từng thời kỳ.
- Thuế tài nguyên.
- Thuế bảo vệ môi trường.
- Thuế nhà thầu nếu phát sinh.
- Thuế sử dụng đất phi nông nghiệp nếu liên quan.
- Các khoản phí, lệ phí khác.

Không tự động bật các khoản này cho mọi hộ.

---

## 10. Kỳ khai thuế và lịch hạn

### 10.1. Kỳ khai

- Tháng.
- Quý.
- Năm.
- Theo từng loại thuế.
- Theo trường hợp đặc biệt.

### 10.2. Bảng TaxPeriod

```text
TaxPeriod
 ├── id
 ├── tenantId
 ├── fiscalYear
 ├── taxType
 ├── periodType
 ├── periodNumber
 ├── periodStart
 ├── periodEnd
 ├── declarationDueDate
 ├── paymentDueDate
 ├── status
 ├── submittedAt
 ├── paidAt
 ├── declaredAmount
 ├── paidAmount
 ├── note
 └── syncStatus
```

### 10.3. Trạng thái

- Upcoming.
- Open.
- Draft.
- ReadyToSubmit.
- Submitted.
- Accepted.
- Rejected.
- Paid.
- Overdue.
- Cancelled.

---

## 11. Tờ khai thuế

### 11.1. Mục tiêu

- Tạo tờ khai từ dữ liệu đã đối chiếu.
- Cho phép sửa thủ công có nhật ký.
- Xuất Excel/PDF.
- Lưu bản nháp.
- Lưu phiên bản.
- Theo dõi trạng thái nộp.
- Đính kèm biên nhận.
- Không tự động gửi cơ quan thuế nếu chưa có tích hợp chính thức và quyền xác nhận.

### 11.2. Bảng TaxDeclaration

```text
TaxDeclaration
 ├── id
 ├── tenantId
 ├── businessId
 ├── taxYear
 ├── taxPeriod
 ├── taxType
 ├── formCode
 ├── formVersion
 ├── methodCode
 ├── revenueAmount
 ├── expenseAmount
 ├── taxableIncome
 ├── vatAmount
 ├── pitAmount
 ├── otherTaxAmount
 ├── totalPayable
 ├── dataHash
 ├── status
 ├── submittedAt
 ├── acceptedAt
 ├── receiptNumber
 ├── attachmentIds
 ├── createdBy
 ├── approvedBy
 ├── createdAt
 └── updatedAt
```

### 11.3. Phiên bản biểu mẫu

Mỗi biểu mẫu phải có:

- formCode.
- formName.
- effectiveFrom.
- effectiveTo.
- schemaVersion.
- fieldDefinitions.
- validationRules.
- exportTemplate.
- sourceReference.

Không ghi cứng tên biểu mẫu trong giao diện.

---

## 12. Hóa đơn điện tử

### 12.1. Chức năng

- Quản lý nhà cung cấp HĐĐT.
- Cấu hình thông tin người bán.
- Tạo hóa đơn.
- Phát hành hóa đơn.
- Hủy hóa đơn.
- Điều chỉnh hóa đơn.
- Thay thế hóa đơn.
- Tra cứu trạng thái.
- Lưu mã cơ quan thuế.
- Lưu XML/PDF.
- Đối chiếu hóa đơn với giao dịch POS.

### 12.2. Bảng ElectronicInvoice

```text
ElectronicInvoice
 ├── id
 ├── tenantId
 ├── businessId
 ├── branchId
 ├── providerCode
 ├── invoiceType
 ├── invoiceSeries
 ├── invoiceNumber
 ├── invoiceDate
 ├── customerName
 ├── customerTaxCode
 ├── subtotal
 ├── vatAmount
 ├── totalAmount
 ├── status
 ├── taxAuthorityCode
 ├── lookupCode
 ├── xmlFileId
 ├── pdfFileId
 ├── sourceDocumentId
 ├── issuedAt
 ├── cancelledAt
 ├── adjustedFromId
 └── updatedAt
```

### 12.3. Tích hợp nhà cung cấp

Tạo interface:

```dart
abstract class EInvoiceProvider {
  Future<EInvoiceDraft> createDraft(EInvoiceRequest request);
  Future<EInvoiceResult> issue(EInvoiceRequest request);
  Future<EInvoiceResult> cancel(String invoiceId);
  Future<EInvoiceResult> adjust(String invoiceId, AdjustmentRequest request);
  Future<EInvoiceResult> replace(String invoiceId, ReplacementRequest request);
  Future<EInvoiceStatus> getStatus(String invoiceId);
  Future<List<EInvoiceResult>> search(EInvoiceSearchRequest request);
}
```

Không khóa hệ thống vào một nhà cung cấp duy nhất.

---

## 13. Đối chiếu dữ liệu

### 13.1. Đối chiếu doanh thu

- POS với hóa đơn điện tử.
- POS với ngân hàng.
- POS với sàn.
- POS với báo cáo kho.
- POS với sổ kế toán.
- Doanh thu nội bộ với doanh thu đã khai.

### 13.2. Đối chiếu chi phí

- Phiếu nhập kho với hóa đơn mua.
- Công nợ nhà cung cấp với chứng từ.
- Chi phí với thanh toán ngân hàng.
- Chi phí với file hóa đơn đính kèm.

### 13.3. Bảng TaxReconciliation

```text
TaxReconciliation
 ├── id
 ├── tenantId
 ├── businessId
 ├── taxPeriod
 ├── reconciliationType
 ├── sourceAmount
 ├── targetAmount
 ├── differenceAmount
 ├── differenceCount
 ├── status
 ├── issueSummary
 ├── resolutionNote
 ├── createdAt
 └── updatedAt
```

Trạng thái:

- Matched.
- Difference.
- MissingSource.
- MissingTarget.
- PendingReview.
- Resolved.

---

## 14. Dashboard thuế

Hiển thị:

- Doanh thu tháng.
- Doanh thu quý.
- Doanh thu năm.
- Doanh thu từng chi nhánh.
- Doanh thu từng ngành nghề.
- Doanh thu từng kênh bán.
- Thuế GTGT dự kiến.
- Thuế TNCN dự kiến.
- Tổng nghĩa vụ dự kiến.
- Đã khai.
- Đã nộp.
- Còn phải nộp.
- Tờ khai sắp đến hạn.
- Tờ khai quá hạn.
- Hóa đơn chưa đồng bộ.
- Chứng từ thiếu.
- Chênh lệch đối chiếu.

### Cảnh báo

- Doanh thu vượt ngưỡng cấu hình.
- Thiếu mã số thuế.
- Thiếu ngành nghề.
- Thiếu chứng từ chi phí.
- Hóa đơn chưa phát hành.
- Hóa đơn phát hành lỗi.
- Tờ khai sắp đến hạn.
- Dữ liệu chưa đồng bộ.
- Doanh thu POS khác doanh thu khai.
- Có giao dịch bị hủy nhưng chưa điều chỉnh thuế.

---

## 15. Thiết kế Isar

### 15.1. Collections chính

- BusinessProfile.
- BusinessBranch.
- BusinessIndustry.
- TaxRule.
- TaxPeriod.
- TaxRevenueEntry.
- TaxExpenseEntry.
- TaxDeclaration.
- TaxDeclarationLine.
- TaxPayment.
- ElectronicInvoice.
- TaxReconciliation.
- TaxAttachment.
- TaxAuditLog.
- TaxSyncQueue.

### 15.2. Quy tắc Isar

- Mỗi collection có id nội bộ.
- Có uuid ổn định để đồng bộ.
- Có createdAt, updatedAt.
- Có syncStatus.
- Có serverVersion.
- Có deletedAt cho soft delete.
- Không xóa cứng chứng từ đã phát sinh nghĩa vụ thuế.
- Dùng transaction khi tạo hóa đơn, doanh thu và công nợ.
- Dùng index cho tenantId, businessId, branchId, taxYear, taxPeriod, status.

---

## 16. Thiết kế Neon PostgreSQL

### 16.1. Nguyên tắc

- PostgreSQL là nguồn dữ liệu cloud.
- Mỗi bảng có tenant_id.
- RLS hoặc lớp kiểm tra tenant ở API.
- Không cho client truy cập trực tiếp database.
- Tất cả thao tác đi qua Vercel API.
- Có audit log.
- Có soft delete.
- Có unique key theo tenant.
- Có optimistic locking.

### 16.2. Bảng đề xuất

```text
business_profiles
business_branches
business_industries
tax_rules
tax_periods
tax_revenue_entries
tax_expense_entries
tax_declarations
tax_declaration_lines
tax_payments
electronic_invoices
tax_reconciliations
tax_attachments
tax_audit_logs
sync_queue
```

---

## 17. Vercel API

### 17.1. API endpoints

```text
GET    /api/tax/profile
POST   /api/tax/profile
PUT    /api/tax/profile/:id

GET    /api/tax/rules
POST   /api/tax/rules
PUT    /api/tax/rules/:id

GET    /api/tax/revenue
POST   /api/tax/revenue
PUT    /api/tax/revenue/:id

GET    /api/tax/expenses
POST   /api/tax/expenses
PUT    /api/tax/expenses/:id

GET    /api/tax/periods
POST   /api/tax/periods

GET    /api/tax/declarations
POST   /api/tax/declarations
PUT    /api/tax/declarations/:id
POST   /api/tax/declarations/:id/submit

GET    /api/tax/reconciliation
POST   /api/tax/reconciliation/run

GET    /api/einvoice
POST   /api/einvoice/issue
POST   /api/einvoice/cancel
POST   /api/einvoice/adjust
POST   /api/einvoice/replace

POST   /api/sync/push
POST   /api/sync/pull
```

### 17.2. API response chuẩn

```json
{
  "success": true,
  "data": {},
  "message": null,
  "errors": [],
  "serverTime": "2026-01-01T00:00:00Z",
  "requestId": "uuid"
}
```

### 17.3. Bảo mật

- JWT hoặc session token.
- Kiểm tra tenantId từ token, không tin tenantId do client gửi.
- Phân quyền owner, accountant, cashier, taxOfficer, admin.
- Audit mọi thay đổi tờ khai.
- Không ghi token vào log.
- Mã hóa file chứng từ khi cần.
- Rate limit API.
- Idempotency key cho phát hành hóa đơn và nộp tờ khai.

---

## 18. Đồng bộ offline-first

### 18.1. Luồng đồng bộ

```text
Flutter/Isar
   ↓
TaxSyncQueue
   ↓
Vercel API
   ↓
Neon PostgreSQL
   ↓
Server changes
   ↓
Flutter/Isar
```

### 18.2. Quy tắc

- Người dùng vẫn nhập liệu khi offline.
- Mỗi bản ghi có syncStatus.
- Push bản ghi chưa đồng bộ.
- Pull bản ghi thay đổi từ server.
- Xử lý conflict theo loại dữ liệu.
- Chứng từ thuế không tự ghi đè im lặng.
- Conflict phải hiển thị cho người có quyền xử lý.
- Hóa đơn đã phát hành chỉ được điều chỉnh bằng nghiệp vụ hợp lệ.

### 18.3. Sync status

- LocalOnly.
- PendingUpload.
- Synced.
- PendingUpdate.
- Conflict.
- Failed.
- DeletedPendingSync.

---

## 19. Phân quyền

### Owner

- Xem toàn bộ dữ liệu.
- Cấu hình hồ sơ thuế.
- Duyệt tờ khai.
- Xác nhận nộp.
- Xem báo cáo.

### Accountant

- Nhập chi phí.
- Đối chiếu.
- Lập tờ khai.
- Không được thay đổi quyền người dùng.

### TaxOfficer

- Kiểm tra quy tắc.
- Duyệt dữ liệu thuế.
- Quản lý biểu mẫu.
- Theo dõi hạn nộp.

### Cashier

- Bán hàng.
- Không xem toàn bộ dữ liệu thuế.
- Không sửa tờ khai.

### Admin hệ thống

- Quản lý cấu hình kỹ thuật.
- Không tự ý xem dữ liệu kinh doanh nếu không được cấp quyền.

---

## 20. Báo cáo

### Báo cáo doanh thu

- Theo ngày/tháng/quý/năm.
- Theo chi nhánh.
- Theo ngành nghề.
- Theo kênh bán.
- Theo nhóm hàng.
- Theo khách hàng.
- Theo phương thức thanh toán.

### Báo cáo thuế

- Thuế GTGT dự kiến.
- Thuế TNCN dự kiến.
- Tổng nghĩa vụ.
- Đã khai.
- Đã nộp.
- Còn phải nộp.
- Theo kỳ.
- Theo chi nhánh.
- Theo ngành nghề.

### Báo cáo đối chiếu

- POS và hóa đơn.
- POS và ngân hàng.
- POS và kho.
- POS và sàn.
- Chi phí và chứng từ.
- Doanh thu nội bộ và tờ khai.

### Định dạng xuất

- Excel.
- CSV.
- PDF.
- JSON phục vụ API.
- File đính kèm chứng từ.

---

## 21. Giao diện Flutter

### Màn hình

1. Trung tâm thuế.
2. Hồ sơ hộ kinh doanh.
3. Chi nhánh và ngành nghề.
4. Doanh thu tính thuế.
5. Chi phí và chứng từ.
6. Quy tắc thuế.
7. Kỳ khai thuế.
8. Tờ khai.
9. Hóa đơn điện tử.
10. Đối chiếu.
11. Lịch nộp thuế.
12. Báo cáo.
13. Nhật ký thay đổi.
14. Cài đặt tích hợp.

### UX

- Hiển thị rõ “dự kiến” và “đã xác nhận”.
- Không dùng màu cảnh báo để kết luận vi phạm pháp luật.
- Có tooltip giải thích nguồn số liệu.
- Cho phép mở từ số liệu tổng đến chứng từ gốc.
- Có bộ lọc năm, kỳ, chi nhánh, ngành nghề, kênh bán.
- Hỗ trợ màn hình desktop và mobile.
- Hỗ trợ tiếng Việt.

---

## 22. Kiến trúc mã nguồn Flutter

```text
lib/
 ├── core/
 │   ├── constants/
 │   ├── errors/
 │   ├── network/
 │   ├── security/
 │   ├── sync/
 │   └── utils/
 │
 ├── features/
 │   └── tax/
 │       ├── data/
 │       │   ├── datasources/
 │       │   ├── models/
 │       │   ├── repositories/
 │       │   └── isar/
 │       ├── domain/
 │       │   ├── entities/
 │       │   ├── services/
 │       │   └── usecases/
 │       └── presentation/
 │           ├── providers/
 │           ├── screens/
 │           ├── widgets/
 │           └── controllers/
 │
 └── shared/
     ├── widgets/
     ├── models/
     └── services/
```

Sử dụng:

- Riverpod.
- Isar.
- Dio hoặc package http.
- Freezed/json_serializable nếu cần.
- intl.
- fl_chart.
- file_picker.
- printing/pdf.
- uuid.

---

## 23. Tax Calculation Engine

Tạo engine độc lập:

```dart
abstract class TaxCalculationEngine {
  TaxCalculationResult calculate(TaxCalculationInput input);
}
```

Input:

```dart
class TaxCalculationInput {
  final String taxYear;
  final String taxPeriod;
  final String businessType;
  final String industryCode;
  final String methodCode;
  final double revenue;
  final double deductibleExpenses;
  final double adjustments;
}
```

Output:

```dart
class TaxCalculationResult {
  final double taxableRevenue;
  final double taxableIncome;
  final double vatAmount;
  final double pitAmount;
  final double otherTaxAmount;
  final double totalPayable;
  final List<TaxWarning> warnings;
  final String ruleVersion;
}
```

Engine phải:

- Chọn đúng TaxRule.
- Kiểm tra ngày hiệu lực.
- Kiểm tra ngành nghề.
- Kiểm tra phương pháp.
- Kiểm tra ngưỡng doanh thu.
- Tạo cảnh báo nếu thiếu dữ liệu.
- Lưu ruleVersion.
- Cho phép tái tính toán.
- Không sửa dữ liệu gốc.
- Lưu kết quả tính như một snapshot.

---

## 24. Audit và kiểm soát

Ghi log cho:

- Sửa doanh thu.
- Xóa/hủy giao dịch.
- Sửa chi phí.
- Thay đổi quy tắc thuế.
- Tạo tờ khai.
- Duyệt tờ khai.
- Nộp tờ khai.
- Điều chỉnh tờ khai.
- Phát hành/hủy hóa đơn.
- Thay đổi hồ sơ hộ kinh doanh.
- Thay đổi phân quyền.

Audit log:

```text
TaxAuditLog
 ├── id
 ├── tenantId
 ├── userId
 ├── action
 ├── entityType
 ├── entityId
 ├── beforeJson
 ├── afterJson
 ├── reason
 ├── ipAddress
 ├── createdAt
```

---

## 25. Kiểm thử

### Unit test

- Chọn đúng quy tắc theo năm.
- Chọn đúng ngành nghề.
- Tính doanh thu.
- Tính GTGT.
- Tính TNCN.
- Tính điều chỉnh.
- Kiểm tra ngưỡng.
- Kiểm tra kỳ khai.
- Kiểm tra làm tròn.
- Kiểm tra dữ liệu thiếu.

### Integration test

- POS tạo doanh thu thuế.
- Nhập hàng tạo chi phí/giá vốn.
- Hóa đơn điện tử liên kết giao dịch.
- Đồng bộ Isar-Neon.
- Xử lý conflict.
- Xuất tờ khai.
- Ghi audit log.

### Acceptance test

- Offline vẫn lập được chứng từ.
- Đồng bộ không tạo bản ghi trùng.
- Không xem được dữ liệu tenant khác.
- Không sửa được tờ khai đã khóa nếu không có quyền.
- Báo cáo tổng khớp với chứng từ chi tiết.

---

## 26. Tiêu chí hoàn thành MVP

MVP phải có:

- Hồ sơ hộ kinh doanh.
- Nhiều chi nhánh.
- Danh mục ngành nghề.
- Cấu hình TaxRule theo năm.
- Tổng hợp doanh thu từ POS.
- Nhập chi phí.
- Tính GTGT dự kiến.
- Tính TNCN dự kiến.
- Kỳ khai thuế.
- Tạo tờ khai nháp.
- Xuất Excel/PDF.
- Dashboard.
- Đối chiếu doanh thu.
- Offline-first.
- Đồng bộ Neon qua Vercel.
- Phân quyền.
- Audit log.
- Cảnh báo dữ liệu thiếu.

Chưa coi là hoàn thành nếu:

- Hard-code một mức thuế.
- Chỉ tính thuế từ tiền mặt.
- Không phân biệt doanh thu và tiền thu.
- Không lưu nguồn chứng từ.
- Không có phiên bản quy tắc.
- Không có audit.
- Không có kiểm tra tenant.
- Không có xử lý offline.
- Tự động gửi cơ quan thuế khi chưa được người dùng xác nhận.

---

## 27. Lộ trình triển khai

### Giai đoạn 1

- Thiết kế database.
- Hồ sơ hộ kinh doanh.
- Chi nhánh/ngành nghề.
- TaxRule.
- Tổng hợp doanh thu.
- Dashboard cơ bản.

### Giai đoạn 2

- Chi phí.
- Chứng từ.
- TaxCalculationEngine.
- GTGT/TNCN dự kiến.
- Đối chiếu.

### Giai đoạn 3

- Tờ khai.
- Biểu mẫu theo phiên bản.
- Xuất Excel/PDF.
- Lịch hạn.
- Audit.

### Giai đoạn 4

- Hóa đơn điện tử.
- Tích hợp nhà cung cấp.
- Đồng bộ nâng cao.
- Xử lý conflict.
- Báo cáo chuyên sâu.

### Giai đoạn 5

- Tích hợp chính thức với hệ thống bên ngoài nếu có API/hợp đồng hợp lệ.
- Tự động hóa kiểm tra.
- Quản trị quy tắc thuế.
- Báo cáo đa hộ kinh doanh.

---

## 28. Yêu cầu dành cho coding agent

Agent phải thực hiện theo thứ tự:

1. Đọc toàn bộ kiến trúc hiện tại của KanPosVN.
2. Không tự ý thay đổi các module POS/kho đang chạy.
3. Xác định model hiện có và tái sử dụng dữ liệu.
4. Tạo migration Isar an toàn.
5. Tạo schema Neon và migration SQL.
6. Tạo API Vercel có kiểm tra tenant.
7. Tạo repository offline-first.
8. Tạo TaxRule và engine độc lập.
9. Tạo UI Flutter.
10. Viết unit/integration test.
11. Tạo dữ liệu mẫu.
12. Viết hướng dẫn cài đặt.
13. Ghi rõ phần nào là “dự kiến”, phần nào là “đã xác nhận”.
14. Không đưa ra kết luận pháp lý thay cho cơ quan thuế hoặc chuyên gia thuế.
15. Không hard-code quy định thuế.
16. Mọi thay đổi dữ liệu thuế quan trọng phải có audit log.

---

## 29. Kết luận

Module Thuế Hộ Kinh Doanh phải được xây dựng như một hệ thống quản lý chứng từ và tính toán theo quy tắc, không phải chỉ là màn hình nhập doanh thu rồi nhân một tỷ lệ.

Kiến trúc chuẩn:

```text
POS
 ↓
Hóa đơn bán hàng
 ↓
Doanh thu chuẩn hóa
 ↓
Kho + Giá vốn + Chi phí
 ↓
Đối chiếu
 ↓
TaxRule theo năm/ngành nghề/phương pháp
 ↓
TaxCalculationEngine
 ↓
Tờ khai
 ↓
Hóa đơn điện tử
 ↓
Lịch sử khai/nộp
 ↓
Báo cáo và audit
```

Tài liệu này là đặc tả kỹ thuật để coding agent triển khai. Các thông số pháp lý cụ thể phải được kiểm tra và cập nhật theo văn bản đang có hiệu lực tại thời điểm triển khai.
