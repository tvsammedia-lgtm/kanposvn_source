# ĐẶC TẢ ỨNG DỤNG QUẢN LÝ KHÁCH SẠN - NHÀ NGHỈ
## Hotel Management System
### Công nghệ đề xuất
- Flutter 3.x
- Isar Database (Offline)
- Riverpod
- Sync Online: Neon PostgreSQL
- Windows / Android / Linux

---

# I. TỔNG QUAN

Ứng dụng quản lý khách sạn, nhà nghỉ, motel, homestay theo:

- Thuê theo giờ
- Thuê theo ngày
- Thuê qua đêm
- Thuê dài hạn
- Dịch vụ đi kèm
- Quản lý doanh thu
- Chi phí
- Công nợ
- Báo cáo tài chính
- Bảng cân đối kế toán
- Lãi lỗ

Có thể sử dụng cho:

- Nhà nghỉ
- Motel
- Khách sạn 1-5 sao
- Homestay
- Resort nhỏ

---

# II. DANH MỤC PHÒNG

Thông tin phòng

- Mã phòng
- Tên phòng
- Loại phòng
- Tầng
- Diện tích
- Giá giờ
- Giá ngày
- Giá qua đêm
- Giá cuối tuần
- Giá lễ
- Phụ thu thêm người
- Trạng thái

Trạng thái

- Trống
- Có khách
- Đang dọn
- Đặt trước
- Bảo trì
- Khóa phòng

---

# III. LOẠI PHÒNG

Ví dụ

Standard

Superior

Deluxe

VIP

Family

Suite

Dorm

---

# IV. SƠ ĐỒ PHÒNG

Hiển thị dạng Grid

□101
□102
■103 Có khách
□104 Dọn phòng
□105 Đặt trước
□106 Bảo trì

Màu sắc

Xanh = Trống

Đỏ = Có khách

Vàng = Đặt trước

Cam = Dọn

Xám = Bảo trì

---

# V. ĐẶT PHÒNG

Thông tin

Mã đặt phòng

Khách hàng

Ngày đến

Ngày đi

Số người

Tiền cọc

Ghi chú

Nguồn đặt

Booking

Agoda

Traveloka

Walk-in

Điện thoại

Facebook

Zalo

---

# VI. CHECK IN

Thông tin khách

Họ tên

CCCD/Hộ chiếu

Ngày sinh

Quốc tịch

Địa chỉ

SĐT

Biển số xe

Ảnh CCCD

Ảnh khách

Quét QR CCCD

---

# VII. CHECK OUT

Tự động tính

Tiền phòng

Dịch vụ

Giảm giá

VAT

Tiền cọc

Khách phải trả

In hóa đơn

Xuất PDF

Gửi Email

---

# VIII. THUÊ THEO GIỜ

Ví dụ

Giá giờ đầu

120.000

Giờ tiếp theo

70.000

Quá 15 phút

Làm tròn 30 phút

Quá 6 giờ

Chuyển sang giá ngày

---

# IX. THUÊ QUA ĐÊM

Ví dụ

22h00 -> 12h00 hôm sau

Giá

350.000

Quá giờ

Tính thêm

---

# X. THUÊ THEO NGÀY

Ngày đầu

600.000

Ngày tiếp

550.000

Check-out muộn

Tính thêm giờ

---

# XI. DỊCH VỤ

Ăn uống

Cafe

Nước ngọt

Bia

Snack

Mì

Cơm

Đồ dùng

Bàn chải

Khăn

Dầu gội

Bao cao su

Khác

Giặt ủi

Giặt

Sấy

Ủi

Giặt nhanh

Dịch vụ khác

Thuê xe

Massage

Đưa đón

Đặt vé

---

# XII. MINI BAR

Theo từng phòng

Nước

Bia

Snack

Khăn

Khăn giấy

Mỗi lần Check-out

Tự động kiểm kê

---

# XIII. QUẢN LÝ KHO

Nhập

Xuất

Kiểm kê

Tồn kho

Cảnh báo hết hàng

Lô hàng

Hạn sử dụng

Nhà cung cấp

---

# XIV. KHÁCH HÀNG

Thông tin

Mã KH

Tên

SĐT

Email

CCCD

Địa chỉ

Ngày sinh

Điểm tích lũy

Hạng thành viên

VIP

Lịch sử lưu trú

Công nợ

---

# XV. NHÀ CUNG CẤP

Thông tin

Mã NCC

Tên

Địa chỉ

Điện thoại

Email

Người liên hệ

Công nợ

Lịch sử nhập hàng

---

# XVI. NHÂN VIÊN

Lễ tân

Thu ngân

Buồng phòng

Bảo vệ

Quản lý

Kế toán

Phân quyền

Admin

Manager

Reception

Cashier

Housekeeping

Viewer

---

# XVII. THU CHI

## Thu

Tiền phòng

Dịch vụ

Giặt ủi

Mini Bar

Bán hàng

Khác

---

## Chi

Điện

Nước

Internet

Lương

Thuê nhà

Khấu hao

Vệ sinh

Giặt

Marketing

Thuế

Khác

---

# XVIII. CÔNG NỢ KHÁCH HÀNG

Theo dõi

Đã trả

Chưa trả

Trả nhiều lần

Đặt cọc

Hoàn cọc

Nhắc nợ

Lịch sử thanh toán

---

# XIX. CÔNG NỢ NHÀ CUNG CẤP

Theo dõi

Hóa đơn

Đã thanh toán

Chưa thanh toán

Ngày đến hạn

Phiếu chi

---

# XX. DOANH THU

Theo

Ngày

Tuần

Tháng

Quý

Năm

Theo

Phòng

Loại phòng

Nhân viên

Dịch vụ

Khách hàng

Nguồn đặt

---

# XXI. BÁO CÁO CHI PHÍ

Điện

Nước

Internet

Lương

Khấu hao

Marketing

Mua hàng

Thuế

Khác

---

# XXII. LỢI NHUẬN

Lợi nhuận gộp

Doanh thu
-
Giá vốn

Lợi nhuận thuần

Doanh thu
-
Chi phí

---

# XXIII. BÁO CÁO LÃI LỖ

Doanh thu

-

Giá vốn

=

Lợi nhuận gộp

-

Chi phí hoạt động

-

Khấu hao

-

Thuế

=

Lợi nhuận sau thuế

---

# XXIV. BẢNG CÂN ĐỐI KẾ TOÁN

## TÀI SẢN

### Tài sản ngắn hạn

Tiền mặt

Tiền gửi

Công nợ phải thu

Hàng tồn kho

Chi phí trả trước

### Tài sản dài hạn

Nhà cửa

Thiết bị

Máy lạnh

Nội thất

Khấu hao

---

## NGUỒN VỐN

### Nợ phải trả

Công nợ NCC

Vay ngân hàng

Thuế

Lương

### Vốn chủ sở hữu

Vốn góp

Lợi nhuận giữ lại

---

# XXV. DASHBOARD

Hiển thị

Số phòng

Phòng trống

Phòng có khách

Tỷ lệ lấp đầy

Doanh thu hôm nay

Doanh thu tháng

Chi phí tháng

Lợi nhuận

Khách đang ở

Khách sắp Check-out

Đặt phòng hôm nay

Biểu đồ doanh thu

Biểu đồ công suất phòng

Biểu đồ lợi nhuận

---

# XXVI. IN HÓA ĐƠN

Máy in nhiệt

58mm

80mm

A4

Logo

QR Code

VAT

---

# XXVII. SAO LƯU

Backup

Restore

Google Drive

OneDrive

NAS

---

# XXVIII. ĐỒNG BỘ CLOUD

Offline

↓

Isar

↓

Sync Engine

↓

REST API

↓

Neon PostgreSQL

↓

Web Dashboard

↓

Mobile

---

# XXIX. MÔ HÌNH DATABASE

Master

- Rooms
- RoomTypes
- Customers
- Suppliers
- Employees
- Products
- Services

Transaction

- Reservations
- CheckIn
- CheckOut
- RoomCharges
- ServiceOrders
- LaundryOrders
- Payments
- Receipts
- Expenses
- Purchases
- StockIn
- StockOut

Accounting

- Accounts
- JournalEntries
- Ledger
- Receivables
- Payables
- BalanceSheet
- IncomeStatement
- CashFlow

---

# XXX. BÁO CÁO

✓ Công suất phòng

✓ Doanh thu

✓ Doanh thu theo phòng

✓ Doanh thu theo nhân viên

✓ Doanh thu theo dịch vụ

✓ Công nợ khách hàng

✓ Công nợ nhà cung cấp

✓ Thu chi

✓ Dòng tiền

✓ Kho

✓ Nhập xuất tồn

✓ Lãi lỗ

✓ Bảng cân đối kế toán

✓ Sổ quỹ

✓ Nhật ký thu chi

✓ Báo cáo thuế

✓ Xuất Excel

✓ Xuất PDF

✓ Xuất JSON/API

---

# XXXI. CÔNG NGHỆ ĐỀ XUẤT

Frontend
- Flutter

State Management
- Riverpod

Database Offline
- Isar

Sync
- Background Sync

Backend
- ASP.NET Core API / Go / Node.js

Cloud Database
- Neon PostgreSQL

Authentication
- JWT

Storage
- Cloudflare R2

Notification
- Firebase Cloud Messaging

Report
- PDF / Excel

Platform
- Windows
- Android
- Linux
- Web Dashboard