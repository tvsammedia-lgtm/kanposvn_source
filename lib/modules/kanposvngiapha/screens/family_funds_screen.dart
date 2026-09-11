import 'package:flutter/material.dart';

class FamilyFundsScreen extends StatefulWidget {
  const FamilyFundsScreen({Key? key}) : super(key: key);

  @override
  _FamilyFundsScreenState createState() => _FamilyFundsScreenState();
}

class _FamilyFundsScreenState extends State<FamilyFundsScreen> {
  final List<Map<String, dynamic>> _transactions = [
    {'type': 'IN', 'amount': 5000000, 'desc': 'Đóng góp xây từ đường (Chi 1)', 'date': '10/09/2026'},
    {'type': 'OUT', 'amount': 2000000, 'desc': 'Chi phí tổ chức Thanh Minh', 'date': '05/04/2026'},
  ];
  
  double _balance = 3000000;

  void _showAddTransactionDialog() {
    String type = 'IN';
    double amount = 0;
    String desc = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thêm Giao Dịch'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: type,
                items: const [
                  DropdownMenuItem(value: 'IN', child: Text('Thu vào (Đóng góp)')),
                  DropdownMenuItem(value: 'OUT', child: Text('Chi ra')),
                ],
                onChanged: (val) {
                  type = val!;
                },
                decoration: const InputDecoration(labelText: 'Loại giao dịch'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Số tiền (VNĐ)'),
                onChanged: (val) {
                  amount = double.tryParse(val) ?? 0;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Nội dung/Mô tả'),
                onChanged: (val) {
                  desc = val;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (type == 'IN') {
                    _balance += amount;
                  } else {
                    _balance -= amount;
                  }
                  _transactions.insert(0, {
                    'type': type,
                    'amount': amount,
                    'desc': desc,
                    'date': 'Hôm nay'
                  });
                });
                Navigator.pop(context);
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Quỹ Dòng họ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.green[700],
              child: ListTile(
                title: const Text('TỔNG SỐ DƯ QUỸ', style: TextStyle(color: Colors.white, fontSize: 16)),
                trailing: Text('${_balance.toStringAsFixed(0)} đ', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Lịch sử giao dịch', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  final t = _transactions[index];
                  final isIncome = t['type'] == 'IN';
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isIncome ? Colors.green[100] : Colors.red[100],
                        child: Icon(
                          isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                          color: isIncome ? Colors.green : Colors.red,
                        ),
                      ),
                      title: Text(t['desc']),
                      subtitle: Text(t['date']),
                      trailing: Text(
                        '${isIncome ? '+' : '-'}${t['amount']} đ',
                        style: TextStyle(
                          color: isIncome ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTransactionDialog,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
