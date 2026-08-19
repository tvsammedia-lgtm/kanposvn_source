# Ứng dụng Quản lý Đặt/Gọi Xe Ôm - Taxi
## Flutter + Isar + Supabase + Vercel API

> Phiên bản: 1.0
> Kiến trúc: Offline First
> Framework: Flutter 3.x
> Database Local: Isar Database
> Database Cloud: Supabase PostgreSQL
> API: Vercel Serverless API
> Authentication: Supabase Auth + JWT
> Đồng bộ: API Queue + Background Sync

---

# 1. Mục tiêu

Xây dựng ứng dụng quản lý dịch vụ gọi xe ôm, taxi hoạt động ngay cả khi mất Internet.

Ứng dụng hỗ trợ:

- Xe ôm
- Taxi 4 chỗ
- Taxi 7 chỗ
- Taxi điện
- Xe hợp đồng
- Xe tải
- Giao hàng
- Chạy liên tỉnh

Hoạt động:

Offline hoàn toàn bằng Isar

↓

Có Internet

↓

Đồng bộ Supabase thông qua API Vercel

---

# 2. Công nghệ

Flutter

Isar Database

Riverpod

Go Router

Freezed

Json Serializable

Dio

Supabase

PostgreSQL

Vercel API

Firebase Messaging

Google Maps

Location

Background Sync

---

# 3. Kiến trúc

```
Flutter

│

├── Presentation

├── Domain

├── Data

│      │

│      ├── Isar

│      ├── API

│      └── Repository

│

└── Sync Service

↓

Vercel API

↓

Supabase PostgreSQL
```

---

# 4. Phân quyền

## Admin

Quản lý toàn bộ

Quản lý tài xế

Quản lý khách

Quản lý doanh thu

Quản lý hoa hồng

Báo cáo

---

## Điều hành

Nhận cuộc gọi

Tạo chuyến

Điều xe

Theo dõi tài xế

---

## Tài xế

Nhận chuyến

Đón khách

Hoàn thành

Xem doanh thu

Lịch sử

---

## Khách hàng

Đặt xe

Theo dõi xe

Thanh toán

Đánh giá

---

# 5. Dashboard

Hiển thị:

Tổng chuyến hôm nay

Xe đang chạy

Xe trống

Tài xế online

Doanh thu hôm nay

Doanh thu tháng

Hoa hồng

Biểu đồ

---

# 6. Quản lý tài xế

Thông tin:

ID

Họ tên

CCCD

GPLX

Ngày hết hạn GPLX

Điện thoại

Địa chỉ

Ngày sinh

Ảnh

Ảnh GPLX

Ảnh xe

Tài khoản

Mật khẩu

Trạng thái

Online

Offline

Đang chạy

---

# 7. Quản lý xe

Biển số

Loại xe

Xe ôm

Taxi

Taxi điện

Taxi 7 chỗ

Xe tải

Màu xe

Hãng xe

Năm SX

Bảo hiểm

Đăng kiểm

GPS

Trạng thái

---

# 8. Quản lý khách hàng

Tên

SĐT

Email

Địa chỉ

Điểm thưởng

Tổng chuyến

Doanh thu

Ghi chú

---

# 9. Đặt xe

Khách gọi

↓

Điều hành tạo chuyến

↓

Chọn xe

↓

Chọn tài xế

↓

Thông báo

↓

Tài xế nhận

↓

Đón khách

↓

Đang chạy

↓

Hoàn thành

---

# 10. Trạng thái chuyến

Mới

Đang tìm xe

Đã nhận

Đang đến

Đã đón

Đang chạy

Đã hoàn thành

Đã hủy

---

# 11. Thông tin chuyến

Mã chuyến

Khách

Điểm đón

Điểm trả

Khoảng cách

Giá

Loại xe

Tài xế

Thời gian

Thanh toán

Khuyến mãi

Ghi chú

---

# 12. Thanh toán

Tiền mặt

QR

MoMo

ZaloPay

VNPay

Chuyển khoản

Công nợ

---

# 13. Quản lý giá cước

Theo km

Theo thời gian

Theo khu vực

Theo loại xe

Theo giờ cao điểm

Phụ phí sân bay

Phụ phí lễ

---

# 14. Khuyến mãi

Voucher

Giảm %

Giảm tiền

Miễn phí km đầu

Điểm thưởng

---

# 15. Quản lý công nợ

Khách hàng

Doanh nghiệp

Đối tác

Lái xe

Nhà cung cấp

---

# 16. Hoa hồng tài xế

Theo %

Theo chuyến

Theo doanh thu

Theo ca

Theo tháng

---

# 17. Doanh thu

Theo tài xế

Theo xe

Theo ngày

Theo tháng

Theo tuyến

Theo loại xe

---

# 18. Chi phí

Xăng

Điện

Sửa xe

Bảo dưỡng

Lương

Marketing

Internet

Khấu hao

Khác

---

# 19. Báo cáo

Doanh thu

Chi phí

Lợi nhuận

Top tài xế

Top khách hàng

Top tuyến

Tỷ lệ hủy

Hiệu suất xe

---

# 20. Báo cáo kế toán

Sổ quỹ

Thu

Chi

Lãi lỗ

Lưu chuyển tiền

Bảng cân đối kế toán

Bảng cân đối phát sinh

---

# 21. GPS

Theo dõi vị trí

Theo dõi tài xế

Lịch sử hành trình

Bản đồ

---

# 22. Notification

Có chuyến mới

Khách hủy

Thanh toán

Tin nhắn

Khuyến mãi

---

# 23. Đồng bộ dữ liệu

## Offline

Flutter

↓

Isar

↓

Sync Queue

---

## Online

Sync Queue

↓

POST

↓

Vercel API

↓

Supabase

---

# 24. Quy trình Sync

Insert

↓

Update

↓

Delete

↓

Upload

↓

Download

↓

Resolve Conflict

↓

Done

---

# 25. API Vercel

```
POST /api/auth/login

POST /api/auth/logout

GET /api/drivers

POST /api/drivers

PUT /api/drivers/{id}

DELETE /api/drivers/{id}

GET /api/vehicles

POST /api/vehicles

GET /api/bookings

POST /api/bookings

PUT /api/bookings/{id}

GET /api/customers

POST /api/customers

GET /api/payments

POST /api/payments

GET /api/reports

POST /api/sync/upload

POST /api/sync/download

POST /api/sync/conflict
```

---

# 26. Cấu trúc Isar

```
Driver

Vehicle

Customer

Booking

BookingItem

Payment

Expense

Revenue

Promotion

Route

GPSLog

Notification

User

SyncQueue

Setting

AuditLog
```

---

# 27. Cấu trúc Supabase

```
drivers

vehicles

customers

bookings

booking_items

payments

expenses

revenues

promotions

routes

gps_logs

notifications

users

sync_logs

audit_logs
```

---

# 28. Đồng bộ

Mỗi record có:

```
id

uuid

createdAt

updatedAt

deletedAt

version

syncStatus

deviceId

userId
```

---

# 29. Trạng thái Sync

```
Pending

Uploading

Uploaded

Downloading

Conflict

Deleted
```

---

# 30. Bảo mật

JWT

HTTPS

Refresh Token

Row Level Security

API Key

Rate Limit

Audit Log

---

# 31. Sao lưu

Xuất:

Excel

CSV

JSON

PDF

Import:

JSON

Excel

CSV

---

# 32. Mô hình thư mục Flutter

```
lib/

core/
config/
models/
repositories/
services/
isar/
api/
sync/
features/
authentication/
dashboard/
drivers/
vehicles/
customers/
booking/
dispatch/
gps/
payments/
expenses/
reports/
settings/
widgets/
```

---

# 33. Lộ trình phát triển

## Giai đoạn 1
- Đăng nhập
- Quản lý tài xế
- Quản lý xe
- Quản lý khách hàng
- Tạo chuyến
- Thanh toán
- Offline Isar

## Giai đoạn 2
- Đồng bộ Supabase qua Vercel
- GPS
- Thông báo đẩy
- QR Payment
- Báo cáo doanh thu

## Giai đoạn 3
- Ứng dụng dành cho tài xế
- Ứng dụng dành cho khách hàng
- Theo dõi xe theo thời gian thực
- Định vị và tối ưu điều xe
- AI gợi ý tài xế gần nhất
- Chat giữa khách và tài xế
- Đánh giá chất lượng chuyến đi

---

# 34. Khả năng mở rộng

- Hỗ trợ đa chi nhánh, đa hãng taxi
- Quản lý nhiều khu vực hoạt động
- Hỗ trợ nhiều loại hình vận chuyển (xe ôm, taxi, xe tải, giao hàng)
- Đồng bộ nhiều thiết bị cùng lúc
- Dashboard quản trị trên Web (Flutter Web)
- Tích hợp tổng đài VoIP, SMS OTP, hóa đơn điện tử và cổng thanh toán
- API mở để kết nối với ERP, CRM và phần mềm kế toán.