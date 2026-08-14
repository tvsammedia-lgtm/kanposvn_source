import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/pawn_provider.dart';
import '../../models/pawn_contract.dart';
import '../../models/customer.dart';

class PawnCreateScreen extends ConsumerStatefulWidget {
  const PawnCreateScreen({super.key});

  @override
  ConsumerState<PawnCreateScreen> createState() => _PawnCreateScreenState();
}

class _PawnCreateScreenState extends ConsumerState<PawnCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Các Controllers
  final _customerNameCtrl = TextEditingController();
  final _customerPhoneCtrl = TextEditingController();
  final _cccdCtrl = TextEditingController();
  
  final _assetDescCtrl = TextEditingController();
  final _pawnAmountCtrl = TextEditingController();
  final _interestRateCtrl = TextEditingController();
  
  @override
  void dispose() {
    _customerNameCtrl.dispose();
    _customerPhoneCtrl.dispose();
    _cccdCtrl.dispose();
    _assetDescCtrl.dispose();
    _pawnAmountCtrl.dispose();
    _interestRateCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Khởi tạo Customer
      final customer = Customer()
        ..fullName = _customerNameCtrl.text
        ..phone = _customerPhoneCtrl.text
        ..cccd = _cccdCtrl.text
        ..createdAt = DateTime.now();
        
      // Khởi tạo Hợp đồng
      final contract = PawnContract()
        ..contractNumber = 'HD${DateTime.now().millisecondsSinceEpoch}'
        ..description = _assetDescCtrl.text
        ..pawnAmount = double.tryParse(_pawnAmountCtrl.text) ?? 0
        ..interestRate = double.tryParse(_interestRateCtrl.text) ?? 0
        ..pawnDate = DateTime.now()
        ..createdAt = DateTime.now()
        ..status = PawnStatus.active;
        
      ref.read(pawnProvider.notifier).addContract(contract, customer);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tạo hợp đồng thành công!'))
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tạo Hợp Đồng Mới')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Thông tin Khách Hàng', style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: _customerNameCtrl,
              decoration: const InputDecoration(labelText: 'Họ và tên'),
              validator: (v) => v!.isEmpty ? 'Vui lòng nhập họ tên' : null,
            ),
            TextFormField(
              controller: _customerPhoneCtrl,
              decoration: const InputDecoration(labelText: 'Số điện thoại'),
            ),
            TextFormField(
              controller: _cccdCtrl,
              decoration: const InputDecoration(labelText: 'Số CCCD'),
            ),
            const SizedBox(height: 20),
            
            const Text('Thông tin Tài Sản', style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: _assetDescCtrl,
              decoration: const InputDecoration(labelText: 'Mô tả (Ví dụ: iPhone 14 Pro Max)'),
              validator: (v) => v!.isEmpty ? 'Vui lòng nhập mô tả' : null,
            ),
            TextFormField(
              controller: _pawnAmountCtrl,
              decoration: const InputDecoration(labelText: 'Số tiền cầm'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _interestRateCtrl,
              decoration: const InputDecoration(labelText: 'Lãi suất (%)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Tạo Hợp Đồng'),
            )
          ],
        ),
      ),
    );
  }
}
