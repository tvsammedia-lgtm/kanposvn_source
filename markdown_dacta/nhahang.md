# PRD - Ứng dụng Quản lý Nhà hàng / Quán ăn (Restaurant ERP & POS)

> Phiên bản: 1.0
> Nền tảng: Flutter + Isar Database (Offline First) + Neon PostgreSQL (Cloud Sync)
> Đối tượng:
>
> - Nhà hàng hải sản
> - Quán nhậu
> - Nhà hàng đồ rừng
> - Nhà hàng sân vườn
> - Nhà hàng tiệc cưới nhỏ
> - Beer Club
> - Quán bia
> - Nhà hàng gia đình

---

# I. Mục tiêu

Xây dựng hệ thống quản lý toàn diện gồm:

- POS bán hàng
- Quản lý bàn
- Quản lý thực đơn
- Kho nguyên liệu
- Chế biến bếp
- Thu ngân
- Quản lý nhân viên
- Khách hàng
- Công nợ
- Doanh thu
- Chi phí
- Lợi nhuận
- Báo cáo tài chính
- Bảng cân đối kế toán

Hoạt động Offline 100%.

Có thể đồng bộ Cloud.

---

# II. Kiến trúc

Frontend

- Flutter

Database Offline

- Isar

Cloud

- Neon PostgreSQL

API

- REST API

Authentication

- JWT

Sync

- Background Sync

---

# III. Dashboard

Hiển thị:

Hôm nay

- Doanh thu
- Số hóa đơn
- Khách đang ăn
- Khách đã thanh toán
- Tiền mặt
- Chuyển khoản
- Công nợ

Tháng

- Doanh thu
- Giá vốn
- Chi phí
- Lợi nhuận

Năm

- Tổng doanh thu
- Tổng lợi nhuận

Biểu đồ

- Doanh thu ngày
- Doanh thu tháng
- Top món bán
- Top nhân viên
- Top khách hàng

---

# IV. Quản lý khu vực

Ví dụ

Tầng 1

- Bàn 01
- Bàn 02
- Bàn 03

Tầng 2

Sân vườn

VIP

Phòng lạnh

Ngoài trời

---

# V. Quản lý bàn

Thông tin

- Mã bàn
- Tên bàn
- Khu vực
- Sức chứa
- Trạng thái

Trạng thái

- Trống
- Đặt trước
- Đang phục vụ
- Chờ thanh toán
- Đã thanh toán
- Dọn bàn

Màu sắc

Xanh

- Trống

Đỏ

- Đang phục vụ

Vàng

- Chờ thanh toán

---

# VI. Đặt bàn

Thông tin

- Tên khách
- Điện thoại
- Thời gian
- Số người
- Ghi chú

Đặt cọc

---

# VII. Danh mục thực đơn

## Hải sản

- Tôm hùm
- Cua Cà Mau
- Ghẹ
- Mực
- Bạch tuộc
- Hàu
- Sò huyết
- Cá mú
- Cá chình
- Cá bóp

## Đồ rừng

- Heo rừng
- Nai
- Gà rừng
- Dúi
- Chồn
- Chim
- Thỏ

## Bò

- Bò Mỹ
- Bò Úc
- Bò Wagyu

## Gà

## Heo

## Cá

## Lẩu

## Nướng

## Chiên

## Xào

## Cơm

## Mì

## Cháo

## Rau

## Tráng miệng

---

# VIII. Đồ uống

## Bia

- Tiger
- Heineken
- Larue
- Sài Gòn
- Budweiser

## Rượu

- Chivas
- Ballantines
- Hennessy
- Johnnie Walker

## Vang

- Chile
- Pháp
- Ý

## Nước ngọt

## Nước suối

## Nước ép

## Sinh tố

## Cafe

---

# IX. Quản lý món ăn

Thông tin

- Mã món
- Barcode
- Tên
- Nhóm
- Đơn vị
- Giá bán
- Giá vốn
- VAT

Có nhiều hình ảnh

Mô tả

---

# X. Combo

Ví dụ

Combo Hải sản

- 1 Cua
- 1 Tôm
- 2 Bia

Combo Gia đình

Combo Sinh nhật

---

# XI. Công thức chế biến

Ví dụ

Lẩu Hải sản

Nguyên liệu

- Tôm
- Mực
- Cá
- Rau
- Gia vị

Định lượng

Tự động trừ kho khi bán.

---

# XII. Kho nguyên liệu

Danh mục

Thịt

Cá

Hải sản

Rau

Gia vị

Nước uống

Rượu

Bia

Đá

Gas

Than

---

# XIII. Xuất nhập kho

Phiếu nhập

Phiếu xuất

Kiểm kê

Điều chỉnh

Hủy

Hết hạn

---

# XIV. Nhà cung cấp

Thông tin

- Mã NCC
- Tên
- Điện thoại
- Địa chỉ
- MST

Theo dõi

- Công nợ
- Lịch sử nhập

---

# XV. Khách hàng

Thông tin

- Mã khách
- Họ tên
- Sinh nhật
- Điện thoại
- Email

Quản lý

- Điểm thưởng
- Công nợ
- Voucher

---

# XVI. POS bán hàng

Các chức năng

Chọn bàn

Chọn món

Tìm món

Quét Barcode

Ghi chú

Ví dụ

Ít cay

Không hành

Thêm đá

---

# XVII. Bếp (Kitchen Display)

Màn hình riêng

Hiển thị

Đơn mới

Đang nấu

Hoàn thành

Đã giao

In phiếu bếp

---

# XVIII. Thu ngân

Thanh toán

Tiền mặt

QR

Chuyển khoản

Thẻ

Ví điện tử

Kết hợp nhiều phương thức

---

# XIX. Tách bàn

Gộp bàn

Chuyển bàn

Tách hóa đơn

---

# XX. Khuyến mãi

Happy Hour

Giảm %

Giảm tiền

Voucher

Mua 2 tặng 1

Combo

---

# XXI. Nhân viên

Quản lý

Phục vụ

Thu ngân

Bếp

Bar

Quản lý

Kế toán

---

# XXII. Chấm công

Theo ca

Theo giờ

Theo ngày

Theo tháng

---

# XXIII. Tiền lương

Lương cơ bản

Phụ cấp

Thưởng

Hoa hồng

Tăng ca

Khấu trừ

---

# XXIV. Doanh thu

Theo

Giờ

Ngày

Tuần

Tháng

Quý

Năm

Theo

Món

Nhóm

Nhân viên

Bàn

Khu vực

---

# XXV. Chi phí

Chi phí

Nguyên liệu

Lương

Điện

Nước

Gas

Thuê mặt bằng

Marketing

Khấu hao

Internet

Thuế

Chi phí khác

---

# XXVI. Giá vốn (COGS)

Tự động tính

Theo công thức món ăn.

---

# XXVII. Báo cáo Lãi lỗ

Doanh thu

(-) Giá vốn

= Lợi nhuận gộp

(-) Chi phí vận hành

= Lợi nhuận hoạt động

(-) Thuế

= Lợi nhuận sau thuế

---

# XXVIII. Báo cáo tài chính

Doanh thu

Chi phí

Lợi nhuận

Lãi lỗ

Dòng tiền

Công nợ

---

# XXIX. Bảng cân đối kế toán

## Tài sản

### Tài sản ngắn hạn

Tiền mặt

Tiền gửi

Công nợ khách hàng

Hàng tồn kho

### Tài sản dài hạn

Máy POS

Máy lạnh

Tủ đông

Bàn ghế

Xe tải

Thiết bị

---

## Nợ phải trả

Nhà cung cấp

Vay ngân hàng

Lương

Thuế

---

## Vốn chủ sở hữu

Vốn góp

Lợi nhuận giữ lại

Lợi nhuận năm nay

---

# XXX. Công nợ

## Khách hàng

Phải thu

Lịch sử

Thanh toán

## Nhà cung cấp

Phải trả

Đến hạn

Quá hạn

---

# XXXI. Báo cáo thống kê

Top món bán

Top doanh thu

Top lợi nhuận

Top khách VIP

Top nhân viên

Top nhà cung cấp

Món bán chậm

Món lỗ

Món lời cao

---

# XXXII. In ấn

In bếp

In quầy bar

In hóa đơn

In tạm tính

In A4

Xuất

PDF

Excel

CSV

JSON

---

# XXXIII. Phân quyền

Chủ nhà hàng

Quản lý

Thu ngân

Phục vụ

Bếp

Kho

Kế toán

Chỉ xem báo cáo

---

# XXXIV. Đồng bộ dữ liệu

Offline

↓

Isar

↓

Background Sync

↓

REST API

↓

Neon PostgreSQL

↓

Web Dashboard

---

# XXXV. Công nghệ

## Mobile

Flutter

Riverpod

GoRouter

Freezed

Isar

Drift (tùy chọn)

Printing

ESC/POS

PDF

Excel

Charts

## Backend

ASP.NET Core Web API

PostgreSQL (Neon)

Redis (Cache)

JWT

Swagger

Docker

## Cloud

Cloudflare

Vercel

GitHub Actions

---

# XXXVI. Cấu trúc Module

```
Dashboard

POS

Bàn ăn

Đặt bàn

Thực đơn

Combo

Bếp

Bar

Thu ngân

Khách hàng

Nhà cung cấp

Kho

Mua hàng

Kiểm kê

Nhân viên

Tiền lương

Khuyến mãi

Voucher

Công nợ

Thu

Chi

Doanh thu

Chi phí

Lợi nhuận

Lãi lỗ

Bảng cân đối kế toán

Báo cáo

Cài đặt

Đồng bộ
```

---

# XXXVII. Lộ trình phát triển

### Giai đoạn 1
- POS bán hàng
- Quản lý bàn
- Thực đơn
- In hóa đơn
- Quản lý bếp

### Giai đoạn 2
- Kho nguyên liệu
- Công thức chế biến
- Nhà cung cấp
- Công nợ

### Giai đoạn 3
- Kế toán nội bộ
- Báo cáo tài chính
- Bảng cân đối kế toán
- Lãi lỗ

### Giai đoạn 4
- Đồng bộ Cloud
- Quản lý chuỗi nhà hàng
- App quản lý từ xa
- Dashboard Web
- AI dự báo doanh thu và tồn kho