# Hệ thống Quản lý Barber Shop AI
### Phiên bản 1.0

---

# 1. Giới thiệu

Ứng dụng quản lý Barber Shop được xây dựng theo mô hình Offline First.

Công nghệ

- Flutter
- Isar Database
- Vercel API
- Neon PostgreSQL
- Riverpod
- REST API
- JWT Authentication
- AI Hair Style Advisor

Ứng dụng hoạt động ngay cả khi mất Internet.

Internet chỉ dùng để:

- Đăng nhập
- Đồng bộ dữ liệu
- Sao lưu
- AI phân tích kiểu tóc
- Nhận thông báo

---

# 2. Kiến trúc

Flutter App

↓

Isar Database

↓

Sync Engine

↓

Vercel REST API

↓

Neon PostgreSQL

Mọi thao tác đều ghi xuống Isar trước.

Background Sync tự động đồng bộ lên Cloud.

---

# 3. Chức năng

## Dashboard

Hiển thị

- Doanh thu hôm nay
- Doanh thu tháng
- Số lịch hẹn
- Khách đang chờ
- Ghế đang sử dụng
- Số hóa đơn
- Voucher đã phát
- Khách VIP
- Lợi nhuận
- Công nợ
- Chi phí
- Tỷ lệ lấp đầy lịch

---

# 4. Quản lý khách hàng

Thông tin

- Mã KH
- Họ tên
- Avatar
- Giới tính
- Ngày sinh
- Số điện thoại
- Email
- Facebook
- Zalo
- Địa chỉ
- Ghi chú

Lịch sử

- Lần cắt gần nhất
- Kiểu tóc đã làm
- Màu nhuộm
- Dịch vụ đã sử dụng
- Tổng chi tiêu
- Điểm tích lũy

Ảnh trước và sau khi làm tóc

---

# 5. AI Hair Style Advisor

Khách chụp ảnh

↓

AI nhận diện

- Hình dạng khuôn mặt
- Màu da
- Mật độ tóc
- Kiểu tóc hiện tại

AI đề xuất

- Buzz Cut
- Crew Cut
- Undercut
- Pompadour
- Side Part
- Mohican
- Layer
- Two Block
- Wolf Cut
- Mullet
- French Crop
- Fade
- Quiff

Có thể tạo hình mô phỏng trước khi cắt.

---

# 6. Quản lý dịch vụ

Ví dụ

- Cắt tóc
- Gội đầu
- Cạo mặt
- Uốn
- Duỗi
- Nhuộm
- Phục hồi tóc
- Wax tạo kiểu
- Massage đầu

Thông tin

- Giá
- Thời gian
- Thợ thực hiện
- Hoa hồng

---

# 7. Quản lý lịch hẹn

Đặt lịch

Theo

- Ngày
- Giờ
- Thợ

Trạng thái

- Chờ xác nhận
- Đã xác nhận
- Đang phục vụ
- Hoàn thành
- Hủy

Nhắc lịch

- Push Notification
- SMS
- Email
- Zalo OA

---

# 8. Quản lý nhân viên

Thông tin

- Barber
- Quản lý
- Thu ngân

Theo dõi

- Doanh thu cá nhân
- Hoa hồng
- Lương
- KPI
- Số khách
- Đánh giá

---

# 9. POS Bán hàng

Thanh toán

- Tiền mặt
- QR
- Chuyển khoản
- Ví điện tử

In hóa đơn

PDF

Bluetooth Printer

Thermal Printer

---

# 10. Voucher

Loại

- Giảm %
- Giảm tiền
- Combo

Điều kiện

- Theo hóa đơn
- Theo dịch vụ
- Theo khách VIP

---

# 11. Membership

Bán gói

- Tháng
- Quý
- Năm

Ví dụ

Silver

Gold

Diamond

Quyền lợi

- Giảm giá
- Ưu tiên đặt lịch
- Tặng dịch vụ

---

# 12. Điểm thưởng

Khách tích điểm

100.000 = 1 điểm

Đổi

- Voucher
- Quà tặng
- Dịch vụ miễn phí

---

# 13. Khuyến mãi

Flash Sale

Happy Hour

Sinh nhật

Giới thiệu bạn bè

Mua Combo

---

# 14. Quản lý kho

Mặt hàng

- Thuốc nhuộm
- Dầu gội
- Kem uốn
- Wax
- Gel
- Lược
- Kéo
- Khăn

Theo dõi

- Nhập
- Xuất
- Tồn
- Hạn sử dụng

---

# 15. Thiết bị

Theo dõi

- Máy sấy
- Tông đơ
- Ghế cắt
- Máy hấp tóc
- Máy uốn

Thông tin

- Ngày mua
- Giá
- Khấu hao
- Bảo trì

---

# 16. Chi phí

- Thuê mặt bằng
- Điện
- Nước
- Internet
- Marketing
- Lương
- Mỹ phẩm
- Thiết bị

---

# 17. Công nợ

Khách hàng

Nhà cung cấp

Theo dõi

- Phải thu
- Phải trả

---

# 18. Báo cáo

Theo

Ngày

Tuần

Tháng

Quý

Năm

Báo cáo

- Doanh thu
- Chi phí
- Lợi nhuận
- Khách mới
- Khách quay lại
- Dịch vụ bán chạy
- Barber xuất sắc
- Doanh thu theo thợ
- Doanh thu theo dịch vụ
- Doanh thu theo chi nhánh
- Hoa hồng nhân viên
- Voucher
- Membership
- Điểm thưởng

Biểu đồ

- Line
- Pie
- Bar

---

# 19. Đồng bộ dữ liệu

Realtime

Auto Sync

Manual Sync

Conflict Resolution

Last Modified

Version Number

Deleted Flag

---

# 20. Isar Collections

AppUser

Role

Permission

Customer

Appointment

Employee

HairStyle

HairSuggestion

Service

Invoice

InvoiceDetail

Product

Inventory

Supplier

Expense

Revenue

Membership

Voucher

Promotion

RewardPoint

Asset

Depreciation

Commission

Attendance

Notification

Branch

Settings

SyncQueue

AuditLog

---

# 21. Neon PostgreSQL Tables

users

roles

permissions

customers

appointments

employees

services

hair_styles

hair_ai_logs

invoices

invoice_details

inventory

products

suppliers

expenses

assets

depreciations

commissions

memberships

reward_points

vouchers

promotions

branches

notifications

audit_logs

sync_logs

---

# 22. API Vercel

POST

/login

/register

/refresh-token

/customer/create

/customer/update

/customer/delete

/customer/list

/appointment/create

/appointment/update

/appointment/checkin

/service/list

/invoice/create

/invoice/list

/inventory/list

/expense/create

/report/dashboard

/report/revenue

/report/profit

/report/customer

/report/barber

/report/service

/report/inventory

/ai/recommend-hairstyle

/ai/generate-preview

/sync/upload

/sync/download

/sync/status

---

# 23. AI Module

OpenAI Vision

Gemini Vision

Face Detection

Hair Detection

Face Shape

Hair Density

Hair Color

Virtual Hair Try-On

Prompt Generator

Recommendation Engine

---

# 24. Phân quyền

Super Admin

Owner

Manager

Barber

Receptionist

Cashier

Warehouse

Accountant

Customer

---

# 25. Thông báo

Đặt lịch

Nhắc lịch

Voucher

Khuyến mãi

Sinh nhật khách hàng

Khách VIP

Thiếu hàng

Đến hạn bảo trì thiết bị

---

# 26. Bảo mật

JWT

HTTPS

Refresh Token

AES Local Encryption

Role Permission

Audit Log

Backup

Restore

Offline Cache

---

# 27. Roadmap

Version 1

✔ POS Barber Shop

✔ Đặt lịch

✔ Khách hàng

✔ Báo cáo

Version 2

✔ AI tư vấn kiểu tóc

✔ AI mô phỏng trước khi cắt

✔ AI gợi ý màu nhuộm

Version 3

✔ Chuỗi nhiều chi nhánh

✔ CRM

✔ Loyalty

✔ Marketing Automation

Version 4

✔ AI dự báo doanh thu

✔ AI dự báo tồn kho

✔ AI chăm sóc khách hàng

✔ AI Chatbot tư vấn 24/7

---

# Kết luận

Ứng dụng Barber Shop AI hoạt động theo mô hình Offline First sử dụng Isar để lưu dữ liệu cục bộ, đồng bộ an toàn với Neon PostgreSQL thông qua Vercel API. Hệ thống hỗ trợ quản lý toàn diện từ khách hàng, lịch hẹn, dịch vụ, POS, kho, tài sản, doanh thu, chi phí đến AI tư vấn kiểu tóc và mô phỏng trước khi cắt, phù hợp cho cửa hàng đơn lẻ hoặc chuỗi Barber Shop.