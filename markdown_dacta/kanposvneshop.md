# KanShop
## Nền tảng thương mại điện tử đa cửa hàng

---

# 1. Công nghệ

Frontend
- Flutter 3.x
- Dart
- Material 3

Local Database
- Isar Database

Cloud Database
- Neon PostgreSQL

Backend API
- Vercel Serverless API
- REST API
- JWT Authentication

Storage
- Cloudflare R2
hoặc
- Supabase Storage

Notification
- Firebase Cloud Messaging

Map
- OmniRoute
- OpenStreetMap

Thanh toán
- ZaloPay
- VNPay
- Momo
- Stripe

Realtime
- Websocket
- SSE

---

# 2. Kiến trúc

Flutter

↓

Isar

↓

Sync Engine

↓

REST API

↓

Vercel

↓

Neon PostgreSQL

↓

Admin Web

---

# 3. Offline First

Toàn bộ dữ liệu

- sản phẩm
- khách hàng
- đơn hàng
- giỏ hàng
- yêu thích

đều lưu trong Isar.

Khi online

Sync Engine

↓

đẩy dữ liệu

↓

API

↓

Neon

Ngược lại

Neon

↓

API

↓

Flutter

↓

Isar

---

# 4. Module

## Khách hàng

- Đăng ký
- Đăng nhập
- OTP
- Google
- Apple
- Facebook
- Zalo

Thông tin

- tên
- avatar
- địa chỉ
- điện thoại

---

## Shop

Mỗi người bán có

- Shop ID
- Tên shop
- Logo
- Banner
- Đánh giá
- Người theo dõi

---

## Danh mục

Không giới hạn cấp

Ví dụ

Điện thoại

↓

Android

↓

Samsung

↓

Galaxy

---

## Thương hiệu

Ví dụ

Apple

Samsung

Sony

LG

Asus

Dell

---

## Sản phẩm

Thông tin

- SKU
- Barcode
- QRCode
- tên
- mô tả
- hình ảnh
- video
- giá
- giá khuyến mãi
- tồn kho
- cân nặng
- kích thước

Nhiều thuộc tính

Ví dụ

Màu

- Đen
- Trắng
- Xanh

Size

- M
- L
- XL

---

## Hình ảnh

Nhiều ảnh

Video

360°

---

## Kho hàng

- nhập
- xuất
- tồn

Theo

- Shop
- Kho

---

## Flash Sale

Có

- thời gian
- giới hạn

---

## Voucher

Loại

- %
- tiền

Áp dụng

- sản phẩm
- shop
- toàn sàn

---

## Combo

Mua

2

tặng

1

---

## Livestream

- xem trực tiếp
- chat
- mua ngay

---

## Giỏ hàng

Nhiều shop

---

## Đặt hàng

Trạng thái

- Chờ xác nhận
- Đang chuẩn bị
- Đang giao
- Hoàn thành
- Hủy

---

## Thanh toán

COD

VNPay

Momo

ZaloPay

Stripe

---

## Vận chuyển

Đơn vị

- GHN
- GHTK
- Viettel Post
- J&T
- Ninja Van

Theo dõi

Realtime

---

## Theo dõi GPS

Map

Hiển thị

- người giao
- vị trí

---

## Chat

Khách

↓

Shop

Hỗ trợ

- ảnh
- video
- file
- emoji

---

## Đánh giá

1-5 sao

Có

- ảnh
- video

---

## Yêu thích

Wishlist

---

## Theo dõi Shop

Follow

---

## Thông báo

Push

In-app

Email

SMS

---

## Khiếu nại

Hoàn tiền

Trả hàng

---

## Affiliate

Giới thiệu

Hoa hồng

---

## Điểm thưởng

Tích điểm

Đổi quà

---

## Ví điện tử

Số dư

Lịch sử

---

# 5. Người bán

Dashboard

Doanh thu

Đơn hàng

Khách hàng

---

Quản lý

- sản phẩm
- tồn kho
- voucher
- livestream
- quảng cáo

---

# 6. Admin

Quản lý

- User
- Shop
- Danh mục
- Banner
- Flash Sale
- Voucher

---

Duyệt

- Shop
- Sản phẩm

---

Khóa

- User
- Shop

---

# 7. Báo cáo

Doanh thu

Theo

- giờ
- ngày
- tuần
- tháng
- năm

Top

- Shop
- Sản phẩm
- Khách hàng

Lợi nhuận

Hoa hồng

Phí sàn

---

# 8. Isar Collections

User

Shop

Product

Category

Brand

Cart

CartItem

Order

OrderItem

Address

Voucher

FlashSale

Warehouse

Inventory

Review

Wishlist

ChatRoom

ChatMessage

Notification

Shipment

Payment

Transaction

Affiliate

Wallet

Point

Banner

Config

SyncQueue

AuditLog

---

# 9. Neon Tables

users

shops

products

categories

brands

orders

order_items

payments

wallets

reviews

notifications

sync_logs

audit_logs

---

# 10. Sync Engine

Upload

Insert

Update

Delete

Download

Conflict Resolve

Soft Delete

Incremental Sync

Batch Sync

Retry Queue

Checksum

Version

updated_at

deleted_at

---

# 11. API

POST

/api/auth/login

/api/auth/register

/api/product

/api/order

/api/cart

/api/shop

/api/payment

/api/review

/api/upload

/api/sync/upload

/api/sync/download

/api/report

/api/admin

---

# 12. Bảo mật

JWT

Refresh Token

HTTPS

AES Encryption

Role Permission

API Key

Rate Limit

Audit Log

---

# 13. Role

Super Admin

Admin

Seller

Employee

Shipper

Customer

Guest

---

# 14. AI

AI Search

AI Recommendation

AI Chatbot

AI Product Description

AI Auto Translate

AI Fraud Detection

AI Review Summary

---

# 15. Push Notification

Đơn mới

Thanh toán

Đang giao

Flash Sale

Voucher

Chat

Khuyến mãi

---

# 16. Dashboard

GMV

Đơn hàng

Khách hàng

Shop

Top sản phẩm

Top doanh thu

Biểu đồ

Realtime

---

# 17. Kiến trúc thư mục Flutter

lib/

core/

services/

isar/

sync/

api/

features/

authentication/

customer/

seller/

admin/

home/

product/

order/

cart/

payment/

shipment/

chat/

wallet/

voucher/

notification/

report/

map/

ai/

shared/

widgets/

models/

repositories/

---

# 18. Mô hình SaaS đa tenant

- Một tài khoản có thể sở hữu nhiều Shop.
- Mỗi Shop là một tenant logic với dữ liệu được phân tách bằng `shop_id`.
- Isar lưu cache cục bộ theo tài khoản và Shop đang hoạt động.
- Neon PostgreSQL sử dụng Row Level Security (RLS) hoặc `tenant_id` để cô lập dữ liệu.
- Vercel API xác thực JWT và chỉ cho phép truy cập dữ liệu thuộc tenant tương ứng.

---

# 19. Lộ trình phát triển

## Giai đoạn 1 (MVP)
- Đăng ký/Đăng nhập
- Quản lý Shop
- Quản lý sản phẩm
- Giỏ hàng
- Đặt hàng
- Thanh toán COD
- Theo dõi đơn hàng
- Đồng bộ Isar ↔ Neon

## Giai đoạn 2
- Voucher
- Flash Sale
- Chat
- Đánh giá
- Yêu thích
- Theo dõi Shop
- Push Notification

## Giai đoạn 3
- Livestream bán hàng
- Affiliate
- Ví điện tử
- Điểm thưởng
- AI gợi ý sản phẩm
- Dashboard Realtime
- Quảng cáo nội sàn