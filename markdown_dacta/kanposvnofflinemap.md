# APP GPS MAP OFFLINE — FLUTTER + ISAR + NEON DB

## 1. Mục tiêu ứng dụng

Xây dựng ứng dụng bản đồ và định vị bằng Flutter với các chức năng:

* Định vị GPS.
* Theo dõi vị trí hiện tại theo thời gian thực.
* Bản đồ hoạt động offline.
* Chỉ đường offline.
* Tính quãng đường.
* Tính thời gian dự kiến.
* Lưu lịch sử hành trình.
* Tìm kiếm địa điểm offline.
* Lưu địa điểm yêu thích.
* Chọn điểm A → B.
* Dẫn đường từng bước.
* Re-route khi đi sai đường.
* Hiển thị tốc độ hiện tại.
* Hiển thị hướng di chuyển.
* Hiển thị khoảng cách còn lại.
* Hiển thị ETA.
* Đồng bộ dữ liệu lên Neon DB thông qua API Vercel khi có Internet.
* Có 3 chế độ hiển thị bản đồ:

  1. MAP / STREET
  2. SATELLITE
  3. TRAFFIC
* Hoạt động theo nguyên tắc Offline First.

---

# 2. Kiến trúc tổng thể

```text
                         INTERNET
                             │
                             ▼
                    ┌─────────────────┐
                    │    Vercel API   │
                    │ REST API / JSON  │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │    Neon DB      │
                    │ PostgreSQL      │
                    └─────────────────┘


                    FLUTTER MOBILE APP
                             │
          ┌──────────────────┼──────────────────┐
          │                  │                  │
          ▼                  ▼                  ▼
     GPS Engine         Map Engine        Sync Engine
          │                  │                  │
          ▼                  ▼                  ▼
     Location           Offline Map          Isar
                             │                  │
                             └────────┬─────────┘
                                      │
                                      ▼
                              Local Offline Data
```

Nguyên tắc:

```text
GPS
 ↓
Flutter Location Service
 ↓
Isar
 ↓
Map / Navigation
 ↓
Sync Queue
 ↓
Vercel API
 ↓
Neon PostgreSQL
```

Không được thiết kế ứng dụng phụ thuộc Internet để lấy vị trí GPS.

---

# 3. Công nghệ

## Frontend

```yaml
Flutter
Dart
Riverpod
Isar
Dio / HTTP
Geolocator
Map rendering engine
```

## Local Database

```text
Isar
```

Lưu:

* User
* Device
* GPS position
* Track
* Route
* Waypoint
* Favorite place
* Offline map package
* Navigation session
* Traffic cache
* Sync queue

## Backend

```text
Vercel
Node.js / TypeScript
REST API
```

## Database

```text
Neon PostgreSQL
```

---

# 4. Nguyên tắc Offline First

Ứng dụng phải ưu tiên:

```text
LOCAL DATA
```

trước:

```text
REMOTE DATA
```

Ví dụ:

```text
User mở app
     │
     ▼
Isar
     │
     ├── Có bản đồ offline → sử dụng ngay
     │
     ├── Có route cache → sử dụng
     │
     └── Không có Internet → vẫn chạy GPS
```

Internet chỉ dùng để:

* Download bản đồ mới.
* Đồng bộ lịch sử.
* Cập nhật traffic.
* Cập nhật POI.
* Cập nhật dữ liệu đường.
* Đồng bộ tài khoản.
* Backup dữ liệu.

---

# 5. GPS Offline 100%

GPS không cần Internet để xác định vị trí.

Luồng:

```text
GPS Satellite
     ↓
Android / iOS GPS receiver
     ↓
Flutter Location Service
     ↓
Latitude
Longitude
Altitude
Accuracy
Speed
Heading
Timestamp
     ↓
Isar
```

Model:

```dart
class GpsPoint {
  Id id = Isar.autoIncrement;

  late double latitude;
  late double longitude;

  double? altitude;
  double? accuracy;
  double? speed;
  double? heading;

  late DateTime timestamp;

  String? trackId;
}
```

---

# 6. Theo dõi hành trình

Khi người dùng nhấn:

```text
START
```

ứng dụng tạo:

```text
NavigationSession
```

Sau đó GPS liên tục ghi:

```text
P1
P2
P3
P4
P5
...
```

Ví dụ:

```text
10:00:00
10.123456
106.123456

10:00:02
10.123500
106.123500

10:00:04
10.123550
106.123600
```

Các điểm được lưu vào Isar.

---

# 7. Tính quãng đường

Khoảng cách giữa 2 GPS point sử dụng Haversine hoặc distance calculation của navigation engine.

```text
P1 → P2
P2 → P3
P3 → P4
```

Tổng:

```text
Distance =
distance(P1,P2)
+
distance(P2,P3)
+
distance(P3,P4)
```

Hiển thị:

```text
Quãng đường:
12.6 km
```

---

# 8. Bản đồ offline

Không sử dụng kiến trúc:

```text
Google Maps → Internet bắt buộc
```

Mà sử dụng:

```text
Offline map tiles
+
Offline routing graph
+
Offline POI
```

Bản đồ nên được đóng gói theo khu vực.

Ví dụ:

```text
Việt Nam
 ├── TP.HCM
 ├── Hà Nội
 ├── Đà Nẵng
 ├── Hải Phòng
 └── Cần Thơ
```

Người dùng có thể:

```text
Tải bản đồ TP.HCM
```

sau đó:

```text
Tắt Internet
```

vẫn:

```text
Xem bản đồ
GPS
Chỉ đường
Tính quãng đường
```

---

# 9. Map Engine

Nên thiết kế MapRepository độc lập với UI:

```dart
abstract class MapRepository {

  Future<void> downloadRegion(String regionId);

  Future<void> deleteRegion(String regionId);

  Future<bool> isRegionAvailable(String regionId);

  Future<MapTile?> getTile(
    int z,
    int x,
    int y,
  );

}
```

Nhờ vậy có thể thay map engine mà không phải viết lại toàn bộ app.

---

# 10. Định dạng bản đồ offline

Ưu tiên kiến trúc:

```text
OpenStreetMap data
       ↓
Vector tiles / offline tiles
       ↓
Local storage
       ↓
Map renderer
```

Không nên tải toàn bộ thế giới vào máy.

Chia thành:

```text
Country
Province
City
District
```

Ví dụ:

```text
Vietnam
 └── Ho Chi Minh
      ├── District 1
      ├── District 3
      ├── Thu Duc
      └── Binh Tan
```

---

# 11. Routing Offline

Routing phải có dữ liệu đường offline.

Kiến trúc:

```text
Road Network
     ↓
Routing Graph
     ↓
Local Device
     ↓
Offline Router
```

Các thuật toán có thể sử dụng:

```text
Dijkstra
A*
Contraction Hierarchies
OSRM-style routing
GraphHopper-style routing
Valhalla-style routing
```

Không nên tự viết routing engine từ đầu nếu không cần.

Ưu tiên tích hợp một routing engine hỗ trợ offline.

---

# 12. Chỉ đường

Người dùng chọn:

```text
Điểm A
Điểm B
```

Ví dụ:

```text
A:
10.7769, 106.7009

B:
10.8231, 106.6297
```

Offline router trả về:

```text
Distance:
8.7 km

ETA:
23 phút

Route:
A → C → D → B
```

---

# 13. Navigation Mode

Màn hình dẫn đường:

```text
┌────────────────────────────┐
│        8.7 km              │
│        23 phút             │
├────────────────────────────┤
│                            │
│            ↑               │
│       ↗                    │
│     /                      │
│    /       🚗              │
│   /                        │
│                            │
├────────────────────────────┤
│ Rẽ phải sau 300 m          │
│                            │
│ 72 km/h                    │
└────────────────────────────┘
```

Hiển thị:

* Mũi tên hướng đi.
* Khoảng cách đến maneuver.
* Tốc độ.
* ETA.
* Tổng quãng đường.
* Quãng đường còn lại.
* Thời gian còn lại.

---

# 14. Re-routing

Khi người dùng đi sai đường:

```text
Current GPS
      ↓
Compare with route
      ↓
Distance > threshold
      ↓
OFFLINE ROUTER
      ↓
Calculate new route
```

Ví dụ:

```text
Bạn đang lệch tuyến
```

Sau đó:

```text
Đang tính lại đường...
```

Không cần Internet.

---

# 15. 3 chế độ bản đồ

## Mode 1 — STREET

Bản đồ đường phố:

```text
STREET
```

Hiển thị:

* Đường.
* Tên đường.
* Sông.
* Công viên.
* POI.
* Nhà.
* Địa danh.

Đây là chế độ mặc định.

---

# 16. Mode 2 — SATELLITE

```text
SATELLITE
```

Hiển thị ảnh vệ tinh.

Cần lưu ý:

Ảnh vệ tinh offline 100% chỉ khả thi nếu ảnh vệ tinh đã được tải/cache trước.

Ví dụ:

```text
Satellite package
     ↓
Local storage
     ↓
Offline satellite map
```

Không nên tuyên bố:

```text
Satellite map toàn thế giới offline
```

vì dung lượng cực lớn.

Nên cho người dùng tải theo vùng.

---

# 17. Mode 3 — TRAFFIC

```text
TRAFFIC
```

Hiển thị:

```text
🟢 Đường thông thoáng

🟡 Đông

🟠 Ùn nhẹ

🔴 Ùn tắc

⚫ Tắc nghiêm trọng
```

Ví dụ:

```text
        🟢
──────────────
        🟡
──────────────
        🔴
──────────────
        🟢
```

---

# 18. Traffic Offline

Traffic realtime giống Waze:

```text
KHÔNG THỂ 100% OFFLINE
```

vì cần dữ liệu:

```text
GPS của nhiều người
+
traffic server
+
road speed
+
accident data
+
crowdsourcing
```

Thiết kế nên là:

```text
ONLINE
 ↓
Download traffic data
 ↓
Save vào Isar
 ↓
OFFLINE
 ↓
Hiển thị traffic cache
```

Ví dụ:

```text
Traffic updated:
07:30

Data age:
25 phút
```

Nếu quá cũ:

```text
⚠ Traffic data đã cũ
```

---

# 19. Traffic Crowdsource

Có thể xây dựng hệ thống traffic riêng.

Mỗi thiết bị gửi:

```text
device_id
latitude
longitude
speed
heading
timestamp
road_segment_id
```

Vercel API nhận:

```text
POST /api/traffic/points
```

Neon lưu:

```text
traffic_points
```

Backend tính:

```text
road_segment
+
number_of_devices
+
average_speed
+
historical_speed
```

Sau đó trả:

```text
GREEN
YELLOW
ORANGE
RED
```

---

# 20. Mô hình Traffic

Ví dụ:

```text
Road speed limit = 60 km/h

Average current speed = 55
→ GREEN

Average = 40
→ YELLOW

Average = 25
→ ORANGE

Average = 10
→ RED
```

Có thể cải tiến bằng:

```text
historical traffic
+
current GPS
+
time of day
+
weekday
```

---

# 21. Dữ liệu Isar

Các collection chính:

```text
User
Device
GpsPoint
Track
Route
RoutePoint
NavigationSession
FavoritePlace
RecentPlace
OfflineRegion
MapPackage
TrafficSegment
TrafficSnapshot
SyncQueue
Setting
```

---

# 22. Track

```dart
class Track {
  Id id = Isar.autoIncrement;

  late String uuid;

  String? name;

  DateTime? startTime;
  DateTime? endTime;

  double distance = 0;

  int durationSeconds = 0;

  List<double>? boundingBox;

  bool synced = false;
}
```

---

# 23. Route

```dart
class Route {
  Id id = Isar.autoIncrement;

  late String uuid;

  double startLat = 0;
  double startLng = 0;

  double endLat = 0;
  double endLng = 0;

  double distance = 0;

  int durationSeconds = 0;

  String? encodedPolyline;

  DateTime createdAt = DateTime.now();

  bool offline = true;
}
```

---

# 24. Favorite Place

```dart
class FavoritePlace {
  Id id = Isar.autoIncrement;

  late String uuid;

  late String name;

  late double latitude;
  late double longitude;

  String? address;

  String? category;

  bool synced = false;
}
```

---

# 25. Sync Queue

Không upload trực tiếp mọi thao tác.

Thay vào đó:

```text
User action
 ↓
Isar
 ↓
SyncQueue
 ↓
Internet available?
 ↓
YES
 ↓
Vercel API
 ↓
Neon DB
```

Ví dụ:

```text
CREATE_TRACK
UPDATE_TRACK
DELETE_TRACK
CREATE_FAVORITE
UPDATE_ROUTE
UPLOAD_GPS
```

---

# 26. SyncQueue

```dart
class SyncQueue {
  Id id = Isar.autoIncrement;

  late String entityType;
  late String entityId;

  late String action;

  String? payload;

  int retryCount = 0;

  DateTime createdAt = DateTime.now();

  bool completed = false;
}
```

---

# 27. Đồng bộ Neon DB

Kiến trúc:

```text
Flutter
   ↓
HTTPS
   ↓
Vercel API
   ↓
Neon PostgreSQL
```

Không bao giờ:

```text
Flutter → Neon trực tiếp
```

API chịu trách nhiệm:

* Authentication.
* Authorization.
* Validation.
* Rate limiting.
* Sync.
* Conflict resolution.
* Logging.

---

# 28. API

## Authentication

```http
POST /api/auth/login
POST /api/auth/register
POST /api/auth/refresh
```

## GPS

```http
POST /api/gps/upload
GET /api/gps/history
```

## Tracks

```http
POST /api/tracks
GET /api/tracks
PUT /api/tracks/:id
DELETE /api/tracks/:id
```

## Routes

```http
POST /api/routes
GET /api/routes
```

## Favorites

```http
POST /api/places
GET /api/places
PUT /api/places/:id
DELETE /api/places/:id
```

## Traffic

```http
GET /api/traffic
POST /api/traffic/points
```

---

# 29. Sync API

Endpoint:

```http
POST /api/sync
```

Request:

```json
{
  "device_id": "device-001",
  "last_sync_at": "2026-08-18T00:00:00Z",
  "changes": []
}
```

Response:

```json
{
  "success": true,
  "server_time": "2026-08-18T01:00:00Z",
  "changes": [],
  "deleted": []
}
```

---

# 30. Conflict Resolution

Mỗi record có:

```text
created_at
updated_at
deleted_at
version
device_id
```

Ưu tiên:

```text
server version
```

hoặc:

```text
last-write-wins
```

Đối với GPS track nên append-only.

Không sửa các GPS point cũ nếu không cần thiết.

---

# 31. GPS Permission

Android cần:

```text
ACCESS_FINE_LOCATION
ACCESS_COARSE_LOCATION
```

Nếu tracking nền:

```text
ACCESS_BACKGROUND_LOCATION
FOREGROUND_SERVICE_LOCATION
```

iOS cần:

```text
NSLocationWhenInUseUsageDescription
NSLocationAlwaysAndWhenInUseUsageDescription
```

---

# 32. Background GPS

Khi người dùng khóa màn hình:

```text
GPS Service
     ↓
Background location
     ↓
Isar
```

Không được để UI là thành phần duy nhất giữ GPS.

Nên có:

```text
LocationService
```

độc lập với màn hình.

---

# 33. Tiết kiệm pin

Không ghi GPS mỗi vài trăm mili giây.

Có thể sử dụng:

```text
distanceFilter
timeInterval
accuracy
speed
```

Ví dụ:

```text
Vehicle:
5–10 m

Walking:
2–5 m
```

Có thể tự động điều chỉnh:

```text
speed > 20 km/h
→ GPS interval nhanh hơn

speed < 5 km/h
→ giảm frequency
```

---

# 34. GPS Filtering

GPS đôi khi bị nhiễu.

Cần lọc:

```text
Accuracy > 50m
```

thì có thể bỏ điểm.

Ví dụ:

```dart
if (position.accuracy > 50) {
  return;
}
```

Có thể bổ sung:

```text
Kalman Filter
```

để giảm nhiễu.

---

# 35. Location State

Riverpod:

```text
LocationProvider
```

quản lý:

```text
latitude
longitude
speed
heading
accuracy
altitude
```

UI subscribe vào provider.

---

# 36. Navigation State

```text
NavigationProvider
```

quản lý:

```text
currentRoute
currentStep
distanceRemaining
durationRemaining
nextInstruction
currentSpeed
eta
```

---

# 37. Map State

```text
MapProvider
```

quản lý:

```text
mapMode
zoom
center
offlineRegion
selectedMarker
route
trafficVisible
```

Map mode:

```dart
enum MapMode {
  street,
  satellite,
  traffic,
}
```

---

# 38. UI chính

```text
┌───────────────────────────────┐
│ 🔍 Tìm địa điểm               │
├───────────────────────────────┤
│                               │
│                               │
│          MAP                  │
│                               │
│              🚗               │
│                               │
│                               │
├───────────────────────────────┤
│ [STREET] [SAT] [TRAFFIC]      │
├───────────────────────────────┤
│ 📍 Vị trí hiện tại            │
│                               │
│ 🚗 Dẫn đường                  │
│ 📍 Lưu vị trí                 │
│ 🧭 Hành trình                 │
└───────────────────────────────┘
```

---

# 39. Navigation UI

```text
┌───────────────────────────────┐
│ ← 8.7 km       23 phút        │
├───────────────────────────────┤
│                               │
│            ↗                  │
│           /                   │
│      🚗  /                    │
│         /                     │
│                               │
├───────────────────────────────┤
│ ↱ Rẽ phải                     │
│ 300 m                         │
├───────────────────────────────┤
│ 72 km/h       ETA 08:25       │
└───────────────────────────────┘
```

---

# 40. Tìm kiếm Offline

Không phụ thuộc Google Places.

Lưu dữ liệu POI:

```text
Tên
Latitude
Longitude
Category
Address
```

Ví dụ:

```text
Nhà thuốc
Bệnh viện
Trường học
ATM
Khách sạn
Nhà hàng
Cây xăng
Bãi đỗ xe
```

Tìm kiếm:

```text
SQLite/Isar local index
```

hoặc search index riêng nếu dữ liệu lớn.

---

# 41. Download Manager

Màn hình:

```text
BẢN ĐỒ OFFLINE

Việt Nam
├── TP.HCM       850 MB
├── Hà Nội       620 MB
├── Đà Nẵng      280 MB
└── Cần Thơ      190 MB
```

Hiển thị:

```text
Downloaded
Available
Size
Version
Updated
```

---

# 42. Quản lý dung lượng

Cho phép:

```text
Xóa bản đồ
Cập nhật bản đồ
Tạm dừng download
Tiếp tục download
```

Ví dụ:

```text
Dung lượng:

Maps       2.8 GB
Satellite  4.1 GB
Traffic    20 MB
POI        180 MB

Total      7.1 GB
```

---

# 43. Map Version

Mỗi map package có:

```text
region_id
version
downloaded_at
size
checksum
```

Khi có phiên bản mới:

```text
Local version: 2026.07
Server version: 2026.08
```

hiển thị:

```text
Có bản đồ mới
```

---

# 44. Security

Không đưa:

```text
Neon DB connection string
```

vào Flutter.

Không đưa:

```text
DATABASE_URL
JWT_SECRET
API_SECRET
```

vào app.

Flutter chỉ biết:

```text
https://your-api.vercel.app
```

---

# 45. Backend Neon

Các bảng chính:

```text
users
devices
tracks
track_points
routes
favorite_places
traffic_segments
traffic_points
map_regions
sync_logs
```

---

# 46. Index Neon

GPS:

```sql
INDEX(track_id)
INDEX(timestamp)
```

Location:

```sql
INDEX(latitude, longitude)
```

Traffic:

```sql
INDEX(road_segment_id)
INDEX(timestamp)
```

Nếu hệ thống lớn có thể sử dụng:

```text
PostGIS
```

để xử lý dữ liệu địa lý tốt hơn.

---

# 47. PostGIS

Nếu Neon project hỗ trợ extension phù hợp, ưu tiên:

```text
PostgreSQL
+
PostGIS
```

Để xử lý:

```text
distance
nearest road
geospatial query
bounding box
road segment
POI
```

Ví dụ:

```text
Tìm tất cả POI
trong bán kính 2 km
```

---

# 48. Traffic Architecture

```text
DEVICE A ─┐
DEVICE B ─┤
DEVICE C ─┤
DEVICE D ─┤
DEVICE E ─┘
     ↓
Vercel API
     ↓
Traffic Aggregator
     ↓
Neon
     ↓
Road Segment
     ↓
Traffic Level
```

Ví dụ:

```text
Segment 1001
vehicles = 83
avg_speed = 14 km/h
speed_limit = 50 km/h

Traffic = RED
```

---

# 49. Waze-like Features

Có thể phát triển:

```text
🚗 Traffic
🚧 Road work
⚠ Accident
🚓 Police
🕳 Pothole
⛽ Fuel
🅿 Parking
```

Người dùng có thể báo:

```text
BÁO CÁO
```

Ví dụ:

```text
[🚧 Công trình]

[⚠ Tai nạn]

[🔴 Ùn tắc]

[🚓 Kiểm tra]

[🕳 Đường xấu]
```

Các report được lưu:

```text
Isar
```

và khi online:

```text
Vercel
 ↓
Neon
```

---

# 50. Offline Report

Nếu mất Internet:

```text
User report
 ↓
Isar
 ↓
SyncQueue
```

Khi có Internet:

```text
POST /api/reports
```

---

# 51. Chế độ hoàn toàn Offline

Khi:

```text
WiFi OFF
Mobile Data OFF
```

vẫn phải chạy:

```text
GPS              ✓
Current location ✓
Offline map      ✓
Offline route    ✓
Distance         ✓
Speed            ✓
Heading          ✓
Track recording  ✓
Favorite         ✓
Navigation       ✓
Re-routing       ✓
Offline POI      ✓
```

Riêng:

```text
Realtime traffic ✗
Cloud sync       ✗
Online search    ✗
Live accident    ✗
```

sẽ được đồng bộ lại khi online.

---

# 52. Online/Offline Indicator

Hiển thị:

```text
🟢 ONLINE
```

hoặc:

```text
⚫ OFFLINE
```

Traffic:

```text
Traffic:
Updated 12 phút trước
```

Nếu offline lâu:

```text
⚠ Traffic data cũ
```

---

# 53. Không phụ thuộc Google Maps

Kiến trúc nên tránh lock-in:

```text
MapProvider
RoutingProvider
TrafficProvider
SearchProvider
```

Ví dụ:

```dart
abstract class RoutingProvider {
  Future<RouteResult> calculateRoute(
    Coordinate start,
    Coordinate destination,
  );
}
```

Có thể thay:

```text
Offline Router
Online Router
```

mà không thay Navigation UI.

---

# 54. Cấu trúc Flutter

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
├── database/
│   ├── isar_service.dart
│   ├── models/
│   └── repositories/
│
├── gps/
│   ├── location_service.dart
│   ├── gps_filter.dart
│   └── gps_provider.dart
│
├── map/
│   ├── map_engine.dart
│   ├── map_provider.dart
│   ├── map_mode.dart
│   └── offline_map_manager.dart
│
├── routing/
│   ├── routing_provider.dart
│   ├── offline_router.dart
│   ├── route_model.dart
│   └── navigation_engine.dart
│
├── traffic/
│   ├── traffic_service.dart
│   ├── traffic_provider.dart
│   └── traffic_cache.dart
│
├── sync/
│   ├── sync_service.dart
│   ├── sync_queue.dart
│   └── connectivity_service.dart
│
├── api/
│   ├── api_client.dart
│   ├── auth_api.dart
│   ├── gps_api.dart
│   ├── route_api.dart
│   └── traffic_api.dart
│
├── features/
│   ├── home/
│   ├── navigation/
│   ├── tracks/
│   ├── places/
│   ├── offline_maps/
│   └── settings/
│
└── widgets/
```

---

# 55. Backend Vercel

```text
api/
├── auth/
│   ├── login.ts
│   └── refresh.ts
│
├── gps/
│   ├── upload.ts
│   └── history.ts
│
├── tracks/
│   ├── index.ts
│   └── [id].ts
│
├── routes/
│   └── index.ts
│
├── traffic/
│   ├── index.ts
│   └── points.ts
│
├── reports/
│   └── index.ts
│
└── sync/
    └── index.ts
```

---

# 56. Quy trình hoạt động

## Khi mở app

```text
App start
 ↓
Load Isar
 ↓
Load offline map
 ↓
Start GPS
 ↓
Show current location
 ↓
Check Internet
```

## Có Internet

```text
Sync
 ↓
Download updates
 ↓
Traffic update
 ↓
Map update
```

## Không có Internet

```text
Continue local operation
```

---

# 57. Khi tìm đường

```text
User chọn A
 ↓
User chọn B
 ↓
Check offline map
 ↓
Check routing graph
 ↓
Offline route engine
 ↓
Calculate route
 ↓
Display route
```

Nếu không có dữ liệu:

```text
Không có dữ liệu bản đồ offline
```

Không tự động yêu cầu Internet nếu người dùng đang Offline Mode.

---

# 58. Khi bắt đầu dẫn đường

```text
START NAVIGATION
       ↓
GPS
       ↓
Current position
       ↓
Map matching
       ↓
Compare route
       ↓
Navigation instruction
       ↓
Voice instruction
```

Có thể hỗ trợ:

```text
Text-to-Speech
```

để đọc:

```text
"300 mét nữa rẽ phải."
```

---

# 59. Map Matching

GPS thường không chính xác tuyệt đối.

Cần:

```text
GPS point
 ↓
Nearest road
 ↓
Road segment
 ↓
Current route position
```

Nhờ đó:

```text
GPS lệch 10–20m
```

vẫn không làm xe nhảy sang đường khác quá dễ dàng.

---

# 60. Tính ETA

ETA cơ bản:

```text
ETA = remaining_distance / estimated_speed
```

Có thể nâng cấp:

```text
ETA =
route distance
+
road speed
+
traffic
+
historical speed
```

---

# 61. Voice Navigation

Có thể hỗ trợ:

```text
Rẽ trái
Rẽ phải
Đi thẳng
Quay đầu
Vào vòng xuyến
Ra khỏi vòng xuyến
```

Ví dụ:

```text
"Còn 500 mét, rẽ trái."
```

Hoạt động offline nếu TTS engine của thiết bị có giọng nói offline.

---

# 62. Các package Flutter cần nghiên cứu

Kiến trúc package có thể gồm:

```yaml
dependencies:

  flutter_riverpod:
  isar:
  isar_flutter_libs:

  geolocator:
  permission_handler:

  dio:
  connectivity_plus:

  path_provider:
  shared_preferences:

  flutter_map:
```

Map/routing engine cần lựa chọn kỹ theo khả năng:

```text
offline tiles
vector tiles
MBTiles
offline routing
Android/iOS
```

Không nên chốt package chỉ vì package có nhiều lượt tải; phải kiểm tra khả năng offline thực tế và tình trạng bảo trì.

---

# 63. License

Dữ liệu OpenStreetMap:

```text
© OpenStreetMap contributors
```

Phải tuân thủ:

```text
ODbL
```

Nếu sử dụng dữ liệu bản đồ/ảnh vệ tinh từ nhà cung cấp khác thì phải kiểm tra license riêng.

Không được lấy tile từ một dịch vụ online miễn phí rồi lưu toàn bộ để phân phối lại nếu license/ToS không cho phép.

---

# 64. Kiến trúc Map Provider

```dart
abstract class MapProvider {

  Widget buildMap();

  Future<void> downloadRegion(
    String regionId,
  );

  Future<void> removeRegion(
    String regionId,
  );

  Future<bool> hasOfflineMap(
    String regionId,
  );

  Future<void> setMode(
    MapMode mode,
  );
}
```

---

# 65. Map Mode

```dart
enum MapMode {
  street,
  satellite,
  traffic,
}
```

Traffic có thể là overlay:

```text
Base map
 +
Traffic layer
```

thay vì tạo toàn bộ một bản đồ riêng.

---

# 66. Database Sync Strategy

GPS point không nhất thiết phải upload liên tục.

Nên gom batch:

```text
50 points
100 points
hoặc
30–60 giây
```

sau đó:

```text
POST /api/gps/upload
```

Giảm:

```text
Battery
Network
Vercel requests
Neon writes
```

---

# 67. Track Compression

GPS track có thể rất lớn.

Có thể:

```text
Raw GPS
 ↓
Douglas-Peucker
 ↓
Simplified Polyline
```

Lưu:

```text
raw points local
```

và server:

```text
compressed track
```

nếu cần.

---

# 68. Backup

Isar:

```text
Local primary database
```

Neon:

```text
Cloud backup
```

Người dùng có thể:

```text
Offline → vẫn dùng
Online → backup tự động
```

---

# 69. Khả năng mở rộng

Sau phiên bản đầu tiên có thể thêm:

```text
Multi-device sync
Account
History
Cloud backup
Traffic crowdsourcing
Accident reports
Fuel stations
Parking
Speed camera
Weather
Geofencing
Delivery tracking
Fleet management
Driver management
```

---

# 70. Fleet Management

Có thể phát triển thành:

```text
QUẢN LÝ XE

Xe 01
├── GPS
├── Route
├── Driver
├── Distance
├── Fuel
└── History
```

Neon lưu:

```text
vehicles
drivers
vehicle_tracks
vehicle_events
```

---

# 71. Geofence

Ví dụ:

```text
Kho hàng
radius = 200m
```

Khi xe vào:

```text
ENTER
```

Khi xe ra:

```text
EXIT
```

Có thể hoạt động offline.

---

# 72. Chế độ tiết kiệm dữ liệu

Settings:

```text
[✓] Offline First

[✓] Auto Download Map

[✓] Auto Sync

[✓] Traffic Update

[ ] Satellite Download

[✓] Compress GPS

[✓] Battery Saver
```

---

# 73. Màn hình quản lý Offline

```text
OFFLINE MAP

Đã tải:
TP.HCM
Hà Nội
Đà Nẵng

Dung lượng:
3.2 GB

[ CẬP NHẬT ]

[ XÓA ]

[ TẢI THÊM ]
```

---

# 74. Màn hình lịch sử

```text
LỊCH SỬ HÀNH TRÌNH

18/08/2026
TP.HCM
12.8 km
42 phút

17/08/2026
TP.HCM
24.3 km
1 giờ 12 phút
```

---

# 75. Màn hình chi tiết

```text
HÀNH TRÌNH

Khoảng cách:
24.3 km

Thời gian:
1h 12m

Tốc độ trung bình:
31 km/h

Tốc độ tối đa:
67 km/h

Ngày:
18/08/2026
```

---

# 76. Quy tắc quan trọng

## Không được

```text
Flutter → Neon trực tiếp
```

## Không được

```text
GPS → Internet → lấy vị trí
```

## Không được

```text
Offline navigation → gọi API bắt buộc
```

## Không được

```text
Realtime traffic → tuyên bố hoạt động offline
```

---

# 77. Định nghĩa Offline 100%

Một phiên bản được coi là Offline hoàn chỉnh khi:

```text
Internet OFF

✓ GPS
✓ Map
✓ Search local
✓ Route
✓ Navigation
✓ Re-route
✓ Distance
✓ Speed
✓ Track
✓ Favorite
✓ Voice
✓ History
```

Các chức năng cần Internet:

```text
✗ Realtime traffic
✗ Cloud sync
✗ Online POI
✗ Live reports
```

---

# 78. Roadmap phát triển

## Phase 1

```text
Flutter
Isar
GPS
Offline map
Current location
Distance
Track
```

## Phase 2

```text
Offline routing
Navigation
Re-routing
Voice
```

## Phase 3

```text
Neon
Vercel API
Sync
Account
Cloud backup
```

## Phase 4

```text
Satellite
Traffic
Traffic cache
```

## Phase 5

```text
Crowdsourcing
Accident
Road work
Police
Parking
Fuel
```

## Phase 6

```text
Fleet
Geofence
Driver management
Analytics
```

---

# 79. Kiến trúc cuối cùng

```text
                    ┌────────────────────┐
                    │    NEON DATABASE   │
                    │    PostgreSQL      │
                    └─────────▲──────────┘
                              │
                              │ HTTPS
                              │
                    ┌─────────┴──────────┐
                    │    VERCEL API      │
                    │                    │
                    │ Auth               │
                    │ Sync               │
                    │ Traffic            │
                    │ GPS                │
                    │ Reports            │
                    └─────────▲──────────┘
                              │
                         INTERNET
                              │
             ┌────────────────┴────────────────┐
             │                                 │
             │        FLUTTER APP              │
             │                                 │
             │  ┌───────────────┐              │
             │  │     ISAR      │              │
             │  │ Local DB      │              │
             │  └───────┬───────┘              │
             │          │                      │
             │  ┌───────▼───────┐              │
             │  │  MAP ENGINE    │              │
             │  └───────┬───────┘              │
             │          │                      │
             │  ┌───────▼───────┐              │
             │  │ OFFLINE ROUTER │              │
             │  └───────┬───────┘              │
             │          │                      │
             │  ┌───────▼───────┐              │
             │  │ NAVIGATION     │              │
             │  └───────┬───────┘              │
             │          │                      │
             │  ┌───────▼───────┐              │
             │  │ GPS SERVICE    │◄─────────────┤
             │  └───────────────┘       GPS     │
             │                                 │
             └─────────────────────────────────┘
```

# 80. Kết luận

Kiến trúc tốt nhất cho app này là:

```text
Flutter
+
Riverpod
+
Isar
+
Offline Map
+
Offline Routing
+
GPS
+
Vercel API
+
Neon PostgreSQL
```

Trong đó **Isar + Offline Map + Offline Routing + GPS là lõi**, còn **Vercel + Neon chỉ là lớp cloud/sync**.

Đặc biệt, nên tách rõ:

```text
GPS OFFLINE 100%
MAP OFFLINE 100%
ROUTING OFFLINE 100%
NAVIGATION OFFLINE 100%

TRAFFIC REALTIME
→ ONLINE

TRAFFIC CACHE
→ OFFLINE
```

Đây là cách thiết kế thực tế để đạt trải nghiệm gần Waze nhưng không biến ứng dụng thành app phụ thuộc Internet.
