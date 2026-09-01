<!-- BEGIN:nextjs-agent-rules -->
# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` before writing any code. Heed deprecation notices.
<!-- END:nextjs-agent-rules -->

<!-- BEGIN:freeze-rules -->
# 🛑 FROZEN — admin-web UI & Level-1 Cloud flow (DO NOT MODIFY)

The admin-web interface and the Level-1 Cloud owner flow are FROZEN as the
current stable baseline. Do NOT modify them unless the user explicitly asks.

## Hard freeze (do not change):
- **All UI/pages** under `src/app/` — layout, colors, text labels, buttons,
  forms, dashboard, login, register, download pages.
- **Level-1 Cloud owner flow**:
  - `src/app/register/page.tsx` + `src/app/api/auth/register/route.ts`
  - `src/app/login/page.tsx` + `src/app/api/auth/login/route.ts`
  - `src/app/api/license/*` (register/renew/order/pay/me/check)
  - `src/app/api/store/summary/route.ts`
  - `src/lib/pricing.ts`, `src/lib/auth.ts`, `src/lib/db.ts`
- **Phân quyền ứng dụng (Application Permissions) — FROZEN**:
  - `src/app/dashboard/permissions/page.tsx` (Quyền User - Apps)
  - `src/app/api/users/[id]/permissions/route.ts`
  - `src/app/api/users/[id]/route.ts` (user management)
  - `src/app/api/role-permissions/route.ts`
  - `src/app/api/roles/route.ts`
  - `src/app/api/set-admin/route.ts` (grant Admin trên tất cả apps)
  - Cách gán/đọc app_code theo user trong `user_permissions` — logic đã chốt,
    KHÔNG đổi cấu trúc bảng, tên cột, hay cách lọc `can_login`.
- **Visual appearance**: any change to a page's rendered HTML/classes/text is a
  UI change and is forbidden without explicit user confirmation.

## Rules:
1. NEVER "improve", "polish", "restyle", "refactor" or "optimize" the UI
   unprompted. If in doubt, DON'T touch it.
2. Do NOT run `npm run lint` and then "fix" pre-existing warnings/errors —
   those are accepted and must stay untouched.
3. If the user reports a bug, describe the root cause first and ASK before
   editing. Small bug-fix edits are allowed, but any visual/flow change needs
   explicit approval.
4. Verify at the end: `git diff admin-web` must contain ONLY the files the user
   asked to change, nothing else.
<!-- END:freeze-rules -->

<!-- BEGIN:product-note -->
## Product note — kanposvnhrpayroll
`kanposvnhrpayroll` (HR Payroll) is a **product module** that customers select to
use during registration / for trial, exactly like other modules (cafe, vlxd,
nhathuoc, gara, spa, ...). It is a customer-facing POS/HR **product**, NOT a
platform HR feature that manages admin users. It must never be wired into the
platform `user_permissions` / `roles` / `api/set-admin` user-management flow
(that role-access layer is separate and FROZEN).
<!-- END:product-note -->

