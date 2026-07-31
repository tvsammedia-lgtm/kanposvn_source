import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';

class ExpenseDebtScreen extends ConsumerStatefulWidget {
  const ExpenseDebtScreen({super.key});

  @override
  ConsumerState<ExpenseDebtScreen> createState() => _ExpenseDebtScreenState();
}

class _ExpenseDebtScreenState extends ConsumerState<ExpenseDebtScreen> {
  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    final db = ref.watch(dbProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F6F0),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text('Quản Lý Thu Chi & Công Nợ', style: TextStyle(color: Color(0xFF4A2C2A), fontWeight: FontWeight.bold)),
          bottom: const TabBar(
            labelColor: Color(0xFF4A2C2A),
            indicatorColor: Color(0xFF4A2C2A),
            tabs: [
              Tab(icon: Icon(Icons.account_balance_wallet), text: 'Sổ Sách Thu Chi'),
              Tab(icon: Icon(Icons.menu_book_sharp), text: 'Công Nợ (Khách & NCC)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Expenses & Income matching PRD Section 24
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: db.expenses.length,
                    itemBuilder: (ctx, i) {
                      final exp = db.expenses[i];
                      final isIncome = exp.type == 'INCOME';
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: isIncome ? Colors.green.shade100 : Colors.red.shade100,
                            child: Icon(isIncome ? Icons.arrow_downward : Icons.arrow_upward, color: isIncome ? Colors.green : Colors.red),
                          ),
                          title: Text(exp.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Danh mục: ${exp.categoryName} • Thao tác: ${exp.createdBy}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${isIncome ? "+" : "-"}${currency.format(exp.amount)}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: isIncome ? Colors.green : Colors.red,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, size: 18, color: Colors.grey),
                                onPressed: () => _showDeleteExpenseDialog(context, ref, exp),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton.extended(
                    onPressed: () => _showAddExpenseDialog(context, ref),
                    backgroundColor: const Color(0xFF4A2C2A),
                    icon: const Icon(Icons.add),
                    label: const Text('Thêm Thu/Chi'),
                  ),
                ),
              ],
            ),

            // Tab 2: Debts matching PRD Section 20 & 23
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const Text('Công Nợ Khách Hàng (Cho Bán Chịu):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  ...db.customers.where((c) => c.debt > 0).map((c) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.person, color: Colors.blue),
                        title: Text(c.name),
                        subtitle: Text('SĐT: ${c.phone} • Hạng: ${c.membershipTier}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(currency.format(c.debt), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                            IconButton(
                              icon: const Icon(Icons.payment, size: 18, color: Colors.green),
                              onPressed: () => _showCustomerPaymentDialog(context, ref, c),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 24),
                  const Text('Công Nợ Nhà Cung Cấp (Tiền Hàng):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  ...db.suppliers.where((s) => s.debt > 0).map((s) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.store, color: Colors.purple),
                        title: Text(s.name),
                        subtitle: Text('Công ty: ${s.company} • SĐT: ${s.phone}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(currency.format(s.debt), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                            IconButton(
                              icon: const Icon(Icons.payment, size: 18, color: Colors.green),
                              onPressed: () => _showSupplierPaymentDialog(context, ref, s),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    final categoryController = TextEditingController();
    String selectedType = 'EXPENSE';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm Thu/Chi Mới'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: ChoiceChip(
                    label: const Text('Chi'),
                    selected: selectedType == 'EXPENSE',
                    onSelected: (val) => setState(() => selectedType = 'EXPENSE'),
                    selectedColor: Colors.red,
                    labelStyle: TextStyle(color: selectedType == 'EXPENSE' ? Colors.white : Colors.black),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ChoiceChip(
                    label: const Text('Thu'),
                    selected: selectedType == 'INCOME',
                    onSelected: (val) => setState(() => selectedType = 'INCOME'),
                    selectedColor: Colors.green,
                    labelStyle: TextStyle(color: selectedType == 'INCOME' ? Colors.white : Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Tiêu đề', hintText: 'VD: Điện nước, Lương nhân viên...'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Số tiền', hintText: 'VD: 500000'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(labelText: 'Danh mục', hintText: 'VD: Chi phí vận hành'),
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
              if (titleController.text.isNotEmpty && amountController.text.isNotEmpty) {
                final amount = double.tryParse(amountController.text) ?? 0;
                final expense = ExpenseModel(
                  id: const Uuid().v4(),
                  title: titleController.text,
                  categoryName: categoryController.text.isEmpty ? 'Khác' : categoryController.text,
                  type: selectedType,
                  amount: amount,
                );
                ref.read(dbProvider).addExpense(expense);
                Navigator.pop(ctx);
              }
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  void _showDeleteExpenseDialog(BuildContext context, WidgetRef ref, dynamic expense) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa bản ghi'),
        content: Text('Bạn có chắc muốn xóa "${expense.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(dbProvider).deleteExpense(expense.id);
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }

  void _showCustomerPaymentDialog(BuildContext context, WidgetRef ref, dynamic customer) {
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Thanh toán công nợ - ${customer.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Công nợ hiện tại: ${NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(customer.debt)}'),
            const SizedBox(height: 16),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Số tiền thanh toán', hintText: 'VD: 500000'),
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
              final amount = double.tryParse(amountController.text) ?? 0;
              if (amount > 0 && amount <= customer.debt) {
                ref.read(dbProvider).payCustomerDebt(customer.id, amount);
                Navigator.pop(ctx);
              }
            },
            child: const Text('Thanh toán'),
          ),
        ],
      ),
    );
  }

  void _showSupplierPaymentDialog(BuildContext context, WidgetRef ref, dynamic supplier) {
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Thanh toán công nợ - ${supplier.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Công nợ hiện tại: ${NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(supplier.debt)}'),
            const SizedBox(height: 16),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Số tiền thanh toán', hintText: 'VD: 500000'),
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
              final amount = double.tryParse(amountController.text) ?? 0;
              if (amount > 0 && amount <= supplier.debt) {
                ref.read(dbProvider).paySupplierDebt(supplier.id, amount);
                Navigator.pop(ctx);
              }
            },
            child: const Text('Thanh toán'),
          ),
        ],
      ),
    );
  }
}
