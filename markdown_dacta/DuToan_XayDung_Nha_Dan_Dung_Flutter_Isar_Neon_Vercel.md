# Đặc tả ứng dụng Flutter – Dự toán vật tư & chi phí xây dựng nhà dân dụng

## 1. Mục tiêu

Xây dựng ứng dụng Flutter chạy **Android + Windows** để lập dự toán nhanh cho công trình nhà ở dân sinh theo:

- Diện tích xây dựng (m²).
- Số tầng.
- Cấp công trình: **Cấp 1, Cấp 2, Cấp 3, Cấp 4**.
- Loại kết cấu, mức hoàn thiện và các tùy chọn vật tư.
- Định mức vật tư do người dùng cấu hình.
- Đơn giá vật tư và nhân công theo từng thời điểm/địa phương.

Ứng dụng hoạt động **offline-first** bằng Isar và đồng bộ dữ liệu với **Neon PostgreSQL thông qua API trên Vercel**.

Các nhóm chi phí chính:

1. Cát.
2. Đá.
3. Xi măng.
4. Sắt/thép.
5. Ống nước và phụ kiện.
6. Dây điện, ống luồn và thiết bị điện cơ bản.
7. Nhân công thợ xây.
8. Nhân công thợ điện.
9. Nhân công thợ nước.

> Lưu ý: định mức trong ứng dụng phải được coi là dữ liệu tham khảo/cấu hình. Không hard-code một bộ định mức duy nhất vì thực tế thay đổi theo thiết kế, địa phương, kết cấu, tầng cao, vật liệu và thời điểm thi công.

---

# 2. Kiến trúc tổng thể

```text
                 ┌─────────────────────────┐
                 │       Flutter App       │
                 │ Android / Windows       │
                 └────────────┬────────────┘
                              │
                    Offline-first
                              │
                 ┌────────────▼────────────┐
                 │       Isar Local DB     │
                 │ Projects / Estimates    │
                 │ Materials / Labor       │
                 │ Prices / Settings       │
                 └────────────┬────────────┘
                              │ Sync Queue
                              ▼
                 ┌─────────────────────────┐
                 │     Vercel API          │
                 │ REST API / Auth / Sync  │
                 └────────────┬────────────┘
                              │
                              ▼
                 ┌─────────────────────────┐
                 │      Neon PostgreSQL    │
                 │ Cloud master database   │
                 └─────────────────────────┘
```

## Nguyên tắc

- Không để Flutter kết nối trực tiếp Neon.
- Flutter chỉ gọi API Vercel.
- Isar là database vận hành chính khi offline.
- Neon là database cloud để đồng bộ, quản trị và sao lưu.
- Mọi dữ liệu quan trọng có `uuid`.
- Mọi bản ghi có `createdAt`, `updatedAt`, `deletedAt`, `syncStatus`.
- Đồng bộ theo `updatedAt` + `version`.
- Không xóa vật lý dữ liệu đã đồng bộ; ưu tiên soft delete.

---

# 3. Công nghệ

## Flutter

Khuyến nghị:

```yaml
environment:
  sdk: ">=3.11.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter

  flutter_riverpod:
  isar:
  isar_flutter_libs:
  uuid:
  http:
  intl:
  shared_preferences:
  file_picker:
  pdf:
  printing:
  fl_chart:
```

Có thể bổ sung:

- `go_router`
- `freezed`
- `json_serializable`
- `connectivity_plus`
- `path_provider`

## Backend

- Vercel Functions.
- TypeScript/Node.js.
- REST API.
- Neon PostgreSQL.
- JWT/session token.
- API versioning: `/api/v1/...`.

---

# 4. Mô hình nghiệp vụ

Ứng dụng chia thành 8 phân hệ:

```text
1. Công trình
2. Dự toán
3. Danh mục vật tư
4. Định mức vật tư
5. Đơn giá
6. Nhân công
7. Báo cáo
8. Đồng bộ / Sao lưu
```

---

# 5. Quản lý công trình

## Project

Các trường:

```text
id
projectCode
projectName
customerName
customerPhone
address
province
district
ward
constructionArea
numberOfFloors
buildingGrade
roofArea
foundationType
structureType
finishLevel
startDate
expectedEndDate
notes
createdAt
updatedAt
```

## buildingGrade

```text
GRADE_1
GRADE_2
GRADE_3
GRADE_4
```

## finishLevel

```text
THO
CO_BAN
KHA
CAO_CAP
```

Cho phép người dùng tự định nghĩa tên và hệ số.

---

# 6. Cấu hình công trình

Người dùng nhập:

```text
Diện tích xây dựng:
Ví dụ: 100 m²

Số tầng:
Ví dụ: 2

Cấp công trình:
Cấp 3

Mức hoàn thiện:
Khá

Mái:
Mái bê tông / mái tôn / mái ngói

Móng:
Móng đơn / móng băng / móng cọc

Kết cấu:
BTCT

Điện:
Cơ bản / tiêu chuẩn / cao cấp

Nước:
Cơ bản / tiêu chuẩn / cao cấp
```

Hệ thống dùng các thông số này để chọn bộ định mức tương ứng.

---

# 7. Engine tính diện tích

Không chỉ dùng `diện tích sàn`.

Cần hỗ trợ:

```text
Diện tích đất
Diện tích xây dựng tầng 1
Diện tích tầng 2
...
Diện tích mái
Diện tích móng
Diện tích ban công
Diện tích sân
```

## Ví dụ

```text
Tầng 1 = 100 m²
Tầng 2 = 100 m²
Mái = 70 m²

Tổng diện tích sàn = 200 m²
```

Có thể cho phép tính theo:

### Phương án A

```text
Định mức × Tổng diện tích sàn
```

### Phương án B

```text
Định mức × từng khu vực
```

### Phương án C

```text
Khối lượng thực tế từ bóc tách
```

---

# 8. Cơ chế định mức

Định mức không được hard-code trong source code.

Mỗi định mức là một bản ghi.

## MaterialNorm

```text
id
code
name
materialId
buildingGrade
finishLevel
structureType
foundationType
unit
quantityPerM2
wastePercent
coefficient
effectiveFrom
effectiveTo
notes
```

Ví dụ minh họa:

```text
Cát
kg/m² hoặc m³/m²

Xi măng
kg/m²

Đá
m³/m²

Thép
kg/m²
```

Các giá trị trên chỉ là ví dụ cấu trúc dữ liệu, **không phải định mức kỹ thuật chính thức**.

---

# 9. Nhóm vật tư

## MATERIAL_CEMENT

Xi măng:

```text
Xi măng PCB30
Xi măng PCB40
Xi măng xây tô
```

## MATERIAL_SAND

```text
Cát xây
Cát tô
Cát bê tông
```

## MATERIAL_STONE

```text
Đá 1x2
Đá 4x6
Đá base
```

## MATERIAL_STEEL

```text
Thép D6
Thép D8
Thép D10
Thép D12
Thép D14
Thép D16
Thép D18
Thép D20
...
```

## MATERIAL_WATER

```text
Ống PPR
Ống PVC
Ống HDPE
Co
Tê
Van
Măng sông
```

## MATERIAL_ELECTRIC

```text
Dây điện
Ống luồn dây
Ống ruột gà
Hộp điện
CB
Ổ cắm
Công tắc
```

---

# 10. Đơn vị vật tư

Hỗ trợ:

```text
kg
tấn
m³
m²
m
cây
cuộn
bao
cái
bộ
```

Cho phép cấu hình quy đổi:

```text
1 tấn = 1000 kg
1 bao xi măng = X kg
1 cuộn dây = X mét
```

Không nên cố định trọng lượng bao xi măng trong code.

---

# 11. Công thức dự toán cơ bản

## Khối lượng vật tư

```text
Khối lượng = Diện tích × Định mức × Hệ số
```

Nếu có hao hụt:

```text
Khối lượng cuối =
Diện tích × Định mức × Hệ số × (1 + Hao hụt %)
```

## Thành tiền

```text
Thành tiền = Khối lượng × Đơn giá
```

---

# 12. Ví dụ luồng tính

Người dùng nhập:

```text
Diện tích = 100 m²
Số tầng = 2
Tổng diện tích = 200 m²
Cấp = 3
Hoàn thiện = Khá
```

Engine tìm:

```text
MaterialNorm
buildingGrade = 3
finishLevel = KHA
```

Sau đó:

```text
Cát
→ định mức tương ứng
→ khối lượng
→ đơn giá
→ thành tiền

Đá
→ ...

Xi măng
→ ...

Thép
→ ...

Ống nước
→ ...

Dây điện
→ ...
```

Cuối cùng:

```text
Tổng vật tư
+
Tổng nhân công
=
Tổng dự toán
```

---

# 13. Hệ số công trình

Hỗ trợ hệ số:

```text
foundationCoefficient
floorCoefficient
heightCoefficient
roofCoefficient
finishCoefficient
locationCoefficient
wasteCoefficient
customCoefficient
```

Công thức:

```text
FinalQuantity =
BaseQuantity
× FoundationCoefficient
× FloorCoefficient
× HeightCoefficient
× FinishCoefficient
× LocationCoefficient
× CustomCoefficient
```

Cho phép người dùng chỉnh từng hệ số.

---

# 14. Dự toán sắt thép

Nên hỗ trợ hai chế độ.

## Chế độ nhanh

```text
kg thép / m²
```

Ví dụ:

```text
Tổng thép =
Tổng diện tích × định mức thép kg/m²
```

## Chế độ bóc tách

Cho phép nhập:

```text
D6 × số cây
D8 × số cây
D10 × số cây
D12 × số cây
D14 × số cây
D16 × số cây
...
```

Có thể bổ sung:

```text
Chiều dài
Số lượng
Trọng lượng mét
Tổng trọng lượng
```

Kết quả:

```text
Tổng kg thép
Tổng tấn thép
Chi phí thép
```

---

# 15. Dự toán cát

Phân loại:

```text
Cát bê tông
Cát xây
Cát tô
```

Mỗi loại có:

```text
quantity
unitPrice
amount
```

Có thể tính theo:

```text
m³/m²
```

hoặc nhập khối lượng thực tế.

---

# 16. Dự toán đá

Phân loại:

```text
Đá 1x2
Đá 4x6
Đá base
```

Tính:

```text
Khối lượng m³
× Đơn giá/m³
```

---

# 17. Dự toán xi măng

Cho phép chọn:

```text
PCB30
PCB40
Loại khác
```

Tính:

```text
kg
→ bao
→ thành tiền
```

Ví dụ quy đổi:

```text
Số bao = Tổng kg / Khối lượng mỗi bao
```

Khối lượng bao được cấu hình trong danh mục.

---

# 18. Dự toán điện

Phân nhóm:

```text
Dây điện
Ống luồn
CB
Ổ cắm
Công tắc
Tủ điện
Đèn
Phụ kiện
```

Có hai phương pháp:

### Theo m²

```text
Định mức dây/m²
```

### Theo điểm

```text
Số điểm điện
× Định mức dây/điểm
```

Hỗ trợ:

```text
Ổ cắm
Công tắc
Đèn
Máy lạnh
Bình nóng lạnh
Bếp
Máy bơm
```

---

# 19. Dự toán nước

Phân nhóm:

```text
Ống cấp nước
Ống thoát nước
Co
Tê
Van
Phụ kiện
```

Hai phương pháp:

```text
Theo m²
```

hoặc:

```text
Theo thiết bị
```

Ví dụ:

```text
Lavabo
Bồn cầu
Vòi sen
Bồn rửa
Máy giặt
Bồn nước
```

---

# 20. Nhân công

## LaborType

```text
THO_XAY
THO_DIEN
THO_NUOC
THO_THEP
THO_COPPHA
THO_SON
```

Người dùng có thể bật/tắt từng nhóm.

## LaborNorm

```text
id
laborTypeId
unit
quantityPerM2
unitPrice
buildingGrade
finishLevel
effectiveFrom
effectiveTo
```

## Tính

```text
Chi phí nhân công =
Khối lượng × Định mức công × Đơn giá công
```

Hoặc:

```text
Số công × Đơn giá/ngày
```

---

# 21. Đơn giá

## MaterialPrice

```text
id
materialId
supplierId
province
district
unit
price
vatPercent
transportCost
effectiveDate
source
notes
```

Cho phép nhiều bảng giá:

```text
Giá hiện tại
Giá nhà cung cấp A
Giá nhà cung cấp B
Giá tham khảo
```

---

# 22. Nhà cung cấp

```text
Supplier
---------
id
code
name
phone
address
taxCode
contactPerson
notes
```

Cho phép liên kết vật tư với nhiều nhà cung cấp.

---

# 23. Bảng tổng hợp dự toán

## Estimate

```text
id
projectId
estimateCode
version
area
totalMaterial
totalLabor
totalOther
subtotal
vat
contingency
grandTotal
createdAt
updatedAt
```

## EstimateItem

```text
id
estimateId
category
materialId
laborTypeId
description
quantity
unit
unitPrice
wastePercent
amount
notes
```

---

# 24. Các nhóm chi phí

```text
A. CÁT
B. ĐÁ
C. XI MĂNG
D. SẮT THÉP
E. ĐIỆN
F. NƯỚC
G. NHÂN CÔNG XÂY
H. NHÂN CÔNG ĐIỆN
I. NHÂN CÔNG NƯỚC
J. CHI PHÍ KHÁC
```

Có thể bổ sung:

```text
K. VẬN CHUYỂN
L. MÁY THI CÔNG
M. THIẾT BỊ
N. CHI PHÍ DỰ PHÒNG
```

---

# 25. Chi phí khác

Cho phép nhập:

```text
Vận chuyển vật tư
Thuê máy
Xe bơm bê tông
Giàn giáo
Cốp pha
Điện nước công trường
Biển báo
Chi phí phát sinh
```

---

# 26. Báo cáo

## Dashboard

Hiển thị:

```text
Tổng dự toán
Chi phí vật tư
Chi phí nhân công
Chi phí khác
Chi phí/m²
```

Biểu đồ:

```text
Vật tư %
Nhân công %
Khác %
```

## Báo cáo vật tư

```text
Vật tư
Đơn vị
Khối lượng
Đơn giá
Thành tiền
```

## Báo cáo theo nhóm

```text
Cát
Đá
Xi măng
Thép
Điện
Nước
Nhân công
```

## Báo cáo theo m²

```text
Tổng chi phí / m²
Vật tư / m²
Nhân công / m²
```

## So sánh phương án

Ví dụ:

```text
Phương án A – Hoàn thiện cơ bản
Phương án B – Hoàn thiện khá
Phương án C – Hoàn thiện cao cấp
```

Hiển thị:

```text
Tổng tiền
Chi phí/m²
Chênh lệch
%
```

---

# 27. Màn hình Flutter

## 1. Splash

```text
Logo
Kiểm tra database
Kiểm tra đăng nhập
Kiểm tra đồng bộ
```

## 2. Dashboard

```text
Công trình
Dự toán
Vật tư
Đơn giá
Nhân công
Báo cáo
Đồng bộ
Cài đặt
```

## 3. Danh sách công trình

```text
+ Công trình mới
Tìm kiếm
Lọc theo trạng thái
```

## 4. Tạo công trình

Form:

```text
Tên công trình
Chủ nhà
Địa chỉ
Diện tích
Số tầng
Cấp công trình
Móng
Mái
Kết cấu
Mức hoàn thiện
```

## 5. Tạo dự toán

Wizard:

```text
Bước 1: Thông tin công trình
Bước 2: Diện tích
Bước 3: Cấp công trình
Bước 4: Định mức
Bước 5: Đơn giá
Bước 6: Vật tư
Bước 7: Nhân công
Bước 8: Tổng hợp
```

---

# 28. Màn hình chi tiết dự toán

Hiển thị:

```text
CÔNG TRÌNH ABC

Diện tích: 200 m²
Cấp: 3
Hoàn thiện: Khá

------------------------

VẬT TƯ

Cát              xxx
Đá               xxx
Xi măng          xxx
Sắt thép         xxx
Điện             xxx
Nước             xxx

------------------------

NHÂN CÔNG

Thợ xây          xxx
Thợ điện         xxx
Thợ nước         xxx

------------------------

TỔNG DỰ TOÁN     xxx
CHI PHÍ / M²     xxx
```

---

# 29. Chỉnh sửa trực tiếp

Trong bảng EstimateItem:

```text
Tên
Khối lượng
Đơn vị
Đơn giá
Hao hụt %
Thành tiền
```

Cho phép sửa trực tiếp.

Khi người dùng sửa:

```text
quantity
```

không được tự động ghi đè lại khi refresh.

Cần có:

```text
calculationMode
```

```text
AUTO
MANUAL
```

---

# 30. Auto / Manual

Ví dụ:

```text
Cát:
AUTO
```

Ứng dụng tính từ định mức.

Người dùng đổi:

```text
Cát = 50 m³
```

chuyển thành:

```text
MANUAL
```

Nếu muốn quay lại:

```text
Reset về định mức
```

---

# 31. Version dự toán

Một công trình có nhiều phiên bản:

```text
DT-001 v1
DT-001 v2
DT-001 v3
```

Ví dụ:

```text
v1: 1,2 tỷ
v2: 1,35 tỷ
v3: 1,48 tỷ
```

Có thể:

```text
Copy version
So sánh version
Khôi phục version
Xuất PDF
```

---

# 32. Isar Database

Các collection chính:

```text
Project
Estimate
EstimateItem
Material
MaterialCategory
MaterialNorm
MaterialPrice
Supplier
LaborType
LaborNorm
OtherCost
Setting
SyncQueue
SyncLog
UserProfile
```

## BaseEntity

Mỗi entity nên có:

```text
id
serverId
createdAt
updatedAt
deletedAt
syncStatus
version
deviceId
```

---

# 33. SyncStatus

```text
SYNCED
PENDING_CREATE
PENDING_UPDATE
PENDING_DELETE
SYNC_ERROR
```

---

# 34. Offline-first

Khi mất mạng:

```text
Người dùng
    ↓
Flutter
    ↓
Isar
    ↓
SyncQueue
```

Ứng dụng vẫn:

- Tạo công trình.
- Tạo dự toán.
- Tính toán.
- Sửa vật tư.
- Sửa đơn giá.
- Xem báo cáo.
- Xuất PDF.

Khi có mạng:

```text
SyncQueue
    ↓
Vercel API
    ↓
Neon
```

---

# 35. Chiến lược đồng bộ

## Push

```http
POST /api/v1/sync/push
```

Gửi:

```json
{
  "deviceId": "...",
  "lastSyncAt": "...",
  "changes": []
}
```

## Pull

```http
POST /api/v1/sync/pull
```

Gửi:

```json
{
  "deviceId": "...",
  "lastSyncAt": "..."
}
```

Server trả:

```json
{
  "serverTime": "...",
  "changes": [],
  "deletedIds": []
}
```

---

# 36. Xử lý xung đột

Mỗi record có:

```text
version
updatedAt
```

Mặc định:

```text
Last Write Wins
```

Nhưng đối với dự toán nên ưu tiên:

```text
Manual Conflict
```

Nếu cùng EstimateItem bị sửa trên 2 thiết bị:

```text
Thiết bị A
quantity = 50

Thiết bị B
quantity = 55
```

Ứng dụng hiển thị:

```text
Phát hiện xung đột

A: 50
B: 55

[Giữ A]
[Giữ B]
[Nhập giá trị khác]
```

---

# 37. API Vercel

Cấu trúc:

```text
/api/v1/auth/login
/api/v1/auth/register

/api/v1/projects
/api/v1/projects/:id

/api/v1/estimates
/api/v1/estimates/:id

/api/v1/materials
/api/v1/material-norms
/api/v1/material-prices

/api/v1/labor-types
/api/v1/labor-norms

/api/v1/suppliers

/api/v1/sync/push
/api/v1/sync/pull

/api/v1/reports
```

---

# 38. Neon PostgreSQL

Các bảng chính:

```sql
users
projects
estimates
estimate_items
materials
material_categories
material_norms
material_prices
suppliers
labor_types
labor_norms
other_costs
sync_changes
devices
audit_logs
```

Nên thêm:

```text
organization_id
```

để sau này mở rộng SaaS nhiều khách hàng.

---

# 39. Multi-tenant

Mỗi tài khoản có:

```text
organization
```

Mỗi organization có:

```text
users
projects
materials
prices
estimates
```

Không được để user này đọc dữ liệu của organization khác.

API luôn kiểm tra:

```text
authenticated user
→ organization_id
→ resource.organization_id
```

---

# 40. Import dữ liệu

Hỗ trợ:

```text
Excel
CSV
JSON
```

Import:

```text
Danh mục vật tư
Đơn giá
Định mức
Nhân công
```

Ví dụ Excel:

```text
Mã | Tên | ĐVT | Định mức | Đơn giá
XM01 | Xi măng PCB40 | bao | ... | ...
```

---

# 41. Xuất Excel

Xuất:

```text
01_Tong_hop.xlsx
02_Vat_tu.xlsx
03_Nhan_cong.xlsx
04_Don_gia.xlsx
05_Dinh_muc.xlsx
```

---

# 42. Xuất PDF

PDF dự toán gồm:

```text
Trang bìa
Thông tin công trình
Tổng hợp chi phí
Bảng vật tư
Bảng nhân công
Chi phí/m²
Ghi chú
```

Có thể thêm:

```text
Logo
Tên đơn vị lập dự toán
Người lập
Ngày lập
Chữ ký
```

---

# 43. Công cụ tính nhanh

Màn hình Quick Estimate:

```text
Diện tích: [100]
Số tầng: [2]
Cấp: [3]
Hoàn thiện: [Khá]

[ TÍNH DỰ TOÁN ]
```

Kết quả:

```text
Khoảng chi phí vật tư
Khoảng chi phí nhân công
Tổng dự toán
Chi phí/m²
```

Sau đó:

```text
[Lưu thành công trình]
```

---

# 44. Các chế độ tính

## Mode 1 – Nhanh

```text
Diện tích × định mức
```

## Mode 2 – Chi tiết

```text
Móng
Khung
Tường
Sàn
Mái
Điện
Nước
Hoàn thiện
```

## Mode 3 – Bóc tách

Nhập trực tiếp:

```text
Khối lượng
Đơn vị
Đơn giá
```

---

# 45. Hệ thống cảnh báo

Cảnh báo:

```text
Đơn giá đã cũ
Định mức chưa có
Thiếu đơn giá
Khối lượng bằng 0
Dữ liệu chưa đồng bộ
Xung đột dữ liệu
Dự toán chưa hoàn chỉnh
```

Ví dụ:

```text
⚠ Đơn giá xi măng đã quá 30 ngày.
```

Ngưỡng ngày cấu hình được.

---

# 46. Nhật ký thay đổi

AuditLog:

```text
id
userId
deviceId
entity
entityId
action
oldValue
newValue
createdAt
```

Ví dụ:

```text
05/09/2026
Người dùng sửa:
Xi măng
100 bao → 120 bao
```

---

# 47. Quyền người dùng

## ADMIN

```text
Quản lý toàn bộ
Định mức
Đơn giá
Người dùng
```

## ESTIMATOR

```text
Tạo dự toán
Sửa dự toán
Xuất báo cáo
```

## VIEWER

```text
Chỉ xem
```

---

# 48. Cấu trúc thư mục Flutter

```text
lib/
├── main.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── sync/
│   ├── utils/
│   └── database/
│
├── models/
│   ├── project.dart
│   ├── estimate.dart
│   ├── estimate_item.dart
│   ├── material.dart
│   ├── material_norm.dart
│   ├── material_price.dart
│   ├── labor_type.dart
│   └── labor_norm.dart
│
├── repositories/
│   ├── project_repository.dart
│   ├── estimate_repository.dart
│   ├── material_repository.dart
│   └── price_repository.dart
│
├── services/
│   ├── calculation_service.dart
│   ├── estimate_service.dart
│   ├── sync_service.dart
│   ├── pdf_service.dart
│   └── excel_service.dart
│
├── providers/
│   ├── project_provider.dart
│   ├── estimate_provider.dart
│   ├── material_provider.dart
│   └── sync_provider.dart
│
├── features/
│   ├── dashboard/
│   ├── projects/
│   ├── estimates/
│   ├── materials/
│   ├── labor/
│   ├── prices/
│   ├── reports/
│   └── settings/
│
└── widgets/
```

---

# 49. Calculation Engine

Không đặt công thức tính trực tiếp trong Widget.

Tạo:

```text
CalculationService
```

Ví dụ:

```dart
class CalculationService {
  double calculateMaterialQuantity({
    required double area,
    required double norm,
    double coefficient = 1,
    double wastePercent = 0,
  }) {
    return area *
        norm *
        coefficient *
        (1 + wastePercent / 100);
  }

  double calculateAmount({
    required double quantity,
    required double unitPrice,
  }) {
    return quantity * unitPrice;
  }
}
```

Engine phải có unit test.

---

# 50. Nguyên tắc làm tròn

Không làm tròn quá sớm.

Ví dụ:

```text
Khối lượng:
giữ 3–6 chữ số thập phân

Tiền:
làm tròn theo cấu hình
```

Cho phép:

```text
ROUND_NONE
ROUND_1
ROUND_10
ROUND_100
ROUND_1000
```

---

# 51. VAT

Cho phép cấu hình:

```text
VAT = 0%
VAT = 5%
VAT = 8%
VAT = 10%
```

Không hard-code một mức VAT duy nhất vì chính sách thuế có thể thay đổi.

Công thức:

```text
VAT = Subtotal × VAT%
```

```text
GrandTotal =
Subtotal + VAT + Contingency
```

---

# 52. Chi phí dự phòng

Cho phép:

```text
ContingencyPercent
```

Ví dụ:

```text
Dự toán trước dự phòng = X

Dự phòng = X × 5%

Tổng = X + dự phòng
```

---

# 53. So sánh giá nhà cung cấp

Cho phép:

```text
Xi măng
Nhà cung cấp A
Nhà cung cấp B
Nhà cung cấp C
```

Hiển thị:

```text
Giá thấp nhất
Giá cao nhất
Giá trung bình
```

Có thể tính:

```text
Chi phí nếu mua từ A
Chi phí nếu mua từ B
```

---

# 54. Dự toán theo cấp công trình

Bộ định mức có thể phân biệt:

```text
Cấp 1
Cấp 2
Cấp 3
Cấp 4
```

Nhưng phải cho phép cấu hình:

```text
GradeProfile
```

Ví dụ:

```text
GRADE_1
→ profile định mức 1

GRADE_2
→ profile định mức 2

GRADE_3
→ profile định mức 3

GRADE_4
→ profile định mức 4
```

Không coi cấp công trình là yếu tố duy nhất quyết định lượng vật tư. Engine phải cho phép kết hợp:

```text
cấp công trình
+
kết cấu
+
móng
+
số tầng
+
mái
+
mức hoàn thiện
```

---

# 55. Dữ liệu mẫu

Ứng dụng lần đầu chạy:

```text
Seed Database
```

Tạo:

```text
Danh mục vật tư mẫu
Loại nhân công mẫu
Các đơn vị tính
Các cấp công trình
Mức hoàn thiện
```

Không nên đưa các định mức kỹ thuật thực tế vào source code nếu chưa được kiểm chứng.

Cho phép:

```text
Import bộ định mức
```

từ Excel/CSV.

---

# 56. Sao lưu

## Local

Cho phép:

```text
Backup Isar
Export JSON
Export Excel
```

## Cloud

Neon chứa:

```text
Projects
Estimates
Materials
Prices
Norms
Users
Audit
```

Có thể export:

```text
JSON
CSV
Excel
```

---

# 57. Đồng bộ tự động

Khi app:

```text
Mở ứng dụng
Đăng nhập
Có mạng
Quay lại foreground
Sau khi lưu dữ liệu
```

thì gọi:

```text
sync()
```

Quy trình:

```text
1. Push local changes
2. Server xử lý
3. Pull remote changes
4. Resolve conflict
5. Update Isar
6. Đánh dấu SYNCED
```

---

# 58. Trạng thái Sync trên UI

Hiển thị:

```text
🟢 Đã đồng bộ
🟡 Đang đồng bộ
🔴 Lỗi đồng bộ
⚪ Offline
```

Kèm:

```text
Lần đồng bộ cuối: 20:45
```

---

# 59. Bảo mật

Không lưu:

```text
DATABASE_URL
NEON_PASSWORD
VERCEL_SECRET
JWT_SECRET
```

trong Flutter.

Flutter chỉ biết:

```text
API_BASE_URL
```

Secret chỉ tồn tại trên Vercel.

---

# 60. API Security

Mỗi API:

```text
Authorization: Bearer <token>
```

Server kiểm tra:

```text
token
user
organization
permission
```

Không tin:

```text
organization_id
user_id
```

do client tự gửi nếu có thể suy ra từ token.

---

# 61. Database index

Neon index:

```sql
projects(organization_id)
projects(updated_at)

estimates(project_id)
estimates(updated_at)

estimate_items(estimate_id)

materials(organization_id)
material_prices(material_id, effective_date)

sync_changes(organization_id, updated_at)
```

---

# 62. Performance

Isar dùng để:

- Tìm kiếm công trình.
- Tính toán dự toán.
- Lọc vật tư.
- Hiển thị báo cáo.

Không gọi API cho từng dòng EstimateItem.

Sai:

```text
100 EstimateItem
→ 100 API request
```

Đúng:

```text
1 batch request
→ nhiều record
```

---

# 63. Batch Sync

Ví dụ:

```json
{
  "changes": [
    {
      "entity": "estimate",
      "operation": "upsert",
      "data": {}
    },
    {
      "entity": "estimate_item",
      "operation": "upsert",
      "data": {}
    }
  ]
}
```

---

# 64. Testing

## Unit test

Test:

```text
Tính diện tích
Tính khối lượng
Tính hao hụt
Tính đơn giá
Tính VAT
Tính dự phòng
Tính chi phí/m²
```

## Integration test

```text
Flutter
→ Vercel API
→ Neon
→ Pull
→ Isar
```

## Offline test

```text
Tắt mạng
→ tạo dự toán
→ sửa dự toán
→ bật mạng
→ sync
```

---

# 65. Kịch bản sử dụng hoàn chỉnh

```text
Người dùng mở app
        ↓
Tạo công trình
        ↓
Nhập 100 m²
        ↓
Chọn 2 tầng
        ↓
Chọn Cấp 3
        ↓
Chọn hoàn thiện Khá
        ↓
Chọn móng
        ↓
Chọn mái
        ↓
[ Tạo dự toán ]
        ↓
Calculation Engine
        ↓
Tính cát
        ↓
Tính đá
        ↓
Tính xi măng
        ↓
Tính thép
        ↓
Tính điện
        ↓
Tính nước
        ↓
Tính thợ xây
        ↓
Tính thợ điện
        ↓
Tính thợ nước
        ↓
Tổng hợp
        ↓
Chi phí/m²
        ↓
Người dùng điều chỉnh
        ↓
Xuất PDF / Excel
        ↓
Sync Neon
```

---

# 66. Roadmap phát triển

## Phase 1

- Flutter project.
- Isar.
- CRUD công trình.
- CRUD vật tư.
- CRUD đơn giá.
- Calculation Engine.

## Phase 2

- Định mức.
- Dự toán vật tư.
- Nhân công.
- Dashboard.

## Phase 3

- PDF.
- Excel.
- Import Excel.
- Version dự toán.

## Phase 4

- Vercel API.
- Neon.
- Login.
- Sync.

## Phase 5

- Multi-user.
- Multi-device.
- Conflict resolution.
- Audit log.

## Phase 6

- So sánh nhà cung cấp.
- Báo cáo nâng cao.
- Bóc tách thép.
- Bóc tách điện/nước.

---

# 67. MVP bắt buộc

Phiên bản đầu tiên phải có:

```text
[x] Flutter Android/Windows
[x] Isar offline
[x] Công trình
[x] Diện tích
[x] Cấp 1/2/3/4
[x] Số tầng
[x] Mức hoàn thiện
[x] Cát
[x] Đá
[x] Xi măng
[x] Sắt thép
[x] Ống nước
[x] Dây điện
[x] Thợ xây
[x] Thợ điện
[x] Thợ nước
[x] Định mức cấu hình
[x] Đơn giá cấu hình
[x] Tính tự động
[x] Chỉnh sửa thủ công
[x] Tổng dự toán
[x] Chi phí/m²
[x] PDF
[x] Excel
[x] Vercel API
[x] Neon PostgreSQL
[x] Đồng bộ offline-first
```

---

# 68. Nguyên tắc quan trọng về độ chính xác

Ứng dụng nên được thiết kế như một **công cụ dự toán linh hoạt**, không tuyên bố rằng chỉ cần nhập diện tích là có thể thay thế hồ sơ thiết kế và dự toán xây dựng chuyên nghiệp.

Kết quả phụ thuộc vào:

```text
Thiết kế kiến trúc
Kết cấu
Địa chất
Móng
Số tầng
Chiều cao tầng
Khẩu độ
Loại vật liệu
Mức hoàn thiện
Địa phương
Giá vật tư
Giá nhân công
Điều kiện vận chuyển
```

Do đó:

```text
Quick Estimate
```

dùng để ước tính nhanh.

Còn:

```text
Detailed Estimate
```

dùng cho dự toán chi tiết sau khi người dùng nhập/bóc tách khối lượng.

---

# 69. Kết quả cuối cùng

App hoàn thiện sẽ có khả năng:

```text
NHẬP:
100 m²
2 tầng
Cấp 3
Hoàn thiện khá

↓
ENGINE

CÁT
ĐÁ
XI MĂNG
THÉP
ĐIỆN
NƯỚC
THỢ XÂY
THỢ ĐIỆN
THỢ NƯỚC

↓

TỔNG VẬT TƯ
TỔNG NHÂN CÔNG
CHI PHÍ KHÁC
VAT
DỰ PHÒNG

↓

TỔNG DỰ TOÁN
CHI PHÍ / M²

↓

PDF / EXCEL

↓

ISAR
↕
VERCEL API
↕
NEON
```

Mục tiêu kiến trúc là để sau này có thể mở rộng thêm:

```text
Nhà phố
Biệt thự
Nhà cấp 4
Nhà xưởng
Cải tạo nhà
Sửa chữa
Bóc tách khối lượng
Quản lý thi công
Theo dõi thực tế vs dự toán
Quản lý mua vật tư
Công nợ nhà cung cấp
Thanh toán thợ
Lãi/lỗ công trình
```
