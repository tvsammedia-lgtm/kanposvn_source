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

## Commit / push conventions
- Commit style: `feat: KanPosVN <Module> - <summary> (+ backup YYYYMMDD)`.
- Push to `origin/master`. If the remote moved (CI artifact commits), rebase
  onto `origin/master` (artifacts are binary-only; no conflicts).
- Never commit secrets. `.env` is kept in backups but not tracked in git.