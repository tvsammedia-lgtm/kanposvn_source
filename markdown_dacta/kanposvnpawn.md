# KanPhone Pawn
## Hệ thống quản lý cửa hàng điện thoại - Cầm đồ - Ký gửi

Phiên bản: 1.0

---

# 1. Giới thiệu

Phần mềm quản lý dành cho:

- Cửa hàng điện thoại mới
- Cửa hàng điện thoại cũ
- Cửa hàng sửa chữa
- Cửa hàng mua bán iPad
- Macbook
- Laptop
- Đồng hồ thông minh
- AirPods
- Cửa hàng cầm đồ điện thoại

Hoạt động Offline trước bằng Isar Database.

Tự động đồng bộ dữ liệu lên Neon PostgreSQL thông qua API Vercel.

---

# 2. Công nghệ

Frontend

- Flutter
- Material 3
- Riverpod
- GoRouter

Offline Database

- Isar Database

Cloud

- Neon PostgreSQL

Backend

- Vercel Serverless API

Authentication

- JWT
- Refresh Token

Storage

- Cloudflare R2 hoặc Supabase Storage

---

# 3. Kiến trúc

Flutter

↓

Isar

↓

Sync Service

↓

REST API Vercel

↓

Neon PostgreSQL

Admin Web

↓

Neon PostgreSQL

---

# 4. Phân quyền

## Chủ cửa hàng

Toàn quyền

## Quản lý

Quản lý nhân viên

Quản lý kho

Xem báo cáo

## Thu ngân

Bán hàng

Thu tiền

Không sửa giá vốn

## Nhân viên kỹ thuật

Nhận sửa chữa

Bảo hành

## Nhân viên cầm đồ

Lập phiếu cầm

Gia hạn

Thanh lý

Thu lãi

---

# 5. Quản lý khách hàng

Thông tin

- Mã khách
- Họ tên
- CCCD
- Ngày sinh
- Giới tính
- Điện thoại
- Email
- Địa chỉ

Thông tin tài chính

- Công nợ
- Tổng mua
- Tổng cầm
- Tổng ký gửi

Lịch sử

- Mua
- Bán
- Ký gửi
- Cầm đồ
- Sửa chữa

Điểm thưởng

Hạng thành viên

---

# 6. Quản lý hàng hóa

Điện thoại

iPhone

Samsung

Xiaomi

Oppo

Vivo

Realme

Google Pixel

iPad

Macbook

Laptop

Apple Watch

AirPods

Phụ kiện

IMEI

Serial

Màu

Dung lượng

Tình trạng

Mới

Like New

99%

95%

Lỗi nhẹ

Giá vốn

Giá bán

Giá nhập

Giá ký gửi

---

# 7. Quản lý tồn kho

Theo IMEI

Theo Serial

Theo màu

Theo dung lượng

Theo chi nhánh

Theo kho

Theo tình trạng

---

# 8. Nhập hàng

Nhà cung cấp

Phiếu nhập

Chi phí nhập

VAT

Khuyến mãi

Chiết khấu

Thanh toán

---

# 9. Bán hàng

Quét Barcode

Quét IMEI

Tìm nhanh

Giảm giá

Voucher

Combo

Thanh toán

Tiền mặt

Chuyển khoản

QR

Ví điện tử

In hóa đơn

Xuất PDF

---

# 10. Mua điện thoại cũ

Tiếp nhận

Kiểm tra

Định giá

IMEI

Serial

FaceID

Màn hình

Pin

Camera

Loa

Mic

Wifi

Bluetooth

IC

Nguồn

Phụ kiện

Ảnh sản phẩm

Chi phí sửa

Giá mua

---

# 11. Ký gửi

Thông tin người gửi

Thông tin sản phẩm

Giá mong muốn

Hoa hồng

Ngày nhận

Ngày hết hạn

Đã bán

Chưa bán

Hoàn trả

Thanh toán

---

# 12. Cầm đồ

Thông tin khách

CCCD

Ảnh CCCD

Ảnh chân dung

Ảnh tài sản

IMEI

Serial

Mô tả

Giá trị

Tiền cầm

Lãi suất

Theo ngày

Theo tháng

Theo năm

Ngày cầm

Ngày đáo hạn

Số ngày

Tiền lãi

Đã thu lãi

Gia hạn

Chuộc

Thanh lý

Quá hạn

---

# 13. Công thức tính lãi

Theo ngày

Tiền lãi =
Tiền cầm × Lãi suất × Số ngày

Theo tháng

Tiền lãi =
Tiền cầm × Lãi suất %

Theo năm

Theo dư nợ

Theo lãi cố định

Cho phép cấu hình.

---

# 14. In phiếu cầm đồ

Logo

Thông tin cửa hàng

Thông tin khách

CCCD

IMEI

Serial

Model

Tiền cầm

Lãi suất

Ngày cầm

Ngày đáo hạn

Điều khoản

Chữ ký

Mã QR

Barcode

Xuất PDF

In Bluetooth

In nhiệt 58mm

In nhiệt 80mm

---

# 15. Gia hạn cầm

Thu lãi

Gia hạn

Cập nhật ngày đáo hạn

Lưu lịch sử

---

# 16. Thanh lý

Quá hạn

Bán thanh lý

Nhập kho

Ghi nhận lợi nhuận

---

# 17. Sửa chữa

Phiếu nhận

Lỗi

Chi phí

Linh kiện

Bảo hành

Kỹ thuật viên

---

# 18. Quản lý bảo hành

Theo IMEI

Theo hóa đơn

Theo khách hàng

Theo thời gian

---

# 19. Thu chi

Thu

Bán hàng

Thu lãi

Thu nợ

Thu khác

Chi

Nhập hàng

Lương

Điện nước

Thuê nhà

Marketing

Khác

---

# 20. Công nợ

Khách hàng

Nhà cung cấp

Đã trả

Chưa trả

Quá hạn

---

# 21. Báo cáo doanh thu

Theo

Ngày

Tuần

Tháng

Quý

Năm

Theo

Nhân viên

Chi nhánh

Sản phẩm

---

# 22. Báo cáo lợi nhuận

Lãi gộp

Chi phí

Lợi nhuận

Theo

Ngày

Tháng

Năm

---

# 23. Báo cáo cầm đồ

Đang cầm

Đã chuộc

Quá hạn

Thanh lý

Thu lãi

Doanh thu lãi

---

# 24. Báo cáo tồn kho

Theo hãng

Theo model

Theo IMEI

Theo giá trị

Theo thời gian tồn

---

# 25. Dashboard

Doanh thu hôm nay

Lợi nhuận hôm nay

Tiền lãi cầm

Đơn bán

Đơn mua

Đơn ký gửi

Phiếu cầm

Tồn kho

Công nợ

---

# 26. Đồng bộ dữ liệu

Upload

Download

Increment Sync

Conflict Resolution

Deleted Record Sync

Realtime Status

Retry Queue

---

# 27. API

POST

/api/login

/api/sync/upload

/api/sync/download

/api/customer

/api/product

/api/invoice

/api/pawn

/api/consignment

/api/report

/api/dashboard

---

# 28. Isar Collections

User

Role

Customer

Supplier

Product

Brand

Category

IMEI

Warehouse

Inventory

PurchaseInvoice

PurchaseDetail

SaleInvoice

SaleDetail

PawnContract

PawnInterest

PawnExtension

PawnRedeem

PawnLiquidation

Consignment

RepairOrder

Warranty

Receipt

Payment

Expense

Income

Voucher

Promotion

PointHistory

LoyaltyMember

Attachment

AuditLog

SyncQueue

SyncLog

Settings

---

# 29. Tính năng nâng cao

✓ Chụp ảnh tài sản

✓ OCR đọc CCCD

✓ Quét Barcode

✓ Quét QR

✓ Quét IMEI

✓ Chữ ký điện tử

✓ Sao lưu

✓ Khôi phục

✓ Offline 100%

✓ Đồng bộ nhiều thiết bị

✓ Nhật ký thao tác

✓ Khóa dữ liệu

✓ Phân quyền chi tiết

✓ Dark Mode

✓ Push Notification

✓ SMS nhắc đáo hạn

✓ Email thông báo

✓ Zalo OA thông báo

✓ WhatsApp thông báo

---

# 30. Mô hình Offline First

Flutter

↓

Isar

↓

Sync Queue

↓

API Vercel

↓

Neon PostgreSQL

↓

Admin Web

---

# 31. Lộ trình phát triển

Giai đoạn 1
- Quản lý khách hàng
- Kho hàng
- Mua bán
- Thu chi

Giai đoạn 2
- Cầm đồ
- Tính lãi
- In phiếu cầm
- Gia hạn
- Thanh lý

Giai đoạn 3
- Ký gửi
- Sửa chữa
- Bảo hành
- Loyalty

Giai đoạn 4
- Dashboard BI
- AI dự báo doanh thu
- AI định giá máy cũ
- AI phát hiện giao dịch bất thường
- Đồng bộ đa chi nhánh