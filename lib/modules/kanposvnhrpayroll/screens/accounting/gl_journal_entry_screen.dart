import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/app_theme.dart';
import '../../core/providers.dart';
import '../../models/accounting_entry.dart';
import '../../models/account.dart';
import '../../services/database_service.dart';

final _selectedYearProvider = StateProvider<int>((ref) => DateTime.now().year);
final _selectedMonthProvider = StateProvider<int>((ref) => DateTime.now().month);
final _entryTypeProvider = StateProvider<EntryType>((ref) => EntryType.salary);

final _existingEntryProvider = Provider.autoDispose<AccountingEntry?>((ref) {
  final year = ref.watch(_selectedYearProvider);
  final month = ref.watch(_selectedMonthProvider);
  final type = ref.watch(_entryTypeProvider);
  final entriesAsync = ref.watch(entriesByMonthProvider(SelectedMonth(year, month)));
  return entriesAsync.maybeWhen(
    data: (entries) {
      final match = entries.where((e) => e.entryType == type && e.status != EntryStatus.reversed).toList();
      if (match.isEmpty) return null;
      return match.first;
    },
    orElse: () => null,
  );
});

class GlJournalEntryScreen extends ConsumerStatefulWidget {
  final EntryType? initialType;
  final int? year;
  final int? month;

  const GlJournalEntryScreen({
    super.key,
    this.initialType,
    this.year,
    this.month,
  });

  @override
  ConsumerState<GlJournalEntryScreen> createState() => _GlJournalEntryScreenState();
}

class _GlJournalEntryScreenState extends ConsumerState<GlJournalEntryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialType != null) {
        ref.read(_entryTypeProvider.notifier).state = widget.initialType!;
      }
      if (widget.year != null) {
        ref.read(_selectedYearProvider.notifier).state = widget.year!;
      }
      if (widget.month != null) {
        ref.read(_selectedMonthProvider.notifier).state = widget.month!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final year = ref.watch(_selectedYearProvider);
    final month = ref.watch(_selectedMonthProvider);
    final entryType = ref.watch(_entryTypeProvider);
    final existingEntry = ref.watch(_existingEntryProvider);

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      appBar: AppBar(
        title: const Text('Nhập bút toán kế toán', style: TextStyle(color: AppTheme.textPrimary)),
        backgroundColor: AppTheme.surface,
        foregroundColor: AppTheme.textPrimary,
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
    EntryType entryType,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppTheme.surface,
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
                label: 'Tạo từ phiếu lương',
                color: AppTheme.primaryBlue,
                onTap: () => _generateFromPayslips(context, ref, year, month, entryType),
              ),
              const SizedBox(width: 8),
              _ActionChip(
                icon: Icons.add_circle_outline,
                label: 'Nhập thủ công',
                color: AppTheme.success,
                onTap: () => _showManualEntryDialog(context, ref, year, month, entryType),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExistingBanner(BuildContext context, WidgetRef ref, AccountingEntry entry) {
    final linesAsync = ref.watch(entryLinesProvider(entry.journalID));
    
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.primaryBlue.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.info_outline, color: AppTheme.primaryBlue, size: 20),
                      SizedBox(width: 8),
                      Text('Đã có bút toán',
                          style: TextStyle(fontWeight: FontWeight.w600, color: AppTheme.primaryBlue)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(entry.description ?? '',
                      style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary)),
                  const SizedBox(height: 4),
                  Text(
                    'DR: ${_fmtMoney(entry.totalDebit)} | CR: ${_fmtMoney(entry.totalCredit)}',
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: linesAsync.when(
                data: (lines) => _EntryLinesList(lines: lines, accounts: ref.watch(allAccountsProvider).value ?? []),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Lỗi: $e')),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _reverseEntry(context, ref, entry),
                    icon: const Icon(Icons.undo_rounded, size: 18),
                    label: const Text('Đảo bút toán'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.danger,
                      side: const BorderSide(color: AppTheme.danger),
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
    final label = _entryTypeLabel(entryType);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.receipt_long_outlined, size: 48, color: AppTheme.textMuted),
            const SizedBox(height: 16),
            Text('Chưa có bút toán $label',
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: AppTheme.textSecondary)),
            const SizedBox(height: 8),
            const Text('Nhấn "Tạo từ phiếu lương" hoặc "Nhập thủ công" ở trên',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: AppTheme.textMuted)),
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
    EntryType entryType,
  ) async {
    final db = DatabaseService.instance;
    final payrolls = await db.getPayrollByMonth(year, month);

    if (payrolls.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Không có bảng lương kỳ này')),
        );
      }
      return;
    }

    final lines = <AccountingEntryLine>[];
    double totalSalary = 0;
    double totalBHXH = 0;
    double totalTax = 0;
    double totalNet = 0;

    for (final p in payrolls) {
      totalSalary += p.earnedBaseSalary;
      totalBHXH += p.socialInsurance + p.healthInsurance + p.unemploymentInsurance;
      totalTax += p.personalIncomeTax;
      totalNet += p.netSalary;
    }

    final bhxhEmployee = totalBHXH;
    final pit = totalTax;
    final netPay = totalNet;

    final desc = 'Chi phí lương T$month/$year (${payrolls.length} NV)';
    final journalID = 'JEN-${entryType.name.toUpperCase()}-$year-${month.toString().padLeft(2, '0')}';

    lines.add(AccountingEntryLine()
      ..journalID = journalID
      ..lineOrder = 1
      ..debitAccountNumber = '6422'
      ..creditAccountNumber = ''
      ..amount = totalSalary
      ..description = 'Tổng lương NSDLĐ'
    );

    int order = 2;
    if (bhxhEmployee > 0) {
      lines.add(AccountingEntryLine()
        ..journalID = journalID
        ..lineOrder = order++
        ..debitAccountNumber = ''
        ..creditAccountNumber = '334'
        ..amount = bhxhEmployee
        ..description = 'BHXH phần NLĐ đóng'
      );
    }

    if (pit > 0) {
      lines.add(AccountingEntryLine()
        ..journalID = journalID
        ..lineOrder = order++
        ..debitAccountNumber = ''
        ..creditAccountNumber = '3335'
        ..amount = pit
        ..description = 'Thuế TNCN tạm khấu trừ'
      );
    }

    if (netPay > 0) {
      lines.add(AccountingEntryLine()
        ..journalID = journalID
        ..lineOrder = order++
        ..debitAccountNumber = ''
        ..creditAccountNumber = '334'
        ..amount = netPay
        ..description = 'Lương NET phải trả cho NLĐ'
      );
    }

    final entry = AccountingEntry()
      ..voucherNumber = 'VCH-${DateTime.now().millisecondsSinceEpoch}'
      ..journalID = journalID
      ..year = year
      ..month = month
      ..entryType = entryType
      ..status = EntryStatus.posted
      ..postingDate = DateTime(year, month, DateTime(year, month + 1, 0).day)
      ..documentDate = DateTime.now()
      ..description = desc
      ..totalDebit = lines.where((l) => l.debitAccountNumber.isNotEmpty).fold(0, (s, l) => s + l.amount)
      ..totalCredit = lines.where((l) => l.creditAccountNumber.isNotEmpty).fold(0, (s, l) => s + l.amount)
      ..isAutoGenerated = true;

    await db.saveAccountingEntry(entry);
    await db.saveAccountingEntryLines(lines);

    // Refresh UI
    ref.invalidate(entriesByMonthProvider(SelectedMonth(year, month)));

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tạo bút toán thành công'), backgroundColor: AppTheme.success),
      );
    }
  }

  void _showManualEntryDialog(
    BuildContext context,
    WidgetRef ref,
    int year,
    int month,
    EntryType entryType,
  ) {
    final accounts = ref.read(allAccountsProvider).value ?? [];
    final descCtrl = TextEditingController();
    
    // Simple mock lines for the dialog UI
    final List<Map<String, dynamic>> linesData = [
      {'account': accounts.isNotEmpty ? accounts.first.accountNumber : '', 'debit': 0.0, 'credit': 0.0},
      {'account': accounts.isNotEmpty ? accounts.first.accountNumber : '', 'debit': 0.0, 'credit': 0.0},
    ];

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) {
          return AlertDialog(
            title: const Text('Nhập bút toán thủ công'),
            content: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: descCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Diễn giải',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...linesData.asMap().entries.map((entry) {
                      final i = entry.key;
                      final line = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: DropdownButtonFormField<String>(
                                value: line['account'].isNotEmpty ? line['account'] : null,
                                items: accounts.map((a) => DropdownMenuItem(
                                  value: a.accountNumber,
                                  child: Text('${a.accountNumber} - ${a.accountName}',
                                      style: const TextStyle(fontSize: 12)),
                                )).toList(),
                                onChanged: (v) {
                                  setDialogState(() {
                                    linesData[i]['account'] = v ?? '';
                                  });
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Tài khoản',
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Nợ',
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                ),
                                onChanged: (v) {
                                  final amount = double.tryParse(v) ?? 0;
                                  setDialogState(() {
                                    linesData[i]['debit'] = amount;
                                    linesData[i]['credit'] = 0.0;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Có',
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                ),
                                onChanged: (v) {
                                  final amount = double.tryParse(v) ?? 0;
                                  setDialogState(() {
                                    linesData[i]['credit'] = amount;
                                    linesData[i]['debit'] = 0.0;
                                  });
                                },
                              ),
                            ),
                            if (i >= 2)
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline, color: AppTheme.danger, size: 20),
                                onPressed: () => setDialogState(() => linesData.removeAt(i)),
                              ),
                          ],
                        ),
                      );
                    }),
                    TextButton.icon(
                      onPressed: () => setDialogState(() {
                        linesData.add({
                          'account': accounts.isNotEmpty ? accounts.first.accountNumber : '',
                          'debit': 0.0,
                          'credit': 0.0,
                        });
                      }),
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Thêm dòng'),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
              ElevatedButton(
                onPressed: () => _saveManualEntry(
                  context, ref, year, month, entryType, descCtrl.text, linesData,
                ),
                child: const Text('Lưu'),
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
    EntryType entryType,
    String description,
    List<Map<String, dynamic>> linesData,
  ) async {
    if (description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cần nhập diễn giải')),
      );
      return;
    }

    final totalDr = linesData.fold<double>(0, (s, l) => s + (l['debit'] as double));
    final totalCr = linesData.fold<double>(0, (s, l) => s + (l['credit'] as double));
    if ((totalDr - totalCr).abs() > 0.01) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bút toán không cân bằng (Tổng Nợ != Tổng Có)')),
      );
      return;
    }

    final journalID = 'JEN-${entryType.name.toUpperCase()}-${DateTime.now().millisecondsSinceEpoch}';
    
    final lines = <AccountingEntryLine>[];
    for (int i = 0; i < linesData.length; i++) {
      final ld = linesData[i];
      final isDebit = (ld['debit'] as double) > 0;
      
      lines.add(AccountingEntryLine()
        ..journalID = journalID
        ..lineOrder = i + 1
        ..debitAccountNumber = isDebit ? ld['account'] : ''
        ..creditAccountNumber = !isDebit ? ld['account'] : ''
        ..amount = isDebit ? ld['debit'] : ld['credit']
        ..description = description
      );
    }

    final entry = AccountingEntry()
      ..voucherNumber = 'VCH-${DateTime.now().millisecondsSinceEpoch}'
      ..journalID = journalID
      ..year = year
      ..month = month
      ..entryType = entryType
      ..status = EntryStatus.posted
      ..postingDate = DateTime.now()
      ..documentDate = DateTime.now()
      ..description = description
      ..totalDebit = totalDr
      ..totalCredit = totalCr
      ..isAutoGenerated = false;

    final db = DatabaseService.instance;
    await db.saveAccountingEntry(entry);
    await db.saveAccountingEntryLines(lines);

    ref.invalidate(entriesByMonthProvider(SelectedMonth(year, month)));

    if (context.mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã lưu bút toán'), backgroundColor: AppTheme.success),
      );
    }
  }

  void _reverseEntry(BuildContext context, WidgetRef ref, AccountingEntry entry) async {
    final db = DatabaseService.instance;
    await db.reverseEntry(entry.id, 'User');
    
    ref.invalidate(entriesByMonthProvider(SelectedMonth(entry.year, entry.month)));

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã đảo bút toán'), backgroundColor: AppTheme.warning),
      );
    }
  }

  String _fmtMoney(double amount) {
    if (amount >= 1000000000) return '${(amount / 1000000000).toStringAsFixed(1)} tỷ';
    if (amount >= 1000000) return '${(amount / 1000000).toStringAsFixed(1)} tr';
    return amount.toStringAsFixed(0);
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
            color: AppTheme.primaryBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'T${month.toString().padLeft(2, '0')}/$year',
            style: const TextStyle(fontWeight: FontWeight.w600, color: AppTheme.primaryBlue, fontSize: 13),
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

String _entryTypeLabel(EntryType type) {
  switch (type) {
    case EntryType.salary: return 'Lương';
    case EntryType.insurance: return 'Bảo hiểm';
    case EntryType.pit: return 'Thuế TNCN';
    case EntryType.payment: return 'Chi tiền';
    case EntryType.advance: return 'Tạm ứng';
    case EntryType.bonus: return 'Thưởng';
    case EntryType.adjustment: return 'Điều chỉnh';
    case EntryType.openingBalance: return 'Số dư ĐK';
    case EntryType.other: return 'Khác';
  }
}

class _EntryTypeDropdown extends StatelessWidget {
  final EntryType value;
  final ValueChanged<EntryType> onChanged;

  const _EntryTypeDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.bg800,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: DropdownButton<EntryType>(
        value: value,
        underline: const SizedBox(),
        isDense: true,
        items: EntryType.values.map((t) => DropdownMenuItem(
          value: t,
          child: Text(_entryTypeLabel(t), style: const TextStyle(fontSize: 12)),
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
  final List<AccountingEntryLine> lines;
  final List<Account> accounts;

  const _EntryLinesList({required this.lines, required this.accounts});

  @override
  Widget build(BuildContext context) {
    final accountMap = {for (var a in accounts) a.accountNumber: a};

    return ListView.separated(
      itemCount: lines.length,
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      itemBuilder: (context, index) {
        final line = lines[index];
        final isDebit = line.debitAccountNumber.isNotEmpty;
        final accountNum = isDebit ? line.debitAccountNumber : line.creditAccountNumber;
        final account = accountMap[accountNum];
        
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.borderColor),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isDebit
                      ? AppTheme.success.withValues(alpha: 0.1)
                      : AppTheme.danger.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  isDebit ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                  size: 18,
                  color: isDebit ? AppTheme.success : AppTheme.danger,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$accountNum - ${account?.accountName ?? ''}',
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    if (line.description != null && line.description!.isNotEmpty)
                      Text(line.description!,
                          style: const TextStyle(fontSize: 11, color: AppTheme.textMuted)),
                  ],
                ),
              ),
              Text(
                '${(line.amount).toStringAsFixed(0)} ₫',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: isDebit ? AppTheme.success : AppTheme.danger,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
