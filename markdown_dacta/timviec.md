# Hệ thống Quản lý tìm việc - Ghép việc lao động phổ thông

Version: 1.0

---

# 1. Mục tiêu

Xây dựng ứng dụng Flutter hoạt động Offline First.

Người dùng có thể:

- Đăng ký tài khoản
- Tìm việc
- Đăng việc
- Ghép việc
- Theo dõi tiến độ
- Thanh toán phí môi giới
- Xem lịch sử
- Đồng bộ dữ liệu với Server

Ứng dụng ưu tiên:

- Flutter
- Isar Database
- REST API
- Vercel
- Neon PostgreSQL

---

# 2. Kiến trúc

```
Flutter
      │
      │
      ▼

Isar Database (Offline)

      │
      │ Sync API
      ▼

Vercel REST API

      │

      ▼

Neon PostgreSQL
```

---

# 3. Công nghệ

Frontend

- Flutter
- Riverpod
- GoRouter
- Dio
- Isar
- Flutter Secure Storage

Backend

- Next.js API Route
- Vercel

Database

- Neon PostgreSQL

Authentication

- JWT
- Refresh Token

Notification

- Firebase Cloud Messaging

Storage

- Vercel Blob
hoặc
Cloudinary

---

# 4. Module chính

## 4.1 Đăng nhập

- Login
- Logout
- Refresh Token

---

## 4.2 Người tìm việc

Thông tin

- Họ tên
- CCCD
- Giới tính
- Năm sinh
- Điện thoại
- Địa chỉ
- Khu vực
- Kinh nghiệm
- Nghề mong muốn
- Mức lương
- Có ở lại hay không
- Có xe máy
- Trình độ học vấn
- Sức khỏe
- Ảnh
- Hồ sơ

Trạng thái

- Chờ việc
- Đã ghép
- Đang làm
- Nghỉ việc
- Tạm khóa

---

## 4.3 Chủ cần người

Thông tin

- Công ty
- Cá nhân
- Địa chỉ
- Người liên hệ
- Điện thoại

Danh sách việc

- Nghề
- Số lượng
- Lương
- Thời gian
- Mô tả

---

# 5. Danh mục nghề

- Giúp việc nhà
- Chăm sóc người già
- Chăm sóc bệnh nhân
- Bảo vệ
- Dọn vệ sinh
- Làm vườn
- Phụ hồ
- Công nhân
- Tạp vụ
- Nhà hàng
- Phục vụ
- Rửa chén
- Bốc xếp
- Giao hàng
- Lái xe
- Khác

---

# 6. Ghép việc

Nhân viên môi giới

↓

Chọn người tìm việc

↓

Chọn công việc

↓

Kiểm tra điều kiện

↓

Xác nhận

↓

Tạo hợp đồng

↓

Theo dõi

---

# 7. Quản lý hợp đồng

Thông tin

- Ngày nhận việc
- Ngày kết thúc
- Phí môi giới
- Hoa hồng
- Lương
- Trạng thái

Trạng thái

- Đang chờ
- Đã nhận việc
- Đang làm
- Hoàn thành
- Hủy

---

# 8. Quản lý doanh thu

Nguồn thu

- Phí môi giới
- Phí giới thiệu
- Gia hạn hợp đồng
- Thu khác

Chi phí

- Quảng cáo
- Hoa hồng nhân viên
- Đi lại
- Văn phòng
- Khác

Lợi nhuận

Doanh thu - Chi phí

---

# 9. Dashboard

Hiển thị

- Người tìm việc hôm nay
- Người đã ghép
- Người đang chờ
- Công việc đang tuyển
- Doanh thu hôm nay
- Doanh thu tháng
- Doanh thu năm

Biểu đồ

- Theo tháng
- Theo nghề
- Theo khu vực

---

# 10. Đồng bộ dữ liệu

Flutter

↓

Lưu Isar

↓

Đánh dấu Sync Pending

↓

Có Internet

↓

Gửi API

↓

Server

↓

Neon

↓

Trả kết quả

↓

Update Isar

---

# 11. Đồng bộ Offline

Mỗi bảng có

```

id

uuid

updatedAt

createdAt

deleted

syncStatus

version

```

syncStatus

0 = Chưa sync

1 = Đã sync

2 = Đang sync

3 = Lỗi

---

# 12. Phân quyền

## Admin

Toàn quyền

## Quản lý

- Quản lý người tìm việc
- Quản lý khách hàng
- Báo cáo

## Nhân viên môi giới

- Thêm hồ sơ
- Ghép việc
- Theo dõi

## Kế toán

- Thu tiền
- Báo cáo

## Chủ tuyển

- Đăng việc
- Theo dõi ứng viên

---

# 13. API

Authentication

POST

/api/login

/api/logout

/api/refresh

---

Người tìm việc

GET

/api/jobseekers

POST

/api/jobseekers

PUT

/api/jobseekers/{id}

DELETE

/api/jobseekers/{id}

---

Việc làm

GET

/api/jobs

POST

/api/jobs

PUT

/api/jobs/{id}

DELETE

/api/jobs/{id}

---

Ghép việc

POST

/api/matches

GET

/api/matches

PUT

/api/matches/{id}

---

Doanh thu

GET

/api/revenue

GET

/api/dashboard

---

# 14. Cấu trúc Flutter

```

lib/

core/

api/

isar/

auth/

utils/

services/

models/

features/

login/

dashboard/

jobseekers/

jobs/

matching/

contracts/

revenue/

reports/

settings/

widgets/

```

---

# 15. Isar Collections

User

Role

JobCategory

JobSeeker

Employer

Job

Match

Contract

Revenue

Expense

Notification

SyncQueue

Setting

---

# 16. Neon Database

Tables

users

roles

job_categories

job_seekers

employers

jobs

matches

contracts

revenues

expenses

notifications

sync_logs

settings

---

# 17. Bảo mật

- JWT
- HTTPS
- Refresh Token
- Password Hash (bcrypt)
- Row Level Security
- Audit Log
- API Rate Limit

---

# 18. Báo cáo

Theo

- Ngày
- Tuần
- Tháng
- Năm
- Nghề
- Khu vực
- Nhân viên

Xuất

- Excel
- PDF

---

# 19. Thống kê

Top nghề

Top khu vực

Top nhân viên

Top khách hàng

Top doanh thu

---

# 20. Lộ trình phát triển

Giai đoạn 1

- Đăng nhập
- Người tìm việc
- Chủ tuyển
- Công việc
- Ghép việc

Giai đoạn 2

- Đồng bộ Isar
- Dashboard
- Doanh thu

Giai đoạn 3

- Thông báo
- Báo cáo
- AI gợi ý ghép việc
- OCR CCCD
- Ký hợp đồng điện tử

---

# 21. AI gợi ý ghép việc (Tương lai)

Sử dụng AI để đánh giá:

- Khoảng cách địa lý
- Mức lương mong muốn
- Kinh nghiệm
- Độ tuổi
- Giới tính (nếu công việc có yêu cầu hợp pháp)
- Kỹ năng
- Thời gian làm việc
- Lịch sử nhận việc
- Tỷ lệ hoàn thành công việc
- Điểm đánh giá từ chủ tuyển

AI sẽ chấm điểm phù hợp (Matching Score 0–100) và đề xuất ứng viên tối ưu cho từng công việc.

---

# 22. Mục tiêu hệ thống

- Offline First
- Đồng bộ nhanh
- Dễ mở rộng
- Hỗ trợ hàng trăm nghìn hồ sơ
- API REST chuẩn
- Flutter đa nền tảng (Android, iOS, Windows, Web)
- Kiến trúc Clean Architecture
- Dễ tích hợp AI và các dịch vụ bên ngoài trong tương lai