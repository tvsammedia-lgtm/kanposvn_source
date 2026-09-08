# Đặc tả Kiến trúc Hybrid (Cloud & Local) cho KanPosVN

Tài liệu này mô tả mô hình kết hợp (Hybrid) giữa Cloud và Local Server cho các ứng dụng thuộc hệ sinh thái KanPosVN (sử dụng Flutter + Isar).

## 1. Mục tiêu
Hệ thống cho phép ứng dụng Flutter hoạt động ở hai chế độ:
- **Cloud Mode**: Kết nối trực tiếp qua Internet tới Vercel API và lưu trữ trên Neon PostgreSQL.
- **Local Mode (Offline/LAN)**: Kết nối qua mạng nội bộ tới một Local Server (Node.js/Next.js) và lưu trữ trên Local PostgreSQL.

Cả hai chế độ đều đồng bộ dữ liệu hai chiều với cơ sở dữ liệu nội bộ của ứng dụng (Isar DB) để đảm bảo trải nghiệm Offline-first.

## 2. Kiến trúc Tổng thể

```mermaid
graph TD
    subgraph Local Environment (App & Isar)
        Flutter[Flutter App]
        Isar[(Isar Local DB)]
        Flutter <-->|Offline-first| Isar
    end

    subgraph Network Switch
        Router{Server Mode}
        Router -->|mode == cloud| CloudAPI
        Router -->|mode == local| LocalAPI
    end
    
    Flutter -->|Sync / Auth| Router

    subgraph Cloud Environment
        CloudAPI[Vercel API]
        NeonDB[(Neon PostgreSQL)]
        CloudAPI <--> NeonDB
    end

    subgraph On-Premise Environment (LAN)
        LocalAPI[Local Node.js/Next.js API]
        LocalDB[(Local PostgreSQL)]
        LocalAPI <--> LocalDB
    end
```

## 3. Quản lý Môi trường trên Flutter

Mã nguồn Flutter sẽ không gọi trực tiếp các URL cứng, mà sử dụng Enum và Configuration để linh hoạt chuyển đổi:

```dart
enum ServerMode { cloud, local, auto }

class AppConfig {
  static ServerMode mode = ServerMode.cloud;
  
  static const String cloudApi = 'https://kanposvn.vercel.app/api';
  static const String localApi = 'http://192.168.1.100:3000/api';

  static String get apiBaseUrl {
    return mode == ServerMode.cloud ? cloudApi : localApi;
  }
}
```

Repository Pattern được sử dụng triệt để. Các Repository (`AuthRepository`, `OrderRepository`, `SyncRepository`) chỉ tương tác qua `apiBaseUrl` mà không quan tâm hệ thống bên dưới là Vercel hay Local Node.js.

## 4. Xác thực và Bảo mật (Authentication)

Dù chạy ở Cloud hay Local, cơ chế xác thực vẫn giữ nguyên:
- Hệ thống hỗ trợ đăng nhập với các trường: `username`, `password`, `app_code`.
- Server trả về **JWT Token**.
- Token được lưu vào `flutter_secure_storage` tại thiết bị.
- Dữ liệu quyền (Roles) và Session được cache vào Isar để hỗ trợ việc mở app và làm việc kể cả khi mất kết nối mạng.
- Khi có mạng trở lại, hệ thống sẽ Validate Token. Nếu hợp lệ, tiến hành đồng bộ.

## 5. Đồng bộ Dữ liệu 2 Chiều (Sync API)

Các API được thiết kế chung một chuẩn cấu trúc để dùng lại được cho cả 2 môi trường:

### Standard Endpoints
- **Auth**: `/api/auth/login`, `/api/auth/refresh`, `/api/auth/logout`
- **Business**: `/api/users`, `/api/orders`, `/api/customers`, `/api/inventory`
- **Sync**: `/api/sync/push`, `/api/sync/pull`

### Cơ chế Push & Pull
- **Push**: `SyncTask` (CREATE, UPDATE, DELETE) từ Isar sẽ được gửi qua `/api/sync/push`. Cần xử lý conflict based on `updated_at` hoặc `version`.
- **Pull**: Thiết bị lấy dữ liệu mới từ Server bằng `/api/sync/pull` kèm theo tham số `last_sync_cursor` (timestamp lần đồng bộ cuối).

## 6. Triển khai Backend (API Server)

Mã nguồn Backend được thiết kế để có thể "Compile" và chạy linh hoạt:
- Triển khai lên **Vercel** bằng serverless functions.
- Triển khai xuống **Máy tính Local** bằng Node.js thông thường (chạy cổng 3000) thông qua môi trường PM2 hoặc Docker.

File cấu hình `.env` của Backend sẽ quyết định:
```env
# Cloud
DATABASE_URL=postgres://...neon.tech/kanposvn
AUTH_SECRET=cloud_super_secret

# Local
DATABASE_URL=postgres://localhost:5432/kanposvn_local
AUTH_SECRET=local_super_secret
```

## 7. Sao lưu & Phục hồi (Backup / Restore)

- **Cloud Mode**: Sử dụng cơ chế backup tự động của Neon.tech.
- **Local Mode**: Backend cục bộ sẽ cung cấp thêm API `/api/backup` để dump (trích xuất) PostgreSQL thành file `.sql` định kỳ và lưu vào ổ cứng máy tính thu ngân hoặc đẩy lên Google Drive.
- **Isar DB**: Hỗ trợ tính năng export/import thủ công cho mục đích xử lý sự cố.

## 8. Lợi ích của kiến trúc này

1. **Một Codebase duy nhất**: Flutter code, Backend API code, Database schema đều dùng chung 1 cấu trúc.
2. **Khả năng mở rộng thương mại**: Có thể bán ứng dụng theo mô hình SaaS (khách hàng dùng Cloud) hoặc theo mô hình Enterprise (Bán license cài đặt máy chủ tận nơi).
3. **Chống chịu sự cố mạng**: Các mô hình POS, Phòng khám, Nhà thuốc thường rất nhạy cảm với mạng Internet rớt. Local Mode kết hợp Isar giúp doanh nghiệp hoạt động 100% không cần Internet ngoại bộ (chỉ cần WiFi nội bộ).
