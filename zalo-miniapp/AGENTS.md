# 🛑 FROZEN — zalo-miniapp UI (DO NOT MODIFY)

The Zalo Mini App interface is FROZEN as the current stable baseline. Do NOT
modify it unless the user explicitly asks.

## Hard freeze (do not change):
- **All UI/pages** under `src/` — layout, colors, text labels, buttons, forms,
  pages (`App.tsx`, `pages/*`), styling, navigation.
- **Visual appearance**: any change to a page's rendered HTML/classes/text is a
  UI change and is forbidden without explicit user confirmation.

## Rules:
1. NEVER "improve", "polish", "restyle", "refactor" or "optimize" the UI
   unprompted. If in doubt, DON'T touch it.
2. If the user reports a bug, describe the root cause first and ASK before
   editing. Small bug-fix edits are allowed, but any visual/flow change needs
   explicit approval.
3. Verify at the end: `git diff zalo-miniapp/src` must contain ONLY the files
   the user asked to change, nothing else.

## Note — kanposvnhrpayroll
`kanposvnhrpayroll` (HR Payroll) is a **product module** that customers select to
use, exactly like other modules (cafe, vlxd, nhathuoc, gara, ...). It is NOT a
platform HR feature for managing admin users. Module chọn-sử-dụng của khách
hàng, KHÔNG phải HR quản lý user.
