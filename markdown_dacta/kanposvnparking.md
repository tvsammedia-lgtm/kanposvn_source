# Kan Parking
## Hệ thống quản lý bãi giữ xe & cho thuê xe

---

# 1. Giới thiệu

Kan Parking là phần mềm quản lý bãi giữ xe và cho thuê phương tiện hoạt động Offline trước, Sync sau.

Phù hợp cho:

- Bãi giữ xe bệnh viện
- Chung cư
- Trung tâm thương mại
- Trường học
- Bãi giữ xe thông minh
- Gara
- Bãi xe công ty
- Dịch vụ cho thuê xe máy
- Cho thuê ô tô
- Cho thuê xe điện

Kiến trúc

Flutter
↓
Isar Database
↓
Vercel API
↓
Neon PostgreSQL

---

# 2. Module chính

## 2.1 Dashboard

Hiển thị

- Xe đang gửi
- Xe đã ra
- Chỗ còn trống
- Doanh thu hôm nay
- Doanh thu tháng
- Xe thuê đang hoạt động
- Xe sắp trả
- Camera Online
- Cảnh báo

---

# 3. Quản lý khách hàng

Thông tin

- Mã KH
- Họ tên
- CCCD
- SĐT
- Email
- Địa chỉ
- Hình ảnh
- Biển số xe
- Ghi chú

Lịch sử

- Gửi xe
- Thuê xe
- Thanh toán
- Công nợ

---

# 4. Quản lý phương tiện

## Xe máy

## Ô tô

## Xe điện

## Xe đạp điện

Thông tin

- Mã xe
- Loại xe
- Hãng
- Model
- Màu
- Biển số
- RFID
- QR Code
- Trạng thái

---

# 5. Quản lý bãi xe

Khai báo

- Khu A
- Khu B
- Tầng
- Block

Mỗi khu

- Tổng chỗ
- Chỗ trống
- Chỗ đã sử dụng

Hiển thị sơ đồ.

---

# 6. Trông giữ xe

## Nhận xe

Lưu

- Giờ vào
- Camera
- Biển số
- Hình xe
- Hình người gửi
- Nhân viên

Có thể:

- In vé
- QR
- RFID

---

## Trả xe

Hiển thị

- Giờ vào
- Giờ ra
- Tổng thời gian
- Tiền gửi

Thanh toán

- Tiền mặt
- QR
- Chuyển khoản

---

# 7. Vé tháng

Quản lý

- Vé tháng
- Vé quý
- Vé năm

Theo dõi

Ngày hết hạn

Tự cảnh báo.

---

# 8. Thuê xe

Quản lý

- Xe máy
- Ô tô
- Xe điện

Thông tin

- Khách thuê
- Ngày thuê
- Ngày trả
- Tiền cọc
- Tiền thuê
- Trạng thái

---

# 9. Quản lý hợp đồng

Lưu

- File PDF
- CCCD
- GPLX
- Hình xe
- Hình khách

In hợp đồng.

---

# 10. Camera AI

## Nhận diện biển số

Camera

↓

OCR

↓

Biển số

↓

Tra cứu

↓

Hiển thị thông tin.

Có thể tích hợp

- OpenALPR
- Plate Recognizer
- YOLO OCR
- Google ML Kit

---

# 11. Camera quan sát

Có thể hiển thị

- Camera cổng vào
- Camera cổng ra
- Camera bãi
- Camera văn phòng

Hỗ trợ

RTSP

ONVIF

IP Camera

NVR

---

# 12. Quét Camera

Tự động

- Đọc biển số
- Chụp ảnh
- Lưu thời gian
- Lưu nhân viên
- Kiểm tra vé tháng

Nếu biển số nằm blacklist

=> Báo động.

---

# 13. Tra cứu Camera

Tìm theo

- Biển số
- Ngày
- Giờ
- Camera
- Khách hàng

Xem lại

- Hình
- Video
- Lịch sử

---

# 14. Báo cáo

## Doanh thu

Theo

- Ngày
- Tuần
- Tháng
- Năm

---

## Báo cáo gửi xe

- Tổng lượt
- Theo loại xe
- Theo nhân viên

---

## Báo cáo thuê xe

- Xe đang thuê
- Xe đã trả
- Xe quá hạn

---

## Báo cáo công nợ

- Khách
- Đặt cọc
- Còn thiếu

---

## Báo cáo chi phí

- Điện
- Nước
- Thuê mặt bằng
- Camera
- Lương
- Bảo trì

---

## Báo cáo lãi lỗ

Lợi nhuận

=

Doanh thu

-

Chi phí

---

# 15. Quản lý nhân viên

- Thu ngân
- Bảo vệ
- Quản lý
- Admin

Phân quyền.

---

# 16. Thông báo

- Vé tháng hết hạn
- Xe quá giờ
- Xe thuê quá hạn
- Camera Offline
- Đồng bộ lỗi

---

# 17. Đồng bộ dữ liệu

Offline

↓

Isar

↓

API Queue

↓

Vercel

↓

Neon PostgreSQL

↓

Các thiết bị khác Sync.

---

# 18. Module Cloud

Đăng nhập

↓

API

↓

JWT

↓

Refresh Token

↓

Sync.

---

# 19. Cấu trúc Isar

Customer

Vehicle

ParkingTicket

ParkingArea

MonthlyTicket

Rental

RentalContract

Payment

Expense

Income

Employee

Camera

ParkingHistory

SyncQueue

AuditLog

Setting

User

Role

Permission

---

# 20. API

POST

/api/login

/api/sync/upload

/api/sync/download

/api/parking/checkin

/api/parking/checkout

/api/vehicle

/api/customer

/api/rental

/api/report

/api/camera

/api/settings

---

# 21. Dashboard Admin

Quản lý

- Người dùng
- Gói dịch vụ
- License
- Camera
- API Key
- Đồng bộ
- Backup
- Nhật ký

---

# 22. Công nghệ

Frontend

- Flutter

Database Local

- Isar

Backend

- Vercel Functions

Database Cloud

- Neon PostgreSQL

State

- Riverpod

Network

- Dio

Auth

- JWT

Storage

- Supabase Storage hoặc Cloudflare R2 (ảnh/video)

Camera

- Camera Plugin
- RTSP
- ONVIF

OCR

- Google ML Kit
- OpenALPR
- Plate Recognizer

Charts

- fl_chart

Printing

- PDF
- ESC/POS
- Bluetooth Printer

---

# 23. Tính năng tương lai

✓ AI nhận diện xe

✓ Nhận diện khuôn mặt

✓ Barrier tự mở

✓ RFID

✓ NFC

✓ QR Check-in

✓ Zalo Mini App

✓ Thanh toán QR

✓ Ví điện tử

✓ GPS theo dõi xe thuê

✓ Khóa xe từ xa

✓ App khách hàng

✓ Cảnh báo mất xe

✓ AI thống kê lưu lượng xe

✓ Heatmap bãi xe

✓ Multi-branch

✓ Multi-company

✓ Backup Cloud tự động

✓ Đồng bộ thời gian thực

---

# 24. Mô hình dữ liệu tổng quát

Customer
    │
    ├── ParkingTicket
    │       │
    │       ├── Payment
    │       └── CameraCapture
    │
    ├── Rental
    │       │
    │       ├── RentalContract
    │       ├── Payment
    │       └── Vehicle
    │
Vehicle
    │
ParkingArea
    │
Camera
    │
SyncQueue
    │
Neon PostgreSQL

---

# 25. Mục tiêu

- Offline hoạt động 100%
- Đồng bộ nhiều thiết bị
- Quản lý nhiều chi nhánh
- Quản lý hàng chục nghìn lượt xe/ngày
- Tích hợp camera AI nhận diện biển số
- Theo dõi xe gửi và xe cho thuê trên một nền tảng duy nhất
- Dễ mở rộng sang bãi xe thông minh (Smart Parking)