import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/property.dart';
import '../providers/batdongsan_providers.dart';

class PropertyFormScreen extends ConsumerStatefulWidget {
  final Property? property;

  const PropertyFormScreen({super.key, this.property});

  @override
  ConsumerState<PropertyFormScreen> createState() => _PropertyFormScreenState();
}

class _PropertyFormScreenState extends ConsumerState<PropertyFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _provinceController;
  late TextEditingController _areaSizeController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.property?.title ?? '');
    _priceController = TextEditingController(text: widget.property?.price?.toString() ?? '');
    _provinceController = TextEditingController(text: widget.property?.province ?? '');
    _areaSizeController = TextEditingController(text: widget.property?.areaSize?.toString() ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _provinceController.dispose();
    _areaSizeController.dispose();
    super.dispose();
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final property = widget.property ?? Property();
      property.title = _titleController.text;
      property.price = double.tryParse(_priceController.text);
      property.province = _provinceController.text;
      property.areaSize = double.tryParse(_areaSizeController.text);

      final repo = ref.read(propertyRepositoryProvider);
      await repo.saveProperty(property);

      // Refresh list
      ref.invalidate(propertiesProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(widget.property == null ? 'Đã thêm mới' : 'Đã cập nhật')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.property == null ? 'Thêm Bất động sản' : 'Sửa Bất động sản'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Tiêu đề', border: OutlineInputBorder()),
                validator: (val) => val == null || val.isEmpty ? 'Bắt buộc nhập' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Giá (tỷ VNĐ)', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (val) => val == null || val.isEmpty ? 'Bắt buộc nhập' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _provinceController,
                decoration: const InputDecoration(labelText: 'Tỉnh/Thành phố', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _areaSizeController,
                decoration: const InputDecoration(labelText: 'Diện tích (m2)', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
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
