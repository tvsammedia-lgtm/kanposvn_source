# KanPosVN - Zalo Mini App

Zalo Mini App cho KanPosVN: **Đăng ký**, **Thanh toán**, **Gia hạn**, **Tải POS**.

## Luồng hoạt động

```
Zalo Mini App
      │
      ├── Đăng ký (trial 7 ngày)
      ├── Thanh toán (mock ZaloPay)
      ├── Gia hạn
      └── Nút "Tải POS" ──► Website tải APK (GitHub Release)
                              │
                              ▼
                       Flutter POS (tự kiểm tra cập nhật)
                              │
                              ▼
                    API /api/update/latest (Vercel)
```

## Cài đặt

1. Cài [Zalo Mini App CLI](https://mini.zalo.me/docs/dev-tools/):

   ```bash
   npm install -g zmp-cli
   ```

2. Cài dependencies:

   ```bash
   cd zalo-miniapp
   npm install
   ```

3. Chạy dev server:

   ```bash
   zmp start
   ```

4. Mở `localhost:3000` trong [Mini App DevTools](https://mini.zalo.me/docs/dev-tools/) hoặc trên Zalo.

## Cấu hình

- API backend: `src/services/api.ts` → `API_BASE = "https://kanposvn-admin.vercel.app"`.
- Các endpoint dùng:
  - `POST /api/license/register` — đăng ký + trial 7 ngày
  - `POST /api/license/order` — tạo đơn thanh toán (mock)
  - `POST /api/license/pay` — xác nhận thanh toán (mock)
  - `POST /api/license/renew` — gia hạn gói (mock)
  - `GET /api/license/me?phone=...` — tra cứu gói hiện tại
  - `GET /api/update/latest` — lấy bản phát hành mới nhất từ GitHub Release

## Deploy lên Zalo

1. Tạo Mini App ID tại [mini.zalo.me](https://mini.zalo.me).
2. Cập nhật `app-config.json` và `zmp-cli.json`.
3. Đăng nhập và deploy:

   ```bash
   zmp login
   zmp deploy
   ```

## Tích hợp ZaloPay thật (sau này)

- `POST /api/license/order` đang trả về `payment.mock = true`.
- Khi có tài khoản merchant ZaloPay, gọi API `CreateOrder` của ZaloPay từ backend
  (hoặc từ mini app qua `zmp-sdk`), nhận `zp_trans_token`, mở cửa sổ thanh toán,
  sau đó dùng `zmp-sdk` để lấy kết quả và xác nhận ở `POST /api/license/pay`.
