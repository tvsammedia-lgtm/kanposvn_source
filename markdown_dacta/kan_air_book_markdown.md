# Đặc tả ứng dụng đặt vé máy bay – KanAirBook

## 1. Tổng quan

Ứng dụng đặt vé máy bay tương tự mô hình của các hệ thống bán vé máy bay trực tuyến như abay.vn, tập trung vào:

- Tìm kiếm chuyến bay nội địa và quốc tế.
- So sánh nhiều hãng bay, giờ bay và giá.
- Đặt vé một chiều, khứ hồi, nhiều chặng.
- Nhập thông tin hành khách.
- Giữ chỗ và quản lý trạng thái booking.
- Thanh toán trực tuyến hoặc xác nhận thanh toán thủ công.
- Quản lý vé điện tử, mã đặt chỗ và hành trình.
- Quản lý khách hàng.
- Quản lý đại lý/nhân viên bán vé.
- Quản lý hoa hồng, giá nhập, giá bán và lợi nhuận.
- Hoạt động offline với Isar và tự động đồng bộ khi có Internet.
- Backend dùng API Vercel kết nối Neon PostgreSQL.
- Có thể mở rộng thành hệ thống B2C, B2B đại lý và quản trị nội bộ.

> Lưu ý: ứng dụng không tự trở thành hệ thống xuất vé của hãng hàng không. Muốn đặt/giữ chỗ thực tế cần tích hợp API/GDS/NDC/API của nhà cung cấp vé hoặc hãng bay phù hợp.

---

## 2. Kiến trúc tổng thể

```text
Flutter Android / iOS / Windows / Web
              |
              v
        Riverpod State
              |
      +-------+-------+
      |               |
      v               v
   Isar Local      API Client
      |               |
      |          HTTPS/JSON
      |               |
      +-------+-------+
              |
              v
       Vercel API / Serverless
              |
      +-------+-------+
      |               |
      v               v
 Neon PostgreSQL   External Flight API
      |               |
      |               +--> Airline / GDS / NDC
      |
      +--> Users / Booking / Payment
      +--> Sync / Audit / Reports
```

### Nguyên tắc

- Isar là local-first database.
- Flutter ưu tiên đọc dữ liệu từ Isar để giao diện nhanh.
- Vercel API là lớp trung gian duy nhất giữa Flutter và Neon.
- Không đưa Neon connection string hoặc secret vào APK.
- Neon PostgreSQL là nguồn dữ liệu cloud trung tâm.
- Mọi request quan trọng phải xác thực token.
- Các thao tác đặt vé phải có transaction/idempotency.
- Đồng bộ dữ liệu sử dụng `created_at`, `updated_at`, `deleted_at`, `sync_status`, `version`.

---

# 3. Công nghệ

## Mobile/Desktop

- Flutter
- Dart
- Riverpod
- Isar
- Dio hoặc HTTP
- GoRouter
- Intl
- PDF
- QR Code
- Secure Storage
- Connectivity Plus
- UUID
- Image Picker
- File Picker

## Backend

- Vercel
- API Routes / Serverless Functions
- Node.js hoặc TypeScript
- Neon PostgreSQL
- JWT hoặc access token
- REST API JSON

## Dữ liệu

```text
Local:
Flutter -> Isar

Cloud:
Flutter -> Vercel API -> Neon PostgreSQL
```

---

# 4. Phân quyền

## 4.1 Customer

- Đăng ký/đăng nhập.
- Tìm chuyến bay.
- Đặt vé.
- Thanh toán.
- Xem booking.
- Xem vé.
- Quản lý hành khách.
- Quản lý thông tin cá nhân.

## 4.2 Sales

- Tìm chuyến bay.
- Tạo booking cho khách.
- Quản lý booking.
- Thu tiền.
- In/xuất vé.
- Theo dõi công nợ.
- Quản lý khách hàng.

## 4.3 Manager

- Quản lý nhân viên.
- Quản lý đại lý.
- Quản lý giá bán.
- Quản lý hoa hồng.
- Quản lý booking.
- Xem doanh thu.
- Xem lợi nhuận.
- Quản lý chính sách giá.

## 4.4 Admin

- Quản lý toàn hệ thống.
- Quản lý user.
- Quản lý role.
- Quản lý airline/provider.
- Quản lý API provider.
- Quản lý cấu hình.
- Audit log.
- Đồng bộ dữ liệu.
- Báo cáo tổng hợp.

---

# 5. Chức năng chính

## 5.1 Trang chủ

Hiển thị:

- Điểm đi.
- Điểm đến.
- Ngày đi.
- Ngày về.
- Số hành khách.
- Hạng ghế.
- Loại chuyến:
  - Một chiều.
  - Khứ hồi.
  - Nhiều chặng.

Các mục nhanh:

- Booking của tôi.
- Vé của tôi.
- Hành khách.
- Khuyến mãi.
- Hỗ trợ.

---

# 6. Tìm kiếm chuyến bay

## Input

```text
origin
destination
departure_date
return_date
trip_type
adults
children
infants
cabin_class
```

## Kết quả

Mỗi flight option:

```text
flight_id
airline
flight_number
origin
destination
departure_time
arrival_time
duration
stops
cabin
baggage
base_fare
tax
fee
total_price
currency
availability
```

## Bộ lọc

- Hãng bay.
- Giá.
- Giờ khởi hành.
- Giờ đến.
- Số điểm dừng.
- Thời gian bay.
- Hành lý.
- Hạng ghế.

## Sắp xếp

- Giá thấp nhất.
- Giá cao nhất.
- Khởi hành sớm.
- Khởi hành muộn.
- Thời gian bay ngắn nhất.

---

# 7. Flight Provider

Thiết kế abstraction để có thể tích hợp nhiều nguồn vé.

```dart
abstract class FlightProvider {
  Future<List<FlightOffer>> searchFlights(
    FlightSearchRequest request,
  );

  Future<FlightAvailability> checkAvailability(
    String flightId,
  );

  Future<BookingResult> createBooking(
    BookingRequest request,
  );

  Future<BookingDetail> getBooking(
    String providerBookingId,
  );

  Future<bool> cancelBooking(
    String providerBookingId,
  );
}
```

Có thể triển khai:

```text
AirlineProvider
GdsProvider
NdcProvider
ConsolidatorProvider
MockFlightProvider
```

`MockFlightProvider` dùng cho development/test trước khi kết nối API vé thật.

---

# 8. Quy trình đặt vé

```text
Tìm chuyến
   |
   v
Chọn chuyến
   |
   v
Kiểm tra giá/ghế
   |
   v
Nhập hành khách
   |
   v
Nhập thông tin liên hệ
   |
   v
Xác nhận giá
   |
   v
Create Booking
   |
   v
Thanh toán
   |
   v
Provider xác nhận
   |
   v
Xuất vé / E-ticket
```

## Trạng thái booking

```text
DRAFT
PENDING
HELD
PAYMENT_PENDING
PAID
CONFIRMED
TICKETED
CANCEL_REQUESTED
CANCELLED
EXPIRED
FAILED
REFUNDED
```

---

# 9. Passenger

Thông tin:

```text
id
booking_id
passenger_type
title
first_name
middle_name
last_name
gender
date_of_birth
nationality
passport_number
passport_expiry
identity_number
phone
email
frequent_flyer_number
```

Loại:

```text
ADT
CHD
INF
```

Không lưu dữ liệu thẻ ngân hàng/CVV trong database.

---

# 10. Booking

```text
id
booking_code
user_id
customer_id
provider
provider_booking_id
status
trip_type
currency
base_amount
tax_amount
service_fee
discount_amount
total_amount
paid_amount
remaining_amount
created_at
updated_at
expires_at
version
sync_status
deleted_at
```

## PNR

Hệ thống phải hỗ trợ:

```text
internal_booking_code
provider_booking_code
pnr
ticket_number
```

---

# 11. Flight Segment

```text
id
booking_id
flight_id
airline_code
flight_number
origin
destination
departure_time
arrival_time
duration
cabin_class
booking_class
baggage_allowance
seat
status
```

---

# 12. Giá vé

Tách rõ:

```text
supplier_price
base_fare
tax
airport_fee
service_fee
discount
commission
selling_price
profit
```

Công thức:

```text
selling_price =
supplier_price
+ service_fee
+ markup
- discount
```

Lợi nhuận:

```text
profit =
selling_price
- supplier_price
- commission_cost
- payment_fee
```

Không tin giá cũ từ client khi tạo booking. Server phải xác nhận lại giá với provider.

---

# 13. Payment

Hỗ trợ:

- Chuyển khoản.
- Tiền mặt.
- Ví điện tử.
- Payment gateway.
- Thanh toán một phần.
- Hoàn tiền.

Payment:

```text
id
booking_id
payment_code
method
amount
currency
status
provider
provider_transaction_id
paid_at
created_at
updated_at
```

Status:

```text
PENDING
PROCESSING
SUCCESS
FAILED
CANCELLED
REFUNDED
PARTIAL_REFUND
```

---

# 14. Vé điện tử

Sau khi booking được xác nhận:

```text
booking_code
PNR
ticket_number
passenger
flight
route
departure
arrival
seat
baggage
fare
payment
```

Có thể:

- Xem vé trên app.
- Xuất PDF.
- Chia sẻ PDF.
- In vé.
- Tạo QR code.
- Gửi email.

QR chỉ nên chứa mã vé/booking token cần thiết, không chứa dữ liệu nhạy cảm.

---

# 15. Isar Local Database

Các collection chính:

```text
UserLocal
CustomerLocal
PassengerLocal
AirportLocal
AirlineLocal
FlightLocal
FlightOfferLocal
BookingLocal
BookingPassengerLocal
FlightSegmentLocal
PaymentLocal
TicketLocal
PromotionLocal
NotificationLocal
SyncQueueLocal
SyncMetadataLocal
```

---

# 16. Mẫu Isar model

```dart
@collection
class BookingLocal {
  Id id = Isar.autoIncrement;

  late String uuid;
  late String bookingCode;

  String? userId;
  String? providerBookingId;

  late String status;
  late double totalAmount;
  double paidAmount = 0;
  double remainingAmount = 0;

  DateTime? expiresAt;

  late DateTime createdAt;
  late DateTime updatedAt;

  int version = 1;

  bool isDeleted = false;
  bool needsSync = false;
}
```

Mỗi record nên có:

```text
uuid
created_at
updated_at
version
is_deleted
needs_sync
```

---

# 17. Sync Architecture

## Offline-first

Khi không có Internet:

```text
Flutter
  |
  v
Isar
  |
  v
Sync Queue
```

Khi có Internet:

```text
Sync Queue
   |
   v
Vercel API
   |
   v
Neon
```

Sau đó:

```text
Neon
 |
 v
Vercel
 |
 v
Flutter
 |
 v
Isar
```

---

# 18. Sync Queue

```text
id
uuid
entity
entity_id
operation
payload
created_at
retry_count
last_error
status
```

Operation:

```text
CREATE
UPDATE
DELETE
```

Status:

```text
PENDING
PROCESSING
SUCCESS
FAILED
```

Retry:

```text
1 phút
5 phút
15 phút
30 phút
1 giờ
```

Sau nhiều lần lỗi:

```text
DEAD_LETTER
```

để admin kiểm tra.

---

# 19. Sync API

## Push

```http
POST /api/sync/push
Authorization: Bearer <token>
```

Request:

```json
{
  "device_id": "device-001",
  "last_sync_at": "2026-08-13T00:00:00Z",
  "changes": [
    {
      "entity": "booking",
      "operation": "UPDATE",
      "uuid": "booking-uuid",
      "version": 3,
      "data": {}
    }
  ]
}
```

## Pull

```http
POST /api/sync/pull
Authorization: Bearer <token>
```

Response:

```json
{
  "server_time": "2026-08-13T00:00:00Z",
  "changes": [],
  "next_cursor": "..."
}
```

Không nên tải toàn bộ database mỗi lần đồng bộ.

---

# 20. Conflict Resolution

Ưu tiên:

```text
Server authoritative
```

Quy tắc:

```text
version thấp -> từ chối
version cao -> cập nhật
version bằng nhau -> kiểm tra updated_at
```

Booking, payment và ticket không cho client tự ghi đè tùy ý.

Các nghiệp vụ quan trọng phải xử lý transaction tại server.

---

# 21. Neon PostgreSQL

## Bảng chính

```text
users
roles
permissions
user_roles

customers
passengers

airlines
airports
aircrafts

flight_searches
flight_offers
flight_segments

bookings
booking_passengers
booking_segments

tickets
payments
refunds

promotions
coupons

agents
agent_commissions

sync_devices
sync_changes
audit_logs

notifications
system_settings
```

---

# 22. users

```sql
CREATE TABLE users (
    id UUID PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(30) UNIQUE,
    password_hash TEXT,
    full_name VARCHAR(255),
    status VARCHAR(30) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL
);
```

Không lưu password dạng plain text.

---

# 23. bookings

```sql
CREATE TABLE bookings (
    id UUID PRIMARY KEY,
    booking_code VARCHAR(50) UNIQUE NOT NULL,
    user_id UUID,
    provider VARCHAR(100),
    provider_booking_id VARCHAR(255),
    pnr VARCHAR(100),
    status VARCHAR(50) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    supplier_amount NUMERIC(18,2) DEFAULT 0,
    base_amount NUMERIC(18,2) DEFAULT 0,
    tax_amount NUMERIC(18,2) DEFAULT 0,
    service_fee NUMERIC(18,2) DEFAULT 0,
    discount_amount NUMERIC(18,2) DEFAULT 0,
    total_amount NUMERIC(18,2) DEFAULT 0,
    paid_amount NUMERIC(18,2) DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    version INTEGER NOT NULL DEFAULT 1
);
```

---

# 24. Vercel API

Cấu trúc:

```text
/api
  /auth
    login
    register
    refresh
    logout

  /airports
  /airlines

  /flights
    search
    availability
    price

  /bookings
    create
    detail
    cancel
    confirm

  /payments
    create
    callback
    status
    refund

  /tickets
    detail
    pdf

  /customers
  /passengers

  /promotions

  /sync
    push
    pull

  /admin
    users
    bookings
    reports
```

---

# 25. API Security

Không đưa vào Flutter:

```text
NEON_DATABASE_URL
JWT_SECRET
PAYMENT_SECRET
AIRLINE_API_SECRET
GDS_API_SECRET
```

Các secret phải nằm trong Vercel Environment Variables.

Flutter chỉ gọi:

```text
https://your-api.vercel.app/api/...
```

---

# 26. Authentication

Có thể dùng:

```text
Access Token
Refresh Token
```

Flow:

```text
Login
  |
  v
Vercel
  |
  v
Access Token + Refresh Token
  |
  v
Flutter Secure Storage
```

Access token ngắn hạn.

Refresh token dài hơn và có cơ chế revoke.

---

# 27. Idempotency

Các API quan trọng:

```text
POST /bookings
POST /payments
POST /tickets
POST /refunds
```

phải hỗ trợ:

```http
Idempotency-Key: <uuid>
```

Nếu client gửi lại request do timeout, server không được tạo booking/payment thứ hai.

---

# 28. Search Cache

Tìm chuyến bay có thể trả dữ liệu từ provider và cache tạm.

```text
search_hash
origin
destination
departure_date
return_date
passengers
cabin
provider
result
expires_at
```

Không sử dụng cache giá vé quá lâu.

Trước khi thanh toán phải:

```text
Reprice
Recheck availability
```

---

# 29. Màn hình Flutter

## Customer

```text
01 Splash
02 Login
03 Register
04 Home
05 Search Flight
06 Flight Results
07 Flight Detail
08 Passenger
09 Contact Information
10 Price Summary
11 Payment
12 Booking Success
13 My Bookings
14 Booking Detail
15 E-ticket
16 Passenger Management
17 Profile
18 Notifications
19 Support
```

## Sales/Manager

```text
01 Dashboard
02 Flight Search
03 New Booking
04 Booking List
05 Booking Detail
06 Customers
07 Passengers
08 Payments
09 Tickets
10 Commission
11 Revenue
12 Profit
13 Reports
14 Settings
```

## Admin

```text
Dashboard
Users
Roles
Airlines
Airports
Providers
Bookings
Payments
Refunds
Agents
Commission
Promotions
Sync Monitor
Audit Log
System Settings
```

---

# 30. Dashboard

## Customer

```text
Booking đang xử lý
Booking đã xác nhận
Vé sắp bay
```

## Manager

```text
Doanh thu hôm nay
Doanh thu tháng
Số booking
Số vé
Đã thanh toán
Công nợ
Lợi nhuận
```

## Admin

```text
Total Users
Total Bookings
Total Tickets
Total Revenue
Total Payment
Total Refund
Total Profit
Failed Booking
Failed Payment
Sync Error
```

---

# 31. Notification

Thông báo:

```text
Booking created
Payment pending
Payment success
Booking confirmed
Ticket issued
Flight changed
Flight cancelled
Refund completed
Booking expired
```

Có thể mở rộng:

```text
Firebase Cloud Messaging
Email
SMS
Zalo OA
```

---

# 32. Khuyến mãi

Bảng:

```text
promotions
coupons
coupon_usages
```

Hỗ trợ:

- Giảm theo %.
- Giảm số tiền.
- Giảm theo hãng bay.
- Giảm theo tuyến.
- Giảm theo thời gian.
- Mã voucher.
- Giới hạn số lần sử dụng.

---

# 33. Đại lý bán vé

Mở rộng B2B:

```text
agent
agent_user
agent_wallet
agent_credit_limit
agent_commission
agent_booking
agent_invoice
```

Có thể cho đại lý:

```text
Nạp tiền
Mua vé
Công nợ
Hạn mức tín dụng
Hoa hồng
Báo cáo
```

---

# 34. Công nợ

```text
customer_debt
agent_debt
payment
receipt
refund
```

Dashboard:

```text
Tổng phải thu
Đã thu
Còn nợ
Quá hạn
```

---

# 35. Báo cáo

## Doanh thu

```text
Theo ngày
Theo tháng
Theo năm
Theo nhân viên
Theo đại lý
Theo hãng
Theo tuyến
```

## Lợi nhuận

```text
Giá nhập
Giá bán
Phí
Hoa hồng
Lợi nhuận
```

## Booking

```text
Pending
Confirmed
Ticketed
Cancelled
Refunded
Expired
```

---

# 36. Audit Log

Các thao tác quan trọng:

```text
LOGIN
CREATE_BOOKING
UPDATE_BOOKING
CANCEL_BOOKING
PAYMENT
REFUND
ISSUE_TICKET
CHANGE_PRICE
CHANGE_ROLE
DELETE_USER
```

Lưu:

```text
user_id
action
entity
entity_id
old_value
new_value
ip
device
created_at
```

---

# 37. Offline Mode

Offline cho phép:

- Xem booking đã tải về.
- Xem hành khách.
- Xem vé đã lưu.
- Xem lịch sử giao dịch.
- Nhập dữ liệu nháp.

Không nên cho offline xác nhận:

```text
Thanh toán
Xuất vé thật
Giữ chỗ thật
Huỷ booking thật
```

Các nghiệp vụ cần provider phải online.

---

# 38. Đồng bộ tự động

Khi app mở:

```text
1. Kiểm tra Internet
2. Pull server changes
3. Update Isar
4. Push local pending changes
5. Pull lại changes
6. Update sync cursor
```

Khi app đang chạy:

```text
Sync mỗi 1-5 phút
```

Khi mạng trở lại:

```text
Connectivity event
       |
       v
Trigger Sync
```

---

# 39. Đồng bộ nhiều thiết bị

Ví dụ:

```text
Điện thoại A
     |
     v
   Vercel
     |
     v
   Neon
     |
     v
Điện thoại B
```

Nếu user đăng nhập cùng tài khoản trên máy B:

```text
Login
 -> Pull booking
 -> Pull passenger
 -> Pull ticket
 -> Save Isar
```

Do đó dữ liệu cloud có thể xuất hiện trên thiết bị mới.

---

# 40. Không đồng bộ dữ liệu không cần thiết

Không nên đồng bộ:

```text
Flight search cache quá cũ
Temporary provider response
Expired session
Large PDF nếu không cần
```

Có thể lưu file PDF trên object storage và database chỉ lưu URL/reference.

---

# 41. File Storage

Có thể dùng:

```text
Vercel-compatible Object Storage
S3-compatible storage
Cloudinary
```

Lưu:

```text
ticket PDF
passport document nếu nghiệp vụ bắt buộc
invoice
payment receipt
```

Không lưu binary lớn trực tiếp trong Neon nếu không cần thiết.

---

# 42. UX

Ưu tiên:

- Search nhanh.
- Loading skeleton.
- Filter realtime.
- Hiển thị tổng giá rõ ràng.
- Không gây nhầm giữa giá/người và tổng giá.
- Hiển thị điều kiện hoàn/đổi.
- Hiển thị hành lý.
- Hiển thị thời gian bay.
- Hiển thị múi giờ đối với chuyến quốc tế.
- Xác nhận lại giá trước thanh toán.

---

# 43. Đa tiền tệ

Hỗ trợ:

```text
VND
USD
EUR
JPY
KRW
SGD
THB
```

Không lưu số tiền dưới dạng `double` ở backend.

Dùng:

```text
NUMERIC(18,2)
```

Flutter nên sử dụng Decimal/chuỗi số tiền khi xử lý nghiệp vụ tài chính quan trọng.

---

# 44. Đa ngôn ngữ

```text
vi
en
ja
ko
zh
```

Tất cả text giao diện đưa vào localization.

---

# 45. Luồng xử lý booking chuẩn

```text
Customer
   |
   v
Search
   |
   v
Flight Provider
   |
   v
Flight Offers
   |
   v
Customer chọn chuyến
   |
   v
Price Check
   |
   v
Passenger
   |
   v
Create Booking
   |
   v
Hold/Reserve
   |
   v
Payment
   |
   v
Provider Confirm
   |
   v
Issue Ticket
   |
   v
Save Ticket
   |
   v
Notification
```

---

# 46. Xử lý timeout

Ví dụ:

```text
Flutter -> Vercel -> Provider
```

Nếu provider timeout:

```text
Booking = PENDING_PROVIDER
```

Không tạo booking thứ hai ngay.

Server kiểm tra:

```text
idempotency_key
provider_reference
booking_code
```

Sau đó reconcile trạng thái.

---

# 47. Transaction

Các thao tác:

```text
Create Booking
Create Booking Passenger
Create Segment
Create Payment
Update Balance
```

phải được transaction ở Neon khi cần.

Ví dụ:

```text
BEGIN

insert booking
insert passengers
insert segments
insert payment

COMMIT
```

Nếu lỗi:

```text
ROLLBACK
```

---

# 48. Database Index

Các index quan trọng:

```text
users.email
users.phone

bookings.booking_code
bookings.user_id
bookings.status
bookings.created_at

payments.booking_id
payments.status

tickets.ticket_number

flight_offers.search_hash
flight_offers.departure_date
flight_offers.origin
flight_offers.destination

sync_changes.entity
sync_changes.updated_at
```

---

# 49. API Response chuẩn

```json
{
  "success": true,
  "data": {},
  "message": null,
  "error": null,
  "request_id": "uuid",
  "server_time": "2026-08-13T00:00:00Z"
}
```

Error:

```json
{
  "success": false,
  "data": null,
  "message": "Booking has expired",
  "error": {
    "code": "BOOKING_EXPIRED"
  },
  "request_id": "uuid"
}
```

---

# 50. Flutter Project Structure

```text
lib/
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme.dart
│
├── core/
│   ├── api/
│   ├── auth/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── storage/
│   ├── sync/
│   └── utils/
│
├── data/
│   ├── local/
│   │   ├── isar/
│   │   └── repositories/
│   │
│   ├── remote/
│   │   ├── api/
│   │   └── dto/
│   │
│   └── models/
│
├── features/
│   ├── auth/
│   ├── home/
│   ├── flights/
│   ├── passengers/
│   ├── bookings/
│   ├── payments/
│   ├── tickets/
│   ├── customers/
│   ├── promotions/
│   ├── reports/
│   └── settings/
│
└── main.dart
```

---

# 51. Backend Project Structure

```text
api/
├── auth/
├── flights/
├── bookings/
├── payments/
├── tickets/
├── customers/
├── sync/
├── admin/
├── reports/
├── providers/
├── middleware/
├── database/
├── security/
└── utils/
```

---

# 52. Provider Interface

Backend cũng nên abstraction:

```typescript
interface FlightProvider {
  searchFlights(request: FlightSearchRequest): Promise<FlightOffer[]>;
  priceCheck(request: PriceCheckRequest): Promise<PriceCheckResult>;
  createBooking(request: CreateBookingRequest): Promise<ProviderBooking>;
  getBooking(providerBookingId: string): Promise<ProviderBooking>;
  cancelBooking(providerBookingId: string): Promise<CancelResult>;
  issueTicket(providerBookingId: string): Promise<TicketResult>;
}
```

Nhờ vậy có thể thay provider mà không phải viết lại Flutter.

---

# 53. Testing

## Flutter

```text
Unit Test
Repository Test
Riverpod Test
Widget Test
Integration Test
Isar Test
Sync Test
```

## Backend

```text
API Test
Authentication Test
Booking Test
Payment Test
Idempotency Test
Concurrency Test
Sync Test
Provider Mock Test
```

## Quan trọng

Test:

```text
2 thiết bị cùng sửa booking
2 request tạo booking giống nhau
Payment callback gửi 2 lần
Mạng mất giữa lúc booking
Mạng mất sau khi payment thành công
Provider timeout
Provider trả giá thay đổi
Booking hết hạn
```

---

# 54. Bảo mật

Bắt buộc:

- HTTPS.
- JWT/secure session.
- Password hashing.
- Rate limit.
- Input validation.
- SQL parameterization.
- RBAC.
- Audit log.
- Idempotency.
- Secret trên Vercel.
- Không lưu card CVV.
- Không đưa API secret vào APK.
- Không tin giá từ client.
- Kiểm tra quyền trên server.

---

# 55. Chống gian lận giá

Client gửi:

```text
flight_id
selected_offer_id
```

Server lấy lại:

```text
provider
supplier_price
tax
availability
```

Server tính:

```text
final_price
```

Client không được gửi:

```text
total_amount = 100000
```

và yêu cầu server tin giá đó.

---

# 56. Performance

## Flutter

- Isar query local.
- Pagination.
- Debounce search.
- Cache airport/airline.
- Không rebuild toàn màn hình.
- Riverpod providers nhỏ.
- Lazy loading.

## Vercel

- API stateless.
- Connection pooling tới Neon.
- Cache dữ liệu tĩnh.
- Timeout provider.
- Retry có kiểm soát.

## Neon

- Index đúng.
- Không SELECT * lớn.
- Pagination.
- Archive audit/log cũ.
- Connection pooling.

---

# 57. MVP Phase 1

Ưu tiên xây:

```text
1. Login/Register
2. Home
3. Search Flight
4. Flight Result
5. Flight Detail
6. Passenger
7. Booking
8. Payment mock
9. Ticket
10. My Booking
11. Isar
12. Vercel API
13. Neon
14. Sync
15. Admin cơ bản
```

Dùng:

```text
MockFlightProvider
```

để hoàn thiện toàn bộ app trước.

---

# 58. Phase 2

```text
1. Provider thật
2. Payment gateway
3. Email
4. Notification
5. Voucher
6. Agent
7. Commission
8. Debt
9. Revenue
10. Profit
11. PDF invoice
```

---

# 59. Phase 3

```text
1. B2B
2. Multi-agent
3. Wallet
4. Credit limit
5. Dynamic markup
6. Multiple flight providers
7. International flight
8. Multi-currency
9. Multi-language
10. AI travel assistant
```

---

# 60. AI Assistant

Có thể thêm AI:

```text
"Đi Đà Nẵng từ Hà Nội ngày 20/9, 2 người,
muốn chuyến sáng và có 20kg hành lý."
```

AI chuyển thành:

```json
{
  "origin": "HAN",
  "destination": "DAD",
  "departure_date": "2026-09-20",
  "adults": 2,
  "preferred_departure": "morning",
  "baggage": "20kg"
}
```

AI không tự quyết định giá hoặc xác nhận thanh toán.

---

# 61. Luồng dữ liệu hoàn chỉnh

```text
                  +----------------+
                  |    Flutter     |
                  | Android/iOS/PC |
                  +-------+--------+
                          |
                +---------+---------+
                |                   |
              Isar             Vercel API
                |                   |
          Offline data        Auth / Business
                |                   |
                |             +-----+------+
                |             |            |
                |           Neon       Flight Provider
                |             |            |
                +-------------+------------+
                              |
                         Sync / Booking
```

---

# 62. Nguyên tắc quan trọng nhất

### Local-first

Isar chịu trách nhiệm trải nghiệm offline và cache nghiệp vụ.

### Cloud-authoritative

Neon là dữ liệu cloud trung tâm.

### Server-authoritative

Vercel kiểm tra:

- Giá.
- Quyền.
- Booking.
- Payment.
- Provider.
- Trạng thái vé.

### Provider-authoritative

Nguồn vé thực tế quyết định:

- Availability.
- Fare.
- PNR.
- Ticket.
- Cancellation.

### Không để Flutter truy cập Neon trực tiếp

Luôn:

```text
Flutter
  ↓
Vercel API
  ↓
Neon
```

---

# 63. Checklist triển khai

- [ ] Tạo Flutter project.
- [ ] Cấu hình Riverpod.
- [ ] Cấu hình Isar.
- [ ] Tạo local models.
- [ ] Tạo repository.
- [ ] Tạo API client.
- [ ] Tạo authentication.
- [ ] Tạo Vercel API.
- [ ] Tạo Neon database.
- [ ] Migration database.
- [ ] Tạo FlightProvider interface.
- [ ] Tạo MockFlightProvider.
- [ ] Tạo search flight.
- [ ] Tạo booking.
- [ ] Tạo payment mock.
- [ ] Tạo ticket.
- [ ] Tạo sync engine.
- [ ] Tạo admin.
- [ ] Tạo audit log.
- [ ] Tạo test.
- [ ] Tích hợp provider vé thật.
- [ ] Tích hợp payment thật.
- [ ] Kiểm thử production.
- [ ] Build APK/Windows/iOS.
- [ ] Thiết lập monitoring.
- [ ] Backup Neon.
- [ ] Thiết lập Vercel Environment Variables.

---

# 64. Kết luận

Kiến trúc đề xuất cho ứng dụng đặt vé máy bay:

```text
Flutter
+
Isar
+
Riverpod
+
Vercel API
+
Neon PostgreSQL
+
Flight Provider API
+
Payment Gateway
```

Mô hình này phù hợp để phát triển từ:

```text
MVP bán vé
        ↓
Website/App B2C
        ↓
Đại lý B2B
        ↓
Hệ thống quản lý đại lý
        ↓
Multi-provider flight booking platform
```

Điểm quan trọng là tách rõ 4 lớp:

```text
Flutter UI
    ↓
Local Isar
    ↓
Vercel Business API
    ↓
Neon + Flight/Payment Providers
```

Nhờ đó app vẫn chạy nhanh khi offline, dữ liệu được đồng bộ giữa nhiều thiết bị, backend kiểm soát nghiệp vụ và có thể thay đổi nhà cung cấp vé mà không phải viết lại toàn bộ Flutter app.
