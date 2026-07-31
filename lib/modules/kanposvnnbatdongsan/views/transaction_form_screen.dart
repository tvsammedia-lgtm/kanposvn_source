import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';
import '../providers/batdongsan_providers.dart';

class TransactionFormScreen extends ConsumerStatefulWidget {
  final TransactionRecord? transaction;

  const TransactionFormScreen({super.key, this.transaction});

  @override
  ConsumerState<TransactionFormScreen> createState() => _TransactionFormScreenState();
}

class _TransactionFormScreenState extends ConsumerState<TransactionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _codeController;
  late TextEditingController _finalPriceController;
  TransactionStatus _status = TransactionStatus.negotiating;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.transaction?.transactionCode ?? '');
    _finalPriceController = TextEditingController(text: widget.transaction?.finalPrice?.toString() ?? '');
    if (widget.transaction != null) {
      _status = widget.transaction!.status;
    }
  }

  @override
  void dispose() {
    _codeController.dispose();
    _finalPriceController.dispose();
    super.dispose();
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final transaction = widget.transaction ?? TransactionRecord();
      transaction.transactionCode = _codeController.text;
      transaction.finalPrice = double.tryParse(_finalPriceController.text);
      transaction.status = _status;
      
      // In a real app we'd also link propertyId, buyerId, sellerId, brokerId here

      final repo = ref.read(transactionRepositoryProvider);
      await repo.saveTransaction(transaction);

      ref.invalidate(transactionsProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(widget.transaction == null ? 'Đã thêm mới' : 'Đã cập nhật')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transaction == null ? 'Thêm Giao dịch' : 'Sửa Giao dịch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _codeController,
                decoration: const InputDecoration(labelText: 'Mã Giao dịch', border: OutlineInputBorder()),
                validator: (val) => val == null || val.isEmpty ? 'Bắt buộc nhập' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _finalPriceController,
                decoration: const InputDecoration(labelText: 'Giá chốt (tỷ VNĐ)', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (val) => val == null || val.isEmpty ? 'Bắt buộc nhập' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<TransactionStatus>(
                decoration: const InputDecoration(labelText: 'Trạng thái', border: OutlineInputBorder()),
                value: _status,
                items: TransactionStatus.values.map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status.name),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      _status = val;
                    });
                  }
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _save,
                child: const Text('LƯU LẠI'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
