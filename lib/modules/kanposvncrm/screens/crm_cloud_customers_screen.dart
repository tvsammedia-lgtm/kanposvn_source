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

  String _approvalLabel(String? status) {
    switch (status) {
      case 'pending':
        return 'Chờ duyệt';
      case 'approved':
        return 'Đã duyệt';
      case 'rejected':
        return 'Từ chối';
      default:
        return 'Đã duyệt';
    }
  }

  Future<void> _approve(Map<String, dynamic> c, String action) async {
    final customerId = c['customer_id']?.toString();
    final name = c['full_name']?.toString() ?? c['store_name']?.toString() ?? 'Khách';
    if (customerId == null || customerId.isEmpty) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(action == 'approve' ? 'Duyệt khách hàng?' : 'Từ chối khách hàng?'),
        content: Text('$name sẽ được ${action == 'approve' ? 'duyệt' : 'từ chối'} và ${action == 'approve' ? 'kích hoạt' : 'khóa'} tài khoản.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Huỷ')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(action == 'approve' ? 'Duyệt' : 'Từ chối',
                style: TextStyle(color: action == 'approve' ? Colors.green : Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final auth = ref.read(authServiceProvider);
    final service = CrmCloudService(token: auth.token);
    try {
      await service.approveCustomer(customerId: customerId, action: action);
      if (mounted) _load();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
      }
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
                        final orderPaid = c['order_status']?.toString() == 'paid';
                        final approval = c['approval_status']?.toString() ?? 'approved';
                        final modules = c['registered_modules']?.toString() ?? c['app_code']?.toString() ?? '';
                        final pending = approval == 'pending';
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
                                Text('Modules: ${modules.isEmpty ? '-' : modules}'),
                                Text('Gói: ${_planLabel(plan)}'),
                                if (orderPaid)
                                  Text(
                                    'Đơn đã thanh toán: ${(c['amount'] ?? 0)} đ',
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                if (pending)
                                  Row(
                                    children: [
                                      const Icon(Icons.hourglass_top, size: 14, color: Colors.orange),
                                      const SizedBox(width: 4),
                                      Text('Chờ admin duyệt', style: const TextStyle(color: Colors.orange)),
                                    ],
                                  ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Chip(
                                  label: Text(_approvalLabel(approval)),
                                  backgroundColor: approval == 'approved'
                                      ? Colors.green[100]
                                      : approval == 'pending'
                                          ? Colors.orange[100]
                                          : Colors.red[100],
                                ),
                                if (pending)
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.check_circle, color: Colors.green),
                                        tooltip: 'Duyệt',
                                        onPressed: () => _approve(c, 'approve'),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.cancel, color: Colors.red),
                                        tooltip: 'Từ chối',
                                        onPressed: () => _approve(c, 'reject'),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            isThreeLine: true,
                          ),
                        );
                      },
                    ),
    );
  }
}
