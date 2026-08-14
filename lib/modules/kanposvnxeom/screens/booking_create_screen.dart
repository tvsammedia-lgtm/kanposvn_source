import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/booking.dart';
import '../models/vehicle.dart';
import '../providers/booking_provider.dart';
import '../../../../core/api/pricing_service.dart';
import '../../../../core/api/driver_location_service.dart';

class BookingCreateScreen extends ConsumerStatefulWidget {
  const BookingCreateScreen({super.key});

  @override
  ConsumerState<BookingCreateScreen> createState() => _BookingCreateScreenState();
}

class _BookingCreateScreenState extends ConsumerState<BookingCreateScreen> {
  final _pickupCtrl = TextEditingController();
  final _dropoffCtrl = TextEditingController();
  final _distanceCtrl = TextEditingController(); // Nhập khoảng cách ước tính (km)
  final _customerNameCtrl = TextEditingController();
  final _customerPhoneCtrl = TextEditingController();

  VehicleType _selectedType = VehicleType.motorbike;
  double _estimatedPrice = 0.0;
  List<DriverLocationModel> _nearbyDrivers = [];
  bool _isSearching = false;

  @override
  void dispose() {
    _pickupCtrl.dispose();
    _dropoffCtrl.dispose();
    _distanceCtrl.dispose();
    _customerNameCtrl.dispose();
    _customerPhoneCtrl.dispose();
    super.dispose();
  }

  void _calculatePrice() {
    final distance = double.tryParse(_distanceCtrl.text) ?? 0.0;
    if (distance <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng nhập khoảng cách (km) hợp lệ')));
      return;
    }
    setState(() {
      _estimatedPrice = PricingService.calculateEstimatedPrice(
        distanceKm: distance,
        vehicleType: _selectedType,
        isRushHour: false, // Ở giao diện thật có thể thêm switch
      );
    });
  }

  Future<void> _searchDrivers() async {
    setState(() => _isSearching = true);
    try {
      // Dùng toạ độ mặc định (hoặc nhập từ maps) để tìm tài xế
      final drivers = await DriverLocationService.findNearbyDrivers(
        pickupLat: 10.762622, // Tọa độ giả định (Sài Gòn)
        pickupLng: 106.660172,
        requestedVehicleType: _selectedType.name,
      );
      setState(() {
        _nearbyDrivers = drivers;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
    } finally {
      setState(() => _isSearching = false);
    }
  }

  void _createBooking() {
    if (_pickupCtrl.text.isEmpty || _dropoffCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng điền đủ điểm đi/đến')));
      return;
    }

    // Chọn tài xế đầu tiên nếu có
    String? assignedDriverUuid;
    if (_nearbyDrivers.isNotEmpty) {
      assignedDriverUuid = _nearbyDrivers.first.driverUuid;
    }

    final booking = XeOmBooking()
      ..pickupAddress = _pickupCtrl.text
      ..dropoffAddress = _dropoffCtrl.text
      ..customerName = _customerNameCtrl.text
      ..customerPhone = _customerPhoneCtrl.text
      ..distanceKm = double.tryParse(_distanceCtrl.text)
      ..price = _estimatedPrice
      ..requiredVehicleType = _selectedType.name
      ..status = assignedDriverUuid != null ? BookingStatus.driverAccepted : BookingStatus.searchingDriver
      ..driverUuid = assignedDriverUuid;

    ref.read(xeOmBookingProvider.notifier).addBooking(booking);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tạo cuốc xe thành công!')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tạo Cuốc Xe Mới')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Thông tin khách
          const Text('Thông tin Khách hàng', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(controller: _customerNameCtrl, decoration: const InputDecoration(labelText: 'Tên khách')),
          TextField(controller: _customerPhoneCtrl, decoration: const InputDecoration(labelText: 'Số điện thoại')),
          const SizedBox(height: 16),
          
          // 2. Hành trình
          const Text('Hành trình', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(controller: _pickupCtrl, decoration: const InputDecoration(labelText: 'Điểm Đón', prefixIcon: Icon(Icons.my_location))),
          TextField(controller: _dropoffCtrl, decoration: const InputDecoration(labelText: 'Điểm Đến', prefixIcon: Icon(Icons.location_on))),
          TextField(
            controller: _distanceCtrl, 
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Khoảng cách ước tính (km) - VD: 5.2', prefixIcon: Icon(Icons.route)),
          ),
          const SizedBox(height: 16),

          // 3. Loại xe & Giá
          DropdownButtonFormField<VehicleType>(
            value: _selectedType,
            decoration: const InputDecoration(labelText: 'Loại xe'),
            items: VehicleType.values.map((v) => DropdownMenuItem(value: v, child: Text(v.name.toUpperCase()))).toList(),
            onChanged: (v) {
              if (v != null) setState(() => _selectedType = v);
            },
          ),
          const SizedBox(height: 16),
          
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: _calculatePrice,
                icon: const Icon(Icons.calculate),
                label: const Text('Tính cước'),
              ),
              const SizedBox(width: 16),
              Text('Cước: ${_estimatedPrice > 0 ? "${_estimatedPrice} VNĐ" : "---"}', style: const TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(height: 32),

          // 4. Phân tài xế
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tài xế khả dụng (Gần đây)', style: TextStyle(fontWeight: FontWeight.bold)),
              TextButton.icon(
                onPressed: _isSearching ? null : _searchDrivers,
                icon: _isSearching ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.search),
                label: const Text('Tìm'),
              )
            ],
          ),
          if (_nearbyDrivers.isNotEmpty)
            ..._nearbyDrivers.map((d) => ListTile(
              leading: const Icon(Icons.motorcycle),
              title: Text(d.fullName),
              subtitle: Text('Cách ${d.distanceKm} km'),
              trailing: const Chip(label: Text('Sẵn sàng'), backgroundColor: Colors.green),
            )).toList(),
          if (_nearbyDrivers.isEmpty && !_isSearching)
            const Text('Chưa tìm tài xế nào xung quanh.'),
            
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _createBooking,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
              child: const Text('XÁC NHẬN TẠO CUỐC', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
