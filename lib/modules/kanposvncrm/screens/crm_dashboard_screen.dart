import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart';
import '../providers/crm_providers.dart';
import '../models/customer.dart';

import 'crm_customer_list_screen.dart';
import 'crm_store_screen.dart';
import 'crm_license_screen.dart';
import 'crm_ticket_screen.dart';

class CrmDashboardScreen extends ConsumerWidget {
  const CrmDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(crmCustomersProvider);
    final tickets = ref.watch(crmTicketsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('KanPosVN CRM'),
        backgroundColor: const Color(0xFFE11D48),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Đổi tài khoản',
            onPressed: () async {
              final auth = ref.read(authServiceProvider);
              ref.read(selectedModuleProvider.notifier).state = null;
              await auth.signOut();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFE11D48)),
              child: Text('CRM Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Khách hàng'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CrmCustomerListScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('Cửa hàng'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CrmStoreScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.key),
              title: const Text('License (Bản quyền)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CrmLicenseScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('Ticket Hỗ trợ'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CrmTicketScreen()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatsRow(customers.length, tickets.where((t) => t.status != 'closed').length),
              const SizedBox(height: 24),
              const Text('Khách hàng mới nhất', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildCustomerList(customers, ref, context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddCustomerDialog(context, ref),
        backgroundColor: const Color(0xFFE11D48),
        child: const Icon(Icons.person_add),
      ),
    );
  }

  Widget _buildStatsRow(int customerCount, int activeTickets) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Colors.blue[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.business, color: Colors.blue, size: 32),
                  const SizedBox(height: 8),
                  Text('$customerCount', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Khách hàng'),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Card(
            color: Colors.red[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.support_agent, color: Colors.red, size: 32),
                  const SizedBox(height: 8),
                  Text('$activeTickets', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Ticket đang mở'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerList(List<CrmCustomer> customers, WidgetRef ref, BuildContext context) {
    if (customers.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Center(child: Text('Chưa có khách hàng nào.')),
        ),
      );
    }
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: customers.take(10).length, // Hiển thị tối đa 10
      itemBuilder: (context, index) {
        final c = customers[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFE11D48),
              child: Text(c.companyName.isNotEmpty ? c.companyName[0].toUpperCase() : 'C', style: const TextStyle(color: Colors.white)),
            ),
            title: Text(c.companyName, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${c.representativeName} - ${c.phone}'),
            trailing: Chip(
              label: Text(c.status),
              backgroundColor: c.status == 'active' ? Colors.green[100] : Colors.grey[300],
            ),
            onTap: () {
              // Mở chi tiết khách hàng
            },
          ),
        );
      },
    );
  }

  void _showAddCustomerDialog(BuildContext context, WidgetRef ref) {
    final companyNameCtrl = TextEditingController();
    final repNameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Thêm Khách Hàng Mới'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: companyNameCtrl,
                decoration: const InputDecoration(labelText: 'Tên công ty/Cửa hàng'),
              ),
              TextField(
                controller: repNameCtrl,
                decoration: const InputDecoration(labelText: 'Người đại diện'),
              ),
              TextField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: 'Số điện thoại'),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                final customer = CrmCustomer()
                  ..customerId = 'CUST_${DateTime.now().millisecondsSinceEpoch}'
                  ..companyName = companyNameCtrl.text
                  ..representativeName = repNameCtrl.text
                  ..phone = phoneCtrl.text;
                  
                ref.read(crmCustomersProvider.notifier).saveCustomer(customer);
                Navigator.pop(ctx);
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE11D48)),
              child: const Text('Lưu', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      }
    );
  }
}
