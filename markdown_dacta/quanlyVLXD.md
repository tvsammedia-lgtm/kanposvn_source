# PRD - Ứng dụng Quản lý Cửa hàng Vật liệu Xây dựng
## Flutter + Isar + Riverpod + Supabase (Sync qua API Vercel)

---

# 1. Tổng quan

## Tên dự án

BuildMaster ERP

Ứng dụng quản lý cửa hàng kinh doanh:

- Sắt thép
- Xi măng
- Gạch xây
- Gạch lát
- Đá xây dựng
- Cát
- Đá mi
- Đá 1x2
- Đá 4x6
- Tôn
- Inox
- Ống nước
- Thiết bị vệ sinh
- Sơn
- Phụ kiện xây dựng

Ứng dụng hoạt động Offline First bằng Isar Database và đồng bộ Cloud thông qua API Vercel.

---

# 2. Công nghệ

## Mobile/Desktop

- Flutter 3.x
- Dart

## Database Local

- Isar Database

## State Management

- Riverpod

## Sync Cloud

Flutter
↓
REST API
↓
Vercel
↓
Supabase PostgreSQL

Không kết nối trực tiếp Supabase từ Flutter.

---

# 3. Kiến trúc

```
Flutter

    ↓

Riverpod

    ↓

Repository

    ↓

Isar Local Database

    ↓

Sync Service

    ↓

REST API (Vercel)

    ↓

Supabase PostgreSQL
```

Offline hoàn toàn.

Có internet thì tự Sync.

---

# 4. Phân hệ chính

## Dashboard

Hiển thị

- Doanh thu hôm nay
- Doanh thu tháng
- Lợi nhuận
- Chi phí
- Công nợ phải thu
- Công nợ phải trả
- Hàng tồn kho
- Đơn hàng đang giao
- Hợp đồng đang thực hiện

---

# 5. Danh mục vật tư

Thông tin

- Mã hàng
- Barcode
- QRCode
- Tên vật tư
- Nhóm hàng
- Đơn vị tính

Ví dụ

Kg

Bao

Viên

Mét

Mét vuông

Mét khối

Cây

Tấm

Cuộn

Bó

Thanh

Ống

Quy cách

Ví dụ

Thép D10

Thép D12

Ống PVC 90

Xi măng PCB40

Đá 1x2

Giá nhập

Giá bán lẻ

Giá bán sỉ

Giá đại lý

VAT

Ảnh

Nhà cung cấp

Trọng lượng

Kích thước

---

# 6. Quản lý kho

Phiếu nhập

Phiếu xuất

Phiếu điều chỉnh

Kiểm kê

Chuyển kho

Xuất hủy

Tồn kho

Theo

Kho

Lô

Nhóm hàng

Nhà cung cấp

---

# 7. Mua hàng

Tạo đơn mua

Nhập kho

Chi phí vận chuyển

Chi phí bốc xếp

VAT đầu vào

Thanh toán

Theo dõi

Đơn chưa nhận

Đơn đã nhận

Đơn hủy

---

# 8. Nhà cung cấp

Thông tin

Tên

MST

Điện thoại

Email

Địa chỉ

Người liên hệ

Công nợ

Lịch sử nhập hàng

Lịch sử thanh toán

---

# 9. Khách hàng

Bao gồm

Khách lẻ

Đại lý

Công trình

Nhà thầu

Doanh nghiệp

Thông tin

Tên

MST

Điện thoại

Email

Địa chỉ giao hàng

Nợ hiện tại

Hạn mức nợ

Chiết khấu

---

# 10. Báo giá

Tạo báo giá

In PDF

Gửi Zalo

Gửi Email

Chuyển thành hợp đồng

---

# 11. Bán lẻ

POS

Chọn hàng

Quét Barcode

Nhập số lượng

Chiết khấu

VAT

Thanh toán

Tiền mặt

Chuyển khoản

QR

Công nợ

In hóa đơn

---

# 12. Bán sỉ theo hợp đồng

Quản lý hợp đồng

Thông tin

Số hợp đồng

Ngày ký

Khách hàng

Giá trị

Ngày giao

Điều khoản

Danh sách vật tư

Chiết khấu

VAT

Tiến độ giao

Nhiều lần giao hàng

Nhiều lần thanh toán

Theo dõi

Khối lượng đã giao

Khối lượng còn lại

Công nợ

Biên bản nghiệm thu

---

# 13. Phiếu giao hàng

Thông tin

Xe giao

Tài xế

Ngày giao

Người nhận

Ảnh giao hàng

Chữ ký điện tử

GPS

---

# 14. Thu tiền

Phiếu thu

Theo

Hóa đơn

Hợp đồng

Khách hàng

---

# 15. Chi tiền

Thanh toán NCC

Chi phí

Lương

Xăng xe

Điện

Nước

Khấu hao

Chi phí khác

---

# 16. Công nợ khách hàng

Theo dõi

Hóa đơn

Hợp đồng

Đã thu

Chưa thu

Quá hạn

Lãi chậm trả

In đối chiếu công nợ

---

# 17. Công nợ nhà cung cấp

Theo dõi

Đã trả

Chưa trả

Quá hạn

In đối chiếu

---

# 18. Quản lý vận chuyển

Xe giao hàng

Biển số

Loại xe

Tài xế

Chi phí nhiên liệu

Lịch giao

Theo dõi trạng thái giao hàng

---

# 19. Quản lý nhân viên

Thông tin

Phòng ban

Lương

Hoa hồng

Quyền

Lịch sử thao tác

---

# 20. Quản lý chi phí

Chi phí mua hàng

Vận chuyển

Bốc xếp

Kho bãi

Lương

Điện nước

Khấu hao

Marketing

Khác

---

# 21. Báo cáo doanh thu

Theo

Ngày

Tuần

Tháng

Quý

Năm

Theo

Khách hàng

Nhân viên

Nhóm hàng

Kho

Chi nhánh

---

# 22. Báo cáo lợi nhuận

Lợi nhuận gộp

Lợi nhuận thuần

Theo sản phẩm

Theo hợp đồng

Theo khách hàng

Theo nhân viên

---

# 23. Báo cáo tồn kho

Nhập

Xuất

Tồn

Tồn tối thiểu

Tồn tối đa

Hàng chậm luân chuyển

---

# 24. Báo cáo công nợ

Phải thu

Phải trả

Tuổi nợ

30 ngày

60 ngày

90 ngày

180 ngày

---

# 25. Báo cáo kế toán

## Sổ quỹ

## Nhật ký thu

## Nhật ký chi

## Sổ cái

## Bảng cân đối tài khoản

## Bảng cân đối kế toán

Tài sản

Nguồn vốn

Vốn chủ sở hữu

Công nợ

Hàng tồn kho

Tiền mặt

Tiền gửi

---

# 26. Báo cáo kết quả kinh doanh

Doanh thu

(-) Giá vốn

=

Lợi nhuận gộp

(-) Chi phí

=

Lợi nhuận trước thuế

(-) Thuế

=

Lợi nhuận sau thuế

---

# 27. Đồng bộ dữ liệu

Offline First

Isar là dữ liệu chính.

Sync nền.

Không ảnh hưởng thao tác bán hàng.

## Quy trình

```
Flutter

↓

Isar

↓

Sync Queue

↓

REST API

↓

Vercel

↓

Supabase
```

---

# 28. Sync Queue

Mỗi thay đổi ghi vào bảng

SyncTask

Ví dụ

Insert

Update

Delete

Retry

Conflict

Đồng bộ theo FIFO.

---

# 29. API Vercel

```
POST /api/login

POST /api/sync/upload

POST /api/sync/download

POST /api/customer

POST /api/product

POST /api/order

POST /api/contract

POST /api/payment

POST /api/invoice

POST /api/report

GET /api/version
```

JWT Authentication.

---

# 30. Đồng bộ

Upload

- Khách hàng
- Nhà cung cấp
- Hàng hóa
- Kho
- Đơn hàng
- Hợp đồng
- Phiếu nhập
- Phiếu xuất
- Thu
- Chi

Download

- Danh mục
- Giá bán
- Chính sách
- Người dùng

---

# 31. Giải quyết xung đột

Mỗi bản ghi có

```
id

createdAt

updatedAt

deletedAt

deviceId

version

syncVersion
```

Ưu tiên

Last Updated Wins

Có log lịch sử.

---

# 32. Bảo mật

JWT

Refresh Token

HTTPS

API Key

RBAC

Admin

Kế toán

Thu ngân

Kho

Bán hàng

Quản lý

---

# 33. In ấn

In Bluetooth

In USB

In LAN

Xuất

PDF

Excel

CSV

JSON

---

# 34. Phân quyền

Admin

Quản lý

Kế toán

Bán hàng

Kho

Giao hàng

Thu ngân

Khách xem báo cáo

---

# 35. Module Isar

```
users

roles

customers

suppliers

products

categories

warehouses

inventory

purchase_orders

purchase_items

sales_orders

sales_items

contracts

contract_items

delivery_notes

vehicles

drivers

payments

receipts

expenses

income

debts

stock_transactions

reports

settings

sync_tasks

audit_logs

notifications
```

---

# 36. Cấu trúc thư mục Flutter

```
lib/

core/

config/

models/

isar/

repositories/

services/

api/

sync/

features/

dashboard/

products/

customers/

suppliers/

contracts/

sales/

purchase/

inventory/

warehouse/

delivery/

accounting/

reports/

settings/

auth/

widgets/

shared/

main.dart
```

---

# 37. Lộ trình phát triển

### Phase 1
- Đăng nhập
- Dashboard
- Danh mục
- Kho
- Bán lẻ
- Nhập hàng

### Phase 2
- Bán sỉ theo hợp đồng
- Công nợ
- Thu chi
- Quản lý giao hàng
- Báo giá

### Phase 3
- Báo cáo kế toán
- Bảng cân đối kế toán
- Báo cáo lợi nhuận
- Dashboard BI

### Phase 4
- Đồng bộ Supabase qua API Vercel
- Phân quyền nhiều chi nhánh
- Backup/Restore
- Thông báo thời gian thực
- Chữ ký điện tử
- Hóa đơn điện tử (tích hợp API)
- AI dự báo tồn kho và nhu cầu nhập hàng

---

# 38. Mục tiêu

- Offline 100% với Isar
- Đồng bộ đa thiết bị qua Supabase
- Quản lý bán lẻ và bán sỉ theo hợp đồng
- Quản lý kho, công nợ và giao hàng
- Báo cáo tài chính và kế toán đầy đủ
- Hỗ trợ nhiều chi nhánh và nhiều kho
- Hiệu năng cao với hơn 500.000 bản ghi cục bộ
- Kiến trúc mở, dễ mở rộng và tích hợp ERP trong tương lai