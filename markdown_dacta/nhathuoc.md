# Pharmacy Management System
# Phần mềm Quản lý Tiệm Thuốc Tây

> Hệ thống quản lý nhà thuốc hiện đại, hoạt động Offline trước - Đồng bộ Online sau.
>
> Công nghệ:
> - Flutter (Desktop, Android, Windows, Linux)
> - Isar Database (Offline)
> - Neon PostgreSQL (Cloud)
> - Riverpod
> - Clean Architecture

---

# Mục tiêu

Xây dựng phần mềm quản lý nhà thuốc đáp ứng:

- Bán thuốc nhanh
- Quản lý toa thuốc
- Quản lý bệnh nhân
- Quản lý khách hàng
- Quản lý thuốc
- Quản lý kho
- Quản lý nhập hàng
- Báo cáo doanh thu
- Báo cáo lãi lỗ
- Bảng cân đối kế toán
- Đồng bộ nhiều chi nhánh

---

# Các phân hệ

## 1. Dashboard

Hiển thị

- Doanh thu hôm nay
- Doanh thu tháng
- Chi phí
- Lợi nhuận
- Tiền mặt
- Công nợ khách hàng
- Công nợ nhà cung cấp
- Thuốc sắp hết
- Thuốc sắp hết hạn
- Top thuốc bán chạy
- Top bệnh thường gặp

---

# 2. Danh mục thuốc

Thông tin thuốc

- Mã thuốc
- Barcode
- Tên thuốc
- Tên hoạt chất
- Hàm lượng
- Dạng bào chế
- Quy cách
- Đơn vị tính
- Nhà sản xuất
- Nước sản xuất
- Nhóm thuốc
- Loại thuốc
- Thuốc kê đơn
- Thuốc OTC
- Giá vốn
- Giá bán
- VAT
- Hạn dùng
- Số đăng ký
- Mô tả
- Hình ảnh
- Ghi chú

---

## Phân loại thuốc

Ví dụ

Kháng sinh

- Amoxicillin
- Cefixime
- Cefuroxime

Giảm đau

- Paracetamol
- Ibuprofen

Tiêu hóa

- Smecta
- Enterogermina

Vitamin

- Vitamin C
- Vitamin B

Tim mạch

Tiểu đường

Gan mật

Hô hấp

Da liễu

Tai mũi họng

Mắt

Phụ khoa

...

---

# 3. Quản lý tồn kho

Mỗi thuốc có

- Tồn đầu
- Nhập
- Xuất
- Tồn cuối

Theo dõi

- Theo lô
- Theo hạn dùng
- Theo barcode

Cảnh báo

- Sắp hết
- Hết hạn
- Sắp hết hạn
- Âm kho

---

# 4. Nhập thuốc

Phiếu nhập

Thông tin

- Nhà cung cấp
- Số hóa đơn
- Ngày nhập
- Người nhập

Chi tiết

- Thuốc
- Lô
- Hạn dùng
- Giá nhập
- VAT
- Chiết khấu
- Thành tiền

---

# 5. Xuất bán thuốc

Có 2 hình thức

## Bán lẻ

Không cần toa

Ví dụ

Paracetamol

Vitamin C

...

---

## Bán theo toa

Có toa bác sĩ

Lưu

- Bệnh viện
- Bác sĩ
- Ngày kê toa
- Chuẩn đoán

Có thể scan toa

Lưu hình ảnh toa thuốc.

---

# 6. Kê đơn theo loại bệnh

Tạo thư viện toa thuốc mẫu.

Ví dụ

## Cảm cúm

- Paracetamol
- Vitamin C
- Alpha Choay

---

## Viêm họng

- Amoxicillin
- Alpha Choay
- Nước súc họng

---

## Tiêu chảy

- Smecta
- Oresol
- Men vi sinh

---

## Viêm dạ dày

- Gaviscon
- Omeprazole

---

## Dị ứng

- Loratadine
- Cetirizine

---

## Ho

- Acemuc
- Terpin Codein

---

## Cao huyết áp

- Amlodipine
- Coversyl

---

## Tiểu đường

- Metformin

...

Cho phép tạo hàng nghìn toa mẫu.

---

# 7. Quản lý bệnh nhân

Thông tin

- Mã bệnh nhân
- Họ tên
- Giới tính
- Ngày sinh
- CCCD
- Địa chỉ
- Điện thoại
- Email
- Nghề nghiệp
- Dị ứng thuốc
- Bệnh nền
- Tiền sử bệnh
- Bảo hiểm
- Ghi chú

Lưu

- Lịch sử mua thuốc
- Lịch sử toa thuốc
- Lịch sử bệnh

---

# 8. Quản lý khách hàng

Khách lẻ

Khách VIP

Khách doanh nghiệp

Theo dõi

- Điểm tích lũy
- Công nợ
- Doanh số
- Lần mua gần nhất

---

# 9. Nhà cung cấp

Thông tin

- Mã NCC
- Tên
- MST
- Địa chỉ
- Điện thoại
- Email
- Công nợ

---

# 10. Quản lý nhân viên

- Dược sĩ
- Thu ngân
- Quản lý
- Chủ cửa hàng

Phân quyền

- Admin
- Manager
- Cashier
- Pharmacist

---

# 11. Quản lý bán hàng POS

Hỗ trợ

- Barcode Scanner
- QR Code
- Touch Screen

Thanh toán

- Tiền mặt
- Chuyển khoản
- QR
- Ví điện tử

In hóa đơn

- Khổ K58
- Khổ K80
- A4

---

# 12. Quản lý kho

Phiếu

- Nhập
- Xuất
- Kiểm kê
- Điều chỉnh

Theo dõi

- Theo lô
- Theo hạn
- Theo vị trí

---

# 13. Quản lý xuất nhập tồn

Báo cáo

Theo

- Thuốc
- Nhóm thuốc
- Kho
- Nhà cung cấp
- Thời gian

---

# 14. Quản lý thu chi

Thu

- Bán hàng
- Thu công nợ
- Thu khác

Chi

- Nhập thuốc
- Lương
- Điện
- Nước
- Thuê mặt bằng
- Marketing
- Khác

---

# 15. Công nợ

## Khách hàng

- Nợ
- Thanh toán
- Lịch sử

## Nhà cung cấp

- Phải trả
- Đã trả

---

# 16. Báo cáo doanh thu

Theo

- Ngày
- Tuần
- Tháng
- Quý
- Năm

Theo

- Nhân viên
- Thuốc
- Nhóm thuốc
- Khách hàng

---

# 17. Báo cáo lợi nhuận

Doanh thu

-

Giá vốn

=

Lợi nhuận gộp

-

Chi phí

=

Lợi nhuận ròng

---

# 18. Báo cáo chi phí

Theo

- Lương
- Thuê mặt bằng
- Điện
- Nước
- Marketing
- Khấu hao
- Khác

---

# 19. Báo cáo tồn kho

- Tồn hiện tại
- Giá trị kho
- Thuốc hết hạn
- Thuốc cận hạn
- Thuốc bán chậm

---

# 20. Bảng cân đối kế toán

## Tài sản

- Tiền mặt
- Tiền gửi
- Công nợ phải thu
- Hàng tồn kho
- Tài sản cố định

## Nguồn vốn

- Phải trả NCC
- Vay ngân hàng
- Vốn chủ sở hữu
- Lợi nhuận chưa phân phối

---

# 21. Báo cáo tài chính

- Doanh thu
- Giá vốn
- Lợi nhuận
- Lưu chuyển tiền tệ
- Bảng cân đối kế toán

---

# 22. Nhật ký hệ thống

Lưu

- Đăng nhập
- Sửa dữ liệu
- Xóa dữ liệu
- Bán hàng
- Nhập kho
- Đồng bộ dữ liệu

---

# Đồng bộ Cloud

Offline First

Flutter

↓

Isar

↓

Sync Service

↓

REST API

↓

Neon PostgreSQL

Cho phép

- Nhiều máy tính
- Nhiều chi nhánh
- Đồng bộ tự động
- Làm việc khi mất Internet

---

# Kiến trúc

Flutter

↓

Riverpod

↓

Repository

↓

UseCase

↓

Isar

↓

Sync Engine

↓

REST API

↓

Neon PostgreSQL

---

# CSDL dự kiến

Khoảng 35–45 bảng

Ví dụ

- medicines
- medicine_categories
- medicine_batches
- prescriptions
- prescription_templates
- prescription_items
- diseases
- patients
- patient_medical_records
- customers
- suppliers
- purchases
- purchase_items
- sales
- sale_items
- inventory_transactions
- warehouses
- stock_balances
- expense_categories
- expenses
- revenues
- employees
- users
- roles
- permissions
- accounting_accounts
- journal_entries
- balance_sheet
- profit_loss
- cash_flow
- audit_logs
- sync_queue

---

# Công nghệ

Frontend

- Flutter

State Management

- Riverpod

Offline Database

- Isar

Backend

- ASP.NET Core / Node.js / Go (REST API)

Cloud Database

- Neon PostgreSQL

Authentication

- JWT
- Refresh Token

Storage

- Cloudflare R2 hoặc S3

Báo cáo

- PDF
- Excel
- In hóa đơn ESC/POS

---

# Phiên bản dự kiến

## v1.0

- POS bán thuốc
- Kho
- Nhập hàng
- Danh mục thuốc
- Khách hàng
- Nhà cung cấp

## v1.1

- Quản lý toa thuốc
- Bệnh nhân
- Kê đơn theo bệnh

## v1.2

- Báo cáo tài chính
- Lãi lỗ
- Bảng cân đối kế toán

## v1.3

- Đồng bộ Cloud
- Mobile App

## v2.0

- AI gợi ý thuốc theo triệu chứng (chỉ mang tính hỗ trợ, không thay thế tư vấn chuyên môn)
- OCR đọc toa thuốc
- Phân tích doanh thu
- Dự báo tồn kho bằng AI