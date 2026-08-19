# KANJI MASTER – ĐẶC TẢ KỸ THUẬT HOÀN CHỈNH

## 1. Mục tiêu

Xây dựng ứng dụng Flutter học Kanji thông qua cầu nối:

**Chữ Hán/Hán Việt → Kanji Nhật → cách đọc Nhật → nghĩa → từ ghép → ôn tập → kiểm tra → ghi nhớ.**

Nguồn dữ liệu gốc là file `Kanji.doc` do người dùng cung cấp. File có các bản ghi theo dạng gần với:

`Kanji || cách đọc Nhật || Hán Việt + nghĩa`

Ví dụ trong nguồn: `学`, `時`, `空`, `間`, `開`, `毎`, `悪`, `先`, `朝`, `今`, `字`, `何`, `足`...; nhiều bản ghi có On-yomi/Kun-yomi và nghĩa tiếng Việt. Một số bản ghi có nhiều âm Hán Việt hoặc nhiều cách đọc.

> **Nguyên tắc dữ liệu:** không tự ý sửa dữ liệu nguồn. Dữ liệu chuẩn hóa/sửa lỗi phải được lưu ở lớp override/correction riêng.

---

# 2. Mục tiêu sản phẩm

App phải:

- Chạy học cơ bản **offline 100%**.
- Lưu toàn bộ dữ liệu Kanji và tiến độ bằng Isar.
- Tự sinh giáo trình từ kho Kanji.
- Tự sinh Quiz.
- Tự sinh Mini Game.
- Tự đánh giá khả năng nhớ.
- Dùng Spaced Repetition để quyết định chữ nào cần ôn.
- Có thể đồng bộ tài khoản/tiến độ lên Neon PostgreSQL thông qua Vercel API.
- Có thể cập nhật kho dữ liệu từ server nhưng không phụ thuộc server để học.
- Cho phép import DOC/DOCX để cập nhật dữ liệu.

---

# 3. Nguyên tắc sư phạm

## 3.1 Không học tuyến tính 1 → 2000

Không bắt buộc người dùng học đúng thứ tự file.

Learning Engine phải chọn Kanji dựa trên:

1. Chưa học.
2. Độ ưu tiên.
3. Độ khó.
4. Tần suất sai.
5. Lịch ôn.
6. Tốc độ trả lời.
7. Streak.
8. Quan hệ nhóm Kanji.
9. Tiến độ giáo trình.
10. Mục tiêu người dùng.

## 3.2 Cầu nối Hán Việt

Luồng ghi nhớ chính:

`HÁN VIỆT → KANJI → NHẬT → NGHĨA`

Ví dụ:

HỌC → 学 → ガク / まなぶ → học.

## 3.3 Micro-learning

Mặc định:

- 10 Kanji/bài.
- 10–20 câu quiz.
- 1 mini game.
- 5–10 phút/buổi.
- Cuối buổi có kiểm tra nhanh.

Có thể tự tăng lên 15–30 Kanji nếu người dùng đạt hiệu suất cao.

---

# 4. Kiến trúc tổng thể

```text
                 Kanji.doc / DOCX
                         |
                         v
                 Import Parser
                         |
                         v
               Data Normalization
                         |
                         v
              Local Isar Database
                         |
          +--------------+--------------+
          |              |              |
          v              v              v
     Lesson Engine    Quiz Engine    Game Engine
          |              |              |
          +--------------+--------------+
                         |
                         v
                Learning Engine
                         |
              Spaced Repetition
                         |
                         v
                  User Progress
                         |
              +----------+----------+
              |                     |
              v                     v
         Offline First          Sync Queue
                                    |
                                    v
                               Vercel API
                                    |
                                    v
                              Neon PostgreSQL
```

---

# 5. Công nghệ

## Mobile

- Flutter
- Dart
- Riverpod
- Isar
- shared_preferences
- http hoặc Dio
- file_picker
- path_provider
- intl
- audio/TTS package phù hợp
- json_serializable/freezed nếu cần

## Backend

- Vercel
- TypeScript
- REST API
- Neon PostgreSQL
- JWT hoặc cơ chế session/token phù hợp
- PostgreSQL migrations

## Offline

Isar là nguồn dữ liệu học chính trên thiết bị.

Server không được là dependency bắt buộc của:

- học bài
- quiz
- mini game
- ôn tập
- xem tiến độ
- tính điểm

---

# 6. Cấu trúc Flutter

```text
lib/
├── main.dart
│
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── utils/
│   └── services/
│
├── data/
│   ├── isar/
│   ├── models/
│   ├── repositories/
│   └── datasources/
│
├── features/
│   ├── onboarding/
│   ├── dashboard/
│   ├── kanji/
│   ├── lesson/
│   ├── flashcard/
│   ├── quiz/
│   ├── minigame/
│   ├── review/
│   ├── progress/
│   ├── settings/
│   └── import_data/
│
├── learning/
│   ├── lesson_generator/
│   ├── quiz_generator/
│   ├── game_generator/
│   ├── difficulty_engine/
│   └── spaced_repetition/
│
└── sync/
    ├── api_client.dart
    ├── sync_service.dart
    ├── sync_queue.dart
    └── sync_models.dart
```

---

# 7. Database Isar

## 7.1 Kanji

```dart
@collection
class Kanji {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String character;

  late String hanViet;

  String? meaning;

  List<String> onyomi = [];

  List<String> kunyomi = [];

  int? strokeCount;

  String? jlptLevel;

  int? frequency;

  String? mnemonic;

  String? radical;

  String sourceVersion = 'Kanji.doc';

  bool isActive = true;

  DateTime createdAt = DateTime.now();

  DateTime updatedAt = DateTime.now();
}
```

## 7.2 KanjiReading

```dart
@collection
class KanjiReading {
  Id id = Isar.autoIncrement;

  @Index()
  late int kanjiId;

  late String reading;

  String type = 'unknown';

  String? normalizedReading;
}
```

`type`:

- onyomi
- kunyomi
- other

## 7.3 KanjiMeaning

```dart
@collection
class KanjiMeaning {
  Id id = Isar.autoIncrement;

  @Index()
  late int kanjiId;

  late String meaning;

  String? hanVietVariant;

  int priority = 0;
}
```

## 7.4 KanjiWord

Dùng để bổ sung từ ghép sau này.

```dart
@collection
class KanjiWord {
  Id id = Isar.autoIncrement;

  @Index()
  late String word;

  String? reading;

  String? meaning;

  String? hanViet;

  List<int> kanjiIds = [];

  bool verified = false;
}
```

**Không được tự coi từ ghép là dữ liệu có trong `Kanji.doc` nếu file không cung cấp từ đó.**

---

# 8. Tiến độ người dùng

## UserKanjiProgress

```dart
@collection
class UserKanjiProgress {
  Id id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('userId')])
  late int kanjiId;

  late String userId;

  int memoryLevel = 0;

  double easeFactor = 2.5;

  int intervalDays = 0;

  int repetition = 0;

  int correctCount = 0;

  int wrongCount = 0;

  double accuracy = 0;

  int averageResponseMs = 0;

  DateTime? lastReviewedAt;

  DateTime? nextReviewAt;

  bool mastered = false;

  int streak = 0;
}
```

---

# 9. Lesson

```dart
@collection
class Lesson {
  Id id = Isar.autoIncrement;

  @Index()
  late String title;

  String? description;

  int order = 0;

  int targetCount = 10;

  List<int> kanjiIds = [];

  int difficulty = 1;

  bool generated = true;

  DateTime createdAt = DateTime.now();
}
```

---

# 10. Question

```dart
@collection
class QuizQuestion {
  Id id = Isar.autoIncrement;

  late String type;

  late String prompt;

  List<String> options = [];

  String? correctAnswer;

  String? explanation;

  int difficulty = 1;

  int? kanjiId;

  bool generated = true;
}
```

---

# 11. ReviewEvent

```dart
@collection
class ReviewEvent {
  Id id = Isar.autoIncrement;

  late String userId;

  late int kanjiId;

  late String action;

  bool correct = false;

  int responseMs = 0;

  int previousLevel = 0;

  int newLevel = 0;

  DateTime createdAt = DateTime.now();
}
```

---

# 12. SyncQueue

```dart
@collection
class SyncQueueItem {
  Id id = Isar.autoIncrement;

  late String entity;

  late String entityId;

  late String action;

  String payload = '';

  int retryCount = 0;

  DateTime createdAt = DateTime.now();

  DateTime? lastAttemptAt;

  String status = 'pending';
}
```

---

# 13. Import DOC/DOCX

## Pipeline

```text
File Picker
    |
    v
Read DOC/DOCX
    |
    v
Extract raw text
    |
    v
Normalize line breaks
    |
    v
Detect Kanji character
    |
    v
Detect reading
    |
    v
Detect Hán Việt
    |
    v
Detect meaning
    |
    v
Validation
    |
    v
Preview
    |
    v
User confirms
    |
    v
Isar transaction
```

## Dữ liệu nguồn

Các bản ghi trong file có dạng gần:

```text
耳 || ji - mimi - || NHĨ lỗ tai
紹 || shou - - || THIỆU giới thiệu
寺 || ji - tera - || TỰ chùa
星 || shou - sei - hoshi || TINH ngôi sao
```

File cũng có các mục như:

```text
秋 || shuu - aki - || THU mùa Thu
時 || ji - toki - || THỜI thời gian
空 || kuu - kara - sora || KHÔNG không khí, trống rỗng
間 || kan - aida - ma || GIAN ở giữa, thời gian, căn phòng
```

## Parser

Parser phải xử lý:

- khoảng trắng không đều
- dòng nối
- nhiều Kanji trên một dòng
- nhiều âm Hán Việt
- nhiều On-yomi
- nhiều Kun-yomi
- trường hợp thiếu cách đọc
- trường hợp nghĩa chứa dấu phẩy
- trường hợp dữ liệu bị nối với record kế tiếp

## Validation

Mỗi record kiểm tra:

```text
character != empty
hanViet != empty
meaning != empty
```

Nếu thiếu:

```text
status = NEED_REVIEW
```

Không tự động bịa dữ liệu còn thiếu.

---

# 14. Import Preview

Trước khi ghi Isar phải hiển thị:

```text
Tổng record
Record mới
Record trùng
Record thay đổi
Record lỗi
Record cần kiểm tra
```

Ví dụ:

```text
Kanji import
--------------------
Tổng:              2000
Mới:                1980
Trùng:                15
Thay đổi:              3
Cần kiểm tra:          2
```

Người dùng có thể:

- Import tất cả hợp lệ.
- Chỉ import record hợp lệ.
- Xem record lỗi.
- Hủy import.

---

# 15. Data Source Priority

```text
Kanji.doc
    ↓
raw_source
    ↓
normalized_data
    ↓
manual_correction
    ↓
final_kanji
```

Không sửa raw source.

Nếu phát hiện lỗi:

```text
Correction
----------------
kanjiId
field
oldValue
newValue
reason
approvedBy
createdAt
```

---

# 16. Lesson Generator

## Input

```text
available Kanji
user progress
target daily count
difficulty
learning goal
review queue
```

## Score

Có thể tính:

```text
priority =
    newWeight
  + reviewWeight
  + errorWeight
  + difficultyWeight
  + relationWeight
  + frequencyWeight
```

Sau đó sort giảm dần.

## Quy tắc

Ưu tiên:

1. Chữ đến hạn ôn.
2. Chữ sai nhiều.
3. Chữ chưa học.
4. Chữ có liên hệ với bài hiện tại.
5. Chữ có độ khó phù hợp.

---

# 17. Cấu trúc một bài học

```text
Lesson
│
├── Preview
│
├── Learn 1
│   └── Kanji 1–10
│
├── Recall
│
├── Quiz
│
├── Mini Game
│
├── Review
│
└── Lesson Test
```

---

# 18. Flashcard Engine

Mặt trước có thể là:

```text
HÁN VIỆT
HỌC
```

Người dùng phải nhớ:

```text
学
```

Mặt sau:

```text
学

HỌC
ガク
まなぶ

Nghĩa:
học, học tập
```

Các mode:

1. Hán Việt → Kanji
2. Kanji → Hán Việt
3. Kanji → nghĩa
4. Cách đọc → Kanji
5. Kanji → cách đọc

---

# 19. Quiz Engine

## Question Types

### Type A – Hán Việt → Kanji

```text
HỌC là Kanji nào?

A. 校
B. 学
C. 生
D. 字
```

### Type B – Kanji → Hán Việt

```text
学 có âm Hán Việt là gì?
```

### Type C – Kanji → nghĩa

### Type D – Kanji → On-yomi

### Type E – Kanji → Kun-yomi

### Type F – Reading → Kanji

### Type G – Nghĩa → Kanji

### Type H – Speed Quiz

### Type I – Mixed Quiz

---

# 20. Quy tắc sinh đáp án

Đáp án sai phải lấy từ:

1. Kanji cùng nhóm.
2. Kanji đã học.
3. Kanji có Hán Việt dễ nhầm.
4. Kanji có cách đọc gần nhau.

Không dùng đáp án vô lý.

Mỗi câu:

```text
1 correct
3 distractors
```

---

# 21. Mini Game Engine

## Game 1 – Match

Ghép:

```text
HỌC      学
SINH     生
TRƯỜNG   校
```

## Game 2 – Falling Kanji

Kanji rơi xuống.

Người chơi phải chọn chữ tương ứng với:

```text
HỌC
```

## Game 3 – Speed Kanji

30 giây.

Mỗi câu 1 điểm.

## Game 4 – Memory Card

Lật thẻ:

```text
HỌC
?
```

Tìm:

```text
学
```

## Game 5 – Kanji Battle

Đúng liên tiếp:

```text
1 → 2 → 3 → 4 → 5
```

Sai thì combo reset.

## Game 6 – Boss Test

Sau mỗi 50 Kanji:

```text
50 Kanji
20 câu
70% trở lên → PASS
```

---

# 22. Spaced Repetition

## Memory Level

```text
0 = chưa học
1 = mới biết
2 = đang nhớ
3 = nhớ khá
4 = nhớ tốt
5 = mastered
```

## Lịch cơ bản

```text
Level 0
→ học ngay

Level 1
→ 10 phút

Level 2
→ 1 ngày

Level 3
→ 3 ngày

Level 4
→ 7 ngày

Level 5
→ 14 ngày

Mastered
→ 30 ngày
→ 60 ngày
→ 90 ngày
```

Đây là lịch mặc định; Learning Engine có thể điều chỉnh theo hiệu suất thực tế.

---

# 23. Cập nhật sau câu trả lời

## Đúng

```text
correctCount++
streak++
memoryLevel tăng
interval tăng
```

## Sai

```text
wrongCount++
streak = 0
memoryLevel giảm
interval giảm
nextReviewAt sớm
```

## Có thể thêm response time

```text
< 2 giây  → rất tốt
2–5 giây   → tốt
5–10 giây  → trung bình
> 10 giây  → cần ôn
```

Không dùng response time làm tiêu chí duy nhất.

---

# 24. Mastery Score

```text
masteryScore =
    accuracy * 0.40
  + memoryLevel * 0.25
  + streakScore * 0.15
  + responseScore * 0.10
  + retentionScore * 0.10
```

Ngưỡng:

```text
0–39   yếu
40–59  đang học
60–79  khá
80–94  tốt
95–100 mastered
```

---

# 25. Dashboard

```text
KANJI MASTER

🔥 12 ngày liên tiếp

Hôm nay
----------------
Chữ mới       10
Ôn tập        18
Quiz          10
Mini Game      1

Tiến độ
----------------
███████░░░  824 / 2000

Nhớ tốt       620
Đang học      134
Cần ôn         70
Chưa học     1176
```

---

# 26. Màn hình

## Splash

- Logo
- Kanji Master

## Onboarding

- Chọn trình độ.
- Chọn mục tiêu.
- Chọn số phút/ngày.
- Chọn số Kanji/ngày.

## Home

- Today's lesson.
- Review.
- Quiz.
- Mini Game.
- Progress.

## Kanji Library

- Search Kanji.
- Search Hán Việt.
- Search nghĩa.
- Filter difficulty.
- Filter mastery.

## Kanji Detail

```text
学

HỌC

On:
ガク

Kun:
まなぶ

Nghĩa:
học, học tập
```

## Lesson

- Learn.
- Recall.
- Quiz.
- Game.
- Result.

## Review

- Due cards.
- Weak cards.
- Forgotten cards.

## Quiz

- Question.
- Four options.
- Immediate feedback.
- Score.

## Mini Game

- Game menu.
- Game board.
- Score.
- Combo.
- Result.

## Progress

- Tổng Kanji.
- Mastered.
- Accuracy.
- Streak.
- Study time.
- Weekly chart.
- Monthly chart.

## Import

- Select file.
- Preview.
- Validate.
- Import.
- Result.

## Settings

- Theme.
- Font size.
- Audio.
- Daily target.
- Notification.
- Account.
- Sync.

---

# 27. Offline-first

Khi không có Internet:

```text
App
 |
 +-- Isar
 |    |
 |    +-- Kanji
 |    +-- Lesson
 |    +-- Quiz
 |    +-- Game
 |    +-- Progress
 |    +-- Review
 |
 +-- Learning Engine
```

Tất cả hoạt động.

Khi có Internet:

```text
Isar
 ↓
SyncQueue
 ↓
Vercel API
 ↓
Neon
```

---

# 28. Sync Strategy

Không upload toàn bộ database mỗi lần.

Dùng:

```text
createdAt
updatedAt
deletedAt
version
deviceId
```

## Push

```text
POST /api/sync/push
```

## Pull

```text
GET /api/sync/pull?cursor=...
```

## Full Sync

```text
POST /api/sync/full
```

Chỉ dùng khi:

- đăng nhập thiết bị mới
- mất dữ liệu local
- migration
- user yêu cầu reset sync

---

# 29. Vercel API

```text
/api
├── auth
│   ├── register
│   ├── login
│   └── refresh
│
├── kanji
│   ├── list
│   ├── detail
│   └── search
│
├── lessons
│   └── generated
│
├── progress
│   ├── get
│   └── update
│
├── quiz
│   └── result
│
├── games
│   └── result
│
├── sync
│   ├── push
│   ├── pull
│   └── full
│
└── import
    └── dataset
```

---

# 30. Neon PostgreSQL

## users

```sql
id
email
password_hash
display_name
created_at
updated_at
```

## kanji

```sql
id
character
han_viet
meaning
onyomi
kunyomi
source_version
created_at
updated_at
```

## kanji_corrections

```sql
id
kanji_id
field_name
old_value
new_value
reason
created_at
```

## user_kanji_progress

```sql
id
user_id
kanji_id
memory_level
ease_factor
interval_days
repetition
correct_count
wrong_count
accuracy
next_review_at
last_reviewed_at
updated_at
```

## lessons

```sql
id
user_id
title
difficulty
target_count
created_at
```

## quiz_results

```sql
id
user_id
quiz_id
score
total
duration_ms
created_at
```

## game_results

```sql
id
user_id
game_type
score
duration_ms
created_at
```

---

# 31. API Security

Không cho Flutter kết nối trực tiếp Neon.

```text
Flutter
  ↓ HTTPS
Vercel API
  ↓
Neon
```

Các nguyên tắc:

- HTTPS.
- Authentication.
- Authorization.
- Validate request.
- Rate limit.
- Không expose database credentials.
- Không đưa `DATABASE_URL` vào Flutter.
- Không đưa Vercel secret vào app.

---

# 32. Conflict Resolution

Nếu cùng một user học trên hai thiết bị:

Ưu tiên:

```text
latest valid progress event
```

Nhưng với counters như:

```text
correctCount
wrongCount
studyTime
```

nên dùng event/merge thay vì ghi đè đơn giản.

Ví dụ:

```text
Device A:
correct +1

Device B:
correct +1

Server:
correct +2
```

---

# 33. Event-based Learning

Nên lưu:

```text
ReviewEvent
```

Ví dụ:

```json
{
  "userId": "U001",
  "kanjiId": 123,
  "correct": true,
  "responseMs": 2100,
  "oldLevel": 2,
  "newLevel": 3,
  "timestamp": "..."
}
```

Server có thể dùng event để tái tạo tiến độ khi cần.

---

# 34. AI Integration – giai đoạn sau

Không cần AI cho chức năng cơ bản.

Version 1:

```text
Rule Engine
```

Version 2:

```text
AI Lesson Generator
AI Mnemonic Generator
AI Explanation
AI Example Generator
```

AI chỉ được bổ sung dữ liệu có kiểm soát.

Không được tự động ghi đè dữ liệu nguồn.

---

# 35. Tự tạo giáo trình

Ví dụ:

```text
Mục tiêu:
30 phút/ngày
10 Kanji mới/ngày
```

Engine:

```text
Due Review
     ↓
Weak Kanji
     ↓
New Kanji
     ↓
Related Kanji
     ↓
Generate Lesson
```

Kết quả:

```text
Bài 01
10 Kanji mới

Ôn:
5 Kanji

Quiz:
10 câu

Mini Game:
Match

Test:
5 câu
```

---

# 36. Adaptive Difficulty

Nếu:

```text
accuracy >= 90%
response < 3 sec
```

→ tăng độ khó.

Nếu:

```text
accuracy < 60%
```

→ giảm độ khó.

Có thể thay:

```text
Hán Việt → Kanji
```

bằng:

```text
Nghĩa → Kanji
```

hoặc:

```text
Reading → Kanji
```

---

# 37. Daily Mission

Mỗi ngày:

```text
□ Học 10 Kanji
□ Ôn 20 Kanji
□ Quiz 10 câu
□ Mini Game 1 lần
□ Đạt 80%+
```

Hoàn thành:

```text
XP +100
```

---

# 38. Gamification

## XP

```text
Learn       +5
Correct     +2
Perfect     +10
Review      +3
Game        +10
Boss Pass   +50
```

## Level

```text
Level 1
Level 2
...
Level 100
```

## Badge

```text
7-Day Streak
30-Day Streak
100 Kanji
500 Kanji
1000 Kanji
2000 Kanji
Perfect Quiz
Boss Slayer
```

---

# 39. Thống kê

Theo ngày:

```text
newKanji
reviewed
correct
wrong
accuracy
studyTime
```

Theo Kanji:

```text
accuracy
wrongCount
responseTime
memoryLevel
lastReview
nextReview
```

Biểu đồ:

- 7 ngày.
- 30 ngày.
- 90 ngày.
- Toàn bộ.

---

# 40. Notification

Local notification:

```text
Đến giờ ôn Kanji
Bạn có 18 chữ cần ôn hôm nay.
```

Không cần server push cho bản offline.

---

# 41. TTS / Audio

Có thể đọc:

- On-yomi.
- Kun-yomi.
- Từ ghép.

Audio không được làm dependency bắt buộc cho việc học.

Nếu TTS không khả dụng:

```text
Text vẫn hoạt động bình thường.
```

---

# 42. Performance

Mục tiêu:

- App mở nhanh.
- Search Kanji tức thì.
- Quiz không query database liên tục.
- Lesson được preload.
- Mini Game giữ dữ liệu trong memory.
- Isar transaction khi import lớn.
- Không rebuild toàn bộ màn hình khi một câu quiz thay đổi.

Riverpod:

```text
Provider
StateNotifier/Notifier
AsyncNotifier
```

tùy module.

---

# 43. Testing

## Unit Test

- Parser.
- Normalizer.
- Lesson Generator.
- Quiz Generator.
- Spaced Repetition.
- Mastery Score.
- Sync merge.

## Widget Test

- Home.
- Flashcard.
- Quiz.
- Lesson.
- Import Preview.

## Integration Test

```text
Import DOC
→ Isar
→ Generate Lesson
→ Quiz
→ Review
→ Sync
→ Neon
```

---

# 44. Parser Test Cases

Phải test các trường hợp:

```text
学 || gaku - manabu || HỌC học
```

```text
空 || kuu - kara - sora || KHÔNG không khí, trống rỗng
```

```text
行 || gyou - kou - iku || HÀNH/HÀNG đi, thực hiện
```

```text
重 || juu - chou - omoi || TRỌNG/TRÙNG nặng, quan trọng
```

```text
record thiếu nghĩa
record thiếu reading
record có nhiều reading
record có nhiều Hán Việt
record bị nối dòng
```

---

# 45. Migration

Database version:

```text
schemaVersion = 1
```

Khi thay đổi model:

```text
v1 → v2
v2 → v3
```

Không xóa dữ liệu người dùng.

---

# 46. Backup

Local:

```text
Export Progress
```

Server:

```text
Neon backup
```

User có thể:

```text
Export:
- Progress
- Review history
- Settings
```

---

# 47. Privacy

Không thu thập dữ liệu không cần thiết.

Dữ liệu học:

- Kanji đã học.
- Điểm.
- Lịch ôn.
- Thời gian học.

Có thể đồng bộ theo user account.

---

# 48. MVP

## Phase 1

- Import Kanji.doc.
- Isar.
- Kanji Library.
- Kanji Detail.
- Flashcard.
- Quiz cơ bản.
- Progress.
- Offline.

## Phase 2

- Spaced Repetition.
- Adaptive Lesson.
- Mini Games.
- Daily Mission.
- XP.
- Streak.

## Phase 3

- Vercel API.
- Neon.
- Login.
- Sync đa thiết bị.

## Phase 4

- AI.
- TTS.
- Mnemonic.
- Advanced analytics.

---

# 49. Definition of Done

MVP được coi là hoàn thành khi:

- [ ] Import được dữ liệu từ `Kanji.doc`.
- [ ] Có preview trước khi import.
- [ ] Không mất dữ liệu nguồn.
- [ ] Lưu Kanji vào Isar.
- [ ] Search Kanji.
- [ ] Xem Hán Việt.
- [ ] Xem cách đọc.
- [ ] Xem nghĩa.
- [ ] Học Flashcard.
- [ ] Làm Quiz.
- [ ] Tính điểm.
- [ ] Theo dõi tiến độ.
- [ ] Có Spaced Repetition.
- [ ] Tự sinh bài học.
- [ ] Có ít nhất 3 Mini Game.
- [ ] Hoạt động offline.
- [ ] Có Sync Queue.
- [ ] Có Vercel API.
- [ ] Có Neon PostgreSQL.
- [ ] Có xử lý conflict.
- [ ] Có test parser.
- [ ] Có test learning engine.
- [ ] Có backup/export tiến độ.

---

# 50. Quy tắc quan trọng khi triển khai bằng AI/Copilot

AI coding agent phải tuân thủ:

1. Không tự thay đổi kiến trúc.
2. Không tự đổi Isar sang database khác.
3. Không kết nối Flutter trực tiếp Neon.
4. Không hard-code 2.000 Kanji vào Dart.
5. Không xóa dữ liệu import.
6. Không tự sửa Hán Việt nguồn.
7. Không tự tạo từ ghép và coi đó là dữ liệu gốc.
8. Không yêu cầu Internet để học.
9. Mọi thay đổi database phải có migration.
10. Mọi API phải validate input.
11. Mọi thao tác sync phải idempotent.
12. Mọi quiz phải có đúng một đáp án.
13. Mini Game không được làm thay đổi progress nếu chưa ghi nhận kết quả hợp lệ.
14. Learning Engine phải có unit test.
15. Import phải chạy trong transaction khi ghi dữ liệu.

---

# 51. Product Vision

Kanji Master không chỉ là app Flashcard.

Mục tiêu cuối cùng:

```text
                 2000 HÁN VIỆT
                       ↓
                  2000 KANJI
                       ↓
              KNOWLEDGE GRAPH
                       ↓
              LEARNING ENGINE
                       ↓
       ┌───────────────┼───────────────┐
       ↓               ↓               ↓
    LESSON           QUIZ           MINI GAME
       │               │               │
       └───────────────┼───────────────┘
                       ↓
                 SPACED REPETITION
                       ↓
                 ADAPTIVE LEARNING
                       ↓
                MASTER 2000 KANJI
```

App phải làm cho người dùng **nhìn Hán Việt có thể nhớ Kanji Nhật**, rồi chuyển dần sang khả năng nhận diện Kanji và cách đọc Nhật mà không cần phụ thuộc vào việc dịch sang tiếng Việt ở mọi bước.

---

# 52. Lưu ý về dữ liệu nguồn

`Kanji.doc` là nguồn dữ liệu do người dùng cung cấp. Parser phải giữ nguyên các trường hợp nhiều âm, nhiều Hán Việt và nghĩa như dữ liệu nguồn.

Ví dụ file có:

- `星 || shou - sei - hoshi || TINH ngôi sao`
- `政 || shou - sei - matsurigoto || CHÍNH chính trị, luật`
- `常 || jou - tsune - toko || THƯỜNG bình thường, thông thường`
- `調 || shiraberu - chou - totonou || ĐIỀU điều tra, thu xếp`
- `続 || zoku - tsuzuku - tsuzukeru || TỤC tiếp tục`

Các bản ghi này phải được parser biểu diễn thành nhiều trường đọc thay vì cắt bỏ dữ liệu.

---

# 53. Kết luận

Kiến trúc đề xuất là:

**Flutter + Isar + Riverpod + Offline-first + Vercel API + Neon PostgreSQL**

với `Kanji.doc` làm nguồn dữ liệu ban đầu.

Trọng tâm sản phẩm:

**Hán Việt → Kanji → Nhật → Recall → Quiz → Game → Spaced Repetition → Mastery**

Không xây app theo kiểu chỉ hiển thị 2.000 chữ. Xây một **Learning Engine** để app tự quyết định người dùng cần học gì, ôn gì và kiểm tra gì tiếp theo.
