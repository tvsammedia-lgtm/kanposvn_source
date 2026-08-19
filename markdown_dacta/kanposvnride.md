# 🚖 TÀI LIỆU YÊU CẦU PHẦN MỀM (SRS)
# Ứng dụng gọi xe KanRide
### (Flutter + Isar Offline + Vercel API + Neon PostgreSQL)

**Phiên bản:** 1.0

**Ngày cập nhật:** 05/08/2026

---

# 1. Mục tiêu

Xây dựng hệ thống gọi xe đa nền tảng tương tự:

- Bee
- Xanh SM
- Grab
- Gojek

Hệ thống hoạt động Online + Offline.

Kiến trúc:

```
Flutter
      │
      │
 Isar Database
      │
Offline Queue
      │
Sync Engine
      │
REST API (Vercel)
      │
Neon PostgreSQL
```

---

# 2. Kiến trúc hệ thống

## Mobile Flutter

Khách hàng

Tài xế

Admin

CSKH

---

## Database Local

Isar

Lưu:

- User
- Driver
- Booking
- Trip
- Wallet
- Promotion
- Notification
- Offline Queue
- GPS Cache

---

## Server

Vercel API

JWT Authentication

Refresh Token

WebSocket

Firebase Push Notification

Google Maps API

Mapbox

OmniRoute

OpenStreetMap

---

## Cloud Database

Neon PostgreSQL

Master Data

Realtime

Báo cáo

Thống kê

---

# 3. Loại tài khoản

## Khách hàng

Đặt xe

Theo dõi xe

Thanh toán

Lịch sử

Ví điện tử

Đánh giá

---

## Tài xế

Nhận cuốc

Online/Offline

Ví tài xế

Doanh thu

Rút tiền

Đánh giá

---

## Điều phối

Theo dõi toàn bộ xe

Can thiệp chuyến

Điều xe

---

## Admin

Quản lý toàn hệ thống

---

# 4. Chức năng đăng nhập

Đăng ký

OTP

Google

Apple

Facebook

Zalo

Email

SĐT

FaceID

Fingerprint

---

# 5. Hồ sơ khách hàng

Họ tên

Avatar

Điện thoại

Email

Địa chỉ

Điểm thưởng

Ví

Mã giới thiệu

---

# 6. Hồ sơ tài xế

CMND/CCCD

GPLX

Bảo hiểm

Xe

Biển số

Giấy đăng kiểm

Tài khoản ngân hàng

Ảnh xe

Ảnh giấy tờ

Trạng thái xác minh

---

# 7. Quản lý xe

Xe máy

Xe điện

Ô tô 4 chỗ

Ô tô 7 chỗ

Taxi

Luxury

SUV

Van

Xe tải nhỏ

Giao hàng

---

# 8. Loại dịch vụ

Taxi

Xe điện

Đi chung

Thuê theo giờ

Thuê theo ngày

Đưa đón sân bay

Đưa đón bệnh viện

Giao hàng

Giao đồ ăn

Giao thuốc

Đi chợ

---

# 9. Đặt xe

Nhập điểm đón

Nhập điểm trả

Đặt nhiều điểm dừng

Đặt trước

Đặt ngay

Ước tính giá

Thời gian đến

---

# 10. Bản đồ

Google Maps

Mapbox

OpenStreetMap

OmniRoute

Hiển thị:

Xe

Khách

Điểm đón

Điểm trả

Lộ trình

Tắc đường

---

# 11. Theo dõi GPS

Realtime

Background

Sai lệch GPS

Mất tín hiệu

Lưu cache

Replay hành trình

---

# 12. Ghép chuyến

Ride Sharing

Ghép khách

Ghép tuyến

Tiết kiệm chi phí

---

# 13. Thuật toán điều xe

Xe gần nhất

Xe điểm cao

Xe ít chuyến

Xe ưu tiên

Xe điện

Xe đang rảnh

---

# 14. Tính giá cước

Giá mở cửa

Theo Km

Theo phút

Giờ cao điểm

Giờ thấp điểm

Ngày lễ

Phụ phí cầu đường

Phụ phí sân bay

Khuyến mãi

Voucher

---

# 15. Thanh toán

Tiền mặt

QR

VNPay

MoMo

ZaloPay

Apple Pay

Google Pay

Visa

MasterCard

Ví nội bộ

---

# 16. Ví khách hàng

Nạp tiền

Rút tiền

Hoàn tiền

Lịch sử

Điểm thưởng

---

# 17. Ví tài xế

Doanh thu

Hoa hồng

Thưởng

Phạt

Rút tiền

Lịch sử

---

# 18. Khuyến mãi

Voucher

Coupon

Flash Sale

Giảm %

Giảm tiền

Miễn phí chuyến đầu

---

# 19. Chương trình giới thiệu

Giới thiệu khách

Giới thiệu tài xế

Hoa hồng

Điểm thưởng

---

# 20. Đánh giá

⭐ 1-5 sao

Bình luận

Khiếu nại

Blacklist

---

# 21. Chat

Khách ↔ Tài xế

Gửi hình

Emoji

Voice

Vị trí

---

# 22. Gọi điện

Ẩn số

VoIP

Call trực tiếp

---

# 23. Thông báo

Firebase Push

SMS

Email

Zalo OA

---

# 24. Lịch sử chuyến

Theo ngày

Theo tháng

Theo tài xế

Theo khách

Theo khu vực

---

# 25. Báo cáo khách hàng

Số chuyến

Chi tiêu

Điểm

Khuyến mãi

---

# 26. Báo cáo tài xế

Doanh thu

Số chuyến

Km

Thời gian online

Thưởng

Phạt

---

# 27. Báo cáo tài chính

Doanh thu

Chi phí

Hoa hồng

Khuyến mãi

Lợi nhuận

---

# 28. Dashboard

Doanh thu hôm nay

Xe Online

Xe Offline

Đơn chờ

Đơn hoàn thành

Đơn hủy

Khách mới

Tài xế mới

---

# 29. Quản lý khu vực

Tỉnh

Huyện

Xã

GeoFence

Vùng hoạt động

---

# 30. Hệ thống giá động (Dynamic Pricing)

Theo:

Mưa

Lễ

Tắc đường

Giờ cao điểm

Nhu cầu

---

# 31. Trung tâm CSKH

Ticket

Live Chat

Khiếu nại

Hoàn tiền

Bồi thường

---

# 32. Quản lý tài xế

Duyệt hồ sơ

Khóa

Mở khóa

Cảnh báo

---

# 33. Quản lý khách hàng

Khóa

Whitelist

Blacklist

---

# 34. CMS

Banner

Tin tức

Khuyến mãi

Popup

FAQ

---

# 35. Nhật ký hệ thống

Login

Booking

Thanh toán

GPS

API

Error

---

# 36. Offline Sync (Isar)

Khi mất mạng:

Booking

Wallet

Notification

GPS Cache

Queue

Sync lại khi Online.

---

# 37. Đồng bộ dữ liệu

Flutter

↓

Isar

↓

Offline Queue

↓

Sync Service

↓

REST API

↓

Vercel

↓

Neon PostgreSQL

---

# 38. API

Authentication

Booking

Driver

Trip

Wallet

Promotion

Notification

Rating

Payment

Maps

Location

Report

---

# 39. Bảo mật

JWT

Refresh Token

HTTPS

AES Encryption

SSL

RBAC

2FA

Device Binding

---

# 40. Công nghệ

## Mobile

Flutter 3.x

Riverpod

GoRouter

Isar

Dio

Hive Cache

Firebase

Google Maps

Mapbox

Geolocator

Background Service

---

## Backend

Vercel

NodeJS

TypeScript

Express

JWT

Redis

Cron Job

---

## Database

Neon PostgreSQL

---

## Realtime

Socket.IO

Firebase Cloud Messaging

---

## DevOps

GitHub

GitHub Actions

Docker

Vercel Deployment

---

# 41. Mô hình Database (Neon PostgreSQL)

## Master

- users
- drivers
- vehicles
- vehicle_types
- bookings
- trips
- trip_routes
- trip_locations
- wallets
- wallet_transactions
- promotions
- coupons
- referrals
- ratings
- complaints
- notifications
- driver_documents
- driver_bank_accounts
- payments
- invoices
- surge_pricing
- service_areas
- geofences
- banners
- app_settings
- audit_logs
- api_logs
- sync_logs

---

# 42. Chỉ số KPI

- Thời gian tìm tài xế < 5 giây
- Thời gian phản hồi API < 300ms
- Đồng bộ Isar < 2 giây
- Hỗ trợ >100.000 người dùng
- >20.000 tài xế đồng thời
- >5 triệu chuyến/năm

---

# 43. Lộ trình phát triển

## Giai đoạn 1

- Đăng ký/Đăng nhập
- Gọi xe
- GPS
- Thanh toán tiền mặt
- Theo dõi chuyến

## Giai đoạn 2

- Ví điện tử
- QR Payment
- Voucher
- Giới thiệu bạn bè
- Đánh giá

## Giai đoạn 3

- Ride Sharing
- AI điều phối tài xế
- Dynamic Pricing
- Phân tích dữ liệu
- Dashboard thời gian thực

## Giai đoạn 4

- Thuê xe tự lái
- Giao hàng
- Giao đồ ăn
- Taxi doanh nghiệp
- API cho đối tác
- AI dự đoán nhu cầu và tối ưu điều xe