import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_theme.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../models/accounting_entry.dart';
import '../../models/account.dart';
import 'payslip_screen.dart';

class AccountingScreen extends ConsumerStatefulWidget {
  const AccountingScreen({super.key});

  @override
  ConsumerState<AccountingScreen> createState() => _AccountingScreenState();
}

class _AccountingScreenState extends ConsumerState<AccountingScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selected = ref.watch(selectedMonthProvider);

    return Column(
      children: [
        Container(
          color: AppTheme.surface,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Row(
                  children: [
                    const Icon(Icons.account_balance, color: AppTheme.primaryBlue, size: 24),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text('Kế toán',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
                    ),
                    MonthPicker(
                      year: selected.year,
                      month: selected.month,
                      onPrev: () => ref.read(selectedMonthProvider.notifier).previousMonth(),
                      onNext: () => ref.read(selectedMonthProvider.notifier).nextMonth(),
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: _tabCtrl,
                labelColor: AppTheme.primaryBlue,
                unselectedLabelColor: AppTheme.textSecondary,
                indicatorColor: AppTheme.primaryBlue,
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Sổ cái GL'),
                  Tab(text: 'Nhập bút toán'),
                  Tab(text: 'Hệ thống TK'),
                  Tab(text: 'Phiếu lương'),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabCtrl,
            children: [
              _GlLedgerTab(),
              _GlEntryTab(),
              _ChartOfAccountsTab(),
              const PayslipScreen(),
            ],
          ),
        ),
      ],
    );
  }
}

// ═══════════════════ TAB 1: SỔ CÁI GL (HOA STYLE) ═══════════════════
class _GlLedgerTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedMonthProvider);
    final summaryAsync = ref.watch(accountingSummaryProvider(selected));
    final entriesAsync = ref.watch(entriesByMonthProvider(selected));

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          summaryAsync.when(
            data: (s) => Row(
              children: [
                _summaryCard('Bút toán', '${s['totalEntries']}', Icons.receipt_long, AppTheme.primaryBlue),
                const SizedBox(width: 8),
                _summaryCard('Đã HT', '${s['postedEntries']}', Icons.check_circle, AppTheme.success),
                const SizedBox(width: 8),
                _summaryCard('Nháp', '${s['draftEntries']}', Icons.edit_note, AppTheme.warning),
                const SizedBox(width: 8),
                _summaryCard('Nợ', _fmtMoney(s['totalDebit']), Icons.arrow_downward, AppTheme.danger),
                const SizedBox(width: 8),
                _summaryCard('Có', _fmtMoney(s['totalCredit']), Icons.arrow_upward, AppTheme.accent),
              ],
            ),
            loading: () => const SizedBox(height: 60, child: Center(child: CircularProgressIndicator())),
            error: (e, _) => Text('Lỗi: $e', style: const TextStyle(color: AppTheme.danger)),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: entriesAsync.when(
              data: (entries) {
                if (entries.isEmpty) {
                  return const Center(
                    child: Text('Chưa có bút toán tháng này',
                        style: TextStyle(color: AppTheme.textSecondary)),
                  );
                }
                final grouped = <String, AccountingEntry>{};
                final journalEntries = <String, List<AccountingEntry>>{};
                for (final e in entries) {
                  grouped.putIfAbsent(e.journalID, () => e);
                  journalEntries.putIfAbsent(e.journalID, () => []).add(e);
                }
                return ListView.separated(
                  itemCount: grouped.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 6),
                  itemBuilder: (context, i) {
                    final journalID = grouped.keys.elementAt(i);
                    final main = grouped[journalID]!;
                    return _GlJournalCard(journalID: journalID, entry: main);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _summaryCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        color: AppTheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 14, color: color),
                  const SizedBox(width: 4),
                  Text(label, style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
                ],
              ),
              const SizedBox(height: 2),
              Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlJournalCard extends ConsumerWidget {
  final String journalID;
  final AccountingEntry entry;

  const _GlJournalCard({required this.journalID, required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linesAsync = ref.watch(entryLinesProvider(journalID));
    final isPosted = entry.status == EntryStatus.posted;
    final color = isPosted ? AppTheme.success : AppTheme.warning;

    return Card(
      color: AppTheme.surface,
      child: ExpansionTile(
        leading: Icon(_entryIcon(entry.entryType), size: 20, color: color),
        title: Text(entry.voucherNumber,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.textPrimary)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entry.description ?? '', style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
            const SizedBox(height: 2),
            Row(
              children: [
                _statusChip(isPosted),
                const SizedBox(width: 8),
                Text('Nợ: ${_fmtMoney(entry.totalDebit)} / Có: ${_fmtMoney(entry.totalCredit)}',
                    style: const TextStyle(fontSize: 11, color: AppTheme.textPrimary)),
              ],
            ),
          ],
        ),
        children: [
          linesAsync.when(
            data: (lines) {
              if (lines.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Không có dòng chi tiết',
                      style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                );
              }
              final sorted = List<AccountingEntryLine>.from(lines)
                ..sort((a, b) => a.lineOrder.compareTo(b.lineOrder));
              return Column(
                children: [
                  _headerRow(),
                  ...sorted.map((l) => _lineRow(l)),
                  const SizedBox(height: 8),
                ],
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
            ),
            error: (e, _) => Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Lỗi: $e', style: const TextStyle(color: AppTheme.danger)),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _statusChip(bool isPosted) {
    final color = isPosted ? AppTheme.success : AppTheme.warning;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(isPosted ? 'Đã HT' : 'Nháp',
          style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w600)),
    );
  }

  static Widget _headerRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: AppTheme.bg800,
      child: const Row(
        children: [
          SizedBox(width: 24, child: Text('#', style: TextStyle(fontSize: 10, color: AppTheme.textSecondary, fontWeight: FontWeight.w600))),
          SizedBox(width: 8),
          Expanded(flex: 2, child: Text('TK Nợ', style: TextStyle(fontSize: 10, color: AppTheme.textSecondary, fontWeight: FontWeight.w600))),
          Expanded(flex: 2, child: Text('TK Có', style: TextStyle(fontSize: 10, color: AppTheme.textSecondary, fontWeight: FontWeight.w600))),
          Expanded(flex: 3, child: Text('Số tiền', style: TextStyle(fontSize: 10, color: AppTheme.textSecondary, fontWeight: FontWeight.w600))),
          Expanded(flex: 3, child: Text('Diễn giải', style: TextStyle(fontSize: 10, color: AppTheme.textSecondary, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }

  static Widget _lineRow(AccountingEntryLine l) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.borderColor, width: 0.5)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text('${l.lineOrder}', style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(l.debitAccountNumber.isEmpty ? '-' : l.debitAccountNumber,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: l.debitAccountNumber.isEmpty ? AppTheme.textMuted : AppTheme.danger)),
          ),
          Expanded(
            flex: 2,
            child: Text(l.creditAccountNumber.isEmpty ? '-' : l.creditAccountNumber,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: l.creditAccountNumber.isEmpty ? AppTheme.textMuted : AppTheme.accent)),
          ),
          Expanded(
            flex: 3,
            child: Text(_fmtMoney(l.amount), style: const TextStyle(fontSize: 12, color: AppTheme.textPrimary)),
          ),
          Expanded(
            flex: 3,
            child: Text(l.description ?? '',
                style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  static IconData _entryIcon(EntryType type) {
    switch (type) {
      case EntryType.salary: return Icons.account_balance_wallet;
      case EntryType.insurance: return Icons.health_and_safety;
      case EntryType.pit: return Icons.receipt;
      case EntryType.payment: return Icons.payments;
      case EntryType.advance: return Icons.money;
      case EntryType.bonus: return Icons.card_giftcard;
      case EntryType.adjustment: return Icons.tune;
      case EntryType.openingBalance: return Icons.account_balance_wallet_outlined;
      case EntryType.other: return Icons.receipt_long;
    }
  }
}

// ═══════════════════ TAB 2: NHẬP BÚT TOÁN ═══════════════════
class _GlEntryTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedMonthProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tạo bút toán kế toán',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
          const SizedBox(height: 4),
          const Text('Chọn loại bút toán hoặc nhập tay theo DR/CR',
              style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
          const SizedBox(height: 16),

          // Quick action cards
          _QuickActionRow(
            actions: [
              _QuickAction(
                icon: Icons.account_balance_wallet,
                label: 'Lương',
                color: AppTheme.primaryBlue,
                onTap: () => _openGlEntry(context, EntryType.salary, selected),
              ),
              _QuickAction(
                icon: Icons.health_and_safety,
                label: 'BHXH/BHYT',
                color: AppTheme.success,
                onTap: () => _openGlEntry(context, EntryType.insurance, selected),
              ),
              _QuickAction(
                icon: Icons.receipt,
                label: 'Thuế TNCN',
                color: AppTheme.warning,
                onTap: () => _openGlEntry(context, EntryType.pit, selected),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _QuickActionRow(
            actions: [
              _QuickAction(
                icon: Icons.payments,
                label: 'Chi tiền',
                color: AppTheme.accent,
                onTap: () => _openGlEntry(context, EntryType.payment, selected),
              ),
              _QuickAction(
                icon: Icons.card_giftcard,
                label: 'Thưởng',
                color: AppTheme.warning,
                onTap: () => _openGlEntry(context, EntryType.bonus, selected),
              ),
              _QuickAction(
                icon: Icons.money,
                label: 'Tạm ứng',
                color: AppTheme.danger,
                onTap: () => _openGlEntry(context, EntryType.advance, selected),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Manual entry button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => context.push('/accounting/new-entry'),
              icon: const Icon(Icons.edit, size: 18),
              label: const Text('Nhập tay DR/CR'),
            ),
          ),
          const SizedBox(height: 20),

          // Recent entries
          const Text('Bút toán gần đây',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
          const SizedBox(height: 8),
          Expanded(
            child: ref.watch(entriesByMonthProvider(selected)).when(
              data: (entries) {
                if (entries.isEmpty) {
                  return const Center(
                    child: Text('Chưa có bút toán', style: TextStyle(color: AppTheme.textSecondary)),
                  );
                }
                final recent = entries.take(10).toList();
                return ListView.separated(
                  itemCount: recent.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 4),
                  itemBuilder: (context, i) => _recentEntryRow(recent[i]),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
            ),
          ),
        ],
      ),
    );
  }

  void _openGlEntry(BuildContext context, EntryType type, SelectedMonth selected) {
    context.push('/accounting/gl-entry?type=${type.name}&year=${selected.year}&month=${selected.month}');
  }

  static Widget _recentEntryRow(AccountingEntry e) {
    final isPosted = e.status == EntryStatus.posted;
    final color = isPosted ? AppTheme.success : AppTheme.warning;
    return Card(
      color: AppTheme.surface,
      child: ListTile(
        dense: true,
        leading: Icon(_entryIcon(e.entryType), size: 18, color: color),
        title: Text(e.voucherNumber,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.textPrimary)),
        subtitle: Text(e.description ?? '', style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
        trailing: Text('${_fmtMoney(e.totalDebit)} ₫',
            style: const TextStyle(fontSize: 11, color: AppTheme.textPrimary)),
      ),
    );
  }

  static IconData _entryIcon(EntryType type) {
    switch (type) {
      case EntryType.salary: return Icons.account_balance_wallet;
      case EntryType.insurance: return Icons.health_and_safety;
      case EntryType.pit: return Icons.receipt;
      case EntryType.payment: return Icons.payments;
      case EntryType.advance: return Icons.money;
      case EntryType.bonus: return Icons.card_giftcard;
      case EntryType.adjustment: return Icons.tune;
      case EntryType.openingBalance: return Icons.account_balance_wallet_outlined;
      case EntryType.other: return Icons.receipt_long;
    }
  }
}

// ═══════════════════ TAB 3: HỆ THỐNG TÀI KHOẢN ═══════════════════
class _ChartOfAccountsTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(allAccountsProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Hệ thống tài khoản kế toán TT133',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
          const SizedBox(height: 4),
          const Text('Tài khoản theo Thông tư 133 / MISA SME 2023',
              style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
          const SizedBox(height: 12),
          Expanded(
            child: accountsAsync.when(
              data: (accounts) {
                if (accounts.isEmpty) {
                  return const Center(
                    child: Text('Chưa có tài khoản', style: TextStyle(color: AppTheme.textSecondary)),
                  );
                }
                final sorted = List<Account>.from(accounts)..sort((a, b) => a.accountNumber.compareTo(b.accountNumber));
                return ListView.separated(
                  itemCount: sorted.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final a = sorted[i];
                    final indent = (a.grade - 1) * 20.0;
                    final color = a.isParent ? AppTheme.primaryBlue : AppTheme.textPrimary;
                    return Padding(
                      padding: EdgeInsets.only(left: indent),
                      child: ListTile(
                        dense: true,
                        leading: Icon(
                          a.isParent ? Icons.folder : Icons.description,
                          size: 18,
                          color: a.isParent ? AppTheme.primaryBlue : AppTheme.textSecondary,
                        ),
                        title: Text('${a.accountNumber} - ${a.accountName}',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: a.isParent ? FontWeight.bold : FontWeight.normal,
                                color: color)),
                        subtitle: a.accountNameEnglish != null
                            ? Text(a.accountNameEnglish!, style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary))
                            : null,
                        trailing: a.inactive
                            ? const Icon(Icons.block, size: 16, color: AppTheme.danger)
                            : null,
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════ SHARED ═══════════════════
String _fmtMoney(double amount) {
  if (amount >= 1000000000) return '${(amount / 1000000000).toStringAsFixed(1)} tỷ';
  if (amount >= 1000000) return '${(amount / 1000000).toStringAsFixed(1)} tr';
  return amount.toStringAsFixed(0);
}

class _QuickAction {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickAction({required this.icon, required this.label, required this.color, required this.onTap});
}

class _QuickActionRow extends StatelessWidget {
  final List<_QuickAction> actions;

  const _QuickActionRow({required this.actions});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: actions.map((a) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Card(
            color: AppTheme.surface,
            child: InkWell(
              onTap: a.onTap,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Column(
                  children: [
                    Icon(a.icon, size: 24, color: a.color),
                    const SizedBox(height: 6),
                    Text(a.label,
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: a.color)),
                  ],
                ),
              ),
            ),
          ),
        ),
      )).toList(),
    );
  }
}
