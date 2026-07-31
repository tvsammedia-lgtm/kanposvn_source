import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/customer.dart';
import '../providers/batdongsan_providers.dart';

class CustomerFormScreen extends ConsumerStatefulWidget {
  final Customer? customer;
  final CustomerType defaultType;

  const CustomerFormScreen({super.key, this.customer, this.defaultType = CustomerType.buyer});

  @override
  ConsumerState<CustomerFormScreen> createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends ConsumerState<CustomerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.customer?.name ?? '');
    _phoneController = TextEditingController(text: widget.customer?.phone ?? '');
    _emailController = TextEditingController(text: widget.customer?.email ?? '');
    _addressController = TextEditingController(text: widget.customer?.address ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final customer = widget.customer ?? Customer();
      customer.name = _nameController.text;
      customer.phone = _phoneController.text;
      customer.email = _emailController.text;
      customer.address = _addressController.text;
      if (widget.customer == null) {
        customer.type = widget.defaultType;
      }

      final repo = ref.read(customerRepositoryProvider);
      await repo.saveCustomer(customer);

      ref.invalidate(customersProvider);
      ref.invalidate(buyersProvider);
      ref.invalidate(sellersProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(widget.customer == null ? 'Đã thêm mới' : 'Đã cập nhật')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final typeName = widget.customer?.type == CustomerType.buyer || (widget.customer == null && widget.defaultType == CustomerType.buyer) 
      ? 'Khách Mua' 
      : 'Khách Bán';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.customer == null ? 'Thêm $typeName' : 'Sửa $typeName'),
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
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Địa chỉ', border: OutlineInputBorder()),
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
