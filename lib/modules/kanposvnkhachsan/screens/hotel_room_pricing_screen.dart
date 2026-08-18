import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/hotel_room.dart';
import '../models/hotel_service.dart';
import '../providers/hotel_providers.dart';

class HotelRoomPricingScreen extends ConsumerStatefulWidget {
  const HotelRoomPricingScreen({super.key});

  @override
  ConsumerState<HotelRoomPricingScreen> createState() => _HotelRoomPricingScreenState();
}

class _HotelRoomPricingScreenState extends ConsumerState<HotelRoomPricingScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thiết lập Phòng / Món Ăn'),
        backgroundColor: const Color(0xFF0284C7),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.hotel), text: 'Giá Phòng'),
            Tab(icon: Icon(Icons.restaurant_menu), text: 'Danh sách Món'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _RoomTypePricingTab(),
          _ServiceItemPricingTab(),
        ],
      ),
    );
  }
}

// Tab 1: Giá Phòng
class _RoomTypePricingTab extends ConsumerWidget {
  const _RoomTypePricingTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typesAsync = ref.watch(hotelRoomTypesProvider);
    return typesAsync.when(
      data: (types) {
        if (types.isEmpty) {
          return const Center(child: Text('Chưa có loại phòng nào.'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: types.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) => _RoomTypeCard(type: types[index], ref: ref),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('Lỗi: $err')),
    );
  }
}

class _RoomTypeCard extends StatelessWidget {
  final RoomType type;
  final WidgetRef ref;
  const _RoomTypeCard({required this.type, required this.ref});

  @override
  Widget build(BuildContext context) {
    final hasTimeSlots = type.overnightPricesByTimeSlot.isNotEmpty && type.overnightPricesByTimeSlot.any((p) => p > 0);
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: const Icon(Icons.hotel, color: Color(0xFF0284C7), size: 32),
        title: Text(
          type.typeName.isEmpty ? 'Chưa đặt tên' : type.typeName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Giờ: ${type.hourlyPrice.toStringAsFixed(0)}đ (+${type.hourlyExtraHour.toStringAsFixed(0)}đ/giờ)'),
            Text('Ngày: ${type.basePrice.toStringAsFixed(0)}đ'),
            if (hasTimeSlots)
              Text('Đêm: ${type.overnightPricesByTimeSlot[0].toStringAsFixed(0)}đ / '
                  '${type.overnightPricesByTimeSlot[2].toStringAsFixed(0)}đ (22h)')
            else
              Text('Đêm: ${type.overnightPrice.toStringAsFixed(0)}đ'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, size: 20),
          onPressed: () => _editRoomType(context, ref),
        ),
      ),
    );
  }

  void _editRoomType(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController(text: type.typeName);
    final baseCtrl = TextEditingController(text: type.basePrice.toStringAsFixed(0));
    final hourlyCtrl = TextEditingController(text: type.hourlyPrice.toStringAsFixed(0));
    final extraCtrl = TextEditingController(text: type.hourlyExtraHour.toStringAsFixed(0));
    final overnightCtrl = TextEditingController(text: type.overnightPrice.toStringAsFixed(0));
    // Qua đêm theo khung giờ
    final ov1Ctrl = TextEditingController(text: (type.overnightPricesByTimeSlot.isNotEmpty ? type.overnightPricesByTimeSlot[0] : 0).toStringAsFixed(0));
    final ov2Ctrl = TextEditingController(text: (type.overnightPricesByTimeSlot.length > 1 ? type.overnightPricesByTimeSlot[1] : 0).toStringAsFixed(0));
    final ov3Ctrl = TextEditingController(text: (type.overnightPricesByTimeSlot.length > 2 ? type.overnightPricesByTimeSlot[2] : 0).toStringAsFixed(0));
    final ov4Ctrl = TextEditingController(text: (type.overnightPricesByTimeSlot.length > 3 ? type.overnightPricesByTimeSlot[3] : 0).toStringAsFixed(0));
    // Giá ngày theo thứ
    final dayCtrls = List.generate(7, (i) =>
        TextEditingController(text: (type.dailyPricesByWeekday.length > i ? type.dailyPricesByWeekday[i] : 0).toStringAsFixed(0)));

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Sửa: ${type.typeName}', style: const TextStyle(fontSize: 18)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên loại phòng', border: OutlineInputBorder())),
              const SizedBox(height: 12),
              _priceField(controller: hourlyCtrl, label: 'Giá giờ đầu (đ)'),
              const SizedBox(height: 12),
              _priceField(controller: extraCtrl, label: 'Giá giờ thêm (đ)'),
              const SizedBox(height: 12),
              _priceField(controller: baseCtrl, label: 'Giá ngày (đ)'),
              const SizedBox(height: 12),
              _priceField(controller: overnightCtrl, label: 'Giá qua đêm mặc định (đ)'),
              const Divider(height: 24),
              const Text('Qua đêm theo giờ check-in:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _priceField(controller: ov1Ctrl, label: '18h-20h (đ)'),
              const SizedBox(height: 8),
              _priceField(controller: ov2Ctrl, label: '20h-22h (đ)'),
              const SizedBox(height: 8),
              _priceField(controller: ov3Ctrl, label: '22h-2h — cao nhất (đ)'),
              const SizedBox(height: 8),
              _priceField(controller: ov4Ctrl, label: '2h-12h (đ)'),
              const Divider(height: 24),
              const Text('Giá ngày theo thứ:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              for (int i = 0; i < 7; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _priceField(controller: dayCtrls[i], label: '${_weekdayName(i)} (đ)'),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('HỦY')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () async {
              type
                ..typeName = nameCtrl.text.trim()
                ..basePrice = double.tryParse(baseCtrl.text) ?? 0
                ..hourlyPrice = double.tryParse(hourlyCtrl.text) ?? 0
                ..hourlyExtraHour = double.tryParse(extraCtrl.text) ?? 0
                ..overnightPrice = double.tryParse(overnightCtrl.text) ?? 0
                ..overnightPricesByTimeSlot = [
                  double.tryParse(ov1Ctrl.text) ?? 0,
                  double.tryParse(ov2Ctrl.text) ?? 0,
                  double.tryParse(ov3Ctrl.text) ?? 0,
                  double.tryParse(ov4Ctrl.text) ?? 0,
                ]
                ..dailyPricesByWeekday = dayCtrls.map((c) => double.tryParse(c.text) ?? 0).toList();
              await ref.read(hotelRoomTypesProvider.notifier).saveType(type);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('LƯU', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  static String _weekdayName(int idx) {
    const names = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    return names[idx];
  }
}

// Tab 2: Danh sách Món
class _ServiceItemPricingTab extends ConsumerWidget {
  const _ServiceItemPricingTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(hotelServiceItemsProvider);
    return itemsAsync.when(
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('Chưa có món nào.'));
        }
        final categories = items.map((i) => i.category).toSet().toList()..sort();
        return ListView(
          padding: const EdgeInsets.all(12),
          children: [
            for (final cat in categories)
              _CategorySection(
                category: cat,
                items: items.where((i) => i.category == cat).toList(),
                ref: ref,
              ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('Lỗi: $err')),
    );
  }
}

class _CategorySection extends StatelessWidget {
  final String category;
  final List<HotelServiceItem> items;
  final WidgetRef ref;
  const _CategorySection({required this.category, required this.items, required this.ref});

  void _editItem(BuildContext context, WidgetRef ref, HotelServiceItem item) {
    final nameCtrl = TextEditingController(text: item.itemName);
    final priceCtrl = TextEditingController(text: item.price.toStringAsFixed(0));
    final categoryCtrl = TextEditingController(text: item.category);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sửa món / dịch vụ'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Tên món / dịch vụ', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: priceCtrl,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: 'Giá (đ)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: categoryCtrl,
                decoration: const InputDecoration(labelText: 'Nhóm', border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('HỦY')),
          ElevatedButton(
            onPressed: () async {
              item
                ..itemName = nameCtrl.text.trim()
                ..price = double.tryParse(priceCtrl.text) ?? 0
                ..category = categoryCtrl.text.trim().isEmpty ? 'KHÁC' : categoryCtrl.text.trim().toUpperCase();
              await ref.read(hotelServiceItemsProvider.notifier).saveItem(item);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('LƯU', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${items.length} món'),
        children: [
          for (final item in items)
            ListTile(
              title: Text(item.itemName),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${item.price.toStringAsFixed(0)} đ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.edit, size: 20),
                    onPressed: () => _editItem(context, ref, item),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

Widget _priceField({required TextEditingController controller, required String label}) {
  return TextField(
    controller: controller,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
  );
}
