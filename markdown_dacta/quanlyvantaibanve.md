# PRD - Hệ thống Quản lý Bán Vé & Điều Hành Vận Tải
## Flutter + Isar + Supabase + Vercel API

**Phiên bản:** 1.0

**Công nghệ**

- Frontend: Flutter 3.x
- State Management: Riverpod
- Local Database: Isar Database
- Cloud Database: Supabase PostgreSQL
- Backend API: Vercel Serverless Functions
- Authentication: Supabase Auth + JWT
- Storage: Supabase Storage
- Notification: Firebase Cloud Messaging
- Report Export: Excel / PDF
- QR Code: qr_flutter
- Barcode: mobile_scanner
- Maps: Google Maps

---

# 1. Mục tiêu

Xây dựng phần mềm quản lý vận tải hành khách và hàng hóa hoạt động Online + Offline.

Ví dụ doanh nghiệp

- Tuyến Bắc Nam
- Đồng Nai ⇄ Vũng Tàu
- An Giang ⇄ TP.HCM
- TP.HCM ⇄ Đà Lạt
- TP.HCM ⇄ Cần Thơ

Hệ thống hỗ trợ

- bán vé
- đặt vé online
- quản lý xe
- quản lý tài xế
- điều xe
- quản lý hàng hóa
- doanh thu
- chi phí
- kế toán
- công nợ
- đồng bộ dữ liệu nhiều chi nhánh

---

# 2. Kiến trúc

```
Flutter

        │

Riverpod

        │

Isar Database

        │
 Offline Queue

        │

API Vercel

        │

Supabase PostgreSQL
```

Offline hoàn toàn.

Có Internet

↓

Sync dữ liệu lên Supabase.

---

# 3. Phân hệ

## 1. Dashboard

Hiển thị

- Doanh thu hôm nay
- Vé đã bán
- Chuyến xe đang chạy
- Xe đang bảo dưỡng
- Xe đang sửa chữa
- Hàng đang vận chuyển
- Công nợ khách hàng
- Công nợ nhà cung cấp
- Doanh thu tháng
- Chi phí tháng
- Lợi nhuận

Biểu đồ

- Doanh thu theo tuyến
- Doanh thu theo xe
- Doanh thu theo tài xế
- Doanh thu theo chi nhánh

---

# 2. Quản lý tuyến xe

Thông tin

- Mã tuyến
- Tên tuyến
- Điểm đi
- Điểm đến
- Km
- Giá vé chuẩn
- Thời gian chạy
- Số chuyến/ngày
- Ghi chú

Ví dụ

Bắc Nam

Đồng Nai → Vũng Tàu

An Giang → TP.HCM

---

# 3. Quản lý xe

Thông tin

- Biển số
- Loại xe
- Giường nằm
- Ghế ngồi
- Limousine
- Container
- Xe tải

Thông tin kỹ thuật

- Hãng
- Năm sản xuất
- Số ghế
- Số giường
- GPS
- Đăng kiểm
- Bảo hiểm

Theo dõi

- km đã chạy
- lịch bảo dưỡng
- thay nhớt
- thay lốp
- sửa chữa

---

# 4. Quản lý tài xế

Thông tin

- Hồ sơ
- GPLX
- Hạng bằng
- Ngày hết hạn
- Điện thoại
- CCCD

Theo dõi

- Lương
- Phụ cấp
- Chuyến chạy
- Doanh thu
- Vi phạm
- Thưởng

---

# 5. Quản lý phụ xe

- Hồ sơ
- Lương
- Công
- Phụ cấp

---

# 6. Quản lý lịch chạy

Mỗi ngày

Xe

↓

Tuyến

↓

Tài xế

↓

Phụ xe

↓

Giờ xuất bến

↓

Giờ đến

↓

Tình trạng

---

# 7. Quản lý bán vé

Đặt vé

Chọn

- Tuyến
- Ngày
- Chuyến
- Ghế

Thông tin khách

- Họ tên
- Điện thoại
- CCCD

Thanh toán

- Tiền mặt
- Chuyển khoản
- QR
- Công nợ

In vé

Có QR Code.

---

# 8. Sơ đồ ghế

Hiển thị

- Ghế trống
- Ghế đã bán
- Ghế giữ chỗ
- Ghế VIP

Không cho bán trùng.

---

# 9. Quản lý khách hàng

Thông tin

- Cá nhân
- Doanh nghiệp

Lưu

- Lịch sử mua vé
- Hàng gửi
- Công nợ

---

# 10. Quản lý hàng hóa

Nhận gửi

- Hàng nhỏ
- Bao
- Kiện
- Xe máy
- Pallet

Thông tin

Người gửi

Người nhận

Điểm nhận

Điểm giao

Khối lượng

Giá cước

Thu hộ COD

Theo dõi

- Đang nhận
- Đang đi
- Đã giao

---

# 11. Kho trung chuyển

Quản lý

- Nhập kho
- Xuất kho
- Chờ giao
- Đã giao

---

# 12. Điều xe

Phân xe tự động

Theo

- Tuyến
- Xe
- Ghế
- Tài xế

---

# 13. GPS

Hiển thị

- Xe đang chạy
- Tốc độ
- Vị trí
- ETA

---

# 14. Quản lý chi phí

Chi phí

- Dầu
- Vé cầu đường
- Bến bãi
- Bảo dưỡng
- Lương
- BHXH
- Khấu hao
- Văn phòng
- Điện nước
- Internet
- Marketing

---

# 15. Quản lý doanh thu

Theo

- Xe
- Tuyến
- Tài xế
- Chi nhánh

Doanh thu

- Vé
- Hàng hóa
- Thu hộ
- Dịch vụ

---

# 16. Công nợ khách hàng

Theo dõi

- Phải thu
- Đã thu
- Còn nợ
- Hạn thanh toán

---

# 17. Công nợ nhà cung cấp

Theo dõi

- Gara
- Xăng dầu
- Lốp xe
- Phụ tùng
- Bảo hiểm

---

# 18. Quản lý quỹ

Quỹ tiền mặt

Ngân hàng

Thu

Chi

Sổ quỹ

---

# 19. Kế toán

## Phiếu thu

## Phiếu chi

## Nhật ký chung

## Sổ cái

## Công nợ

## Kho

## TSCĐ

## Khấu hao

## Lương

---

# 20. Báo cáo

## Vé

- Vé theo ngày
- Vé theo tuyến
- Vé theo xe

---

## Hàng hóa

- Theo tuyến
- Theo khách
- Theo tài xế

---

## Doanh thu

Theo

- Ngày
- Tuần
- Tháng
- Quý
- Năm

---

## Chi phí

Theo

- Xe
- Tuyến
- Khoản mục

---

## Lợi nhuận

```
Doanh thu

-

Chi phí

=

Lợi nhuận
```

---

## Báo cáo công nợ

Khách hàng

Nhà cung cấp

---

## Báo cáo kế toán

- Nhật ký chung
- Sổ cái
- Cân đối phát sinh
- Báo cáo kết quả kinh doanh
- Bảng cân đối kế toán
- Lưu chuyển tiền tệ
- Thuế GTGT đầu ra
- Thuế GTGT đầu vào

---

# 21. Phân quyền

Admin

Kế toán

Điều hành

Thu ngân

Bán vé

Kho

Quản lý chi nhánh

Tài xế

Phụ xe

Khách hàng

---

# 22. Đồng bộ dữ liệu

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

Đồng bộ

- Insert
- Update
- Delete

Conflict

Last Updated Wins

hoặc

Version Number

---

# 23. Cấu trúc Isar

```
users

roles

branches

routes

vehicles

drivers

assistants

trips

trip_details

seats

tickets

customers

payments

shipments

shipment_items

suppliers

fuel_logs

maintenance

expenses

revenues

cashbooks

banks

receivables

payables

journals

accounts

assets

salary

notifications

sync_queue

audit_logs

settings
```

---

# 24. API Vercel

```
POST /api/login

POST /api/logout

GET /api/routes

GET /api/trips

GET /api/tickets

POST /api/tickets

PUT /api/tickets/:id

DELETE /api/tickets/:id

GET /api/shipments

POST /api/shipments

GET /api/revenues

GET /api/expenses

GET /api/reports

POST /api/sync

GET /api/download

POST /api/upload
```

---

# 25. Đồng bộ

Mỗi bản ghi gồm

```
id

createdAt

updatedAt

version

isDeleted

syncStatus

deviceId

branchId
```

Sync Queue

```
CREATE

UPDATE

DELETE
```

---

# 26. Backup

- Backup Isar
- Restore Isar
- Backup Supabase
- Export Excel
- Export PDF
- Export JSON

---

# 27. Tính năng mở rộng

- Đặt vé trực tuyến qua Website/App.
- Thanh toán VNPay, MoMo, ZaloPay, QR VietQR.
- Quét QR Code khi lên xe.
- Hóa đơn điện tử.
- Vé điện tử (E-ticket).
- Định vị GPS thời gian thực.
- AI dự báo nhu cầu hành khách theo mùa.
- Tối ưu lịch điều xe và phân công tài xế.
- Tích hợp API bản đồ và dẫn đường.
- API kết nối Tổng cục Thuế để xuất hóa đơn điện tử.
- Cổng API cho đối tác đại lý bán vé.

---

# 28. Lộ trình phát triển

## Giai đoạn 1
- Quản lý tuyến xe
- Quản lý xe
- Quản lý khách hàng
- Bán vé
- In vé
- Báo cáo doanh thu

## Giai đoạn 2
- Quản lý hàng hóa
- Điều xe
- Công nợ
- Quản lý kho trung chuyển
- GPS

## Giai đoạn 3
- Kế toán tổng hợp
- Bảng cân đối kế toán
- Lãi lỗ
- Báo cáo tài chính
- Đồng bộ đa chi nhánh

## Giai đoạn 4
- Đặt vé Online
- Mobile App khách hàng
- AI dự báo
- BI Dashboard
- Hệ thống ERP vận tải