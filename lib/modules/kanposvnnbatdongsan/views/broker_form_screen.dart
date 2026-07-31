import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/broker.dart';
import '../providers/batdongsan_providers.dart';

class BrokerFormScreen extends ConsumerStatefulWidget {
  final Broker? broker;

  const BrokerFormScreen({super.key, this.broker});

  @override
  ConsumerState<BrokerFormScreen> createState() => _BrokerFormScreenState();
}

class _BrokerFormScreenState extends ConsumerState<BrokerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _branchController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.broker?.fullName ?? '');
    _phoneController = TextEditingController(text: widget.broker?.phone ?? '');
    _branchController = TextEditingController(text: widget.broker?.branch ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _branchController.dispose();
    super.dispose();
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final broker = widget.broker ?? Broker();
      broker.fullName = _nameController.text;
      broker.phone = _phoneController.text;
      broker.branch = _branchController.text;

      final repo = ref.read(brokerRepositoryProvider);
      await repo.saveBroker(broker);

      ref.invalidate(brokersProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(widget.broker == null ? 'Đã thêm mới' : 'Đã cập nhật')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.broker == null ? 'Thêm Môi giới' : 'Sửa Môi giới'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Họ tên', border: OutlineInputBorder()),
                validator: (val) => val == null || val.isEmpty ? 'Bắt buộc nhập' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Điện thoại', border: OutlineInputBorder()),
                keyboardType: TextInputType.phone,
                validator: (val) => val == null || val.isEmpty ? 'Bắt buộc nhập' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _branchController,
                decoration: const InputDecoration(labelText: 'Chi nhánh', border: OutlineInputBorder()),
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
