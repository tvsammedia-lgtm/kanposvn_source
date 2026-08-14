import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/real_estate.dart';
import '../providers/real_estate_provider.dart';

class RealEstateCreateScreen extends ConsumerStatefulWidget {
  const RealEstateCreateScreen({super.key});

  @override
  ConsumerState<RealEstateCreateScreen> createState() => _RealEstateCreateScreenState();
}

class _RealEstateCreateScreenState extends ConsumerState<RealEstateCreateScreen> {
  final _titleCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();
  final _areaCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  
  String? _mockImageUrl;
  double? _lat;
  double? _lng;

  void _simulateCamera() {
    // Giả lập chụp ảnh: Random ra 1 ảnh nhà đẹp từ dummyimage
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    setState(() {
      _mockImageUrl = 'https://dummyimage.com/600x400/000/fff&text=Hinh+Anh+Chup+$timestamp';
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã chụp ảnh thành công!')));
  }

  Future<void> _simulateMapPicker() async {
    // Giả lập mở Google Maps để thả ghim
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Chọn vị trí trên bản đồ'),
          content: SizedBox(
            height: 200,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(color: Colors.blue.shade100),
                const Icon(Icons.location_on, size: 48, color: Colors.red),
                const Positioned(
                  bottom: 10,
                  child: Text('Di chuyển bản đồ để chọn', style: TextStyle(color: Colors.black54)),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _lat = 10.762622;
                  _lng = 106.660172;
                });
                Navigator.pop(context);
              },
              child: const Text('Xác nhận vị trí này'),
            )
          ],
        );
      }
    );
  }

  void _submit() {
    if (_titleCtrl.text.isEmpty || _priceCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng nhập đủ thông tin bắt buộc')));
      return;
    }

    final newBds = RealEstate()
      ..uuid = const Uuid().v4()
      ..title = _titleCtrl.text
      ..price = double.tryParse(_priceCtrl.text) ?? 0
      ..area = double.tryParse(_areaCtrl.text) ?? 0
      ..address = _addressCtrl.text
      ..description = _descCtrl.text
      ..imageUrl = _mockImageUrl ?? 'https://dummyimage.com/600x400/cccccc/000&text=No+Image'
      ..latitude = _lat
      ..longitude = _lng
      ..createdAt = DateTime.now();

    ref.read(realEstateProvider.notifier).addRealEstate(newBds);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng tin Bất động sản')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh
            GestureDetector(
              onTap: _simulateCamera,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12),
                  image: _mockImageUrl != null ? DecorationImage(image: NetworkImage(_mockImageUrl!), fit: BoxFit.cover) : null,
                ),
                child: _mockImageUrl == null
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, size: 48, color: Colors.grey),
                          SizedBox(height: 8),
                          Text('Bấm để chụp ảnh (Giả lập)'),
                        ],
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _titleCtrl,
              decoration: const InputDecoration(labelText: 'Tiêu đề tin đăng *', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _priceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Giá (VND) *', border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _areaCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Diện tích (m²)', border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _addressCtrl,
              decoration: const InputDecoration(labelText: 'Địa chỉ nhà', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            // Bản đồ
            ListTile(
              tileColor: Colors.blue.shade50,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              leading: const Icon(Icons.map, color: Colors.blue),
              title: const Text('Ghim vị trí trên bản đồ'),
              subtitle: Text(_lat != null ? 'Đã chọn tọa độ: $_lat, $_lng' : 'Chưa chọn vị trí'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _simulateMapPicker,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descCtrl,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Mô tả chi tiết', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
                child: const Text('ĐĂNG TIN NGAY', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
