# PRD - Ứng dụng Quản lý Quán Cafe - Trà Sữa - Sinh Tố

### Công nghệ: Flutter + Isar + Riverpod + Supabase + Vercel API

---

# 1. Giới thiệu

Ứng dụng quản lý bán hàng (POS) dành cho:

* Quán Cafe
* Quán Trà Sữa
* Quán Sinh Tố
* Quán Nước Giải Khát
* Cafe sân vườn
* Cafe máy lạnh
* Chuỗi cửa hàng

Thiết kế theo hướng:

* Offline First
* Đồng bộ Cloud khi có Internet
* Chạy Windows
* Android
* iOS
* Linux
* Web (quản trị)

---

# 2. Công nghệ

## Frontend

* Flutter Stable
* Riverpod
* GoRouter
* Material 3
* Responsive

## Database Offline

* Isar Database

## Đồng bộ Online

Flutter
↓
REST API
↓
Vercel Serverless API
↓
Supabase PostgreSQL

---

# 3. Kiến trúc

```
Flutter POS

        │

     Riverpod

        │

     Repository

   ┌───────────────┐
   │               │
Isar Local     Sync Service
                   │
              REST API
                   │
              Vercel API
                   │
            Supabase PostgreSQL
```

---

# 4. Chức năng chính

* Quản lý bàn
* Quản lý khu vực
* Theo dõi khách đang ngồi
* Tạo hóa đơn
* Tạm tính
* Thanh toán
* Mang đi
* Giao hàng
* Ghép bàn
* Tách bàn
* Chuyển bàn
* In bill
* Quản lý kho
* Thu chi
* Công nợ
* Doanh thu
* Lãi lỗ
* Báo cáo kế toán
* Đồng bộ Cloud

---

# 5. Quản lý khu vực

Ví dụ

```
Tầng 1

B1
B2
B3
B4

Tầng 2

B5
B6
B7

Sân vườn

B8
B9
B10
```

Mỗi bàn có:

* Tên bàn
* Khu vực
* Số ghế
* Trạng thái
* Ghi chú

---

# 6. Trạng thái bàn

* Trống
* Có khách
* Đang gọi món
* Đang phục vụ
* Chờ thanh toán
* Đã thanh toán
* Đang dọn
* Đã đặt trước

Màu hiển thị:

Xanh = Trống

Đỏ = Có khách

Cam = Chờ thanh toán

Xám = Đang dọn

---

# 7. Theo dõi khách đang ngồi

Hiển thị

```
Bàn 5

Khách:

Nguyễn Văn A

Vào lúc:

18:05

Số người:

4

Thời gian ngồi:

01:15

Tổng tiền hiện tại

425.000
```

---

# 8. Mang đi (Take Away)

Không cần bàn.

Thông tin

* Tên khách
* SĐT
* Mã đơn
* Ghi chú
* Người bán

---

# 9. Giao hàng

* Grab
* ShopeeFood
* BeFood
* Gojek
* Tự giao

Lưu

* Đơn vị giao
* Phí ship
* Người nhận
* Địa chỉ
* Thanh toán

---

# 10. Menu

Danh mục

Cafe

* Đen
* Sữa
* Bạc xỉu
* Espresso
* Cappuccino

Trà sữa

* Truyền thống
* Matcha
* Socola
* Oolong

Sinh tố

* Bơ
* Dâu
* Xoài

Nước ép

Đá xay

Bánh ngọt

Snack

---

# 11. Size

* S
* M
* L

---

# 12. Topping

* Trân châu
* Pudding
* Kem Cheese
* Thạch
* Flan
* Foam

---

# 13. Gọi món

Có thể

* thêm
* sửa
* xóa

Mỗi món

* size
* topping
* số lượng
* giảm giá
* ghi chú

---

# 14. Tạm tính

Hiển thị

```
Cafe Sữa

2 x 35.000

70.000

Matcha

1 x 55.000

55.000

----------------

Tạm tính

125.000
```

Có thể in tạm tính.

---

# 15. Thanh toán

Hỗ trợ

* Tiền mặt
* QR
* Chuyển khoản
* Thẻ
* Ví điện tử
* Thanh toán nhiều phương thức

---

# 16. Chuyển bàn

Ví dụ

```
B2

↓

B8
```

Toàn bộ món ăn được chuyển.

---

# 17. Ghép bàn

Ví dụ

```
B3

+

B4

=

B3+B4
```

---

# 18. Tách hóa đơn

Một bàn

↓

3 hóa đơn

---

# 19. Giảm giá

Theo

* %
* tiền
* Voucher
* Thành viên

---

# 20. Khách hàng

Lưu

* Tên
* SĐT
* Điểm tích lũy
* Sinh nhật
* Hạng thành viên
* Lịch sử mua hàng
* Công nợ (nếu cho phép bán chịu)

---

# 21. Kho

Quản lý

* Nguyên liệu
* Thành phẩm
* Tồn kho
* Nhập
* Xuất
* Điều chỉnh
* Kiểm kê

---

# 22. Công thức pha chế (Recipe)

Ví dụ

Cafe sữa

* Cafe 25g
* Sữa đặc 20ml
* Đường 10g
* Đá

Khi bán

↓

Tự động trừ kho.

---

# 23. Nhà cung cấp

* Danh bạ
* Công nợ
* Lịch sử nhập hàng
* Thanh toán

---

# 24. Thu Chi

Thu

* Bán hàng
* Thu nợ
* Thu khác

Chi

* Nhập hàng
* Điện
* Nước
* Thuê mặt bằng
* Lương
* Marketing
* Khấu hao
* Chi khác

---

# 25. Doanh thu

Theo

* Giờ
* Ca
* Ngày
* Tuần
* Tháng
* Quý
* Năm
* Chi nhánh

---

# 26. Lợi nhuận

```
Doanh thu

-

Giá vốn

-

Chi phí

=

Lợi nhuận
```

---

# 27. Báo cáo

* Top món bán chạy
* Món bán chậm
* Khách hàng thân thiết
* Nhân viên bán hàng
* Báo cáo kho
* Báo cáo thu chi
* Báo cáo công nợ
* Báo cáo lợi nhuận
* Báo cáo doanh thu theo ca
* Báo cáo VAT (nếu áp dụng)

---

# 28. Báo cáo kế toán

## Báo cáo kết quả kinh doanh

* Doanh thu
* Giá vốn
* Chi phí
* Lợi nhuận

---

## Bảng cân đối kế toán

### Tài sản

* Tiền mặt
* Tiền gửi ngân hàng
* Phải thu khách hàng
* Hàng tồn kho
* Tài sản cố định

### Nguồn vốn

* Phải trả nhà cung cấp
* Vay
* Vốn chủ sở hữu
* Lợi nhuận chưa phân phối

---

## Báo cáo lưu chuyển tiền tệ

Thu

Chi

Tiền cuối kỳ

---

# 29. In hóa đơn

Hỗ trợ

* Máy in nhiệt 58mm
* Máy in nhiệt 80mm
* Bluetooth
* LAN
* USB

---

# 30. Phân quyền

Admin

Quản lý

Thu ngân

Phục vụ

Pha chế

Kế toán

Chủ quán

---

# 31. Đồng bộ Supabase

```
Flutter

↓

Isar

↓

Sync Queue

↓

REST API

↓

Vercel

↓

Supabase PostgreSQL
```

Nguyên tắc:

* Offline hoàn toàn khi mất mạng.
* Mọi thao tác (thêm, sửa, xóa) được ghi vào `SyncQueue`.
* Khi có Internet, dữ liệu được gửi lên Vercel API theo từng lô (batch).
* API xác thực bằng JWT/API Key và ghi dữ liệu vào Supabase.
* Sau khi đồng bộ thành công, đánh dấu bản ghi đã đồng bộ và cập nhật `lastSyncedAt`.
* Hỗ trợ đồng bộ hai chiều (Two-way Sync) bằng `updatedAt`, `deletedAt` và `syncVersion`.
* Xử lý xung đột theo chiến lược **Last Write Wins** hoặc cho phép cấu hình theo từng bảng dữ liệu.

---

# 32. Các Collection Isar

* Users
* Roles
* Tables
* Areas
* Products
* Categories
* Recipes
* Customers
* Suppliers
* Orders
* OrderItems
* Payments
* Inventory
* InventoryTransactions
* ExpenseCategories
* Expenses
* Revenues
* CashSessions
* ShiftReports
* Debts
* AccountingEntries
* SyncQueue
* AppSettings
* AuditLogs

---

# 33. API Vercel

```
POST /api/auth/login

POST /api/sync/push

GET /api/sync/pull

POST /api/order

PUT /api/order/:id

DELETE /api/order/:id

GET /api/report

GET /api/products

GET /api/customers

GET /api/accounting
```

---

# 34. Dashboard

Hiển thị trực quan:

* Doanh thu hôm nay
* Doanh thu tháng
* Lợi nhuận
* Chi phí
* Tiền mặt
* Tiền ngân hàng
* Số bàn đang phục vụ
* Bàn trống
* Đơn mang đi
* Đơn giao hàng
* Khách đang ngồi
* Món bán chạy
* Tồn kho sắp hết
* Công nợ khách hàng
* Công nợ nhà cung cấp
* Cảnh báo nguyên liệu dưới mức tối thiểu

---

# 35. Lộ trình phát triển

## Giai đoạn 1

* POS cơ bản
* Quản lý bàn
* Bán hàng
* Thanh toán
* In hóa đơn

## Giai đoạn 2

* Quản lý kho
* Công thức pha chế
* Thu chi
* Công nợ

## Giai đoạn 3

* Kế toán
* Bảng cân đối kế toán
* Lãi lỗ
* Dashboard phân tích

## Giai đoạn 4

* Đồng bộ Supabase
* Hỗ trợ nhiều chi nhánh
* Quản trị Web
* Phân quyền nâng cao
* Sao lưu và khôi phục dữ liệu
* Thông báo thời gian thực (Realtime) cho đơn hàng và trạng thái bàn
