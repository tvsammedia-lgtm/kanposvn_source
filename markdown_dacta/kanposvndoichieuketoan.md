# TOOL ĐỐI CHIẾU SỔ SÁCH KẾ TOÁN EXCEL – FLUTTER

## 1. Mục tiêu

Xây dựng ứng dụng Flutter chạy ưu tiên trên Windows để đối chiếu đồng thời 2–3 file Excel.

Ứng dụng phải phát hiện:

- Dòng trùng khớp.
- Dòng chỉ có ở một file.
- Dòng dư ở một file.
- Khác số.
- Khác ký tự/chữ.
- Khác ngày.
- Khác dữ liệu rỗng/null.
- Khác định dạng dữ liệu sau khi chuẩn hóa.
- Chênh lệch số tiền.
- Cho phép xem chi tiết cùng một chứng từ trên 2–3 file.
- Xuất báo cáo kết quả đối chiếu ra Excel/PDF/CSV.
- Hoạt động offline, không bắt buộc server/database.

---

# 2. Nền tảng

## Flutter

Ưu tiên:

- Windows Desktop
- Android có thể mở rộng sau.
- Web không phải mục tiêu chính của phiên bản đầu.

## Kiến trúc

```text
Flutter UI
   │
   ├── File Import
   │
   ├── Excel Parser
   │
   ├── Column Mapping
   │
   ├── Matching Engine
   │
   ├── Compare Engine
   │
   ├── Difference Engine
   │
   ├── Report Engine
   │
   └── Export Engine
```

---

# 3. Nguyên tắc quan trọng

KHÔNG đối chiếu đơn giản theo số thứ tự dòng:

```text
A1 == B1
A2 == B2
A3 == B3
```

Vì các file kế toán có thể:

- Khác thứ tự dòng.
- Có dòng bị thêm.
- Có dòng bị xóa.
- Có dòng trống.
- Một chứng từ xuất hiện ở vị trí khác.

Phải sử dụng `key` để tìm dòng tương ứng.

Ví dụ:

```text
Số chứng từ + Ngày
```

hoặc:

```text
Số chứng từ + Mã khách hàng + Ngày
```

Sau khi tìm được dòng tương ứng mới so sánh từng cột.

---

# 4. Ví dụ

## File A

```text
HD001 | 30/08/2026 | Nguyễn Văn A | 1,250,000
```

## File B

```text
HD001 | 30/08/2026 | Nguyễn Văn A | 1,520,000
```

Kết quả:

```text
Khóa: HD001
Cột: Số tiền

File A: 1,250,000
File B: 1,520,000

Chênh lệch: 270,000

Kết quả: KHÁC SỐ
```

---

# 5. Ví dụ khác ký tự

File A:

```text
Nguyễn Văn Anh
```

File B:

```text
Nguyễn Văn Ánh
```

Kết quả:

```text
KHÁC KÝ TỰ
```

Ứng dụng nên hiển thị phần khác nhau càng rõ càng tốt.

Ví dụ:

```text
Nguyễn Văn A[n]h
Nguyễn Văn Á[n]h
```

Có thể bổ sung chế độ highlight ký tự khác nhau.

---

# 6. Các trạng thái đối chiếu

Sử dụng enum:

```dart
enum CompareStatus {
  matched,
  numberDifferent,
  textDifferent,
  dateDifferent,
  missing,
  extra,
  emptyDifferent,
  multipleDifferent,
}
```

Hiển thị:

```text
🟢 TRÙNG KHỚP
🔴 KHÁC SỐ
🟡 KHÁC KÝ TỰ
🟣 KHÁC NGÀY
🟠 THIẾU
🔵 DƯ
⚫ KHÁC NHIỀU TRƯỜNG
```

---

# 7. Chức năng chọn file

Màn hình:

```text
┌─────────────────────────────────────────────┐
│       ĐỐI CHIẾU SỔ SÁCH KẾ TOÁN            │
├─────────────────────────────────────────────┤
│                                             │
│ File A                                      │
│ [ Chọn Excel ]                              │
│ Sổ kế toán.xlsx                             │
│                                             │
│ File B                                      │
│ [ Chọn Excel ]                              │
│ Sổ ngân hàng.xlsx                            │
│                                             │
│ File C - tùy chọn                            │
│ [ Chọn Excel ]                              │
│ Hóa đơn.xlsx                                 │
│                                             │
│ [ TIẾP TỤC ]                                │
└─────────────────────────────────────────────┘
```

Hỗ trợ:

```text
.xlsx
.xls
.csv
```

Nếu thư viện Excel không hỗ trợ `.xls` ổn định, phiên bản đầu chỉ cần `.xlsx` và `.csv`.

---

# 8. Đọc Excel

Cần xây dựng lớp:

```dart
class ExcelFileData {
  String fileName;
  List<String> columns;
  List<Map<String, dynamic>> rows;
}
```

Ví dụ:

```dart
ExcelFileData(
  fileName: 'SoKeToan.xlsx',
  columns: [
    'Số chứng từ',
    'Ngày',
    'Mã KH',
    'Tên KH',
    'Số tiền',
  ],
  rows: [...]
);
```

---

# 9. Tự nhận diện Header

Không giả định header luôn ở dòng 1.

Có thể có:

```text
Dòng 1: CÔNG TY ABC
Dòng 2: SỔ CHI TIẾT
Dòng 3: Từ ngày...
Dòng 4: Số chứng từ | Ngày | Mã KH | Số tiền
```

Ứng dụng cần cho người dùng chọn:

```text
Header nằm ở dòng:
[ 4 ▼ ]
```

Có thể bổ sung tự động nhận diện dòng có nhiều ô chứa tên cột.

---

# 10. Mapping cột

Các file có thể đặt tên khác nhau.

Ví dụ:

```text
File A:
Số CT
Ngày CT
Tiền

File B:
Số chứng từ
Ngày
Số tiền
```

Phải có màn hình Mapping:

```text
Cột chuẩn        File A              File B
------------------------------------------------
Số chứng từ      [Số CT ▼]           [Số chứng từ ▼]
Ngày             [Ngày CT ▼]         [Ngày ▼]
Số tiền          [Tiền ▼]            [Số tiền ▼]
Mã khách hàng    [Mã KH ▼]           [Mã khách hàng ▼]
```

---

# 11. Chuẩn hóa dữ liệu

Trước khi so sánh phải chuẩn hóa.

## Text

Ví dụ:

```text
"Nguyễn Văn A"
" Nguyễn Văn A "
```

Có thể coi là giống nhau nếu bật:

```text
Trim khoảng trắng = ON
```

Có thể có tùy chọn:

```text
Không phân biệt hoa thường
Loại bỏ khoảng trắng thừa
Chuẩn hóa Unicode
```

## Number

Các giá trị:

```text
1,250,000
1250000
1.250.000
1 250 000
```

có thể được chuẩn hóa thành:

```text
1250000
```

Phải có cấu hình dấu phân cách theo dữ liệu.

## Date

Ví dụ:

```text
30/08/2026
2026-08-30
30-08-2026
```

chuẩn hóa thành:

```text
2026-08-30
```

---

# 12. So sánh số

Không nên so sánh số bằng String.

Sai:

```dart
'1,250,000' == '1250000'
```

Đúng:

```dart
parseNumber(valueA) == parseNumber(valueB)
```

Có tùy chọn sai số:

```text
Tolerance:
0
0.01
1
10
100
```

Ví dụ:

```text
File A: 1000000
File B: 1000000.01

Tolerance = 0
=> KHÁC

Tolerance = 0.1
=> TRÙNG
```

---

# 13. So sánh text

So sánh sau khi normalize.

Ví dụ:

```text
File A:
Nguyễn Văn A

File B:
nguyễn văn a
```

Nếu:

```text
Ignore Case = ON
```

=> TRÙNG

Nếu OFF:

=> KHÁC KÝ TỰ

---

# 14. So sánh từng cột

Sau khi tìm được cùng key:

```text
HD001
```

ứng dụng so sánh:

```text
Ngày
Mã KH
Tên KH
Mã hàng
Tên hàng
Số lượng
Đơn giá
Thuế
Thành tiền
```

Ví dụ:

```text
HD001

Ngày:
A = 30/08/2026
B = 30/08/2026
=> OK

Tên:
A = Nguyễn Văn Anh
B = Nguyễn Văn Ánh
=> DIFFERENT

Số tiền:
A = 1,250,000
B = 1,520,000
=> DIFFERENT
```

---

# 15. Matching Engine

Tạo:

```dart
class MatchKey {
  final String value;

  MatchKey(this.value);
}
```

Ví dụ:

```text
HD001|2026-08-30
```

Có thể tạo key từ nhiều cột:

```dart
String buildKey(
  Map<String, dynamic> row,
  List<String> keyColumns,
) {
  return keyColumns
      .map((column) => normalize(row[column]))
      .join('|');
}
```

---

# 16. Xử lý duplicate key

Một vấn đề quan trọng:

```text
HD001
HD001
HD001
```

không được tự động ghi đè.

Phải phát hiện:

```text
DUPLICATE KEY
```

Ví dụ:

```text
File A:
HD001 xuất hiện 3 lần

File B:
HD001 xuất hiện 2 lần
```

Báo:

```text
⚠ DUPLICATE

File A: 3 dòng
File B: 2 dòng
```

Sau đó cho phép chọn:

```text
So sánh từng dòng
Tổng hợp theo key
Không đối chiếu key trùng
```

---

# 17. Chế độ đối chiếu

Nên có 3 chế độ.

## Mode 1 – Exact Match

So sánh chính xác.

```text
A == B
```

## Mode 2 – Normalized Match

Sau khi:

```text
Trim
Unicode normalize
Ignore case
Normalize number
Normalize date
```

## Mode 3 – Accounting Match

Tối ưu cho kế toán:

- Số tiền.
- Ngày.
- Số chứng từ.
- Mã khách hàng.
- Mã hàng.
- Thuế.
- Tổng tiền.
- Công nợ.

---

# 18. Đối chiếu 2 file

```text
File A
   │
   ├── Key
   │
   └── Map
         │
         ▼
      Matching
         │
         ▼
File B
```

Kết quả:

```text
MATCHED
DIFFERENT
MISSING A
MISSING B
```

---

# 19. Đối chiếu 3 file

Ví dụ:

```text
File A = Sổ kế toán
File B = Ngân hàng
File C = Hóa đơn
```

Tạo key:

```text
HD001
```

Tìm:

```text
A: Có
B: Có
C: Có
```

Sau đó:

```text
A tiền = B tiền = C tiền
```

=> TRÙNG

Nếu:

```text
A = 1,000,000
B = 1,000,000
C = 1,200,000
```

=> KHÁC

Chi tiết:

```text
File A: 1,000,000
File B: 1,000,000
File C: 1,200,000
```

---

# 20. Dashboard kết quả

```text
┌─────────────────────────────────────────────┐
│ KẾT QUẢ ĐỐI CHIẾU                           │
├─────────────────────────────────────────────┤
│                                             │
│ Tổng dòng:              12,568              │
│                                             │
│ 🟢 Trùng khớp:          12,410              │
│ 🔴 Khác số:                 82              │
│ 🟡 Khác ký tự:              31              │
│ 🟣 Khác ngày:                10              │
│ 🟠 Thiếu:                   27              │
│ 🔵 Dư:                       8              │
│                                             │
│ [ XEM CHI TIẾT ]                            │
│ [ XUẤT EXCEL ]                              │
│ [ XUẤT PDF ]                                │
└─────────────────────────────────────────────┘
```

---

# 21. Bảng chi tiết

```text
STT
Key
Cột
File A
File B
File C
Trạng thái
Chênh lệch
```

Ví dụ:

```text
1
HD001
Số tiền
1,250,000
1,520,000
1,250,000
KHÁC SỐ
270,000
```

---

# 22. Bộ lọc

Phải có:

```text
[ Tất cả ▼ ]

Tất cả
Trùng khớp
Khác số
Khác ký tự
Khác ngày
Thiếu
Dư
Duplicate
```

Tìm kiếm:

```text
[Tìm số chứng từ...]
```

---

# 23. Xem chi tiết một chứng từ

Khi click:

```text
HD001
```

hiển thị:

```text
┌─────────────────────────────────────────────┐
│ CHI TIẾT: HD001                             │
├──────────────┬──────────────┬───────────────┤
│ Cột          │ File A       │ File B        │
├──────────────┼──────────────┼───────────────┤
│ Ngày         │30/08/2026    │30/08/2026     │
│ Mã KH        │KH001         │KH001          │
│ Tên KH       │Nguyễn Văn A  │Nguyễn Văn Á   │
│ Số tiền      │1,250,000     │1,520,000      │
└──────────────┴──────────────┴───────────────┘
```

---

# 24. Highlight khác biệt

Nếu text:

```text
Nguyễn Văn Anh
Nguyễn Văn Ánh
```

UI phải highlight:

```text
Nguyễn Văn A[n]h
Nguyễn Văn Á[n]h
```

Với số:

```text
1,250,000
1,520,000
```

highlight toàn bộ giá trị khác.

---

# 25. Xuất Excel

File:

```text
DOI_CHIEU_KET_QUA.xlsx
```

Sheet:

```text
1. Tổng hợp
2. Trùng khớp
3. Khác số
4. Khác ký tự
5. Khác ngày
6. Thiếu
7. Dư
8. Duplicate
```

Sheet Tổng hợp:

```text
Tổng dòng
Trùng
Khác số
Khác ký tự
Khác ngày
Thiếu
Dư
Duplicate
```

---

# 26. Xuất PDF

PDF gồm:

```text
Tên báo cáo
Ngày thực hiện
Tên File A
Tên File B
Tên File C

Tổng quan

Chi tiết sai lệch
```

---

# 27. Xuất CSV

Cho phép xuất riêng:

```text
difference.csv
missing.csv
matched.csv
```

---

# 28. Lịch sử đối chiếu

Không bắt buộc database.

Có thể lưu local:

```text
history/
   2026-08-30_001.json
   2026-08-30_002.json
```

Thông tin:

```text
Thời gian
Tên file
Số dòng
Số lỗi
Cấu hình mapping
```

Có thể dùng Isar nếu muốn lưu lịch sử lâu dài.

---

# 29. Cấu trúc thư mục Flutter

```text
lib/
│
├── main.dart
│
├── app.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── utils/
│   └── extensions/
│
├── models/
│   ├── excel_file_data.dart
│   ├── excel_column.dart
│   ├── compare_config.dart
│   ├── compare_result.dart
│   ├── difference_item.dart
│   └── match_key.dart
│
├── services/
│   ├── excel_service.dart
│   ├── file_service.dart
│   ├── normalize_service.dart
│   ├── matching_service.dart
│   ├── compare_service.dart
│   ├── report_service.dart
│   └── export_service.dart
│
├── engines/
│   ├── matching_engine.dart
│   ├── compare_engine.dart
│   ├── difference_engine.dart
│   └── duplicate_engine.dart
│
├── screens/
│   ├── home/
│   ├── import/
│   ├── mapping/
│   ├── configuration/
│   ├── comparing/
│   ├── result/
│   └── detail/
│
├── widgets/
│   ├── file_picker_card.dart
│   ├── result_summary.dart
│   ├── result_table.dart
│   ├── difference_cell.dart
│   └── status_badge.dart
│
└── providers/
    ├── import_provider.dart
    ├── compare_provider.dart
    └── result_provider.dart
```

---

# 30. Package đề xuất

Có thể dùng:

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_riverpod: ^2.6.1

  file_picker: ^11.0.2

  excel: <version phù hợp>

  intl: ^0.20.2

  path_provider: ^2.1.5

  csv: <version phù hợp>

  pdf: ^3.10.7

  printing: ^5.11.1

  uuid: ^4.4.0
```

Không nên cố định version nếu đang bắt đầu project mới; kiểm tra pub.dev và chọn version tương thích với Dart/Flutter SDK hiện tại.

---

# 31. Riverpod

Dùng Riverpod quản lý:

```text
File A
File B
File C
Mapping
Compare Configuration
Progress
Compare Result
Filter
Search
```

Ví dụ:

```dart
final compareConfigProvider =
    StateNotifierProvider<CompareConfigNotifier, CompareConfig>(
  (ref) => CompareConfigNotifier(),
);
```

---

# 32. CompareConfig

```dart
class CompareConfig {
  final List<String> keyColumns;
  final List<String> compareColumns;

  final bool ignoreCase;
  final bool trimSpaces;
  final bool normalizeUnicode;
  final bool normalizeNumbers;
  final bool normalizeDates;

  final double numberTolerance;

  const CompareConfig({
    required this.keyColumns,
    required this.compareColumns,
    this.ignoreCase = false,
    this.trimSpaces = true,
    this.normalizeUnicode = true,
    this.normalizeNumbers = true,
    this.normalizeDates = true,
    this.numberTolerance = 0,
  });
}
```

---

# 33. CompareResult

```dart
class CompareResult {
  final String key;

  final CompareStatus status;

  final Map<String, dynamic> fileA;
  final Map<String, dynamic> fileB;
  final Map<String, dynamic>? fileC;

  final List<DifferenceItem> differences;
}
```

---

# 34. DifferenceItem

```dart
class DifferenceItem {
  final String column;
  final dynamic valueA;
  final dynamic valueB;
  final dynamic valueC;

  final CompareStatus status;

  final double? numericDifference;
}
```

---

# 35. Thuật toán tổng quát

```text
START

↓
Chọn File A

↓
Chọn File B

↓
File C có không?
 ├── Không
 └── Có

↓
Đọc Excel

↓
Chọn Header

↓
Mapping cột

↓
Chọn Key

↓
Chọn cột cần đối chiếu

↓
Normalize dữ liệu

↓
Build Map theo Key

↓
Phát hiện Duplicate

↓
Matching

↓
So sánh từng dòng

↓
Phân loại Difference

↓
Tạo CompareResult

↓
Dashboard

↓
Chi tiết

↓
Export

END
```

---

# 36. Pseudocode Matching

```dart
Map<String, List<RowData>> buildIndex(
  List<RowData> rows,
  List<String> keyColumns,
) {
  final map = <String, List<RowData>>{};

  for (final row in rows) {
    final key = buildKey(row, keyColumns);

    map.putIfAbsent(key, () => []);
    map[key]!.add(row);
  }

  return map;
}
```

---

# 37. Pseudocode Compare

```dart
for (final key in allKeys) {

  final rowsA = indexA[key];
  final rowsB = indexB[key];
  final rowsC = indexC[key];

  if (rowsA == null) {
    // missing in A
  }

  if (rowsB == null) {
    // missing in B
  }

  if (rowsC == null) {
    // missing in C
  }

  // xử lý duplicate

  for (final column in compareColumns) {

    final valueA = normalize(rowsA[column]);
    final valueB = normalize(rowsB[column]);

    if (isNumber(valueA, valueB)) {

      if (!numbersEqual(valueA, valueB)) {
        addNumberDifference();
      }

    } else {

      if (valueA != valueB) {
        addTextDifference();
      }
    }
  }
}
```

---

# 38. Xử lý dữ liệu lớn

Tool kế toán có thể có:

```text
10.000 dòng
100.000 dòng
500.000 dòng
1.000.000 dòng
```

Không nên xử lý tất cả trực tiếp trên UI thread.

Cần:

```text
Isolate
```

hoặc:

```dart
compute()
```

để xử lý nền.

UI hiển thị:

```text
Đang đọc Excel...
35%

Đang tạo index...
60%

Đang đối chiếu...
85%

Hoàn thành
100%
```

---

# 39. Progress

Ví dụ:

```text
Đọc File A          ██████████ 100%

Đọc File B          ██████████ 100%

Đọc File C          ██████████ 100%

Matching            ███████░░░ 70%

Compare             █████░░░░░ 50%
```

Không để ứng dụng hiện:

```text
Not Responding
```

khi file lớn.

---

# 40. Tối ưu bộ nhớ

Không giữ quá nhiều object không cần thiết.

Ưu tiên:

```text
Map<String, Row>
```

hoặc:

```text
Map<String, List<Row>>
```

Key phải được normalize trước.

Không tạo quá nhiều String trung gian.

---

# 41. Các trường hợp đặc biệt

Phải xử lý:

```text
null
''
' '
0
'0'
0.00
'-'
N/A
NA
```

Cần có cấu hình:

```text
Coi null và empty giống nhau
Coi "-" là empty
Coi N/A là empty
```

---

# 42. Sai dấu âm

Ví dụ:

```text
File A: -100000
File B: (100000)
```

Trong kế toán có thể coi:

```text
-100000
```

là giống:

```text
(100000)
```

Nên có:

```text
Accounting negative format = ON
```

---

# 43. Làm tròn

Ví dụ:

```text
A = 100.004
B = 100.00
```

Cho phép:

```text
Decimal places:
0
1
2
3
```

Nếu chọn:

```text
2 decimal
```

thì:

```text
100.00 == 100.00
```

---

# 44. Tổng hợp theo chứng từ

Có thể có trường hợp:

```text
File A:
HD001 dòng 1 = 500.000
HD001 dòng 2 = 300.000

File B:
HD001 = 800.000
```

Không nên báo thiếu.

Cần chế độ:

```text
Aggregate by Key
```

Khi bật:

```text
HD001
A Total = 800.000
B Total = 800.000

=> MATCH
```

---

# 45. Đối chiếu tổng

Ngoài từng dòng, phải có:

```text
Tổng số tiền File A
Tổng số tiền File B
Tổng số tiền File C
```

Ví dụ:

```text
File A: 12,580,000,000
File B: 12,575,000,000
Chênh lệch: 5,000,000
```

Đây là chức năng rất quan trọng đối với kế toán.

---

# 46. Đối chiếu theo nhiều trường

Ví dụ:

```text
Key:
Số chứng từ + Ngày + Mã khách hàng
```

UI:

```text
Khóa 1: [Số chứng từ]
Khóa 2: [Ngày]
Khóa 3: [Mã khách hàng]

[ + Thêm cột khóa ]
```

---

# 47. Lưu cấu hình

Người dùng có thể lưu:

```text
Mẫu đối chiếu:
Sổ kế toán ↔ Ngân hàng
```

Hoặc:

```text
Mẫu:
Hóa đơn ↔ Sổ doanh thu ↔ Ngân hàng
```

Lưu:

```json
{
  "name": "Sổ kế toán - Ngân hàng",
  "keyColumns": [
    "Số chứng từ",
    "Ngày"
  ],
  "compareColumns": [
    "Số tiền"
  ],
  "ignoreCase": true,
  "trimSpaces": true
}
```

---

# 48. Giao diện mẫu

## Home

```text
╔══════════════════════════════════════════════╗
║       TOOL ĐỐI CHIẾU SỔ SÁCH KẾ TOÁN       ║
╠══════════════════════════════════════════════╣
║                                              ║
║  📄 FILE A                                   ║
║  [ Chọn Excel ]                              ║
║                                              ║
║  📄 FILE B                                   ║
║  [ Chọn Excel ]                              ║
║                                              ║
║  📄 FILE C                                   ║
║  [ Chọn Excel - tùy chọn ]                   ║
║                                              ║
║             [ ĐỐI CHIẾU ]                   ║
║                                              ║
╚══════════════════════════════════════════════╝
```

---

# 49. Kết quả

```text
╔══════════════════════════════════════════════╗
║                 KẾT QUẢ                     ║
╠══════════════════════════════════════════════╣
║ Tổng:              12,568                   ║
║                                              ║
║ 🟢 Trùng:          12,410                   ║
║ 🔴 Sai số:             82                   ║
║ 🟡 Sai ký tự:          31                   ║
║ 🟣 Sai ngày:            10                  ║
║ 🟠 Thiếu:               27                  ║
║ 🔵 Dư:                   8                  ║
║                                              ║
║ [ Tất cả ] [ Sai số ] [ Sai chữ ]           ║
║                                              ║
╚══════════════════════════════════════════════╝
```

---

# 50. Yêu cầu UX

Phải ưu tiên:

- Đơn giản.
- Ít thao tác.
- Font dễ đọc.
- Bảng dữ liệu rộng.
- Có horizontal scroll.
- Có vertical scroll.
- Double click để xem chi tiết.
- Click header để sort.
- Search nhanh.
- Filter nhanh.
- Export dễ dàng.

---

# 51. Không cần Cloud ở phiên bản đầu

Phiên bản V1:

```text
Excel
 ↓
Flutter
 ↓
Local processing
 ↓
Excel/PDF result
```

Không cần:

```text
Vercel
Neon
API
Login
Internet
```

Điều này giúp dữ liệu kế toán không phải rời khỏi máy.

---

# 52. Có thể mở rộng V2

Sau khi V1 ổn định:

```text
User Login
   ↓
Cloud
   ↓
Lưu lịch sử
   ↓
Đồng bộ cấu hình
   ↓
AI phân tích sai lệch
```

Có thể thêm:

```text
AI giải thích:
"Chứng từ HD001 lệch 270.000 đồng,
nguyên nhân có thể do File B chưa cập nhật
chiết khấu."
```

Nhưng AI không được tự sửa sổ kế toán.

---

# 53. Có thể mở rộng V3

Thêm:

```text
PDF Import
CSV Import
XML hóa đơn điện tử
Database Import
SQL Server
Oracle
MySQL
PostgreSQL
```

Ví dụ:

```text
Excel
PDF
XML
Oracle
SQL Server
       ↓
Chuẩn hóa
       ↓
Matching Engine
       ↓
Compare Engine
```

---

# 54. Kiểm thử bắt buộc

Tạo test cho:

## Text

```text
ABC == ABC
ABC != ABD
ABC == abc khi IgnoreCase
```

## Number

```text
1000 == 1000
1,000 == 1000
1000 != 1200
```

## Date

```text
30/08/2026 == 2026-08-30
```

## Missing

```text
A có
B không có
```

## Duplicate

```text
A có HD001 x 2
B có HD001 x 1
```

## 3 file

```text
A == B == C
A != B
A == B != C
```

---

# 55. Quy tắc kết quả

Nếu tất cả cột giống nhau:

```text
MATCHED
```

Nếu chỉ số khác:

```text
NUMBER_DIFFERENT
```

Nếu chỉ text khác:

```text
TEXT_DIFFERENT
```

Nếu ngày khác:

```text
DATE_DIFFERENT
```

Nếu nhiều loại khác:

```text
MULTIPLE_DIFFERENT
```

Nếu không có key:

```text
MISSING
```

Nếu key chỉ tồn tại file kia:

```text
EXTRA
```

---

# 56. MVP cần hoàn thành trước

Không làm tất cả cùng lúc.

## Phase 1

```text
☑ Chọn 2 file Excel
☑ Đọc Excel
☑ Chọn Header
☑ Mapping
☑ Chọn Key
☑ Normalize
☑ Matching
☑ Compare
☑ Dashboard
☑ Chi tiết
```

## Phase 2

```text
☑ File C
☑ Duplicate
☑ Aggregate
☑ Tổng tiền
☑ Export Excel
```

## Phase 3

```text
☑ PDF
☑ CSV
☑ Lưu template
☑ Lịch sử
☑ Isolate
☑ Tối ưu file lớn
```

## Phase 4

```text
☑ XML
☑ PDF hóa đơn
☑ Database
☑ AI phân tích
☑ Cloud
```

---

# 57. Tiêu chí hoàn thành V1

V1 được coi là hoàn thành khi:

1. Người dùng chọn được 2 file `.xlsx`.
2. Chọn được dòng Header.
3. Mapping được cột.
4. Chọn được 1 hoặc nhiều cột Key.
5. Chọn được các cột cần đối chiếu.
6. Đối chiếu không phụ thuộc thứ tự dòng.
7. Phát hiện được dòng thiếu/dư.
8. Phát hiện duplicate.
9. Phát hiện khác số.
10. Phát hiện khác ký tự.
11. Phát hiện khác ngày.
12. Hiển thị chi tiết.
13. Có tổng số dòng.
14. Có tổng số tiền.
15. Xuất được báo cáo Excel.
16. Không làm treo UI với file lớn ở mức hợp lý.
17. Chạy offline trên Windows.

---

# 58. Mục tiêu cuối cùng

Ứng dụng phải biến quy trình:

```text
Mở Excel A
↓
Mở Excel B
↓
Sort
↓
Tìm từng chứng từ
↓
Copy số tiền
↓
So sánh
↓
Ghi lại lỗi
```

thành:

```text
Chọn File A
+
Chọn File B
+
Chọn Key
↓
BẤM ĐỐI CHIẾU
↓
Ứng dụng tự tìm toàn bộ sai lệch
↓
Xem danh sách lỗi
↓
Xuất Excel báo cáo
```

Tên dự án đề xuất:

```text
accounting_excel_reconciler
```

Tên ứng dụng:

```text
Đối Chiếu Sổ Sách
```

Hoặc:

```text
Excel Reconcile Pro
```

