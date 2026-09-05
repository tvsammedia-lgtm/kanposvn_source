import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'qr_catalog.dart';
import 'qr_order_bridge.dart';

/// Màn hình quản lý QR Order Online dùng chung cho module
/// (nhà hàng / cafe). Nhận provider trả về [QrOrderBridge] của module.
class QrOrderScreen extends ConsumerStatefulWidget {
  final ProviderListenable<QrOrderBridge> bridgeProvider;
  const QrOrderScreen({super.key, required this.bridgeProvider});

  @override
  ConsumerState<QrOrderScreen> createState() => _QrOrderScreenState();
}

class _QrOrderScreenState extends ConsumerState<QrOrderScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(widget.bridgeProvider).initialize();
    });
  }

  String _fmt(double v) {
    final isRound = v == v.roundToDouble();
    return '${isRound ? v.toStringAsFixed(0) : v.toStringAsFixed(2)}đ';
  }

  String _fmtTime(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m ${t.day.toString().padLeft(2, '0')}/${t.month.toString().padLeft(2, '0')}';
  }

  Future<void> _copyUrl(String url) async {
    await Clipboard.setData(ClipboardData(text: url));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đã sao chép link QR: $url')),
    );
  }

  void _showError(Object e) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bridge = ref.watch(widget.bridgeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('QR Order Online')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _buildSyncCard(context, bridge),
          const SizedBox(height: 12),
          _buildTableCard(context, bridge),
          const SizedBox(height: 12),
          _buildOrdersCard(context, bridge),
        ],
      ),
    );
  }

  Widget _buildSyncCard(BuildContext context, QrOrderBridge bridge) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.qr_code_2),
            title: Text('Đồng bộ bàn + menu lên web (${bridge.label})'),
            subtitle: Text(
              bridge.branchId != null
                  ? 'Chi nhánh web: ${bridge.branchId}'
                  : 'Chưa đồng bộ lần nào. Nhấn "Đồng bộ" để tạo bàn + QR.',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton.icon(
              onPressed: bridge.isBusy
                  ? null
                  : () async {
                      try {
                        final result = await bridge.publishCatalog();
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Đồng bộ xong: ${result.tableCount} bàn, '
                            '${result.categoryCount} danh mục, ${result.itemCount} món.',
                          ),
                        ));
                      } catch (e) {
                        _showError(e);
                      }
                    },
              icon: bridge.isBusy
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.cloud_upload),
              label: const Text('Đồng bộ'),
            ),
          ),
          if (bridge.lastError != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Text(
                bridge.lastError!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          SwitchListTile(
            secondary: const Icon(Icons.sync),
            title: const Text('Tự động nhận đơn online'),
            subtitle: Text(
              bridge.isPolling
                  ? 'Đang kiểm tra mỗi 5 giây'
                  : 'Kiểm tra mỗi 5 giây. Bật sau khi đã đồng bộ.',
            ),
            value: bridge.isPolling,
            onChanged: bridge.branchId == null
                ? null
                : (v) {
                    if (v) {
                      bridge.startPolling();
                    } else {
                      bridge.stopPolling();
                    }
                  },
          ),
          if (bridge.lastSyncAt != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Text(
                'Đồng bộ lần cuối: ${_fmtTime(bridge.lastSyncAt!)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTableCard(BuildContext context, QrOrderBridge bridge) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.table_chart),
            title: const Text('QR của bàn'),
            subtitle: Text(
              bridge.cloudTables.isEmpty
                  ? 'Chưa có bàn nào trên web.'
                  : '${bridge.cloudTables.length} bàn. Bấm icon để copy link in QR.',
            ),
          ),
          if (bridge.cloudTables.isNotEmpty)
            ...bridge.cloudTables.map(
              (t) => ListTile(
                dense: true,
                leading: const Icon(Icons.qr_code, size: 20),
                title: Text('${t.name} (${t.code})'),
                subtitle: Text(t.url, maxLines: 1, overflow: TextOverflow.ellipsis),
                trailing: IconButton(
                  icon: const Icon(Icons.copy, size: 20),
                  tooltip: 'Copy link QR',
                  onPressed: () => _copyUrl(t.url),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildOrdersCard(BuildContext context, QrOrderBridge bridge) {
    final orders = bridge.remoteOrders;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text('Đơn online nhận được'),
            subtitle: Text(
              orders.isEmpty
                  ? 'Chưa có đơn nào từ khách web.'
                  : '${orders.length} đơn. Mới nhất ở đầu.',
            ),
          ),
          if (orders.isEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Text(
                'Khách quét QR trên bàn sẽ gọi món trực tiếp. '
                'Đơn xuất hiện ở đây và vào danh sách phục vụ của module.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          else
            ...orders.map((o) => _buildOrderTile(context, bridge, o)),
        ],
      ),
    );
  }

  Widget _buildOrderTile(
      BuildContext context, QrOrderBridge bridge, QrRemoteOrder o) {
    final canRespond = ['NEW', 'CONFIRMED'].contains(o.status);
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '#${o.orderNo} · ${o.tableName.isNotEmpty ? o.tableName : (o.tableCode.isEmpty ? 'Chưa chọn bàn' : o.tableCode)}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                _statusChip(o.status),
                const SizedBox(width: 8),
                Text(_fmt(o.total), style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              o.itemsText,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            if (o.customerName.isNotEmpty)
              Text('Khách: ${o.customerName}',
                  style: Theme.of(context).textTheme.bodySmall),
            if (o.customerNote.isNotEmpty)
              Text('Ghi chú: ${o.customerNote}',
                  style: Theme.of(context).textTheme.bodySmall),
            if (o.status == 'NEW')
              Text('Gửi lúc ${_fmtTime(o.createdAt)}',
                  style: Theme.of(context).textTheme.bodySmall),
            if (canRespond)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: bridge.isBusy
                        ? null
                        : () async {
                            try {
                              await bridge.updateRemoteStatus(o.id, 'CANCELLED');
                            } catch (e) {
                              _showError(e);
                            }
                          },
                    icon: const Icon(Icons.close),
                    label: const Text('Hủy'),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton.icon(
                    onPressed: bridge.isBusy
                        ? null
                        : () async {
                            try {
                              await bridge.updateRemoteStatus(o.id, 'CONFIRMED');
                            } catch (e) {
                              _showError(e);
                            }
                          },
                    icon: const Icon(Icons.check),
                    label: const Text('Nhận đơn'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _statusChip(String status) {
    final Color bg;
    switch (status) {
      case 'NEW':
        bg = Colors.orange;
      case 'CONFIRMED':
        bg = Colors.blue;
      case 'PREPARING':
        bg = Colors.purple;
      case 'READY':
      case 'SERVED':
        bg = Colors.teal;
      case 'PAID':
        bg = Colors.green;
      case 'COMPLETED':
        bg = Colors.indigo;
      case 'CANCELLED':
        bg = Colors.red;
      default:
        bg = Colors.blueGrey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}