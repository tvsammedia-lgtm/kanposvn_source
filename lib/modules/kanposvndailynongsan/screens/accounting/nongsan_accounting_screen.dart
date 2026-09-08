import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/nongsan_accounting.dart';
import '../../providers/nongsan_providers.dart';
import 'nongsan_journal_entry_screen.dart';

/// Tab "Kế toán" của KanPosVN Kinh doanh Nông sản — port từ kanposvnhrpayroll
/// (AccountingScreen) thích nghi với dữ liệu nông sản:
/// - Sổ cái GL: danh sách bút toán theo chứng từ (§18, §49).
/// - Nhập bút toán: ghi bút toán thủ công cân bằng (§18.1).
/// - Hệ thống TK: danh mục tài khoản TT133 kèm phát sinh Nợ/Có.
const _accent = Color(0xFF16A34A);

final _nongSanAcctTabProvider = StateProvider<int>((ref) => 0);

class NongSanAccountingScreen extends ConsumerWidget {
  const NongSanAccountingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(_nongSanAcctTabProvider);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          _buildTopBar(context, ref),
          _buildTabBar(ref, selectedTab),
          Expanded(
            child: [
              const _GlLedgerTab(),
              const _EntryInputTab(),
              const _ChartOfAccountsTab(),
            ][selectedTab],
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      color: Colors.white,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kế toán',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w700)),
              const Text('Sổ kế toán theo Chế độ kế toán DN (TT133)',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const NongSanJournalEntryScreen()),
            ),
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('Thêm bút toán'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _accent,
              foregroundColor: Colors.white,
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
    ];

    return Container(
      height: 44,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final i = entry.key;
          final (label, icon) = entry.value;
          final isSelected = selectedTab == i;

          return Expanded(
            child: GestureDetector(
              onTap: () => ref.read(_nongSanAcctTabProvider.notifier).state = i,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected
                      ? _accent.withValues(alpha: 0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon,
                        size: 14,
                        color: isSelected ? _accent : Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected ? _accent : Colors.grey,
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
  const _GlLedgerTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journalsAsync = ref.watch(nongsanJournalsProvider);

    return journalsAsync.when(
      data: (entries) {
        if (entries.isEmpty) {
          return const Center(
            child: Text('Chưa có bút toán nào trong sổ.',
                style: TextStyle(color: Colors.grey)),
          );
        }
        final sorted = [...entries]
          ..sort((a, b) => b.entryNumber.compareTo(a.entryNumber));

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: sorted.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) =>
              _GlEntryCard(entry: sorted[index]),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }
}

class _GlEntryCard extends StatefulWidget {
  final NongSanJournalEntry entry;

  const _GlEntryCard({required this.entry});

  @override
  State<_GlEntryCard> createState() => _GlEntryCardState();
}

class _GlEntryCardState extends State<_GlEntryCard> {
  bool _expanded = false;

  String _fmtMoney(double amount) {
    if (amount.abs() >= 1000000000) {
      return '${(amount / 1000000000).toStringAsFixed(1)} tỷ';
    }
    if (amount.abs() >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(1)} tr';
    }
    return amount.toStringAsFixed(0);
  }

  String _refLabel(String refType) => switch (refType) {
        'PURCHASE' => 'MUA HÀNG',
        'SALE' => 'BÁN HÀNG',
        'COGS' => 'GIÁ VỐN',
        'RECEIPT' => 'THU TIỀN',
        'PAYMENT' => 'CHI TIỀN',
        'EXPENSE' => 'CHI PHÍ',
        'RETURN' => 'TRẢ HÀNG',
        'MANUAL' => 'THỦ CÔNG',
        _ => refType,
      };

  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'BT${entry.entryNumber.toString().padLeft(3, '0')}',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: _accent),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.narration,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${_refLabel(entry.refType)} · '
                          '${entry.entryDate.day.toString().padLeft(2, '0')}/'
                          '${entry.entryDate.month.toString().padLeft(2, '0')}/'
                          '${entry.entryDate.year}',
                          style: const TextStyle(
                              fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'DR ${_fmtMoney(entry.totalDebit)}',
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF16A34A),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  Icon(_expanded ? Icons.expand_less : Icons.expand_more,
                      size: 18, color: Colors.grey),
                ],
              ),
            ),
          ),
          if (_expanded)
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  for (final line in entry.lines)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: line.debit > 0
                                  ? const Color(0xFF16A34A)
                                  : const Color(0xFFEF4444),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '${line.accountCode} · '
                              '${line.accountName.isNotEmpty ? line.accountName : NongSanJournalEntry.accountNameOf(line.accountCode)}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          if (line.debit > 0)
                            Text('Nợ ${_fmtMoney(line.debit)}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF16A34A),
                                    fontWeight: FontWeight.w600)),
                          if (line.credit > 0)
                            Text('Có ${_fmtMoney(line.credit)}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFEF4444),
                                    fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  const Divider(height: 12),
                  Text('Tổng: Nợ ${_fmtMoney(entry.totalDebit)} = '
                      'Có ${_fmtMoney(entry.totalCredit)}',
                      style:
                          const TextStyle(fontSize: 11, color: Colors.blueGrey)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _EntryInputTab extends ConsumerWidget {
  const _EntryInputTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _QuickActionCard(
            icon: Icons.edit_note_rounded,
            title: 'Nhập bút toán thủ công',
            subtitle: 'Tự nhập các tài khoản Nợ/Có, bắt buộc cân bằng (§18.1)',
            color: const Color(0xFF16A34A),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const NongSanJournalEntryScreen()),
            ),
          ),
          const SizedBox(height: 12),
          const _QuickActionCard(
            icon: Icons.auto_awesome_rounded,
            title: 'Bút toán tự động từ nghiệp vụ',
            subtitle:
                'Mua hàng, bán hàng, thu/chi tiền, chi phí được ghi sổ tự động',
            color: Color(0xFFF59E0B),
            onTap: null,
          ),
          const SizedBox(height: 12),
          const Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Sơ đồ kế toán Nông sản:\n'
                '- Mua hàng: 156 · 133 / 331\n'
                '- Bán hàng: 111/131 / 511 · 333; song song 632 / 156\n'
                '- Thu/chi tiền, chi phí bán hàng (641) & QLDN (642).',
                style: TextStyle(fontSize: 13, height: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartOfAccountsTab extends ConsumerWidget {
  const _ChartOfAccountsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journalsAsync = ref.watch(nongsanJournalsProvider);

    return journalsAsync.when(
      data: (entries) {
        final byCode = <String, ({double debit, double credit})>{};
        for (final e in entries) {
          for (final l in e.lines) {
            final cur = byCode[l.accountCode] ?? (debit: 0.0, credit: 0.0);
            byCode[l.accountCode] =
                (debit: cur.debit + l.debit, credit: cur.credit + l.credit);
          }
        }

        final accounts = NongSanJournalEntry.defaultAccounts;
        final groups = <String, List<String>>{
          for (final code in accounts) code.substring(0, 1): <String>[],
        };
        for (final code in accounts) {
          groups[code.substring(0, 1)]!.add(code);
        }
        final groupLabels = {
          '1': 'Tài sản (1xxx)',
          '3': 'Nợ phải trả (3xxx)',
          '5': 'Doanh thu (5xxx)',
          '6': 'Chi phí (6xxx)',
          '7': 'Thuế & Kết quả KD (7xxx)',
          '4': 'Doanh thu (4xxx)',
          '2': 'Nợ phải thu (2xxx)',
        };

        if (accounts.isEmpty) {
          return const Center(
              child: Text('Chưa có tài khoản', style: TextStyle(color: Colors.grey)));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: groups.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final group = groups.keys.elementAt(index);
            final codes = groups[group]!;
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      groupLabels[group] ?? 'Nhóm $group',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: _accent),
                    ),
                  ),
                  const Divider(height: 1),
                  for (final code in codes)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: _accent.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(code.substring(0, 1),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: _accent)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(code,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12)),
                                Text(
                                  NongSanJournalEntry.accountNameOf(code),
                                  style: const TextStyle(
                                      fontSize: 11, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('Nợ ${_fmtShort(byCode[code]?.debit ?? 0)}',
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF16A34A))),
                          const SizedBox(width: 8),
                          Text('Có ${_fmtShort(byCode[code]?.credit ?? 0)}',
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFFEF4444))),
                        ],
                      ),
                    ),
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

  String _fmtShort(double amount) {
    if (amount.abs() >= 1000000000) {
      return '${(amount / 1000000000).toStringAsFixed(1)} tỷ';
    }
    if (amount.abs() >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(1)} tr';
    }
    return amount.toStringAsFixed(0);
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback? onTap;

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
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
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
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }
}