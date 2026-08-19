# Markdown Specification — App gọi video/chat Flutter + Isar + Neon PostgreSQL + Vercel API

## 1. Tổng quan

Xây dựng ứng dụng **gọi video, gọi thoại và nhắn tin thời gian thực** tương tự Zalo/WhatsApp, sử dụng:

* **Flutter**: Android, iOS, Windows/Linux/macOS nếu cần.
* **Isar**: database local/offline trên thiết bị.
* **Neon PostgreSQL**: database cloud trung tâm.
* **Vercel API**: backend REST API, xác thực, đồng bộ dữ liệu và quản lý tài khoản.
* **WebSocket**: trạng thái online, typing, message realtime, cuộc gọi.
* **WebRTC**: truyền video/audio trực tiếp giữa các thiết bị.
* **FCM/APNs**: thông báo cuộc gọi và tin nhắn khi app chạy nền.
* **Riverpod**: quản lý state.
* **HTTPS/TLS**: bảo mật API.

> Lưu ý quan trọng: **Neon + Vercel không nên trực tiếp truyền luồng video/audio**. Video/audio nên dùng WebRTC. Vercel API và WebSocket/signaling server chỉ dùng để thiết lập cuộc gọi, xác thực và trao đổi SDP/ICE.

---

# 2. Kiến trúc hệ thống

```text
                    ┌─────────────────────────┐
                    │       Flutter App       │
                    │ Android / iOS / Desktop │
                    └────────────┬────────────┘
                                 │
              ┌──────────────────┼──────────────────┐
              │                  │                  │
              ▼                  ▼                  ▼
        ┌──────────┐       ┌────────────┐     ┌──────────────┐
        │   Isar   │       │ Vercel API │     │ WebSocket /  │
        │  Local   │       │ REST API   │     │ Signaling    │
        └──────────┘       └─────┬──────┘     └──────┬───────┘
                                  │                   │
                                  ▼                   ▼
                           ┌─────────────┐      ┌─────────────┐
                           │    Neon     │      │   WebRTC    │
                           │ PostgreSQL  │      │ Audio/Video │
                           └─────────────┘      └──────┬──────┘
                                                       │
                                                ┌──────▼──────┐
                                                │ STUN / TURN │
                                                └─────────────┘
```

---

# 3. Các chức năng chính

## 3.1. Đăng ký tài khoản

Hỗ trợ:

* Số điện thoại.
* Email.
* Username.
* Password.
* Avatar.
* Tên hiển thị.
* Mã quốc gia.
* OTP.
* Đăng nhập Google/Apple nếu cần.

Thông tin tài khoản:

```text
user_id
username
display_name
phone
email
avatar_url
status
last_seen
created_at
updated_at
```

---

# 4. Đăng nhập

Luồng:

```text
Flutter
   │
   ├── POST /auth/login
   │
   ▼
Vercel API
   │
   ▼
Neon PostgreSQL
   │
   ▼
JWT Access Token
JWT Refresh Token
   │
   ▼
Flutter
   │
   └── lưu session local
```

Token không nên lưu trực tiếp trong database Isar dưới dạng plaintext nếu có thể tránh được.

---

# 5. Hồ sơ người dùng

Màn hình:

* Avatar.
* Tên.
* Username.
* Số điện thoại.
* Email.
* Bio.
* Trạng thái online.
* Last seen.
* Ảnh đại diện.
* Privacy settings.

---

# 6. Danh bạ

Cho phép:

* Tìm người dùng.
* Tìm bằng username.
* Tìm bằng số điện thoại.
* Thêm bạn.
* Chấp nhận lời mời.
* Từ chối.
* Xóa bạn.
* Chặn.
* Bỏ chặn.

Database:

```text
contacts
friend_requests
blocked_users
```

---

# 7. Chat 1-1

Hỗ trợ:

* Text.
* Emoji.
* Sticker.
* Ảnh.
* Video.
* File.
* Voice message.
* Location.
* Reply message.
* Forward message.
* Delete message.
* Edit message.
* Pin message.
* React message.
* Read receipt.
* Typing indicator.

---

# 8. Chat nhóm

Cho phép:

* Tạo nhóm.
* Đổi tên nhóm.
* Đổi avatar nhóm.
* Thêm thành viên.
* Xóa thành viên.
* Admin.
* Co-admin.
* Rời nhóm.
* Giải tán nhóm.
* Mute.
* Pin message.

Quyền:

```text
owner
admin
member
```

---

# 9. Gọi thoại

Hỗ trợ:

```text
User A
   │
   │ Call
   ▼
Signaling Server
   │
   ▼
User B
```

Sau khi thiết lập WebRTC:

```text
User A <──────── WebRTC ────────> User B
              Audio
```

Không truyền audio qua Neon PostgreSQL.

---

# 10. Gọi video

Sử dụng:

```text
Flutter
   │
   └── flutter_webrtc
```

Luồng:

```text
A
│
├── createOffer()
│
▼
Signaling Server
│
▼
B
│
├── createAnswer()
│
▼
Signaling Server
│
▼
A
│
└── ICE candidates
```

Sau khi kết nối:

```text
Camera A ───────────────► Camera B
Mic A ──────────────────► Speaker B

Camera B ───────────────► Camera A
Mic B ──────────────────► Speaker A
```

---

# 11. Gọi nhóm

Đối với gọi video nhiều người:

```text
             User A
                │
        ┌───────┼───────┐
        ▼       ▼       ▼
      User B  User C  User D
```

Không nên dùng mô hình P2P mesh khi số người lớn.

Có thể sử dụng:

* SFU.
* LiveKit.
* mediasoup.
* Janus.
* Jitsi.

Kiến trúc khuyến nghị:

```text
Flutter
   │
   ▼
Signaling
   │
   ▼
SFU
 ┌─┼─┬─┐
 A B C D
```

---

# 12. Trạng thái cuộc gọi

```text
calling
ringing
accepted
connecting
connected
reconnecting
ended
rejected
busy
missed
cancelled
failed
```

Ví dụ:

```text
A gọi B

A → calling
B → ringing

B accept

A → connecting
B → connecting

WebRTC connected

A/B → connected
```

---

# 13. WebSocket

WebSocket dùng cho:

* Online/offline.
* Typing.
* New message.
* Message read.
* Incoming call.
* Call accepted.
* Call rejected.
* Call ended.
* ICE candidate.
* WebRTC signaling.
* Group events.

Ví dụ:

```json
{
  "type": "incoming_call",
  "call_id": "CALL-001",
  "from_user_id": "USER-001",
  "to_user_id": "USER-002",
  "call_type": "video"
}
```

---

# 14. Isar Local Database

Isar dùng để:

* Offline-first.
* Cache user.
* Cache conversation.
* Cache message.
* Cache contact.
* Cache call history.
* Queue message chưa đồng bộ.
* Queue upload.
* Lưu trạng thái sync.

Các collection:

```text
User
Contact
Conversation
ConversationMember
Message
Attachment
Call
CallParticipant
SyncQueue
LocalSetting
```

---

# 15. Message model

```text
Message
---------
id
serverId
conversationId
senderId
messageType
content
attachmentId
replyToId
status
createdAt
updatedAt
deletedAt
isEdited
isRead
```

Message status:

```text
pending
sending
sent
delivered
read
failed
deleted
```

---

# 16. Offline-first

Ứng dụng phải hoạt động khi mất mạng.

Ví dụ:

```text
User gửi message
        │
        ▼
Lưu Isar
        │
        ▼
status = pending
        │
        ▼
Có Internet
        │
        ▼
POST /messages
        │
        ▼
Neon
        │
        ▼
serverId
        │
        ▼
Isar update
        │
        ▼
status = sent
```

---

# 17. Sync dữ liệu

Sử dụng:

```text
last_sync_at
updated_at
deleted_at
version
```

API:

```text
GET /sync?cursor=xxxxx
```

Response:

```json
{
  "cursor": "xxxxx",
  "users": [],
  "conversations": [],
  "messages": [],
  "contacts": [],
  "calls": []
}
```

Không nên tải toàn bộ database mỗi lần đăng nhập.

---

# 18. Sync message

Nguyên tắc:

```text
Local Isar
     │
     ├── message mới
     │
     ▼
Sync Queue
     │
     ▼
Vercel API
     │
     ▼
Neon
```

Server trả:

```text
server_id
created_at
updated_at
version
```

Flutter cập nhật lại Isar.

---

# 19. Xử lý duplicate message

Mỗi message cần:

```text
client_message_id = UUID
```

Ví dụ:

```text
550e8400-e29b-41d4-a716-446655440000
```

Server đặt unique index:

```text
conversation_id + client_message_id
```

Nếu client gửi lại do timeout, server không tạo message thứ hai.

---

# 20. Database Neon PostgreSQL

Các bảng chính:

```text
users
user_devices
user_sessions

contacts
friend_requests
blocked_users

conversations
conversation_members

messages
message_reactions
message_reads

attachments

calls
call_participants
call_events

notifications

devices
push_tokens

user_settings
privacy_settings

sync_cursors
```

---

# 21. Bảng users

```sql
users
-----
id
username
display_name
phone
email
password_hash
avatar_url
bio
status
last_seen
created_at
updated_at
deleted_at
```

---

# 22. Bảng conversations

```sql
conversations
-------------
id
type
name
avatar_url
created_by
created_at
updated_at
last_message_id
```

type:

```text
direct
group
```

---

# 23. Bảng messages

```sql
messages
--------
id
conversation_id
sender_id
client_message_id
message_type
content
attachment_id
reply_to_id
created_at
updated_at
deleted_at
```

Index:

```text
conversation_id
created_at
sender_id
client_message_id
```

---

# 24. File/ảnh/video

Không lưu file lớn trực tiếp trong Neon.

Kiến trúc:

```text
Flutter
   │
   ▼
Upload API
   │
   ▼
Object Storage
   │
   ▼
URL
   │
   ▼
Neon
```

Neon chỉ lưu:

```text
attachment_id
file_name
mime_type
file_size
storage_key
url
thumbnail_url
created_at
```

Có thể sử dụng:

* Vercel Blob.
* Cloudflare R2.
* AWS S3.
* Supabase Storage.
* Cloudinary.

---

# 25. API Vercel

Cấu trúc:

```text
/api
   /auth
      login
      register
      refresh
      logout

   /users
      profile
      search
      update

   /contacts
      list
      add
      accept
      reject
      block

   /conversations
      list
      create
      members

   /messages
      send
      list
      read
      delete
      edit

   /attachments
      upload
      metadata

   /calls
      create
      accept
      reject
      end
      history

   /sync
      pull
      push

   /notifications
      register-device
```

---

# 26. Authentication

Sử dụng:

```text
Access Token
Refresh Token
```

API request:

```http
Authorization: Bearer ACCESS_TOKEN
```

Không cho client truy cập trực tiếp Neon.

```text
Flutter
   │
   ▼
Vercel API
   │
   ▼
Neon
```

---

# 27. Phân quyền

Các role:

```text
user
moderator
admin
super_admin
```

User thông thường chỉ được:

```text
read/write dữ liệu của chính mình
```

Admin có thể:

```text
quản lý user
khóa tài khoản
xem báo cáo
xử lý abuse
```

---

# 28. Push Notification

Android:

```text
Firebase Cloud Messaging
```

iOS:

```text
APNs
```

Khi có cuộc gọi:

```text
A
 │
 ▼
Signaling
 │
 ▼
Push Server
 │
 ▼
FCM/APNs
 │
 ▼
B
```

Thông báo:

```text
Incoming video call
Nguyễn Văn A đang gọi cho bạn
```

---

# 29. Call History

Lưu:

```text
call_id
caller_id
receiver_id
call_type
started_at
answered_at
ended_at
duration
status
```

Ví dụ:

```text
Video call
Nguyễn Văn A
12:30
02:15
Completed
```

---

# 30. Màn hình Flutter

## Authentication

```text
Splash
Login
Register
OTP
Forgot Password
```

## Main

```text
Home
Chats
Contacts
Calls
Profile
Settings
```

## Chat

```text
Conversation List
Chat Detail
Group Detail
Media
File Viewer
```

## Call

```text
Incoming Call
Outgoing Call
Video Call
Voice Call
Group Call
Call History
```

---

# 31. Cấu trúc Flutter project

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
│   ├── network/
│   ├── storage/
│   ├── websocket/
│   ├── webrtc/
│   ├── notifications/
│   └── utils/
│
├── data/
│   ├── models/
│   ├── isar/
│   ├── api/
│   └── repositories/
│
├── features/
│   ├── auth/
│   ├── users/
│   ├── contacts/
│   ├── chat/
│   ├── groups/
│   ├── calls/
│   ├── notifications/
│   └── settings/
│
└── shared/
    ├── widgets/
    └── components/
```

---

# 32. Dependencies dự kiến

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_riverpod:
  shared_preferences:
  http:
  dio:

  isar:
  isar_flutter_libs:

  uuid:
  intl:
  path_provider:

  web_socket_channel:

  flutter_webrtc:

  firebase_core:
  firebase_messaging:

  image_picker:
  file_picker:
  cached_network_image:

  permission_handler:

  just_audio:
  audioplayers:
```

Có thể bổ sung thư viện mã hóa, upload/resume upload và media compression tùy kiến trúc cuối cùng.

---

# 33. WebRTC architecture

## Voice call

```text
Microphone
    │
    ▼
WebRTC AudioTrack
    │
    ▼
PeerConnection
    │
    ▼
Remote Audio
```

## Video call

```text
Camera
   │
   ▼
VideoTrack
   │
   ▼
PeerConnection
   │
   ▼
Remote Video
```

---

# 34. STUN/TURN

Không nên chỉ dựa vào STUN.

Production cần:

```text
STUN
 +
TURN
```

TURN server giúp cuộc gọi hoạt động khi hai thiết bị nằm sau NAT/firewall khó kết nối P2P.

Có thể triển khai:

```text
coturn
```

---

# 35. Bảo mật

Bắt buộc:

```text
HTTPS
WSS
JWT
Password Hash
Rate Limit
Input Validation
SQL Injection Protection
File Type Validation
File Size Limit
Access Control
```

Không lưu:

```text
password plaintext
```

Không đưa:

```text
Neon DATABASE_URL
JWT secret
Firebase server key
TURN secret
```

vào Flutter APK.

---

# 36. Mã hóa tin nhắn

Có thể triển khai hai mức:

## Mức 1

```text
Flutter
   │ HTTPS
   ▼
Vercel
   │
   ▼
Neon
```

Server có thể đọc nội dung message.

## Mức 2 — nâng cao

```text
User A
  │
  │ Encrypt
  ▼
Ciphertext
  │
  ▼
Server
  │
  ▼
User B
  │
  │ Decrypt
  ▼
Message
```

Nếu muốn hướng tới mô hình giống WhatsApp, cần thiết kế **End-to-End Encryption (E2EE)** ngay từ đầu thay vì bổ sung sau.

---

# 37. Privacy

Người dùng có thể thiết lập:

```text
Who can call me
Who can see my profile
Who can see last seen
Who can see online status
Who can add me to groups
Who can send messages
```

---

# 38. Anti-spam

API cần:

```text
Rate limit login
Rate limit OTP
Rate limit message
Rate limit call
Rate limit upload
```

Ví dụ:

```text
100 messages / minute / user
```

Có thể điều chỉnh theo hệ thống thực tế.

---

# 39. Đồng bộ đa thiết bị

Một tài khoản có thể đăng nhập:

```text
Android Phone
iPhone
Windows
Web
```

Ví dụ:

```text
Phone A
   │
   ├── Message
   │
   ▼
Neon
   │
   ├────────► Phone B
   │
   └────────► Windows
```

Isar trên mỗi thiết bị là database local riêng.

---

# 40. Device management

Bảng:

```text
user_devices
------------
id
user_id
device_id
device_name
platform
push_token
last_active
created_at
```

Cho phép:

```text
Thiết bị đang đăng nhập
Đăng xuất thiết bị
Đăng xuất tất cả thiết bị
```

---

# 41. Đồng bộ tự động

Flutter chạy:

```text
SyncManager
```

Các thời điểm sync:

```text
App startup
Login
Resume app
Có Internet trở lại
Sau khi gửi message
Định kỳ
```

Ví dụ:

```text
Timer 30s
      │
      ▼
Check Internet
      │
      ▼
Sync pending data
      │
      ▼
Pull server changes
```

---

# 42. Conflict resolution

Ưu tiên:

```text
server version
updated_at
version number
```

Không nên sử dụng đơn giản:

```text
local data luôn thắng server
```

---

# 43. Offline message queue

```text
SyncQueue
----------
id
entity_type
entity_id
operation
payload
retry_count
last_error
created_at
```

Ví dụ:

```text
MESSAGE
CREATE
retry_count = 3
```

Nếu API lỗi:

```text
retry
retry
retry
```

Sau số lần nhất định:

```text
failed
```

---

# 44. Search

Tìm kiếm:

```text
User
Conversation
Message
Group
```

Search user có thể thông qua API.

Search message có thể:

```text
Local → Isar
Server → Neon
```

---

# 45. Notification

Các loại:

```text
new_message
incoming_call
missed_call
friend_request
friend_accepted
group_invite
group_message
```

---

# 46. Trạng thái online

```text
online
offline
away
busy
```

Online status không nên ghi database Neon liên tục.

Có thể:

```text
WebSocket presence
Redis / realtime state
```

Neon chỉ lưu:

```text
last_seen
```

---

# 47. Kiến trúc realtime production

Khi số người dùng nhỏ:

```text
Flutter
   │
   ▼
Vercel API
   │
   ▼
WebSocket/Signaling
```

Khi hệ thống lớn:

```text
Flutter
   │
   ├── REST ──────► Vercel
   │
   ├── WebSocket ─► Realtime Server
   │
   └── WebRTC ────► TURN/SFU
                         │
                         ▼
                       Users
```

---

# 48. Không nên dùng Vercel cho

Không nên thiết kế:

```text
Video stream
Audio stream
Large persistent WebSocket workload
```

thông qua serverless API thông thường.

Vercel phù hợp hơn cho:

```text
REST API
Authentication
Database API
Webhook
Server-side logic
```

Realtime signaling có thể cần một dịch vụ/server phù hợp với kết nối lâu dài.

---

# 49. MVP Phase 1

Triển khai trước:

```text
[ ] Register
[ ] Login
[ ] JWT
[ ] Profile
[ ] Contact
[ ] Friend request
[ ] 1-1 chat
[ ] Text message
[ ] Isar offline
[ ] Neon sync
[ ] WebSocket
[ ] Push notification
[ ] Voice call
[ ] Video call
[ ] Call history
```

---

# 50. Phase 2

```text
[ ] Group chat
[ ] Group voice
[ ] Group video
[ ] Image
[ ] File
[ ] Voice message
[ ] Sticker
[ ] Emoji
[ ] Reply
[ ] Forward
[ ] Reaction
[ ] Message search
```

---

# 51. Phase 3

```text
[ ] E2EE
[ ] Multi-device
[ ] Desktop
[ ] SFU
[ ] TURN cluster
[ ] Large group call
[ ] Media optimization
[ ] Advanced privacy
[ ] Anti-spam
[ ] Admin dashboard
```

---

# 52. Admin Web

Có thể xây dựng thêm:

```text
Admin Web
   │
   ▼
Vercel
   │
   ▼
Neon
```

Quản lý:

```text
Users
Devices
Contacts
Conversations
Reports
Blocked users
Calls
Messages
Storage
System statistics
```

---

# 53. Dashboard

Hiển thị:

```text
Tổng users
Users online
Users mới
Tổng conversations
Messages hôm nay
Calls hôm nay
Video calls
Voice calls
Dung lượng file
```

---

# 54. Báo cáo cuộc gọi

```text
Tổng cuộc gọi
Cuộc gọi thành công
Cuộc gọi bị từ chối
Cuộc gọi nhỡ
Thời lượng trung bình
Video call
Voice call
```

---

# 55. Logging

Không log nội dung tin nhắn trong production nếu không cần thiết.

Có thể log:

```text
request_id
user_id
device_id
endpoint
status_code
duration
error_code
created_at
```

---

# 56. Backup

Neon:

```text
Database backup
```

Object Storage:

```text
Media backup
```

Isar:

```text
Không coi Isar là backup server
```

Isar chỉ là local cache/offline database.

---

# 57. Nguyên tắc dữ liệu

```text
Neon = Server Source of Truth

Isar = Local Source/Cache cho trải nghiệm offline

Vercel API = Business/API Layer

WebSocket = Realtime signaling/events

WebRTC = Audio/Video transport

Object Storage = Media storage
```

---

# 58. Kiến trúc cuối cùng

```text
                    ┌──────────────────┐
                    │   Flutter App    │
                    └────────┬─────────┘
                             │
              ┌──────────────┼───────────────┐
              │              │               │
              ▼              ▼               ▼
           Isar          REST API        WebSocket
         Offline          Vercel         Realtime
              │              │               │
              │              ▼               ▼
              │           Neon DB         Signaling
              │                              │
              │                              ▼
              │                         WebRTC
              │                              │
              │                       ┌──────┴──────┐
              │                       │             │
              │                      STUN          TURN
              │                                     │
              │                                     ▼
              │                                    SFU
              │
              ▼
        Local UI / Cache

Media:
Flutter → Upload API → Object Storage → URL → Neon
```

---

# 59. Nguyên tắc quan trọng nhất

Ứng dụng này nên được thiết kế theo mô hình:

```text
OFFLINE-FIRST
+
REALTIME
+
WEBRTC
+
CLOUD SYNC
```

Trong đó:

```text
Isar
    ↓
Offline local database

Neon
    ↓
Central cloud database

Vercel API
    ↓
Authentication + REST + business logic

WebSocket
    ↓
Realtime events + WebRTC signaling

WebRTC
    ↓
Voice + Video

TURN/SFU
    ↓
Reliable production calls

Object Storage
    ↓
Images + Videos + Files
```

Cách tổ chức này phù hợp để phát triển từ **ứng dụng chat/gọi video 1-1 nhỏ** lên hệ thống nhiều người dùng, nhiều thiết bị và gọi video nhóm mà không phải thay đổi toàn bộ kiến trúc.
