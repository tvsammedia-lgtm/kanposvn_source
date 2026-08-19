# GARAGE ERP
## Ứng dụng Quản lý Gara Ô tô - Xe máy
### Flutter + Isar + Supabase (qua Vercel API)

---

# 1. Tổng quan

Ứng dụng hoạt động Offline First.

- Flutter 3.x
- Isar Database
- Riverpod
- GoRouter
- Dio
- Supabase PostgreSQL
- API Backend Vercel (NodeJS/Express hoặc NextJS API)
- Đồng bộ hai chiều (Two-way Sync)
- Windows
- Android
- iOS
- Linux

Mục tiêu:

- Gara ô tô
- Gara xe máy
- Trung tâm chăm sóc xe
- Gara sửa chữa kết hợp bán phụ tùng
- Chuỗi gara nhiều chi nhánh

---

# 2. Kiến trúc

```
Flutter
     │
     │
 Isar Database
     │
Sync Queue
     │
REST API
(Vercel)
     │
Supabase PostgreSQL
```

Offline vẫn hoạt động bình thường.

Có Internet sẽ tự đồng bộ.

---

# 3. Phân hệ chính

## Dashboard

Hiển thị

- Xe đang sửa
- Xe chờ giao
- Xe đã giao
- Phiếu sửa hôm nay
- Doanh thu hôm nay
- Công nợ
- Lợi nhuận
- Tồn kho phụ tùng

---

# 4. Quản lý khách hàng

Thông tin

- Mã khách
- Tên
- Điện thoại
- CCCD
- Địa chỉ
- Email
- Ghi chú

Một khách có thể sở hữu nhiều xe.

---

# 5. Quản lý phương tiện

### Xe ô tô

- Biển số
- Số khung
- Số máy
- Hãng
- Model
- Phiên bản
- Năm sản xuất
- Màu
- Loại nhiên liệu
- Km hiện tại

### Xe máy

- Biển số
- Hãng
- Dòng xe
- Năm
- Số khung
- Số máy

Liên kết với khách hàng.

---

# 6. Tiếp nhận xe

Sinh phiếu tiếp nhận.

Thông tin

- Thời gian
- Nhân viên
- Hình ảnh
- Tình trạng xe
- Km
- Mức nhiên liệu
- Phụ kiện theo xe
- Ghi chú

---

# 7. Hợp đồng sửa chữa

## Sửa chữa nhỏ

Ví dụ

- Thay nhớt
- Thay lọc
- Vá lốp
- Bảo dưỡng

---

## Sửa chữa lớn

Ví dụ

- Đại tu động cơ
- Đại tu hộp số
- Sơn toàn xe
- Đồng sơn
- Phục hồi khung gầm

Thông tin

- Mã hợp đồng
- Giá trị
- Ngày ký
- Dự kiến hoàn thành
- Tạm ứng
- Thanh toán nhiều lần
- Bảo hành

---

# 8. Quy trình sửa chữa

Trạng thái

```
Tiếp nhận

↓

Kiểm tra

↓

Báo giá

↓

Khách duyệt

↓

Đặt phụ tùng

↓

Thực hiện

↓

QC

↓

Hoàn thành

↓

Thanh toán

↓

Giao xe
```

---

# 9. Báo giá

Bao gồm

Nhân công

+

Phụ tùng

+

Dịch vụ

Có thể:

- In PDF
- Gửi Zalo
- Email

---

# 10. Lệnh sửa chữa

Work Order

Bao gồm

- Công việc
- Thợ thực hiện
- Giờ bắt đầu
- Giờ kết thúc
- Ghi chú

---

# 11. Quản lý kỹ thuật viên

Thông tin

- Hồ sơ
- Chuyên môn
- Bậc thợ
- Lương
- Hoa hồng

Theo dõi

- Giờ công
- Hiệu suất
- Doanh thu tạo ra

---

# 12. Quản lý phụ tùng

Danh mục

- Dầu nhớt
- Lốp
- Bình ắc quy
- Má phanh
- Bugi
- Dây curoa
- Lọc gió
- Phụ kiện

Thông tin

- SKU
- Barcode
- Tồn
- Giá nhập
- Giá bán
- VAT
- Nhà cung cấp

---

# 13. Kho

Nghiệp vụ

- Nhập
- Xuất
- Điều chuyển
- Kiểm kê
- Hủy

Có nhiều kho.

Ví dụ

Kho chính

Kho dầu

Kho lốp

Kho phụ kiện

---

# 14. Nhà cung cấp

Thông tin

- Tên
- MST
- Điện thoại
- Email
- Công nợ
- Hợp đồng

---

# 15. Mua hàng

Quy trình

Đề nghị mua

↓

Đặt hàng

↓

Nhập kho

↓

Thanh toán

---

# 16. Bán phụ tùng

Có thể bán lẻ.

Không cần sửa xe.

POS

- Quét Barcode
- Máy in hóa đơn
- QR Banking

---

# 17. Thanh toán

Hình thức

- Tiền mặt
- Chuyển khoản
- QR
- Ví điện tử
- Công nợ

Thanh toán nhiều lần.

---

# 18. Bảo hành

Thông tin

- Phiếu bảo hành
- Thời hạn
- Km
- Nội dung

Theo dõi lịch sử.

---

# 19. Chăm sóc khách hàng

Nhắc

- Thay nhớt
- Bảo dưỡng
- Đăng kiểm
- Bảo hiểm
- Thay lốp

Gửi SMS/Zalo.

---

# 20. Công nợ khách hàng

Theo dõi

- Hóa đơn
- Thanh toán
- Còn nợ
- Quá hạn

Báo cáo tuổi nợ

- 30 ngày
- 60 ngày
- 90 ngày

---

# 21. Công nợ nhà cung cấp

Theo dõi

- Phiếu nhập
- Đã trả
- Chưa trả

---

# 22. Quản lý thu chi

Thu

- Sửa xe
- Bán phụ tùng

Chi

- Nhập hàng
- Điện
- Nước
- Lương
- Thuê mặt bằng
- Marketing
- Khác

---

# 23. Doanh thu

Theo

- Ngày
- Tuần
- Tháng
- Quý
- Năm

Theo

- Gara
- Kỹ thuật viên
- Loại xe
- Dịch vụ

---

# 24. Báo cáo tài chính

## Doanh thu

## Chi phí

## Lợi nhuận

## Lãi lỗ (P&L)

## Bảng cân đối kế toán

### Tài sản

- Tiền
- Ngân hàng
- Hàng tồn kho
- Công nợ phải thu
- TSCĐ

### Nguồn vốn

- Công nợ phải trả
- Vốn chủ sở hữu
- Lợi nhuận giữ lại

---

# 25. Báo cáo kho

- Xuất nhập tồn
- Hàng chậm luân chuyển
- Tồn tối thiểu
- Hàng sắp hết

---

# 26. Báo cáo sửa chữa

- Xe đang sửa
- Xe chờ phụ tùng
- Xe hoàn thành
- Xe bảo hành
- Doanh thu theo dịch vụ

---

# 27. Phân quyền

## Chủ gara

Toàn quyền

## Quản lý

Quản lý mọi nghiệp vụ

## Cố vấn dịch vụ

Tiếp nhận

## Kỹ thuật viên

Chỉ xem lệnh sửa

## Thu ngân

Thanh toán

## Kho

Kho

## Kế toán

Tài chính

---

# 28. Đồng bộ Supabase

Mọi dữ liệu lưu Isar trước.

Ví dụ

```
Insert

↓

Isar

↓

Sync Queue

↓

API Vercel

↓

Supabase
```

API

```
POST /customers

POST /vehicles

POST /repair-orders

POST /repair-contracts

POST /work-orders

POST /parts

POST /inventory

POST /purchase-orders

POST /suppliers

POST /payments

POST /receipts

POST /expenses

POST /journal

POST /sync
```

---

# 29. Cơ chế Sync

Mỗi bảng có

```
id
uuid
createdAt
updatedAt
deletedAt
version
isSynced
syncAction
deviceId
branchId
```

Sync

- Insert
- Update
- Delete

Conflict

Last Write Wins

hoặc

Version Number

---

# 30. Database Isar

Các Collection

```
Customer

Vehicle

VehicleType

Reception

RepairOrder

RepairContract

RepairTask

Mechanic

LaborRate

Part

Inventory

InventoryTransaction

Warehouse

Supplier

PurchaseOrder

PurchaseItem

SaleInvoice

SaleItem

Payment

Receipt

Expense

Revenue

Account

JournalEntry

Receivable

Payable

Warranty

Appointment

Notification

Employee

Role

Permission

SyncQueue

AuditLog

Settings
```

---

# 31. Dashboard BI

Biểu đồ

- Doanh thu
- Lợi nhuận
- Chi phí
- Dịch vụ bán chạy
- Phụ tùng bán chạy
- Hiệu suất kỹ thuật viên
- Công nợ
- Tồn kho

---

# 32. Sao lưu

- Backup Isar
- Restore
- Xuất Excel
- Xuất PDF
- Xuất CSV
- Đồng bộ Cloud

---

# 33. Tích hợp phần cứng

- Máy in hóa đơn ESC/POS
- Máy in A4
- Máy quét Barcode/QR
- Két tiền
- Cân điện tử (nếu bán dầu/phụ tùng theo trọng lượng)
- Camera chụp xe khi tiếp nhận

---

# 34. Công nghệ

Frontend

- Flutter
- Material 3
- Riverpod
- GoRouter

Database Offline

- Isar

Backend

- Vercel Serverless API

Cloud Database

- Supabase PostgreSQL

Authentication

- Supabase Auth
- JWT

Storage

- Supabase Storage

Realtime

- Supabase Realtime

Push Notification

- Firebase Cloud Messaging

---

# 35. Lộ trình phát triển

### Giai đoạn 1
- Quản lý khách hàng
- Quản lý xe
- Tiếp nhận xe
- Lệnh sửa chữa
- Bán phụ tùng
- Thu chi
- Báo cáo cơ bản

### Giai đoạn 2
- Quản lý hợp đồng sửa chữa
- Kho nâng cao
- Công nợ
- Bảo hành
- Dashboard tài chính

### Giai đoạn 3
- Đồng bộ đa chi nhánh
- Offline/Online hoàn chỉnh
- Phân quyền chi tiết
- Báo cáo kế toán đầy đủ
- API mở cho bên thứ ba
- Ứng dụng di động cho kỹ thuật viên
- AI gợi ý lịch bảo dưỡng và dự đoán nhu cầu phụ tùng