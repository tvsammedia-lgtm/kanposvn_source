import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/account_switcher_button.dart';
import '../../kanposvnhrpayroll/core/app_theme.dart';
import '../models/compare_config.dart';
import '../providers/doichieu_providers.dart';
import '../widgets/file_picker_card.dart';

class DcHomeScreen extends ConsumerWidget {
  const DcHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(doichieuFlowProvider);
    final config = state.config;
    final slots = state.slots;
    final lastError = state.error;

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Đối chiếu kế toán',
                            style: Theme.of(context).textTheme.headlineLarge),
                        Text('So khớp 2–3 file Excel/CSV theo cột khóa',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const Spacer(),
                    AccountSwitcherButton(
                      foregroundColor: AppTheme.textPrimary,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppTheme.primaryBlue, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.switch_account,
                                size: 18, color: AppTheme.primaryLight),
                            SizedBox(width: 6),
                            Text('Chuyển tài khoản',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: AppTheme.primaryLight)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: state.running
                          ? null
                          : () => ref
                              .read(doichieuFlowProvider.notifier)
                              .useSampleData(),
                      icon: const Icon(Icons.science_outlined, size: 18),
                      label: const Text('Dữ liệu mẫu',
                          style: TextStyle(fontSize: 13)),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      tooltip: 'Đặt lại',
                      onPressed: state.running
                          ? null
                          : () => ref.read(doichieuFlowProvider.notifier).reset(),
                      icon: const Icon(Icons.refresh),
                    ),
                    IconButton(
                      tooltip: 'Lưu trữ',
                      onPressed: () =>
                          ref.read(doichieuTabIndexProvider.notifier).state = 2,
                      icon: const Icon(Icons.history),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ---- Chọn 3 file ----
                LayoutBuilder(
                  builder: (context, constraints) {
                    final cols = (constraints.maxWidth / 420).ceil().clamp(1, 3);
                    final cards = <Widget>[
                      const FilePickerCard(
                        slotIndex: 0,
                        label: 'File A (chuẩn)',
                        icon: Icons.description_outlined,
                        color: Color(0xFF22C55E),
                      ),
                      const FilePickerCard(
                        slotIndex: 1,
                        label: 'File B (so sánh)',
                        icon: Icons.insert_drive_file_outlined,
                        color: Color(0xFF3B82F6),
                      ),
                      const FilePickerCard(
                        slotIndex: 2,
                        label: 'File C (tùy chọn)',
                        icon: Icons.upload_file_outlined,
                        color: Color(0xFFF59E0B),
                      ),
                    ];
                    return GridView.count(
                      crossAxisCount: cols,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisExtent: cols == 1 ? 240 : 260,
                      children: cards,
                    );
                  },
                ),
                const SizedBox(height: 20),

                // ---- Ánh xạ cột ----
                if (slots[0] != null && slots[1] != null) ...[
                  _MappingCard(slots: slots, state: state),
                  const SizedBox(height: 14),
                ],

                // ---- Cấu hình ----
                _ConfigCard(
                  config: config,
                  canonical: state.canonicalColumns,
                  enabled: !state.running,
                ),
                const SizedBox(height: 20),

                // ---- Chạy ----
                SizedBox(
                  height: 52,
                  child: FilledButton.icon(
                    onPressed: state.running ||
                            slots[0] == null ||
                            slots[1] == null
                        ? null
                        : () => ref.read(doichieuFlowProvider.notifier).runCompare(),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Chạy đối chiếu',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  ),
                ),
                if (lastError != null) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.danger.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.danger.withValues(alpha: 0.4)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline, color: AppTheme.danger, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(lastError,
                              style:
                                  const TextStyle(color: AppTheme.danger, fontSize: 13)),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),

          // ---- Thanh tiến trình ----
          if (state.running)
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(color: AppTheme.surface),
              child: Row(
                children: [
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.primaryLight),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      state.progressLabel,
                      style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------

class _MappingCard extends ConsumerWidget {
  final List<DoiChieuFileSlot?> slots;
  final DoiChieuState state;

  const _MappingCard({required this.slots, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canonical = state.canonicalColumns;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.merge_type, size: 20, color: AppTheme.primaryLight),
                SizedBox(width: 8),
                Text('Ánh xạ cột (tự đề xuất — chỉnh tay nếu cần)',
                    style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Cột chuẩn lấy từ File A. Hệ thống tự khớp cột tương ứng ở File B/C.',
              style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
            ),
            const SizedBox(height: 12),
            for (var i = 1; i < 3; i++) ...[
              if (slots[i] != null) _SlotMapping(notifierNo: i, canonical: canonical),
              if (i == 1 && slots[2] != null) const SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );
  }
}

class _SlotMapping extends ConsumerWidget {
  final int notifierNo;
  final List<String> canonical;

  const _SlotMapping({required this.notifierNo, required this.canonical});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(doichieuFlowProvider);
    final slot = state.slots[notifierNo];
    if (slot == null) return const SizedBox.shrink();
    final headers = dcHeadersOf(slot);
    final mapping = state.mappings[notifierNo];
    final name = notifierNo == 1 ? 'File B' : 'File C';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name,
            style: const TextStyle(
                color: AppTheme.textPrimary, fontSize: 13, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        for (final c in canonical) ...[
          Row(
            children: [
              SizedBox(
                width: 180,
                child: Text(
                  c,
                  style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12.5),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Icon(Icons.arrow_forward, size: 14, color: AppTheme.textMuted),
              ),
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: mapping[c] ?? '',
                  isDense: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  ),
                  items: [
                    const DropdownMenuItem<String>(
                      value: '',
                      child: Text('(bỏ qua)',
                          style: TextStyle(color: AppTheme.textMuted, fontSize: 12.5)),
                    ),
                    for (final h in headers)
                      DropdownMenuItem<String>(value: h, child: Text(h, style: const TextStyle(fontSize: 12.5))),
                  ],
                  onChanged: (v) {
                    if (v == null) return;
                    ref
                        .read(doichieuFlowProvider.notifier)
                        .setMapping(notifierNo, c, v);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ],
    );
  }
}

// ---------------------------------------------------------------------------

class _ConfigCard extends ConsumerWidget {
  final CompareConfig config;
  final List<String> canonical;
  final bool enabled;

  const _ConfigCard({required this.config, required this.canonical, required this.enabled});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.tune, size: 20, color: AppTheme.primaryLight),
                SizedBox(width: 8),
                Text('Cấu hình đối chiếu',
                    style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 14),
            _FieldLabel('Khóa (Key) — thường là số chứng từ, 1–3 cột'),
            const SizedBox(height: 6),
            _ChipsRow(
              options: canonical,
              selected: config.keyColumns,
              onToggle: (col, on) {
                final keys = [...config.keyColumns];
                if (on) {
                  if (!keys.contains(col) && keys.length < 3) keys.add(col);
                } else {
                  keys.remove(col);
                }
                ref.read(doichieuFlowProvider.notifier).updateConfig(
                    config.copyWith(keyColumns: keys));
              },
            ),
            const SizedBox(height: 14),
            _FieldLabel('Cột cần so sánh (mặc định: tất cả)'),
            const SizedBox(height: 6),
            _ChipsRow(
              options: canonical,
              selected: config.compareColumns,
              onToggle: (col, on) {
                final cols = [...config.compareColumns];
                if (on) {
                  if (!cols.contains(col)) cols.add(col);
                } else {
                  cols.remove(col);
                }
                ref.read(doichieuFlowProvider.notifier).updateConfig(
                    config.copyWith(compareColumns: cols));
              },
            ),
            const SizedBox(height: 14),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: const Text('Tùy chọn nâng cao',
                  style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
              children: [
                _buildAdvanced(context, ref),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvanced(BuildContext context, WidgetRef ref) {
    final c = config;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel('Chế độ khớp'),
        DropdownButtonFormField<int>(
          initialValue: c.matchMode,
          isDense: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text('0 · Chính xác từng ký tự')),
            DropdownMenuItem(value: 1, child: Text('1 · Chuẩn hóa (đề xuất)')),
            DropdownMenuItem(value: 2, child: Text('2 · Kiểu kế toán')),
          ],
          onChanged: enabled
              ? (v) => ref
                  .read(doichieuFlowProvider.notifier)
                  .updateConfig(c.copyWith(matchMode: v))
              : null,
        ),
        const SizedBox(height: 12),
        _FieldLabel('Xử lý key trùng'),
        DropdownButtonFormField<String>(
          initialValue: c.duplicateMode,
          isDense: true,
          items: const [
            DropdownMenuItem(value: 'row', child: Text('row · Liệt kê từng dòng')),
            DropdownMenuItem(value: 'aggregate', child: Text('aggregate · Gộp theo key')),
            DropdownMenuItem(value: 'ignore', child: Text('ignore · Bỏ qua')),
          ],
          onChanged: enabled
              ? (v) => ref
                  .read(doichieuFlowProvider.notifier)
                  .updateConfig(c.copyWith(duplicateMode: v))
              : null,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                enabled: enabled,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                controller: TextEditingController(
                    text: (c.numberTolerance as num).toString()),
                decoration: const InputDecoration(
                  labelText: 'Sai số tiền tối đa',
                  hintText: '0',
                ),
                onChanged: (v) {
                  final d = double.tryParse(v.replaceAll(',', '.'));
                  if (d != null) {
                    ref
                        .read(doichieuFlowProvider.notifier)
                        .updateConfig(c.copyWith(numberTolerance: d));
                  }
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                enabled: enabled,
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: '${c.decimalPlaces}'),
                decoration: const InputDecoration(
                  labelText: 'Số thập phân làm tròn',
                  hintText: '2',
                ),
                onChanged: (v) {
                  final n = int.tryParse(v);
                  if (n != null && n >= 0) {
                    ref
                        .read(doichieuFlowProvider.notifier)
                        .updateConfig(c.copyWith(decimalPlaces: n));
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        _SwitchRow(
          value: c.treatEmptyAsSame,
          title: 'Coi ô trống ≡ ô trống',
          onChanged: (v) => ref
              .read(doichieuFlowProvider.notifier)
              .updateConfig(c.copyWith(treatEmptyAsSame: v)),
        ),
        _SwitchRow(
          value: c.treatDashAsEmpty,
          title: 'Coi "-" là ô trống',
          onChanged: (v) => ref
              .read(doichieuFlowProvider.notifier)
              .updateConfig(c.copyWith(treatDashAsEmpty: v)),
        ),
        _SwitchRow(
          value: c.treatNaAsEmpty,
          title: 'Coi N/A là ô trống',
          onChanged: (v) => ref
              .read(doichieuFlowProvider.notifier)
              .updateConfig(c.copyWith(treatNaAsEmpty: v)),
        ),
        _SwitchRow(
          value: c.normalizeNumbers,
          title: 'Chuẩn hóa số (1,250,000 / 1.250.000)',
          onChanged: (v) => ref
              .read(doichieuFlowProvider.notifier)
              .updateConfig(c.copyWith(normalizeNumbers: v)),
        ),
        _SwitchRow(
          value: c.normalizeDates,
          title: 'Chuẩn hóa ngày (dd/mm/yyyy ↔ yyyy/mm/dd)',
          onChanged: (v) => ref
              .read(doichieuFlowProvider.notifier)
              .updateConfig(c.copyWith(normalizeDates: v)),
        ),
        _SwitchRow(
          value: c.accountingNegative,
          title: 'Negative kế toán: -500 = (500)',
          onChanged: (v) => ref
              .read(doichieuFlowProvider.notifier)
              .updateConfig(c.copyWith(accountingNegative: v)),
        ),
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12.5));
  }
}

class _ChipsRow extends StatelessWidget {
  final List<String> options;
  final List<String> selected;
  final void Function(String col, bool on) onToggle;

  const _ChipsRow({required this.options, required this.selected, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    if (options.isEmpty) {
      return const Text('Chưa có cột — hãy chọn file trước',
          style: TextStyle(color: AppTheme.textMuted, fontSize: 12));
    }
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        for (final col in options)
          FilterChip(
            label: Text(col,
                style: const TextStyle(fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            selected: selected.contains(col),
            onSelected: (on) => onToggle(col, on),
          ),
      ],
    );
  }
}

class _SwitchRow extends StatelessWidget {
  final bool value;
  final String title;
  final ValueChanged<bool> onChanged;

  const _SwitchRow({required this.value, required this.title, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
Switch(value: value, onChanged: onChanged,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
        const SizedBox(width: 4),
        Expanded(
          child: Text(title,
              style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12.5)),
        ),
      ],
    );
  }
}