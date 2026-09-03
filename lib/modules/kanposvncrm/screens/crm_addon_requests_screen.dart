import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../services/crm_cloud_service.dart';

/// Duyệt yêu cầu mua thêm module / chi nhánh cho user đã tồn tại.
/// Đồng bộ với /dashboard/addon-requests trên admin-web + /buy-more phía user.
class CrmAddonRequestsScreen extends ConsumerStatefulWidget {
  const CrmAddonRequestsScreen({super.key});

  @override
  ConsumerState<CrmAddonRequestsScreen> createState() => _CrmAddonRequestsScreenState();
}

class _CrmAddonRequestsScreenState extends ConsumerState<CrmAddonRequestsScreen> {
  List<Map<String, dynamic>> _requests = [];
  bool _loading = true;
  String? _error;
  String _filter = 'pending';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    final auth = ref.read(authServiceProvider);
    final service = CrmCloudService(token: auth.token);
    setState(() { _loading = true; _error = null; });
    try {
      final data = await service.fetchAddonRequests(status: _filter);
      if (mounted) setState(() { _requests = data; _loading = false; });
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Không tải được dữ liệu. Cần đăng nhập tài khoản admin.\n$e';
          _loading = false;
        });
      }
    }
  }

  List<Map<String, dynamic>> _modules(String payload) {
    try {
      final decoded = jsonDecode(payload);
      final mods = decoded is Map ? decoded['modules'] : null;
      if (mods is List) {
        return mods.cast<Map<String, dynamic>>().toList();
      }
    } catch (_) {}
    return [];
  }

  String _statusLabel(String? s) {
    switch (s) {
      case 'pending': return 'Đang chờ';
      case 'approved': return 'Đã duyệt';
      case 'rejected': return 'Đã từ chối';
      default: return s ?? '';
    }
  }

  String _planLabel(String? p) {
    switch (p) {
      case 'trial': return 'Dùng thử';
      case 'yearly': return 'Theo năm';
      case 'forever': return 'Vĩnh viễn';
      default: return p == null || p.isEmpty ? '—' : p;
    }
  }

  Future<void> _act(Map<String, dynamic> r, String action) async {
    final id = r['id']?.toString();
    if (id == null || id.isEmpty) return;
    final storeName = r['store_name']?.toString() ?? r['full_name']?.toString() ?? 'Khách';

    String? plan;
    if (action == 'approve') {
      plan = await showDialog<String>(
        context: context,
        builder: (ctx) => SimpleDialog(
          title: Text('Duyệt mua thêm cho $storeName'),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(ctx, 'trial'),
              child: const Text('Dùng thử 7 ngày'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(ctx, 'yearly'),
              child: const Text('Theo năm (365 ngày)'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(ctx, 'forever'),
              child: const Text('Vĩnh viễn'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(ctx, null),
              child: const Text('Huỷ', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      );
      if (plan == null) return;
    } else {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Từ chối yêu cầu?'),
          content: Text('$storeName sẽ bị từ chối yêu cầu mua thêm.'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Huỷ')),
            TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Từ chối', style: TextStyle(color: Colors.red))),
          ],
        ),
      );
      if (confirmed != true) return;
    }

    final auth = ref.read(authServiceProvider);
    final service = CrmCloudService(token: auth.token);
    try {
      await service.approveAddonRequest(requestId: id, action: action, plan: plan);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(action == 'approve' ? 'Đã duyệt & cấp gói.' : 'Đã từ chối yêu cầu.')),
        );
        _load();
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Duyệt mua thêm module/chi nhánh'),
        backgroundColor: const Color(0xFFE11D48),
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _load, tooltip: 'Làm mới'),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'pending', label: Text('Đang chờ')),
                ButtonSegment(value: 'all', label: Text('Tất cả')),
              ],
              selected: {_filter},
              onSelectionChanged: (s) {
                setState(() => _filter = s.first);
                _load();
              },
            ),
          ),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _error != null && _requests.isEmpty
                    ? Center(child: Padding(padding: const EdgeInsets.all(24), child: Text(_error!, textAlign: TextAlign.center)))
                    : _requests.isEmpty
                        ? const Center(child: Text('Chưa có yêu cầu nào.'))
                        : ListView.builder(
                            itemCount: _requests.length,
                            itemBuilder: (context, index) {
                              final r = _requests[index];
                              final modules = _modules(r['payload']?.toString() ?? '');
                              final pending = r['status']?.toString() == 'pending';
                              return Card(
                                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              r['store_name']?.toString() ?? r['full_name']?.toString() ?? 'Khách',
                                              style: const TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(
                                            _statusLabel(r['status']?.toString()),
                                            style: TextStyle(
                                              color: pending ? Colors.orange : r['status']?.toString() == 'approved' ? Colors.green : Colors.red,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text('SĐT: ${r['phone'] ?? ''}', style: const TextStyle(color: Colors.grey)),
                                      Text(
                                        'Gửi: ${r['requested_at'] ?? ''}',
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(height: 8),
                                      ...modules.map((m) {
                                        final branches = (m['branches'] is List ? m['branches'] as List : <dynamic>[])
                                            .where((b) => b is Map && b['name'] != null && (b['name'].toString().isNotEmpty))
                                            .map((b) => (b as Map)['name'].toString())
                                            .toList();
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 6),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Module: ${m['app_code'] ?? ''}', style: const TextStyle(fontWeight: FontWeight.w600)),
                                              Text('Chi nhánh: ${branches.join(', ')}'),
                                            ],
                                          ),
                                        );
                                      }),
                                      if (r['status']?.toString() != 'pending') ...[
                                        if (r['plan'] != null)
                                          Text('Gói cấp: ${_planLabel(r['plan']?.toString())}', style: const TextStyle(color: Colors.blueGrey)),
                                        if (r['resolved_by'] != null)
                                          Text('Xử lý bởi: ${r['resolved_by']}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                      ],
                                      if (pending)
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            TextButton.icon(
                                              icon: const Icon(Icons.check_circle, color: Colors.green),
                                              label: const Text('Duyệt & cấp gói'),
                                              onPressed: () => _act(r, 'approve'),
                                            ),
                                            TextButton.icon(
                                              icon: const Icon(Icons.cancel, color: Colors.red),
                                              label: const Text('Từ chối'),
                                              onPressed: () => _act(r, 'reject'),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}
