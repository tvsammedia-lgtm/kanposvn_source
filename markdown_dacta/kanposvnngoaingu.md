# ĐẶC TẢ APP QUẢN LÝ TRUNG TÂM DẠY NGOẠI NGỮ ONLINE

**Stack:** Flutter + Isar + Vercel API + Neon PostgreSQL\
**Kiến trúc:** Offline-first / Local-first / Incremental Sync\
**Ngôn ngữ học tập:** English, Japanese, Tiếng Việt\
**AI:** Trợ lý ngoại ngữ, hội thoại, phát âm, ngữ pháp, từ vựng, cá nhân
hóa

## 1. Mục tiêu

Xây dựng nền tảng quản lý và đào tạo ngoại ngữ trực tuyến cho trung tâm,
hỗ trợ:

-   Quản lý trung tâm, chi nhánh và tài khoản.
-   Quản lý học viên, giáo viên, lớp học và phòng học.
-   Lớp 1:1 và 1:N.
-   Lịch học, điểm danh, học bù.
-   Khóa học, giáo trình, cấp độ.
-   Placement test từ cơ bản đến nâng cao.
-   Bài tập, kiểm tra, chấm điểm.
-   Theo dõi tiến bộ.
-   AI Tutor đa ngôn ngữ.
-   AI luyện nói và sửa phát âm.
-   AI sửa ngữ pháp, từ vựng và hội thoại.
-   AI tạo bài học cá nhân hóa.
-   Cấp và xác minh chứng nhận bằng QR.
-   Học phí, hóa đơn, voucher, khuyến mãi.
-   Báo cáo đào tạo và doanh thu.
-   Đồng bộ Isar ↔ Neon qua Vercel API.
-   Sử dụng offline khi mất Internet.

## 2. Kiến trúc

``` text
Flutter App
    ↓
Isar Local DB
    ↓
Sync Queue
    ↓ HTTPS
Vercel API
    ↓
Neon PostgreSQL
```

Flutter **không kết nối trực tiếp** Neon. Mọi truy cập cloud phải đi qua
Vercel API.

## 3. Vai trò

``` text
SUPER_ADMIN
CENTER_ADMIN
MANAGER
TEACHER
STAFF
STUDENT
```

Permission mẫu:

``` text
student.view / create / update / delete
teacher.view / manage
class.view / manage
course.manage
test.manage
certificate.issue
payment.manage
report.view
ai.use
```

## 4. Trung tâm và chi nhánh

### Center

-   center_id
-   center_code
-   center_name
-   logo
-   phone
-   email
-   address
-   timezone
-   status

### Branch

-   branch_id
-   center_id
-   branch_code
-   branch_name
-   address
-   phone
-   manager_id
-   status

Mọi dữ liệu nghiệp vụ cloud phải có `center_id`; dữ liệu chi nhánh có
thêm `branch_id`.

## 5. Học viên

Thông tin:

-   student_id / UUID
-   student_code
-   full_name
-   date_of_birth
-   phone
-   email
-   avatar
-   address
-   enrollment_date
-   status

Hồ sơ học tập:

-   Ngôn ngữ đang học.
-   Cấp độ hiện tại.
-   Điểm đầu vào.
-   Điểm hiện tại.
-   Mục tiêu.
-   Kỹ năng mạnh/yếu.
-   Số giờ học.
-   Số buổi đã học.
-   Điểm trung bình.
-   Lịch sử tiến bộ.

## 6. Giáo viên

-   teacher_id
-   teacher_code
-   full_name
-   avatar
-   phone
-   email
-   chuyên môn
-   ngôn ngữ giảng dạy
-   trình độ
-   chứng chỉ
-   kinh nghiệm
-   mức phí
-   status

Một giáo viên có thể dạy nhiều ngôn ngữ/chương trình.

## 7. Phòng học

Loại phòng:

``` text
ONE_TO_ONE
ONE_TO_MANY
ONLINE_ROOM
PHYSICAL_ROOM
AI_ROOM
```

Thông tin:

-   room_id
-   branch_id
-   room_code
-   room_name
-   capacity
-   room_type
-   meeting_url
-   status

Hệ thống phải kiểm tra trùng phòng và trùng giáo viên khi xếp lịch.

## 8. Lớp học

### Lớp 1:1

``` text
Teacher ↔ Student ↔ Room
```

### Lớp 1:N

``` text
Teacher
 ├── Student A
 ├── Student B
 ├── Student C
 └── Student D
```

Thông tin:

-   class_id
-   class_code
-   class_name
-   course_id
-   language
-   level
-   teacher_id
-   room_id
-   max_students
-   start_date
-   end_date
-   tuition
-   status

Bảng liên kết:

``` text
class_students
class_schedules
```

## 9. Khóa học và cấp độ

### English

``` text
A1 → A2 → B1 → B2 → C1 → C2
```

Có thể thêm:

``` text
IELTS
TOEIC
TOEFL
Business English
Communication
```

### Japanese

``` text
N5 → N4 → N3 → N2 → N1
```

### Vietnamese

``` text
Beginner
Elementary
Intermediate
Upper-Intermediate
Advanced
```

## 10. Placement Test

Test đầu vào gồm:

``` text
Vocabulary
Grammar
Reading
Listening
Speaking
Writing
```

Độ khó:

``` text
Basic
Elementary
Intermediate
Upper-Intermediate
Advanced
```

Ví dụ kết quả:

``` text
Vocabulary: 72
Grammar:    68
Reading:    81
Listening:  64
Speaking:   55
Writing:    70
Overall:    68.3
Level:      B1
```

### Tiếng Nhật

-   Hiragana
-   Katakana
-   Kanji
-   Vocabulary
-   Grammar
-   Reading
-   Listening
-   Speaking

### Tiếng Việt

Dành cho người nước ngoài:

-   Phát âm
-   Từ vựng
-   Ngữ pháp
-   Nghe
-   Nói
-   Đọc
-   Viết
-   Hội thoại

## 11. Ngân hàng câu hỏi

Entity:

``` text
question_id
language
level
skill
topic
question_type
question
options
correct_answer
explanation
audio_url
image_url
difficulty
points
```

Loại câu hỏi:

``` text
MULTIPLE_CHOICE
SINGLE_CHOICE
TRUE_FALSE
FILL_BLANK
MATCHING
LISTENING
SPEAKING
WRITING
READING
```

## 12. Hệ thống điểm

Có thể cấu hình trọng số theo khóa:

``` text
Vocabulary 20%
Grammar    20%
Reading    15%
Listening  15%
Speaking   15%
Writing    15%
```

Xếp loại mặc định:

``` text
90-100 Excellent
80-89  Very Good
70-79  Good
60-69  Pass
<60    Need Improvement
```

## 13. Buổi học và điểm danh

`lesson`:

-   lesson_id
-   class_id
-   teacher_id
-   room_id
-   start_time
-   end_time
-   lesson_topic
-   homework
-   teacher_note

Điểm danh:

``` text
PRESENT
ABSENT
LATE
EXCUSED
MAKEUP
```

Hỗ trợ lịch ngày/tuần/tháng và kiểm tra xung đột lịch.

## 14. Học online

Có thể tích hợp:

-   Video meeting.
-   Audio.
-   Chat.
-   Share screen.
-   Whiteboard.
-   File.
-   Camera/microphone.
-   Recording nếu chính sách cho phép.

Mỗi buổi có:

``` text
meeting_url
meeting_provider
meeting_id
```

## 15. Bài tập

Giáo viên:

-   Tạo bài.
-   Giao bài.
-   Đặt hạn.
-   Chấm.
-   Nhận xét.

Học viên:

-   Làm bài.
-   Nộp bài.
-   Xem điểm.
-   Xem đáp án/giải thích.

## 16. AI Language Tutor

Hỗ trợ:

``` text
English
Japanese
Vietnamese
```

### AI Conversation

Topic:

``` text
Daily Life
Travel
Restaurant
Hotel
Shopping
Business
Interview
School
```

AI có thể đóng vai:

``` text
Teacher
Customer
Waiter
Receptionist
Interviewer
Friend
Business Partner
```

### AI Speaking

Luồng:

``` text
Student speaks
 → Speech-to-Text
 → AI analysis
 → Score
 → Feedback
```

Đánh giá:

-   Pronunciation
-   Grammar
-   Vocabulary
-   Fluency
-   Accuracy
-   Naturalness

### AI sửa câu

Ví dụ:

``` text
I go to school yesterday.
→ I went to school yesterday.
```

AI giải thích lỗi và đưa ví dụ tương tự.

### AI từ vựng

Cho mỗi từ:

-   Meaning
-   Pronunciation
-   Level
-   Examples
-   Related words
-   Translation

### AI cá nhân hóa

Dựa trên:

``` text
Student Level
Weak Skills
Test Results
Homework Results
Attendance
Learning History
Goals
```

Tạo:

``` text
Daily lesson
Vocabulary
Grammar
Listening
Speaking
Writing
Review
```

### AI lộ trình

Ví dụ:

``` text
A2 → B2 trong 8 tháng

Month 1-2: A2 → B1
Month 3-5: củng cố B1
Month 6-7: B1 → B2
Month 8: mock test + final review
```

## 17. AI đa ngôn ngữ

Hỗ trợ:

``` text
English ↔ Vietnamese
Japanese ↔ Vietnamese
English ↔ Japanese
```

Chế độ giải thích:

``` text
Explain simply
Explain academically
Give examples
Give pronunciation
Give grammar
```

## 18. Tiến bộ học tập

Theo dõi:

``` text
Vocabulary
Grammar
Listening
Speaking
Reading
Writing
```

Có biểu đồ theo tuần/tháng.

AI có thể phát hiện:

-   Kỹ năng mạnh.
-   Kỹ năng yếu.
-   Tốc độ tiến bộ.
-   Nguy cơ bỏ học.
-   Bài học nên ôn.
-   Test nên làm tiếp.

## 19. Chứng nhận

Quy trình:

``` text
Complete Course
 ↓
Final Test
 ↓
Pass
 ↓
Generate Certificate
 ↓
QR Verification
```

Thông tin:

-   certificate_id
-   certificate_code
-   student_id
-   course_id
-   level
-   score
-   issue_date
-   expiry_date
-   verification_url
-   QR code
-   certificate_file

Ví dụ:

``` text
CERT-ENG-B1-2026-000123
```

Trang xác minh hiển thị:

``` text
Valid
Student
Course
Level
Score
Issue Date
```

## 20. Học phí và thương mại

Hỗ trợ:

-   Học phí khóa học.
-   Học phí 1:1.
-   Lớp nhóm.
-   Gói theo tháng.
-   Gói theo buổi.
-   Gói theo giờ.
-   Hóa đơn.
-   Thanh toán.
-   Công nợ.
-   Voucher.
-   Khuyến mãi.
-   Gói học thử.

Ví dụ:

``` text
Purchased: 30 buổi
Used: 12
Remaining: 18
```

## 21. Báo cáo

### Doanh thu

``` text
Hôm nay
Tháng
Năm
Theo chi nhánh
Theo khóa học
Theo giáo viên
Theo phương thức thanh toán
```

### Đào tạo

``` text
Tổng học viên
Học viên mới
Đang học
Hoàn thành
Bỏ học
Điểm trung bình
Tỷ lệ hoàn thành
Tỷ lệ đạt
Tỷ lệ tiến bộ
```

### Dashboard học viên

``` text
Current Level
Progress
Today's Lesson
Homework
Test Score
Vocabulary
Speaking Score
Certificates
AI Practice
```

## 22. Isar Local Database

Collections chính:

``` text
User
Center
Branch
Student
Teacher
TeacherLanguage
Room
Course
CourseLevel
Class
ClassStudent
ClassSchedule
Lesson
Attendance
Question
QuestionBank
Test
TestQuestion
TestAttempt
TestAnswer
Assignment
AssignmentSubmission
Score
LearningProgress
Certificate
Invoice
Payment
Voucher
Notification
AIConversation
AIMessage
Device
SyncQueue
SyncState
AuditLog
```

Mỗi entity nên có:

``` dart
String uuid;
String? centerId;
String? branchId;
DateTime createdAt;
DateTime updatedAt;
bool isDeleted;
int syncVersion;
```

`uuid` là khóa đồng bộ, tránh xung đột giữa nhiều thiết bị.

## 23. Offline-first

Khi offline:

``` text
Internet OFF
 ↓
Flutter đọc Isar
 ↓
Người dùng thao tác
 ↓
Isar lưu ngay
 ↓
SyncQueue ghi thay đổi
```

Khi có mạng:

``` text
SyncQueue
 ↓
Vercel API
 ↓
Neon
```

Không được khóa thao tác nghiệp vụ chỉ vì mất Internet, ngoại trừ những
chức năng bắt buộc server thời gian thực.

## 24. Sync Queue

Schema:

``` text
sync_id
device_id
user_id
entity
entity_id
operation
payload
created_at
updated_at
retry_count
status
```

Operation:

``` text
CREATE
UPDATE
DELETE
```

Status:

``` text
PENDING
SYNCING
SYNCED
FAILED
```

## 25. Incremental Sync

Không upload toàn bộ database mỗi lần.

Chỉ đồng bộ record thay đổi:

``` text
Local updated_at > last_sync_at
```

Push:

``` text
Flutter
 ↓
POST /api/sync/push
 ↓
Vercel
 ↓
Neon
```

Pull:

``` text
Flutter
 ↓
POST /api/sync/pull
 ↓
Vercel
 ↓
Neon
 ↓
Changes
 ↓
Isar
```

## 26. API mẫu

``` http
POST /api/auth/login
POST /api/auth/register
POST /api/auth/refresh

GET  /api/students
POST /api/students
PUT  /api/students/:id
DELETE /api/students/:id

GET /api/teachers
GET /api/classes
GET /api/rooms
GET /api/courses

POST /api/tests/start
POST /api/tests/submit

POST /api/ai/chat
POST /api/ai/speaking
POST /api/ai/explain

POST /api/sync/push
POST /api/sync/pull

GET /api/certificates/:code
```

Push mẫu:

``` json
{
  "device_id": "DEVICE-001",
  "changes": [
    {
      "entity": "student",
      "operation": "CREATE",
      "id": "uuid",
      "version": 1,
      "data": {}
    }
  ]
}
```

Response:

``` json
{
  "success": true,
  "synced": 10,
  "failed": 0,
  "conflicts": 0
}
```

Pull mẫu:

``` json
{
  "device_id": "DEVICE-001",
  "last_sync_at": "2026-08-07T09:00:00Z"
}
```

## 27. Conflict resolution

Mỗi record có:

``` text
uuid
updated_at
version
device_id
```

Quy tắc:

``` text
Local mới hơn → Push
Cloud mới hơn → Pull
Cả hai thay đổi → Conflict Resolver
```

Dữ liệu quản trị quan trọng có thể ưu tiên server version.

## 28. Soft Delete

Không xóa ngay khỏi Neon:

``` text
deleted_at
```

Sau khi các thiết bị đã nhận trạng thái xóa, có thể chạy cleanup định
kỳ.

## 29. Authentication và bảo mật

Sử dụng:

``` text
Password Hash
JWT Access Token
Refresh Token
RBAC
HTTPS
Rate Limit
Input Validation
Audit Log
```

Không lưu trong APK:

``` text
DATABASE_URL
JWT_SECRET
AI_API_KEY
```

AI và Neon chỉ được truy cập thông qua Vercel server.

## 30. Multi-tenant

Mọi query phải lọc theo tenant:

``` text
JWT center_id
        =
record center_id
```

Không cho phép Center A truy cập dữ liệu Center B.

## 31. Audit Log

Theo dõi:

``` text
user_id
action
entity
entity_id
old_value
new_value
device
ip
created_at
```

Ví dụ:

``` text
Manager
UPDATE
Student STU-001
Level A2 → B1
```

## 32. Thông báo

Các loại:

-   Lịch học sắp tới.
-   Thay đổi giáo viên.
-   Bài tập mới.
-   Bài test.
-   Kết quả test.
-   Nhắc học phí.
-   Chứng nhận.
-   Khuyến mãi.
-   Nhắc học AI.

## 33. Cấu trúc Flutter

``` text
lib/
├── core/
│   ├── api/
│   ├── auth/
│   ├── constants/
│   ├── error/
│   ├── network/
│   ├── sync/
│   └── utils/
├── database/
│   ├── isar/
│   ├── collections/
│   └── repositories/
├── features/
│   ├── auth/
│   ├── dashboard/
│   ├── students/
│   ├── teachers/
│   ├── rooms/
│   ├── courses/
│   ├── classes/
│   ├── lessons/
│   ├── attendance/
│   ├── tests/
│   ├── assignments/
│   ├── ai/
│   ├── certificates/
│   ├── payments/
│   ├── reports/
│   └── settings/
└── main.dart
```

Khuyến nghị dùng Riverpod:

``` text
UI
 ↓
Provider
 ↓
Repository
 ↓
Isar / API
```

UI không truy cập Isar trực tiếp.

## 34. Auto Sync

Có thể sync:

``` text
Khi mở app
Sau login
Khi Internet trở lại
Theo chu kỳ 1-5 phút
Sau thao tác quan trọng
```

Sync Dashboard:

``` text
Last Sync
Uploaded
Downloaded
Pending
Failed
Status
```

Ví dụ:

``` text
Last Sync: 16:05
Uploaded: 125
Downloaded: 83
Pending: 4
Failed: 0
Status: UP TO DATE
```

## 35. Admin Web

Menu:

``` text
Dashboard
Centers
Branches
Users
Teachers
Students
Rooms
Courses
Classes
Schedules
Tests
Question Bank
Certificates
Payments
Vouchers
Reports
AI
Sync
Settings
```

Dashboard tổng:

``` text
Total Students
Active Students
Teachers
Classes
Today's Lessons
Revenue
Outstanding Tuition
Certificates
AI Sessions
```

## 36. Menu học viên

``` text
Trang chủ
Khóa học
Lịch học
Phòng học
Bài tập
Bài test
Kết quả
AI Tutor
Luyện nói
Từ vựng
Tiến độ
Chứng nhận
Thanh toán
Thông báo
Tài khoản
```

## 37. Menu giáo viên

``` text
Dashboard
Lớp học
Lịch dạy
Học viên
Điểm danh
Bài tập
Chấm bài
Kiểm tra
Nhận xét
Tiến bộ
AI hỗ trợ giảng dạy
```

## 38. Quy trình đăng ký

``` text
Đăng ký
 ↓
Tạo Student
 ↓
Chọn Language
 ↓
Chọn mục tiêu
 ↓
Placement Test
 ↓
AI đánh giá
 ↓
Xác định Level
 ↓
Đề xuất Course
 ↓
Đăng ký
 ↓
Thanh toán
 ↓
Xếp lớp
 ↓
Đặt lịch
 ↓
Học
```

## 39. Quy trình hoàn thành khóa

``` text
Learning
 ↓
Attendance
 ↓
Assignments
 ↓
Progress Tests
 ↓
Final Test
 ↓
Pass?
 ├─ NO → Remedial Learning
 └─ YES → Certificate → QR Verification
```

## 40. Gamification

Có thể mở rộng:

``` text
XP
Points
Streak
Badges
Leaderboard
Achievements
```

## 41. SaaS

Có thể triển khai nhiều trung tâm:

``` text
FREE
BASIC
PRO
PREMIUM
ENTERPRISE
```

Giới hạn theo:

``` text
Students
Teachers
Branches
Classes
AI Usage
Storage
Certificates
Reports
```

## 42. Lộ trình phát triển

### MVP

``` text
Authentication
Student
Teacher
Course
Class
Room
Schedule
Attendance
Placement Test
Score
Isar
Vercel API
Neon Sync
```

### Giai đoạn 2

``` text
Online Classroom
Assignments
Advanced Test
Certificate
Payment
Voucher
Reports
Notifications
```

### Giai đoạn 3 - AI

``` text
AI Tutor
AI Conversation
AI Speaking
AI Pronunciation
AI Grammar
AI Vocabulary
AI Personal Learning
AI Learning Roadmap
```

### Giai đoạn 4 - SaaS

``` text
Multi-center
Multi-branch
Subscription
Billing
Usage Limit
Admin Web
System Analytics
```

## 43. Nguyên tắc bắt buộc

1.  Local-first.
2.  Offline-first.
3.  API-first.
4.  Flutter không kết nối trực tiếp Neon.
5.  Cloud data đi qua Vercel API.
6.  UUID cho dữ liệu đồng bộ.
7.  Incremental Sync.
8.  Soft Delete.
9.  Audit Log.
10. Multi-tenant.
11. RBAC.
12. Secret chỉ nằm server.
13. AI đi qua server API.
14. Repository quản lý data access.
15. Sync chạy nền.
16. Không mất dữ liệu khi offline.
17. Có conflict resolution.
18. Có backup/restore.
19. Có logging/monitoring.

## 44. Kết quả cuối cùng

Nền tảng bao gồm:

``` text
QUẢN LÝ TRUNG TÂM
+
QUẢN LÝ GIÁO VIÊN
+
QUẢN LÝ HỌC VIÊN
+
QUẢN LÝ LỚP 1:1 / 1:N
+
QUẢN LÝ PHÒNG
+
HỌC ONLINE
+
PLACEMENT TEST
+
AI LANGUAGE TUTOR
+
CHẤM ĐIỂM
+
THEO DÕI TIẾN BỘ
+
CHỨNG NHẬN QR
+
HỌC PHÍ / VOUCHER
+
BÁO CÁO
+
OFFLINE-FIRST
+
NEON CLOUD SYNC
```

Mục tiêu là có thể bắt đầu từ một trung tâm nhỏ, mở rộng lên nhiều chi
nhánh và cuối cùng triển khai thành SaaS cho nhiều trung tâm ngoại ngữ.
