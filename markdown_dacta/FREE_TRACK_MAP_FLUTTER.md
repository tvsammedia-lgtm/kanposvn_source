# FREE_TRACK_MAP_FLUTTER.md

# ĐẶC TẢ HỆ THỐNG BẢN ĐỒ FREE + GPS TRACKING CHO FLUTTER

> Phiên bản: 1.0.0  
> Kiến trúc mục tiêu: Flutter + Isar + OpenStreetMap + Vercel API + Neon PostgreSQL  
> Mục tiêu: Bản đồ miễn phí/open-source, tracking GPS offline/online, đồng bộ cloud và theo dõi realtime nhiều thiết bị.

---

## 1. Mục tiêu

Xây dựng module bản đồ và tracking có thể tích hợp vào các app Flutter quản lý:

- Đơn hàng/giao hàng.
- Xe vận chuyển.
- Nhân viên giao hàng.
- Kho vận/logistics.
- Theo dõi tài sản.
- Theo dõi hành trình.
- Quản lý đội xe.

Hệ thống phải:

1. Hiển thị bản đồ bằng OpenStreetMap.
2. Lấy vị trí GPS của điện thoại.
3. Theo dõi vị trí theo thời gian.
4. Vẽ polyline hành trình.
5. Hoạt động offline.
6. Lưu GPS point vào Isar.
7. Đồng bộ lên Neon thông qua Vercel API.
8. Cho phép admin xem vị trí nhiều xe.
9. Hỗ trợ realtime.
10. Có lịch sử hành trình.
11. Có geofence.
12. Tính khoảng cách, thời gian và tốc độ.
13. Có cơ chế retry khi mất mạng.
14. Không phụ thuộc Google Maps API trong chức năng cơ bản.

---

# 2. Kiến trúc tổng thể

```text
┌───────────────────────────────────────────────┐
│                  FLUTTER APP                  │
│                                               │
│  UI                                            │
│   ├── Map Screen                               │
│   ├── Tracking Screen                          │
│   ├── Vehicle List                             │
│   └── Trip History                             │
│                                               │
│  Tracking Engine                               │
│   ├── GPS                                     │
│   ├── Distance                                │
│   ├── Speed                                   │
│   ├── Heading                                 │
│   ├── Polyline                               │
│   └── Geofence                               │
│                                               │
│  Local Repository                              │
│       ↓                                        │
│      ISAR                                      │
│                                               │
└───────────────────┬───────────────────────────┘
                    │ HTTPS
                    ▼
             ┌───────────────┐
             │  VERCEL API   │
             └───────┬───────┘
                     │
                     ▼
             ┌───────────────┐
             │ NEON POSTGRES │
             └───────────────┘

              Realtime Channel
                     ▲
                     │
               Admin Web/App
```

---

# 3. Công nghệ

## 3.1 Flutter

Framework chính.

Khuyến nghị:

- Flutter stable.
- Dart 3.x.
- Android.
- Windows.
- Web nếu cần.

## 3.2 Map

Sử dụng:

- OpenStreetMap làm dữ liệu bản đồ.
- `flutter_map` làm widget bản đồ Flutter.

Không khóa ứng dụng vào Google Maps.

## 3.3 GPS

Package:

```yaml
geolocator:
```

Dùng để:

- latitude
- longitude
- altitude
- accuracy
- speed
- heading
- timestamp

## 3.4 Local database

```yaml
isar:
isar_flutter_libs:
```

Isar dùng để:

- lưu trip.
- lưu GPS point.
- lưu queue đồng bộ.
- lưu trạng thái tracking.
- cache bản đồ/dữ liệu liên quan nếu cần.

## 3.5 Cloud database

Neon PostgreSQL.

Dùng lưu:

- users.
- vehicles.
- trips.
- track points.
- geofences.
- events.
- device status.

## 3.6 API

Vercel API làm lớp trung gian:

```text
Flutter
   ↓
HTTPS
   ↓
Vercel API
   ↓
Neon
```

Không cho Flutter kết nối trực tiếp PostgreSQL.

---

# 4. Cấu trúc Flutter project

```text
lib/
├── main.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── permissions/
│   └── utils/
│
├── data/
│   ├── local/
│   │   ├── isar_service.dart
│   │   ├── collections/
│   │   └── repositories/
│   │
│   ├── remote/
│   │   ├── api_client.dart
│   │   └── tracking_api.dart
│   │
│   └── models/
│
├── features/
│   └── tracking/
│       ├── models/
│       ├── services/
│       ├── repositories/
│       ├── providers/
│       ├── controllers/
│       └── screens/
│
├── map/
│   ├── map_widget.dart
│   ├── map_controller.dart
│   ├── marker_builder.dart
│   └── polyline_builder.dart
│
└── widgets/
```

---

# 5. Dependencies

Ví dụ:

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_riverpod: ^2.6.1

  isar: ^3.1.0+1
  isar_flutter_libs: ^3.1.0+1

  flutter_map:
  latlong2:

  geolocator:

  http:
  connectivity_plus:

  uuid:
  intl:

  permission_handler:

  path_provider:

  flutter_background_service:
  flutter_local_notifications:

  shared_preferences:
```

> Phiên bản package nên được kiểm tra lại theo Flutter stable tại thời điểm triển khai.

---

# 6. Chức năng bản đồ

## 6.1 Map Screen

Hiển thị:

- OpenStreetMap.
- Vị trí hiện tại.
- Marker xe.
- Marker khách hàng.
- Marker kho.
- Marker điểm giao hàng.
- Polyline.
- Geofence.
- Popup thông tin.

## 6.2 Điều khiển

Có:

- Zoom in.
- Zoom out.
- Center GPS.
- Follow current position.
- Hiển thị toàn bộ route.
- Chuyển layer nếu có.
- Xóa route.
- Bắt đầu tracking.
- Tạm dừng.
- Kết thúc.

---

# 7. GPS Tracking Engine

## 7.1 Luồng

```text
GPS
 ↓
Position Stream
 ↓
Filter Accuracy
 ↓
Filter Distance
 ↓
Filter Time
 ↓
Create TrackPoint
 ↓
Save Isar
 ↓
Update Map
 ↓
Queue Sync
 ↓
Vercel API
 ↓
Neon
```

## 7.2 Điều kiện ghi điểm

Không nên ghi GPS mỗi vài mili giây.

Mặc định:

```text
distanceFilter = 5 - 20 mét
```

Có thể cấu hình theo chế độ:

```text
HIGH_ACCURACY
  5m

NORMAL
  10m

BATTERY_SAVER
  30m
```

---

# 8. Model Track

```dart
class Track {
  String id;
  String userId;
  String? vehicleId;

  DateTime startTime;
  DateTime? endTime;

  double totalDistance;
  int durationSeconds;

  String status;

  bool isSynced;
}
```

Status:

```text
draft
running
paused
completed
cancelled
```

---

# 9. Model TrackPoint

```dart
class TrackPoint {
  String id;
  String trackId;

  double latitude;
  double longitude;

  double? altitude;
  double? accuracy;
  double? speed;
  double? heading;

  DateTime timestamp;

  bool synced;
}
```

---

# 10. Isar Schema

Các collection chính:

```text
Track
TrackPoint
Vehicle
Geofence
SyncQueue
```

## SyncQueue

```dart
class SyncQueue {
  String id;

  String entityType;
  String entityId;

  String action;

  String payload;

  DateTime createdAt;

  int retryCount;

  String status;
}
```

Status:

```text
pending
processing
success
failed
```

---

# 11. Offline-first

Ứng dụng phải ưu tiên local.

## Khi online

```text
GPS
 ↓
Isar
 ↓
API
 ↓
Neon
```

## Khi offline

```text
GPS
 ↓
Isar
 ↓
SyncQueue
```

Khi Internet trở lại:

```text
Connectivity detected
        ↓
SyncManager
        ↓
Upload pending points
        ↓
Server ACK
        ↓
Mark synced
```

Không được mất GPS point khi mất mạng.

---

# 12. Batch Sync

Không nên gửi từng GPS point bằng một HTTP request.

Ví dụ:

```text
POST /api/tracking/sync

{
  "device_id": "...",
  "tracks": [...],
  "points": [...]
}
```

Mỗi batch:

```text
50 - 500 points
```

Tùy tốc độ mạng.

Server trả:

```json
{
  "success": true,
  "accepted": 500,
  "rejected": 0,
  "server_time": "..."
}
```

---

# 13. API Vercel

Cấu trúc:

```text
/api
├── auth
│   ├── login
│   └── refresh
│
├── tracking
│   ├── start
│   ├── update
│   ├── stop
│   ├── sync
│   ├── current
│   └── history
│
├── vehicles
│   ├── list
│   └── location
│
└── geofences
    ├── list
    └── events
```

---

# 14. API Start Tracking

```http
POST /api/tracking/start
```

Request:

```json
{
  "vehicle_id": "V001",
  "latitude": 10.7765,
  "longitude": 106.7009
}
```

Response:

```json
{
  "success": true,
  "track_id": "TRK001"
}
```

---

# 15. API Update Location

```http
POST /api/tracking/update
```

Request:

```json
{
  "track_id": "TRK001",
  "latitude": 10.7765,
  "longitude": 106.7009,
  "speed": 35.2,
  "heading": 180,
  "accuracy": 8,
  "timestamp": "2026-09-08T09:00:00Z"
}
```

---

# 16. API Sync

```http
POST /api/tracking/sync
```

Request:

```json
{
  "device_id": "DEVICE001",
  "points": [
    {
      "id": "P001",
      "track_id": "TRK001",
      "latitude": 10.7765,
      "longitude": 106.7009,
      "speed": 35,
      "timestamp": "2026-09-08T09:00:00Z"
    }
  ]
}
```

Server phải dùng `point.id` làm idempotency key để tránh ghi trùng.

---

# 17. Neon PostgreSQL Schema

## users

```sql
CREATE TABLE users (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    phone TEXT,
    role TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);
```

## vehicles

```sql
CREATE TABLE vehicles (
    id UUID PRIMARY KEY,
    code TEXT UNIQUE NOT NULL,
    name TEXT,
    plate_number TEXT,
    driver_id UUID,
    status TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);
```

## tracks

```sql
CREATE TABLE tracks (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    vehicle_id UUID,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ,
    total_distance DOUBLE PRECISION DEFAULT 0,
    duration_seconds INTEGER DEFAULT 0,
    status TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);
```

## track_points

```sql
CREATE TABLE track_points (
    id UUID PRIMARY KEY,
    track_id UUID NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    altitude DOUBLE PRECISION,
    accuracy DOUBLE PRECISION,
    speed DOUBLE PRECISION,
    heading DOUBLE PRECISION,
    recorded_at TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);
```

Index:

```sql
CREATE INDEX idx_track_points_track_id
ON track_points(track_id);

CREATE INDEX idx_track_points_recorded_at
ON track_points(recorded_at);

CREATE INDEX idx_tracks_vehicle
ON tracks(vehicle_id);
```

---

# 18. Realtime Tracking

Có thể triển khai theo 2 mức.

## Mức 1 - Polling

Admin gọi:

```text
GET /api/tracking/current
```

mỗi:

```text
5 - 15 giây
```

Ưu điểm:

- đơn giản.
- dễ triển khai.
- phù hợp hệ thống nhỏ.

## Mức 2 - Realtime

Sử dụng:

```text
WebSocket
```

hoặc dịch vụ realtime tương thích.

Luồng:

```text
Xe
 ↓
Vercel API
 ↓
Realtime channel
 ↓
Admin
```

Admin nhận:

```json
{
  "vehicle_id": "V001",
  "lat": 10.7765,
  "lng": 106.7009,
  "speed": 42,
  "heading": 90,
  "timestamp": "..."
}
```

---

# 19. Theo dõi nhiều xe

Admin Map:

```text
┌─────────────────────────────────────────┐
│             MAP                          │
│                                         │
│      🚚 V01                             │
│                🚚 V03                   │
│                                         │
│  🚚 V02                                 │
│                         🚚 V04          │
│                                         │
└─────────────────────────────────────────┘

Xe đang chạy: 4
Online: 4
Offline: 0
```

Mỗi vehicle marker phải chứa:

```text
vehicle_id
plate_number
driver
speed
heading
last_update
status
```

---

# 20. Marker Rotation

Marker xe phải xoay theo:

```text
heading
```

Ví dụ:

```text
heading = 0     Bắc
heading = 90    Đông
heading = 180   Nam
heading = 270   Tây
```

Không tạo marker mới liên tục nếu có thể cập nhật marker hiện tại.

---

# 21. Polyline

Polyline gồm:

```text
TrackPoint 1
     ↓
TrackPoint 2
     ↓
TrackPoint 3
     ↓
...
TrackPoint N
```

Dùng để hiển thị:

- tuyến đường đã đi.
- tuyến đường đang chạy.
- tuyến đường lịch sử.

Có thể chia:

```text
completed route
active route
planned route
```

---

# 22. Tính khoảng cách

Khoảng cách giữa hai GPS point:

```text
P1(lat1,lng1)
P2(lat2,lng2)
```

Sử dụng Haversine hoặc thư viện `latlong2`.

Tổng:

```text
distance =
Σ distance(P[i], P[i+1])
```

Đơn vị:

```text
meter
kilometer
```

---

# 23. Tính tốc độ

Ưu tiên:

```text
GPS speed
```

Nếu GPS speed không hợp lệ:

```text
speed = distance / time
```

Lọc dữ liệu bất thường:

```text
accuracy quá thấp
speed âm
speed > giới hạn hợp lý
timestamp không hợp lệ
```

---

# 24. Geofence

Geofence là vùng địa lý được định nghĩa bởi:

```text
center
radius
```

Ví dụ:

```text
Kho A
center = 10.7765, 106.7009
radius = 200m
```

Sự kiện:

```text
ENTER
EXIT
DWELL
```

Ví dụ:

```text
Xe vào kho
→ ENTER

Xe đứng trong kho > 10 phút
→ DWELL

Xe rời kho
→ EXIT
```

---

# 25. Geofence Database

```sql
CREATE TABLE geofences (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    radius_meters DOUBLE PRECISION NOT NULL,
    type TEXT,
    active BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT now()
);
```

---

# 26. Background Tracking

Đây là phần quan trọng.

Ứng dụng phải hỗ trợ GPS khi:

- màn hình tắt.
- app chuyển background.
- người dùng đang di chuyển.

Android cần:

- Location permission.
- Background location permission khi cần.
- Foreground Service.
- Notification khi tracking nền.

Không được thiết kế theo kiểu chỉ lấy GPS trong widget UI.

---

# 27. Battery Optimization

Không sử dụng GPS liên tục ở tần suất quá cao.

Profile:

```text
HIGH
distanceFilter = 5m
interval ≈ 5s

NORMAL
distanceFilter = 10m
interval ≈ 10s

LOW_POWER
distanceFilter = 30m
interval ≈ 30s
```

Các giá trị trên là cấu hình khởi đầu và phải benchmark thực tế.

---

# 28. Quyền Android

Cần xử lý:

```text
ACCESS_FINE_LOCATION
ACCESS_COARSE_LOCATION
ACCESS_BACKGROUND_LOCATION
FOREGROUND_SERVICE
FOREGROUND_SERVICE_LOCATION
POST_NOTIFICATIONS
```

Luồng xin quyền:

```text
User login
 ↓
Giải thích tracking
 ↓
Location permission
 ↓
Background permission nếu cần
 ↓
Battery optimization guidance
 ↓
Start tracking
```

Không xin quyền một cách âm thầm.

---

# 29. Quyền iOS

Nếu phát triển iOS cần cấu hình:

```text
NSLocationWhenInUseUsageDescription
NSLocationAlwaysAndWhenInUseUsageDescription
```

và Background Modes:

```text
Location updates
```

---

# 30. Trạng thái thiết bị

Mỗi device có:

```text
ONLINE
OFFLINE
TRACKING
PAUSED
STOPPED
```

Server xác định online dựa trên:

```text
last_seen_at
```

Ví dụ:

```text
< 30s   ONLINE
30-120s WARNING
> 120s  OFFLINE
```

Các ngưỡng phải cấu hình được.

---

# 31. Chống GPS nhiễu

Không lưu điểm nếu:

```text
accuracy > 50m
```

có thể cấu hình.

Không chấp nhận:

```text
latitude ngoài [-90,90]
longitude ngoài [-180,180]
```

Kiểm tra:

```text
timestamp
accuracy
speed
distance jump
```

Ví dụ nếu xe đang chạy 40 km/h nhưng GPS nhảy 5 km trong 2 giây:

```text
→ reject point
```

---

# 32. Route History

Màn hình:

```text
HÀNH TRÌNH

08/09/2026

Xe: 51A-12345
Tài xế: Nguyễn Văn A

Bắt đầu: 08:00
Kết thúc: 11:35

Quãng đường: 82.5 km
Thời gian: 3h35m
Tốc độ TB: 23 km/h
Tốc độ max: 68 km/h
```

Bản đồ:

```text
START ●──────────────● END
             route
```

---

# 33. Lịch sử theo ngày

Cho phép:

```text
Today
Yesterday
This week
This month
Custom date
```

Bộ lọc:

```text
Vehicle
Driver
User
Status
Date
```

---

# 34. Tracking theo đơn hàng

Nếu tích hợp hệ thống order:

```text
ORDER
 ↓
SHIPMENT
 ↓
VEHICLE
 ↓
TRACK
```

Ví dụ:

```text
Đơn hàng #DH000123

Kho Trung Quốc
       ↓
      🚚
       ↓
Kho Việt Nam
       ↓
Khách hàng
```

Trạng thái:

```text
CREATED
PICKED_UP
IN_TRANSIT
ARRIVED
DELIVERED
```

---

# 35. ETA

Có thể tính ETA cơ bản:

```text
remaining_distance / average_speed
```

Nhưng ETA thực tế tốt hơn nếu dùng routing engine.

Không coi ETA tự tính là dữ liệu giao thông thời gian thực.

---

# 36. Routing miễn phí

Có thể tích hợp:

```text
OSRM
```

cho routing cơ bản.

Request:

```text
origin
destination
waypoints
```

Response:

```text
distance
duration
geometry
```

Geometry dùng để vẽ:

```text
planned polyline
```

Phân biệt:

```text
Planned Route
Actual Track
```

---

# 37. Nominatim

Có thể dùng cho:

```text
GPS → địa chỉ
```

và:

```text
Địa chỉ → GPS
```

Không được gửi request quá mức.

Nên:

- cache kết quả.
- debounce tìm kiếm.
- giới hạn request.
- tuân thủ chính sách của dịch vụ sử dụng.

---

# 38. Tile Map

URL tile không nên hard-code một cách tùy tiện nếu triển khai quy mô lớn.

Ví dụ nguồn tile OSM công cộng:

```text
https://tile.openstreetmap.org/{z}/{x}/{y}.png
```

Phải:

- kiểm tra policy hiện hành.
- cấu hình User-Agent/attribution theo yêu cầu.
- không tải hàng loạt tile.
- không coi public tile server là CDN miễn phí không giới hạn.

Khi số lượng người dùng tăng, nên chuyển sang:

- tile provider có free tier phù hợp.
- self-host tile server.
- dịch vụ OSM-compatible.

---

# 39. Attribution

Ứng dụng phải hiển thị attribution phù hợp cho dữ liệu bản đồ.

Ví dụ:

```text
© OpenStreetMap contributors
```

Thực hiện theo yêu cầu license và policy của nguồn tile/geodata đang sử dụng.

---

# 40. Security

Flutter không được chứa:

```text
DATABASE_URL
NEON_PASSWORD
DATABASE_PASSWORD
SERVER_SECRET
```

Flutter chỉ chứa:

```text
API_BASE_URL
public configuration
```

Authentication:

```text
Access Token
Refresh Token
```

API kiểm tra:

```text
user
role
device
vehicle
permission
```

---

# 41. Phân quyền

Roles:

```text
SUPER_ADMIN
ADMIN
DISPATCHER
DRIVER
STAFF
VIEWER
```

Ví dụ:

```text
DRIVER
→ xem vị trí của mình

DISPATCHER
→ xem xe được phân công

ADMIN
→ xem toàn bộ xe

VIEWER
→ chỉ xem bản đồ
```

---

# 42. Audit Log

Ghi lại:

```text
START_TRACK
PAUSE_TRACK
RESUME_TRACK
STOP_TRACK
CHANGE_VEHICLE
CHANGE_DRIVER
DELETE_TRACK
EXPORT_TRACK
```

---

# 43. API Security

Mỗi request:

```text
Authorization: Bearer <token>
```

Server kiểm tra:

```text
JWT
user_id
role
device_id
```

Rate limit:

```text
tracking/update
tracking/sync
```

Không cho client gửi tùy ý `user_id` của người khác rồi ghi dữ liệu.

---

# 44. Đồng bộ conflict

Track point:

```text
id = UUID
```

Server sử dụng:

```text
INSERT ... ON CONFLICT DO NOTHING
```

hoặc equivalent ORM logic.

Nguyên tắc:

```text
Same point ID
→ chỉ tồn tại một lần
```

---

# 45. Sync Algorithm

```text
START
 ↓
Get pending SyncQueue
 ↓
Group by entity
 ↓
Create batch
 ↓
POST /sync
 ↓
Server ACK
 ↓
Mark synced
 ↓
Delete/Archive queue
 ↓
Next batch
```

Nếu lỗi:

```text
retryCount++
```

Backoff:

```text
5s
15s
30s
60s
5m
```

Giới hạn retry.

---

# 46. Map State Management

Khuyến nghị Riverpod.

Ví dụ:

```text
trackingProvider
mapProvider
vehicleProvider
routeProvider
geofenceProvider
syncProvider
```

Không đặt toàn bộ tracking logic trong `MapScreen`.

---

# 47. Tracking Controller

Pseudo-code:

```dart
class TrackingController {
  Future<void> start() async {
    await permissionService.ensureLocationPermission();

    final track = await repository.createTrack();

    positionSubscription = Geolocator
        .getPositionStream(...)
        .listen((position) async {

      final point = TrackPoint(
        id: uuid.v4(),
        trackId: track.id,
        latitude: position.latitude,
        longitude: position.longitude,
        speed: position.speed,
        heading: position.heading,
        accuracy: position.accuracy,
        timestamp: position.timestamp ?? DateTime.now(),
      );

      await repository.savePoint(point);

      await mapController.updatePosition(point);

      await syncManager.enqueue(point);
    });
  }
}
```

---

# 48. Repository Pattern

```text
TrackingRepository
├── createTrack()
├── savePoint()
├── getCurrentTrack()
├── getTrackHistory()
├── completeTrack()
├── getPendingPoints()
└── sync()
```

Không cho UI truy cập Isar trực tiếp.

---

# 49. Map Widget

Pseudo-code:

```dart
FlutterMap(
  options: MapOptions(
    initialCenter: LatLng(10.7765, 106.7009),
    initialZoom: 15,
  ),
  children: [
    TileLayer(
      urlTemplate:
        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    ),

    PolylineLayer(
      polylines: [
        Polyline(
          points: routePoints,
        ),
      ],
    ),

    MarkerLayer(
      markers: markers,
    ),
  ],
);
```

Cần bổ sung attribution và cấu hình tile đúng policy khi đưa production.

---

# 50. UI Screens

## Map Home

```text
Map
├── Current location
├── Vehicles
├── Orders
├── Geofences
└── Routes
```

## Tracking

```text
Start
Pause
Resume
Stop
```

## Vehicle Detail

```text
Vehicle
Driver
Current location
Speed
Heading
Last update
Current trip
```

## Trip Detail

```text
Start
End
Distance
Duration
Average speed
Maximum speed
Route
Events
```

## History

```text
Date
Vehicle
Driver
Trip
Distance
```

---

# 51. Dashboard

Admin dashboard:

```text
┌──────────────────────────────────────┐
│ TRACKING DASHBOARD                   │
├──────────────────────────────────────┤
│ Total vehicles       25              │
│ Online               21              │
│ Tracking             18              │
│ Offline               4              │
├──────────────────────────────────────┤
│                                      │
│              MAP                     │
│                                      │
│  🚚   🚚       🚚                    │
│       🚚                             │
│             🚚                       │
│                                      │
└──────────────────────────────────────┘
```

---

# 52. Thông báo

Có thể cảnh báo:

```text
Vehicle offline
Vehicle leaves geofence
Vehicle enters geofence
Overspeed
Long stop
Route deviation
GPS unavailable
Low battery
Sync failed
```

---

# 53. Route Deviation

Nếu có planned route:

```text
Actual GPS
      ↓
Distance to planned route
      ↓
> threshold
      ↓
ROUTE_DEVIATION
```

Ví dụ:

```text
threshold = 300m
```

Phải cấu hình được.

---

# 54. Overspeed

Mỗi loại xe có:

```text
max_speed
```

Nếu:

```text
GPS speed > max_speed
```

thì:

```text
OVERSPEED_EVENT
```

Nên yêu cầu vượt ngưỡng trong một khoảng thời gian trước khi cảnh báo để tránh GPS nhiễu.

---

# 55. Data Retention

Không nên lưu GPS vô thời hạn nếu không cần.

Thiết lập:

```text
raw points: 3-12 tháng
trip summary: lâu hơn
audit log: theo chính sách doanh nghiệp
```

Có thể archive dữ liệu cũ.

---

# 56. Performance

Không render hàng chục nghìn point cùng lúc.

Khi route lớn:

```text
Raw Track Points
        ↓
Douglas-Peucker simplification
        ↓
Display Points
```

Tách:

```text
raw_points
display_points
```

Không xóa raw data chỉ vì tối ưu UI.

---

# 57. Database Optimization

Với hệ thống lớn:

```text
track_points
```

có thể trở thành bảng rất lớn.

Cần:

- index.
- partition theo thời gian khi cần.
- batch insert.
- pagination.
- route simplification.
- archive.

Không query toàn bộ lịch sử một lần.

---

# 58. Pagination

API history:

```http
GET /api/tracking/history?vehicle_id=V001&page=1&limit=50
```

Không trả hàng nghìn trip trong một request.

---

# 59. API Response chuẩn

```json
{
  "success": true,
  "data": {},
  "message": null,
  "error_code": null
}
```

Lỗi:

```json
{
  "success": false,
  "data": null,
  "message": "Unauthorized",
  "error_code": "AUTH_REQUIRED"
}
```

---

# 60. Error Handling

Các nhóm:

```text
GPS_PERMISSION_DENIED
GPS_DISABLED
GPS_UNAVAILABLE
NETWORK_ERROR
API_ERROR
AUTH_EXPIRED
SYNC_FAILED
INVALID_POINT
SERVER_ERROR
```

UI phải có thông báo rõ ràng.

---

# 61. Logging

Không log:

```text
access token
refresh token
database password
```

Có thể log:

```text
track_id
point count
sync duration
network status
GPS accuracy
```

Production nên có log level:

```text
debug
info
warning
error
```

---

# 62. Testing

## Unit Test

Test:

```text
distance calculation
speed calculation
GPS filtering
geofence
sync queue
retry
conflict
```

## Widget Test

Test:

```text
Map screen
Tracking button
Vehicle list
Trip detail
```

## Integration Test

Test:

```text
Start
GPS points
Offline
Reconnect
Sync
Stop
History
```

---

# 63. Offline Test

Kịch bản:

```text
1. Start tracking
2. Tắt WiFi/4G
3. Di chuyển
4. GPS tiếp tục ghi
5. Kiểm tra Isar
6. Bật Internet
7. Sync
8. Kiểm tra Neon
```

Kết quả bắt buộc:

```text
Không mất point
Không duplicate point
Không mất track
```

---

# 64. Realtime Test

```text
Device A
   ↓
GPS
   ↓
API
   ↓
Realtime
   ↓
Admin Device B
```

Kiểm tra:

```text
latency
marker movement
connection loss
reconnect
duplicate event
```

---

# 65. Bảo vệ khi app bị kill

Tracking nền là phần khó nhất.

Không được giả định:

```text
Timer.periodic
```

sẽ luôn chạy khi app bị background/killed.

Phải dùng cơ chế background location phù hợp với Android/iOS và chính sách hệ điều hành.

---

# 66. Privacy

Tracking là dữ liệu nhạy cảm về vị trí.

Cần:

- thông báo rõ mục đích.
- chỉ tracking khi có quyền.
- phân quyền người xem.
- mã hóa HTTPS.
- giới hạn dữ liệu.
- cho phép dừng tracking khi nghiệp vụ cho phép.
- không công khai vị trí người dùng.

---

# 67. Attribution & License

Các thành phần open-source phải kiểm tra license trước production.

Đặc biệt:

```text
OpenStreetMap data
Tile provider
Routing provider
Geocoding provider
Flutter packages
```

Không mặc định rằng:

```text
free = unlimited
```

---

# 68. Chiến lược chi phí

Giai đoạn MVP:

```text
Flutter
+
OpenStreetMap-compatible map
+
flutter_map
+
Geolocator
+
Isar
+
Vercel
+
Neon
```

Có thể bắt đầu với chi phí thấp.

Khi tăng user:

```text
Public tile server
        ↓
Có thể không còn phù hợp
        ↓
Chuyển sang tile provider
hoặc self-host
```

---

# 69. Mô hình triển khai đề xuất

## Giai đoạn 1

```text
Flutter
OpenStreetMap
Isar
Geolocator
```

Chỉ offline.

## Giai đoạn 2

```text
Flutter
↓
Vercel
↓
Neon
```

Sync.

## Giai đoạn 3

```text
Multiple vehicles
Realtime
Geofence
```

## Giai đoạn 4

```text
Routing
ETA
Route deviation
Analytics
```

---

# 70. Quy trình triển khai

```text
STEP 1
Tạo Flutter project

STEP 2
Cài flutter_map

STEP 3
Cài geolocator

STEP 4
Tạo Isar collections

STEP 5
Tạo TrackingRepository

STEP 6
Tạo MapScreen

STEP 7
Implement GPS stream

STEP 8
Implement polyline

STEP 9
Implement offline queue

STEP 10
Tạo Vercel API

STEP 11
Tạo Neon schema

STEP 12
Implement batch sync

STEP 13
Implement realtime

STEP 14
Implement background tracking

STEP 15
Implement geofence

STEP 16
Testing

STEP 17
Production
```

---

# 71. Definition of Done

Module được xem là hoàn thành khi:

- [ ] Bản đồ hiển thị.
- [ ] GPS hoạt động.
- [ ] Marker vị trí hiện tại.
- [ ] Tracking start/stop.
- [ ] Polyline.
- [ ] Isar lưu point.
- [ ] Offline tracking.
- [ ] Sync queue.
- [ ] Vercel API.
- [ ] Neon database.
- [ ] Batch sync.
- [ ] Idempotency.
- [ ] Background tracking.
- [ ] Vehicle tracking.
- [ ] Multi-vehicle map.
- [ ] History.
- [ ] Distance.
- [ ] Speed.
- [ ] Geofence.
- [ ] Overspeed.
- [ ] Route deviation.
- [ ] Realtime.
- [ ] Permission handling.
- [ ] Error handling.
- [ ] Security.
- [ ] Audit log.
- [ ] Automated tests.

---

# 72. AI Coding Agent Rules

AI Agent khi code module này phải:

1. Không thay đổi kiến trúc nếu chưa được yêu cầu.
2. Không kết nối Flutter trực tiếp Neon PostgreSQL.
3. Không lưu secret trong Flutter.
4. Không bỏ qua offline mode.
5. Không ghi GPS point liên tục không kiểm soát.
6. Không tạo duplicate track point.
7. Không xóa dữ liệu local trước khi server ACK.
8. Không phụ thuộc UI để chạy background tracking.
9. Không sử dụng Google Maps nếu không được yêu cầu.
10. Phải giữ OpenStreetMap attribution.
11. Phải kiểm tra license/policy của tile/routing/geocoding provider.
12. Phải viết test cho thuật toán GPS.
13. Phải xử lý reconnect.
14. Phải xử lý token hết hạn.
15. Phải dùng batch sync.
16. Phải hỗ trợ pagination.
17. Không tải toàn bộ lịch sử GPS vào RAM.
18. Phải bảo vệ dữ liệu vị trí.
19. Không log token hoặc secret.
20. Mọi thay đổi schema phải có migration.

---

# 73. Cấu hình trung tâm

Tạo:

```dart
class TrackingConfig {
  static const int gpsDistanceFilter = 10;

  static const int maxGpsAccuracy = 50;

  static const int syncBatchSize = 100;

  static const int syncIntervalSeconds = 30;

  static const int realtimeIntervalSeconds = 10;

  static const double defaultGeofenceRadius = 200;

  static const double routeDeviationMeters = 300;

  static const double defaultMaxSpeedKmh = 80;
}
```

Các giá trị phải configurable thay vì hard-code trong nhiều file.

---

# 74. Future Extensions

Có thể mở rộng:

```text
Live traffic
Offline maps
Turn-by-turn navigation
Vehicle telemetry
OBD
GPS tracker hardware
Camera
Dashcam
Fuel management
Driver behavior
Trip scoring
Delivery proof
QR delivery
Signature
Photo delivery
Customer live tracking
ETA notification
```

---

# 75. Kiến trúc hoàn chỉnh cho hệ thống logistics

```text
                         ┌───────────────┐
                         │  ADMIN WEB    │
                         └───────┬───────┘
                                 │
                           Realtime/API
                                 │
┌───────────────┐        ┌───────▼────────┐
│ DRIVER APP    │───────▶│   VERCEL API   │
│               │ HTTPS  └───────┬────────┘
│ GPS           │                │
│ Isar          │                ▼
│ Offline       │        ┌─────────────────┐
│ Background    │        │ NEON POSTGRESQL │
└───────┬───────┘        └─────────────────┘
        │
        │
        ▼
┌────────────────────┐
│ OpenStreetMap Map  │
│                    │
│ 🚚 ──────────────▶ │
│                    │
│ Customer 📍        │
│ Warehouse 📍       │
└────────────────────┘
```

---

# 76. Kết luận

Giải pháp đề xuất là:

```text
Flutter
+
flutter_map
+
OpenStreetMap
+
Geolocator
+
Isar
+
Vercel API
+
Neon PostgreSQL
```

Trong đó:

```text
Isar
→ Offline-first

OpenStreetMap
→ Bản đồ

Geolocator
→ GPS

flutter_map
→ Rendering

Vercel
→ API

Neon
→ Cloud database
```

Kiến trúc này phù hợp để dùng làm module nền cho:

- App quản lý đơn hàng.
- App giao hàng.
- App quản lý xe.
- App logistics.
- App quản lý nhân viên.
- App theo dõi phương tiện.

Ưu tiên triển khai theo thứ tự:

```text
Map
 ↓
GPS
 ↓
Track
 ↓
Isar
 ↓
Offline
 ↓
Vercel API
 ↓
Neon
 ↓
Sync
 ↓
Realtime
 ↓
Geofence
 ↓
Routing
 ↓
Analytics
```

**Lưu ý:** "Free" ở đây nên hiểu là dùng các công nghệ open-source/dịch vụ có free tier; tile, geocoding và routing công cộng có giới hạn sử dụng và chính sách riêng, vì vậy phải kiểm tra lại trước khi đưa ứng dụng lên production với lượng người dùng lớn.
