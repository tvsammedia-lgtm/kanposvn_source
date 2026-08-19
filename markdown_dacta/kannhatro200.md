# HỆ THỐNG QUẢN LÝ CHO THUÊ PHÒNG TRỌ

Phiên bản: 1.0

---

# 1. Mục tiêu

Xây dựng ứng dụng Flutter hoạt động Offline First bằng Isar Database.

Dữ liệu sẽ đồng bộ lên Neon PostgreSQL thông qua API triển khai trên Vercel.

Đối tượng:

- Chủ nhà trọ
- Nhà nghỉ mini
- Khu trọ
- Chung cư mini

Quy mô:

- Khoảng 200 phòng
- Nhiều dãy nhà
- Nhiều tầng
- Nhiều nhân viên

---

# 2. Công nghệ

Frontend

- Flutter
- Dart
- Riverpod
- GoRouter
- Isar Database

Backend

- Vercel Serverless API
- PostgreSQL Neon
- JWT Authentication

Cloud

- Neon Database
- Vercel
- Cloudflare CDN (tùy chọn)

---

# 3. Kiến trúc

Flutter

↓

Isar Database (Offline)

↓

Sync Engine

↓

REST API (Vercel)

↓

Neon PostgreSQL

---

# 4. Đồng bộ dữ liệu

Mỗi bảng có

- id
- uuid
- updatedAt
- createdAt
- deleted
- syncStatus

Sync hai chiều

- Upload local
- Download server
- Merge dữ liệu
- Conflict Resolve

Làm việc offline 100%

Có internet sẽ Sync.

---

# 5. Module

## Dashboard

Hiển thị

- Tổng số phòng
- Phòng đang thuê
- Phòng trống
- Phòng sắp hết hợp đồng
- Khách sắp trả phòng
- Doanh thu tháng
- Chi phí tháng
- Lợi nhuận
- Công nợ khách thuê
- Tiền điện chưa thu
- Tiền nước chưa thu

---

# 6. Quản lý khu trọ

Một chủ có nhiều khu.

Ví dụ

Khu A

Khu B

Khu C

Thông tin

- Tên khu
- Địa chỉ
- Người quản lý
- Ghi chú

---

# 7. Quản lý dãy phòng

Ví dụ

Dãy A

Dãy B

Dãy C

Thuộc khu.

---

# 8. Quản lý phòng

Thông tin

- Mã phòng
- Tên phòng
- Dãy
- Tầng
- Diện tích
- Giá thuê
- Tiền cọc
- Trạng thái

Trạng thái

- Trống
- Đã thuê
- Đang sửa
- Giữ chỗ

Có hình ảnh phòng.

---

# 9. Quản lý khách thuê

Thông tin

- Họ tên
- CCCD
- Ngày sinh
- Điện thoại
- Email
- Địa chỉ thường trú
- Nghề nghiệp
- Biển số xe
- Ảnh CCCD
- Ảnh chân dung

Một khách

Có thể thuê nhiều phòng.

---

# 10. Quản lý hợp đồng

Thông tin

- Số hợp đồng
- Phòng
- Người thuê
- Ngày bắt đầu
- Ngày kết thúc
- Giá thuê
- Tiền cọc
- Chu kỳ thanh toán

Theo

- Tháng
- Quý
- Năm

Quản lý

- Gia hạn
- Thanh lý
- Chấm dứt

Lưu file PDF.

---

# 11. Thu tiền thuê

Theo tháng

Ví dụ

Tháng 8

Tiền phòng

Tiền điện

Tiền nước

Internet

Rác

Giữ xe

Dịch vụ khác

Giảm giá

Khuyến mãi

Tổng cộng

Đã thu

Còn nợ

In phiếu thu.

---

# 12. Quản lý điện

Thông tin

- Công tơ
- Chỉ số cũ
- Chỉ số mới
- Số điện tiêu thụ
- Đơn giá

Tự tính

Tiền điện.

Lưu lịch sử từng tháng.

---

# 13. Quản lý nước

Thông tin

- Đồng hồ nước
- Chỉ số cũ
- Chỉ số mới
- Đơn giá

Tự tính

Tiền nước.

---

# 14. Quản lý dịch vụ

Danh mục

- Internet
- Rác
- Giữ xe
- Máy giặt
- Điều hòa
- Vệ sinh
- Camera
- Dịch vụ khác

Có thể

- Thu cố định
- Thu theo số lượng
- Thu theo người

---

# 15. Phiếu thu

Thông tin

- Số phiếu
- Người thuê
- Phòng
- Ngày thu
- Nội dung
- Tổng tiền
- Người thu

Hỗ trợ

- In PDF
- Gửi Zalo
- Gửi Email

---

# 16. Phiếu chi

Danh mục

- Sửa chữa
- Mua sắm
- Bảo trì
- Lương
- Điện nước chung
- Internet chung
- Thuế
- Chi khác

---

# 17. Quản lý bảo trì

Thông tin

- Phòng
- Thiết bị
- Ngày sửa
- Nội dung
- Đơn vị sửa
- Chi phí
- Người thực hiện

Lưu ảnh.

---

# 18. Quản lý tài sản

Ví dụ

- Máy lạnh
- Quạt
- Bình nóng lạnh
- Tủ lạnh
- Giường
- Tủ
- Camera

Thông tin

- Ngày mua
- Giá mua
- Khấu hao
- Thời gian sử dụng

Theo dõi

- Bảo hành
- Hao mòn
- Bảo trì

---

# 19. Hao mòn tài sản

Tự động tính

Theo

- Tháng
- Năm

Báo cáo

- Giá trị ban đầu
- Giá trị còn lại
- Khấu hao lũy kế

---

# 20. Công nợ khách thuê

Theo dõi

- Nợ tiền phòng
- Nợ điện
- Nợ nước
- Nợ dịch vụ

Lịch sử thanh toán.

---

# 21. Báo cáo doanh thu

Theo

- Ngày
- Tuần
- Tháng
- Quý
- Năm

Theo

- Khu
- Dãy
- Phòng

Hiển thị

- Tiền phòng
- Điện
- Nước
- Dịch vụ

---

# 22. Báo cáo chi phí

Theo

- Thời gian
- Danh mục
- Phòng
- Khu

Bao gồm

- Bảo trì
- Khấu hao
- Điện nước chung
- Lương
- Chi khác

---

# 23. Báo cáo lợi nhuận

Lợi nhuận

=

Doanh thu

-

Chi phí

Theo

- Ngày
- Tháng
- Năm

Biểu đồ.

---

# 24. Báo cáo thu chi

Theo

- Ngày
- Tháng
- Năm

Hiển thị

- Tổng thu
- Tổng chi
- Chênh lệch

---

# 25. Báo cáo lãi lỗ tổng hợp

Hiển thị

Doanh thu

Chi phí

Khấu hao

Lợi nhuận

Tỷ suất lợi nhuận

---

# 26. Báo cáo lãi lỗ chi tiết

Theo

- Phòng
- Khu
- Dãy
- Tháng
- Năm

Chi tiết từng khoản.

---

# 27. Thống kê tỷ lệ lấp đầy

Hiển thị

- Tổng phòng
- Đã thuê
- Trống
- Tỷ lệ lấp đầy %

Theo

- Khu
- Dãy

---

# 28. Cảnh báo

Thông báo

- Sắp hết hợp đồng
- Quá hạn thanh toán
- Nợ nhiều tháng
- Bảo trì định kỳ
- Thiết bị hết bảo hành

---

# 29. Tìm kiếm

Theo

- Phòng
- Khách
- Điện thoại
- CCCD
- Hợp đồng

---

# 30. Phân quyền

## Chủ hệ thống

Toàn quyền

## Quản lý

- Quản lý phòng
- Hợp đồng
- Thu chi
- Báo cáo

## Thu ngân

- Thu tiền
- In phiếu

## Kế toán

- Thu chi
- Báo cáo
- Lãi lỗ

## Kỹ thuật

- Bảo trì
- Thiết bị

---

# 31. Nhật ký hệ thống

Lưu

- Đăng nhập
- Thêm
- Sửa
- Xóa
- Thu tiền
- Đồng bộ

---

# 32. Backup

Backup

- Isar
- Neon

Restore

Một chạm.

---

# 33. API

Authentication

POST

/login

/logout

/refresh-token

Master Data

/rooms

/contracts

/customers

/assets

/services

Transactions

/payments

/invoices

/expenses

/maintenance

/meters

Reports

/report/revenue

/report/expense

/report/profit

/report/cashflow

/report/occupancy

/report/depreciation

/report/debt

/report/dashboard

Sync

/upload

/download

/conflict

/version

---

# 34. Thiết kế Database Isar

Master

- User
- Role
- Hostel
- Building
- Floor
- Room
- Customer
- Contract
- Asset
- Service
- UtilityRate

Transaction

- RentalInvoice
- Payment
- Expense
- Income
- ElectricReading
- WaterReading
- Maintenance
- Depreciation
- Debt
- Notification

System

- SyncQueue
- SyncLog
- AuditLog
- Setting

---

# 35. Dashboard

Biểu đồ

- Doanh thu tháng
- Chi phí tháng
- Lợi nhuận
- Công nợ
- Tỷ lệ lấp đầy
- Thu tiền theo ngày
- Điện nước tiêu thụ

---

# 36. Quy mô

200 phòng

≈

20.000 hóa đơn

50.000 giao dịch

100.000 chỉ số điện nước

Hoạt động mượt với Isar.

---

# 37. Định hướng mở rộng

- Quản lý nhiều cơ sở
- Nhiều chủ nhà
- Quản lý từ xa
- Website quản trị
- Ứng dụng Android
- iOS
- Windows
- macOS
- Linux
- Web
- Thông báo Push Notification
- Thanh toán QR Code
- Ký hợp đồng điện tử
- AI dự báo tỷ lệ lấp đầy và doanh thu
- Đồng bộ nhiều thiết bị theo thời gian thực
