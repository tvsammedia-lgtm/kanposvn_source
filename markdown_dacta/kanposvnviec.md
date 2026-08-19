# KanViec - Phần mềm Quản lý Giới thiệu & Ghép Việc Làm Theo Khu Vực

Version: 1.0

---

# 1. Giới thiệu

KanViec là hệ thống quản lý trung tâm môi giới việc làm hoạt động theo từng:

- Tỉnh
- Thành phố
- Quận/Huyện
- Xã/Phường

Ứng dụng cho phép:

- Người tìm việc đăng hồ sơ
- Chủ thuê đăng việc
- Hệ thống tự động ghép việc
- Hiển thị khoảng cách giữa ứng viên và nơi làm việc
- Theo dõi doanh thu môi giới
- Làm việc Offline trước bằng Isar
- Đồng bộ Cloud qua API Vercel lên Neon PostgreSQL

---

# 2. Kiến trúc hệ thống

Flutter App

↓

Isar Database (Offline)

↓

Sync Engine

↓

REST API (Vercel)

↓

Neon PostgreSQL

↓

Admin Web

---

# 3. Loại tài khoản

## 3.1 Admin

Toàn quyền

## 3.2 Nhân viên môi giới

Quản lý khu vực

## 3.3 Chủ tuyển dụng

Đăng tuyển

Quản lý tin

Thanh toán

## 3.4 Người tìm việc

Đăng hồ sơ

Xem việc

Nhận việc

---

# 4. Danh mục ngành nghề

Ví dụ

Giúp việc nhà

Giữ trẻ

Chăm người già

Bảo vệ

Bốc xếp

Thợ xây

Phụ hồ

Thợ điện

Thợ điện nước

Thợ điện lạnh

Thợ sơn

Thợ mộc

Thợ hàn

Tài xế

Giao hàng

Shipper

Lái xe tải

Lái xe khách

Lái xe container

Thu ngân

Bán hàng

Nhân viên kho

Lễ tân

Pha chế

Đầu bếp

Phụ bếp

Rửa chén

Tạp vụ

Lao động phổ thông

...

Cho phép Admin tự thêm ngành nghề.

---

# 5. Hình thức làm việc

Theo giờ

Theo ca

Theo ngày

Theo tuần

Theo tháng

Theo năm

Lâu dài

Thời vụ

---

# 6. Hồ sơ người tìm việc

Thông tin

ID

Mã ứng viên

Họ tên

Ngày sinh

Giới tính

CCCD

Ảnh

Điện thoại

Email

Địa chỉ

Xã

Phường

Quận

Tỉnh

Lat

Lng

Bán kính làm việc

Mức lương mong muốn

Có xe máy

Có ô tô

Có bằng lái

Kinh nghiệm

Ngành nghề

Ngày bắt đầu

Đang rảnh

Đang làm

Đã nghỉ

Có thể upload

Ảnh

CCCD

Chứng chỉ

Giấy khám sức khỏe

---

# 7. Hồ sơ nhà tuyển dụng

Mã khách hàng

Tên công ty

Tên cửa hàng

Người liên hệ

Địa chỉ

Lat

Lng

Điện thoại

Email

Ngành nghề

Đánh giá

Lịch sử tuyển

---

# 8. Quản lý tin tuyển dụng

Mã tin

Tiêu đề

Mô tả

Số lượng

Địa chỉ

Lat

Lng

Lương

Loại lương

Theo giờ

Theo ngày

Theo tháng

Ngày bắt đầu

Ngày kết thúc

Yêu cầu

Giới tính

Tuổi

Kinh nghiệm

Đã tuyển đủ

Đang tuyển

Ngừng tuyển

---

# 9. Quản lý ghép việc

Một ứng viên

↓

Nhiều công việc phù hợp

Hoặc

Một công việc

↓

Nhiều ứng viên phù hợp

Hệ thống gợi ý:

Khoảng cách

Lương

Kinh nghiệm

Ngành nghề

Đánh giá

Khu vực

---

# 10. Tích hợp bản đồ

Google Maps

OpenStreetMap

OmniRoute

Hiển thị

📍 Ứng viên

🏢 Nơi tuyển

Khoảng cách

Ví dụ

Ứng viên

22 Nguyễn Trãi

↓

Nhà tuyển

25 Nguyễn Trãi

Khoảng cách

250m

Hoặc

4 km

---

# 11. Bán kính tìm việc

Ví dụ

5 km

10 km

15 km

20 km

30 km

50 km

Ứng viên chọn

Chỉ nhận việc trong bán kính.

---

# 12. Ghép việc tự động

Điều kiện

Ngành nghề giống

Khoảng cách phù hợp

Mức lương đạt yêu cầu

Đang rảnh

Độ tuổi phù hợp

Giới tính

Kinh nghiệm

Hệ thống chấm điểm

95%

90%

85%

...

---

# 13. Quản lý nhận việc

Ngày nhận

Giờ bắt đầu

Giờ kết thúc

Đã hoàn thành

Đang làm

Đã hủy

---

# 14. Quản lý hợp đồng

Theo giờ

Theo ngày

Theo tháng

Có thể lưu

PDF

Ảnh

Chữ ký

---

# 15. Quản lý phí môi giới

Theo %

Theo số tiền

Theo tháng

Theo hợp đồng

Ví dụ

500.000

1.000.000

5%

10%

---

# 16. Thu chi

Thu

Phí giới thiệu

Gia hạn tin

Đăng VIP

Quảng cáo

Chi

Lương nhân viên

Marketing

Điện nước

Thuê văn phòng

Khác

---

# 17. Báo cáo

Doanh thu

Chi phí

Lợi nhuận

Số việc

Số ứng viên

Số nhà tuyển

Việc hoàn thành

Việc đang tuyển

Theo

Ngày

Tuần

Tháng

Quý

Năm

---

# 18. Dashboard

Hôm nay

Việc mới

Ứng viên mới

Doanh thu

Ghép việc thành công

Việc gần hết hạn

---

# 19. Thông báo

Push Notification

SMS

Email

Zalo

Thông báo

Có việc gần bạn

Có ứng viên phù hợp

Tin sắp hết hạn

---

# 20. Chat

Ứng viên

↓

Nhà tuyển

Có thể gửi

Tin nhắn

Ảnh

Vị trí

---

# 21. Đánh giá

Nhà tuyển đánh giá ứng viên

Ứng viên đánh giá nhà tuyển

5 sao

Bình luận

---

# 22. Quản lý khu vực

Quốc gia

↓

Tỉnh

↓

Huyện

↓

Xã

↓

Phường

↓

Ấp

↓

Khu phố

↓

Tổ dân phố

Cho phép nhân viên chỉ quản lý khu vực được giao.

---

# 23. Đồng bộ dữ liệu

Offline

↓

Isar

↓

Queue

↓

API Vercel

↓

Neon PostgreSQL

Có:

Conflict Resolve

Increment Sync

Deleted Sync

Retry

Checksum

Version

---

# 24. Phân quyền

Admin

Quản lý nhân viên

Nhân viên môi giới

Chủ tuyển

Ứng viên

Kế toán

CSKH

---

# 25. Nhật ký

Đăng nhập

Đăng việc

Nhận việc

Thanh toán

Sửa dữ liệu

Sync

---

# 26. Công nghệ

Frontend

Flutter

Material 3

Riverpod

GoRouter

Isar

Camera

Google Maps / OpenStreetMap

OmniRoute API

Background Sync

Dio

Backend

Vercel API

JWT

REST API

Neon PostgreSQL

Admin Web

Next.js

React

TailwindCSS

Chart.js

---

# 27. Module Isar

users

employees

candidates

employers

jobs

job_categories

applications

job_matches

contracts

payments

revenues

expenses

notifications

messages

ratings

locations

districts

wards

villages

sync_queue

audit_logs

attachments

settings

---

# 28. API

POST /login

POST /register

GET /jobs

POST /jobs

PUT /jobs

DELETE /jobs

GET /candidates

POST /candidates

GET /match

POST /apply

POST /contract

POST /payment

POST /sync/upload

POST /sync/download

GET /dashboard

GET /reports

---

# 29. Báo cáo

- Doanh thu môi giới
- Báo cáo theo xã/phường
- Báo cáo theo nhân viên
- Báo cáo theo ngành nghề
- Báo cáo việc làm theo khoảng cách
- Báo cáo ứng viên theo khu vực
- Báo cáo hợp đồng
- Báo cáo phí môi giới
- Báo cáo thu chi
- Báo cáo lợi nhuận
- Báo cáo tỷ lệ ghép việc thành công
- Top ngành nghề tuyển nhiều nhất
- Top khu vực có nhu cầu tuyển dụng cao
- Thống kê ứng viên đang chờ việc
- Thống kê công việc theo giờ/ngày/tuần/tháng/năm

---

# 30. Hướng phát triển

- AI gợi ý ứng viên phù hợp
- AI gợi ý công việc phù hợp
- OCR CCCD
- Quét QR Check-in khi nhận việc
- Chấm công GPS
- eKYC
- Thanh toán trực tuyến
- Ví điện tử
- AI dự đoán nhu cầu tuyển dụng theo khu vực
- Bản đồ nhiệt (Heatmap) hiển thị khu vực có nhiều việc làm hoặc nhiều ứng viên, giúp nhân viên môi giới tối ưu việc kết nối.
- Mini CRM chăm sóc nhà tuyển dụng và ứng viên.
- Hệ thống xếp hạng uy tín cho cả ứng viên và nhà tuyển dụng.