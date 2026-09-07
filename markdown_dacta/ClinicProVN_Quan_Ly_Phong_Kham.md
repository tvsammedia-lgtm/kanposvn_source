# ClinicProVN --- Đặc tả ứng dụng quản lý phòng khám đa khoa/chuyên khoa

## 1. Mục tiêu

ClinicProVN là ứng dụng quản lý phòng khám đa khoa/chuyên khoa chạy
Android, Windows và Tablet, thiết kế theo mô hình **Offline First**:

-   Flutter: UI và nghiệp vụ máy trạm.
-   Isar: cơ sở dữ liệu local.
-   Vercel API: API trung tâm, xác thực, phân quyền và nghiệp vụ server.
-   Neon PostgreSQL: cơ sở dữ liệu cloud.
-   Sync Engine: đồng bộ hai chiều Isar ↔ Vercel API ↔ Neon.
-   AI Clinical Assistant: hỗ trợ bác sĩ phân tích và tạo gợi ý; không
    tự động quyết định lâm sàng.
-   Accounting: doanh thu, chi phí, công nợ, kho và lãi/lỗ.

> **An toàn AI:** AI chỉ là công cụ hỗ trợ quyết định lâm sàng. AI có
> thể phân tích triệu chứng, kết quả xét nghiệm và tạo bản nháp chẩn
> đoán/toa thuốc, nhưng bác sĩ có thẩm quyền phải xem xét, chỉnh sửa và
> xác nhận trước khi dữ liệu trở thành hồ sơ/chỉ định chính thức. Không
> cho phép AI tự động phát hành toa thuốc hoặc tự động xác nhận chẩn
> đoán.

------------------------------------------------------------------------

## 2. Kiến trúc tổng thể

``` text
Flutter Android / Windows / Tablet
             │
             ▼
        Riverpod
             │
             ▼
        Repository
             │
             ▼
        Isar Local DB
             │
        Sync Queue
             │
             ▼
       Vercel API
       / Auth / RBAC
       / Business Logic
             │
       ┌─────┴─────┐
       ▼           ▼
 Neon PostgreSQL   AI Provider
                   (server-side)
             │
             ▼
        Object Storage
      PDF / Image / Files
```

**Không cho Flutter kết nối trực tiếp Neon.**

------------------------------------------------------------------------

# 3. Module nghiệp vụ

## 3.1. Quản lý phòng khám

-   Phòng khám.
-   Chi nhánh.
-   Chuyên khoa.
-   Phòng khám/phòng chức năng.
-   Bác sĩ.
-   Điều dưỡng.
-   Kỹ thuật viên.
-   Lễ tân.
-   Dược sĩ.
-   Kế toán.
-   Người quản trị.
-   Phân quyền.
-   Ca làm việc.

Hỗ trợ nhiều `clinicId`, `branchId`, `tenantId`.

## 3.2. Bệnh nhân

Thông tin:

-   Mã bệnh nhân.
-   Họ tên.
-   Ngày sinh.
-   Giới tính.
-   Điện thoại.
-   Địa chỉ.
-   Người liên hệ.
-   Dị ứng.
-   Tiền sử bệnh.
-   Tiền sử phẫu thuật.
-   Tiền sử gia đình.
-   Bệnh nền.
-   Thuốc đang dùng.
-   Ghi chú.

Lịch sử:

-   Lịch hẹn.
-   Lượt khám.
-   Chẩn đoán.
-   Đơn thuốc.
-   Xét nghiệm.
-   Chẩn đoán hình ảnh.
-   Thanh toán.
-   Công nợ.
-   Tái khám.

QR bệnh nhân chỉ chứa ID/reference hoặc token an toàn, không chứa bệnh
án.

------------------------------------------------------------------------

# 4. Lịch hẹn

## Appointment

``` text
requested
confirmed
checked_in
waiting
in_progress
completed
cancelled
no_show
rescheduled
```

Thông tin:

``` text
appointmentId
patientId
doctorId
specialtyId
branchId
roomId
appointmentDate
startTime
endTime
reason
note
status
reminderStatus
createdAt
updatedAt
```

## Tái khám

Bác sĩ có thể tạo:

-   Ngày tái khám.
-   Lý do.
-   Chuyên khoa.
-   Bác sĩ.
-   Xét nghiệm cần làm trước.
-   Chỉ số cần theo dõi.
-   Thuốc cần theo dõi.
-   Ghi chú.

Hệ thống tạo lịch hẹn ở trạng thái nháp hoặc đề nghị để lễ tân xác nhận.

------------------------------------------------------------------------

# 5. Tiếp nhận và hàng đợi

Luồng:

``` text
Đặt lịch
   ↓
Check-in
   ↓
Sinh số
   ↓
Xếp hàng
   ↓
Gọi bệnh nhân
   ↓
Khám
```

QueueTicket:

``` text
ticketId
patientId
appointmentId
doctorId
branchId
roomId
number
priority
status
createdAt
calledAt
```

Ưu tiên:

-   Cấp cứu.
-   Người cao tuổi.
-   Trẻ em.
-   Theo chính sách phòng khám.

------------------------------------------------------------------------

# 6. Hồ sơ bệnh án

## MedicalRecord

``` text
MedicalRecord
 ├── Patient
 ├── Allergy[]
 ├── ChronicDisease[]
 ├── MedicalHistory[]
 ├── SurgicalHistory[]
 ├── FamilyHistory[]
 ├── MedicationHistory[]
 └── Encounter[]
```

## Encounter

Một lần khám gồm:

-   Lý do khám.
-   Triệu chứng.
-   Bệnh sử.
-   Sinh hiệu.
-   Khám thực thể.
-   Chẩn đoán sơ bộ.
-   Chẩn đoán xác định.
-   ICD-10.
-   Chỉ định xét nghiệm.
-   Kết quả.
-   Đơn thuốc.
-   Hướng dẫn.
-   Tái khám.
-   Ghi chú.

------------------------------------------------------------------------

# 7. Sinh hiệu

VitalSign:

-   Huyết áp.
-   Mạch.
-   Nhiệt độ.
-   SpO2.
-   Nhịp thở.
-   Chiều cao.
-   Cân nặng.
-   BMI.
-   Đường huyết nếu cần.

Có lịch sử sinh hiệu theo từng lần khám.

------------------------------------------------------------------------

# 8. Chuyên khoa

Có thể cấu hình:

-   Nội tổng quát.
-   Ngoại khoa.
-   Nhi.
-   Sản phụ khoa.
-   Tai Mũi Họng.
-   Răng Hàm Mặt.
-   Da liễu.
-   Tim mạch.
-   Nội tiết.
-   Cơ xương khớp.
-   Hô hấp.
-   Tiêu hóa.
-   Mắt.
-   Thần kinh.
-   Y học gia đình.

Mỗi chuyên khoa có:

-   Mẫu bệnh án.
-   Bộ câu hỏi.
-   Mẫu khám.
-   Mẫu chỉ định.
-   Mẫu kết luận.
-   Dịch vụ.
-   Hướng dẫn bệnh nhân.

------------------------------------------------------------------------

# 9. Chẩn đoán và ICD-10

Diagnosis:

``` text
id
encounterId
code
name
type
description
isPrimary
doctorId
createdAt
updatedAt
```

Type:

``` text
suspected
confirmed
differential
history
chronic
```

AI chỉ có thể đề xuất `differential/suspected`; bác sĩ quyết định chẩn
đoán chính thức.

------------------------------------------------------------------------

# 10. Quản lý thuốc

## Drug

-   Tên thuốc.
-   Hoạt chất.
-   Hàm lượng.
-   Dạng bào chế.
-   Đơn vị.
-   Đường dùng.
-   Nhà sản xuất.
-   Nhóm thuốc.
-   Chống chỉ định.
-   Tương tác.
-   Cảnh báo.

## DrugBatch

``` text
batchId
drugId
lotNumber
expiryDate
purchasePrice
sellingPrice
quantity
warehouseId
```

## FEFO

Xuất thuốc theo:

**First Expired -- First Out**

Cảnh báo:

-   Sắp hết hạn.
-   Đã hết hạn.
-   Tồn thấp.
-   Lô bị khóa.

------------------------------------------------------------------------

# 11. Đơn thuốc / toa thuốc

## Prescription

``` text
prescriptionId
patientId
encounterId
doctorId
status
diagnosis
notes
createdAt
confirmedAt
```

Trạng thái:

``` text
draft
doctor_review
confirmed
dispensed
cancelled
```

## PrescriptionItem

``` text
drugId
batchId
dosage
frequency
route
quantity
duration
unit
instruction
warning
```

## Kiểm tra an toàn

Trước khi xác nhận:

1.  Dị ứng.
2.  Trùng hoạt chất.
3.  Trùng nhóm.
4.  Tương tác thuốc.
5.  Liều lượng.
6.  Thời gian sử dụng.
7.  Chống chỉ định.
8.  Tuổi.
9.  Cảnh báo đặc biệt.
10. Tồn kho/hạn dùng.

------------------------------------------------------------------------

# 12. Xét nghiệm lâm sàng

## LabTest

Danh mục:

-   Huyết học.
-   Sinh hóa.
-   Nước tiểu.
-   Miễn dịch.
-   Vi sinh.
-   Nội tiết.
-   Xét nghiệm nhanh.
-   Xét nghiệm chuyên sâu.

## LabOrder

``` text
labOrderId
patientId
encounterId
doctorId
priority
status
orderedAt
```

Trạng thái:

``` text
ordered
collected
processing
completed
verified
cancelled
```

## LabResult

``` text
testId
parameter
result
unit
referenceRange
abnormalFlag
technicianId
verifiedBy
verifiedAt
note
```

AI có thể hỗ trợ tóm tắt bất thường để bác sĩ xem xét.

------------------------------------------------------------------------

# 13. Chẩn đoán hình ảnh

Hỗ trợ mở rộng:

-   X-quang.
-   Siêu âm.
-   CT.
-   MRI.
-   Nội soi.

Lưu:

-   Chỉ định.
-   Kỹ thuật.
-   Báo cáo.
-   Kết luận.
-   File reference.

File lớn không lưu trực tiếp trong Neon; chỉ lưu metadata/reference và
file ở object storage bảo mật.

------------------------------------------------------------------------

# 14. AI Clinical Assistant

## 14.1. Chức năng

-   Tóm tắt hồ sơ.
-   Phân tích triệu chứng.
-   Gợi ý chẩn đoán phân biệt.
-   Phân tích kết quả xét nghiệm.
-   Kiểm tra cảnh báo thuốc.
-   Tạo bản nháp toa thuốc.
-   Gợi ý theo dõi.
-   Gợi ý thời điểm tái khám.
-   Sinh hướng dẫn bệnh nhân.
-   Tóm tắt diễn biến.

## 14.2. Luồng bắt buộc

``` text
Hồ sơ bệnh nhân
       ↓
AI Assistant
       ↓
Gợi ý
       ↓
Bác sĩ xem xét
       ↓
Bác sĩ chỉnh sửa
       ↓
Bác sĩ xác nhận
       ↓
Lưu hồ sơ chính thức
```

Không triển khai:

``` text
AI → tự chẩn đoán → tự kê đơn → tự phát hành
```

## 14.3. AI Prescription Draft

Ví dụ:

``` json
{
  "suggestions": [
    {
      "drug": "...",
      "dose": "...",
      "frequency": "...",
      "duration": "...",
      "reason": "..."
    }
  ],
  "warnings": [],
  "requiresDoctorReview": true
}
```

AI không được gọi trực tiếp API cấp phát thuốc.

## 14.4. AI Audit

Lưu:

``` text
aiRequestId
userId
doctorId
patientId
encounterId
model
promptVersion
requestHash
responseHash
suggestion
doctorAction
acceptedItems
rejectedItems
editedItems
createdAt
```

------------------------------------------------------------------------

# 15. Kế toán phòng khám

## 15.1. Doanh thu

Nguồn:

-   Khám.
-   Tái khám.
-   Xét nghiệm.
-   Siêu âm.
-   X-quang.
-   Nội soi.
-   Thủ thuật.
-   Thuốc.
-   Vật tư.
-   Dịch vụ khác.

## 15.2. Invoice

``` text
Invoice
 ├── InvoiceItem[]
 ├── Payment[]
 └── CustomerDebt
```

InvoiceItem:

``` text
serviceId
productId
quantity
unitPrice
discount
tax
amount
```

## 15.3. Payment

Phương thức:

``` text
cash
bank_transfer
card
e_wallet
other
```

Theo dõi:

-   Tiền mặt.
-   Ngân hàng.
-   Công nợ.
-   Hoàn tiền.

------------------------------------------------------------------------

# 16. Chi phí

Expense:

``` text
expenseId
branchId
categoryId
supplierId
amount
paymentMethod
description
expenseDate
createdBy
```

Nhóm:

-   Thuê mặt bằng.
-   Điện.
-   Nước.
-   Internet.
-   Lương.
-   Thuốc.
-   Vật tư y tế.
-   Thiết bị.
-   Bảo trì.
-   Marketing.
-   Văn phòng phẩm.
-   Chi phí khác.

------------------------------------------------------------------------

# 17. Công nợ khách hàng

CustomerDebt:

-   Bệnh nhân/khách hàng.
-   Hóa đơn.
-   Phải thu.
-   Đã thu.
-   Còn nợ.
-   Hạn thanh toán.
-   Lịch sử thu nợ.

Báo cáo:

-   Tổng phải thu.
-   Quá hạn.
-   Theo bệnh nhân.
-   Theo thời gian.
-   Theo chi nhánh.

------------------------------------------------------------------------

# 18. Nhà cung cấp

Supplier:

``` text
supplierId
name
taxCode
phone
address
contact
bankAccount
paymentTerms
active
```

SupplierInvoice:

-   Thuốc.
-   Vật tư.
-   Thiết bị.
-   Dịch vụ.

SupplierPayment:

-   Số tiền.
-   Phương thức.
-   Ngày thanh toán.
-   Hóa đơn liên quan.

------------------------------------------------------------------------

# 19. Kho thuốc/vật tư

Warehouse:

-   Kho thuốc.
-   Kho vật tư.
-   Kho hàng hóa.

StockTransaction:

``` text
purchase
sale
dispense
return
transfer_in
transfer_out
adjustment
expired
damage
```

Mỗi giao dịch:

``` text
sourceDocumentId
quantity
unitCost
warehouseId
batchId
createdBy
createdAt
```

Không sửa trực tiếp số tồn; tồn kho phải được cập nhật qua transaction.

------------------------------------------------------------------------

# 20. Hệ thống tài khoản

ChartOfAccount có thể cấu hình.

Ví dụ:

``` text
111 - Tiền mặt
112 - Tiền gửi ngân hàng
131 - Phải thu khách hàng
152 - Vật tư
156 - Hàng hóa
331 - Phải trả nhà cung cấp
511 - Doanh thu
632 - Giá vốn
642 - Chi phí quản lý
```

AccountingEntry:

``` text
AccountingEntry
 └── AccountingEntryLine[]
```

Quy tắc:

``` text
Tổng Nợ = Tổng Có
```

## Ví dụ

Doanh thu:

``` text
Nợ 111/112/131
  Có 511
```

Giá vốn:

``` text
Nợ 632
  Có 156
```

Nhập hàng chưa thanh toán:

``` text
Nợ 156
  Có 331
```

Thanh toán nhà cung cấp:

``` text
Nợ 331
  Có 111/112
```

------------------------------------------------------------------------

# 21. Lãi lỗ

``` text
Doanh thu thuần
- Giá vốn
= Lợi nhuận gộp

Lợi nhuận gộp
- Chi phí hoạt động
= Lợi nhuận
```

Dashboard:

-   Doanh thu ngày/tháng/năm.
-   Chi phí.
-   Giá vốn.
-   Lợi nhuận.
-   Tiền mặt.
-   Ngân hàng.
-   Phải thu.
-   Phải trả.
-   Tồn kho.

------------------------------------------------------------------------

# 22. Database Isar

Collections:

``` text
Clinic
Branch
Department
Room
User
Role
Permission
Doctor
Patient
PatientContact
Allergy
MedicalHistory
MedicalRecord
Encounter
VitalSign
Diagnosis
Appointment
QueueTicket
Service
Drug
DrugBatch
Warehouse
StockTransaction
Prescription
PrescriptionItem
LabTest
LabOrder
LabResult
ImagingOrder
FollowUp
Invoice
InvoiceItem
Payment
Expense
CustomerDebt
Supplier
SupplierInvoice
SupplierInvoiceItem
SupplierPayment
ChartOfAccount
AccountingEntry
AccountingEntryLine
AIRequest
AIResponse
AuditLog
SyncQueue
SyncConflict
Device
AppSetting
```

Entity đồng bộ nên có:

``` text
uuid
tenantId
clinicId
branchId
createdAt
updatedAt
deletedAt
version
syncStatus
deviceId
```

------------------------------------------------------------------------

# 23. Neon PostgreSQL

Phân vùng logic:

``` text
auth
clinic
patient
clinical
appointment
pharmacy
laboratory
imaging
billing
inventory
accounting
ai
audit
sync
```

Index:

``` text
patient(clinic_id, phone)
patient(clinic_id, patient_code)
appointment(branch_id, appointment_date)
encounter(patient_id, created_at)
prescription(patient_id, created_at)
lab_order(patient_id, created_at)
invoice(branch_id, invoice_date)
payment(branch_id, payment_date)
stock_transaction(warehouse_id, created_at)
accounting_entry(entry_date)
```

------------------------------------------------------------------------

# 24. API Vercel

## Auth

``` text
POST /api/v1/auth/login
POST /api/v1/auth/refresh
POST /api/v1/auth/logout
```

## Patients

``` text
GET    /api/v1/patients
POST   /api/v1/patients
GET    /api/v1/patients/:id
PUT    /api/v1/patients/:id
DELETE /api/v1/patients/:id
```

## Appointments

``` text
GET  /api/v1/appointments
POST /api/v1/appointments
PUT  /api/v1/appointments/:id
POST /api/v1/appointments/:id/check-in
POST /api/v1/appointments/:id/complete
```

## Clinical

``` text
POST /api/v1/encounters
GET  /api/v1/encounters/:id
POST /api/v1/diagnoses
POST /api/v1/vitals
```

## Prescription

``` text
POST /api/v1/prescriptions
POST /api/v1/prescriptions/:id/validate
POST /api/v1/prescriptions/:id/confirm
POST /api/v1/prescriptions/:id/dispense
```

## Laboratory

``` text
GET  /api/v1/lab/tests
POST /api/v1/lab/orders
POST /api/v1/lab/results
POST /api/v1/lab/results/:id/verify
```

## Billing

``` text
POST /api/v1/invoices
POST /api/v1/payments
POST /api/v1/expenses
GET  /api/v1/reports/revenue
GET  /api/v1/reports/profit-loss
```

## Accounting

``` text
GET  /api/v1/accounting/accounts
POST /api/v1/accounting/entries
GET  /api/v1/accounting/ledger
POST /api/v1/accounting/period-close
```

## AI

``` text
POST /api/v1/ai/clinical-summary
POST /api/v1/ai/symptom-analysis
POST /api/v1/ai/lab-analysis
POST /api/v1/ai/prescription-draft
POST /api/v1/ai/followup-suggestion
```

------------------------------------------------------------------------

# 25. Sync Engine

## Push

``` http
POST /api/v1/sync/push
```

``` json
{
  "deviceId": "...",
  "lastSyncAt": "...",
  "changes": [
    {
      "entity": "Patient",
      "operation": "upsert",
      "uuid": "...",
      "version": 4,
      "data": {}
    }
  ]
}
```

## Pull

``` http
POST /api/v1/sync/pull
```

``` json
{
  "cursor": "...",
  "limit": 500
}
```

Response:

``` json
{
  "cursor": "...",
  "changes": [],
  "hasMore": false
}
```

## Status

``` text
local_only
pending_sync
syncing
synced
conflict
failed
deleted
```

------------------------------------------------------------------------

# 26. Conflict Resolution

Ưu tiên:

1.  Version.
2.  UpdatedAt.
3.  Transaction.
4.  Manual review.

Không tự động ghi đè dữ liệu quan trọng:

-   Chẩn đoán.
-   Toa thuốc đã xác nhận.
-   Kết quả xét nghiệm đã verify.
-   Hóa đơn đã thanh toán.
-   Giao dịch kho.
-   Bút toán kế toán.

Dùng versioning hoặc khóa nghiệp vụ.

------------------------------------------------------------------------

# 27. Idempotency

Bắt buộc có `idempotencyKey` cho:

-   Thanh toán.
-   Hoàn tiền.
-   Hóa đơn.
-   Cấp thuốc.
-   Nhập kho.
-   Xuất kho.
-   Bút toán.

Mục tiêu tránh tạo giao dịch trùng khi retry/sync.

------------------------------------------------------------------------

# 28. Phân quyền

## SuperAdmin

Toàn hệ thống.

## ClinicAdmin

Quản lý phòng khám/chi nhánh.

## Doctor

-   Bệnh nhân.
-   Bệnh án.
-   Khám.
-   Chẩn đoán.
-   Đơn thuốc.
-   Xét nghiệm.
-   AI Assistant.
-   Tái khám.

## Nurse

-   Tiếp nhận.
-   Sinh hiệu.
-   Hàng đợi.

## Receptionist

-   Bệnh nhân.
-   Lịch.
-   Check-in.
-   Thu tiền.

## Pharmacist

-   Thuốc.
-   Kho.
-   Cấp phát.

## LabTechnician

-   Nhận mẫu.
-   Nhập kết quả.
-   Verify theo quyền.

## Accountant

-   Hóa đơn.
-   Thanh toán.
-   Chi phí.
-   Công nợ.
-   Kho.
-   Kế toán.
-   Báo cáo.

------------------------------------------------------------------------

# 29. Security

Bắt buộc:

-   HTTPS.
-   JWT.
-   Refresh token.
-   RBAC.
-   Tenant isolation.
-   Authorization ở server.
-   Audit log.
-   Rate limit.
-   Input validation.
-   Parameterized SQL.
-   Secure Storage.
-   Session timeout.
-   Khóa màn hình.
-   Kiểm tra đúng bệnh nhân.
-   API key AI chỉ ở server.
-   Không ghi bệnh án đầy đủ vào log.
-   Không đưa bệnh án vào QR.
-   Bảo vệ file y tế.
-   Backup định kỳ.

------------------------------------------------------------------------

# 30. Audit Log

Các hành động quan trọng:

``` text
LOGIN
LOGOUT
PATIENT_VIEW
PATIENT_CREATE
PATIENT_UPDATE
MEDICAL_RECORD_VIEW
ENCOUNTER_CREATE
DIAGNOSIS_CREATE
PRESCRIPTION_CREATE
PRESCRIPTION_CONFIRM
PRESCRIPTION_DISPENSE
LAB_RESULT_CREATE
LAB_RESULT_VERIFY
INVOICE_CREATE
PAYMENT_CREATE
EXPENSE_CREATE
STOCK_ADJUST
ACCOUNTING_ENTRY_CREATE
AI_REQUEST
AI_SUGGESTION_ACCEPT
AI_SUGGESTION_REJECT
```

------------------------------------------------------------------------

# 31. Cấu trúc Flutter

``` text
lib/
├── core/
│   ├── config/
│   ├── constants/
│   ├── database/
│   ├── network/
│   ├── security/
│   ├── sync/
│   ├── utils/
│   └── errors/
│
├── data/
│   ├── isar/
│   ├── api/
│   ├── models/
│   └── repositories/
│
├── features/
│   ├── auth/
│   ├── dashboard/
│   ├── patients/
│   ├── appointments/
│   ├── reception/
│   ├── queue/
│   ├── clinical/
│   ├── prescriptions/
│   ├── pharmacy/
│   ├── laboratory/
│   ├── imaging/
│   ├── billing/
│   ├── inventory/
│   ├── accounting/
│   ├── reports/
│   ├── ai_assistant/
│   └── settings/
│
└── shared/
    ├── widgets/
    ├── dialogs/
    └── layouts/
```

------------------------------------------------------------------------

# 32. Dependencies đề xuất

``` yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_riverpod: ^2.6.1
  isar: ^3.1.0+1
  isar_flutter_libs: ^3.1.0+1

  dio: ^5.8.0
  http: ^1.2.2
  intl: ^0.20.2
  uuid: ^4.5.1
  path_provider: ^2.1.5
  shared_preferences: ^2.5.5
  flutter_secure_storage: ^9.2.4
  connectivity_plus: ^6.1.4
  file_picker: ^11.0.2
  image_picker: ^1.1.2
  pdf: ^3.11.3
  printing: ^5.14.2
  qr: ^3.0.2
  mobile_scanner: ^7.4.0
  fl_chart: ^0.70.2
```

Phiên bản dependency nên kiểm tra lại tại thời điểm triển khai.

------------------------------------------------------------------------

# 33. Màn hình

``` text
Login
Dashboard
Bệnh nhân
Lịch hẹn
Tiếp nhận
Hàng đợi
Khám bệnh
Hồ sơ bệnh án
Đơn thuốc
Nhà thuốc
Kho
Xét nghiệm
Chẩn đoán hình ảnh
Thu ngân
Công nợ
Nhà cung cấp
Chi phí
Kế toán
Báo cáo
AI Assistant
Cài đặt
```

------------------------------------------------------------------------

# 34. Dashboard

## Bác sĩ

-   Lịch khám hôm nay.
-   Bệnh nhân chờ.
-   Đang khám.
-   Tái khám.
-   Cảnh báo xét nghiệm.
-   Dị ứng.
-   Cảnh báo thuốc.
-   AI suggestions chờ xem.

## Quản trị

``` text
Doanh thu
Chi phí
Lợi nhuận
Công nợ phải thu
Công nợ phải trả
Tồn kho
Thuốc sắp hết hạn
Số bệnh nhân
Lượt khám
```

Biểu đồ:

-   Doanh thu ngày.
-   Doanh thu theo chuyên khoa.
-   Doanh thu theo bác sĩ.
-   Chi phí.
-   Lợi nhuận.
-   Công nợ.
-   Tồn kho.

------------------------------------------------------------------------

# 35. Báo cáo

## Y tế

-   Bệnh nhân mới.
-   Bệnh nhân tái khám.
-   Lượt khám.
-   Theo bác sĩ.
-   Theo chuyên khoa.
-   Chẩn đoán phổ biến.
-   ICD-10.
-   Xét nghiệm.
-   Đơn thuốc.

## Kinh doanh

-   Doanh thu ngày/tháng/năm.
-   Theo dịch vụ.
-   Theo bác sĩ.
-   Theo chi nhánh.
-   Thuốc.
-   Xét nghiệm.
-   Chi phí.
-   Lợi nhuận.

## Công nợ

-   Phải thu.
-   Quá hạn.
-   Phải trả.
-   Tuổi nợ.
-   Thu nợ.
-   Trả nhà cung cấp.

## Kho

-   Nhập.
-   Xuất.
-   Tồn.
-   Theo lô.
-   Sắp hết hạn.
-   Hết hạn.
-   Giá trị tồn.

------------------------------------------------------------------------

# 36. In ấn

Hỗ trợ PDF/in:

-   Phiếu tiếp nhận.
-   Số thứ tự.
-   Phiếu khám.
-   Hóa đơn.
-   Toa thuốc.
-   Phiếu xét nghiệm.
-   Kết quả xét nghiệm.
-   Phiếu thu.
-   Báo cáo.
-   Sổ quỹ.
-   Công nợ.

------------------------------------------------------------------------

# 37. Offline First

``` text
Người dùng thao tác
       ↓
Isar
       ↓
SyncQueue
       ↓
pending_sync
       ↓
Có mạng
       ↓
Vercel API
       ↓
Neon
       ↓
Pull
       ↓
Isar
       ↓
synced
```

Cho phép offline tùy chính sách:

-   Tra cứu bệnh nhân.
-   Tạo bệnh nhân.
-   Lịch hẹn.
-   Tiếp nhận.
-   Sinh hiệu.
-   Ghi chú khám.
-   Draft đơn.
-   Nhập dữ liệu xét nghiệm.
-   Hóa đơn.

Các thao tác yêu cầu authorization/server validation mạnh có thể bắt
buộc online.

------------------------------------------------------------------------

# 38. File Storage

``` text
Flutter
   ↓
Vercel API
   ↓
Object Storage
   ↓
Neon lưu metadata/reference
```

File:

``` text
PDF
JPG
PNG
DICOM metadata/reference
```

------------------------------------------------------------------------

# 39. Environment Variables

``` env
DATABASE_URL=
DIRECT_URL=
JWT_SECRET=
REFRESH_TOKEN_SECRET=
AI_API_KEY=
STORAGE_ENDPOINT=
STORAGE_ACCESS_KEY=
STORAGE_SECRET_KEY=
APP_ENV=production
```

Không commit `.env`.

------------------------------------------------------------------------

# 40. Backup và phục hồi

Cloud:

-   Backup Neon.
-   Point-in-time recovery nếu gói hỗ trợ.
-   Backup object storage.

Local:

-   Backup Isar theo chính sách.
-   Export dữ liệu cần thiết.

Phải có quy trình:

``` text
Backup
↓
Verify
↓
Restore test
↓
Production recovery
```

------------------------------------------------------------------------

# 41. Roadmap

## Phase 1

-   Flutter.
-   Isar.
-   Auth.
-   RBAC.
-   Clinic/Branch.
-   Vercel API.
-   Neon.
-   Sync.

## Phase 2

-   Bệnh nhân.
-   Hồ sơ.
-   Lịch hẹn.
-   Tiếp nhận.
-   Hàng đợi.

## Phase 3

-   Khám.
-   Sinh hiệu.
-   Chẩn đoán.
-   ICD-10.
-   Đơn thuốc.

## Phase 4

-   Kho.
-   Nhà thuốc.
-   FEFO.
-   Xét nghiệm.
-   Hình ảnh.

## Phase 5

-   Hóa đơn.
-   Thu tiền.
-   Chi phí.
-   Công nợ.
-   Báo cáo.

## Phase 6

-   Hạch toán.
-   Sổ quỹ.
-   Sổ cái.
-   Giá vốn.
-   Lãi/lỗ.
-   Khóa kỳ.

## Phase 7

-   AI Clinical Assistant.
-   Tóm tắt hồ sơ.
-   Phân tích triệu chứng.
-   Phân tích xét nghiệm.
-   Draft toa.
-   Tái khám.
-   AI audit.

## Phase 8

-   Security audit.
-   Performance.
-   Backup.
-   Monitoring.
-   Production.

------------------------------------------------------------------------

# 42. MVP

## MVP 1

-   Login.
-   Phòng khám/chi nhánh.
-   Bệnh nhân.
-   Lịch.
-   Tiếp nhận.
-   Khám.
-   Hồ sơ.
-   Đơn thuốc.
-   Thu tiền.

## MVP 2

-   Kho.
-   Nhà thuốc.
-   Xét nghiệm.
-   Công nợ.
-   Chi phí.
-   Báo cáo.

## MVP 3

-   Kế toán.
-   AI Assistant.
-   Tái khám.
-   QR.
-   Multi-branch.
-   Dashboard nâng cao.

------------------------------------------------------------------------

# 43. Tiêu chí nghiệm thu

### Bệnh nhân

-   CRUD.
-   Mã không trùng.
-   Lịch sử khám.

### Lịch

-   Đặt.
-   Check-in.
-   Xếp hàng.
-   Hoàn tất.
-   Tái khám.

### Khám

-   Bệnh sử.
-   Sinh hiệu.
-   Chẩn đoán.
-   Xét nghiệm.
-   Đơn.

### Nhà thuốc

-   Nhập.
-   Xuất.
-   FEFO.
-   Hạn dùng.
-   Cấp thuốc.

### Xét nghiệm

-   Chỉ định.
-   Kết quả.
-   Verify.
-   Lịch sử.

### Kế toán

-   Doanh thu.
-   Chi phí.
-   Công nợ.
-   Bút toán.
-   Sổ quỹ.
-   Lãi/lỗ.

### Sync

-   Offline.
-   Online.
-   Push.
-   Pull.
-   Retry.
-   Conflict.
-   Idempotency.
-   Không giao dịch trùng.

### AI

-   Có gợi ý.
-   Bác sĩ review.
-   Bác sĩ xác nhận.
-   Audit log.
-   Không tự phát hành toa.
-   Không tự xác nhận chẩn đoán.

------------------------------------------------------------------------

# 44. Kiến trúc cuối cùng

``` text
                         ┌─────────────────────┐
                         │ Flutter Android     │
                         │ Flutter Windows     │
                         │ Flutter Tablet      │
                         └──────────┬──────────┘
                                    │
                              Riverpod
                                    │
                              Repository
                                    │
                         ┌──────────▼──────────┐
                         │    Isar Local DB    │
                         │    Offline First    │
                         └──────────┬──────────┘
                                    │
                              Sync Engine
                                    │
                              HTTPS / JWT
                                    │
                         ┌──────────▼──────────┐
                         │     Vercel API      │
                         │ Auth / RBAC / Logic │
                         └──────┬───────┬─────┘
                                │       │
                    ┌───────────▼─┐   ┌─▼────────────┐
                    │ Neon        │   │ AI Provider  │
                    │ PostgreSQL  │   │ Server-side  │
                    └─────────────┘   └──────────────┘
                                │
                         ┌──────▼──────┐
                         │ Object      │
                         │ Storage     │
                         └─────────────┘
```

## Kết luận

ClinicProVN được thiết kế để có thể mở rộng từ một phòng khám nhỏ thành
hệ thống quản lý nhiều chi nhánh, nhiều chuyên khoa.

Kiến trúc cốt lõi:

``` text
Flutter
+
Isar Offline First
+
Vercel API
+
Neon PostgreSQL
+
Sync Engine
+
Clinical
+
Pharmacy
+
Laboratory
+
Billing
+
Accounting
+
AI Clinical Decision Support
```

Nguyên tắc AI:

``` text
AI hỗ trợ
   ↓
Bác sĩ xem xét
   ↓
Bác sĩ chỉnh sửa
   ↓
Bác sĩ xác nhận
   ↓
Hồ sơ/chỉ định chính thức
```
