# Tài liệu yêu cầu hệ thống (SRS)
# Ứng dụng Quản lý Môi giới Giao dịch Bất động sản

**Phiên bản:** 1.0  
**Frontend:** Flutter  
**Local Database:** Isar Database  
**Cloud Database:** Neon PostgreSQL  
**Backend API:** Vercel Serverless API (RESTful)  
**Authentication:** JWT + Refresh Token

---

# 1. Mục tiêu

Xây dựng hệ thống quản lý môi giới bất động sản hoạt động cả Online và Offline.

- Làm việc khi mất Internet.
- Đồng bộ dữ liệu khi có mạng.
- Quản lý khách mua.
- Quản lý khách bán.
- Quản lý môi giới.
- Quản lý giao dịch.
- Quản lý hoa hồng.
- Quản lý phí sàn.
- So khớp khách mua với bất động sản.
- Báo cáo doanh thu.
- Thống kê giao dịch.

---

# 2. Kiến trúc hệ thống

```

Flutter App
│
├── Isar Database
│
├── Repository
│
├── Sync Service
│
└── REST API
│
Vercel
│
Neon PostgreSQL

```

## Offline

Toàn bộ dữ liệu lưu Isar.

## Online

Đồng bộ lên Neon Database thông qua REST API.

---

# 3. Phân quyền

## Super Admin

- Quản lý toàn hệ thống
- Quản lý người dùng
- Quản lý chi nhánh
- Xem toàn bộ báo cáo
- Phân quyền

---

## Chủ sàn

- Quản lý môi giới
- Quản lý khách hàng
- Quản lý giao dịch
- Xem doanh thu sàn
- Xem hoa hồng

---

## Môi giới

- Quản lý khách mua
- Quản lý khách bán
- Đăng bất động sản
- Chốt giao dịch
- Xem hoa hồng của mình

---

## Kế toán

- Quản lý thu chi
- Quản lý phí
- Quản lý hoa hồng
- Báo cáo

---

# 4. Module hệ thống

## 4.1 Dashboard

Hiển thị

- Tổng số bất động sản
- Tổng khách mua
- Tổng khách bán
- Giao dịch hôm nay
- Giao dịch tháng
- Doanh thu
- Hoa hồng
- Phí sàn
- Lợi nhuận

---

## 4.2 Quản lý Môi giới

Thông tin

- Mã môi giới
- Họ tên
- SĐT
- Email
- CCCD
- Chi nhánh
- Ngày vào làm
- Trạng thái

Theo dõi

- Số giao dịch
- Doanh thu
- Hoa hồng
- KPI

---

# 5. Quản lý Người bán

Thông tin

- Mã khách
- Họ tên
- SĐT
- Email
- Địa chỉ
- Ghi chú

Một người bán có thể đăng nhiều bất động sản.

---

# 6. Quản lý Người mua

Thông tin

- Họ tên
- Điện thoại
- Email
- Địa chỉ

Nhu cầu

- Thành phố
- Quận/Huyện
- Phường/Xã
- Khu vực
- Giá từ
- Giá đến
- Diện tích
- Loại BĐS
- Mặt tiền
- Hướng
- Pháp lý

---

# 7. Quản lý Bất động sản

Thông tin

- Mã BĐS
- Tiêu đề
- Mô tả
- Chủ sở hữu
- Môi giới phụ trách

Địa chỉ

- Tỉnh/Thành phố
- Quận/Huyện
- Phường/Xã
- Khu vực

Thông tin

- Giá bán
- Diện tích
- Chiều ngang
- Chiều dài
- Số tầng
- Số phòng ngủ
- Số WC

Pháp lý

- Sổ đỏ
- Sổ hồng
- Đang làm sổ
- Hợp đồng mua bán

---

# 8. Phân loại bất động sản

## Đất

- Đất thổ cư
- Đất nền
- Đất vườn
- Đất nông nghiệp

## Nhà

- Nhà ngõ
- Nhà mặt phố
- Biệt thự
- Nhà cấp 4

## Chung cư

- Studio
- 1PN
- 2PN
- 3PN

## Mặt bằng

- Shophouse
- Văn phòng
- Kho xưởng

---

# 9. Đặc điểm bất động sản

- Có sổ đỏ
- Có sổ hồng
- Chính chủ
- Góc 2 mặt tiền
- Mặt tiền đường 1 chiều
- Mặt tiền đường 2 chiều
- Hẻm xe hơi
- Hẻm nhỏ
- Gần trường
- Gần bệnh viện
- Gần chợ

---

# 10. Tìm kiếm nâng cao

Theo

- Thành phố
- Quận
- Phường xã
- Khu vực
- Giá
- Diện tích
- Loại BĐS
- Hướng
- Pháp lý
- Mặt tiền
- Môi giới

---

# 11. So khớp tự động

Hệ thống tự động so sánh:

Khách mua

↓

Danh sách bất động sản

Theo tiêu chí:

- Thành phố
- Phường xã
- Khu vực
- Giá
- Diện tích
- Loại BĐS
- Hướng
- Pháp lý
- Mặt tiền
- Khoảng cách

Hiển thị:

- Độ phù hợp (%)
- Danh sách gợi ý
- Sắp xếp theo điểm phù hợp

---

# 12. Quản lý Giao dịch

Thông tin

- Mã giao dịch
- Ngày giao dịch
- Người bán
- Người mua
- BĐS
- Môi giới
- Giá bán
- Giá chốt
- Hoa hồng
- Phí sàn
- Ghi chú

Trạng thái

- Đang đàm phán
- Đặt cọc
- Công chứng
- Hoàn thành
- Hủy

---

# 13. Quản lý Hoa hồng

Theo

- Môi giới
- Giao dịch
- Tháng
- Quý
- Năm

Thông tin

- Tỷ lệ %
- Tiền hoa hồng
- Thưởng
- Khấu trừ
- Thực nhận

---

# 14. Quản lý Phí sàn

Các loại phí

- Phí giao dịch
- Phí quảng cáo
- Phí dịch vụ
- Phí hồ sơ
- Chi phí khác

---

# 15. Báo cáo

## Báo cáo giao dịch tháng

Hiển thị

- Tổng giao dịch
- Tổng giá trị
- Thành công
- Hủy

---

## Báo cáo doanh thu

- Theo tháng
- Theo quý
- Theo năm

---

## Báo cáo lợi nhuận

Doanh thu

-

Chi phí

=

Lợi nhuận

---

## Báo cáo môi giới

- Số giao dịch
- Doanh số
- Hoa hồng
- KPI
- Xếp hạng

---

## Báo cáo bất động sản

- Đã bán
- Chưa bán
- Đang giao dịch
- Theo loại
- Theo khu vực

---

## Báo cáo khách hàng

- Khách mua mới
- Khách bán mới
- Khách đang giao dịch
- Khách VIP

---

# 16. Đồng bộ dữ liệu

## Upload

Isar

↓

REST API

↓

Vercel

↓

Neon PostgreSQL

---

## Download

Neon

↓

REST API

↓

Flutter

↓

Isar

---

## Chính sách Sync

- Sync theo thời gian thực khi có mạng.
- Đồng bộ thủ công theo yêu cầu.
- Đồng bộ nền theo chu kỳ.
- Chỉ đồng bộ dữ liệu thay đổi (`updated_at`).
- Hỗ trợ xử lý xung đột bằng phiên bản (`version`) và thời gian cập nhật (`updated_at`).
- Ghi nhật ký (Sync Log) cho từng lần đồng bộ.

---

# 17. Bảo mật

- JWT Authentication
- Refresh Token
- HTTPS
- Mã hóa dữ liệu nhạy cảm
- Phân quyền theo Role
- Ghi Log thao tác
- Sao lưu Neon Database định kỳ

---

# 18. Công nghệ

## Mobile

- Flutter
- Dart
- Isar Database
- Riverpod
- Dio
- Freezed
- GoRouter

---

## Backend

- Vercel Serverless Functions
- REST API
- TypeScript
- Prisma ORM

---

## Database

- Neon PostgreSQL

---

# 19. Các bảng dữ liệu chính

## Hệ thống

- users
- roles
- permissions
- branches
- user_roles
- audit_logs
- sync_logs

## Khách hàng

- customers_buy
- customers_sell

## Bất động sản

- properties
- property_images
- property_documents
- property_categories
- property_features
- property_status

## Giao dịch

- transactions
- transaction_details
- commissions
- brokerage_fees
- payments

## Quản lý môi giới

- brokers
- broker_targets
- broker_performance

## Danh mục

- provinces
- districts
- wards
- areas
- property_types
- legal_status
- road_types

## Báo cáo

- monthly_reports
- revenue_reports
- profit_reports

---

# 20. Tính năng mở rộng

- Đăng tin lên nhiều nền tảng bất động sản.
- Tích hợp Google Maps và định vị vị trí bất động sản.
- Hiển thị bán kính tiện ích (trường học, bệnh viện, chợ, siêu thị).
- Lưu lịch sử thương lượng và chăm sóc khách hàng (CRM).
- Nhắc lịch gọi khách, lịch xem nhà và lịch công chứng.
- Quản lý hợp đồng điện tử, tài liệu đính kèm và chữ ký số.
- Gửi SMS, Email hoặc Zalo thông báo cho khách hàng.
- Quét QR Code để truy xuất nhanh hồ sơ bất động sản.
- Phân tích dữ liệu và dự đoán xu hướng giao dịch theo khu vực.
- Dashboard thời gian thực theo chi nhánh và theo môi giới.
- Hỗ trợ đa chi nhánh, đa công ty và đa tenant trên cùng một hệ thống.