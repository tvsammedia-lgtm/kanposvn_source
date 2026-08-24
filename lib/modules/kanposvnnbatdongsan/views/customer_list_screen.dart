import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/customer.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_business_logic.dart';
import 'customer_form_screen.dart';

/// Danh sách khách hàng — tab Khách mua / Khách bán (PRD mục 5/6).
class CustomerListScreen extends ConsumerStatefulWidget {
  const CustomerListScreen({super.key});

  @override
  ConsumerState<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends ConsumerState<CustomerListScreen> {
  String _query = '';

  void _deleteCustomer(BuildContext context, WidgetRef ref, int id) async {
    final repo = ref.read(customerRepositoryProvider);
    await repo.deleteCustomer(id);
    ref.invalidate(customersProvider);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Đã xóa khách hàng')));
  }

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customersProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        const CustomerFormScreen(initialType: CustomerType.buyer)));
            if (mounted) ref.invalidate(customersProvider);
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm tên / SĐT khách hàng...',
                  prefixIcon: const Icon(Icons.search),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.shopping_cart), text: 'Khách mua'),
                Tab(icon: Icon(Icons.sell), text: 'Khách bán'),
              ],
            ),
            Expanded(
              child: customersAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Lỗi: $e')),
                data: (all) {
                  final buyers = all
                      .where((c) =>
                          c.type == CustomerType.buyer &&
                          c.deletedAt == null &&
                          _matches(c))
                      .toList();
                  final sellers = all
                      .where((c) =>
                          c.type == CustomerType.seller &&
                          c.deletedAt == null &&
                          _matches(c))
                      .toList();

                  Widget list(List<Customer> items, {required bool isBuyer}) {
                    if (items.isEmpty) {
                      return const Center(child: Text('Chưa có khách hàng'));
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 88),
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        final c = items[i];
                        final subtitle = isBuyer
                            ? _buyerDemandText(c)
                            : (c.notes ?? c.address ?? '-');
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          child: ListTile(
                            onTap: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          CustomerFormScreen(customer: c)));
                              if (mounted) {
                                ref.invalidate(customersProvider);
                              }
                            },
                            title: Row(children: [
                              Expanded(
                                child: Text(c.name ?? '-',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600)),
                              ),
                              if (c.isVip)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 1),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text('VIP',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.bold)),
                                ),
                            ]),
                            subtitle: Text(subtitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.phone,
                                      color: Colors.green),
                                  tooltip: 'Gọi',
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline,
                                      color: Colors.redAccent),
                                  tooltip: 'Xóa',
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text('Xác nhận xóa'),
                                      content:
                                          Text('Xóa "${c.name ?? ''}" ?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(ctx),
                                            child: const Text('Hủy')),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                            _deleteCustomer(context, ref, c.id);
                                          },
                                          child: const Text('Xóa',
                                              style: TextStyle(
                                                  color: Colors.red)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return TabBarView(children: [
                    list(buyers, isBuyer: true),
                    list(sellers, isBuyer: false),
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _matches(Customer c) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return true;
    return '${c.name ?? ''} ${c.phone ?? ''}'.toLowerCase().contains(q);
  }

  static String _buyerDemandText(Customer c) {
    final parts = <String>[];
    parts.add(c.phone ?? '-');
    if (c.demandPropertyType != null) parts.add(c.demandPropertyType!);
    if (c.demandDistrict != null || c.demandCity != null) {
      parts.add('${c.demandDistrict ?? ''} ${c.demandCity ?? ''}');
    }
    final price = BdsBusinessLogic.formatMoney(c.demandPriceFrom) ==
                '-' &&
            BdsBusinessLogic.formatMoney(c.demandPriceTo) == '-'
        ? ''
        : ' · ${BdsBusinessLogic.formatMoney(c.demandPriceFrom)} - '
            '${BdsBusinessLogic.formatMoney(c.demandPriceTo)}';
    parts.add(price);
    return parts.join(' · ');
  }
}
