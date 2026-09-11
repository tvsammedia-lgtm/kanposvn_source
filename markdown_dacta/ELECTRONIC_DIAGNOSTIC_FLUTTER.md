# ELECTRONIC_DIAGNOSTIC_FLUTTER.md

# ELECTRONIC DIAGNOSTIC FLUTTER
## Đặc tả hệ thống chẩn đoán thiết bị & mạch điện tử bằng Flutter + Isar + AI + Neon/Vercel

**Version:** 1.0.0  
**Platform:** Android, Windows, Web (giai đoạn sau)  
**Ngôn ngữ:** Dart / Flutter  
**Local DB:** Isar  
**Cloud DB:** Neon PostgreSQL  
**API:** Vercel Serverless Functions / Next.js API  
**AI:** Local AI tùy cấu hình + Cloud AI tùy chọn  
**Mục tiêu:** hỗ trợ kỹ thuật viên xác định nguyên nhân lỗi, linh kiện nghi hỏng, quy trình đo kiểm và linh kiện thay thế.

---

## 1. MỤC TIÊU

Xây dựng ứng dụng Flutter hoạt động theo mô hình **offline-first**, giúp kỹ thuật viên:

- Quản lý thiết bị cần sửa.
- Chụp ảnh PCB/mạch điện tử.
- OCR mã IC, transistor, diode, resistor, capacitor...
- Nhận diện/đánh dấu linh kiện trên ảnh.
- Nhập triệu chứng và kết quả đo.
- Phân tích chuỗi lỗi.
- Tính mức độ nghi ngờ linh kiện hỏng.
- Đề xuất bước đo tiếp theo.
- Đề xuất linh kiện thay thế tương đương.
- Tra cứu datasheet.
- Lưu lịch sử sửa chữa.
- Xây dựng kho kiến thức lỗi thực tế.
- Đồng bộ dữ liệu với Neon qua API Vercel.
- Có thể kết nối multimeter/oscilloscope qua Bluetooth/USB ở giai đoạn mở rộng.

### Nguyên tắc quan trọng

Ứng dụng là **công cụ hỗ trợ chẩn đoán**, không được tuyên bố rằng AI luôn xác định chính xác linh kiện hỏng.

AI phải đưa ra:

- giả thuyết;
- bằng chứng;
- mức độ tin cậy;
- phép đo cần thực hiện;
- điều kiện xác nhận;
- cảnh báo an toàn.

---

# 2. PHẠM VI

## 2.1 Thiết bị mục tiêu

- Adapter nguồn.
- Bộ nguồn switching.
- TV.
- Monitor.
- Máy tính.
- Laptop.
- Router.
- Camera.
- Thiết bị âm thanh.
- Mạch điều khiển máy móc.
- Bo nguồn.
- Bo relay.
- Mạch Arduino/ESP.
- Mạch inverter.
- Mạch DC/DC.
- Mạch LED.
- Mạch công nghiệp.
- Thiết bị gia dụng.

## 2.2 Loại linh kiện

- R - Resistor.
- C - Capacitor.
- L - Inductor.
- D - Diode.
- ZD - Zener.
- LED.
- Q - BJT/MOSFET/IGBT.
- U/IC.
- OP-AMP.
- MCU.
- Relay.
- Fuse.
- Transformer.
- Bridge Rectifier.
- Optocoupler.
- Thermistor.
- Crystal.
- Connector.
- Sensor.

---

# 3. KIẾN TRÚC TỔNG THỂ

```text
                 ┌──────────────────────────┐
                 │       FLUTTER APP        │
                 │ Android / Windows        │
                 └────────────┬─────────────┘
                              │
       ┌──────────────────────┼──────────────────────┐
       │                      │                      │
       ▼                      ▼                      ▼
   Camera/OCR              Isar DB              Measurement
       │                      │                  Input/BLE
       ▼                      │                      │
   PCB Image                  │                      │
       └──────────────────────┼──────────────────────┘
                              ▼
                       Diagnostic Engine
                              │
                 ┌────────────┴────────────┐
                 ▼                         ▼
             Rule Engine                  AI
                 │                         │
                 └────────────┬────────────┘
                              ▼
                    Diagnostic Result
                              │
                 ┌────────────┴────────────┐
                 ▼                         ▼
          Replacement DB              Repair Procedure
                 │                         │
                 └────────────┬────────────┘
                              ▼
                       Vercel API
                              │
                              ▼
                       Neon PostgreSQL
```

---

# 4. KIẾN TRÚC OFFLINE-FIRST

## 4.1 Khi không có Internet

Ứng dụng vẫn phải:

- mở dữ liệu thiết bị;
- xem lịch sử sửa chữa;
- nhập kết quả đo;
- chạy rule engine;
- tra cứu linh kiện đã tải xuống;
- chạy local AI nếu có;
- tạo báo cáo;
- lưu ảnh;
- lưu diagnostic session.

## 4.2 Khi có Internet

Ứng dụng:

- đồng bộ dữ liệu.
- tải knowledge base mới.
- tải datasheet metadata.
- đồng bộ linh kiện.
- đồng bộ lỗi thực tế.
- gửi yêu cầu AI cloud nếu người dùng bật chức năng.
- backup dữ liệu.

---

# 5. CẤU TRÚC FLUTTER

```text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── utils/
│   ├── security/
│   └── network/
│
├── database/
│   ├── isar_service.dart
│   ├── migrations/
│   └── collections/
│
├── models/
│
├── features/
│   ├── dashboard/
│   ├── devices/
│   ├── pcb/
│   ├── components/
│   ├── measurements/
│   ├── diagnosis/
│   ├── repair/
│   ├── datasheet/
│   ├── knowledge/
│   ├── replacement/
│   ├── reports/
│   ├── settings/
│   └── sync/
│
├── services/
│   ├── camera_service.dart
│   ├── ocr_service.dart
│   ├── ai_service.dart
│   ├── diagnostic_service.dart
│   ├── datasheet_service.dart
│   ├── bluetooth_meter_service.dart
│   └── sync_service.dart
│
└── widgets/
```

---

# 6. DEPENDENCIES ĐỀ XUẤT

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_riverpod: ^2.6.1
  isar: ^3.1.0+1
  isar_flutter_libs: ^3.1.0+1
  shared_preferences: ^2.5.5
  http: ^1.2.2
  intl: ^0.20.2
  path_provider: ^2.1.5
  uuid: ^4.4.0

  image_picker:
  camera:
  file_picker:
  mobile_scanner:
  image:
  permission_handler:

  pdf:
  printing:

  fl_chart:

  connectivity_plus:
  network_info_plus:

  # BLE/USB ở phase mở rộng
  flutter_blue_plus:
  usb_serial:

dev_dependencies:
  build_runner:
  isar_generator:
```

AI/OCR nên thiết kế qua interface để có thể thay đổi engine:

```dart
abstract class OcrEngine {
  Future<List<OcrResult>> recognize(String imagePath);
}

abstract class AiDiagnosticEngine {
  Future<DiagnosticResult> diagnose(DiagnosticInput input);
}
```

---

# 7. DATABASE ISAR

## 7.1 Device

```dart
@collection
class Device {
  Id id = Isar.autoIncrement;

  late String uuid;
  String? name;
  String? brand;
  String? model;
  String? serialNumber;
  String? category;
  String? symptom;
  String? status;

  DateTime? createdAt;
  DateTime? updatedAt;

  bool syncPending = false;
}
```

## 7.2 PCB

```dart
@collection
class PcbBoard {
  Id id = Isar.autoIncrement;

  late String uuid;
  String? deviceUuid;
  String? boardName;
  String? boardCode;
  String? imagePath;
  String? notes;

  DateTime? createdAt;
  DateTime? updatedAt;

  bool syncPending = false;
}
```

## 7.3 Component

```dart
@collection
class Component {
  Id id = Isar.autoIncrement;

  late String uuid;
  String? pcbUuid;

  String? reference;
  String? type;
  String? value;
  String? packageType;
  String? manufacturer;
  String? partNumber;

  double? confidence;

  double? x;
  double? y;
  double? width;
  double? height;

  String? status;
  String? notes;
}
```

## 7.4 Measurement

```dart
@collection
class Measurement {
  Id id = Isar.autoIncrement;

  late String uuid;

  String? deviceUuid;
  String? pcbUuid;
  String? componentUuid;

  String? measurementType;
  double? value;
  String? unit;
  String? probeMode;
  String? condition;
  String? expectedRange;
  String? result;
  String? notes;

  DateTime? measuredAt;
}
```

Measurement types:

```text
VDC
VAC
OHM
DIODE
CONTINUITY
CURRENT
FREQUENCY
DUTY_CYCLE
CAPACITANCE
ESR
TEMPERATURE
WAVEFORM
```

## 7.5 DiagnosticSession

```dart
@collection
class DiagnosticSession {
  Id id = Isar.autoIncrement;

  late String uuid;

  String? deviceUuid;
  String? symptom;
  String? diagnosis;
  double? confidence;

  String? safetyLevel;
  String? status;

  DateTime? startedAt;
  DateTime? completedAt;

  bool syncPending = false;
}
```

## 7.6 DiagnosticFinding

```dart
@collection
class DiagnosticFinding {
  Id id = Isar.autoIncrement;

  late String uuid;
  String? sessionUuid;
  String? componentUuid;

  String? hypothesis;
  double? probability;

  String? evidence;
  String? recommendedTest;
  String? confirmationCondition;

  String? severity;
}
```

## 7.7 ReplacementPart

```dart
@collection
class ReplacementPart {
  Id id = Isar.autoIncrement;

  late String uuid;

  String? originalPartNumber;
  String? replacementPartNumber;
  String? componentType;

  String? manufacturer;
  String? packageType;

  String? voltageRating;
  String? currentRating;
  String? powerRating;
  String? resistance;
  String? capacitance;
  String? tolerance;

  String? compatibility;
  String? notes;
}
```

## 7.8 RepairProcedure

```dart
@collection
class RepairProcedure {
  Id id = Isar.autoIncrement;

  late String uuid;

  String? title;
  String? componentType;
  String? symptom;
  String? steps;
  String? warnings;

  int? difficulty;
}
```

---

# 8. CLOUD DATABASE NEON

## Tables chính

```text
tenants
users
devices
pcb_boards
components
measurements
diagnostic_sessions
diagnostic_findings
diagnostic_rules
components_master
replacement_parts
datasheets
repair_procedures
fault_cases
knowledge_articles
sync_logs
audit_logs
```

## Multi-tenant

Mọi bảng nghiệp vụ phải có:

```text
tenant_id
```

Không cho phép client tự ý đọc dữ liệu tenant khác.

---

# 9. API VERCEL

Base:

```text
https://YOUR-DOMAIN.vercel.app/api
```

## Authentication

```http
POST /api/auth/login
POST /api/auth/register
POST /api/auth/refresh
POST /api/auth/logout
```

## Device

```http
GET    /api/devices
POST   /api/devices
GET    /api/devices/:id
PUT    /api/devices/:id
DELETE /api/devices/:id
```

## PCB

```http
GET  /api/pcbs
POST /api/pcbs
GET  /api/pcbs/:id
PUT  /api/pcbs/:id
```

## Components

```http
GET /api/components
POST /api/components
GET /api/components/search?q=LM358
GET /api/components/:partNumber
```

## Measurements

```http
POST /api/measurements
GET  /api/measurements?device_id=...
```

## Diagnosis

```http
POST /api/diagnosis
GET  /api/diagnosis/:id
POST /api/diagnosis/:id/confirm
```

## Replacement

```http
GET /api/replacements?part=IRF540
GET /api/replacements/search?q=...
```

## Sync

```http
POST /api/sync/push
POST /api/sync/pull
POST /api/sync/ack
```

---

# 10. CAMERA & PCB ANALYSIS

## Quy trình

```text
Camera
 ↓
Image preprocessing
 ↓
Perspective correction
 ↓
OCR
 ↓
Component detection
 ↓
Reference extraction
 ↓
Component database lookup
 ↓
PCB map
```

## Image preprocessing

- Crop.
- Rotate.
- Perspective correction.
- Contrast.
- Sharpen.
- Noise reduction.
- Resize.
- Optional grayscale.

Không được thay đổi ảnh gốc.

Lưu:

```text
original_image
processed_image
analysis_image
```

---

# 11. OCR

OCR dùng để đọc:

```text
LM358
TL431
UC3842
IRF840
2N2222
1N4148
SS14
7805
AMS1117
```

OCR result:

```json
{
  "text": "LM358",
  "confidence": 0.96,
  "x": 120,
  "y": 220
}
```

Sau OCR phải thực hiện normalization:

```text
LM358
lm358
LM 358
LM-358
```

→ canonical:

```text
LM358
```

---

# 12. PCB COMPONENT DETECTION

Mỗi linh kiện được lưu:

```text
reference
type
position
boundingBox
confidence
partNumber
```

Ví dụ:

```json
{
  "reference": "Q3",
  "type": "MOSFET",
  "partNumber": "IRF840",
  "confidence": 0.91
}
```

UI hiển thị marker:

```text
       Q3
       ↓
┌──────────────┐
│      [Q3]    │
│              │
│   [D5]       │
│              │
│ [U2]         │
└──────────────┘
```

---

# 13. TRIỆU CHỨNG

Người dùng chọn hoặc nhập:

```text
Không lên nguồn
Không có output
Chập nguồn
Nóng bất thường
Có tiếng nhưng không hình
Có hình nhưng không tiếng
Restart liên tục
Mất tín hiệu
Điện áp thấp
Điện áp cao
Chập MOSFET
Fuse đứt
LED không sáng
```

Cho phép nhập tự do.

---

# 14. MEASUREMENT ENGINE

Ví dụ người dùng nhập:

```text
Vin = 220 VAC
Vbulk = 310 VDC
Vout = 0 VDC
Q1 D-S = 0.02 Ω
Fuse = OK
```

Engine phân tích:

```text
Fuse OK
↓
Bulk voltage OK
↓
Primary switching stage suspect
↓
Q1 D-S near short
↓
Q1 high suspicion
```

---

# 15. RULE ENGINE

Rule mẫu:

```json
{
  "id": "MOSFET_SHORT_001",
  "component": "MOSFET",
  "condition": {
    "drain_source_resistance": "< 1"
  },
  "finding": "Possible MOSFET short",
  "confidence": 0.90
}
```

## Rule score

```text
Base Score
+ measurement evidence
+ symptom match
+ topology match
+ historical fault frequency
- conflicting evidence
```

Kết quả:

```text
Q1 MOSFET
Probability: 92%

D5 Diode
Probability: 34%

PWM IC
Probability: 21%
```

---

# 16. AI DIAGNOSTIC ENGINE

AI input:

```json
{
  "device": {
    "brand": "Example",
    "model": "ABC123"
  },
  "symptom": "Không có output",
  "components": [],
  "measurements": [],
  "rules": [],
  "repair_history": []
}
```

AI output:

```json
{
  "diagnosis": "Primary switching MOSFET likely failed",
  "confidence": 0.92,
  "findings": [
    {
      "component": "Q1",
      "probability": 0.92,
      "reason": "D-S resistance extremely low"
    }
  ],
  "next_tests": [
    "Check gate resistor",
    "Check PWM output",
    "Check snubber network"
  ],
  "replacement": []
}
```

AI phải trả về JSON schema cố định.

---

# 17. LOCAL AI

Cho phép tích hợp local model để bảo vệ source/data.

Kiến trúc:

```text
Flutter
 ↓
Local HTTP service
 ↓
Local AI model
 ↓
Diagnostic JSON
```

Có thể chạy trên Windows.

Android có thể dùng model nhỏ hơn nếu phần cứng đáp ứng.

Local AI chỉ là lớp suy luận; **rule engine vẫn phải chạy độc lập**.

---

# 18. CLOUD AI

Khi bật cloud AI:

```text
Flutter
 ↓
Vercel API
 ↓
AI Provider
 ↓
Structured JSON
 ↓
Flutter
```

Không gửi ảnh/source code nếu người dùng chưa cho phép.

Có thể gửi:

- triệu chứng;
- kết quả đo;
- mã linh kiện;
- topology;
- dữ liệu lỗi.

---

# 19. SAFETY ENGINE

Đây là module bắt buộc.

Các mạch nguy hiểm:

```text
220 VAC
300–400 VDC
High voltage
CRT
Microwave
Inverter
High-power capacitor
Battery high current
```

Phải cảnh báo trước khi đưa hướng dẫn đo.

Ví dụ:

```text
⚠ CẢNH BÁO

Mạch có điện áp nguy hiểm.

Không chạm trực tiếp vào PCB.
Sử dụng probe cách điện.
Xả tụ trước khi tháo linh kiện.
Chỉ đo khi hiểu rõ quy trình an toàn.
```

AI không được hướng dẫn thao tác nguy hiểm một cách tùy tiện.

---

# 20. LINH KIỆN THAY THẾ

Không được chỉ tìm linh kiện có cùng tên.

Engine phải kiểm tra:

```text
Function
Voltage
Current
Power
Frequency
Package
Pinout
Temperature
Tolerance
ESR
Speed
Polarity
```

Ví dụ MOSFET:

```text
Original:
IRF840

Check:
Vds >= original
Id >= original
Rds(on) phù hợp
Package phù hợp
Pinout phù hợp
Gate characteristics phù hợp
```

Nếu pinout khác:

```text
⚠ KHÔNG TƯƠNG THÍCH TRỰC TIẾP
```

---

# 21. COMPONENT DATABASE

Các trường:

```text
part_number
manufacturer
type
category
package
pin_count
pinout
voltage
current
power
resistance
capacitance
frequency
temperature
datasheet_url
equivalent_parts
obsolete
notes
```

---

# 22. DATASHEET

Không lưu toàn bộ tài liệu nếu không có quyền sử dụng.

Lưu metadata:

```text
part_number
manufacturer
title
source_url
document_hash
revision
```

Cho phép người dùng mở nguồn datasheet hợp pháp.

---

# 23. REPAIR KNOWLEDGE BASE

Mỗi case:

```text
Device
Symptom
Measured values
Faulty component
Root cause
Repair
Replacement
Final test
```

Ví dụ:

```text
Symptom:
Nguồn không chạy

Measurement:
Q1 D-S = short

Fault:
MOSFET Q1

Root cause:
Overvoltage

Repair:
Replace Q1 + inspect gate/snubber

Final test:
Output = 12.1 V
```

---

# 24. DIAGNOSTIC WORKFLOW

```text
1. Tạo thiết bị
        ↓
2. Nhập triệu chứng
        ↓
3. Chụp PCB
        ↓
4. OCR / component recognition
        ↓
5. Chọn component nghi ngờ
        ↓
6. Nhập phép đo
        ↓
7. Rule Engine
        ↓
8. AI Analysis
        ↓
9. Xếp hạng lỗi
        ↓
10. Đề xuất phép đo tiếp theo
        ↓
11. Xác nhận linh kiện
        ↓
12. Tìm linh kiện thay thế
        ↓
13. Thực hiện sửa chữa
        ↓
14. Test sau sửa
        ↓
15. Đóng diagnostic case
        ↓
16. Đồng bộ cloud
```

---

# 25. UI SCREENS

## Dashboard

Hiển thị:

```text
Thiết bị đang sửa
Case đang mở
Lỗi gần đây
Linh kiện hay hỏng
Thống kê sửa chữa
```

## Device List

- Tìm kiếm.
- Lọc.
- Thương hiệu.
- Model.
- Trạng thái.

## Device Detail

```text
Thông tin
Ảnh PCB
Triệu chứng
Measurements
Diagnosis
Repair
History
```

## PCB Viewer

- Zoom.
- Pan.
- Marker linh kiện.
- Search reference.
- Search part number.
- Highlight suspected components.

## Measurement Screen

```text
Component: Q1

Measurement:
[ D-S Resistance ]

Value:
[ 0.02 ]

Unit:
[ Ω ]

Condition:
[ Power OFF ]

[Save]
```

## Diagnosis Screen

```text
🔴 Q1 - 92%
MOSFET có khả năng chập

🟠 D5 - 38%
Cần kiểm tra

🟡 U1 - 21%
Khả năng thấp

[Đo tiếp]
[Chi tiết]
[Thay linh kiện]
```

---

# 26. DIAGNOSTIC RESULT

Mỗi kết quả phải có:

```text
Finding
Confidence
Evidence
Conflicting evidence
Next test
Safety warning
Replacement candidates
```

Không hiển thị:

```text
"100% chắc chắn"
```

nếu chưa có phép đo xác nhận.

---

# 27. REPAIR CONFIRMATION

Sau sửa:

```text
Linh kiện đã thay:
Q1

Part:
IRF840

Test:
Vout = 12.08 V
Current = 0.31 A
Temperature = 42°C

Result:
PASS
```

---

# 28. REPORT

PDF report gồm:

```text
Repair Report
-----------------
Device
Brand
Model
Serial

Symptom

PCB Images

Measurements

Diagnostic Findings

Replaced Components

Root Cause

Repair Steps

Final Test

Technician
Date
```

---

# 29. SEARCH

Tìm theo:

```text
Model
Serial
Symptom
Component
Part Number
Fault Code
Measurement
Repair case
```

Ví dụ:

```text
"IRF840 short"
"LM358 output 0V"
"UC3842 no switching"
"adapter 12V no output"
```

---

# 30. SYNC ENGINE

Mỗi entity có:

```text
uuid
created_at
updated_at
deleted_at
sync_status
server_version
```

Sync:

```text
Local change
 ↓
sync_pending = true
 ↓
Push
 ↓
Server validates
 ↓
Server version
 ↓
ACK
 ↓
sync_pending = false
```

Conflict:

```text
last_write_wins
```

Đối với diagnostic case quan trọng nên dùng version/merge thay vì ghi đè mù.

---

# 31. OFFLINE QUEUE

```text
SyncQueue
----------------
CREATE
UPDATE
DELETE
UPLOAD_IMAGE
UPLOAD_MEASUREMENT
```

Retry:

```text
1s
5s
15s
60s
5m
```

Có giới hạn retry và ghi log.

---

# 32. IMAGE STORAGE

Không lưu ảnh lớn trực tiếp trong Neon.

Local:

```text
App Documents/
 └── diagnostic/
      └── device_uuid/
           ├── original/
           ├── processed/
           └── report/
```

Cloud:

```text
Object Storage
```

Neon chỉ lưu:

```text
image_id
device_uuid
storage_url
hash
size
created_at
```

---

# 33. AUTHENTICATION

JWT:

```text
access_token
refresh_token
tenant_id
user_id
role
```

Roles:

```text
OWNER
ADMIN
TECHNICIAN
VIEWER
```

Quyền:

```text
Technician:
- Create case
- Measure
- Diagnose
- Repair

Viewer:
- View only

Admin:
- Manage knowledge
- Components
- Users
```

---

# 34. AUDIT LOG

Ghi:

```text
user_id
tenant_id
action
entity
entity_id
timestamp
device
ip (server-side if applicable)
```

Không ghi dữ liệu bí mật vào log.

---

# 35. PERFORMANCE

Mục tiêu:

```text
App startup < 3s
Local search < 100ms
Isar lookup < 100ms
UI 60 FPS
OCR async
Image processing isolate/background
Sync background
```

Không chạy AI/OCR nặng trên UI isolate.

---

# 36. ERROR HANDLING

Các lỗi:

```text
OCR_FAILED
IMAGE_INVALID
AI_TIMEOUT
AI_INVALID_JSON
NETWORK_ERROR
AUTH_EXPIRED
SYNC_CONFLICT
DATABASE_ERROR
BLUETOOTH_ERROR
DEVICE_NOT_SUPPORTED
```

Tất cả phải có user-friendly message.

---

# 37. SECURITY

- HTTPS bắt buộc.
- Không hard-code API secret trong APK.
- Không lưu password plaintext.
- Token lưu secure storage.
- Tenant isolation.
- Validate server-side.
- Rate limit API.
- Validate upload.
- Giới hạn kích thước ảnh.
- Kiểm tra MIME type.
- Audit log.

---

# 38. AI GUARDRAILS

AI không được:

- Khẳng định tuyệt đối khi thiếu dữ liệu.
- Bịa mã linh kiện.
- Bịa datasheet.
- Tự tạo thông số điện áp không có nguồn.
- Bỏ qua safety warning.
- Đề xuất thay linh kiện chỉ dựa trên ảnh nếu chưa đủ bằng chứng.

AI phải trả:

```text
confidence
evidence
uncertainty
next_test
```

---

# 39. DIAGNOSTIC ALGORITHM

```text
INPUT
 ↓
Normalize symptom
 ↓
Identify device category
 ↓
Identify circuit block
 ↓
Load known fault rules
 ↓
Load measurements
 ↓
Evaluate rules
 ↓
Score components
 ↓
Detect conflicting measurements
 ↓
Rank hypotheses
 ↓
Generate next tests
 ↓
Check safety
 ↓
Replacement matching
 ↓
Final diagnostic report
```

---

# 40. CIRCUIT BLOCK MODEL

Mạch có thể phân thành:

```text
AC INPUT
RECTIFIER
FILTER
PRIMARY SWITCH
PWM
TRANSFORMER
SECONDARY RECTIFIER
FEEDBACK
OUTPUT FILTER
LOAD
CONTROL
COMMUNICATION
```

Điều này giúp AI không phân tích PCB như một ảnh đơn thuần.

---

# 41. FAULT TREE

Ví dụ nguồn switching:

```text
No Output
│
├── AC input?
│    ├── NO → Input path
│    └── YES
│
├── Fuse?
│    ├── OPEN → Check short
│    └── OK
│
├── Bulk voltage?
│    ├── LOW → Rectifier/filter
│    └── OK
│
├── PWM VCC?
│    ├── LOW → Startup circuit
│    └── OK
│
├── Gate switching?
│    ├── NO → PWM/control
│    └── YES
│
└── Secondary output?
     ├── NO → Transformer/rectifier
     └── YES → Feedback/load
```

---

# 42. BLUETOOTH MULTIMETER

Phase 2.

```text
Flutter
 ↓ BLE
Meter
 ↓
Voltage
Current
Resistance
Frequency
```

Interface:

```dart
abstract class MeasurementDevice {
  Future<void> connect();
  Future<void> disconnect();
  Stream<Measurement> measurements();
}
```

Không phụ thuộc một thương hiệu.

---

# 43. OSCILLOSCOPE

Phase 3.

Dữ liệu:

```text
timestamp
channel
voltage
sampleRate
frequency
dutyCycle
rms
peak
```

AI có thể phân tích waveform:

```text
No switching
Unstable switching
Wrong frequency
High ripple
Distorted waveform
```

---

# 44. AUTOMATIC TEST SEQUENCE

Cho phép tạo:

```text
Test Profile: 12V SMPS

1. Input voltage
2. Fuse continuity
3. Bulk voltage
4. PWM VCC
5. Gate waveform
6. Secondary diode
7. Output voltage
8. Ripple
9. Load current
```

App đánh dấu:

```text
PASS
FAIL
WARNING
NOT TESTED
```

---

# 45. KNOWLEDGE LEARNING LOOP

Sau khi sửa thành công:

```text
Diagnostic Case
 ↓
Actual Fault
 ↓
Repair
 ↓
Final Measurement
 ↓
Verified Case
 ↓
Knowledge Base
```

Chỉ case được kỹ thuật viên xác nhận mới được tăng trọng số knowledge.

---

# 46. MACHINE LEARNING GIAI ĐOẠN SAU

Không cần ML ở MVP.

Giai đoạn sau có thể dùng:

```text
Fault classification
Component failure prediction
Similarity search
Embedding search
Image component detection
```

Dataset:

```text
PCB image
symptom
measurements
component
fault
repair
result
```

---

# 47. MVP PHASE 1

Bắt buộc:

```text
[✓] Flutter Android/Windows
[✓] Isar
[✓] Device management
[✓] PCB image
[✓] OCR
[✓] Component database
[✓] Measurement input
[✓] Rule engine
[✓] Diagnostic result
[✓] Replacement lookup
[✓] Repair history
[✓] PDF report
[✓] Offline mode
```

Chưa cần:

```text
AI vision phức tạp
BLE meter
Oscilloscope
Automatic PCB topology
```

---

# 48. PHASE 2

```text
[ ] Cloud sync
[ ] Neon
[ ] Vercel API
[ ] Cloud AI
[ ] Knowledge base
[ ] Datasheet metadata
[ ] Component equivalence engine
[ ] Multi-tenant
```

---

# 49. PHASE 3

```text
[ ] Local AI
[ ] BLE multimeter
[ ] USB multimeter
[ ] Oscilloscope
[ ] Waveform analysis
[ ] Advanced PCB recognition
```

---

# 50. PHASE 4

```text
[ ] AI vision
[ ] PCB topology
[ ] Automatic fault tree
[ ] Similar repair case search
[ ] Predictive diagnosis
[ ] Automatic test sequence
```

---

# 51. PROJECT DEVELOPMENT ORDER

```text
Step 01
Flutter skeleton

Step 02
Riverpod architecture

Step 03
Isar models

Step 04
Device management

Step 05
PCB image management

Step 06
Component database

Step 07
Measurement engine

Step 08
Rule engine

Step 09
Diagnostic UI

Step 10
Replacement engine

Step 11
Repair history

Step 12
PDF report

Step 13
Vercel API

Step 14
Neon schema

Step 15
Offline sync

Step 16
AI integration

Step 17
Local AI

Step 18
BLE meter

Step 19
Oscilloscope

Step 20
Advanced vision
```

---

# 52. ACCEPTANCE TEST

## Test 1 - Resistor

Input:

```text
R1 expected 1kΩ
measured 0Ω
```

Expected:

```text
R1 suspicious
```

Nhưng không kết luận R1 hỏng nếu chưa loại trừ đường song song.

## Test 2 - Diode

```text
Forward = 0.65V
Reverse = OL
```

Expected:

```text
Likely OK
```

## Test 3 - MOSFET

```text
D-S = near 0Ω
```

Expected:

```text
High suspicion
```

App phải đề nghị kiểm tra gate và các linh kiện liên quan.

## Test 4 - Power supply

```text
Input OK
Bulk OK
PWM VCC OK
No gate switching
```

Expected:

```text
PWM/control stage high suspicion
```

---

# 53. KHÔNG ĐƯỢC THIẾT KẾ THEO KIỂU

```text
Camera
 ↓
AI
 ↓
"Q3 hỏng"
```

Đây là mô hình không đáng tin cậy.

Phải dùng:

```text
Image
+
Circuit context
+
Symptom
+
Measurements
+
Rules
+
Knowledge
+
AI
 ↓
Ranked hypotheses
 ↓
Next measurement
 ↓
Confirmation
```

---

# 54. PRODUCT VISION

Mục tiêu cuối cùng:

> **Một "AI kỹ thuật viên điện tử" chạy trên điện thoại/laptop, có khả năng lưu hồ sơ thiết bị, đọc PCB, hiểu mã linh kiện, tiếp nhận kết quả đo, phân tích fault tree, đề xuất phép đo tiếp theo, tìm linh kiện thay thế và lưu lại toàn bộ quá trình sửa chữa.**

Kiến trúc ưu tiên:

```text
Flutter
+
Isar
+
Rule Engine
+
OCR
+
Local AI
+
Optional Cloud AI
+
Neon
+
Vercel API
+
BLE/USB Measurement
```

Trong đó:

**Rule Engine = nền tảng tin cậy**  
**AI = lớp suy luận/hỗ trợ**  
**Measurement = bằng chứng thực tế**  
**Knowledge Base = kinh nghiệm sửa chữa tích lũy**  
**Isar = offline-first**  
**Neon/Vercel = đồng bộ và quản trị cloud**

---

# 55. KẾT LUẬN

`ELECTRONIC_DIAGNOSTIC_FLUTTER` nên được phát triển như một **hệ thống chẩn đoán có bằng chứng**, không phải ứng dụng "AI nhìn ảnh rồi đoán linh kiện".

MVP nên tập trung vào:

1. Quản lý thiết bị.
2. Ảnh PCB.
3. OCR.
4. Database linh kiện.
5. Nhập measurement.
6. Rule engine.
7. Fault tree.
8. Diagnostic ranking.
9. Replacement matching.
10. Repair history.
11. PDF report.
12. Offline Isar.

Sau khi MVP ổn định mới thêm:

```text
Neon/Vercel
→ Cloud AI
→ Local AI
→ BLE multimeter
→ Oscilloscope
→ AI vision
→ PCB topology
→ tự động hóa quy trình đo.
```

**Tên file:** `ELECTRONIC_DIAGNOSTIC_FLUTTER.md`
