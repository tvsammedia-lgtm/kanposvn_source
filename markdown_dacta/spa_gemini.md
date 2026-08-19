# PHÂN TÍCH NGHIỆP VỤ PHẦN MỀM QUẢN LÝ SPA - CHĂM SÓC SẮC ĐẸP - DƯỠNG SINH
## Phiên bản 1.0

---

# 1. MỤC TIÊU

Xây dựng phần mềm quản lý Spa chạy bằng Flutter + Isar (Offline First), có thể đồng bộ lên PostgreSQL/Neon Cloud.

Đối tượng:

- Spa chăm sóc da
- Spa trị liệu
- Spa dưỡng sinh
- Massage cổ vai gáy
- Gội đầu dưỡng sinh
- Nail
- Phun xăm
- Thẩm mỹ viện quy mô nhỏ và vừa

---

# 2. PHÂN HỆ CHÍNH

```
Dashboard

Khách hàng

Lịch hẹn

Giường trị liệu

Kỹ thuật viên

Dịch vụ

Combo

Sản phẩm

Kho

Bán hàng

Điều trị

Doanh thu

Chi phí

Kế toán

Báo cáo
```

---

# 3. QUẢN LÝ KHÁCH HÀNG

Thông tin

- Mã khách
- Họ tên
- Giới tính
- Ngày sinh
- SĐT
- Zalo
- Facebook
- Email
- Địa chỉ
- Người giới thiệu
- Nhóm khách hàng
- Ghi chú

---

## Hồ sơ sức khỏe

- Huyết áp
- Dị ứng mỹ phẩm
- Dị ứng thuốc
- Mang thai
- Da dầu
- Da khô
- Da nhạy cảm
- Mụn
- Nám
- Tàn nhang
- Thâm
- Sẹo
- Mức độ lão hóa

---

## Lịch sử

- Đã dùng dịch vụ nào
- Bao nhiêu lần
- Hình ảnh trước sau
- Liệu trình
- Sản phẩm đã mua
- Công nợ
- Điểm tích lũy

---

# 4. QUẢN LÝ LỊCH HẸN

Có Calendar

Theo:

- ngày
- tuần
- tháng

Thông tin

- Khách hàng
- Dịch vụ
- Kỹ thuật viên
- Giường
- Thời gian bắt đầu
- Thời gian kết thúc

Trạng thái

- Đã đặt
- Đang phục vụ
- Hoàn thành
- Hủy

---

# 5. QUẢN LÝ GIƯỜNG

Mỗi giường gồm

```
Mã giường

Tên giường

Phòng

Loại giường

Trạng thái
```

Trạng thái

- Trống
- Đang sử dụng
- Chờ vệ sinh
- Bảo trì

---

Ví dụ

```
Giường 01

Phòng VIP

Đang sử dụng

Khách:

Nguyễn Thị Hoa

Bắt đầu:

09:00

Kết thúc:

10:30
```

---

# 6. QUẢN LÝ PHÒNG

Ví dụ

```
Phòng Facial

4 giường

Phòng Body

6 giường

Phòng VIP

2 giường

Phòng Gội

5 ghế
```

---

# 7. QUẢN LÝ KỸ THUẬT VIÊN

Thông tin

- Mã NV
- Họ tên
- SĐT
- Chuyên môn
- Ngày vào làm

Theo dõi

- Số ca
- Doanh thu
- Hoa hồng
- Tiền tip

---

# 8. DANH MỤC DỊCH VỤ

Ví dụ

## Chăm sóc da

- Facial cơ bản
- Facial chuyên sâu
- Peel
- Detox

---

## Dưỡng sinh

- Gội đầu dưỡng sinh
- Massage cổ vai gáy
- Massage body
- Massage đá nóng
- Massage chân

---

## Điều trị

- Trị mụn
- Trị nám
- Trị thâm
- Trẻ hóa

---

## Nail

- Sơn gel
- Đắp bột
- Vẽ nail

---

## Phun xăm

- Mày
- Môi
- Mí

---

Mỗi dịch vụ gồm

```
Tên

Thời gian

Giá

Giường sử dụng

Kỹ thuật viên

Sản phẩm tiêu hao
```

---

# 9. COMBO

Ví dụ

```
Combo 10 buổi

Massage body

Tặng

2 buổi

```

Theo dõi

- Đã dùng
- Còn lại
- Hết hạn

---

# 10. QUY TRÌNH TRỊ LIỆU (SOP)

Mỗi dịch vụ có quy trình riêng.

Ví dụ: **Gội đầu dưỡng sinh**

|Bước|Nội dung|
|-------|------------|
|1|Đón khách|
|2|Kiểm tra tình trạng tóc và da đầu|
|3|Gội sạch|
|4|Massage đầu|
|5|Massage cổ vai gáy|
|6|Ấn huyệt|
|7|Ủ dưỡng chất|
|8|Xả tóc|
|9|Sấy|
|10|Tư vấn|

---

Ví dụ: **Facial**

```
Rửa mặt

↓

Tẩy trang

↓

Xông hơi

↓

Hút mụn

↓

Điện di

↓

Đắp mask

↓

Massage

↓

Serum

↓

Kem chống nắng
```

---

# 11. SẢN PHẨM HỖ TRỢ

Ví dụ

```
Tinh dầu

Serum

Kem

Mask

Thảo dược

Muối ngâm

Dầu massage

Khăn

Găng tay

Khẩu trang
```

---

Mỗi sản phẩm

- Mã
- Barcode
- Giá nhập
- Giá bán
- Tồn kho
- Đơn vị
- Nhà cung cấp

---

## Định mức tiêu hao

Ví dụ

Massage body

```
10ml dầu

1 khăn

1 ga giường
```

Facial

```
5ml serum

1 mask

2 bông tẩy trang
```

Khi hoàn thành dịch vụ

↓

Kho tự động xuất.

---

# 12. KHO

Nhập

Xuất

Kiểm kê

Điều chỉnh

Hạn sử dụng

Lô hàng

---

# 13. BÁN SẢN PHẨM

Khách có thể mua

- Mỹ phẩm
- Serum
- Kem
- Tinh dầu
- Thảo dược

POS bán hàng

Có Barcode.

---

# 14. THANH TOÁN

Nhiều hình thức

- Tiền mặt
- QR
- Chuyển khoản
- Ví điện tử
- Thẻ

Có thể thanh toán nhiều phương thức trong cùng hóa đơn.

---

# 15. BẢNG GIÁ DỊCH VỤ

|Mã|Dịch vụ|Thời gian|Đơn giá|
|------|--------------------|---------|------------:|
|DV001|Gội đầu dưỡng sinh|60 phút|150.000|
|DV002|Massage cổ vai gáy|60 phút|250.000|
|DV003|Massage body|90 phút|450.000|
|DV004|Facial cơ bản|60 phút|300.000|
|DV005|Facial chuyên sâu|90 phút|600.000|
|DV006|Điều trị mụn|90 phút|700.000|
|DV007|Điều trị nám|120 phút|1.200.000|
|DV008|Triệt lông|Theo vùng|500.000|
|DV009|Sơn gel|60 phút|180.000|
|DV010|Phun mày|180 phút|2.500.000|

---

# 16. DOANH THU

Theo

- Ngày
- Tuần
- Tháng
- Năm

Theo

- Dịch vụ
- Kỹ thuật viên
- Giường
- Chi nhánh
- Khách hàng

Ví dụ

```
Doanh thu hôm nay

32.500.000

65 hóa đơn
```

---

# 17. CHI PHÍ

## Chi phí cố định

- Thuê mặt bằng
- Điện
- Nước
- Internet
- Marketing
- Lương
- BHXH

---

## Chi phí biến đổi

- Mỹ phẩm
- Thảo dược
- Khăn
- Ga
- Dầu massage
- Hoa hồng
- Tip
- Vật tư tiêu hao

---

# 18. BẢNG THU CHI

|Ngày|Nội dung|Thu|Chi|
|------|----------------|---------:|---------:|
|01/01|Doanh thu Spa|25.000.000|0|
|01/01|Thuê mặt bằng|0|5.000.000|
|01/01|Nhập mỹ phẩm|0|8.500.000|
|01/01|Tiền điện|0|850.000|

---

# 19. LỢI NHUẬN

```
Doanh thu dịch vụ

+

Doanh thu bán mỹ phẩm

=

Tổng doanh thu

-

Giá vốn

-

Lương

-

Hoa hồng

-

Chi phí vận hành

=

Lợi nhuận
```

---

# 20. BẢNG LÃI LỖ (P&L)

|Khoản mục|Giá trị|
|----------------------|-------------:|
|Doanh thu dịch vụ|520.000.000|
|Doanh thu bán sản phẩm|80.000.000|
|**Tổng doanh thu**|600.000.000|
|Giá vốn sản phẩm|120.000.000|
|Chi phí vật tư tiêu hao|35.000.000|
|Lương nhân viên|140.000.000|
|Hoa hồng kỹ thuật viên|45.000.000|
|Marketing|20.000.000|
|Điện nước|12.000.000|
|Thuê mặt bằng|40.000.000|
|Khấu hao thiết bị|8.000.000|
|Chi phí khác|10.000.000|
|**Tổng chi phí**|430.000.000|
|**Lợi nhuận trước thuế**|170.000.000|

---

# 21. BẢNG CÂN ĐỐI THU CHI

## Tài sản

- Tiền mặt
- Tiền gửi ngân hàng
- Công nợ phải thu
- Hàng tồn kho
- Thiết bị Spa
- Máy móc
- Nội thất

---

## Nợ phải trả

- Công nợ nhà cung cấp
- Vay ngân hàng
- Thuế
- Lương chưa trả

---

## Vốn chủ sở hữu

- Vốn góp
- Lợi nhuận giữ lại
- Lợi nhuận năm nay

---

# 22. DASHBOARD

Hiển thị thời gian thực

- Số khách đang phục vụ
- Giường đang sử dụng
- Giường còn trống
- Doanh thu hôm nay
- Doanh thu tháng
- Khách mới
- Khách quay lại
- Dịch vụ bán chạy
- Kỹ thuật viên doanh thu cao nhất
- Tồn kho sắp hết
- Sản phẩm sắp hết hạn
- Công nợ khách hàng
- Công nợ nhà cung cấp
- Lợi nhuận theo ngày/tháng/năm

---

# 23. CÔNG NGHỆ ĐỀ XUẤT

## Frontend

- Flutter 3.x
- Material 3
- Riverpod
- GoRouter

## Database Offline

- Isar Database

## Đồng bộ Online

- API REST hoặc GraphQL
- PostgreSQL (Neon)

## Báo cáo

- PDF
- Excel
- In hóa đơn nhiệt 58mm / 80mm
- QR Code thanh toán
- Barcode sản phẩm

## Đồng bộ đa thiết bị

- Máy tính
- Android
- iPhone
- Máy POS Android
- Windows
- macOS
- Linux

---

# 24. MỞ RỘNG TƯƠNG LAI

- Thẻ thành viên (Membership)
- Điểm thưởng & tích lũy
- Voucher, Gift Card
- Đặt lịch online
- Nhắc lịch qua SMS/Zalo/Email
- AI gợi ý liệu trình theo tình trạng da
- AI tư vấn sản phẩm
- Camera nhận diện khách hàng
- Chữ ký điện tử trên phiếu điều trị
- Đồng bộ hóa đơn điện tử
- Tích hợp máy POS, máy in, máy quét mã vạch
- Quản lý đa chi nhánh và hợp nhất báo cáo tài chính