# KanCRM - Tài liệu yêu cầu hệ thống
## Quản lý khách hàng sử dụng phần mềm POS đa ngành
### Flutter + Isar + Neon PostgreSQL + Vercel API

---

# 1. Giới thiệu

KanCRM là hệ thống quản lý khách hàng (CRM) dành cho công ty phát triển phần mềm POS.

Ứng dụng hỗ trợ:

- Quản lý khách hàng
- Quản lý cửa hàng
- Quản lý license
- Quản lý gói dịch vụ
- Quản lý thanh toán
- Quản lý nhân viên hỗ trợ
- Quản lý ticket
- Đồng bộ Online/Offline

Ứng dụng được xây dựng bằng

- Flutter
- Isar Database
- Neon PostgreSQL
- Vercel API

---

# 2. Kiến trúc

```
Flutter App
      │
      │
   Isar Database
      │
      │ Sync
      ▼
 Vercel REST API
      │
      ▼
 Neon PostgreSQL
```

Offline

```
Flutter
    │
 Isar
    │
Sử dụng bình thường
```

Online

```
Flutter

↓

Sync Queue

↓

Vercel API

↓

Neon PostgreSQL
```

---

# 3. Mô hình kinh doanh

Một công ty cung cấp nhiều phần mềm POS

Ví dụ

- POS Gara
- POS Nhà hàng
- POS Cafe
- POS Quán ăn
- POS Tạp hóa
- POS Mini Mart
- POS Siêu thị
- POS VLXD
- POS Nhà thuốc
- POS Spa
- POS Salon
- POS Karaoke
- POS Khách sạn
- POS Kho
- POS Bán lẻ
- POS Thu mua
- POS Sản xuất

Tất cả dùng chung

- Admin Web
- API
- Server
- CRM

---

# 4. Chức năng chính

## 4.1 Dashboard

Hiển thị

- Tổng khách hàng
- Khách đang hoạt động
- Khách hết hạn
- Doanh thu tháng
- Doanh thu năm
- Ticket đang xử lý
- Phiên bản App

---

## 4.2 Quản lý khách hàng

Thông tin

- Mã khách
- Tên công ty
- Người đại diện
- MST
- CCCD
- Email
- Điện thoại
- Địa chỉ
- Tỉnh
- Quận
- Phường
- Website
- Facebook
- Zalo
- Ghi chú

---

## 4.3 Quản lý cửa hàng

Một khách hàng có thể có nhiều cửa hàng

Thông tin

- Tên cửa hàng
- Mã cửa hàng
- Địa chỉ
- GPS
- Người quản lý
- Điện thoại
- Email

---

## 4.4 Quản lý phần mềm

Danh sách

- POS Gara
- POS Nhà hàng
- POS VLXD
- POS Cafe
- POS Nhà thuốc
- POS Khách sạn
- ...

Thông tin

- AppCode
- Package
- Version
- Build Number
- Platform

---

## 4.5 License

Quản lý

- Trial
- Standard
- Professional
- Enterprise

Thông tin

- License Key
- Ngày tạo
- Ngày kích hoạt
- Ngày hết hạn
- Số thiết bị
- Trạng thái

---

## 4.6 Gói dịch vụ

Ví dụ

Basic

- 1 cửa hàng
- 2 user

Business

- 3 cửa hàng
- 10 user

Enterprise

- Không giới hạn

---

## 4.7 Quản lý thiết bị

Lưu

- Device ID
- Android ID
- IMEI (nếu được phép)
- Model
- Brand
- Version Android
- Flutter Version
- App Version

---

## 4.8 Quản lý nhân viên

Thông tin

- Sales
- Kỹ thuật
- CSKH
- Kế toán
- Marketing

---

## 4.9 Nhật ký

Lưu

- Đăng nhập
- Đăng xuất
- Sync
- Backup
- Restore
- Gia hạn
- Thanh toán

---

# 5. Ticket hỗ trợ

Quản lý

- Ticket mới
- Đang xử lý
- Hoàn thành
- Đóng

Nội dung

- Hình ảnh
- Video
- File
- Bình luận

---

# 6. Quản lý thanh toán

Theo dõi

- Hợp đồng
- Gia hạn
- Thanh toán

Hình thức

- Tiền mặt
- Chuyển khoản
- ZaloPay
- QR Code
- Momo

---

# 7. Quản lý công nợ

Theo dõi

- Đã thanh toán
- Chưa thanh toán
- Quá hạn

---

# 8. Marketing

Quản lý

- SMS
- Email
- Push Notification
- Zalo OA

---

# 9. Quản lý Demo

Khách dùng thử

- Ngày đăng ký
- Hết hạn
- Số ngày còn lại
- App đang dùng

---

# 10. Quản lý cập nhật

Theo dõi

- Phiên bản
- APK
- Windows
- Linux
- MacOS

---

# 11. Đồng bộ dữ liệu

## Upload

Flutter

↓

Queue

↓

API

↓

Neon

---

## Download

Neon

↓

API

↓

Queue

↓

Isar

---

## Chính sách Sync

- Increment Sync
- Full Sync
- Manual Sync
- Auto Sync
- Background Sync

---

# 12. Backup

Backup

Isar

↓

ZIP

↓

Google Drive (tùy chọn)

Restore

Google Drive

↓

ZIP

↓

Isar

---

# 13. Phân quyền

Super Admin

↓

Admin

↓

Manager

↓

Sales

↓

Support

↓

Accountant

↓

Customer

---

# 14. Báo cáo

## Khách hàng

- Theo tỉnh
- Theo ngành
- Theo nhân viên

## Doanh thu

- Theo tháng
- Theo năm
- Theo sản phẩm

## License

- Sắp hết hạn
- Đã hết hạn
- Đang hoạt động

## Ticket

- Chưa xử lý
- Đang xử lý
- Hoàn thành

## Thanh toán

- Theo ngày
- Theo tháng
- Theo khách hàng

---

# 15. Cấu trúc Isar

customers

stores

licenses

subscriptions

payments

devices

employees

tickets

notifications

sync_logs

offline_queue

settings

attachments

activities

---

# 16. API Vercel

POST

/auth/login

/auth/register

/auth/refresh

---

GET

/customers

/stores

/licenses

/subscriptions

/payments

/tickets

/devices

/reports

---

POST

/customer/save

/store/save

/license/save

/payment/save

/ticket/save

/device/save

/sync/upload

---

GET

/sync/download

---

POST

/backup/upload

---

GET

/backup/download

---

# 17. Neon PostgreSQL

users

customers

stores

licenses

products

subscriptions

payments

devices

employees

tickets

ticket_messages

attachments

notifications

activity_logs

sync_logs

offline_queue

versions

packages

roles

permissions

audit_logs

---

# 18. Bảo mật

- JWT Authentication
- Refresh Token
- HTTPS
- AES Encrypt dữ liệu nhạy cảm
- Hash Password (Argon2/Bcrypt)
- Role Based Access Control (RBAC)
- API Rate Limit
- Audit Log
- Device Binding
- License Validation
- Offline Token có thời hạn

---

# 19. Công nghệ

## Mobile

- Flutter
- Dart

## Local Database

- Isar

## Backend

- Vercel Serverless API

## Database

- Neon PostgreSQL

## Authentication

- JWT
- Refresh Token

## Cloud

- Vercel
- Neon
- GitHub Actions

---

# 20. Mục tiêu

- Một hệ thống CRM quản lý tập trung cho tất cả phần mềm POS.
- Một tài khoản khách hàng có thể đăng ký và sử dụng nhiều ứng dụng POS (gara, nhà hàng, VLXD, nhà thuốc, cafe...) theo gói dịch vụ.
- Mỗi cửa hàng sử dụng cơ sở dữ liệu Isar riêng trên thiết bị để đảm bảo tốc độ và khả năng hoạt động offline.
- Khi có Internet, dữ liệu được đồng bộ hai chiều thông qua API Vercel lên Neon PostgreSQL.
- Admin Web quản lý tập trung khách hàng, license, gói dịch vụ, thanh toán, hỗ trợ kỹ thuật, cập nhật phiên bản và thống kê doanh thu cho toàn bộ hệ sinh thái phần mềm.