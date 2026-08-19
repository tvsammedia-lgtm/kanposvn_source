# ENGPIC Flutter — Đặc tả kỹ thuật hoàn chỉnh

## 1. Mục tiêu

Xây dựng ứng dụng Flutter học tiếng Anh qua hình ảnh và luyện Quiz, lấy **`engpic.zip`** làm nguồn tham chiếu trực tiếp về nội dung và trải nghiệm.

Ứng dụng mới phải:

- Hiển thị từ vựng tiếng Anh kèm hình ảnh minh họa.
- Cho phép học nhanh theo bộ từ/chủ đề.
- Có Quiz trắc nghiệm có thời gian.
- Có nhiều dạng câu hỏi dựa trên hình ảnh và từ vựng.
- Lưu tiến độ học offline bằng Isar.
- Đồng bộ dữ liệu/tiến độ lên Neon PostgreSQL thông qua API triển khai trên Vercel.
- Có thể hoạt động offline khi không có Internet.
- Khi có Internet, tự đồng bộ dữ liệu theo cơ chế queue + retry, không làm mất dữ liệu.
- Có thể mở rộng sau này sang phát âm, câu ví dụ, AI, Spaced Repetition và nhiều bộ từ vựng.

---

## 2. Phân tích trực tiếp `engpic.zip`

File tham chiếu được kiểm tra trực tiếp.

### Cấu trúc chính

```text
engpic/
├── engpic.exe
├── engpic.ini
├── bitmap/
│   ├── back.bmp
│   ├── dung.BMP
│   ├── sai.bmp
│   └── time.bmp
├── picture/
│   ├── data.dat
│   └── *.bmp
└── sound/
    ├── dung.wav
    ├── sai.wav
    └── select.wav
```

### Thống kê tài nguyên

- File `engpic.ini`: cấu hình bài Quiz.
- `NumberOfSentence=10`: bài kiểm tra tham chiếu có 10 câu.
- `Time=15`: thời gian tham chiếu là 15 giây.
- `picture/data.dat`: có **70 dòng từ vựng**.
- Thư mục `picture/`: có **308 file BMP**.
- Thư mục `sound/`: có **3 file WAV**.
- Có tài nguyên hình riêng cho trạng thái đúng/sai/chọn/thời gian.
- `data.dat` sử dụng kiểu mã hóa ký tự cũ; dữ liệu cần được chuẩn hóa sang UTF-8 khi import vào hệ thống Flutter mới.

### Một số dữ liệu đọc được từ `data.dat`

| English | Vietnamese trong file gốc |
|---|---|
| airplane | maùy bay |
| angel | thieân thaàn |
| apple | quaû taùo |
| areca | quaû cau |
| ax | caùi buùa |
| baby | ñöùa treû |
| bag | tuùi |
| balloon | quaû boùng bay |
| bamboo | caây tre |
| banana | quaû chuoái |
| basket | gioû |
| battery | pin |
| bear | con gaáu |
| bed | caùi giöôøng |
| bee | con ong |

> Lưu ý: tiếng Việt trong `data.dat` đang dùng mã hóa cũ, ví dụ xuất hiện dạng `maùy bay`, `quaû taùo`. Khi import phải có bước chuyển đổi/kiểm tra encoding để đưa dữ liệu về Unicode UTF-8 chuẩn như `máy bay`, `quả táo`.

---

## 3. Định hướng UX mới

Giữ tinh thần của ENGPIC nhưng hiện đại hóa cho Android/iOS/Windows:

### Màn hình chính

```text
┌─────────────────────────────────┐
│ ENGPIC                           │
│ Học tiếng Anh qua hình ảnh      │
├─────────────────────────────────┤
│                                 │
│  📚 HỌC TỪ VỰNG                 │
│  🖼️ HỌC QUA HÌNH ẢNH            │
│  📝 QUIZ 10 CÂU                 │
│  🔄 ÔN TẬP                      │
│  📊 TIẾN ĐỘ                     │
│                                 │
├─────────────────────────────────┤
│ Hôm nay                         │
│ Đã học: 24 từ                   │
│ Chính xác: 86%                  │
│ Chuỗi hiện tại: 5 ngày          │
└─────────────────────────────────┘
```

---

# 4. Kiến trúc tổng thể

```text
                 ┌───────────────────────┐
                 │       Flutter App     │
                 │ Android/iOS/Windows   │
                 └───────────┬───────────┘
                             │
                 ┌───────────▼───────────┐
                 │        Riverpod       │
                 │ State / Repository    │
                 └───────────┬───────────┘
                             │
             ┌───────────────┴────────────────┐
             │                                │
   ┌─────────▼─────────┐            ┌────────▼─────────┐
   │       Isar        │            │   Sync Queue     │
   │ Offline Database  │            │ Pending Changes  │
   └─────────┬─────────┘            └────────┬─────────┘
             │                               │
             │ Internet available            │
             └───────────────┬───────────────┘
                             ▼
                    ┌─────────────────┐
                    │ Vercel API      │
                    │ REST API        │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Neon PostgreSQL │
                    │ Cloud Database  │
                    └─────────────────┘
```

Nguyên tắc:

1. UI không truy cập Neon trực tiếp.
2. Flutter chỉ truy cập API Vercel.
3. Isar là database chính khi offline.
4. Neon là database cloud để đồng bộ.
5. Mọi thay đổi quan trọng đều có `updatedAt`, `deviceId`, `syncStatus`, `version`.
6. Đồng bộ phải idempotent để request gửi lại không tạo dữ liệu trùng.

---

# 5. Công nghệ

## Flutter

- Flutter stable.
- Dart 3.x.
- Material 3.
- Riverpod.
- Isar.
- Dio hoặc `http`.
- `path_provider`.
- `shared_preferences`.
- `connectivity_plus`.
- `uuid`.
- `just_audio` hoặc package audio tương đương.
- `cached_network_image` nếu dùng ảnh cloud.
- `file_picker` cho import dữ liệu.
- `flutter_tts` tùy chọn cho phát âm.

## Backend

- Vercel.
- TypeScript/Node.js.
- REST API.
- Neon PostgreSQL.
- ORM/query builder: Drizzle ORM hoặc SQL trực tiếp có parameterized query.
- JWT/session token nếu có tài khoản.
- Cron/Background Sync tùy nhu cầu.

---

# 6. Cấu trúc Flutter project

```text
lib/
├── main.dart
├── app.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── utils/
│   ├── sync/
│   └── audio/
│
├── database/
│   ├── isar_service.dart
│   ├── isar_models/
│   └── repositories/
│
├── features/
│   ├── home/
│   ├── vocabulary/
│   ├── image_learning/
│   ├── quiz/
│   ├── review/
│   ├── progress/
│   ├── settings/
│   └── sync/
│
├── services/
│   ├── api_service.dart
│   ├── quiz_engine.dart
│   ├── learning_engine.dart
│   ├── spaced_repetition_service.dart
│   └── import_service.dart
│
└── widgets/
    ├── vocabulary_card.dart
    ├── image_card.dart
    ├── answer_button.dart
    ├── progress_bar.dart
    ├── quiz_timer.dart
    └── sync_indicator.dart
```

---

# 7. Isar Database

## 7.1 Word

```dart
@collection
class Word {{
  Id id = Isar.autoIncrement;

  late String english;
  String? vietnamese;

  String? imageAsset;
  String? imageUrl;
  String? pronunciation;
  String? phonetic;

  String? category;
  String? level;

  String? exampleSentence;
  String? exampleTranslation;

  bool isFavorite = false;
  bool isActive = true;

  int correctCount = 0;
  int wrongCount = 0;
  int reviewCount = 0;

  double mastery = 0;

  DateTime? lastStudiedAt;
  DateTime? nextReviewAt;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  String? remoteId;
  String? deviceId;
  int version = 1;
  String syncStatus = 'pending';
}}
```

## 7.2 Category

```dart
@collection
class Category {{
  Id id = Isar.autoIncrement;

  late String code;
  late String name;

  String? description;
  String? imageUrl;

  int sortOrder = 0;
  bool isActive = true;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  String? remoteId;
  int version = 1;
  String syncStatus = 'pending';
}}
```

## 7.3 QuizQuestion

```dart
@collection
class QuizQuestion {{
  Id id = Isar.autoIncrement;

  late String quizId;
  late String questionType;

  String? wordId;
  String? imageAsset;
  String? imageUrl;

  late String questionText;

  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;

  late String correctAnswer;

  int orderIndex = 0;
  int timeLimitSeconds = 15;

  DateTime createdAt = DateTime.now();
}}
```

## 7.4 QuizAttempt

```dart
@collection
class QuizAttempt {{
  Id id = Isar.autoIncrement;

  late String quizId;

  int totalQuestions = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int skippedAnswers = 0;

  int score = 0;

  int durationSeconds = 0;

  DateTime startedAt = DateTime.now();
  DateTime? completedAt;

  String? deviceId;
  String syncStatus = 'pending';

  DateTime updatedAt = DateTime.now();
}}
```

## 7.5 QuizAnswer

```dart
@collection
class QuizAnswer {{
  Id id = Isar.autoIncrement;

  late String attemptId;
  late String questionId;

  String? selectedAnswer;
  late String correctAnswer;

  bool isCorrect = false;
  bool isTimeout = false;

  int responseTimeMs = 0;

  DateTime answeredAt = DateTime.now();
}}
```

## 7.6 LearningProgress

```dart
@collection
class LearningProgress {{
  Id id = Isar.autoIncrement;

  late String wordId;

  int seenCount = 0;
  int correctCount = 0;
  int wrongCount = 0;

  double accuracy = 0;
  double mastery = 0;

  int repetition = 0;
  double easeFactor = 2.5;
  int intervalDays = 0;

  DateTime? lastReviewAt;
  DateTime? nextReviewAt;

  DateTime updatedAt = DateTime.now();

  String? remoteId;
  String? deviceId;
  int version = 1;
  String syncStatus = 'pending';
}}
```

## 7.7 SyncQueue

```dart
@collection
class SyncQueue {{
  Id id = Isar.autoIncrement;

  late String entity;
  late String entityId;
  late String action;

  String? payload;

  int retryCount = 0;

  DateTime createdAt = DateTime.now();
  DateTime? lastAttemptAt;

  String status = 'pending';
  String? errorMessage;
}}
```

---

# 8. Chuẩn hóa dữ liệu ENGPIC

## Import pipeline

```text
engpic.zip
    ↓
Extract
    ↓
Đọc data.dat
    ↓
Detect legacy encoding
    ↓
Convert → UTF-8
    ↓
Normalize English
    ↓
Normalize Vietnamese
    ↓
Match English ↔ picture/*.bmp
    ↓
Import Word vào Isar
    ↓
Gán Category/Level
    ↓
Generate quiz data
```

### Quy tắc mapping hình ảnh

Nếu `data.dat` có:

```text
airplane ...
apple ...
banana ...
```

thì tìm:

```text
picture/airplane.bmp
picture/apple.bmp
picture/banana.bmp
```

và lưu:

```text
imageAsset = assets/engpic/picture/airplane.bmp
```

Tên file không phân biệt chữ hoa/chữ thường khi import.

Nếu không tìm thấy ảnh:

```text
imageAsset = null
importWarning = IMAGE_NOT_FOUND
```

Không được làm app crash.

---

# 9. Asset Flutter

Chuyển tài nguyên cần thiết sang:

```text
assets/
├── engpic/
│   ├── images/
│   ├── sounds/
│   └── ui/
```

Ví dụ:

```yaml
flutter:
  assets:
    - assets/engpic/images/
    - assets/engpic/sounds/
    - assets/engpic/ui/
```

Không nên nhúng toàn bộ 308 BMP vào một màn hình cùng lúc.

Ảnh cần được load lazy.

---

# 10. Màn hình học từ vựng

## Vocabulary List

Hiển thị:

- hình ảnh
- English
- phiên âm
- nghĩa tiếng Việt
- nút phát âm
- mức độ nhớ
- trạng thái đã học/chưa học

Ví dụ:

```text
┌─────────────────────────────┐
│        [ IMAGE ]            │
│                             │
│          APPLE              │
│          /ˈæpəl/            │
│          quả táo            │
│                             │
│        🔊 Phát âm           │
├─────────────────────────────┤
│  Mastery ███████░░░ 70%     │
│                             │
│  [ Đã nhớ ]   [ Ôn lại ]    │
└─────────────────────────────┘
```

---

# 11. Chế độ học qua hình ảnh

## Mode A — Nhìn hình → chọn từ

```text
          [ HÌNH QUẢ TÁO ]

Which word is this?

[ APPLE ]
[ ORANGE ]
[ BANANA ]
[ BREAD ]
```

## Mode B — Nhìn từ → chọn hình

```text
Which picture means "APPLE"?

[IMG] [IMG]
[IMG] [IMG]
```

## Mode C — English → Vietnamese

```text
APPLE means:

A. quả táo
B. quả chuối
C. con chim
D. cái giường
```

## Mode D — Vietnamese → English

```text
"quả táo" = ?

A. apple
B. banana
C. orange
D. melon
```

## Mode E — Nghe → chọn

Phát audio/TTS:

```text
🔊 Apple

[ apple ]
[ airplane ]
[ angel ]
[ animal ]
```

---

# 12. Quiz Engine

Quiz mặc định mô phỏng cấu hình ENGPIC:

```text
NumberOfSentence = 10
Time = 15 seconds/question
```

Có thể cho người dùng cấu hình:

```text
Số câu:
5 / 10 / 20 / 30

Thời gian:
Không giới hạn
10 giây
15 giây
20 giây
30 giây
```

---

# 13. Luật sinh Quiz

Không chọn đáp án sai ngẫu nhiên một cách hoàn toàn.

Ưu tiên distractor:

1. Cùng category.
2. Cùng level.
3. Từ đã học.
4. Từ có hình ảnh.
5. Không trùng đáp án đúng.
6. Không lặp lại câu trong cùng Quiz.

Ví dụ:

Đáp án:

```text
APPLE
```

Có thể chọn distractor:

```text
BANANA
ORANGE
PEAR
```

thay vì những từ hoàn toàn không liên quan.

---

# 14. Quiz State Machine

```text
READY
  ↓
START
  ↓
QUESTION
  ↓
WAIT_ANSWER
  ├── CORRECT
  ├── WRONG
  └── TIMEOUT
        ↓
NEXT_QUESTION
        ↓
QUESTION
        ↓
COMPLETE
        ↓
RESULT
```

---

# 15. Timer

Mỗi câu:

```text
15 → 14 → 13 → ... → 1 → 0
```

Khi về 0:

```text
isTimeout = true
selectedAnswer = null
```

Sau đó tự chuyển câu.

Timer phải được dispose khi:

- rời màn hình;
- kết thúc Quiz;
- app chuyển background;
- Quiz bị hủy.

Không dùng timer global gây memory leak.

---

# 16. Hiệu ứng đúng/sai

Dựa trên ý tưởng từ:

```text
bitmap/dung.BMP
bitmap/sai.bmp
sound/dung.wav
sound/sai.wav
sound/select.wav
```

Thiết kế mới:

### Đúng

```text
✓ Chính xác!
+10 điểm
```

phát âm thanh `correct`.

### Sai

```text
✗ Chưa đúng
Đáp án: APPLE
```

phát âm thanh `wrong`.

### Chọn đáp án

phát âm thanh `select`.

---

# 17. Điểm Quiz

Công thức đề xuất:

```text
baseScore = 100

correctScore =
100 + bonusTime + streakBonus
```

Ví dụ:

```text
Đúng                 +100
Đúng nhanh            +0 → +50
Chuỗi 3 câu đúng      +20
Chuỗi 5 câu đúng      +40
Sai                    0
Timeout                0
```

Điểm cuối:

```text
score = tổng điểm từng câu
```

Không nên phạt điểm âm trong phiên bản đầu.

---

# 18. Kết quả Quiz

```text
┌─────────────────────────────┐
│       KẾT QUẢ QUIZ          │
│                             │
│          8 / 10             │
│                             │
│       80% chính xác         │
│                             │
│  Đúng:       8              │
│  Sai:        1              │
│  Bỏ qua:     1              │
│                             │
│  Điểm:       860            │
│                             │
│ [ Xem đáp án ]              │
│ [ Làm lại ]                 │
│ [ Ôn từ sai ]               │
└─────────────────────────────┘
```

---

# 19. Spaced Repetition

Sau mỗi câu:

### Đúng

```text
correctCount++
mastery tăng
repetition++
intervalDays tăng
```

### Sai

```text
wrongCount++
mastery giảm
repetition reset hoặc giảm
nextReviewAt = sớm hơn
```

Công thức phiên bản đơn giản:

```text
Nếu đúng lần đầu:
1 ngày

Đúng lần 2:
3 ngày

Đúng lần 3:
7 ngày

Đúng lần 4:
14 ngày

Đúng lần 5:
30 ngày
```

Có thể nâng cấp thành SM-2 sau này.

---

# 20. Dashboard tiến độ

Hiển thị:

```text
Tổng từ:           308
Đã học:             120
Đã nhớ:              80
Cần ôn:              25
Chính xác:           86%

Quiz:
Số bài:              32
Điểm trung bình:    840
Accuracy:            84%

Hôm nay:
Từ mới:              20
Ôn tập:               15
Quiz:                  2
```

---

# 21. Category

Hệ thống category nên mở rộng từ dữ liệu ENGPIC:

```text
Animals
Food
Fruit
Vegetables
Objects
Transportation
People
Clothes
Home
Nature
Tools
School
Sports
Other
```

Nếu không đủ dữ liệu để phân loại tự động:

```text
category = OTHER
```

Không tự đoán category quá mức trong bước import.

---

# 22. Level

Có thể chia:

```text
A1
A2
B1
B2
C1
C2
```

Nhưng dữ liệu ENGPIC gốc không chứa CEFR.

Vì vậy phiên bản import đầu tiên:

```text
level = beginner
```

Sau đó admin có thể cập nhật level.

---

# 23. API Vercel

## Endpoint

```text
POST /api/auth/login

GET  /api/words
GET  /api/words/:id

POST /api/sync/push
POST /api/sync/pull

GET  /api/categories

POST /api/quiz/attempt
POST /api/quiz/answer

GET  /api/progress
POST /api/progress

GET  /api/sync/status
```

---

# 24. Sync Push

Flutter gửi:

```json
{
  "deviceId": "device-001",
  "changes": [
    {
      "entity": "learning_progress",
      "entityId": "123",
      "action": "upsert",
      "version": 4,
      "updatedAt": "2026-08-18T01:00:00Z"
    }
  ]
}
```

Server:

1. Validate token.
2. Validate schema.
3. Kiểm tra `entityId`.
4. So sánh version.
5. Upsert nếu version mới hơn.
6. Trả kết quả từng record.

---

# 25. Sync Pull

Flutter gửi:

```text
GET /api/sync/pull?cursor=...
```

Server trả:

```json
{
  "items": [],
  "nextCursor": "abc123",
  "hasMore": false
}
```

Không tải lại toàn bộ database mỗi lần.

---

# 26. Conflict Resolution

Ưu tiên:

```text
version cao hơn
```

Nếu cùng version:

```text
updatedAt mới hơn
```

Nếu vẫn giống:

```text
server wins
```

Các entity như QuizAnswer nên append-only để hạn chế conflict.

---

# 27. Offline-first

Khi mất mạng:

```text
Flutter
   ↓
Isar
   ↓
SyncQueue
```

Không chặn người học.

Ví dụ:

```text
08:00 offline
08:05 làm Quiz
08:10 hoàn thành Quiz
08:20 có Internet
08:21 auto sync
```

---

# 28. Auto Sync

Trigger:

```text
1. App mở
2. App resume
3. Connectivity đổi từ offline → online
4. Sau khi hoàn thành Quiz
5. Sau khi học từ
6. Timer định kỳ 1–5 phút
```

Không sync liên tục từng thao tác UI.

Dùng debounce:

```text
change → chờ 2–5 giây → gom batch → push
```

---

# 29. Sync Status trên UI

Góc màn hình:

```text
☁ Đã đồng bộ
☁↻ Đang đồng bộ
⚠ Chờ đồng bộ
✕ Đồng bộ lỗi
```

Tap vào icon:

```text
Lần đồng bộ cuối:
08:21

Chờ:
3 bản ghi

Lỗi:
0
```

---

# 30. Neon PostgreSQL Schema

## users

```sql
CREATE TABLE users (
    id UUID PRIMARY KEY,
    email TEXT UNIQUE,
    display_name TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

## words

```sql
CREATE TABLE words (
    id UUID PRIMARY KEY,
    english TEXT NOT NULL,
    vietnamese TEXT,
    phonetic TEXT,
    pronunciation TEXT,
    image_url TEXT,
    category_code TEXT,
    level TEXT,
    example_sentence TEXT,
    example_translation TEXT,
    is_active BOOLEAN NOT NULL DEFAULT true,
    version BIGINT NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

## learning_progress

```sql
CREATE TABLE learning_progress (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    word_id UUID NOT NULL,
    seen_count INT NOT NULL DEFAULT 0,
    correct_count INT NOT NULL DEFAULT 0,
    wrong_count INT NOT NULL DEFAULT 0,
    accuracy NUMERIC(5,2) NOT NULL DEFAULT 0,
    mastery NUMERIC(5,2) NOT NULL DEFAULT 0,
    repetition INT NOT NULL DEFAULT 0,
    ease_factor NUMERIC(4,2) NOT NULL DEFAULT 2.5,
    interval_days INT NOT NULL DEFAULT 0,
    last_review_at TIMESTAMPTZ,
    next_review_at TIMESTAMPTZ,
    version BIGINT NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),

    UNIQUE(user_id, word_id)
);
```

## quiz_attempts

```sql
CREATE TABLE quiz_attempts (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    total_questions INT NOT NULL,
    correct_answers INT NOT NULL,
    wrong_answers INT NOT NULL,
    skipped_answers INT NOT NULL,
    score INT NOT NULL,
    duration_seconds INT NOT NULL,
    started_at TIMESTAMPTZ NOT NULL,
    completed_at TIMESTAMPTZ,
    device_id TEXT,
    version BIGINT NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

---

# 31. Vercel environment variables

```text
DATABASE_URL=
DIRECT_URL=
JWT_SECRET=
APP_ENV=production
```

Không lưu các secret trong Flutter.

Flutter chỉ lưu:

```text
API_BASE_URL
```

---

# 32. API Security

Bắt buộc:

- HTTPS.
- JWT hoặc token session.
- Validate request body.
- Rate limit.
- Parameterized SQL.
- Không cho client tự sửa `user_id`.
- Không cho client tăng `version` tùy ý.
- Server tự tạo timestamps quan trọng.
- Kiểm tra ownership của progress/quiz.
- Không expose `DATABASE_URL`.

---

# 33. Import Tool

Nên tạo một tool riêng:

```text
tools/
└── engpic_importer/
    ├── main.dart hoặc Python script
    ├── encoding_converter
    ├── image_mapper
    └── export_json
```

Output:

```text
engpic_words.json
```

Ví dụ:

```json
{
  "english": "apple",
  "vietnamese": "quả táo",
  "image": "apple.bmp",
  "category": "Fruit",
  "level": "beginner"
}
```

---

# 34. Quy trình import chính thức

```text
engpic.zip
   ↓
Extract
   ↓
Scan picture/
   ↓
Scan data.dat
   ↓
Decode legacy encoding
   ↓
Normalize Vietnamese
   ↓
Normalize English lowercase
   ↓
Match picture
   ↓
Validate duplicate
   ↓
Generate JSON
   ↓
Review
   ↓
Import Isar
   ↓
Import Neon
```

Các lỗi import phải xuất:

```text
missing_image
duplicate_word
empty_english
empty_vietnamese
invalid_filename
encoding_warning
```

---

# 35. Quiz Generator

Pseudo-code:

```dart
QuizQuestion generateQuestion(List<Word> pool) {{
  final target = pickTarget(pool);

  final distractors = pickDistractors(
    target: target,
    pool: pool,
    count: 3,
  );

  final options = [
    target.english,
    ...distractors.map((e) => e.english),
  ];

  options.shuffle();

  return QuizQuestion(
    questionType: 'image_to_word',
    wordId: target.id.toString(),
    imageAsset: target.imageAsset,
    questionText: 'Which word is this?',
    optionA: options[0],
    optionB: options[1],
    optionC: options[2],
    optionD: options[3],
    correctAnswer: target.english,
    timeLimitSeconds: 15,
  );
}}
```

---

# 36. Các loại Quiz cần triển khai

### Phase 1

```text
image_to_word
word_to_vietnamese
vietnamese_to_word
```

### Phase 2

```text
word_to_image
audio_to_word
image_to_vietnamese
```

### Phase 3

```text
spelling
sentence_completion
listening
pronunciation
```

---

# 37. Quiz thông minh

Ưu tiên câu hỏi theo:

```text
40% từ yếu
30% từ đang cần ôn
20% từ mới
10% từ đã nhớ
```

Ví dụ:

```text
mastery < 40:
ưu tiên cao

40–70:
ưu tiên vừa

> 70:
ôn duy trì
```

---

# 38. Chế độ luyện tập

## Học mới

```text
Từ chưa học
```

## Ôn tập

```text
nextReviewAt <= now
```

## Từ sai

```text
wrongCount > 0
```

## Từ yêu thích

```text
isFavorite = true
```

## Quiz nhanh

```text
10 câu / 15 giây
```

---

# 39. Âm thanh

Từ tài nguyên:

```text
dung.wav
sai.wav
select.wav
```

Map thành:

```text
correctSound
wrongSound
selectSound
```

Có setting:

```text
Âm thanh:
ON/OFF

Âm lượng:
0–100%

Tự phát âm:
ON/OFF
```

---

# 40. Phát âm tiếng Anh

Phiên bản mở rộng:

```text
Apple
🔊
```

Dùng:

```text
flutter_tts
```

Hoặc audio native lưu sẵn:

```text
assets/audio/apple.mp3
```

Ưu tiên audio native khi cần phát âm chuẩn cố định.

---

# 41. Chế độ hình ảnh

Có 2 nguồn:

### Local

```text
assets/engpic/images/apple.bmp
```

Ưu điểm:

- offline 100%
- không phụ thuộc CDN
- mở ngay.

### Cloud

```text
https://cdn-domain/images/apple.webp
```

Ưu điểm:

- cập nhật ảnh.
- giảm APK nếu nhiều ảnh.

Kiến trúc nên hỗ trợ cả hai:

```dart
imageAsset ?? imageUrl
```

---

# 42. Tối ưu ảnh

BMP từ ENGPIC là tài nguyên cũ.

Không nên giữ nguyên toàn bộ BMP cho production nếu dung lượng APK lớn.

Pipeline:

```text
BMP
 ↓
resize
 ↓
WebP/JPEG
 ↓
quality 80–90
 ↓
Flutter asset
```

Giữ BMP gốc trong thư mục source/archive.

---

# 43. Search

Cho phép:

```text
Tìm English
Tìm Vietnamese
Tìm category
```

Ví dụ:

```text
apple
```

→

```text
APPLE
quả táo
Fruit
```

---

# 44. Favorites

Người dùng có thể:

```text
⭐ Thêm yêu thích
⭐ Bỏ yêu thích
```

Lưu Isar:

```text
isFavorite = true
```

Sau đó sync cloud.

---

# 45. Statistics

Thống kê:

```text
Words Learned
Words Mastered
Accuracy
Quiz Score
Quiz Count
Study Streak
Review Due
```

Chart:

```text
7 ngày
30 ngày
90 ngày
```

---

# 46. Daily Goal

Ví dụ:

```text
Mục tiêu hôm nay:

20 từ
1 Quiz
10 phút
```

Progress:

```text
████████████░░ 75%
```

---

# 47. Gamification

Có thể thêm:

```text
XP
Level
Streak
Badge
Daily Goal
Achievement
```

Ví dụ:

```text
🏆 First Quiz
🏆 10 Correct
🏆 100 Words
🏆 7 Day Streak
```

Các tính năng này không ảnh hưởng core learning engine.

---

# 48. Navigation

Bottom Navigation:

```text
Trang chủ
Từ vựng
Quiz
Ôn tập
Tôi
```

---

# 49. Trang Quiz

```text
Quiz
├── Quiz nhanh
├── Quiz hình ảnh
├── Quiz từ vựng
├── Quiz nghe
└── Lịch sử Quiz
```

---

# 50. Trang ôn tập

```text
Ôn tập hôm nay
----------------
25 từ cần ôn

[ Bắt đầu ôn ]

Từ yếu:
12

Từ trung bình:
8

Từ đã nhớ:
5
```

---

# 51. Repository pattern

```text
UI
 ↓
Provider
 ↓
UseCase
 ↓
Repository
 ├── IsarDataSource
 └── ApiDataSource
```

Không gọi Isar trực tiếp từ Widget.

---

# 52. Riverpod providers

Ví dụ:

```dart
final wordsProvider = FutureProvider<List<Word>>((ref) async {{
  return ref.read(wordRepositoryProvider).getWords();
}});
```

Các provider chính:

```text
wordRepositoryProvider
quizRepositoryProvider
progressRepositoryProvider
syncRepositoryProvider
quizEngineProvider
learningEngineProvider
audioServiceProvider
```

---

# 53. Repository interface

```dart
abstract class WordRepository {{
  Future<List<Word>> getWords();
  Future<Word?> getWordById(int id);
  Future<List<Word>> search(String query);
  Future<void> save(Word word);
  Future<void> delete(Word word);
}}
```

---

# 54. Test bắt buộc

## Unit test

```text
QuizGenerator
Timer
Scoring
SpacedRepetition
EncodingConverter
ImageMapper
SyncConflictResolver
```

## Integration test

```text
Import → Isar
Quiz → Progress
Offline → Queue
Online → Push
Pull → Isar
```

## UI test

```text
Start Quiz
Select Answer
Timeout
Next Question
Complete
Result
```

---

# 55. Kiểm thử offline

Phải kiểm tra:

```text
Wi-Fi OFF
Mobile Data OFF
```

Sau đó:

```text
Học từ
Làm Quiz
Xem kết quả
```

Tất cả vẫn hoạt động.

Sau khi online:

```text
Pending = 0
```

---

# 56. Xử lý retry

Nếu API lỗi:

```text
retryCount++
```

Backoff:

```text
5 giây
15 giây
30 giây
1 phút
5 phút
15 phút
```

Giới hạn retry.

Không retry vô hạn một request lỗi schema.

---

# 57. Cursor Sync

Không dùng:

```text
SELECT toàn bộ bảng
```

Mỗi lần.

Dùng:

```text
updated_at
+
cursor
```

Ví dụ:

```text
lastSyncAt = 2026-08-18T01:00:00Z
```

Server trả record thay đổi sau thời điểm đó.

---

# 58. Multi-device

Nếu user đăng nhập trên:

```text
Android
iPhone
Windows
```

thì:

```text
Device A → Neon
Device B ← Neon
Device C ← Neon
```

Isar của từng thiết bị vẫn độc lập.

---

# 59. Device ID

Tạo UUID khi cài app lần đầu:

```text
deviceId
```

Lưu local.

Không dùng Android hardware ID làm khóa chính.

---

# 60. Dữ liệu không đồng bộ trực tiếp giữa Isar

Không:

```text
Isar A → Isar B
```

Mà:

```text
Isar A
 ↓
Vercel API
 ↓
Neon
 ↓
Vercel API
 ↓
Isar B
```

---

# 61. Admin Web tương lai

Có thể xây thêm:

```text
admin/
├── Dashboard
├── Words
├── Categories
├── Images
├── Quiz
├── Users
├── Progress
└── Sync Monitor
```

Admin có thể:

- thêm từ.
- sửa nghĩa.
- thay ảnh.
- gán category.
- gán CEFR.
- bật/tắt từ.
- xem thống kê Quiz.

---

# 62. CDN hình ảnh

Nếu sau này có hàng nghìn hình:

```text
Neon
  chỉ lưu metadata

Object Storage/CDN
  lưu image/audio
```

Ví dụ:

```text
words
image_url
audio_url
```

Không lưu binary ảnh lớn trong PostgreSQL.

---

# 63. Phiên bản dữ liệu

Mỗi Word:

```text
version
updatedAt
```

Mỗi Progress:

```text
version
updatedAt
```

Mục tiêu:

```text
đồng bộ incremental
```

---

# 64. Migration Isar

Khi thêm field:

```text
version 1
→ version 2
```

Phải có migration strategy.

Không xóa database người dùng chỉ vì thay đổi model.

---

# 65. App settings

```text
settings
├── soundEnabled
├── vibrationEnabled
├── autoPronunciation
├── quizQuestionCount
├── quizTimeLimit
├── darkMode
├── language
└── dailyGoal
```

Lưu local bằng SharedPreferences hoặc Isar.

---

# 66. Cấu hình mặc định theo ENGPIC

```text
questionCount = 10
timeLimit = 15 seconds
sound = ON
autoNext = ON
language = Vietnamese
```

Đây là cấu hình tương thích với:

```text
engpic.ini
NumberOfSentence=10
Time=15
```

---

# 67. Error handling

Không để app crash vì:

```text
ảnh mất
audio mất
API lỗi
database lỗi
JSON lỗi
sync conflict
```

Ví dụ mất ảnh:

```text
[No Image]
```

Mất mạng:

```text
Bạn đang offline.
Dữ liệu sẽ được đồng bộ khi có Internet.
```

---

# 68. Logging

Production không log:

```text
password
JWT
DATABASE_URL
PII
```

Có thể log:

```text
sync_started
sync_success
sync_failed
quiz_started
quiz_completed
import_failed
```

---

# 69. Quy trình build

```text
1. flutter pub get
2. dart run build_runner build
3. flutter analyze
4. flutter test
5. flutter build apk --release
```

Windows:

```text
flutter build windows --release
```

---

# 70. Roadmap

## Phase 1 — MVP

```text
✓ Import ENGPIC
✓ Isar
✓ Học từ
✓ Hình ảnh
✓ Quiz 10 câu
✓ Timer 15 giây
✓ Đúng/sai
✓ Kết quả
✓ Offline
```

## Phase 2

```text
✓ Neon
✓ Vercel API
✓ Sync
✓ Login
✓ Multi-device
✓ Progress
```

## Phase 3

```text
✓ Spaced Repetition
✓ Daily Goal
✓ Streak
✓ Favorites
✓ Statistics
✓ Audio/TTS
```

## Phase 4

```text
✓ Admin Web
✓ CEFR
✓ Nhiều bộ từ
✓ Listening
✓ Spelling
✓ Sentence Quiz
```

## Phase 5

```text
✓ AI Tutor
✓ AI tạo câu ví dụ
✓ AI giải thích từ
✓ AI tạo Quiz
✓ Pronunciation scoring
```

---

# 71. Quy tắc quan trọng khi phát triển

### Không phụ thuộc Internet để học

```text
Learning = Isar first
```

### Không cho Flutter truy cập Neon

```text
Flutter → Vercel → Neon
```

### Không tải toàn bộ dữ liệu mỗi lần sync

```text
Incremental sync
```

### Không tạo Quiz chỉ từ dữ liệu trên server

```text
Quiz có thể chạy hoàn toàn offline.
```

### Không để hình ảnh quyết định logic

Hình chỉ là presentation asset.

Word ID mới là khóa logic.

---

# 72. Definition of Done

App được xem là hoàn thành MVP khi:

- [ ] Import được `engpic.zip`.
- [ ] Chuẩn hóa được dữ liệu `data.dat`.
- [ ] Mapping đúng từ ↔ ảnh.
- [ ] Học từ offline.
- [ ] Quiz 10 câu.
- [ ] Timer mặc định 15 giây.
- [ ] Có hình ảnh trong Quiz.
- [ ] Có đáp án A/B/C/D.
- [ ] Chấm đúng/sai.
- [ ] Có timeout.
- [ ] Có điểm.
- [ ] Có lịch sử Quiz.
- [ ] Có tiến độ học.
- [ ] Isar hoạt động offline.
- [ ] Có SyncQueue.
- [ ] Có Vercel API.
- [ ] Có Neon PostgreSQL.
- [ ] Push/Pull sync hoạt động.
- [ ] Retry khi mạng lỗi.
- [ ] Conflict resolution hoạt động.
- [ ] Có indicator trạng thái sync.
- [ ] Có test cho Quiz Engine.
- [ ] Có test cho Sync Engine.
- [ ] Không crash khi thiếu ảnh/audio.
- [ ] Có build Android release.

---

# 73. Kiến trúc cuối cùng

```text
                         ┌──────────────────────┐
                         │      ADMIN WEB       │
                         │   Word / Quiz / User │
                         └──────────┬───────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────┐
│                       VERCEL API                        │
│                                                        │
│ Auth │ Words │ Quiz │ Progress │ Sync │ Admin         │
└──────────────────────────┬─────────────────────────────┘
                           │
                           ▼
                 ┌─────────────────────┐
                 │   NEON POSTGRESQL   │
                 │                     │
                 │ Users               │
                 │ Words               │
                 │ Categories          │
                 │ Progress            │
                 │ Quiz Attempts       │
                 └─────────────────────┘
                           ▲
                           │
                    REST API / Sync
                           │
┌──────────────────────────┴─────────────────────────────┐
│                     FLUTTER APP                        │
│                                                        │
│ Home │ Vocabulary │ Image Learning │ Quiz │ Review    │
│                                                        │
│                 Riverpod                              │
│                    │                                   │
│              Repository Layer                          │
│              ┌─────┴─────┐                             │
│              ▼           ▼                             │
│            Isar       SyncQueue                        │
│              │           │                             │
│              └─────┬─────┘                             │
│                    ▼                                   │
│             Offline First                             │
└────────────────────────────────────────────────────────┘
```

## Kết luận

`engpic.zip` nên được xem là **bộ dữ liệu và ý tưởng UX tham chiếu**, không phải kiến trúc mà ứng dụng Flutter phải giữ nguyên.

Phiên bản mới nên giữ các đặc điểm cốt lõi:

```text
Hình ảnh
+
Từ tiếng Anh
+
Nghĩa tiếng Việt
+
Quiz
+
10 câu
+
15 giây
+
Đúng/Sai
+
Âm thanh
```

nhưng xây dựng lại bằng:

```text
Flutter
+
Isar Offline First
+
Riverpod
+
Vercel REST API
+
Neon PostgreSQL
+
Incremental Sync
+
Spaced Repetition
```

để app có thể phát triển lâu dài thành một nền tảng học tiếng Anh hoàn chỉnh.
