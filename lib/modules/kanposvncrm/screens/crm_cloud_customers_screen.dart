import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../services/crm_cloud_service.dart';

/// Danh sách khách hàng từ admin-web: user đã đăng ký cửa hàng kèm
/// gói license + trạng thái đơn hàng. Đồng bộ với màn quản lý giá/bản quyền.
class CrmCloudCustomersScreen extends ConsumerStatefulWidget {
  const CrmCloudCustomersScreen({super.key});

  @override
  ConsumerState<CrmCloudCustomersScreen> createState() => _CrmCloudCustomersScreenState();
}

class _CrmCloudCustomersScreenState extends ConsumerState<CrmCloudCustomersScreen> {
  List<Map<String, dynamic>> _customers = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    final auth = ref.read(authServiceProvider);
    final service = CrmCloudService(token: auth.token);
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final data = await service.fetchCustomers();
      if (mounted) {
        setState(() {
          _customers = data;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Không tải được dữ liệu. Cần đăng nhập tài khoản admin.\n$e';
          _loading = false;
        });
      }
    }
  }

  String _planLabel(String? plan) {
    switch (plan) {
      case 'trial':
        return 'Dùng thử 7 ngày';
      case 'yearly':
        return '365 ngày';
      case 'forever':
        return 'Vĩnh Viễn';
      default:
        return plan == null || plan.isEmpty ? 'Chưa có' : plan;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khách hàng (Cloud)'),
        backgroundColor: const Color(0xFFE11D48),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _load,
            tooltip: 'Làm mới',
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null && _customers.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.cloud_off, size: 48, color: Colors.grey),
                        const SizedBox(height: 12),
                        Text(_error!, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                )
              : _customers.isEmpty
                  ? const Center(child: Text('Chưa có khách hàng nào đăng ký.'))
                  : ListView.builder(
                      itemCount: _customers.length,
                      itemBuilder: (context, index) {
                        final c = _customers[index];
                        final plan = c['license_plan']?.toString();
                        final licActive = c['license_status']?.toString() == 'active';
                        final orderPaid = c['order_status']?.toString() == 'paid';
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xFFE11D48),
                              child: const Icon(Icons.business, color: Colors.white),
                            ),
                            title: Text(
                              c['full_name']?.toString() ?? c['store_name']?.toString() ?? 'Khách',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('SĐT: ${c['phone'] ?? ''}'),
                                Text(
                                  'Gói: ${_planLabel(plan)} • ${c['app_code'] ?? '-'}',
                                ),
                                if (orderPaid)
                                  Text(
                                    'Đơn đã thanh toán: ${(c['amount'] ?? 0)} đ',
                                    style: const TextStyle(color: Colors.green),
                                  ),
                              ],
                            ),
                            trailing: Chip(
                              label: Text(licActive ? 'active' : 'inactive'),
                              backgroundColor: licActive ? Colors.green[100] : Colors.grey[300],
                            ),
                            isThreeLine: true,
                          ),
                        );
                      },
                    ),
    );
  }
}
