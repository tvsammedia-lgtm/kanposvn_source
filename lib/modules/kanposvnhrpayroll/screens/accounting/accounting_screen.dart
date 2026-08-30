import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/app_theme.dart';
import '../../core/providers.dart';
import '../../models/accounting_entry.dart';
import '../../models/account.dart';
import 'gl_journal_entry_screen.dart';
import 'payslip_screen.dart';

final _selectedTabProvider = StateProvider<int>((ref) => 0);

class AccountingScreen extends ConsumerStatefulWidget {
  const AccountingScreen({super.key});

  @override
  ConsumerState<AccountingScreen> createState() => _AccountingScreenState();
}

class _AccountingScreenState extends ConsumerState<AccountingScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(_selectedTabProvider);

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: Column(
        children: [
          _buildTopBar(context, ref),
          _buildTabBar(ref, selectedTab),
          Expanded(
            child: [
              _GlLedgerTab(),
              _EntryInputTab(),
              _ChartOfAccountsTab(),
              const PayslipScreen(),
            ][selectedTab],
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedMonthProvider);
    final year = selected.year;
    final month = selected.month;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      color: AppTheme.surface,
      child: Row(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left_rounded, size: 20),
                onPressed: () => ref.read(selectedMonthProvider.notifier).previousMonth(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'T${month.toString().padLeft(2, '0')}/$year',
                  style: const TextStyle(fontWeight: FontWeight.w600, color: AppTheme.primaryBlue),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right_rounded, size: 20),
                onPressed: () => ref.read(selectedMonthProvider.notifier).nextMonth(),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const GlJournalEntryScreen()),
            ),
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('Thêm mới'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryBlue,
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
      color: AppTheme.surface,
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
                  color: isSelected ? AppTheme.primaryBlue.withValues(alpha: 0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 14, color: isSelected ? AppTheme.primaryBlue : AppTheme.textMuted),
                    const SizedBox(width: 4),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected ? AppTheme.primaryBlue : AppTheme.textMuted,
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
    final selected = ref.watch(selectedMonthProvider);
    final entriesAsync = ref.watch(entriesByMonthProvider(selected));

    return entriesAsync.when(
      data: (entries) {
        if (entries.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.book_outlined, size: 48, color: AppTheme.textMuted),
                SizedBox(height: 16),
                Text('Chưa có bút toán',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: AppTheme.textSecondary)),
              ],
            ),
          );
        }

        final grouped = <String, AccountingEntry>{};
        for (final e in entries) {
          grouped[e.journalID] = e;
        }
        final sorted = grouped.values.toList()
          ..sort((a, b) => b.postingDate.compareTo(a.postingDate));

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: sorted.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) => _GlEntryCard(entry: sorted[index]),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }
}

class _GlEntryCard extends ConsumerStatefulWidget {
  final AccountingEntry entry;

  const _GlEntryCard({required this.entry});

  @override
  ConsumerState<_GlEntryCard> createState() => _GlEntryCardState();
}

class _GlEntryCardState extends ConsumerState<_GlEntryCard> {
  bool _expanded = false;

  String _fmtMoney(double amount) {
    if (amount >= 1000000000) return '${(amount / 1000000000).toStringAsFixed(1)} tỷ';
    if (amount >= 1000000) return '${(amount / 1000000).toStringAsFixed(1)} tr';
    return amount.toStringAsFixed(0);
  }

  String _entryLabel(EntryType type) {
    switch (type) {
      case EntryType.salary: return 'LƯƠNG';
      case EntryType.insurance: return 'BHXH';
      case EntryType.pit: return 'TNCN';
      case EntryType.payment: return 'CHI TIỀN';
      case EntryType.advance: return 'TẠM ỨNG';
      case EntryType.bonus: return 'THƯỞNG';
      case EntryType.adjustment: return 'ĐIỀU CHỈNH';
      case EntryType.openingBalance: return 'SỐ DƯ ĐK';
      case EntryType.other: return 'KHÁC';
    }
  }

  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;
    final linesAsync = ref.watch(entryLinesProvider(entry.journalID));

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderColor),
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
                          color: AppTheme.primaryBlue.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(_entryLabel(entry.entryType),
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppTheme.primaryBlue)),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(entry.description ?? '',
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Icon(_expanded ? Icons.expand_less : Icons.expand_more,
                          size: 18, color: AppTheme.textMuted),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(entry.journalID,
                          style: const TextStyle(fontSize: 11, color: AppTheme.textMuted)),
                      const Spacer(),
                      Text(
                        'DR: ${_fmtMoney(entry.totalDebit)}',
                        style: const TextStyle(fontSize: 12, color: AppTheme.success, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'CR: ${_fmtMoney(entry.totalCredit)}',
                        style: const TextStyle(fontSize: 12, color: AppTheme.danger, fontWeight: FontWeight.w600),
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
                color: AppTheme.bg800,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              padding: const EdgeInsets.all(12),
              child: linesAsync.when(
                data: (lines) {
                  return Column(
                    children: lines.map((line) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: line.debitAccountNumber.isNotEmpty ? AppTheme.success : AppTheme.danger,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              line.debitAccountNumber.isNotEmpty 
                                  ? 'Nợ ${line.debitAccountNumber}' 
                                  : 'Có ${line.creditAccountNumber}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          if (line.debitAccountNumber.isNotEmpty)
                            Text(_fmtMoney(line.amount),
                                style: const TextStyle(fontSize: 12, color: AppTheme.success, fontWeight: FontWeight.w600)),
                          if (line.creditAccountNumber.isNotEmpty)
                            Text(_fmtMoney(line.amount),
                                style: const TextStyle(fontSize: 12, color: AppTheme.danger, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    )).toList(),
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))),
                ),
                error: (e, _) => Text('Lỗi: $e', style: const TextStyle(fontSize: 12, color: AppTheme.danger)),
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
            title: 'Tạo bút toán tự động',
            subtitle: 'Tạo bút toán lương, thuế từ phiếu lương',
            color: AppTheme.primaryBlue,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const GlJournalEntryScreen(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _QuickActionCard(
            icon: Icons.edit_note_rounded,
            title: 'Nhập bút toán thủ công',
            subtitle: 'Tự nhập các tài khoản Nợ/Có',
            color: AppTheme.success,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const GlJournalEntryScreen(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _QuickActionCard(
            icon: Icons.undo_rounded,
            title: 'Đảo bút toán',
            subtitle: 'Hủy/đảo bút toán đã ghi sổ',
            color: AppTheme.warning,
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
    final accountsAsync = ref.watch(allAccountsProvider);

    return accountsAsync.when(
      data: (accounts) {
        if (accounts.isEmpty) {
          return const Center(child: Text('Chưa có tài khoản'));
        }

        final grouped = <String, List<Account>>{};
        for (final a in accounts) {
          final group = a.accountNumber.substring(0, 1);
          grouped.putIfAbsent(group, () => []).add(a);
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
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      groupLabels[group] ?? 'Nhóm $group',
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: AppTheme.primaryBlue),
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
                            color: AppTheme.textMuted.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(a.accountNumber.substring(0, 1),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.textPrimary)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(a.accountNumber, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                              Text(a.accountName,
                                  style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
                            ],
                          ),
                        ),
                        Icon(
                          a.inactive ? Icons.cancel : Icons.check_circle,
                          size: 16,
                          color: a.inactive ? AppTheme.danger : AppTheme.success,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
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
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderColor),
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
                      style: const TextStyle(fontSize: 11, color: AppTheme.textMuted)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppTheme.textMuted, size: 20),
          ],
        ),
      ),
    );
  }
}
