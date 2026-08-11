import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/cafe_einvoice_service.dart';

/// Tab "Hóa đơn điện tử" — sẵn sàng nhận dữ liệu từ nhà cung cấp HĐĐT
/// (Viettel, M-Invoice, VNPT,..). Hiện tại hiển thị trạng thái kết nối
/// và chờ dữ liệu từ nhà cung cấp khi được cấu hình.
class CafeEinvoiceScreen extends ConsumerStatefulWidget {
  const CafeEinvoiceScreen({super.key});

  @override
  ConsumerState<CafeEinvoiceScreen> createState() => _CafeEinvoiceScreenState();
}

class _CafeEinvoiceScreenState extends ConsumerState<CafeEinvoiceScreen> {
  bool _loading = true;
  String _provider = 'Chưa cấu hình';
  bool _configured = false;
  int _invoiceCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadStatus());
  }

  Future<void> _loadStatus() async {
    try {
      final service = CafeEinvoiceService();
      final status = await service.loadStatus();
      if (mounted) {
        setState(() {
          _configured = status.configured;
          _provider = status.providerLabel;
          _invoiceCount = status.invoiceCount;
          _loading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: Colors.amber.shade50,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.amber.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(_configured ? Icons.check_circle : Icons.info_outline,
                        color: _configured ? Colors.green : Colors.amber.shade800),
                    const SizedBox(width: 8),
                    Text(
                      _configured ? 'Đã kết nối nhà cung cấp HĐĐT' : 'Chờ kết nối nhà cung cấp HĐĐT',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Nhà cung cấp: $_provider',
                  style: const TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 4),
                Text(
                  'Số hóa đơn đã nhận: $_invoiceCount',
                  style: const TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hóa đơn điện tử (HĐĐT)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Tab này sẵn sàng nhận dữ liệu hóa đơn điện tử từ nhà cung cấp '
                  '(Viettel, M-Invoice, VNPT,...). Khi nhà cung cấp được kết nối, '
                  'danh sách hóa đơn, phát hành và tra cứu sẽ hiển thị tại đây.',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 12),
                _configured
                    ? const SizedBox.shrink()
                    : OutlinedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Tính năng HĐĐT sẽ hoạt động khi cấu hình nhà cung cấp.'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.link),
                        label: const Text('Hướng dẫn kết nối'),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
