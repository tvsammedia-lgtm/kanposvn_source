import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../services/crm_cloud_service.dart';

/// Màn hình bán hàng đơn giản cho kanposvncrm:
/// chọn khách hàng (user đã đăng ký trên admin-web) + sản phẩm (module POS) + tổng tiền.
class CrmSaleScreen extends ConsumerStatefulWidget {
  const CrmSaleScreen({super.key});

  @override
  ConsumerState<CrmSaleScreen> createState() => _CrmSaleScreenState();
}

class _CrmSaleScreenState extends ConsumerState<CrmSaleScreen> {
  List<Map<String, dynamic>> _customers = [];
  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> _sales = [];
  bool _loading = true;
  String? _error;

  String? _selectedUserId;
  String _customerName = '';
  String _customerPhone = '';
  String? _selectedProductCode;
  String _selectedProductName = '';
  final _amountCtrl = TextEditingController();
  final _noteCtrl = TextEditingController();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final auth = ref.read(authServiceProvider);
    final token = auth.token;
    final service = CrmCloudService(token: token);
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final customers = await service.fetchCustomers();
      final products = await service.fetchProducts();
      final sales = await service.fetchSales();
      if (mounted) {
        setState(() {
          _customers = customers;
          _products = products;
          _sales = sales;
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

  Future<void> _createSale() async {
    final amount = int.tryParse(_amountCtrl.text.trim());
    if (_selectedProductCode == null || amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Chọn sản phẩm và nhập tổng tiền hợp lệ')),
      );
      return;
    }
    final auth = ref.read(authServiceProvider);
    final service = CrmCloudService(token: auth.token);
    setState(() => _saving = true);
    try {
      await service.createSale(
        userId: _selectedUserId,
        customerName: _customerName,
        customerPhone: _customerPhone,
        productCode: _selectedProductCode!,
        productName: _selectedProductName,
        amount: amount,
        note: _noteCtrl.text.trim(),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã tạo đơn bán thành công')),
        );
        _amountCtrl.clear();
        _noteCtrl.clear();
        _selectedProductCode = null;
        setState(() {});
      }
      await _load();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bán hàng (Cloud CRM)'),
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
          : _error != null && _customers.isEmpty && _products.isEmpty
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
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      'Tạo đơn bán',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    _buildCustomerField(),
                    const SizedBox(height: 12),
                    _buildProductField(),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _amountCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Tổng tiền (VND)',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.payments),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _noteCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Ghi chú (không bắt buộc)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _saving ? null : _createSale,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE11D48),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      icon: const Icon(Icons.check),
                      label: Text(_saving ? 'Đang lưu...' : 'Tạo đơn bán'),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Lịch sử đơn bán',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    if (_sales.isEmpty)
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Chưa có đơn bán nào.'),
                      )
                    else
                      ..._sales.take(20).map(
                            (s) => Card(
                              child: ListTile(
                                leading: const Icon(Icons.sell, color: Color(0xFFE11D48)),
                                title: Text(
                                  '${s['customer_name']} - ${s['product_name']}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  '${s['order_code']} • ${s['created_at']?.toString().substring(0, 10)}',
                                ),
                                trailing: Text(
                                  '${(s['amount'] ?? 0)} đ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                    if (_error != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          _error!,
                          style: const TextStyle(color: Colors.orange),
                        ),
                      ),
                  ],
                ),
    );
  }

  Widget _buildCustomerField() {
    return DropdownButtonFormField<String?>(
      initialValue: _selectedUserId,
      isExpanded: true,
      decoration: const InputDecoration(
        labelText: 'Khách hàng (user đã đăng ký)',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.business),
      ),
      items: [
        const DropdownMenuItem<String?>(value: null, child: Text('— Khách không có tài khoản —')),
        for (final c in _customers)
          DropdownMenuItem<String?>(
            value: c['user_id']?.toString(),
            child: Text(
              '${c['full_name'] ?? c['store_name'] ?? 'Khách'} (${c['phone'] ?? ''})',
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
      onChanged: (v) {
        setState(() {
          _selectedUserId = v;
          final c = _customers.firstWhere(
            (x) => x['user_id']?.toString() == v,
            orElse: () => const {},
          );
          _customerName = c['full_name']?.toString() ?? c['store_name']?.toString() ?? '';
          _customerPhone = c['phone']?.toString() ?? '';
        });
      },
    );
  }

  Widget _buildProductField() {
    return DropdownButtonFormField<String?>(
      initialValue: _selectedProductCode,
      isExpanded: true,
      decoration: const InputDecoration(
        labelText: 'Sản phẩm (module POS)',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.category),
      ),
      items: [
        for (final p in _products)
          DropdownMenuItem<String?>(
            value: p['product_code']?.toString(),
            child: Text(p['product_name']?.toString() ?? ''),
          ),
      ],
      onChanged: (v) {
        setState(() {
          _selectedProductCode = v;
          final p = _products.firstWhere(
            (x) => x['product_code']?.toString() == v,
            orElse: () => const {},
          );
          _selectedProductName = p['product_name']?.toString() ?? '';
        });
      },
    );
  }
}
