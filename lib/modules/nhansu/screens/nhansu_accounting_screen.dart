import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/common_widgets.dart';
import '../../../core/db/database_service.dart';
import '../../../core/l10n/translations.dart';
import '../models/accounting_model.dart';
import 'nhansu_gl_journal_entry_screen.dart';

final _selectedYearProvider = StateProvider<int>((ref) => DateTime.now().year);
final _selectedMonthProvider = StateProvider<int>((ref) => DateTime.now().month);
final _selectedTabProvider = StateProvider<int>((ref) => 0);

final _accountsProvider = Provider<List<NhanSuAccount>>((ref) {
  final db = DatabaseService.instance;
  return db.getCollection('hs_accounts')
      .map((a) => NhanSuAccount.fromJson(a))
      .toList();
});

final _journalEntriesProvider = Provider<List<NhanSuJournalEntry>>((ref) {
  final db = DatabaseService.instance;
  return db.getCollection('hs_journal_entries')
      .map((e) => NhanSuJournalEntry.fromJson(e))
      .toList();
});

final _filteredEntriesProvider = Provider<List<NhanSuJournalEntry>>((ref) {
  final all = ref.watch(_journalEntriesProvider);
  final year = ref.watch(_selectedYearProvider);
  final month = ref.watch(_selectedMonthProvider);
  return all.where((e) =>
      e.year == year &&
      e.month == month &&
      !e.isReversed).toList();
});

class NhanSuAccountingScreen extends ConsumerStatefulWidget {
  const NhanSuAccountingScreen({super.key});

  @override
  ConsumerState<NhanSuAccountingScreen> createState() => _NhanSuAccountingScreenState();
}

class _NhanSuAccountingScreenState extends ConsumerState<NhanSuAccountingScreen> {
  @override
  void initState() {
    super.initState();
    _seedAccountsIfNeeded();
  }

  void _seedAccountsIfNeeded() {
    final db = DatabaseService.instance;
    if (db.getCollection('hs_accounts').isEmpty) {
      _seedAccounts(db);
    }
  }

  void _seedAccounts(DatabaseService db) {
    final accounts = [
      NhanSuAccount(id: 'ACC-001', code: '111', name: 'Tiền mặt', group: '1', isDebit: true),
      NhanSuAccount(id: 'ACC-002', code: '112', name: 'Tiền gửi ngân hàng', group: '1', isDebit: true),
      NhanSuAccount(id: 'ACC-003', code: '1121', name: 'Tiền gửi thanh toán', group: '1', isDebit: true),
      NhanSuAccount(id: 'ACC-004', code: '141', name: 'Hàng hóa', group: '1', isDebit: true),
      NhanSuAccount(id: 'ACC-005', code: '1411', name: 'Nguyên vật liệu', group: '1', isDebit: true),
      NhanSuAccount(id: 'ACC-006', code: '3331', name: 'Thuế GTGT được khấu trừ', group: '3', isDebit: false),
      NhanSuAccount(id: 'ACC-007', code: '3332', name: 'Thuế GTGT phải nộp', group: '3', isDebit: false),
      NhanSuAccount(id: 'ACC-008', code: '3335', name: 'Thuế TNCN phải nộp', group: '3', isDebit: false),
      NhanSuAccount(id: 'ACC-009', code: '334', name: 'BHXH, BHYT, BHTN phải nộp', group: '3', isDebit: false),
      NhanSuAccount(id: 'ACC-010', code: '3341', name: 'Lương phải trả', group: '3', isDebit: false),
      NhanSuAccount(id: 'ACC-011', code: '3342', name: 'Phúc lợi phải trả', group: '3', isDebit: false),
      NhanSuAccount(id: 'ACC-012', code: '3382', name: 'BHXH NSDLĐ phải nộp', group: '3', isDebit: false),
      NhanSuAccount(id: 'ACC-013', code: '3383', name: 'BHYT NSDLĐ phải nộp', group: '3', isDebit: false),
      NhanSuAccount(id: 'ACC-014', code: '3384', name: 'BHTN NSDLĐ phải nộp', group: '3', isDebit: false),
      NhanSuAccount(id: 'ACC-015', code: '3385', name: 'KPCĐ NSDLĐ phải nộp', group: '3', isDebit: false),
      NhanSuAccount(id: 'ACC-016', code: '6422', name: 'Chi phí lương NSDLĐ', group: '6', isDebit: true),
      NhanSuAccount(id: 'ACC-017', code: '6423', name: 'Chi phí phúc lợi NSDLĐ', group: '6', isDebit: true),
      NhanSuAccount(id: 'ACC-018', code: '6424', name: 'Chi phí BHXH NSDLĐ', group: '6', isDebit: true),
      NhanSuAccount(id: 'ACC-019', code: '6426', name: 'Chi phí công đoàn', group: '6', isDebit: true),
      NhanSuAccount(id: 'ACC-020', code: '6428', name: 'Chi phí khác cho NLĐ', group: '6', isDebit: true),
    ];

    for (final acc in accounts) {
      db.saveItem('hs_accounts', acc.id, acc.toJson(), triggerSync: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(_selectedTabProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildTopBar(context, ref),
          _buildTabBar(ref, selectedTab),
          Expanded(
            child: [
              _GlLedgerTab(),
              _EntryInputTab(),
              _ChartOfAccountsTab(),
              _PayslipTab(),
            ][selectedTab],
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, WidgetRef ref) {
    final year = ref.watch(_selectedYearProvider);
    final month = ref.watch(_selectedMonthProvider);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      color: AppColors.surface,
      child: Row(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left_rounded, size: 20),
                onPressed: () {
                  if (month == 1) {
                    ref.read(_selectedYearProvider.notifier).state = year - 1;
                    ref.read(_selectedMonthProvider.notifier).state = 12;
                  } else {
                    ref.read(_selectedMonthProvider.notifier).state = month - 1;
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
                  style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right_rounded, size: 20),
                onPressed: () {
                  if (month == 12) {
                    ref.read(_selectedYearProvider.notifier).state = year + 1;
                    ref.read(_selectedMonthProvider.notifier).state = 1;
                  } else {
                    ref.read(_selectedMonthProvider.notifier).state = month + 1;
                  }
                },
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const NhanSuGlJournalEntryScreen()),
            ),
            icon: const Icon(Icons.add_rounded, size: 18),
            label: Text('new_entry'.tr),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(WidgetRef ref, int selectedTab) {
    final tabs = [
      ('Sổ cái GL', Icons.book_rounded),
      ('Nhập bút toán', Icons.edit_note_rounded),
      ('Hệ thống TK', Icons.account_tree_rounded),
      ('Phiếu lương', Icons.receipt_long_rounded),
    ];

    return Container(
      height: 44,
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final i = entry.key;
          final (label, icon) = entry.value;
          final isSelected = selectedTab == i;

          return Expanded(
            child: GestureDetector(
              onTap: () => ref.read(_selectedTabProvider.notifier).state = i,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 14, color: isSelected ? AppColors.primary : AppColors.textMuted),
                    const SizedBox(width: 4),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected ? AppColors.primary : AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _GlLedgerTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(_filteredEntriesProvider);

    if (entries.isEmpty) {
      return EmptyState(
        icon: Icons.book_outlined,
        title: 'no_entries'.tr,
        subtitle: 'click_new_entry'.tr,
      );
    }

    final grouped = <String, NhanSuJournalEntry>{};
    for (final e in entries) {
      grouped[e.journalID] = e;
    }
    final sorted = grouped.values.toList()
      ..sort((a, b) => b.date.compareTo(a.date));

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: sorted.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) => _GlEntryCard(entry: sorted[index]),
    );
  }
}

class _GlEntryCard extends StatefulWidget {
  final NhanSuJournalEntry entry;

  const _GlEntryCard({required this.entry});

  @override
  State<_GlEntryCard> createState() => _GlEntryCardState();
}

class _GlEntryCardState extends State<_GlEntryCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;
    final type = NhanSuEntryType.fromCode(entry.entryType);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.info.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(type.label,
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.info)),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(entry.description,
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Icon(_expanded ? Icons.expand_less : Icons.expand_more,
                          size: 18, color: AppColors.textMuted),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(entry.journalID,
                          style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                      const Spacer(),
                      Text(
                        'DR: ${AppFormatters.formatCurrency(entry.totalDebit)}',
                        style: const TextStyle(fontSize: 12, color: AppColors.success, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'CR: ${AppFormatters.formatCurrency(entry.totalCredit)}',
                        style: const TextStyle(fontSize: 12, color: AppColors.danger, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (_expanded)
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceAlt,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: entry.lines.map((line) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: line.isDebit ? AppColors.success : AppColors.danger,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${line.accountCode} ${line.accountName}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      if (line.debit > 0)
                        Text(AppFormatters.formatCurrency(line.debit),
                            style: const TextStyle(fontSize: 12, color: AppColors.success, fontWeight: FontWeight.w600)),
                      if (line.credit > 0)
                        Text(AppFormatters.formatCurrency(line.credit),
                            style: const TextStyle(fontSize: 12, color: AppColors.danger, fontWeight: FontWeight.w600)),
                    ],
                  ),
                )).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class _EntryInputTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _QuickActionCard(
            icon: Icons.calculate_rounded,
            title: 'generate_salary_entry'.tr,
            subtitle: 'generate_salary_entry_desc'.tr,
            color: AppColors.primary,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const NhanSuGlJournalEntryScreen(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _QuickActionCard(
            icon: Icons.edit_note_rounded,
            title: 'manual_gl_entry'.tr,
            subtitle: 'manual_gl_entry_desc'.tr,
            color: AppColors.success,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const NhanSuGlJournalEntryScreen(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _QuickActionCard(
            icon: Icons.undo_rounded,
            title: 'reverse_entry'.tr,
            subtitle: 'reverse_entry_desc'.tr,
            color: AppColors.warning,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _ChartOfAccountsTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(_accountsProvider);

    if (accounts.isEmpty) {
      return const EmptyState(
        icon: Icons.account_tree_outlined,
        title: 'Chưa có tài khoản',
        subtitle: 'Hệ thống tài khoản sẽ được tự động tạo',
      );
    }

    final grouped = <String, List<NhanSuAccount>>{};
    for (final a in accounts) {
      grouped.putIfAbsent(a.group, () => []).add(a);
    }

    final groupLabels = {
      '1': 'Tài sản (1xxx)',
      '2': 'Nợ phải thu (2xxx)',
      '3': 'Nợ phải trả (3xxx)',
      '4': 'Doanh thu (4xxx)',
      '5': 'Vốn (5xxx)',
      '6': 'Chi phí (6xxx)',
      '7': 'Thuế & Kết quả KD (7xxx)',
    };

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: grouped.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final group = grouped.keys.elementAt(index);
        final items = grouped[group]!;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  groupLabels[group] ?? 'Nhóm $group',
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.primary),
                ),
              ),
              const Divider(height: 1),
              ...items.map((a) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: a.isDebit
                            ? AppColors.success.withValues(alpha: 0.1)
                            : AppColors.danger.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(a.code.substring(0, 1),
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: a.isDebit ? AppColors.success : AppColors.danger)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(a.code, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                          Text(a.name,
                              style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                        ],
                      ),
                    ),
                    Icon(
                      a.isActive ? Icons.check_circle : Icons.cancel,
                      size: 16,
                      color: a.isActive ? AppColors.success : AppColors.danger,
                    ),
                  ],
                ),
              )),
            ],
          ),
        );
      },
    );
  }
}

class _PayslipTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseService.instance;
    final year = ref.watch(_selectedYearProvider);
    final month = ref.watch(_selectedMonthProvider);
    final payrolls = db.getCollection('payrolls')
        .where((p) => p['year'] == year && p['month'] == month)
        .toList();

    if (payrolls.isEmpty) {
      return EmptyState(
        icon: Icons.receipt_long_outlined,
        title: 'no_payslips'.tr,
        subtitle: 'generate_payroll_first'.tr,
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: payrolls.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final p = payrolls[index];
        final name = (p['employeeName'] as String?) ?? '';
        final code = (p['employeeCode'] as String?) ?? '';
        final net = ((p['netSalary'] as num?) ?? 0).toDouble();
        final status = (p['status'] as String?) ?? 'draft';

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.person_rounded, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                        const SizedBox(width: 8),
                        StatusBadge(
                          label: status == 'paid' ? 'paid'.tr : 'draft'.tr,
                          color: status == 'paid' ? AppColors.success : AppColors.warning,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(code, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                  ],
                ),
              ),
              Text(
                AppFormatters.formatCurrency(net),
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.primary),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: AppColors.textMuted, size: 20),
          ],
        ),
      ),
    );
  }
}
