import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/pawn_provider.dart';
import '../../models/pawn_contract.dart';
import '../../services/pawn_interest_calculator.dart';
import 'pawn_create_screen.dart';

class PawnListScreen extends ConsumerStatefulWidget {
  const PawnListScreen({super.key});

  @override
  ConsumerState<PawnListScreen> createState() => _PawnListScreenState();
}

class _PawnListScreenState extends ConsumerState<PawnListScreen> {
  String _filterStatus = 'all';

  @override
  Widget build(BuildContext context) {
    final pawnState = ref.watch(pawnProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hợp Đồng Cầm Đồ'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (v) => setState(() => _filterStatus = v),
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'all', child: Text('Tất cả')),
              const PopupMenuItem(value: 'active', child: Text('Đang cầm')),
              const PopupMenuItem(value: 'overdue', child: Text('Quá hạn')),
              const PopupMenuItem(value: 'redeemed', child: Text('Đã chuộc')),
              const PopupMenuItem(value: 'liquidated', child: Text('Đã thanh lý')),
            ],
          ),
        ],
      ),
      body: pawnState.when(
        data: (contracts) {
          final filtered = _filterStatus == 'all'
              ? contracts
              : contracts.where((c) => c.status.name == _filterStatus).toList();
          if (filtered.isEmpty) {
            return const Center(child: Text('Không có hợp đồng nào.'));
          }
          return ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) => _buildContractCard(filtered[index]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const PawnCreateScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildContractCard(PawnContract c) {
    final overdue = PawnInterestCalculator.overdueDays(c.dueDate ?? DateTime.now());
    final currentInterest = PawnInterestCalculator.currentInterest(contract: c);
    final redeemAmount = PawnInterestCalculator.redemptionAmount(contract: c);
    final daysLeft = c.dueDate != null ? c.dueDate!.difference(DateTime.now()).inDays : 0;

    Color statusColor;
    String statusLabel;
    switch (c.status) {
      case PawnStatus.active:
        statusColor = daysLeft < 0 ? Colors.orange : Colors.blue;
        statusLabel = daysLeft < 0 ? 'Quá hạn ${-daysLeft} ngày' : 'Còn $daysLeft ngày';
        break;
      case PawnStatus.overdue:
        statusColor = Colors.red;
        statusLabel = 'Quá hạn $overdue ngày';
        break;
      case PawnStatus.redeemed:
        statusColor = Colors.green;
        statusLabel = 'Đã chuộc';
        break;
      case PawnStatus.liquidated:
        statusColor = Colors.brown;
        statusLabel = 'Đã thanh lý';
        break;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.15),
          child: Icon(Icons.monetization_on, color: statusColor, size: 20),
        ),
        title: Text(
          c.contractNumber ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('KH: ${c.customer.value?.fullName ?? "?"} - ${c.description ?? ""}'),
            Row(
              children: [
                Chip(
                  label: Text(statusLabel, style: TextStyle(fontSize: 10, color: Colors.white)),
                  backgroundColor: statusColor,
                  padding: EdgeInsets.zero,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                const SizedBox(width: 8),
                Text(PawnInterestCalculator.formatVnd(c.pawnAmount ?? 0),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoRow('Tài sản', '${c.assetBrand ?? ""} ${c.assetModel ?? ""}'),
                _infoRow('IMEI', c.imei ?? '-'),
                _infoRow('Giá trị tài sản', PawnInterestCalculator.formatVnd(c.assetValue ?? 0)),
                _infoRow('Ngày cầm', PawnInterestCalculator.formatDate(c.pawnDate ?? DateTime.now())),
                _infoRow('Ngày đáo hạn', PawnInterestCalculator.formatDate(c.dueDate ?? DateTime.now())),
                _infoRow('Lãi suất', '${c.interestRate} ${c.interestType == InterestType.monthly ? "%/tháng" : c.interestType == InterestType.daily ? "%/ngày" : c.interestType == InterestType.fixedAmount ? "đ/Fix" : "%"}'),
                _infoRow('Tổng lãi hiện tại', PawnInterestCalculator.formatVnd(currentInterest)),
                _infoRow('Đã thu lãi', PawnInterestCalculator.formatVnd(c.paidInterest ?? 0)),
                _infoRow('Gia hạn lần', '${c.renewalCount ?? 0}'),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (c.status == PawnStatus.active || c.status == PawnStatus.overdue) ...[
                      _actionButton('Thu lãi', Icons.savings, Colors.green, () => _showCollectInterestDialog(c)),
                      _actionButton('Gia hạn', Icons.update, Colors.blue, () => _showExtendDialog(c)),
                      _actionButton('Chuộc', Icons.check_circle, Colors.teal, () => _showRedeemDialog(c, redeemAmount)),
                      _actionButton('Thanh lý', Icons.sell, Colors.brown, () => _showLiquidateDialog(c)),
                    ],
                    if (c.status == PawnStatus.redeemed || c.status == PawnStatus.liquidated)
                      Text(
                        c.status == PawnStatus.redeemed ? 'Đã tất toán' : 'Đã thanh lý',
                        style: TextStyle(color: Colors.grey[500], fontStyle: FontStyle.italic),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(width: 130, child: Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12))),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }

  Widget _actionButton(String label, IconData icon, Color color, VoidCallback onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: color, size: 20),
          onPressed: onTap,
          tooltip: label,
        ),
        Text(label, style: TextStyle(fontSize: 10, color: color)),
      ],
    );
  }

  void _showCollectInterestDialog(PawnContract c) {
    final current = PawnInterestCalculator.currentInterest(contract: c);
    final unpaid = current - (c.paidInterest ?? 0);
    final ctrl = TextEditingController(text: unpaid.clamp(0, double.infinity).toStringAsFixed(0));

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Thu Lãi'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('HĐ: ${c.contractNumber}'),
            Text('Lãi hiện tại: ${PawnInterestCalculator.formatVnd(current)}'),
            Text('Đã thu: ${PawnInterestCalculator.formatVnd(c.paidInterest ?? 0)}'),
            const Divider(),
            Text('Còn nợ: ${PawnInterestCalculator.formatVnd(unpaid.clamp(0, double.infinity))}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Số tiền thu', border: OutlineInputBorder()),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
          FilledButton(
            onPressed: () {
              final amount = double.tryParse(ctrl.text) ?? 0;
              if (amount > 0) {
                ref.read(pawnProvider.notifier).collectInterest(c.id, amount);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Đã thu lãi ${PawnInterestCalculator.formatVnd(amount)}')),
                );
              }
            },
            child: const Text('Thu'),
          ),
        ],
      ),
    );
  }

  void _showExtendDialog(PawnContract c) {
    int months = 1;
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Gia Hạn'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('HĐ: ${c.contractNumber}'),
              Text('Đáo hạn hiện tại: ${PawnInterestCalculator.formatDate(c.dueDate ?? DateTime.now())}'),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text('Số tháng gia hạn: '),
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: months > 1 ? () => setDialogState(() => months--) : null,
                  ),
                  Text('$months', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () => setDialogState(() => months++),
                  ),
                ],
              ),
              Text(
                'Ngày đáo hạn mới: ${PawnInterestCalculator.formatDate(PawnInterestCalculator.extendDueDate(c.dueDate ?? DateTime.now(), months))}',
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
            FilledButton(
              onPressed: () {
                ref.read(pawnProvider.notifier).extendContract(c.id, months);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Đã gia hạn $months tháng')),
                );
              },
              child: const Text('Gia hạn'),
            ),
          ],
        ),
      ),
    );
  }

  void _showRedeemDialog(PawnContract c, double amount) {
    final ctrl = TextEditingController(text: amount.toStringAsFixed(0));
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Chuộc Tài Sản'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('HĐ: ${c.contractNumber}'),
            Text('Gốc: ${PawnInterestCalculator.formatVnd(c.pawnAmount ?? 0)}'),
            Text('Lãi: ${PawnInterestCalculator.formatVnd(c.totalInterest ?? 0)}'),
            const Divider(),
            Text('Tổng phải thu: ${PawnInterestCalculator.formatVnd(amount)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Số tiền thu', border: OutlineInputBorder()),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              final paid = double.tryParse(ctrl.text) ?? 0;
              if (paid > 0) {
                ref.read(pawnProvider.notifier).redeemContract(c.id, paid);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã tất toán hợp đồng')),
                );
              }
            },
            child: const Text('Xác nhận chuộc'),
          ),
        ],
      ),
    );
  }

  void _showLiquidateDialog(PawnContract c) {
    final ctrl = TextEditingController(text: (c.assetValue ?? 0).toStringAsFixed(0));
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Thanh Lý Tài Sản'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('HĐ: ${c.contractNumber}'),
            Text('Tài sản: ${c.description ?? ""}'),
            Text('Gốc cầm: ${PawnInterestCalculator.formatVnd(c.pawnAmount ?? 0)}'),
            const SizedBox(height: 8),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Giá bán thanh lý', border: OutlineInputBorder()),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.brown),
            onPressed: () {
              final price = double.tryParse(ctrl.text) ?? 0;
              if (price > 0) {
                ref.read(pawnProvider.notifier).liquidateContract(c.id, price);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Đã thanh lý với giá ${PawnInterestCalculator.formatVnd(price)}')),
                );
              }
            },
            child: const Text('Xác nhận thanh lý'),
          ),
        ],
      ),
    );
  }
}
