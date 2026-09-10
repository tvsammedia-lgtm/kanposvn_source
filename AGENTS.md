# KanPosVN Project Rules

## Backup procedure (IMPORTANT — do not get the folder wrong)

Only create a backup zip when the user explicitly asks.

- **Location: the repo root itself**
  `D:\GIAI_TRI_SHARED_HP\bag_sony_10\sampledart\demo_code\kanposvn\`
  (NOT `demo_code\`, NOT any other folder.)
- **Name:** `kanposvn_backup_YYYYMMDD_HHMM.zip` with current time in `HHMM`
  (e.g. `kanposvn_backup_20260906_1311.zip`). No seconds, no double date.
- **Command** (run with working directory = repo root):

  ```
  tar -a -cf "kanposvn_backup_YYYYMMDD_HHMM.zip" `
    --exclude=".git" --exclude=".dart_tool" --exclude=".gradle" `
    --exclude="node_modules" --exclude="build" --exclude=".next" `
    --exclude="downloads" --exclude="windows" `
    --exclude="kanposvn-windows-x64.zip" --exclude="kanposvn_backup*" .
  ```

- Excludes `.git`, `.dart_tool`, `.gradle`, `node_modules`, `build`, `.next`,
  `downloads`, the `windows/` runner dir, the built `kanposvn-windows-x64.zip`,
  and older nested `kanposvn_backup*` zips. The `kanposvn_isar_backup_*.zip`
  and `.env` ARE kept (matches reference `kanposvn_backup_20260906_0759.zip`).
- Expected result: ~30 MB. Sanity check: zip entries all present, no nested
  backup zips inside.
- Example reference: `kanposvn_backup_20260906_0759.zip` in the repo root.

## Authentication & License architecture (FROZEN — do not change)

These rules describe the app's behavior contract and must be preserved in any
feature work. Deviations are a breaking design change.

### License check (FROZEN)
- The app MUST check the license on startup before allowing any feature use.
- If the license is invalid/expired, the app MUST block usage and show a
  license screen; no login, no sales screen, no data entry is allowed.
- License evaluation is required on every app launch and MUST NOT be skippable.

### Cloud login once per device (FROZEN)
- The app requires internet-based Cloud login at least ONCE per device.
- On first launch (no stored cloud session), the user MUST log in via the
  internet to the Cloud before the app can be used at all.
- The Cloud login authenticates the full (admin/owner) account; only a
  successful first Cloud login unlocks the offline local mode below.

### Offline local mode (FROZEN)
- After a successful Cloud login at least once on this device, the local user
  can use the app OFFLINE (no internet required).
- The stored local session persists across app restarts.

### Local user role: restricted sales employee (FROZEN)
- When the app runs in offline local mode, the acting user is a LOCAL user
  with role = sales employee (nhan vien ban hang / POS la nhan vien).
- A local sales employee is RESTRICTED:
  - Limited functionality: only the features needed for selling at the
    register/POS.
  - Limited screens: only the screens allowed for a sales employee are
    visible; admin/system/manage screens are hidden and unreachable.
  - No management permissions (no product management, no user management,
    no reporting/admin dashboards, no settings that affect the system).
- Full functionality is only available after a Cloud login with the full
  (owner/admin) account.

### General rule (FROZEN)
- Any change that touches license, cloud login, offline mode, or the local
  sales-employee permission boundary must keep this behavior contract intact.

## Commit / push conventions
- Commit style: `feat: KanPosVN <Module> - <summary> (+ backup YYYYMMDD)`.
- Push to `origin/master`. If the remote moved (CI artifact commits), rebase
  onto `origin/master` (artifacts are binary-only; no conflicts).
- Never commit secrets. `.env` is kept in backups but not tracked in git.