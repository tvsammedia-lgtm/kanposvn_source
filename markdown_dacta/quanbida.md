# 🎱 PHẦN MỀM QUẢN LÝ QUÁN BIDA
## (Flutter + Isar Offline First + Đồng bộ Neon PostgreSQL)

---

# I. GIỚI THIỆU

Phần mềm quản lý quán bida hỗ trợ:

- Quản lý bàn bida
- Tính tiền theo giờ chơi
- Tính tiền theo block giờ
- Bán đồ ăn thức uống
- Quản lý kho
- Quản lý khách hàng
- Quản lý hội viên
- Quản lý công nợ
- Quản lý thu chi
- Báo cáo doanh thu
- Báo cáo lợi nhuận
- Bảng cân đối kế toán
- Hoạt động hoàn toàn Offline bằng Isar
- Đồng bộ Cloud khi có Internet

---

# II. PHÂN QUYỀN

## Chủ quán

- Toàn quyền

## Quản lý

- Quản lý bàn
- Quản lý nhân viên
- Quản lý doanh thu
- Quản lý kho

## Thu ngân

- Mở bàn
- Đóng bàn
- Thanh toán
- Bán hàng

## Phục vụ

- Gọi món
- Chuyển món
- Theo dõi bàn

---

# III. QUẢN LÝ BÀN

Thông tin:

- Mã bàn
- Tên bàn
- Loại bàn

Ví dụ

- Bida Lỗ
- Bida Libre
- Bida 3 băng

Trạng thái

- Trống
- Đang chơi
- Đã đặt trước
- Đang vệ sinh
- Bảo trì

---

# IV. THIẾT LẬP GIÁ

Ví dụ

Ngày thường

08:00 - 17:00

70.000đ/giờ

17:00 - 23:00

90.000đ/giờ

Cuối tuần

100.000đ/giờ

Có thể khai báo:

- Theo khung giờ
- Theo ngày lễ
- Theo loại bàn

---

# V. MỞ BÀN

Thông tin

- Mã hóa đơn
- Bàn
- Giờ bắt đầu
- Khách hàng
- Nhân viên

Khi mở bàn

Trạng thái chuyển sang:

ĐANG CHƠI

---

# VI. TÍNH TIỀN THEO GIỜ

Ví dụ

Giờ vào

18:15

Giờ ra

20:45

Thời gian

2 giờ 30 phút

Đơn giá

90.000đ

Tiền giờ

225.000đ

Có thể chọn:

- Làm tròn 15 phút
- Làm tròn 30 phút
- Làm tròn 60 phút

---

# VII. TÍNH TIỀN BLOCK

Ví dụ

3 giờ đầu

250.000

Sau đó

80.000đ/giờ

Hoặc

Combo 4 giờ

300.000đ

---

# VIII. ĐẶT CỌC

Có thể:

- Đặt cọc
- Thanh toán trước

---

# IX. CHUYỂN BÀN

Ví dụ

Bàn 01

↓

Bàn 05

Toàn bộ thời gian chơi vẫn được giữ.

---

# X. GHÉP BÀN

Ví dụ

2 bàn

↓

1 hóa đơn

---

# XI. TÁCH HÓA ĐƠN

Ví dụ

Một nhóm khách

↓

Chia thành nhiều hóa đơn

---

# XII. DANH MỤC HÀNG HÓA

Ví dụ

## Nước

- Coca
- Pepsi
- Sting
- Redbull

## Bia

- Tiger
- Heineken
- Saigon

## Đồ ăn

- Mì
- Khô bò
- Cá viên
- Xúc xích

## Thuốc lá

## Khăn lạnh

## Đá

---

# XIII. BÁN HÀNG

Trong lúc chơi

Có thể bán

- Nước
- Đồ ăn
- Thuốc lá

Tự cộng vào hóa đơn.

---

# XIV. KHO

Theo dõi

- Nhập
- Xuất
- Tồn

Ví dụ

Coca

Nhập

500 lon

Bán

320 lon

Tồn

180 lon

---

# XV. NHẬP HÀNG

Thông tin

- Nhà cung cấp
- Phiếu nhập
- Ngày nhập
- Giá nhập
- VAT
- Chiết khấu

---

# XVI. NHÀ CUNG CẤP

Thông tin

- Mã
- Tên
- Địa chỉ
- Điện thoại
- Email
- Công nợ

---

# XVII. KHÁCH HÀNG

Thông tin

- Mã khách
- Tên
- Điện thoại
- Điểm tích lũy
- Hội viên
- Công nợ

---

# XVIII. CÔNG NỢ KHÁCH HÀNG

Ví dụ

Khách

Nguyễn Văn A

Nợ

850.000

Đã trả

300.000

Còn

550.000

---

# XIX. CÔNG NỢ NHÀ CUNG CẤP

Ví dụ

Công ty Coca Cola

Đã nhập

25.000.000

Đã thanh toán

20.000.000

Còn nợ

5.000.000

---

# XX. PHIẾU THU

Nguồn thu

- Bán bida
- Bán nước
- Thu công nợ
- Thu khác

---

# XXI. PHIẾU CHI

Chi

- Thuê mặt bằng
- Điện
- Nước
- Internet
- Lương
- Mua hàng
- Khấu hao
- Chi khác

---

# XXII. QUẢN LÝ NHÂN VIÊN

Thông tin

- Hồ sơ
- Lương
- Ca làm

---

# XXIII. CHẤM CÔNG

Ca

- Sáng
- Chiều
- Tối

---

# XXIV. LƯƠNG

Có thể tính

- Theo tháng
- Theo ca
- Theo giờ

---

# XXV. BÁO CÁO DOANH THU

Theo

- Ngày
- Tuần
- Tháng
- Năm

Chi tiết

Doanh thu bàn

Doanh thu nước

Doanh thu đồ ăn

Doanh thu khác

Tổng doanh thu

---

# XXVI. BÁO CÁO CHI PHÍ

Chi phí

- Điện
- Nước
- Thuê
- Lương
- Hàng hóa
- Marketing
- Khấu hao

---

# XXVII. BÁO CÁO LÃI LỖ

Doanh thu

-

Giá vốn

-

Chi phí

=

Lợi nhuận

Hiển thị:

- Theo ngày
- Theo tháng
- Theo năm

---

# XXVIII. BẢNG CÂN ĐỐI KẾ TOÁN

## TÀI SẢN

- Tiền mặt
- Tiền ngân hàng
- Hàng tồn kho
- Công nợ phải thu
- TSCĐ

## NGUỒN VỐN

- Vốn chủ sở hữu
- Công nợ phải trả
- Lợi nhuận giữ lại

---

# XXIX. DASHBOARD

Hiển thị

## Hôm nay

- Số bàn đang chơi
- Bàn trống
- Doanh thu
- Chi phí
- Lợi nhuận

## Tháng

- Tổng doanh thu
- Tổng chi
- Lợi nhuận

## Biểu đồ

- Doanh thu theo ngày
- Doanh thu theo giờ
- Top nước bán chạy
- Top khách hàng
- Top bàn hoạt động nhiều

---

# XXX. IN HÓA ĐƠN

Khổ

- 58mm
- 80mm

Có QR Code

Logo quán

Tên quán

Địa chỉ

SĐT

Chi tiết

- Tiền giờ
- Tiền nước
- Tiền đồ ăn
- Giảm giá
- VAT
- Tổng thanh toán

---

# XXXI. SAO LƯU

Backup

- Isar
- JSON
- Excel

Restore

- JSON
- Isar

---

# XXXII. ĐỒNG BỘ CLOUD

Offline First

Isar

↓

Queue

↓

API

↓

Neon PostgreSQL

↓

Dashboard Web

---

# XXXIII. CÔNG NGHỆ

Frontend

- Flutter

Database Offline

- Isar

State Management

- Riverpod

Backend

- ASP.NET Core Web API

Cloud Database

- Neon PostgreSQL

Authentication

- JWT

Realtime

- WebSocket

Xuất báo cáo

- Excel
- PDF

In hóa đơn

- ESC/POS Printer

---

# XXXIV. CẤU TRÚC MODULE

1. Dashboard
2. Quản lý bàn
3. Mở bàn
4. Tính tiền giờ chơi
5. Đặt trước
6. Chuyển bàn
7. Ghép bàn
8. Bán đồ ăn
9. Kho
10. Nhà cung cấp
11. Khách hàng
12. Công nợ khách hàng
13. Công nợ nhà cung cấp
14. Thu chi
15. Nhân viên
16. Chấm công
17. Tiền lương
18. Báo cáo doanh thu
19. Báo cáo chi phí
20. Báo cáo lợi nhuận
21. Bảng cân đối kế toán
22. In hóa đơn
23. Đồng bộ Cloud
24. Sao lưu dữ liệu
25. Thiết lập hệ thống