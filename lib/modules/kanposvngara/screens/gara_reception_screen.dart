import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/gara_providers.dart';
import '../models/gara_customer.dart';
import '../models/gara_vehicle.dart';
import '../models/gara_repair_order.dart';

class GaraReceptionScreen extends ConsumerStatefulWidget {
  const GaraReceptionScreen({super.key});

  @override
  ConsumerState<GaraReceptionScreen> createState() => _GaraReceptionScreenState();
}

class _GaraReceptionScreenState extends ConsumerState<GaraReceptionScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _plateCtrl = TextEditingController();
  final _brandCtrl = TextEditingController();
  final _modelCtrl = TextEditingController();
  final _customerNameCtrl = TextEditingController();
  final _customerPhoneCtrl = TextEditingController();
  final _kmCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();

  GaraCustomer? _existingCustomer;

  void _onPhoneChanged(String phone) {
    if (phone.length >= 10) {
      final customers = ref.read(garaCustomersProvider).valueOrNull ?? [];
      final match = customers.where((c) => c.phone == phone).toList();
      if (match.isNotEmpty) {
        setState(() {
          _existingCustomer = match.first;
          _customerNameCtrl.text = match.first.name;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đã tìm thấy KH: ${match.first.name}'), backgroundColor: Colors.green),
        );
      } else {
        setState(() => _existingCustomer = null);
      }
    }
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    
    // 1. Use existing customer or create new
    GaraCustomer customer;
    if (_existingCustomer != null) {
      customer = _existingCustomer!;
    } else {
      customer = GaraCustomer()
        ..customerId = const Uuid().v4()
        ..name = _customerNameCtrl.text
        ..phone = _customerPhoneCtrl.text;
      await ref.read(garaCustomersProvider.notifier).addCustomer(customer);
    }
    
    // 2. Create/Find Vehicle
    final vehicle = GaraVehicle()
      ..vehicleId = const Uuid().v4()
      ..licensePlate = _plateCtrl.text
      ..brand = _brandCtrl.text
      ..modelName = _modelCtrl.text;
    vehicle.owner.value = customer;
    await ref.read(garaVehiclesProvider.notifier).addVehicle(vehicle);

    // 3. Create Repair Order
    final order = GaraRepairOrder()
      ..orderId = const Uuid().v4()
      ..orderCode = 'RO-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
      ..status = GaraOrderStatus.RECEPTION
      ..orderDate = DateTime.now()
      ..currentKm = int.tryParse(_kmCtrl.text) ?? 0
      ..notes = _notesCtrl.text;
      
    order.customer.value = customer;
    order.vehicle.value = vehicle;
    
    await ref.read(garaOrdersProvider.notifier).createOrder(order);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tiếp nhận xe thành công!')));
      _formKey.currentState!.reset();
      setState(() => _existingCustomer = null);
      _plateCtrl.clear();
      _brandCtrl.clear();
      _modelCtrl.clear();
      _customerNameCtrl.clear();
      _customerPhoneCtrl.clear();
      _kmCtrl.clear();
      _notesCtrl.clear();
      ref.read(garaTabIndexProvider.notifier).state = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tiếp Nhận Xe')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Thông tin Xe', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: TextFormField(controller: _plateCtrl, decoration: const InputDecoration(labelText: 'Biển số (*)', border: OutlineInputBorder()), validator: (v) => v!.isEmpty ? 'Nhập biển số' : null)),
                  const SizedBox(width: 16),
                  Expanded(child: TextFormField(controller: _brandCtrl, decoration: const InputDecoration(labelText: 'Hãng xe (Honda, Toyota...)', border: OutlineInputBorder()))),
                  const SizedBox(width: 16),
                  Expanded(child: TextFormField(controller: _modelCtrl, decoration: const InputDecoration(labelText: 'Dòng xe (Vios, SH...)', border: OutlineInputBorder()))),
                ],
              ),
              const SizedBox(height: 32),
              
              const Text('Thông tin Khách hàng', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: TextFormField(controller: _customerNameCtrl, decoration: const InputDecoration(labelText: 'Tên Khách hàng (*)', border: OutlineInputBorder()), validator: (v) => v!.isEmpty ? 'Nhập tên khách hàng' : null)),
                  const SizedBox(width: 16),
                  Expanded(child: TextFormField(controller: _customerPhoneCtrl, onChanged: _onPhoneChanged, decoration: const InputDecoration(labelText: 'Số điện thoại', border: OutlineInputBorder()))),
                ],
              ),
              const SizedBox(height: 32),
              
              const Text('Tình trạng Hiện tại', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: TextFormField(controller: _kmCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Số Km hiện tại', border: OutlineInputBorder()))),
                  const SizedBox(width: 16),
                  Expanded(flex: 2, child: TextFormField(controller: _notesCtrl, decoration: const InputDecoration(labelText: 'Ghi chú / Yêu cầu sửa chữa', border: OutlineInputBorder()))),
                ],
              ),
              const SizedBox(height: 32),
              
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _submit,
                  icon: const Icon(Icons.save),
                  label: const Text('Lập Phiếu Tiếp Nhận', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
