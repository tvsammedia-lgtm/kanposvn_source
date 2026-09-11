# FAMILY_TREE_FLUTTER_SAAS.md

# ĐẶC TẢ HỆ THỐNG QUẢN LÝ GIA PHẢ MULTI-TENANT SAAS
## Flutter + Isar + Vercel API + Neon PostgreSQL

**Version:** 1.0  
**Mục tiêu:** Chuyển web quản lý gia phả sang Flutter và biến thành SaaS phục vụ nhiều dòng họ độc lập.

---

## 1. MỤC TIÊU

Hệ thống phải:

- Phục vụ nhiều dòng họ trên cùng một nền tảng.
- Một tài khoản có thể tham gia nhiều dòng họ.
- Mỗi dòng họ là một Tenant độc lập.
- Cô lập dữ liệu tuyệt đối giữa các dòng họ.
- Chạy Android, Windows; có thể mở rộng Web/iOS.
- Offline-first bằng Isar.
- Đồng bộ qua Vercel API.
- Neon PostgreSQL là database trung tâm.
- Có Trial, gói thuê bao và giới hạn theo gói.
- Có phân quyền theo dòng họ, chi họ, nhánh họ.
- Có audit log, import/export, backup.
- Có khả năng mở rộng đến hàng nghìn dòng họ.

---

# 2. KIẾN TRÚC

```text
Flutter / Web / Zalo Mini App
          |
          v
 Authentication
          |
          v
 Family/Tenant Selector
          |
          v
+--------------------------+
| Flutter                  |
|--------------------------|
| Riverpod                 |
| Isar Local DB            |
| Sync Engine              |
| RBAC                     |
+------------+-------------+
             |
          HTTPS
             |
             v
+--------------------------+
| Vercel API               |
|--------------------------|
| Auth                     |
| Tenant Isolation         |
| RBAC                     |
| Genealogy                |
| Sync                     |
| Subscription             |
| Audit                    |
+------------+-------------+
             |
             v
+--------------------------+
| Neon PostgreSQL          |
+--------------------------+
```

---

# 3. MÔ HÌNH USER ĐÚNG

Không dùng:

```text
User -> Family
```

Mà dùng:

```text
User
 |
 +-- Membership --> Family A
 |
 +-- Membership --> Family B
 |
 +-- Membership --> Family C
```

Một user có thể:

```text
Dòng họ A = OWNER
Dòng họ B = MEMBER
Dòng họ C = VIEWER
```

---

# 4. USERS

```sql
CREATE TABLE users (
    id UUID PRIMARY KEY,
    email VARCHAR(255),
    phone VARCHAR(30),
    display_name VARCHAR(255),
    avatar_url TEXT,
    status VARCHAR(30) DEFAULT 'ACTIVE',
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

Không gắn trực tiếp `family_id` vào users.

---

# 5. FAMILIES / TENANTS

```sql
CREATE TABLE families (
    id UUID PRIMARY KEY,
    family_code VARCHAR(50) UNIQUE NOT NULL,
    family_name VARCHAR(255) NOT NULL,
    surname VARCHAR(100),
    description TEXT,
    logo_url TEXT,
    address TEXT,
    owner_user_id UUID REFERENCES users(id),
    status VARCHAR(30) DEFAULT 'ACTIVE',
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

Ví dụ:

```text
GP-000001 - Dòng họ Nguyễn
GP-000002 - Dòng họ Trần
GP-000003 - Dòng họ Lê
```

`family_code` dùng cho hiển thị, QR, hỗ trợ khách hàng; UUID dùng làm khóa nội bộ.

---

# 6. FAMILY MEMBERSHIP

```sql
CREATE TABLE family_members (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    user_id UUID NOT NULL REFERENCES users(id),
    role_id UUID,
    clan_id UUID,
    branch_id UUID,
    status VARCHAR(30) DEFAULT 'ACTIVE',
    joined_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE(family_id, user_id)
);
```

Membership là bảng quyết định user được vào Family nào.

---

# 7. ROLE / RBAC

Roles:

```text
SYSTEM_ADMIN
FAMILY_OWNER
FAMILY_ADMIN
CLAN_ADMIN
EDITOR
MEMBER
VIEWER
```

Permissions:

```text
family.view
family.edit
family.settings

member.view
member.invite
member.edit
member.remove

clan.view
clan.create
clan.edit
clan.delete

branch.view
branch.create
branch.edit
branch.delete

person.view
person.create
person.edit
person.delete
person.approve

document.view
document.upload
document.delete

event.view
event.create
event.edit

grave.view
grave.create
grave.edit

finance.view
finance.create
finance.edit

audit.view
backup.create
export.data
```

API phải kiểm tra permission; không được chỉ kiểm tra ở Flutter.

---

# 8. CẤU TRÚC DÒNG HỌ

```text
FAMILY
 |
 +-- CLAN 1
 |     +-- BRANCH A
 |     +-- BRANCH B
 |
 +-- CLAN 2
 |     +-- BRANCH A
 |     +-- BRANCH B
 |
 +-- CLAN 3
```

## clans

```sql
CREATE TABLE clans (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

## branches

```sql
CREATE TABLE branches (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    clan_id UUID REFERENCES clans(id),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

---

# 9. PERSON

```sql
CREATE TABLE persons (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    clan_id UUID REFERENCES clans(id),
    branch_id UUID REFERENCES branches(id),

    full_name VARCHAR(255) NOT NULL,
    gender VARCHAR(20),

    birth_date DATE,
    death_date DATE,

    birth_place TEXT,
    death_place TEXT,
    biography TEXT,
    photo_url TEXT,

    generation_no INTEGER,
    is_living BOOLEAN DEFAULT TRUE,
    is_public BOOLEAN DEFAULT TRUE,

    created_by UUID REFERENCES users(id),
    updated_by UUID REFERENCES users(id),

    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

Mọi truy vấn Person phải giới hạn `family_id`.

---

# 10. QUAN HỆ GIA PHẢ

Không chỉ dựa vào `father_id`, `mother_id`; dùng bảng quan hệ để mở rộng.

```sql
CREATE TABLE person_relationships (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    person_id UUID NOT NULL REFERENCES persons(id),
    related_person_id UUID NOT NULL REFERENCES persons(id),
    relationship_type VARCHAR(50) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

Các loại:

```text
FATHER
MOTHER
CHILD
SPOUSE
ADOPTIVE_FATHER
ADOPTIVE_MOTHER
ADOPTED_CHILD
```

---

# 11. HÔN NHÂN

```sql
CREATE TABLE marriages (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    person1_id UUID NOT NULL REFERENCES persons(id),
    person2_id UUID NOT NULL REFERENCES persons(id),
    marriage_date DATE,
    divorce_date DATE,
    note TEXT
);
```

Hỗ trợ:

- tái hôn;
- vợ/chồng đã mất;
- con riêng;
- con nuôi.

---

# 12. TIỂU SỬ

```sql
CREATE TABLE biographies (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    person_id UUID NOT NULL REFERENCES persons(id),
    content TEXT,
    occupation TEXT,
    achievements TEXT,
    education TEXT,
    military_history TEXT,
    notes TEXT,
    updated_at TIMESTAMPTZ DEFAULT now()
);
```

---

# 13. SỰ KIỆN DÒNG HỌ

```sql
CREATE TABLE family_events (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    title VARCHAR(255) NOT NULL,
    event_type VARCHAR(50),
    event_date DATE,
    location TEXT,
    description TEXT,
    created_by UUID REFERENCES users(id),
    created_at TIMESTAMPTZ DEFAULT now()
);
```

Ví dụ:

```text
Giỗ tổ
Họp họ
Mừng thọ
Tết
Khánh thành từ đường
Tu bổ nhà thờ họ
```

---

# 14. MỘ PHẦN

```sql
CREATE TABLE graves (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    person_id UUID REFERENCES persons(id),
    name VARCHAR(255),
    cemetery_name TEXT,
    address TEXT,
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    grave_image_url TEXT,
    note TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);
```

Có thể tích hợp bản đồ.

---

# 15. NHÀ THỜ HỌ / TỪ ĐƯỜNG

```sql
CREATE TABLE family_places (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    place_type VARCHAR(50),
    name VARCHAR(255),
    address TEXT,
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    description TEXT
);
```

---

# 16. TÀI LIỆU / ẢNH / VIDEO

```sql
CREATE TABLE documents (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    person_id UUID REFERENCES persons(id),
    title VARCHAR(255),
    document_type VARCHAR(50),
    file_url TEXT,
    storage_key TEXT,
    mime_type VARCHAR(100),
    file_size BIGINT,
    uploaded_by UUID REFERENCES users(id),
    created_at TIMESTAMPTZ DEFAULT now()
);
```

Neon chỉ lưu metadata; file lớn dùng object storage.

---

# 17. QUỸ DÒNG HỌ

Module có thể bật/tắt theo package.

```sql
CREATE TABLE family_funds (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    name VARCHAR(255),
    balance DECIMAL(18,2) DEFAULT 0
);
```

```sql
CREATE TABLE fund_transactions (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    fund_id UUID REFERENCES family_funds(id),
    type VARCHAR(20),
    amount DECIMAL(18,2),
    description TEXT,
    transaction_date DATE,
    created_by UUID REFERENCES users(id)
);
```

---

# 18. YÊU CẦU THAY ĐỔI DỮ LIỆU

Member không nên sửa trực tiếp thông tin tổ tiên quan trọng.

```text
Member
  |
  v
Change Request
  |
  v
Family Admin
  |
  +-- APPROVE
  +-- REJECT
```

```sql
CREATE TABLE change_requests (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    person_id UUID REFERENCES persons(id),
    requested_by UUID REFERENCES users(id),
    field_name VARCHAR(100),
    old_value TEXT,
    new_value TEXT,
    reason TEXT,
    status VARCHAR(30) DEFAULT 'PENDING',
    reviewed_by UUID REFERENCES users(id),
    reviewed_at TIMESTAMPTZ
);
```

---

# 19. AUDIT LOG

```sql
CREATE TABLE audit_logs (
    id UUID PRIMARY KEY,
    family_id UUID,
    user_id UUID,
    action VARCHAR(100),
    entity_type VARCHAR(100),
    entity_id UUID,
    old_data JSONB,
    new_data JSONB,
    created_at TIMESTAMPTZ DEFAULT now()
);
```

Ghi các thao tác:

```text
Tạo/sửa/xóa người
Thay đổi quan hệ
Duyệt thành viên
Thay đổi quyền
Upload/xóa tài liệu
Thay đổi cấu hình
```

---

# 20. SUBSCRIPTION

Ví dụ gói:

## FREE

```text
1 dòng họ
300 người
3 admin
500 MB
```

## STANDARD

```text
1 dòng họ
2.000 người
10 admin
5 GB
PDF/Excel export
Backup
```

## PRO

```text
1 dòng họ
10.000 người
20 admin
20 GB
QR
Mộ phần
Bản đồ
Quỹ dòng họ
Phân quyền nâng cao
```

## PREMIUM

```text
Dòng họ lớn
Nhiều chi/nhánh
Dung lượng lớn
Tùy chỉnh theo khách hàng
Hỗ trợ ưu tiên
```

---

# 21. SUBSCRIPTIONS TABLE

```sql
CREATE TABLE subscriptions (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    package_code VARCHAR(50),
    status VARCHAR(30),
    start_date TIMESTAMPTZ,
    expire_date TIMESTAMPTZ,
    max_persons INTEGER,
    max_users INTEGER,
    max_storage_bytes BIGINT,
    created_at TIMESTAMPTZ DEFAULT now()
);
```

Status:

```text
TRIAL
ACTIVE
EXPIRING
EXPIRED
SUSPENDED
READ_ONLY
```

Khi hết hạn chuyển READ_ONLY, không xóa dữ liệu.

---

# 22. TRIAL

Mặc định:

```text
7 ngày
```

Flow:

```text
Register
  |
Create Family
  |
Trial 7 days
  |
Full features
  |
Expired
  |
READ_ONLY
  |
Payment
  |
ACTIVE
```

---

# 23. INVITE

```sql
CREATE TABLE family_invites (
    id UUID PRIMARY KEY,
    family_id UUID NOT NULL REFERENCES families(id),
    email VARCHAR(255),
    phone VARCHAR(30),
    role_id UUID,
    token VARCHAR(255) UNIQUE,
    expires_at TIMESTAMPTZ,
    status VARCHAR(30) DEFAULT 'PENDING'
);
```

Hỗ trợ link và QR invitation.

---

# 24. LOGIN FLOW

```text
Flutter
  |
POST /api/v1/auth/login
  |
Vercel
  |
Verify user
  |
Load memberships
  |
Return user + families
```

Ví dụ response:

```json
{
  "user": {
    "id": "U001",
    "name": "Nguyen Van A"
  },
  "families": [
    {
      "id": "F001",
      "name": "Dòng họ Nguyễn",
      "role": "OWNER"
    },
    {
      "id": "F002",
      "name": "Dòng họ Trần",
      "role": "MEMBER"
    }
  ]
}
```

---

# 25. FAMILY SELECTOR

```text
CHỌN DÒNG HỌ

[ 🌳 Dòng họ Nguyễn ]
    OWNER

[ 🌳 Dòng họ Trần ]
    MEMBER
```

Lưu:

```text
currentFamilyId
```

Khi đổi family phải nạp lại permissions và tenant context.

---

# 26. FLUTTER STRUCTURE

```text
lib/
├── main.dart
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── storage/
│   ├── router/
│   └── utils/
├── auth/
├── tenant/
├── genealogy/
├── clans/
├── branches/
├── persons/
├── relationships/
├── marriages/
├── events/
├── graves/
├── documents/
├── funds/
├── members/
├── subscriptions/
├── notifications/
├── audit/
└── shared/
    ├── widgets/
    ├── dialogs/
    └── theme/
```

---

# 27. ISAR

Mỗi collection nghiệp vụ phải có:

```text
serverId
familyId
createdAt
updatedAt
isDeleted
syncStatus
version
```

Ví dụ:

```dart
@collection
class Person {
  Id id = Isar.autoIncrement;

  late String serverId;
  late String familyId;

  String? clanId;
  String? branchId;

  late String fullName;
  String? gender;

  DateTime? birthDate;
  DateTime? deathDate;

  bool isLiving = true;
  bool isDeleted = false;

  String? fatherServerId;
  String? motherServerId;

  int version = 1;
  String syncStatus = 'SYNCED';

  DateTime updatedAt = DateTime.now();
}
```

Query:

```dart
isar.persons
    .filter()
    .familyIdEqualTo(currentFamilyId)
    .findAll();
```

Không query toàn bộ rồi lọc ở UI.

---

# 28. LOCAL DATABASE

Khuyến nghị:

```text
Một Isar database
     |
     +-- Family A
     +-- Family B
     +-- Family C
```

Mỗi record có `familyId`.

Không cần một Isar database riêng cho từng dòng họ ở MVP.

---

# 29. SYNC ENGINE

Flow:

```text
User change
    |
    v
Isar
    |
    v
Sync Queue
    |
Internet?
    |
 YES
    |
Vercel API
    |
Neon
```

Sync status:

```text
SYNCED
PENDING_CREATE
PENDING_UPDATE
PENDING_DELETE
CONFLICT
```

---

# 30. CONFLICT

MVP:

```text
last-write-wins
```

Nhưng record quan trọng phải có:

```text
version
updated_at
updated_by
```

Server:

```text
client_version == server_version
```

Nếu không:

```text
HTTP 409 CONFLICT
```

Flutter hiển thị lựa chọn xử lý conflict.

---

# 31. API

Base:

```text
/api/v1
```

Auth:

```text
POST /auth/register
POST /auth/login
POST /auth/refresh
POST /auth/logout
```

Families:

```text
GET    /families
POST   /families
GET    /families/:id
PUT    /families/:id
```

Members:

```text
GET    /families/:id/members
POST   /families/:id/members/invite
PUT    /families/:id/members/:memberId
DELETE /families/:id/members/:memberId
```

Persons:

```text
GET    /families/:id/persons
POST   /families/:id/persons
GET    /families/:id/persons/:personId
PUT    /families/:id/persons/:personId
DELETE /families/:id/persons/:personId
```

Sync:

```text
POST /sync/push
POST /sync/pull
```

Subscription:

```text
GET  /families/:id/subscription
POST /families/:id/subscription/upgrade
```

---

# 32. SECURITY

Không tin các field sau do client gửi:

```text
family_id
role
permission
owner
```

Server phải:

```text
Authenticate
   |
Load membership
   |
Verify family access
   |
Verify permission
   |
Execute query
```

Mọi query phải tenant-safe:

```sql
WHERE family_id = :authorized_family_id
```

Không cho phép sửa URL `family_id` để truy cập tenant khác.

---

# 33. DATABASE INDEX

```sql
CREATE INDEX idx_person_family
ON persons(family_id);

CREATE INDEX idx_person_family_updated
ON persons(family_id, updated_at);

CREATE INDEX idx_relationship_family
ON person_relationships(family_id);

CREATE INDEX idx_documents_family
ON documents(family_id);

CREATE INDEX idx_audit_family_created
ON audit_logs(family_id, created_at);
```

---

# 34. DASHBOARD

```text
DÒNG HỌ NGUYỄN

Tổng thành viên      2.385
Nam                   1.190
Nữ                    1.195
Số đời                   12
Chi họ                    8
Nhánh                    23
Mộ phần                 410
Tài liệu                890
```

Quick actions:

```text
Cây gia phả
Thành viên
Chi họ
Nhánh họ
Sự kiện
Mộ phần
Tài liệu
Quỹ dòng họ
```

---

# 35. CÂY GIA PHẢ

Bắt buộc:

```text
Zoom
Pan
Search
Focus person
Expand/collapse
Theo đời
Theo chi
Theo nhánh
```

Các chế độ:

```text
TREE VIEW
LIST VIEW
TIMELINE VIEW
```

---

# 36. SEARCH

Tìm:

```text
Họ tên
Năm sinh
Năm mất
Chi họ
Nhánh
Đời
Nghề nghiệp
Nơi sinh
Nơi mất
```

Search luôn giới hạn theo `familyId`.

---

# 37. QR

Mỗi Person có mã:

```text
person_code
```

Ví dụ QR payload:

```text
GP:F001:P000123
```

Privacy:

```text
PUBLIC
MEMBER_ONLY
ADMIN_ONLY
```

---

# 38. PRIVACY

Người còn sống mặc định:

```text
MEMBER_ONLY
```

Thông tin nhạy cảm:

```text
phone
email
address
private documents
```

không public nếu chưa được phép.

---

# 39. IMPORT

Hỗ trợ:

```text
Excel
CSV
JSON
GEDCOM
```

Flow:

```text
Upload
  |
Parse
  |
Validate
  |
Preview
  |
Detect duplicates
  |
Confirm
  |
Insert
```

---

# 40. EXPORT

```text
Excel
CSV
JSON
PDF
GEDCOM
```

Phạm vi:

```text
Toàn bộ family
Một chi
Một nhánh
Một thế hệ
Một người
```

---

# 41. BACKUP

Admin có:

```text
Backup now
Auto backup
Restore
Export
```

Backup metadata/data:

```text
persons
relationships
marriages
clans
branches
events
documents metadata
settings
```

File media backup phải được xử lý riêng.

---

# 42. OFFLINE

Ứng dụng phải hoạt động khi mất Internet:

```text
Xem cây
Tìm kiếm
Thêm người
Sửa người
Xem dữ liệu đã cache
```

Hiển thị:

```text
ONLINE
OFFLINE
SYNCING
SYNC ERROR
```

---

# 43. MULTI-DEVICE

Một family có thể dùng:

```text
Windows
Android
Web
```

Flow:

```text
Windows sửa
   |
   v
Vercel + Neon
   |
   v
Android pull
```

---

# 44. DEVICE MANAGEMENT

Có thể có:

```sql
user_devices
- id
- user_id
- device_id
- device_name
- platform
- app_version
- last_seen
```

---

# 45. VERSION API

```text
/api/v1
```

Breaking change:

```text
/api/v2
```

Flutter gửi:

```text
X-App-Version
X-Platform
X-Api-Version
```

---

# 46. ERROR FORMAT

```json
{
  "success": false,
  "error": {
    "code": "FAMILY_ACCESS_DENIED",
    "message": "Bạn không có quyền truy cập dòng họ này."
  }
}
```

---

# 47. MODULE NGÀY GIỖ

Person có:

```text
death_date
```

Hệ thống hỗ trợ ngày giỗ âm lịch.

Reminder:

```text
7 ngày trước
1 ngày trước
Ngày sự kiện
```

Phải có module chuyển đổi âm/dương riêng, không giả định chuyển đổi đơn giản.

---

# 48. NOTIFICATION

```text
Lời mời tham gia dòng họ
Yêu cầu thay đổi dữ liệu
Duyệt thành viên
Sự kiện mới
Ngày giỗ sắp tới
Subscription sắp hết
```

---

# 49. SYSTEM ADMIN

Dashboard:

```text
Tổng dòng họ
Trial
Active
Expired
Suspended
Tổng users
Tổng persons
Storage
Doanh thu
```

Quyền:

```text
Create family
Suspend family
Activate family
Change package
Reset subscription
View audit
```

Không mặc định sửa dữ liệu gia phả.

---

# 50. ONBOARDING

```text
Bước 1: Tạo tài khoản
Bước 2: Tạo dòng họ
Bước 3: Nhập người đại diện
Bước 4: Tạo tenant
Bước 5: Trial 7 ngày
Bước 6: Nhập dữ liệu gia phả
Bước 7: Mời thành viên
```

Khách tự đăng ký, không cần admin tạo family thủ công.

---

# 51. FAMILY CODE

```text
family_id = UUID
family_code = GP-000123
```

UUID là khóa nội bộ; code dùng để hiển thị và hỗ trợ.

---

# 52. SESSION

Flutter lưu:

```text
userId
currentFamilyId
role
permissions
accessToken
refreshToken
```

Khi đổi family:

```text
currentFamilyId
  |
reload membership
  |
reload permissions
  |
reload dashboard
```

---

# 53. LOGOUT

```text
clear access token
clear refresh token
clear currentFamilyId
```

Không tự động xóa toàn bộ dữ liệu offline của user nếu chưa có yêu cầu.

---

# 54. MVP PHASE 1

```text
Authentication
Multi-family
Family selector
RBAC
Clans
Branches
Persons
Relationships
Family tree
Search
Isar
Sync
Vercel API
Neon
Audit
```

---

# 55. PHASE 2

```text
Events
Documents
Photos
Graves
QR
Import Excel
Export Excel/PDF
Backup
Notifications
```

---

# 56. PHASE 3

```text
Family Fund
GEDCOM
Map
Anniversary
Push notification
Subscription
Payment
Zalo Mini App
```

---

# 57. PHASE 4 - AI

```text
OCR tài liệu cổ
Trích xuất gia phả từ PDF
Đọc chữ từ ảnh
Phát hiện dữ liệu trùng
Gợi ý quan hệ
Tạo tóm tắt tiểu sử
Tìm kiếm ngôn ngữ tự nhiên
```

AI không tự động sửa dữ liệu quan trọng nếu chưa được người có quyền xác nhận.

---

# 58. SCREEN LIST

```text
Splash
Login
Register
Forgot Password

Family Selector
Create Family
Dashboard

Family Profile
Family Settings

Clan List
Clan Detail
Branch List
Branch Detail

Person List
Person Add
Person Detail
Person Edit

Family Tree
Relationship Editor
Marriage Editor

Event List
Event Detail

Grave List
Grave Detail
Grave Map

Document List
Document Viewer

Member List
Invite Member
Role Management

Change Requests
Audit Logs

Family Fund
Fund Transactions
Fund Reports

Subscription
Packages
Payment

Sync Center
Backup
Import
Export

System Admin
```

---

# 59. QUY TẮC DATABASE BẮT BUỘC

1. Mọi bảng nghiệp vụ phải có `family_id`.
2. Không tin `family_id` từ client.
3. Không tin role từ client.
4. API luôn kiểm tra membership.
5. API luôn kiểm tra permission.
6. Tenant A không được đọc tenant B.
7. Dữ liệu quan trọng dùng soft delete.
8. Có audit log.
9. Có optimistic concurrency.
10. Có migration strategy.
11. Có index theo `family_id`.
12. Các endpoint nested dưới family phải kiểm tra entity thuộc đúng family.

---

# 60. TEST MULTI-TENANT

Automated tests bắt buộc:

```text
User A -> Family A = ALLOW
User A -> Family B = DENY

Admin A -> Person A = ALLOW
Admin A -> Person B = DENY

Clan Admin -> Clan A = ALLOW
Clan Admin -> Clan B = DENY

Viewer -> Person view = ALLOW
Viewer -> Person edit = DENY
```

Test cả trường hợp sửa ID trong URL/body để chống IDOR.

---

# 61. ACCEPTANCE CRITERIA

MVP đạt khi:

- Tạo được nhiều dòng họ.
- Một user tham gia nhiều dòng họ.
- Chuyển family trong Flutter.
- Dữ liệu được cô lập.
- RBAC hoạt động.
- Có cây gia phả.
- Có chi/nhánh.
- Có offline mode.
- Có sync.
- Có conflict handling.
- Có audit.
- Có Trial.
- Có subscription.
- Có import/export cơ bản.
- Không thể truy cập tenant khác bằng cách sửa request.
- Chạy ổn Android và Windows.

---

# 62. THỨ TỰ CODE CHO AI AGENT

Không code tất cả cùng lúc.

```text
1. Project Flutter
2. Core + Router + Theme
3. Neon database migration
4. Vercel API skeleton
5. Authentication
6. User
7. Family/Tenant
8. Membership
9. RBAC
10. Clan
11. Branch
12. Person
13. Relationship
14. Marriage
15. Family Tree
16. Isar local models
17. Repository layer
18. Sync queue
19. Push/Pull sync
20. Conflict handling
21. Audit
22. Import/Export
23. Documents
24. Events
25. Graves
26. QR
27. Subscription
28. Trial
29. Payment
30. Notifications
31. Admin dashboard
32. Automated tests
```

---

# 63. NGUYÊN TẮC CODE

AI Agent phải:

- Không bỏ qua tenant isolation.
- Không viết query không có family scope.
- Không đặt business logic quan trọng chỉ trong UI.
- Repository không tự lấy `currentFamilyId` từ dữ liệu không đáng tin.
- API phải xác thực lại mọi quyền.
- Không hard-code subscription limits.
- Dùng migration cho schema.
- Có unit test cho permission.
- Có integration test cho tenant isolation.
- Không phá dữ liệu local khi sync.
- Không tự động xóa dữ liệu server khi local record bị thiếu.
- Soft delete phải được đồng bộ.

---

# 64. KẾT LUẬN KIẾN TRÚC

Mô hình chuẩn:

```text
USER
  |
  v
FAMILY MEMBERSHIP
  |
  v
FAMILY / TENANT
  |
  +-- CLAN
       |
       +-- BRANCH
            |
            +-- PERSON
                 |
                 +-- RELATIONSHIPS
                 +-- MARRIAGES
                 +-- BIOGRAPHY
                 +-- EVENTS
                 +-- GRAVES
                 +-- DOCUMENTS
```

Với SaaS:

```text
User
 |
 +---- Family A
 |
 +---- Family B
 |
 +---- Family C
```

Với backend:

```text
Flutter
   |
Isar
   |
Sync Engine
   |
Vercel API
   |
Neon PostgreSQL
```

Đây là kiến trúc được ưu tiên để dùng một codebase cho hàng trăm/hàng nghìn dòng họ.

**Ưu tiên số 1:** Multi-Tenant + RBAC + Data Isolation + Offline Sync.

**Ưu tiên số 2:** Genealogy Core.

**Ưu tiên số 3:** Subscription + Payment.

**Ưu tiên số 4:** Documents + Events + Graves + Family Fund.

**Ưu tiên số 5:** AI và các tính năng nâng cao.
