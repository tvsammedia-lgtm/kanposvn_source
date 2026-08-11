import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/hotel_service.dart';
import '../providers/hotel_providers.dart';

class HotelServicesScreen extends ConsumerWidget {
  const HotelServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(hotelServiceItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dịch vụ & Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(hotelServiceItemsProvider.notifier).loadItems(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0284C7),
        onPressed: () => _showItemDialog(context, ref),
        child: const Icon(Icons.add),
      ),
      body: itemsAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('Chưa có dịch vụ nào. Hãy bấm + để thêm món.'));
          }
          final categories = items.map((i) => i.category).toSet().toList()..sort();
          return ListView(
            padding: const EdgeInsets.only(bottom: 80),
            children: [
              for (final cat in categories)
                _CategorySection(
                  category: cat,
                  items: items.where((i) => i.category == cat).toList(),
                ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  void _showItemDialog(BuildContext context, WidgetRef ref, [HotelServiceItem? existing]) {
    final nameCtrl = TextEditingController(text: existing?.itemName ?? '');
    final priceCtrl = TextEditingController(text: existing?.price.toString() ?? '');
    final categoryCtrl = TextEditingController(text: existing?.category ?? '');
    final allItems = ref.read(hotelServiceItemsProvider).valueOrNull ?? const <HotelServiceItem>[];
    final categories = allItems.map((i) => i.category).toSet().toList()..sort();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing == null ? 'Thêm món / dịch vụ' : 'Sửa món / dịch vụ'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Tên món / dịch vụ'),
              ),
              TextField(
                controller: priceCtrl,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: 'Giá (đ)'),
              ),
              TextField(
                controller: categoryCtrl,
                decoration: const InputDecoration(labelText: 'Nhóm (VD: CƠM, GIẢI KHÁT...)'),
              ),
              if (categories.isNotEmpty) ...[
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final c in categories)
                        ActionChip(
                          label: Text(c),
                          onPressed: () => categoryCtrl.text = c,
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('HỦY')),
          ElevatedButton(
            onPressed: () async {
              final name = nameCtrl.text.trim();
              final price = double.tryParse(priceCtrl.text) ?? 0;
              if (name.isEmpty) return;
              final item = existing ?? HotelServiceItem()..itemId = const Uuid().v4();
              item
                ..itemName = name
                ..price = price
                ..category = categoryCtrl.text.trim().isEmpty ? 'KHÁC' : categoryCtrl.text.trim().toUpperCase();
              await ref.read(hotelServiceItemsProvider.notifier).saveItem(item);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('LƯU'),
          ),
        ],
      ),
    );
  }
}

class _CategorySection extends ConsumerWidget {
  final String category;
  final List<HotelServiceItem> items;
  const _CategorySection({required this.category, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                  Text('${item.price.toStringAsFixed(0)} đ', style: const TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.edit, size: 20),
                    onPressed: () => _editItem(context, ref, item),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                    onPressed: () => _deleteItem(context, ref, item),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _editItem(BuildContext context, WidgetRef ref, HotelServiceItem item) {
    // Tái sử dụng dialog từ screen cha thông qua gọi lại - đơn giản mở dialog riêng
    showDialog(
      context: context,
      builder: (ctx) => _EditItemDialog(item: item),
    );
  }

  void _deleteItem(BuildContext context, WidgetRef ref, HotelServiceItem item) {
    showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xoá món?'),
        content: Text('Xoá "${item.itemName}" khỏi menu?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('HỦY')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('XOÁ', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    ).then((ok) async {
      if (ok == true) {
        await ref.read(hotelServiceItemsProvider.notifier).deleteItem(item.id);
      }
    });
  }
}

class _EditItemDialog extends ConsumerStatefulWidget {
  final HotelServiceItem item;
  const _EditItemDialog({required this.item});

  @override
  ConsumerState<_EditItemDialog> createState() => _EditItemDialogState();
}

class _EditItemDialogState extends ConsumerState<_EditItemDialog> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _priceCtrl;
  late final TextEditingController _categoryCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.item.itemName);
    _priceCtrl = TextEditingController(text: widget.item.price.toString());
    _categoryCtrl = TextEditingController(text: widget.item.category);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    _categoryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sửa món / dịch vụ'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameCtrl,
            decoration: const InputDecoration(labelText: 'Tên món / dịch vụ'),
          ),
          TextField(
            controller: _priceCtrl,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(labelText: 'Giá (đ)'),
          ),
          TextField(
            controller: _categoryCtrl,
            decoration: const InputDecoration(labelText: 'Nhóm'),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('HỦY')),
        ElevatedButton(
          onPressed: () async {
            final name = _nameCtrl.text.trim();
            if (name.isEmpty) return;
            widget.item
              ..itemName = name
              ..price = double.tryParse(_priceCtrl.text) ?? 0
              ..category = _categoryCtrl.text.trim().toUpperCase();
            await ref.read(hotelServiceItemsProvider.notifier).saveItem(widget.item);
            if (context.mounted) Navigator.pop(context);
          },
          child: const Text('LƯU'),
        ),
      ],
    );
  }
}
