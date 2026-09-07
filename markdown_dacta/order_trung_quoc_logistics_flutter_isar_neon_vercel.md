Đặc tả kỹ thuật ứng dụng quản lý Order Trung Quốc – Vận chuyển – Theo dõi xe thời gian thực

1. Mục tiêu

Xây dựng ứng dụng Flutter đa nền tảng (Android/Windows, có thể mở rộng Web/iOS) để quản lý toàn bộ quy trình:

Nhận và quản lý đơn hàng/order từ Trung Quốc.

Quản lý khách hàng, nhân viên, tài xế/xe và đối tác vận chuyển.

Nhân viên và khách hàng đều có tài khoản đăng nhập.

Khách hàng theo dõi trạng thái đơn hàng của chính mình.

Theo dõi vị trí xe đang vận chuyển trên bản đồ.

Cập nhật giờ đi, giờ đến dự kiến (ETA), giờ đến thực tế theo thời gian thực.

Hoạt động Offline-first bằng Isar.

Đồng bộ dữ liệu với Neon PostgreSQL thông qua API triển khai trên Vercel.

Có nhật ký trạng thái, lịch sử vị trí và lịch sử thao tác.

Có phân quyền chặt chẽ giữa Admin, nhân viên, tài xế và khách hàng.

2. Kiến trúc tổng thể

                  ┌──────────────────────┐
                  │      Flutter App     │
                  │ Android / Windows    │
                  └──────────┬───────────┘
                             │
                    Local Offline-first
                             │
                    ┌────────▼────────┐
                    │      Isar       │
                    │ Local Database  │
                    └────────┬────────┘
                             │
                    Sync Queue / Outbox
                             │ HTTPS/JSON
                             ▼
                 ┌───────────────────────┐
                 │     Vercel API        │
                 │ Auth / CRUD / Sync    │
                 │ Tracking / WebSocket* │
                 └───────────┬───────────┘
                             │
                    SQL / Transaction
                             ▼
                 ┌───────────────────────┐
                 │    Neon PostgreSQL    │
                 │ Cloud Source of Truth │
                 └───────────────────────┘

        GPS Driver
             │
             ▼
       Location API
             │
             ▼
      Vercel Tracking API
             │
       ┌─────┴─────┐
       ▼           ▼
   Admin Map    Customer Map

Vercel API là lớp Backend/API. Cơ chế realtime nên thiết kế theo WebSocket/SSE hoặc dịch vụ realtime phù hợp; không nên phụ thuộc vào polling quá dày.

3. Công nghệ

Frontend

Flutter

Dart 3.x

Riverpod

GoRouter

Isar

Dio hoặc http

freezed/json_serializable nếu muốn

intl

connectivity_plus

geolocator

permission_handler

flutter_map hoặc Google Maps

cached_network_image

mobile_scanner

qr_flutter

fl_chart

pdf

printing

Local Database

Isar

Offline-first

Outbox Queue

Sync Queue

Soft Delete

UUID cho ID nghiệp vụ

Backend

Vercel

REST API

TypeScript/Node.js hoặc framework tương thích

JWT/refresh token

RBAC

Rate limit

Validation

API versioning

Database

Neon PostgreSQL

Transaction

Index

Foreign Key

Audit Log

Row-level authorization ở tầng API/service

4. Đối tượng người dùng

4.1 Admin

Quản lý toàn hệ thống:

Khách hàng

Nhân viên

Tài xế

Xe

Đơn hàng

Kho

Tuyến vận chuyển

Trạng thái đơn

Bảng giá

Công nợ

Theo dõi GPS

Báo cáo

4.2 Nhân viên

Tạo order

Nhập đơn hàng Trung Quốc

Cập nhật trạng thái

Nhập cân nặng/thể tích

Gán xe/chuyến

Xác nhận hàng

Quản lý khách hàng

Theo dõi GPS

4.3 Tài xế

Đăng nhập tài khoản tài xế

Xem chuyến được giao

Xem danh sách đơn trên xe

Bấm "Bắt đầu chuyến"

Bật/tắt chia sẻ vị trí

Cập nhật trạng thái chuyến

Báo giờ xuất phát

Báo giờ đến

Báo sự cố

Chụp ảnh biên bản/giao hàng

4.4 Khách hàng

Đăng nhập

Xem đơn của mình

Tra cứu mã order

Xem trạng thái

Xem lịch sử vận chuyển

Xem vị trí xe nếu được phép

Xem ETA

Nhận thông báo

Xem công nợ/thanh toán

Xem lịch sử đơn hàng

5. Phân quyền

ADMIN
 ├── USERS
 ├── CUSTOMERS
 ├── STAFF
 ├── DRIVERS
 ├── VEHICLES
 ├── ORDERS
 ├── TRIPS
 ├── GPS
 ├── REPORTS
 └── SYSTEM

STAFF
 ├── ORDERS
 ├── CUSTOMERS
 ├── TRIPS
 └── TRACKING

DRIVER
 ├── MY_TRIPS
 ├── MY_ORDERS
 ├── GPS
 └── INCIDENTS

CUSTOMER
 ├── MY_ORDERS
 ├── MY_TRACKING
 ├── MY_PAYMENT
 └── NOTIFICATIONS

Khách hàng tuyệt đối không được gọi API để xem order của khách hàng khác.

6. Mã định danh

Mỗi đối tượng sử dụng UUID:

user_id
customer_id
employee_id
driver_id
vehicle_id
order_id
order_item_id
trip_id
shipment_id
tracking_id
location_id
payment_id
notification_id

Ngoài UUID nên có mã nghiệp vụ dễ đọc:

ORD-20260907-000001
CUS-000001
TRIP-20260907-0001
VEH-001

7. Quy trình Order Trung Quốc

7.1 Tạo Order

Thông tin:

Mã order

Mã khách hàng

Tên người nhận

Số điện thoại

Địa chỉ

Link sản phẩm

Tên sản phẩm

SKU

Số lượng

Giá CNY

Tỷ giá

Phí mua hộ

Phí vận chuyển Trung Quốc

Phí vận chuyển Việt Nam

Phí đóng gói

Phí kiểm hàng

Cân nặng

Thể tích

Ghi chú

7.2 Trạng thái Order

DRAFT
        ↓
PENDING_CONFIRM
        ↓
CONFIRMED
        ↓
ORDERED_CN
        ↓
SELLER_SHIPPED
        ↓
CN_WAREHOUSE
        ↓
CHECKING
        ↓
PACKED
        ↓
WAITING_EXPORT
        ↓
ON_TRUCK
        ↓
BORDER
        ↓
VN_WAREHOUSE
        ↓
DELIVERING
        ↓
DELIVERED
        ↓
COMPLETED

Trạng thái ngoại lệ:

CANCELLED
LOST
DAMAGED
RETURNED
PROBLEM

8. Order Item

Mỗi order có thể có nhiều sản phẩm.

Order
 ├── Item 1
 ├── Item 2
 ├── Item 3
 └── Item N

OrderItem:

product_name

sku

variant

quantity

unit_price_cny

exchange_rate

amount_vnd

weight

volume

warehouse_code

tracking_number_cn

seller_name

product_url

image_url

note

9. Theo dõi vận chuyển

9.1 Shipment

Một Order có thể có một hoặc nhiều Shipment.

Order
 ├── Shipment A
 └── Shipment B

Trường dữ liệu:

shipment_id
order_id
tracking_number
origin
destination
carrier
vehicle_id
trip_id
status
estimated_departure
actual_departure
estimated_arrival
actual_arrival
created_at
updated_at

10. Chuyến xe

Trip là chuyến vận chuyển thực tế.

Trip
 ├── Vehicle
 ├── Driver
 ├── Orders
 ├── Route
 └── GPS Track

Thông tin:

trip_id
trip_code
vehicle_id
driver_id
origin
destination
planned_departure
actual_departure
planned_arrival
estimated_arrival
actual_arrival
status
current_latitude
current_longitude
current_speed
current_heading
last_location_at

Trạng thái:

PLANNED
READY
DEPARTED
IN_TRANSIT
STOPPED
ARRIVED
COMPLETED
CANCELLED

11. GPS Tracking thời gian thực

11.1 Tài xế

Ứng dụng tài xế lấy GPS:

latitude
longitude
accuracy
speed
heading
altitude
battery
timestamp

Chu kỳ đề xuất:

Xe đang chạy: 5–15 giây/lần.

Xe dừng: 30–60 giây/lần.

Có thể cấu hình theo loại xe/chuyến.

Không gửi GPS liên tục nếu app đang ở background mà chưa được cấp quyền thích hợp.

11.2 Location Record

location_id
trip_id
vehicle_id
driver_id
latitude
longitude
accuracy
speed
heading
battery_level
recorded_at
server_received_at

Không nên tải toàn bộ lịch sử GPS về điện thoại khách hàng.

Khách hàng chỉ nhận:

current_location
last_updated
ETA
route_status

12. Bản đồ

Màn hình Admin Map

Hiển thị:

┌─────────────────────────────────────────┐
│ 🔍 Tìm xe / mã chuyến                   │
├─────────────────────────────────────────┤
│                                         │
│             🚌 VEH-001                  │
│                 ↓                       │
│          🚌 VEH-002                     │
│                                         │
│       ───── tuyến đường ─────            │
│                                         │
├─────────────────────────────────────────┤
│ Xe đang chạy: 12                        │
│ Đang dừng: 3                            │
│ Đã đến: 8                               │
└─────────────────────────────────────────┘

Chức năng:

Xem tất cả xe

Lọc theo tuyến

Lọc theo trạng thái

Click xe

Xem tài xế

Xem danh sách order

Xem tốc độ

Xem hướng di chuyển

Xem ETA

Xem lịch sử hành trình

13. Bản đồ khách hàng

Khách chỉ xem chuyến liên quan đến order của mình.

Đơn ORD-20260907-000001

Trạng thái:
🚚 Đang vận chuyển

Xe:
VEH-003

Tài xế:
Nguyễn Văn A

Vị trí:
[MAP]

ETA:
15:30 hôm nay

Cập nhật:
05:42:15

Có thể cấu hình:

SHOW_VEHICLE_LOCATION = true/false

14. Tính ETA

ETA có thể được tính từ:

ETA =
current_position
+
remaining_distance
+
traffic_factor
+
stops

Có thể triển khai nhiều mức:

Level 1

ETA đơn giản dựa trên tốc độ trung bình.

Level 2

ETA dựa trên routing API.

Level 3

ETA nâng cao:

GPS
+
lịch sử tốc độ
+
thời gian trong ngày
+
điểm dừng
+
tình trạng tuyến
+
traffic API

Không để AI tự quyết định ETA cuối cùng nếu dữ liệu GPS/routing chưa đủ tin cậy.

15. Thời gian thực

Event

Các event chính:

ORDER_CREATED
ORDER_STATUS_CHANGED
SHIPMENT_CREATED
TRIP_CREATED
TRIP_DEPARTED
TRIP_ARRIVED
VEHICLE_LOCATION_UPDATED
ETA_UPDATED
DELIVERY_COMPLETED
PAYMENT_CREATED
INCIDENT_CREATED

Ví dụ:

{
  "event": "TRIP_DEPARTED",
  "trip_id": "uuid",
  "timestamp": "2026-09-07T05:40:00+07:00"
}

16. Kiến trúc Realtime

Ưu tiên:

Driver
   ↓
Tracking API
   ↓
Realtime Event
   ↓
Admin / Customer

Có thể dùng:

WebSocket

SSE

Managed realtime service

Hoặc polling fallback.

Fallback:

Realtime unavailable
        ↓
Polling 15–30 seconds
        ↓
Realtime restored
        ↓
Stop polling

17. Đồng bộ Isar ↔ Neon

Offline-first

Flutter luôn ghi dữ liệu vào Isar trước.

UI
 ↓
Riverpod
 ↓
Repository
 ↓
Isar
 ↓
Sync Queue
 ↓
Vercel API
 ↓
Neon

Không nên:

UI → API → Neon → UI

cho mọi thao tác.

18. Sync Queue

Isar collection:

SyncTask

Fields:

id
entity
entity_id
operation
payload
created_at
retry_count
last_error
status

Operation:

CREATE
UPDATE
DELETE

Status:

PENDING
PROCESSING
SUCCESS
FAILED

19. Conflict Resolution

Mỗi record có:

created_at
updated_at
version
device_id
deleted_at

Ưu tiên:

server version
>
client version

Các nghiệp vụ quan trọng không được âm thầm ghi đè:

Đã giao hàng

Đã thanh toán

Đã hủy

Giờ xuất phát

Giờ đến

Điều chỉnh công nợ

Các trường này phải có audit log.

20. Database Neon

users

id
username
password_hash
role
status
created_at
updated_at
last_login_at

customers

id
customer_code
name
phone
email
address
status
credit_limit
created_at
updated_at

employees

id
user_id
employee_code
name
phone
department
status

drivers

id
user_id
driver_code
name
phone
license_number
status

vehicles

id
vehicle_code
plate_number
vehicle_type
capacity_weight
capacity_volume
status
current_latitude
current_longitude
current_speed
current_heading
last_location_at

orders

id
order_code
customer_id
status
source_country
destination_country
currency
exchange_rate
subtotal
shipping_fee
service_fee
total_amount
paid_amount
debt_amount
weight
volume
note
created_by
created_at
updated_at

order_items

id
order_id
product_name
sku
quantity
unit_price
currency
amount
weight
volume
tracking_number_cn
product_url
note

shipments

id
order_id
tracking_number
carrier
status
trip_id
estimated_departure
actual_departure
estimated_arrival
actual_arrival

trips

id
trip_code
vehicle_id
driver_id
origin
destination
status
planned_departure
actual_departure
planned_arrival
estimated_arrival
actual_arrival

trip_orders

trip_id
order_id

vehicle_locations

id
trip_id
vehicle_id
driver_id
latitude
longitude
accuracy
speed
heading
battery_level
recorded_at
server_received_at

Nên tạo index:

INDEX vehicle_locations_trip_time
(trip_id, recorded_at DESC)

INDEX orders_customer
(customer_id, created_at DESC)

INDEX orders_status
(status)

INDEX trips_status
(status)

INDEX shipments_tracking
(tracking_number)

Không nên giữ lịch sử GPS vô hạn trong bảng nóng. Có thể partition/archive theo tháng nếu dữ liệu lớn.

21. API Vercel

Base:

/api/v1

Auth

POST /auth/login
POST /auth/refresh
POST /auth/logout
GET  /auth/me

Customers

GET    /customers
POST   /customers
GET    /customers/:id
PUT    /customers/:id
DELETE /customers/:id

Orders

GET    /orders
POST   /orders
GET    /orders/:id
PUT    /orders/:id
DELETE /orders/:id
POST   /orders/:id/status

Shipments

GET  /shipments
POST /shipments
GET  /shipments/:id
POST /shipments/:id/assign-trip

Trips

GET  /trips
POST /trips
GET  /trips/:id
POST /trips/:id/depart
POST /trips/:id/arrive
POST /trips/:id/complete

Tracking

POST /tracking/location
GET  /tracking/trip/:tripId/current
GET  /tracking/trip/:tripId/history

Sync

POST /sync/push
POST /sync/pull
GET  /sync/status

22. API Tracking

Request:

{
  "trip_id": "uuid",
  "vehicle_id": "uuid",
  "latitude": 10.762622,
  "longitude": 106.660172,
  "accuracy": 8,
  "speed": 42,
  "heading": 90,
  "battery_level": 78,
  "recorded_at": "2026-09-07T05:45:00+07:00"
}

Server:

Xác thực tài xế.

Kiểm tra tài xế có được phép cập nhật trip không.

Validate GPS.

Lưu location.

Update current vehicle position.

Tính/điều chỉnh ETA.

Publish realtime event.

Trả response.

23. Bảo mật GPS

Không cho phép client gửi:

vehicle_id bất kỳ
trip_id bất kỳ
driver_id bất kỳ

Server phải lấy driver từ JWT:

JWT
 ↓
user_id
 ↓
driver_id
 ↓
assigned_trip

Nếu không khớp:

403 FORBIDDEN

24. Đăng nhập

JWT:

access_token
refresh_token

Payload:

{
  "sub": "user_uuid",
  "role": "CUSTOMER",
  "customer_id": "uuid"
}

Không đưa password vào Isar.

Lưu token bằng secure storage phù hợp nền tảng.

25. Customer Tracking Security

API:

GET /tracking/order/:orderId

Server phải kiểm tra:

order.customer_id == JWT.customer_id

Nếu không:

403

Admin/Staff được quyền rộng hơn theo RBAC.

26. Màn hình Flutter

Login

Logo
Username / Phone
Password
[Đăng nhập]

Quên mật khẩu

Dashboard Admin

Tổng Order
Đang xử lý
Đang vận chuyển
Đã giao
Công nợ
Xe đang chạy

Order List

Bộ lọc:

Mã order
Khách hàng
Tracking
Trạng thái
Ngày
Chuyến

Order Detail

Thông tin khách hàng
Sản phẩm
Chi phí
Thanh toán
Trạng thái
Shipment
Chuyến xe
Timeline
Vị trí xe

27. Timeline Order

07/09 01:00
✓ Tạo order

07/09 02:00
✓ Người bán Trung Quốc giao hàng

07/09 03:30
✓ Nhập kho Trung Quốc

07/09 04:30
✓ Đóng hàng

07/09 05:00
✓ Lên xe

07/09 05:30
🚚 Đang vận chuyển

ETA:
15:30

28. Dashboard Tracking

Các chỉ số:

Tổng xe
Xe đang chạy
Xe đang dừng
Xe mất GPS
Xe đến đích
Chuyến trễ ETA

Cảnh báo:

GPS > 10 phút không cập nhật
Xe đứng yên quá lâu
Xe lệch tuyến
ETA trễ
Xe chạy ngoài giờ

29. Geofencing

Tạo vùng:

Kho Trung Quốc
Cửa khẩu
Kho Việt Nam
Kho khách
Điểm giao hàng

Khi xe vào/ra vùng:

GEOFENCE_ENTER
GEOFENCE_EXIT

Ví dụ:

Xe vào kho Việt Nam
        ↓
Auto event
        ↓
Shipment = VN_WAREHOUSE

Có thể yêu cầu nhân viên xác nhận trước khi chuyển trạng thái nghiệp vụ quan trọng.

30. Thông báo

Notification:

ORDER_CONFIRMED
ORDER_IN_TRANSIT
VEHICLE_DEPARTED
ETA_CHANGED
VEHICLE_ARRIVING
ORDER_ARRIVED
DELIVERY_COMPLETED
PAYMENT_DUE

Kênh:

In-app

Push notification

Email nếu cần

Zalo OA/ZNS nếu tích hợp

31. Quản lý chi phí

Hỗ trợ:

Giá hàng CNY
Tỷ giá
Phí mua hàng
Phí vận chuyển nội địa TQ
Phí vận chuyển quốc tế
Phí cân
Phí thể tích
Phí kiểm hàng
Phí đóng gói
Phí giao Việt Nam
Phí COD
Phí khác

Công thức:

TienHangVND =
GiaCNY × TyGia × SoLuong

TongTien =
TienHangVND
+ PhiMuaHo
+ PhiVanChuyen
+ PhiDongGoi
+ PhiKiemHang
+ PhiKhac

32. Công nợ khách hàng

Theo dõi:

Tổng phải thu
Đã thu
Còn nợ
Quá hạn

Payment:

payment_id
customer_id
order_id
amount
method
reference
paid_at
created_by

Phương thức:

CASH
BANK_TRANSFER
QR
EWALLET
OTHER

33. Báo cáo

Order

Số order/ngày

Số order/tháng

Theo khách hàng

Theo trạng thái

Theo nguồn hàng

Doanh thu

Doanh thu ngày

Doanh thu tháng

Doanh thu theo khách

Vận chuyển

Số chuyến

Số xe

Khối lượng

Chi phí vận chuyển

ETA đúng/trễ

Công nợ

Phải thu

Đã thu

Còn nợ

Quá hạn

34. Audit Log

Mọi nghiệp vụ quan trọng:

audit_logs

Fields:

id
user_id
action
entity
entity_id
old_value
new_value
ip
device_id
created_at

Ví dụ:

STAFF-001
UPDATE_ORDER_STATUS
ORD-00001
ON_TRUCK → DELIVERING
2026-09-07 05:45

35. Offline

Khi mất mạng:

Create Order
      ↓
Isar
      ↓
UI cập nhật ngay
      ↓
Sync Queue
      ↓
Có mạng
      ↓
API
      ↓
Neon

Hiển thị:

☁ Đã đồng bộ
⏳ Chờ đồng bộ
⚠ Đồng bộ lỗi

GPS cần chính sách riêng:

Nếu offline, lưu tạm GPS.

Khi có mạng, gửi batch.

Giới hạn kích thước queue.

Có cơ chế loại bỏ điểm GPS quá cũ nếu vượt chính sách lưu trữ.

36. Đồng bộ Pull

Ví dụ:

POST /sync/pull

Request:

{
  "device_id": "device_uuid",
  "last_sync_cursor": "123456"
}

Response:

{
  "cursor": "123789",
  "changes": {
    "orders": [],
    "shipments": [],
    "trips": [],
    "vehicles": []
  }
}

Không nên mỗi lần đồng bộ tải toàn bộ database.

37. Đồng bộ Push

POST /sync/push

Request:

{
  "device_id": "device_uuid",
  "operations": [
    {
      "entity": "order",
      "entity_id": "uuid",
      "operation": "UPDATE",
      "version": 3,
      "data": {}
    }
  ]
}

Server trả:

{
  "success": [],
  "conflicts": [],
  "failed": []
}

38. Cấu trúc Flutter

lib/
├── core/
│   ├── constants/
│   ├── network/
│   ├── auth/
│   ├── sync/
│   ├── permissions/
│   ├── location/
│   └── utils/
│
├── data/
│   ├── isar/
│   ├── api/
│   ├── repositories/
│   └── dto/
│
├── features/
│   ├── auth/
│   ├── dashboard/
│   ├── customers/
│   ├── employees/
│   ├── drivers/
│   ├── vehicles/
│   ├── orders/
│   ├── shipments/
│   ├── trips/
│   ├── tracking/
│   ├── payments/
│   ├── notifications/
│   └── reports/
│
├── routing/
├── widgets/
└── main.dart

39. Isar Collections

Đề xuất:

UserLocal
CustomerLocal
EmployeeLocal
DriverLocal
VehicleLocal
OrderLocal
OrderItemLocal
ShipmentLocal
TripLocal
TripOrderLocal
LocationLocal
PaymentLocal
NotificationLocal
SyncTask
SyncCursor
AuditLogLocal
AppSetting

40. Repository Pattern

Ví dụ:

OrderRepository

createOrder()
updateOrder()
getOrder()
getOrders()
changeStatus()
syncOrders()

Không cho UI truy cập Isar trực tiếp.

UI
 ↓
Provider
 ↓
Repository
 ↓
Local / Remote

41. Riverpod

Các provider chính:

authProvider
currentUserProvider

orderListProvider
orderDetailProvider

customerProvider

tripProvider
vehicleProvider

trackingProvider

syncProvider

notificationProvider

Tracking:

trackingProvider(tripId)

tự động cập nhật khi có realtime event.

42. GPS Service

LocationService

Chức năng:

startTracking()
stopTracking()
getCurrentLocation()
subscribeLocation()

Driver mode:

Trip bắt đầu
 ↓
startTracking()
 ↓
GPS stream
 ↓
Local queue
 ↓
Upload

Trip kết thúc:

stopTracking()

43. Chống giả GPS cơ bản

Server có thể kiểm tra:

speed > maximum
jump distance bất thường
timestamp bất thường
GPS accuracy quá thấp

Ví dụ:

Điểm A
05:00

Điểm B
05:01

Khoảng cách:
200 km

→ nghi ngờ GPS spoofing

Đánh dấu:

GPS_ANOMALY

Không nhất thiết tự động khóa tài khoản.

44. Quản lý xe

Thông tin:

Biển số
Loại xe
Tải trọng
Thể tích
Tài xế
Thiết bị GPS
Trạng thái

Trạng thái:

AVAILABLE
ASSIGNED
IN_TRANSIT
MAINTENANCE
INACTIVE

45. Quản lý tài xế

Họ tên
Điện thoại
GPLX
Ngày hết hạn
Xe đang lái
Trạng thái

Cảnh báo:

GPLX sắp hết hạn
Xe chưa được gán
Tài xế chưa đăng nhập
GPS offline

46. Quản lý sự cố

Driver có thể tạo:

INCIDENT

Loại:

ACCIDENT
BREAKDOWN
TRAFFIC
CUSTOMS
WEATHER
DOCUMENT
OTHER

Có:

description
photo
location
timestamp
severity
status

47. Tìm kiếm

Global search:

Mã Order
Tracking Trung Quốc
Số điện thoại
Tên khách
Biển số xe
Mã chuyến

Ví dụ:

Search:
SF123456789CN

→ Order
→ Customer
→ Shipment
→ Trip
→ Vehicle

48. QR Code

Mỗi Order:

ORD-20260907-000001

Có QR.

Quét QR:

→ Order Detail

Kho có thể quét:

Order QR
 ↓
Confirm received
 ↓
Confirm packed
 ↓
Load vehicle

49. Workflow kho

INBOUND
 ↓
CHECK
 ↓
WEIGH
 ↓
MEASURE
 ↓
PACK
 ↓
LABEL
 ↓
LOAD
 ↓
SHIP

Mỗi bước có:

user
time
device
photo
note

50. Phân quyền trạng thái

Ví dụ:

CUSTOMER
Không được đổi status.

DRIVER
Chỉ được:
DEPARTED
IN_TRANSIT
ARRIVED
INCIDENT

STAFF
Được xử lý nghiệp vụ order/kho.

ADMIN
Toàn quyền.

51. Cảnh báo tự động

Order

Order quá lâu chưa xử lý
Order thiếu thông tin
Order chưa thanh toán

Shipment

Shipment không cập nhật

Vehicle

GPS mất kết nối
Xe lệch tuyến
Xe dừng quá lâu
ETA trễ

52. Thiết kế trạng thái GPS

LIVE
STALE
OFFLINE

Quy ước:

< 60 giây       LIVE
1–5 phút        STALE
> 5 phút        OFFLINE

Các ngưỡng phải cấu hình được.

53. API Error Standard

{
  "success": false,
  "error": {
    "code": "ORDER_NOT_FOUND",
    "message": "Order không tồn tại"
  },
  "request_id": "uuid"
}

Mã lỗi:

AUTH_INVALID
FORBIDDEN
VALIDATION_ERROR
ORDER_NOT_FOUND
TRIP_NOT_FOUND
VEHICLE_NOT_FOUND
SYNC_CONFLICT
RATE_LIMITED
SERVER_ERROR

54. Logging

Client:

debug
info
warning
error

Server:

request_id
user_id
endpoint
latency
status
error

Không ghi password/token vào log.

55. Performance

Không load:

10.000 GPS points

một lần.

Sử dụng:

pagination
cursor
date range
bounding box

Map chỉ tải xe đang hoạt động trong vùng cần thiết.

56. Database Transaction

Các nghiệp vụ:

Tạo Order
+
Order Items
+
Payment
+
Audit

phải dùng transaction.

Tương tự:

Trip
+
Vehicle assignment
+
Driver assignment
+
Trip Orders

57. Multi-device

Ví dụ:

Android nhân viên
        ↓
       Isar
        ↓
      Vercel
        ↓
       Neon
        ↑
        │
Windows Admin
        ↓
       Isar

Một khách đăng nhập điện thoại mới:

Login
 ↓
Pull Customer Orders
 ↓
Lưu Isar
 ↓
Hiển thị

Không phụ thuộc dữ liệu Isar của thiết bị cũ.

58. Multi-branch

Nếu mở rộng nhiều kho/chi nhánh:

organization_id
branch_id
warehouse_id

Mọi Order/Trip/Vehicle nên có branch/organization phù hợp.

59. Multi-tenant

Nếu bán SaaS:

tenant_id

là trường bắt buộc đối với dữ liệu nghiệp vụ.

Tenant A
 ├── Customers
 ├── Orders
 ├── Vehicles
 └── Trips

Tenant B
 ├── Customers
 ├── Orders
 ├── Vehicles
 └── Trips

API luôn lấy tenant từ token/session, không tin tenant_id do client tự gửi.

60. Backup

Isar

Cho phép:

Export Backup
Import Backup

Backup có:

database
version
app_version
created_at
device_id
checksum

Neon

Backup phụ thuộc cơ chế backup của Neon.

Không dùng file backup Isar làm backup thay thế cho cloud database.

61. Security Checklist

HTTPS bắt buộc.

Password hash bằng Argon2id hoặc bcrypt.

Access token ngắn hạn.

Refresh token rotation.

Rate limit login.

RBAC.

Validate mọi input.

SQL parameterized queries.

Không tin dữ liệu quyền từ client.

GPS endpoint rate limit.

Audit log.

Không lưu password.

Không log token.

Kiểm tra quyền truy cập Order.

Kiểm tra quyền cập nhật Trip.

Kiểm tra tài xế có được gán xe/chuyến.

62. Testing

Unit Test

Order calculation

ETA

Permission

Sync conflict

GPS validation

Integration Test

Flutter
 ↓
API
 ↓
Neon

Offline Test

Offline
Create Order
Reconnect
Sync

GPS Test

GPS normal
GPS lost
GPS jump
GPS duplicate
GPS delayed

Security Test

Customer A
→ Order Customer B
→ 403

63. Development Roadmap

Phase 1 – Foundation

Flutter project

Isar

Riverpod

Auth

Vercel API

Neon

Sync framework

Phase 2 – Order

Customer

Order

Order Item

Shipment

Status timeline

Phase 3 – Logistics

Vehicle

Driver

Trip

Assignment

Departure/arrival

Phase 4 – GPS

Geolocation

Driver tracking

Location API

Map

Current position

Phase 5 – Realtime

Realtime event

ETA

Live map

Customer tracking

Phase 6 – Finance

Payment

Debt

Revenue

Cost

Reports

Phase 7 – Production

Security

Monitoring

Backup

Performance

Multi-tenant

App release

64. MVP ưu tiên

Không nên code toàn bộ ngay từ đầu.

MVP nên gồm:

1. Login
2. Customer
3. Order
4. Order Item
5. Shipment
6. Vehicle
7. Driver
8. Trip
9. Order status
10. GPS
11. Map
12. Realtime location
13. ETA
14. Customer tracking
15. Isar ↔ Neon Sync

Sau khi MVP ổn định mới thêm:

Accounting
Payment
Debt
Warehouse
QR
Notifications
Advanced reports
AI
Multi-tenant

65. Tiêu chí hoàn thành MVP

Customer

Khách có thể:

Login
 ↓
Xem Order
 ↓
Xem Timeline
 ↓
Xem Shipment
 ↓
Xem xe
 ↓
Xem vị trí hiện tại
 ↓
Xem ETA

Driver

Tài xế:

Login
 ↓
Nhận Trip
 ↓
Start Trip
 ↓
Share GPS
 ↓
Update status
 ↓
Arrive
 ↓
Stop GPS

Staff

Nhân viên:

Create Order
 ↓
Assign Shipment
 ↓
Assign Trip
 ↓
Track vehicle
 ↓
Update order

Admin

Admin:

Dashboard
Map tất cả xe
Orders
Customers
Drivers
Vehicles
Trips
Reports

66. Nguyên tắc quan trọng

Isar là local database để app hoạt động Offline-first.

Neon là cloud database/source of truth.

Vercel API là lớp bảo vệ và nghiệp vụ giữa Flutter và Neon.

Không kết nối trực tiếp Flutter → Neon.

Mọi thao tác nghiệp vụ phải đi qua Repository.

Mọi API phải kiểm tra JWT + RBAC + tenant/ownership.

Khách hàng chỉ được xem Order của mình.

Tài xế chỉ được cập nhật Trip được giao.

GPS phải có timestamp/server timestamp để chống dữ liệu giả hoặc trễ.

Realtime phải có fallback polling.

GPS history phải có chính sách lưu trữ/partition.

Các thay đổi quan trọng phải có Audit Log.

Offline Sync phải có retry và conflict handling.

Không tải toàn bộ GPS history xuống thiết bị.

ETA chỉ là ước tính và phải thể hiện thời điểm cập nhật cuối cùng.

67. Cấu trúc thư mục Backend Vercel

api/
├── v1/
│   ├── auth/
│   ├── users/
│   ├── customers/
│   ├── employees/
│   ├── drivers/
│   ├── vehicles/
│   ├── orders/
│   ├── shipments/
│   ├── trips/
│   ├── tracking/
│   ├── payments/
│   ├── notifications/
│   └── sync/
│
├── middleware/
│   ├── auth.ts
│   ├── rbac.ts
│   ├── tenant.ts
│   └── rateLimit.ts
│
├── services/
│   ├── orderService.ts
│   ├── tripService.ts
│   ├── trackingService.ts
│   ├── etaService.ts
│   └── syncService.ts
│
├── db/
│   ├── neon.ts
│   ├── queries/
│   └── migrations/
│
└── utils/

68. Cấu trúc triển khai

GitHub
   │
   ▼
Vercel
   │
   ├── Production API
   ├── Preview API
   └── Environment Variables
             │
             ▼
          Neon DB

Flutter:

Production
API_BASE_URL=https://xxx.vercel.app/api/v1

Không hard-code secret Neon trong Flutter.

69. Environment Variables

Backend:

DATABASE_URL
JWT_SECRET
JWT_REFRESH_SECRET
APP_ENV
REALTIME_PROVIDER_KEY
MAP_PROVIDER_KEY

Không đưa các secret backend vào APK.

70. Kết luận

Ứng dụng được thiết kế theo mô hình:

              ┌───────────────┐
              │    CUSTOMER   │
              └───────┬───────┘
                      │
                      ▼
┌──────────┐    ┌───────────────┐    ┌─────────────┐
│  DRIVER  │───▶│ VERCEL API    │───▶│ NEON DB     │
└────┬─────┘    └───────┬───────┘    └─────────────┘
     │                   │
     │ GPS               │ Realtime
     ▼                   ▼
┌──────────┐       ┌─────────────┐
│  VEHICLE │──────▶│   FLUTTER   │
└──────────┘       │    ADMIN    │
                   └─────────────┘

Mục tiêu cuối cùng:

Một hệ thống Order Trung Quốc + Kho + Vận chuyển + GPS xe + ETA + Realtime + Customer Tracking + Offline-first + Cloud Sync, có thể phát triển thành nền tảng SaaS quản lý logistics nhiều khách hàng/nhiều chi nhánh