import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/sale.dart';
import '../providers/tramxang_providers.dart';
import '../services/tramxang_isar_service.dart';

/// Quản lý ca bán hàng: mở ca, theo dõi doanh thu theo ca và đóng ca
/// với số tiền mặt thực tế (chênh lệch SHORT / OVER / BALANCED).
class TramXangShiftScreen extends ConsumerStatefulWidget {
  const TramXangShiftScreen({super.key});

  @override
  ConsumerState<TramXangShiftScreen> createState() => _TramXangShiftScreenState();
}

class _TramXangShiftScreenState extends ConsumerState<TramXangShiftScreen> {
  final TextEditingController _openingCashController = TextEditingController();
  final TextEditingController _actualCashController = TextEditingController();
  bool _submitting = false;

  String _money(double v) {
    return v.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.');
  }

  @override
  void dispose() {
    _openingCashController.dispose();
    _actualCashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeShift = ref.watch(tramXangActiveShiftProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Quản Lý Ca Bán Hàng')),
      body: activeShift == null
          ? _buildOpenShiftView()
          : _buildActiveShiftView(activeShift),
    );
  }

  Widget _buildOpenShiftView() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock_clock, size: 72, color: Colors.grey),
                  const SizedBox(height: 12),
                  const Text('Hiện chưa có ca nào đang mở.',
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _openingCashController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Tiền mặt đầu ca (tồn quỹ)',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _submitting
                      ? const CircularProgressIndicator()
                      : ElevatedButton.icon(
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('MỞ CA LÀM VIỆC'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF59E0B),
                            foregroundColor: Colors.white,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          ),
                          onPressed: () async {
                            setState(() => _submitting = true);
                            await ref
                                .read(tramXangActiveShiftProvider.notifier)
                                .openShift(TramXangShift()
..shiftId =
                                      'shift_${DateTime.now().millisecondsSinceEpoch}'
                                  ..stationId =
                                      TramXangIsarService.currentStationId.isEmpty
                                          ? 'station_thong_dac'
                                          : TramXangIsarService.currentStationId
                                  ..employeeId = 'EMP_OWNER'
                                  ..openedAt = DateTime.now()
                                  ..openingCash = double.tryParse(
                                          _openingCashController.text) ??
                                      0
                                  ..status = 'OPEN');
                            if (!mounted) return;
                            setState(() => _submitting = false);
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveShiftView(TramXangShift shift) {
    final totalsAsync = ref.watch(tramXangShiftTotalsProvider(shift.shiftId));
    final totals = totalsAsync is AsyncData ? totalsAsync.value : null;
    final expected = shift.openingCash + (totals?.cash ?? 0);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.access_time, color: Colors.green),
              title: const Text('Ca đang hoạt động'),
              subtitle: Text(
                  'Mở lúc ${_d(shift.openedAt)} - Tiền đầu ca: ${_money(shift.openingCash)} đ'),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: totals == null
                  ? const Center(child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator()))
                  : Column(
                      children: [
                        _stat('Số hóa đơn', '${totals.count}'),
                        const Divider(),
                        _stat('Doanh thu tiền mặt', '${_money(totals.cash)} đ'),
                        _stat('Chuyển khoản', '${_money(totals.transfer)} đ',
                            color: Colors.blue),
                        _stat('QR Code', '${_money(totals.qr)} đ',
                            color: Colors.purple),
                        _stat('Công nợ phát sinh', '${_money(totals.debt)} đ',
                            color: Colors.orange),
                        _stat('Thuế GTGT', '${_money(totals.tax)} đ',
                            color: Colors.grey),
                        const Divider(),
                        _stat('Tổng doanh thu', '${_money(totals.total)} đ',
                            bold: true),
                        _stat('Tiền mặt dự kiến có',
                            '${_money(expected)} đ',
                            bold: true),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Đóng ca kết toán:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          TextField(
            controller: _actualCashController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Số tiền mặt thực tế thu được (dự kiến: ${_money(expected)} đ)',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.attach_money),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: _submitting
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.stop),
            label: const Text('CHỐT SỐ & ĐÓNG CA'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: _submitting
                ? null
                : () => _closeShift(shift, expected),
          ),
        ],
      ),
    );
  }

  Future<void> _closeShift(TramXangShift shift, double expected) async {
    final actual = double.tryParse(_actualCashController.text) ?? 0;
    if (actual == 0 && _actualCashController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vui lòng nhập số tiền thực tế')));
      return;
    }
    setState(() => _submitting = true);
    try {
      final closed = await ref
          .read(tramXangActiveShiftProvider.notifier)
          .closeShiftWithCash(shift, actual);
      if (!mounted) return;
      final statusText = switch (closed.status) {
        'BALANCED' => 'Cân đối',
        'SHORT' => 'Hụt ${_money(-closed.difference)} đ',
        'OVER' => 'Dư ${_money(closed.difference)} đ',
        _ => closed.status,
      };
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Đã đóng ca'),
          content: Text('Tiền mặt thực tế: ${_money(actual)} đ\n'
              'Số tiền dự kiến: ${_money(expected)} đ\n'
              'Trạng thái: $statusText'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      ref.read(tramXangSalesProvider.notifier).loadSales();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$e'), backgroundColor: Colors.red));
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  String _d(DateTime t) {
    return '${t.day}/${t.month}/${t.year} ${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
  }

  Widget _stat(String label, String value,
      {bool bold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                  color: color,
                  fontSize: bold ? 17 : 15)),
        ],
      ),
    );
  }
}