# QR ORDER – ĐẶC TẢ KỸ THUẬT
## Flutter + Isar + Vercel API + Neon PostgreSQL

**Phiên bản:** 1.0  
**Mục tiêu:** Cho phép khách dùng điện thoại quét QR tại bàn, xem menu, tự order không cần cài app; POS Flutter nhận đơn và quản lý toàn bộ vòng đời đơn hàng.

---

# 1. Kiến trúc tổng thể

```text
                    QR CODE TRÊN BÀN
                           |
                           v
                 MOBILE WEB ORDER
                 (không cần cài app)
                           |
                         HTTPS
                           |
                           v
                     VERCEL API
                           |
                           v
                      NEON DB
                           |
              +------------+-------------+
              |                          |
              v                          v
       FLUTTER POS                  KITCHEN/BAR
       + ISAR LOCAL                 SCREEN/POS
              |
              v
        Offline-first
        + Cloud Sync
```

## Thành phần

- Flutter POS: Android / Windows.
- Isar: database local cho POS.
- Neon PostgreSQL: database cloud trung tâm.
- Vercel Functions/API: authentication, QR validation, menu, order, payment, sync.
- Mobile Web Order: React/Next.js/Vite hoặc web frontend tương thích API.
- Kitchen/Bar: có thể là màn hình Flutter riêng hoặc module trong POS.

---

# 2. Nguyên tắc quan trọng

## 2.1 QR không chứa dữ liệu nhạy cảm

Ví dụ:

```text
https://order.example.com/o/CN01/T01
```

Trong đó:

- `CN01`: branch/app context.
- `T01`: mã bàn.

Server phải kiểm tra QR trước khi cho phép order.

## 2.2 Không tin dữ liệu giá từ điện thoại khách

Mobile Web chỉ gửi:

```json
{
  "product_id": "P001",
  "quantity": 2,
  "note": "Không hành"
}
```

Server lấy giá/menu hiện tại từ Neon DB.

Không nhận:

```json
{
  "price": 1000
}
```

làm giá chính thức.

## 2.3 Server là nguồn dữ liệu cloud

- Neon là source of truth cho order online.
- Isar là local cache/offline database của POS.
- POS đồng bộ order từ Neon.
- Không cho client tự sửa dữ liệu cloud ngoài API được phép.

---

# 3. Multi-tenant / app_code

Mọi dữ liệu phải gắn với:

```text
app_code
branch_id
```

Ví dụ:

```text
app_code = KANPOS001
branch_id = CN01
```

Không được để một khách hàng nhìn thấy menu/order của app_code khác.

Tất cả API phải kiểm tra tenant:

```text
request
  -> authenticate/validate
  -> resolve app_code
  -> resolve branch
  -> validate resource ownership
  -> execute
```

---

# 4. Database Neon

## 4.1 branches

```sql
CREATE TABLE branches (
    id UUID PRIMARY KEY,
    app_code VARCHAR(50) NOT NULL,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    address TEXT,
    phone VARCHAR(50),
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

## 4.2 dining_tables

```sql
CREATE TABLE dining_tables (
    id UUID PRIMARY KEY,
    app_code VARCHAR(50) NOT NULL,
    branch_id UUID NOT NULL,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(100),
    area_name VARCHAR(100),
    capacity INT DEFAULT 4,
    active BOOLEAN DEFAULT TRUE,
    qr_token VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

## 4.3 categories

```sql
CREATE TABLE menu_categories (
    id UUID PRIMARY KEY,
    app_code VARCHAR(50) NOT NULL,
    branch_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    sort_order INT DEFAULT 0,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

## 4.4 menu_items

```sql
CREATE TABLE menu_items (
    id UUID PRIMARY KEY,
    app_code VARCHAR(50) NOT NULL,
    branch_id UUID NOT NULL,
    category_id UUID,
    code VARCHAR(100),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    image_url TEXT,
    price NUMERIC(18,2) NOT NULL DEFAULT 0,
    kitchen_station VARCHAR(30) DEFAULT 'KITCHEN',
    active BOOLEAN DEFAULT TRUE,
    allow_qr_order BOOLEAN DEFAULT TRUE,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

`kitchen_station`:

```text
KITCHEN
BAR
BAKERY
OTHER
```

## 4.5 table_sessions

Một phiên bàn cho phép nhiều khách cùng order.

```sql
CREATE TABLE table_sessions (
    id UUID PRIMARY KEY,
    app_code VARCHAR(50) NOT NULL,
    branch_id UUID NOT NULL,
    table_id UUID NOT NULL,
    session_code VARCHAR(100) UNIQUE NOT NULL,
    status VARCHAR(30) DEFAULT 'OPEN',
    opened_at TIMESTAMPTZ DEFAULT NOW(),
    closed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

Status:

```text
OPEN
LOCKED
CLOSED
CANCELLED
```

## 4.6 orders

```sql
CREATE TABLE orders (
    id UUID PRIMARY KEY,
    app_code VARCHAR(50) NOT NULL,
    branch_id UUID NOT NULL,
    table_id UUID,
    session_id UUID,
    order_no VARCHAR(50) NOT NULL,
    source VARCHAR(30) DEFAULT 'QR',
    status VARCHAR(30) DEFAULT 'NEW',
    subtotal NUMERIC(18,2) DEFAULT 0,
    discount NUMERIC(18,2) DEFAULT 0,
    tax NUMERIC(18,2) DEFAULT 0,
    total NUMERIC(18,2) DEFAULT 0,
    customer_name VARCHAR(255),
    customer_note TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

Source:

```text
POS
QR
STAFF
PHONE
OTHER
```

Status:

```text
NEW
CONFIRMED
PREPARING
READY
SERVED
CANCELLED
PAID
COMPLETED
```

## 4.7 order_items

```sql
CREATE TABLE order_items (
    id UUID PRIMARY KEY,
    order_id UUID NOT NULL,
    menu_item_id UUID NOT NULL,
    item_name_snapshot VARCHAR(255) NOT NULL,
    unit_price_snapshot NUMERIC(18,2) NOT NULL,
    quantity NUMERIC(18,3) NOT NULL,
    subtotal NUMERIC(18,2) NOT NULL,
    note TEXT,
    kitchen_station VARCHAR(30),
    status VARCHAR(30) DEFAULT 'NEW',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

Snapshot tên/giá là bắt buộc để lịch sử hóa đơn không thay đổi khi menu thay đổi.

---

# 5. QR Code

## 5.1 Tạo QR

Admin/POS:

```text
Quản lý bàn
   |
   +-- Bàn 01
   +-- Bàn 02
   +-- Bàn 03
   |
   +-- Tạo QR
   +-- Xem QR
   +-- In QR
   +-- Tải QR
```

QR URL:

```text
https://order.example.com/o/{qr_token}
```

Không nên dùng ID database tuần tự làm token công khai.

## 5.2 QR validation

API:

```http
GET /api/qr/{token}
```

Response:

```json
{
  "valid": true,
  "app_code": "KANPOS001",
  "branch_id": "CN01",
  "table_id": "T01",
  "table_name": "Bàn 01",
  "store_name": "Quán ABC"
}
```

Nếu QR bị khóa:

```json
{
  "valid": false,
  "reason": "QR_DISABLED"
}
```

---

# 6. Mobile Web Order

## 6.1 Màn hình

```text
[LOGO]
QUÁN ABC

Bàn 01

----------------------
Món ăn
----------------------

Phở bò
55.000đ
[-] 1 [+]

Cơm sườn
60.000đ
[-] 0 [+]

Cà phê
30.000đ
[-] 0 [+]

----------------------
🛒 Xem giỏ hàng
```

## 6.2 Giỏ hàng

```text
GIỎ HÀNG

Phở bò       x2     110.000
Cà phê       x1      30.000

Tạm tính             140.000

Ghi chú:
[________________]

[ GỬI ORDER ]
```

## 6.3 Xác nhận

Hiển thị:

```text
Bàn 01

Phở bò x2
Cà phê x1

Tổng: 140.000đ

[ XÁC NHẬN GỬI ORDER ]
```

---

# 7. API tạo order

```http
POST /api/public/orders
```

Request:

```json
{
  "qr_token": "xxx",
  "session_id": "optional",
  "items": [
    {
      "menu_item_id": "P001",
      "quantity": 2,
      "note": "Không hành"
    },
    {
      "menu_item_id": "P002",
      "quantity": 1,
      "note": "Ít đá"
    }
  ],
  "customer_note": ""
}
```

Server:

1. Validate QR.
2. Xác định app_code.
3. Xác định branch.
4. Xác định table.
5. Mở hoặc lấy table_session.
6. Validate menu item.
7. Kiểm tra `allow_qr_order`.
8. Lấy giá từ database.
9. Tính subtotal.
10. Tạo order.
11. Tạo order_items.
12. Commit transaction.
13. Trả order.

Response:

```json
{
  "success": true,
  "order_id": "uuid",
  "order_no": "000125",
  "status": "NEW",
  "total": 140000
}
```

---

# 8. Chống gửi trùng order

Mobile có thể mất mạng rồi khách bấm lại.

Client tạo:

```text
idempotency_key = UUID
```

Request:

```http
Idempotency-Key: 9c3...
```

Server lưu key.

Nếu request gửi lại:

```text
same key
    -> không tạo order mới
    -> trả order cũ
```

Đây là chức năng bắt buộc.

---

# 9. Table Session

Khi khách đầu tiên quét QR:

```text
Bàn 01
   |
   v
Không có session OPEN
   |
   v
Tạo SESSION-20260903-001
```

Khách thứ hai quét cùng QR:

```text
Bàn 01
   |
   v
đã có session OPEN
   |
   v
dùng session hiện tại
```

Các order:

```text
SESSION-001
   |
   +-- Order 101
   +-- Order 102
   +-- Order 103
```

POS hiển thị tổng hợp:

```text
BÀN 01

Phở bò       x2
Cơm sườn     x1
Cà phê       x3

Tổng: 225.000
```

---

# 10. Flutter POS – Isar

Các collection chính:

```text
BranchLocal
DiningTableLocal
MenuCategoryLocal
MenuItemLocal
TableSessionLocal
OrderLocal
OrderItemLocal
SyncQueueLocal
```

## OrderLocal

Ví dụ:

```dart
@collection
class OrderLocal {
  Id localId = Isar.autoIncrement;

  late String serverId;
  late String appCode;
  late String branchId;
  String? tableId;
  String? sessionId;

  late String orderNo;
  late String source;
  late String status;

  double subtotal = 0;
  double discount = 0;
  double tax = 0;
  double total = 0;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  bool synced = true;
}
```

Tên field có thể điều chỉnh theo model hiện tại của project.

---

# 11. Đồng bộ QR Order về POS

## Phương án ưu tiên

Nếu chưa triển khai WebSocket/SSE, dùng polling:

```text
Flutter POS
   |
   | GET /api/sync/orders?updated_after=...
   |
   v
Vercel
   |
   v
Neon
```

Tần suất đề xuất:

```text
2–5 giây
```

Khi có order mới:

```text
Neon
  |
  v
Vercel API
  |
  v
Flutter POS
  |
  v
Isar
  |
  v
Notification
```

## Sau này nâng cấp

Có thể dùng:

```text
SSE
WebSocket
Realtime provider
```

để giảm polling.

---

# 12. POS – thông báo order mới

Khi order:

```text
status = NEW
source = QR
```

POS:

```text
🔔 ORDER MỚI

Bàn 01
#000125

Phở bò x2
Cà phê x1

[ XEM ]
[ NHẬN ĐƠN ]
```

Âm thanh:

```text
new_order.mp3
```

Cho phép bật/tắt âm thanh.

---

# 13. Màn hình Order POS

```text
ORDER #000125

Bàn: 01
Nguồn: QR

--------------------------------
Phở bò             x2
Không hành

Cà phê sữa         x1
Ít đá
--------------------------------

Tổng: 140.000đ

[ XÁC NHẬN ]
[ TỪ CHỐI ]
```

---

# 14. Bếp / Bar

Order item phải có:

```text
kitchen_station
```

Ví dụ:

```text
ORDER #125

BẾP
  Phở bò x2

BAR
  Cà phê sữa x1
```

Bếp chỉ thấy món:

```text
PHỞ BÒ x2
BÀN 01

[ ĐANG LÀM ]
[ HOÀN THÀNH ]
```

Bar chỉ thấy:

```text
CÀ PHÊ SỮA x1
BÀN 01

[ ĐANG LÀM ]
[ HOÀN THÀNH ]
```

Khi tất cả item hoàn thành:

```text
order.status = READY
```

---

# 15. Gọi nhân viên

Mobile Web có nút:

```text
[ 🔔 GỌI NHÂN VIÊN ]
```

API:

```http
POST /api/public/call-staff
```

Database:

```text
staff_calls
```

Fields:

```text
id
app_code
branch_id
table_id
session_id
type
status
created_at
resolved_at
```

Type:

```text
CALL_STAFF
REQUEST_BILL
REQUEST_WATER
OTHER
```

POS:

```text
🔔 Bàn 01 gọi nhân viên

[ ĐÃ XỬ LÝ ]
```

---

# 16. Thanh toán

Sau khi order:

```text
Tổng: 350.000đ

[ Thanh toán tại quầy ]
[ Thanh toán QR ]
```

Nếu thanh toán QR:

```text
CREATE PAYMENT
      |
      v
Payment Gateway
      |
      v
Webhook
      |
      v
Vercel API
      |
      v
Neon
      |
      v
Order = PAID
```

Không đánh dấu `PAID` chỉ dựa trên callback từ trình duyệt khách.

Server phải xác minh trạng thái thanh toán từ payment provider/webhook.

---

# 17. Thanh toán tại quầy

Khách bấm:

```text
[ YÊU CẦU THANH TOÁN ]
```

POS:

```text
🔔 Bàn 01 yêu cầu thanh toán

Tổng: 350.000đ

[ IN HÓA ĐƠN ]
[ THANH TOÁN ]
```

---

# 18. Trạng thái order

```text
NEW
 |
 v
CONFIRMED
 |
 v
PREPARING
 |
 v
READY
 |
 v
SERVED
 |
 v
PAID
 |
 v
COMPLETED
```

Nhánh lỗi:

```text
NEW
 |
 +--> CANCELLED
```

Không cho client mobile tự thay đổi trạng thái quan trọng.

---

# 19. Phân quyền API

## Public

Cho khách:

```text
GET  /api/public/qr/:token
GET  /api/public/menu/:token
POST /api/public/orders
POST /api/public/call-staff
GET  /api/public/orders/:id
```

Public API phải giới hạn dữ liệu.

Không trả:

```text
cost_price
profit
supplier
internal_user
admin data
```

## POS authenticated

```text
GET    /api/orders
PATCH  /api/orders/:id/status
GET    /api/tables
POST   /api/tables
POST   /api/tables/:id/qr
GET    /api/sync
```

## Admin

```text
CRUD menu
CRUD category
CRUD tables
CRUD branches
QR management
Reports
Settings
```

---

# 20. Bảo mật

Bắt buộc:

- HTTPS.
- Validate tất cả input.
- UUID/token khó đoán.
- Rate limit public order API.
- Idempotency.
- SQL parameterization.
- Không đưa Neon connection string vào Flutter/mobile web.
- Không đưa Vercel secret vào frontend.
- Không tin giá từ client.
- Kiểm tra tenant ở server.
- Kiểm tra QR thuộc đúng branch.
- Log thao tác quan trọng.
- Webhook payment phải xác thực chữ ký.
- Có cơ chế khóa QR.
- Có cơ chế đóng session.

---

# 21. Xử lý QR bị giả mạo

Không dùng:

```text
?table=1
```

làm căn cứ duy nhất.

Nên:

```text
QR_TOKEN = random 128-bit hoặc UUID/secure token
```

Database:

```text
qr_token -> table_id -> branch_id -> app_code
```

Server lookup token.

---

# 22. Menu cache

Mobile Web có thể cache menu ngắn hạn.

POS dùng Isar:

```text
Neon
  |
  v
Vercel
  |
  v
Isar
```

Nếu POS mất Internet:

```text
POS vẫn xem menu
POS vẫn bán hàng local
```

Nhưng:

```text
QR Online Order
```

phụ thuộc Internet/API.

---

# 23. Đồng bộ POS offline

Mỗi bản ghi có:

```text
serverId
updatedAt
syncStatus
```

Sync queue:

```text
PENDING
SYNCING
SYNCED
FAILED
```

Retry:

```text
1s
2s
5s
10s
30s
60s
```

Không tạo bản ghi duplicate.

---

# 24. Xử lý conflict

Quy tắc:

```text
Order mới từ QR
    -> server tạo
    -> POS nhận

Order status
    -> server/API là nguồn chính

Menu
    -> admin/server là nguồn chính

POS offline order
    -> tạo local UUID
    -> queue
    -> sync server
```

Không dùng timestamp đơn giản để ghi đè toàn bộ order nếu có thể tránh.

---

# 25. API đề xuất

```text
/api/public/qr/:token
/api/public/menu/:token
/api/public/session/open
/api/public/orders
/api/public/orders/:id
/api/public/call-staff

/api/auth/login

/api/branches
/api/tables
/api/tables/:id
/api/tables/:id/qr

/api/menu/categories
/api/menu/items

/api/orders
/api/orders/:id
/api/orders/:id/status

/api/kitchen/orders
/api/kitchen/items/:id/status

/api/payments/create
/api/payments/webhook

/api/sync/orders
/api/sync/menu
/api/sync/all
```

---

# 26. Thư mục Web Order

Ví dụ:

```text
order-web/
├── src/
│   ├── pages/
│   │   ├── QrLanding
│   │   ├── Menu
│   │   ├── Cart
│   │   ├── Checkout
│   │   └── OrderStatus
│   ├── components/
│   ├── services/
│   │   └── api.ts
│   ├── store/
│   └── types/
├── public/
└── package.json
```

---

# 27. Flutter structure

```text
lib/
├── core/
│   ├── api/
│   ├── auth/
│   ├── sync/
│   └── database/
│
├── features/
│   ├── tables/
│   ├── qr_order/
│   ├── orders/
│   ├── kitchen/
│   ├── menu/
│   ├── payment/
│   └── reports/
│
├── models/
└── main.dart
```

---

# 28. Riverpod

Có thể tổ chức:

```text
orderProvider
orderListProvider
newQrOrderProvider
tableSessionProvider
menuProvider
syncProvider
kitchenProvider
staffCallProvider
```

Khi sync có order mới:

```dart
ref.invalidate(orderListProvider);
ref.invalidate(newQrOrderProvider);
```

---

# 29. Luồng hoàn chỉnh

```text
1. Admin tạo Bàn 01
          |
2. Server tạo QR token
          |
3. In QR đặt tại Bàn 01
          |
4. Khách quét QR
          |
5. Web gọi API validate QR
          |
6. Web tải menu
          |
7. Khách chọn món
          |
8. Khách gửi order
          |
9. Vercel validate + transaction
          |
10. Neon lưu Order
          |
11. POS sync
          |
12. Isar lưu local
          |
13. POS phát âm thanh
          |
14. Nhân viên xác nhận
          |
15. Bếp/Bar nhận món
          |
16. Món READY
          |
17. Phục vụ
          |
18. Thanh toán
          |
19. PAID
          |
20. COMPLETED
```

---

# 30. MVP nên làm trước

Không nên làm tất cả cùng lúc.

## Phase 1

```text
✓ Tables
✓ QR generation
✓ QR validation
✓ Menu online
✓ Cart
✓ Create order
✓ POS nhận order
✓ Order status
```

## Phase 2

```text
✓ Table session
✓ Nhiều khách cùng bàn
✓ Kitchen
✓ Bar
✓ Gọi nhân viên
```

## Phase 3

```text
✓ QR Payment
✓ Voucher
✓ Discount
✓ Customer account
✓ Loyalty
```

## Phase 4

```text
✓ Realtime WebSocket/SSE
✓ Analytics
✓ AI sales analysis
✓ Recommendation
✓ Customer history
```

---

# 31. Acceptance Test

## Test 1 – QR

```text
Quét QR Bàn 01
=> đúng cửa hàng
=> đúng chi nhánh
=> đúng Bàn 01
```

## Test 2 – Order

```text
Chọn Phở x2
=> gửi
=> server tạo 1 order
=> POS nhận 1 order
```

## Test 3 – Double click

```text
Bấm Gửi 2 lần
=> chỉ tạo 1 order
```

## Test 4 – Hai khách

```text
Khách A + Khách B cùng Bàn 01
=> cùng session
=> POS gom đúng món
```

## Test 5 – Giá

```text
Client gửi price giả
=> server bỏ qua
=> dùng giá Neon
```

## Test 6 – QR khác tenant

```text
Dùng QR của app_code A
truy cập resource app_code B
=> DENIED
```

## Test 7 – QR khóa

```text
QR disabled
=> không cho order
```

## Test 8 – Bếp

```text
Phở -> KITCHEN
Cà phê -> BAR
=> mỗi station chỉ nhận đúng món
```

## Test 9 – Thanh toán

```text
Payment webhook hợp lệ
=> PAID
```

Webhook giả:

```text
=> không đổi PAID
```

---

# 32. Checklist triển khai

```text
[ ] Neon database
[ ] SQL migration
[ ] Vercel project
[ ] Environment variables
[ ] API authentication
[ ] QR token
[ ] QR generator
[ ] Mobile Web
[ ] Menu
[ ] Cart
[ ] Order API
[ ] Idempotency
[ ] Flutter Isar models
[ ] POS sync
[ ] New order notification
[ ] Kitchen
[ ] Bar
[ ] Staff call
[ ] Payment
[ ] Webhook
[ ] Logging
[ ] Rate limit
[ ] Backup
[ ] Production testing
```

---

# 33. Environment variables

Vercel:

```text
DATABASE_URL=
JWT_SECRET=
APP_BASE_URL=
ORDER_WEB_URL=
PAYMENT_SECRET=
PAYMENT_WEBHOOK_SECRET=
```

Không commit vào GitHub.

Flutter chỉ sử dụng:

```text
API_BASE_URL
```

Không chứa:

```text
DATABASE_URL
JWT_SECRET
PAYMENT_SECRET
```

---

# 34. Kết luận

Kiến trúc phù hợp nhất cho hệ thống là:

```text
QR
 ↓
Mobile Web
 ↓
Vercel API
 ↓
Neon
 ↓
Flutter POS
 ↓
Isar
```

Trong đó:

- QR xác định bàn.
- Mobile Web chỉ là giao diện order.
- Vercel kiểm tra và xử lý nghiệp vụ.
- Neon lưu dữ liệu cloud.
- Flutter POS quản lý vận hành.
- Isar giúp POS hoạt động offline-first.
- Order dùng `idempotency_key` chống tạo trùng.
- `app_code + branch_id` đảm bảo multi-tenant.
- `table_session` cho phép nhiều khách cùng bàn.
- `snapshot price/name` bảo vệ lịch sử đơn hàng.

Đây là nền tảng có thể mở rộng từ quán nhỏ lên mô hình nhiều chi nhánh.
