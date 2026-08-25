import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/db/database_service.dart';
import '../../../core/l10n/translations.dart';
import '../models/accounting_model.dart';

final _selectedYearProvider = StateProvider<int>((ref) => DateTime.now().year);
final _selectedMonthProvider = StateProvider<int>((ref) => DateTime.now().month);
final _entryTypeProvider = StateProvider<String>((ref) => 'SALARY');

final _accountsProvider = Provider<List<NhanSuAccount>>((ref) {
  final db = DatabaseService.instance;
  return db.getCollection('hs_accounts')
      .map((a) => NhanSuAccount.fromJson(a))
      .toList();
});

final _existingEntryProvider = Provider.autoDispose<NhanSuJournalEntry?>((ref) {
  final db = DatabaseService.instance;
  final year = ref.watch(_selectedYearProvider);
  final month = ref.watch(_selectedMonthProvider);
  final type = ref.watch(_entryTypeProvider);
  final entries = db.getCollection('hs_journal_entries');
  final match = entries.where((e) =>
      e['year'] == year &&
      e['month'] == month &&
      e['entryType'] == type &&
      e['isReversed'] != true).toList();
  if (match.isEmpty) return null;
  return NhanSuJournalEntry.fromJson(match.first);
});

class NhanSuGlJournalEntryScreen extends ConsumerWidget {
  const NhanSuGlJournalEntryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = ref.watch(_selectedYearProvider);
    final month = ref.watch(_selectedMonthProvider);
    final entryType = ref.watch(_entryTypeProvider);
    final existingEntry = ref.watch(_existingEntryProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('gl_journal_entry'.tr),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          _buildHeader(context, ref, year, month, entryType),
          if (existingEntry != null)
            _buildExistingBanner(context, ref, existingEntry)
          else
            Expanded(child: _buildNoEntryHint(ref)),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    WidgetRef ref,
    int year,
    int month,
    String entryType,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.surface,
      child: Column(
        children: [
          Row(
            children: [
              _MonthPicker(
                year: year,
                month: month,
                onYearChanged: (v) => ref.read(_selectedYearProvider.notifier).state = v,
                onMonthChanged: (v) => ref.read(_selectedMonthProvider.notifier).state = v,
              ),
              const Spacer(),
              _EntryTypeDropdown(
                value: entryType,
                onChanged: (v) => ref.read(_entryTypeProvider.notifier).state = v,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _ActionChip(
                icon: Icons.auto_awesome,
                label: 'auto_from_payslips'.tr,
                color: AppColors.primary,
                onTap: () => _generateFromPayslips(context, ref, year, month, entryType),
              ),
              const SizedBox(width: 8),
              _ActionChip(
                icon: Icons.add_circle_outline,
                label: 'manual_entry'.tr,
                color: AppColors.success,
                onTap: () => _showManualEntryDialog(context, ref, year, month, entryType),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExistingBanner(BuildContext context, WidgetRef ref, NhanSuJournalEntry entry) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.info.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: AppColors.info, size: 20),
                      const SizedBox(width: 8),
                      Text('existing_entry'.tr,
                          style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.info)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(entry.description,
                      style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                  const SizedBox(height: 4),
                  Text(
                    'DR: ${AppFormatters.formatCurrency(entry.totalDebit)} | CR: ${AppFormatters.formatCurrency(entry.totalCredit)}',
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _EntryLinesList(lines: entry.lines, accounts: ref.watch(_accountsProvider)),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _reverseEntry(context, ref, entry),
                    icon: const Icon(Icons.undo_rounded, size: 18),
                    label: Text('reverse_entry'.tr),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.danger,
                      side: const BorderSide(color: AppColors.danger),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoEntryHint(WidgetRef ref) {
    final entryType = ref.watch(_entryTypeProvider);
    final type = NhanSuEntryType.fromCode(entryType);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long_outlined, size: 48, color: AppColors.textMuted),
            const SizedBox(height: 16),
            Text('Chưa có bút toán ${type.label}',
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            Text('Nhấn "Tạo từ phiếu lương" hoặc "Nhập thủ công" ở trên',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
          ],
        ),
      ),
    );
  }

  void _generateFromPayslips(
    BuildContext context,
    WidgetRef ref,
    int year,
    int month,
    String entryType,
  ) {
    final db = DatabaseService.instance;
    final payrolls = db.getCollection('payrolls')
        .where((p) => p['year'] == year && p['month'] == month)
        .toList();

    if (payrolls.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no_payroll_for_period'.tr)),
      );
      return;
    }

    final accounts = ref.read(_accountsProvider);
    final accountMap = {for (var a in accounts) a.code: a};

    final lines = <NhanSuJournalLine>[];
    double totalSalary = 0;
    double totalBHXH = 0;
    double totalTax = 0;
    double totalNet = 0;

    for (final p in payrolls) {
      totalSalary += ((p['earnedBaseSalary'] as num?) ?? 0).toDouble();
      totalBHXH += ((p['deductions'] as Map<String, dynamic>?)?['BHXH'] as num?)?.toDouble() ??
          ((p['deductions'] as Map<String, dynamic>?)?['baoHiem'] as num?)?.toDouble() ?? 0;
      totalTax += ((p['deductions'] as Map<String, dynamic>?)?['Thuế TNCN'] as num?)?.toDouble() ??
          ((p['deductions'] as Map<String, dynamic>?)?['thueTNCN'] as num?)?.toDouble() ?? 0;
      totalNet += ((p['netSalary'] as num?) ?? 0).toDouble();
    }

    final bhxhEmployee = totalBHXH;
    final pit = totalTax;
    final netPay = totalNet;

    final desc = 'Chi phí lương T$month/$year (${payrolls.length} NV)';

    lines.add(NhanSuJournalLine(
      accountCode: '6422',
      accountName: accountMap['6422']?.name ?? 'Chi phí lương',
      debit: totalSalary,
      credit: 0,
      description: 'Tổng lương NSDLĐ',
    ));

    if (bhxhEmployee > 0) {
      lines.add(NhanSuJournalLine(
        accountCode: '334',
        accountName: accountMap['334']?.name ?? 'BHXH NLĐ',
        debit: 0,
        credit: bhxhEmployee,
        description: 'BHXH phần NLĐ đóng',
      ));
    }

    if (pit > 0) {
      lines.add(NhanSuJournalLine(
        accountCode: '3335',
        accountName: accountMap['3335']?.name ?? 'Thuế TNCN',
        debit: 0,
        credit: pit,
        description: 'Thuế TNCN tạm khấu trừ',
      ));
    }

    if (netPay > 0) {
      lines.add(NhanSuJournalLine(
        accountCode: '3341',
        accountName: accountMap['3341']?.name ?? 'Lương phải trả',
        debit: 0,
        credit: netPay,
        description: 'Lương NET phải trả cho NLĐ',
      ));
    }

    final entry = NhanSuJournalEntry(
      id: IdGenerator.generateId('JEN'),
      journalID: 'JEN-$entryType-$year-${month.toString().padLeft(2, '0')}',
      entryType: entryType,
      year: year,
      month: month,
      date: DateTime(year, month, DateTime(year, month + 1, 0).day),
      description: desc,
      lines: lines,
      isPosted: true,
    );

    db.saveItem('hs_journal_entries', entry.id, entry.toJson(), triggerSync: false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('entry_generated'.tr), backgroundColor: AppColors.success),
    );
  }

  void _showManualEntryDialog(
    BuildContext context,
    WidgetRef ref,
    int year,
    int month,
    String entryType,
  ) {
    final accounts = ref.read(_accountsProvider);
    final descCtrl = TextEditingController();
    final lines = <NhanSuJournalLine>[
      NhanSuJournalLine(accountCode: accounts.isNotEmpty ? accounts.first.code : ''),
      NhanSuJournalLine(accountCode: accounts.isNotEmpty ? accounts.first.code : ''),
    ];

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) {
          return AlertDialog(
            title: Text('manual_journal_entry'.tr),
            content: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: descCtrl,
                      decoration: InputDecoration(
                        labelText: 'description'.tr,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...lines.asMap().entries.map((entry) {
                      final i = entry.key;
                      final line = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: DropdownButtonFormField<String>(
                                value: line.accountCode.isNotEmpty ? line.accountCode : null,
                                items: accounts.map((a) => DropdownMenuItem(
                                  value: a.code,
                                  child: Text('${a.code} - ${a.name}',
                                      style: const TextStyle(fontSize: 12)),
                                )).toList(),
                                onChanged: (v) {
                                  setDialogState(() {
                                    lines[i] = lines[i].copyWith(accountCode: v ?? '');
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'account'.tr,
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'debit'.tr,
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                ),
                                onChanged: (v) {
                                  final amount = double.tryParse(v) ?? 0;
                                  setDialogState(() {
                                    lines[i] = lines[i].copyWith(debit: amount, credit: 0);
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'credit'.tr,
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                ),
                                onChanged: (v) {
                                  final amount = double.tryParse(v) ?? 0;
                                  setDialogState(() {
                                    lines[i] = lines[i].copyWith(credit: amount, debit: 0);
                                  });
                                },
                              ),
                            ),
                            if (i >= 2)
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline, color: AppColors.danger, size: 20),
                                onPressed: () => setDialogState(() => lines.removeAt(i)),
                              ),
                          ],
                        ),
                      );
                    }),
                    TextButton.icon(
                      onPressed: () => setDialogState(() {
                        lines.add(NhanSuJournalLine(
                          accountCode: accounts.isNotEmpty ? accounts.first.code : '',
                        ));
                      }),
                      icon: const Icon(Icons.add, size: 16),
                      label: Text('add_line'.tr),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: Text('cancel'.tr)),
              ElevatedButton(
                onPressed: () => _saveManualEntry(
                  context, ref, year, month, entryType, descCtrl.text, lines,
                ),
                child: Text('save'.tr),
              ),
            ],
          );
        },
      ),
    );
  }

  void _saveManualEntry(
    BuildContext context,
    WidgetRef ref,
    int year,
    int month,
    String entryType,
    String description,
    List<NhanSuJournalLine> lines,
  ) {
    if (description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('description_required'.tr)),
      );
      return;
    }

    final totalDr = lines.fold<double>(0, (s, l) => s + l.debit);
    final totalCr = lines.fold<double>(0, (s, l) => s + l.credit);
    if ((totalDr - totalCr).abs() > 0.01) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('entry_not_balanced'.tr)),
      );
      return;
    }

    final accounts = ref.read(_accountsProvider);
    final accountMap = {for (var a in accounts) a.code: a};
    final resolvedLines = lines.map((l) => l.copyWith(
      accountName: accountMap[l.accountCode]?.name ?? '',
    )).toList();

    final entry = NhanSuJournalEntry(
      id: IdGenerator.generateId('JEN'),
      journalID: 'JEN-$entryType-$year-${month.toString().padLeft(2, '0')}',
      entryType: entryType,
      year: year,
      month: month,
      date: DateTime(year, month, DateTime(year, month + 1, 0).day),
      description: description,
      lines: resolvedLines,
      isPosted: true,
    );

    final db = DatabaseService.instance;
    db.saveItem('hs_journal_entries', entry.id, entry.toJson(), triggerSync: false);

    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('entry_saved'.tr), backgroundColor: AppColors.success),
    );
  }

  void _reverseEntry(BuildContext context, WidgetRef ref, NhanSuJournalEntry entry) {
    final reversedLines = entry.lines.map((l) => NhanSuJournalLine(
      accountCode: l.accountCode,
      accountName: l.accountName,
      debit: l.credit,
      credit: l.debit,
      description: 'Đảo: ${l.description}',
    )).toList();

    final reversed = entry.copyWith(
      description: 'Đảo bút toán: ${entry.description}',
      lines: reversedLines,
      isPosted: true,
      isReversed: true,
    );

    final db = DatabaseService.instance;
    db.saveItem('hs_journal_entries', reversed.id, reversed.toJson(), triggerSync: false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('entry_reversed'.tr), backgroundColor: AppColors.warning),
    );
  }
}

class _MonthPicker extends StatelessWidget {
  final int year;
  final int month;
  final ValueChanged<int> onYearChanged;
  final ValueChanged<int> onMonthChanged;

  const _MonthPicker({
    required this.year,
    required this.month,
    required this.onYearChanged,
    required this.onMonthChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left_rounded, size: 20),
          onPressed: () {
            if (month == 1) {
              onYearChanged(year - 1);
              onMonthChanged(12);
            } else {
              onMonthChanged(month - 1);
            }
          },
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'T${month.toString().padLeft(2, '0')}/$year',
            style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary, fontSize: 13),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right_rounded, size: 20),
          onPressed: () {
            if (month == 12) {
              onYearChanged(year + 1);
              onMonthChanged(1);
            } else {
              onMonthChanged(month + 1);
            }
          },
        ),
      ],
    );
  }
}

class _EntryTypeDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const _EntryTypeDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButton<String>(
        value: value,
        underline: const SizedBox(),
        isDense: true,
        items: NhanSuEntryType.values.map((t) => DropdownMenuItem(
          value: t.code,
          child: Text(t.label, style: const TextStyle(fontSize: 12)),
        )).toList(),
        onChanged: (v) {
          if (v != null) onChanged(v);
        },
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionChip({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class _EntryLinesList extends StatelessWidget {
  final List<NhanSuJournalLine> lines;
  final List<NhanSuAccount> accounts;

  const _EntryLinesList({required this.lines, required this.accounts});

  @override
  Widget build(BuildContext context) {
    final accountMap = {for (var a in accounts) a.code: a};

    return ListView.separated(
      itemCount: lines.length,
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      itemBuilder: (context, index) {
        final line = lines[index];
        final account = accountMap[line.accountCode];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: line.isDebit
                      ? AppColors.success.withValues(alpha: 0.1)
                      : AppColors.danger.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  line.isDebit ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                  size: 18,
                  color: line.isDebit ? AppColors.success : AppColors.danger,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${line.accountCode} - ${account?.name ?? line.accountName}',
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    if (line.description.isNotEmpty)
                      Text(line.description,
                          style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                  ],
                ),
              ),
              Text(
                AppFormatters.formatCurrency(line.amount),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: line.isDebit ? AppColors.success : AppColors.danger,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
