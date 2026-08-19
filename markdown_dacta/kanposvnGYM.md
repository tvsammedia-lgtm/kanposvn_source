# Tài liệu yêu cầu hệ thống (PRD)

# KanGYM - Hệ thống quản lý GYM & Yoga

### Flutter + Isar Database + Neon PostgreSQL + API Vercel

---

# 1. Tổng quan

## Mục tiêu

Xây dựng ứng dụng quản lý phòng Gym, Fitness, Yoga, Aerobic hoạt động **Online + Offline**.

Ứng dụng sử dụng:

* Flutter (Android / Windows / Web Admin)
* Isar Database (Offline First)
* API Vercel
* Neon PostgreSQL (Cloud Database)
* Đồng bộ hai chiều (Two-way Sync)

Phù hợp cho

* Phòng Gym nhỏ
* Chuỗi phòng Gym
* Yoga Studio
* Fitness Center
* Crossfit
* Boxing
* Dance Studio
* Pilates

---

# 2. Kiến trúc hệ thống

```
Flutter App
      │
      │ Offline
      ▼
 Isar Database
      │
      │ Sync
      ▼
 API Vercel
      │
      ▼
 Neon PostgreSQL
      │
      ▼
Admin Web
```

Offline vẫn bán vé, check-in, thu tiền.

Khi có Internet:

* Upload dữ liệu
* Download dữ liệu
* Đồng bộ thay đổi

---

# 3. Đăng nhập

* Email
* Số điện thoại
* Google
* Apple
* Zalo Login
* OTP

Phân quyền:

* Chủ phòng tập
* Quản lý
* Thu ngân
* Lễ tân
* Huấn luyện viên (PT)
* Kế toán
* Marketing

---

# 4. Quản lý nhiều chi nhánh

Một tài khoản có thể quản lý

* nhiều phòng Gym
* nhiều Studio Yoga
* nhiều cơ sở

Mỗi cơ sở có

* Kho riêng
* Thiết bị riêng
* Doanh thu riêng
* Báo cáo riêng

---

# 5. Dashboard

Hiển thị

* Khách đang tập
* Check-in hôm nay
* Doanh thu hôm nay
* Hội viên mới
* Gói sắp hết hạn
* PT booking
* Thiết bị cần bảo trì
* Công nợ
* Thu chi
* Lợi nhuận

Biểu đồ

* Doanh thu
* Hội viên mới
* Gia hạn gói
* Chi phí
* Lợi nhuận

---

# 6. Quản lý hội viên

Thông tin

* Mã khách
* QR Code
* Họ tên
* Ảnh
* Giới tính
* Ngày sinh
* CMND/CCCD
* Địa chỉ
* Điện thoại
* Email
* Nghề nghiệp
* Người liên hệ khẩn cấp

Theo dõi

* Chiều cao
* Cân nặng
* BMI
* Mỡ cơ thể
* Mục tiêu luyện tập

---

# 7. Hồ sơ sức khỏe

Lưu

* Huyết áp
* Tiểu đường
* Dị ứng
* Chấn thương
* Tiền sử bệnh
* Ghi chú PT

Theo dõi

* Cân nặng
* Body Fat
* Muscle
* InBody

Biểu đồ tiến triển.

---

# 8. Quản lý gói tập

Các loại

* Ngày
* Tuần
* Tháng
* 3 tháng
* 6 tháng
* 1 năm
* Không giới hạn

Thiết lập

* Giá
* Số lần tập
* Giới hạn check-in
* Hạn sử dụng
* Tự gia hạn

---

# 9. Bán vé

Hỗ trợ

* Vé ngày
* Vé tuần
* Vé tháng
* Vé quý
* Vé năm
* Combo
* Family
* Corporate

Thanh toán

* Tiền mặt
* QR
* Chuyển khoản
* Ví điện tử
* Thẻ

In hóa đơn.

---

# 10. Voucher & Khuyến mãi

Voucher

* Theo %
* Theo số tiền
* Miễn phí tháng đầu
* Tặng PT
* Tặng nước
* Tặng khăn

Khuyến mãi

* Happy Hour
* Sinh nhật
* Khách mới
* Gia hạn
* Giới thiệu bạn bè

Điều kiện

* Theo thời gian
* Theo chi nhánh
* Theo gói tập
* Theo nhóm khách hàng

---

# 11. Khách hàng thân thiết

Tích điểm

Ví dụ

100.000đ = 10 điểm

Đổi

* Tháng tập
* Voucher
* Bình nước
* Áo Gym
* Dịch vụ PT
* Khăn tập

Xếp hạng

* Silver
* Gold
* Platinum
* Diamond

---

# 12. Check-in

Các hình thức

* QR Code
* Barcode
* NFC
* Face Recognition (tích hợp)
* Số điện thoại

Lưu

* Thời gian
* Chi nhánh
* PT phụ trách

---

# 13. Huấn luyện viên (PT)

Quản lý

* Hồ sơ PT
* Chuyên môn
* Lương
* Hoa hồng
* Lịch làm việc

Booking

* PT
* Yoga
* Group Class

---

# 14. Lịch học

Quản lý

* Yoga
* Boxing
* Dance
* Crossfit
* Pilates

Theo dõi

* Số chỗ
* Đã đăng ký
* Chờ
* Hủy

---

# 15. Bán hàng

POS mini

Bán

* Nước uống
* Protein
* Whey
* BCAA
* Quần áo
* Phụ kiện

Quản lý

* Barcode
* Tồn kho
* Giá bán
* Giá nhập

---

# 16. Quản lý kho

Theo dõi

* Nhập
* Xuất
* Điều chỉnh
* Kiểm kê

Kho

* Thực phẩm bổ sung
* Nước uống
* Thiết bị
* Đồng phục

---

# 17. Khấu hao thiết bị

Quản lý

* Máy chạy bộ
* Xe đạp
* Máy tập
* Ghế tập
* Điều hòa
* Camera
* Máy POS

Thông tin

* Giá mua
* Ngày mua
* Thời gian khấu hao
* Giá trị còn lại
* Lịch bảo trì
* Tình trạng hoạt động

Báo cáo

* Khấu hao theo tháng
* Khấu hao theo năm
* Chi phí sửa chữa
* Giá trị tài sản

---

# 18. Thu chi

Quản lý

Thu

* Bán vé
* Gia hạn
* PT
* POS
* Khác

Chi

* Điện
* Nước
* Internet
* Thuê nhà
* Marketing
* Lương
* Thiết bị
* Sửa chữa
* Văn phòng phẩm

---

# 19. Công nợ

Khách hàng

* Nợ tiền gói tập
* Trả góp

Nhà cung cấp

* Thiết bị
* Thực phẩm
* Dịch vụ

---

# 20. Báo cáo doanh thu

Theo

* Ngày
* Tuần
* Tháng
* Quý
* Năm

Chi tiết

* Theo nhân viên
* Theo PT
* Theo chi nhánh
* Theo ca
* Theo gói tập
* Theo phương thức thanh toán

Biểu đồ doanh thu.

---

# 21. Báo cáo chi phí

* Theo danh mục
* Theo chi nhánh
* Theo tháng
* Theo năm

So sánh

* Kế hoạch
* Thực tế

---

# 22. Báo cáo lãi lỗ

Doanh thu

(-)

Chi phí

(-)

Khấu hao

=

Lợi nhuận

Hiển thị

* Tổng hợp
* Chi tiết

---

# 23. Báo cáo hội viên

* Hội viên mới
* Hội viên hết hạn
* Hội viên gia hạn
* Hội viên không hoạt động
* Tần suất check-in
* Top khách hàng

---

# 24. Marketing

SMS

Email

Zalo OA

Push Notification

Chiến dịch

* Sinh nhật
* Gia hạn
* Khuyến mãi
* Chăm sóc khách hàng

---

# 25. Đồng bộ dữ liệu

## Upload

* Hội viên
* Vé
* Thanh toán
* Check-in
* Kho
* Thu chi

## Download

* Giá
* Voucher
* Gói tập
* Nhân viên
* Quyền

Conflict Resolution

Last Update Wins + Version + Deleted Flag.

---

# 26. Đồng bộ Offline

Isar lưu

* Khách hàng
* Vé
* Check-in
* Thu tiền
* Kho
* Thu chi

Internet trở lại

→ Sync tự động.

---

# 27. Bảo mật

* JWT
* HTTPS
* Refresh Token
* API Key
* Mã hóa dữ liệu nhạy cảm
* Nhật ký hoạt động (Audit Log)
* Phân quyền theo vai trò (RBAC)

---

# 28. Thông báo

* Gói sắp hết hạn
* Đến lịch tập
* Đến lịch PT
* Sinh nhật
* Khuyến mãi
* Công nợ
* Thiết bị bảo trì
* Thu chi bất thường

---

# 29. Sao lưu

* Backup Isar
* Restore Isar
* Backup Neon
* Xuất Excel
* Xuất PDF

---

# 30. Module AI (Mở rộng)

* AI tư vấn gói tập
* AI gợi ý chương trình luyện tập
* AI phân tích doanh thu
* AI dự báo hội viên nghỉ tập
* AI đề xuất khuyến mãi
* AI chatbot chăm sóc khách hàng
* AI dự báo nhu cầu thiết bị và nhân sự

---

# 31. Các Collection Isar đề xuất

* Members
* MembershipPlans
* MembershipCards
* CheckIns
* Trainers
* TrainerSchedules
* ClassSchedules
* Bookings
* Products
* Inventory
* Suppliers
* Purchases
* Sales
* Payments
* Expenses
* Revenue
* AssetDepreciation
* MaintenanceLogs
* Promotions
* Vouchers
* LoyaltyPoints
* RewardTransactions
* Branches
* Employees
* Roles
* Notifications
* SyncQueue
* AuditLogs
* AppSettings

---

# 32. Lộ trình phát triển

### Giai đoạn 1

* Đăng nhập
* Hội viên
* Bán gói tập
* Check-in
* Thu tiền
* Đồng bộ Isar ↔ Neon

### Giai đoạn 2

* POS bán sản phẩm
* Kho
* Voucher
* Loyalty
* Marketing
* Báo cáo nâng cao

### Giai đoạn 3

* AI
* Nhận diện khuôn mặt
* Phân tích dữ liệu
* Dashboard thời gian thực
* Quản lý chuỗi phòng tập
* Đồng bộ đa thiết bị
