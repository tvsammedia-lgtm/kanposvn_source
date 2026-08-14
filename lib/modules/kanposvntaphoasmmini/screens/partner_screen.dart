import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/partner.dart';
import '../providers/taphoa_providers.dart';

class TapHoaPartnerScreen extends ConsumerStatefulWidget {
  const TapHoaPartnerScreen({super.key});

  @override
  ConsumerState<TapHoaPartnerScreen> createState() => _TapHoaPartnerScreenState();
}

class _TapHoaPartnerScreenState extends ConsumerState<TapHoaPartnerScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future.microtask(() {
      ref.read(tapHoaCustomersProvider.notifier).loadCustomers();
      ref.read(tapHoaSuppliersProvider.notifier).loadSuppliers();
    });
  }

  Future<void> _showPartnerDialog({TapHoaCustomer? customer, TapHoaSupplier? supplier}) async {
    final isCustomer = supplier == null;
    final nameController = TextEditingController(
        text: isCustomer ? customer?.name ?? '' : supplier.name);
    final phoneController = TextEditingController(
        text: isCustomer ? customer?.phone ?? '' : supplier.phone);
    final addressController = TextEditingController(
        text: isCustomer ? customer?.address ?? '' : supplier.address);

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(isCustomer ? 'Khách hàng' : 'Nhà cung cấp'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController,
                decoration: const InputDecoration(labelText: 'Tên *')),
            TextField(controller: phoneController,
                decoration: const InputDecoration(labelText: 'Số điện thoại')),
            TextField(controller: addressController,
                decoration: const InputDecoration(labelText: 'Địa chỉ')),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty) {
                ScaffoldMessenger.of(dialogContext).showSnackBar(
                  const SnackBar(content: Text('Vui lòng nhập tên')),
                );
                return;
              }
              if (isCustomer) {
                final c = customer ?? TapHoaCustomer();
                c
                  ..customerId =
                      customer?.customerId ?? 'CUS_${DateTime.now().millisecondsSinceEpoch}'
                  ..name = nameController.text
                  ..phone = phoneController.text
                  ..address = addressController.text
                  ..updatedAt = DateTime.now();
                ref.read(tapHoaCustomersProvider.notifier).saveCustomer(c);
              } else {
                final s = supplier;
                s
                  ..supplierId = s.supplierId.isEmpty
                      ? 'SUP_${DateTime.now().millisecondsSinceEpoch}'
                      : s.supplierId
                  ..name = nameController.text
                  ..phone = phoneController.text
                  ..address = addressController.text
                  ..updatedAt = DateTime.now();
                ref.read(tapHoaSuppliersProvider.notifier).saveSupplier(s);
              }
              Navigator.pop(dialogContext);
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  Future<void> _deletePartner({TapHoaCustomer? customer, TapHoaSupplier? supplier}) async {
    final name = customer?.name ?? supplier?.name ?? '';
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xóa đối tác'),
        content: Text('Bạn có chắc muốn xóa "$name"?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Hủy')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      if (customer != null) {
        await ref
            .read(tapHoaCustomersProvider.notifier)
            .deleteCustomer(customer.customerId);
      } else if (supplier != null) {
        await ref
            .read(tapHoaSuppliersProvider.notifier)
            .deleteSupplier(supplier.supplierId);
      }
      ref.read(tapHoaDebtProvider.notifier).refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final customers = ref.watch(tapHoaCustomersProvider);
    final suppliers = ref.watch(tapHoaSuppliersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đối Tác & Công Nợ'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Khách hàng'),
            Tab(text: 'Nhà cung cấp'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          customers.isEmpty
              ? const Center(child: Text('Chưa có dữ liệu khách hàng.'))
              : ListView.builder(
                  itemCount: customers.length,
                  itemBuilder: (context, index) {
                    final c = customers[index];
                    return ListTile(
                      leading: CircleAvatar(
                          child: Text(c.name.isNotEmpty ? c.name[0] : '?')),
                      title: Text(c.name),
                      subtitle: Text(
                          'SĐT: ${c.phone} - Hạng: ${c.memberTier}\nTổng chi: ${c.totalSpent.toStringAsFixed(0)} đ - Điểm: ${c.rewardPoints}'),
                      isThreeLine: true,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Công nợ',
                              style: TextStyle(fontSize: 12, color: Colors.grey)),
                          Text(
                            '${c.debtAmount.toStringAsFixed(0)} đ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: c.debtAmount > 0 ? Colors.red : Colors.green),
                          ),
                        ],
                      ),
                      onTap: () => _showPartnerDialog(customer: c),
                      onLongPress: () => _deletePartner(customer: c),
                    );
                  },
                ),
          suppliers.isEmpty
              ? const Center(child: Text('Chưa có dữ liệu nhà cung cấp.'))
              : ListView.builder(
                  itemCount: suppliers.length,
                  itemBuilder: (context, index) {
                    final s = suppliers[index];
                    return ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.factory)),
                      title: Text(s.name),
                      subtitle: Text('SĐT: ${s.phone}\nĐịa chỉ: ${s.address}'),
                      isThreeLine: true,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Đang nợ',
                              style: TextStyle(fontSize: 12, color: Colors.grey)),
                          Text(
                            '${s.debtAmount.toStringAsFixed(0)} đ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: s.debtAmount > 0 ? Colors.red : Colors.green),
                          ),
                        ],
                      ),
                      onTap: () => _showPartnerDialog(supplier: s),
                      onLongPress: () => _deletePartner(supplier: s),
                    );
                  },
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPartnerDialog(
          customer: _tabController.index == 0 ? TapHoaCustomer() : null,
          supplier: _tabController.index == 1 ? TapHoaSupplier() : null,
        ),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
