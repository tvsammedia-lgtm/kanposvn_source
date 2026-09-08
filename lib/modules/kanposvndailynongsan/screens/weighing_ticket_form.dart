import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/nongsan_providers.dart';
import '../models/nongsan_purchase.dart';

class WeighingTicketForm extends ConsumerStatefulWidget {
  const WeighingTicketForm({super.key});

  @override
  ConsumerState<WeighingTicketForm> createState() => _WeighingTicketFormState();
}

class _WeighingTicketFormState extends ConsumerState<WeighingTicketForm> {
  final _formKey = GlobalKey<FormState>();
  final _supplierCtrl = TextEditingController(text: 'NCC-01');
  final _plateCtrl = TextEditingController();
  final _driverCtrl = TextEditingController();
  final _grossCtrl = TextEditingController();
  final _tareCtrl = TextEditingController();
  final _pkgCtrl = TextEditingController(text: '0');

  @override
  void dispose() {
    _supplierCtrl.dispose();
    _plateCtrl.dispose();
    _driverCtrl.dispose();
    _grossCtrl.dispose();
    _tareCtrl.dispose();
    _pkgCtrl.dispose();
    super.dispose();
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final gross = double.tryParse(_grossCtrl.text) ?? 0;
      final tare = double.tryParse(_tareCtrl.text) ?? 0;
      final pkg = double.tryParse(_pkgCtrl.text) ?? 0;

      if (gross < tare + pkg) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lỗi: Trọng lượng vào phải lớn hơn Trọng lượng ra + Bì')),
        );
        return;
      }

      final uuid = const Uuid().v4();
      final now = DateTime.now();
      // Generate a temporary ticket number
      final ticketNum = 'PC-${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}-${uuid.substring(0, 4).toUpperCase()}';

      final ticket = NongSanWeighingTicket(
        id: uuid,
        ticketNumber: ticketNum,
        supplierId: _supplierCtrl.text,
        vehiclePlate: _plateCtrl.text,
        driverName: _driverCtrl.text,
        grossWeight: gross,
        tareWeight: tare,
        packagingWeight: pkg,
      );

      // Save to Isar via Service
      final service = ref.read(nongsanIsarProvider);
      await service.saveDocument('NongSanWeighingTicket', ticket.id, ticket.toJson());

      // Refresh Provider list
      ref.invalidate(nongsanWeighingTicketsProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tạo thành công phiếu cân: $ticketNum')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Thêm Phiếu Cân Mới', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextFormField(
                controller: _supplierCtrl,
                decoration: const InputDecoration(labelText: 'Mã Nhà Cung Cấp', border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? 'Không được để trống' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _plateCtrl,
                      decoration: const InputDecoration(labelText: 'Biển Số Xe', border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _driverCtrl,
                      decoration: const InputDecoration(labelText: 'Tên Tài Xế', border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _grossCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'TL Vào (Gross)', border: OutlineInputBorder(), suffixText: 'kg'),
                      validator: (v) => v!.isEmpty ? 'Nhập TL' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _tareCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'TL Ra (Tare)', border: OutlineInputBorder(), suffixText: 'kg'),
                      validator: (v) => v!.isEmpty ? 'Nhập TL' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _pkgCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Trọng Lượng Bì', border: OutlineInputBorder(), suffixText: 'kg'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _save,
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('LƯU PHIẾU CÂN', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
