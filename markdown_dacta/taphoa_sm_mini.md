# MiniMart Pro - Tài liệu yêu cầu hệ thống (Flutter + Isar + Neon + Vercel API)

## 1. Giới thiệu

### Tên dự án

**MiniMart Pro**

### Mục tiêu

Xây dựng hệ thống quản lý siêu thị mini và cửa hàng tạp hóa hoạt động Offline-First bằng Flutter kết hợp Isar Database, đồng bộ dữ liệu với Neon PostgreSQL thông qua REST API triển khai trên Vercel.

Hệ thống cho phép:

* Bán hàng nhanh ngay cả khi mất Internet.
* Đồng bộ dữ liệu tự động nhiều thiết bị.
* Quản lý doanh thu từ xa.
* Quản lý kho hàng theo thời gian thực.
* Quản lý công nợ.
* Quản lý khách hàng thân thiết.
* Báo cáo kinh doanh đầy đủ.
* Quản trị nhiều cửa hàng trên một tài khoản.

---

# 2. Kiến trúc hệ thống

```
Android
Windows
Web Admin

        │

     Flutter App

        │

 Isar Database (Offline)

        │
 Đồng bộ nền (Background Sync)

        │

 REST API

     Vercel

        │

 Neon PostgreSQL
```

Kiến trúc:

* Flutter
* Isar Database
* Dio
* Riverpod
* REST API
* JWT Authentication
* Neon PostgreSQL
* Vercel Serverless Functions

---

# 3. Mô hình Offline First

Mọi thao tác:

* Bán hàng
* Nhập hàng
* Xuất kho
* Thu tiền
* Chi tiền

đều ghi xuống Isar trước.

Sau đó:

```
Queue Sync

↓

Vercel API

↓

Neon Database

↓

Các thiết bị khác nhận dữ liệu mới
```

Ưu điểm

* Không phụ thuộc Internet
* Không mất dữ liệu
* Đồng bộ nhiều máy
* Xử lý nhanh

---

# 4. Các nhóm chức năng

## 4.1 Quản lý hệ thống

* Đăng nhập
* JWT
* Refresh Token
* Quản lý người dùng
* Phân quyền
* Quản lý cửa hàng
* Backup
* Restore
* Nhật ký hoạt động

---

## 4.2 Quản lý danh mục

### Hàng hóa

Thông tin

* Mã hàng
* Barcode
* QR Code
* SKU
* Tên
* Nhóm hàng
* Đơn vị
* Giá nhập
* Giá bán
* Giá bán sỉ
* Giá khuyến mãi
* VAT
* Hình ảnh
* Hạn sử dụng
* Nhà sản xuất
* Ghi chú

---

### Nhóm hàng

* Đồ uống
* Bánh kẹo
* Gia vị
* Mỹ phẩm
* Hóa mỹ phẩm
* Rau củ
* Thịt cá
* Đông lạnh
* Khác

---

### Đơn vị tính

* Cái
* Gói
* Thùng
* Lon
* Kg
* Chai
* Lốc

---

### Nhà cung cấp

* Thông tin liên hệ
* Công nợ
* Lịch sử nhập hàng

---

### Khách hàng

* Khách lẻ
* Thành viên
* VIP
* Đại lý

---

# 5. Quản lý bán hàng POS

## Hỗ trợ

* Barcode Scanner
* Camera Scan
* Tìm kiếm nhanh
* Bán bằng cảm ứng

Thanh toán

* Tiền mặt
* QR
* Chuyển khoản
* Ví điện tử
* Công nợ

Hỗ trợ

* Giảm giá
* Voucher
* Combo
* Khuyến mãi
* Đổi trả
* Hoàn tiền
* In hóa đơn

---

# 6. Quản lý nhập hàng

* Phiếu nhập
* Nhập theo hóa đơn
* Nhập tồn đầu kỳ
* Nhập kiểm kê
* Nhập điều chỉnh

Theo dõi

* Giá nhập
* Chiết khấu
* Thuế
* Chi phí vận chuyển

---

# 7. Xuất kho

* Xuất bán
* Xuất hủy
* Xuất điều chuyển
* Xuất dùng nội bộ

---

# 8. Kiểm kê kho

* Kiểm kê nhanh
* Kiểm kê Barcode
* Chênh lệch
* Điều chỉnh kho

---

# 9. Quản lý tồn kho

Theo dõi

* Tồn hiện tại
* Tồn tối thiểu
* Tồn tối đa
* Hàng sắp hết
* Hàng tồn lâu
* Hàng bán chậm

---

# 10. Cảnh báo tồn kho

Hệ thống tự động cảnh báo

* Tồn dưới mức tối thiểu
* Hàng sắp hết
* Hàng bán chậm
* Hàng không phát sinh
* Hàng tồn quá lâu

Thông báo

* Notification
* Dashboard
* Email (tùy chọn)

---

# 11. Quản lý hạn sử dụng

Theo dõi

* Ngày sản xuất
* Hạn dùng
* Số ngày còn lại

Cảnh báo

* Hết hạn
* Còn 30 ngày
* Còn 15 ngày
* Còn 7 ngày
* Còn 3 ngày

Báo cáo

* Danh sách sắp hết hạn
* Hàng hết hạn
* Hàng cần xả kho

---

# 12. Quản lý công nợ

## Khách hàng

* Công nợ đầu kỳ
* Phát sinh
* Thanh toán
* Còn nợ

## Nhà cung cấp

* Nhập chịu
* Thanh toán
* Dư nợ
* Lịch sử giao dịch

---

# 13. Quản lý thu chi

Thu

* Bán hàng
* Thu công nợ
* Thu khác

Chi

* Nhập hàng
* Trả nhà cung cấp
* Tiền điện
* Tiền nước
* Lương
* Thuê mặt bằng
* Marketing
* Chi khác

---

# 14. Quản lý doanh thu

Theo

* Ngày
* Tuần
* Tháng
* Quý
* Năm

So sánh

* Kỳ trước
* Cùng kỳ
* Theo cửa hàng
* Theo nhân viên

---

# 15. Báo cáo tài chính

## Báo cáo doanh thu

* Theo ngày
* Theo tháng
* Theo quý
* Theo năm

---

## Báo cáo chi phí

* Theo nhóm
* Theo thời gian

---

## Báo cáo thu chi

* Tổng hợp
* Chi tiết
* Theo tài khoản
* Theo nhân viên

---

## Báo cáo cân đối doanh thu - chi phí

Tổng hợp

```
Doanh thu

(-)

Chi phí

=

Lợi nhuận
```

Chi tiết theo

* Ngày
* Tháng
* Nhóm chi phí
* Cửa hàng

---

## Báo cáo lãi lỗ (P&L)

Bao gồm

* Doanh thu bán hàng
* Giá vốn hàng bán
* Lợi nhuận gộp
* Chi phí vận hành
* Chi phí khác
* Thu nhập khác
* Lợi nhuận trước thuế
* Lợi nhuận sau thuế (nếu áp dụng)

---

## Báo cáo nhập xuất tồn

Theo

* Mặt hàng
* Nhóm hàng
* Kho
* Khoảng thời gian

Hiển thị

* Tồn đầu
* Nhập
* Xuất
* Tồn cuối

---

## Báo cáo hàng bán chạy

Top

* 10
* 20
* 50
* 100

---

## Báo cáo hàng bán chậm

* Không phát sinh
* Phát sinh ít

---

## Báo cáo lợi nhuận theo sản phẩm

Hiển thị

* Giá vốn
* Giá bán
* Lợi nhuận
* Tỷ lệ lợi nhuận

---

# 16. Hệ thống điểm thưởng khách hàng

## Quy tắc tích điểm

Ví dụ

```
10.000 VNĐ = 1 điểm
```

Có thể cấu hình

---

## Đổi điểm

Ví dụ

```
100 điểm = 100.000 VNĐ
```

---

## Theo dõi

* Tổng điểm
* Điểm đã dùng
* Điểm còn lại
* Lịch sử tích điểm
* Lịch sử đổi điểm

---

## Hạng thành viên

* Silver
* Gold
* Platinum
* Diamond

Theo doanh số mua hàng.

---

# 17. Dashboard

Hiển thị

* Doanh thu hôm nay
* Doanh thu tháng
* Lợi nhuận
* Thu chi
* Công nợ
* Tồn kho
* Hàng sắp hết
* Hàng sắp hết hạn
* Top sản phẩm
* Top khách hàng
* Biểu đồ doanh thu
* Biểu đồ chi phí
* Biểu đồ lợi nhuận

---

# 18. Đồng bộ dữ liệu

Đồng bộ

* Người dùng
* Hàng hóa
* Khách hàng
* Nhà cung cấp
* Hóa đơn
* Công nợ
* Thu chi
* Điểm thưởng
* Báo cáo
* Cấu hình

Cơ chế

```
Isar

↓

Sync Queue

↓

REST API

↓

Vercel

↓

Neon PostgreSQL
```

---

# 19. Phân quyền

## Chủ cửa hàng

Toàn quyền.

## Quản lý

* Bán hàng
* Kho
* Báo cáo
* Nhân viên

## Thu ngân

* Bán hàng
* In hóa đơn
* Khách hàng

## Nhân viên kho

* Nhập
* Xuất
* Kiểm kê

## Kế toán

* Thu chi
* Công nợ
* Báo cáo tài chính

---

# 20. Công nghệ

## Mobile

* Flutter
* Dart

## Local Database

* Isar

## State Management

* Riverpod

## API

* REST API
* Dio

## Authentication

* JWT
* Refresh Token

## Backend

* Vercel Functions

## Cloud Database

* Neon PostgreSQL

## Chart

* fl_chart

## Barcode

* mobile_scanner

## Export

* Excel
* PDF

---

# 21. Mục tiêu mở rộng

* Quản lý nhiều chi nhánh
* Đồng bộ thời gian thực
* CRM khách hàng
* Chương trình khuyến mãi
* Quản lý voucher
* Quản lý mã giảm giá
* Quản lý ca làm việc
* Chấm công nhân viên
* Kết nối máy quét mã vạch
* Kết nối máy in hóa đơn Bluetooth/LAN
* Kết nối cân điện tử
* Quản lý đặt hàng online
* AI dự báo tồn kho
* AI dự báo doanh thu
* Tự động gợi ý nhập hàng
* Dashboard Web quản trị từ xa
* API tích hợp với các nền tảng thương mại điện tử và phần mềm kế toán.

---

# 22. Kết luận

MiniMart Pro là giải pháp quản lý siêu thị mini và cửa hàng tạp hóa theo mô hình **Offline-First**, sử dụng **Flutter + Isar** để đảm bảo tốc độ xử lý tại thiết bị và **Neon PostgreSQL** đồng bộ qua **Vercel REST API** để quản lý tập trung. Hệ thống đáp ứng đầy đủ nghiệp vụ bán hàng, quản lý kho, tài chính, công nợ, khách hàng thân thiết, thống kê và báo cáo, đồng thời có khả năng mở rộng lên mô hình nhiều chi nhánh và quản trị từ xa trong tương lai.
