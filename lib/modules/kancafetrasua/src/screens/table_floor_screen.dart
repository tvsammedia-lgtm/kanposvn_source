import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';

class TableFloorScreen extends ConsumerWidget {
  final Function(int) onNavigateToPos;

  const TableFloorScreen({super.key, required this.onNavigateToPos});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);
    final tables = ref.watch(tablesProvider);
    final selectedAreaId = ref.watch(selectedAreaIdProvider);

    final filteredTables = selectedAreaId == null
        ? tables
        : tables.where((t) => t.areaId == selectedAreaId).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Sơ Đồ Bàn', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.add_location_alt, color: Color(0xFF4A2C2A), size: 22),
                      onPressed: () => _showAddAreaDialog(context, ref),
                      tooltip: 'Thêm khu vực',
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Color(0xFF4A2C2A), size: 24),
                      onPressed: () => _showAddTableDialog(context, ref),
                      tooltip: 'Thêm bàn',
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 36,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ChoiceChip(
                        label: const Text('Tất cả', style: TextStyle(fontSize: 11)),
                        selected: selectedAreaId == null,
                        onSelected: (_) => ref.read(selectedAreaIdProvider.notifier).state = null,
                        selectedColor: Colors.brown,
                        labelStyle: TextStyle(color: selectedAreaId == null ? Colors.white : Colors.black),
                        visualDensity: VisualDensity.compact,
                      ),
                      const SizedBox(width: 4),
                      ...db.areas.map((area) {
                        final isSel = selectedAreaId == area.id;
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: GestureDetector(
                            onLongPress: () => _showAreaActions(context, ref, area),
                            child: ChoiceChip(
                              label: Text(area.name, style: const TextStyle(fontSize: 11)),
                              selected: isSel,
                              onSelected: (_) => ref.read(selectedAreaIdProvider.notifier).state = isSel ? null : area.id,
                              selectedColor: Colors.brown,
                              labelStyle: TextStyle(color: isSel ? Colors.white : Colors.black),
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 20,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _legend('Trống', const Color(0xFF2E7D32)),
                      _legend('Có khách', const Color(0xFFC62828)),
                      _legend('Gọi món', const Color(0xFF1565C0)),
                      _legend('Phục vụ', const Color(0xFF6A1B9A)),
                      _legend('Chờ TT', const Color(0xFFEF6C00)),
                      _legend('Dọn', const Color(0xFF616161)),
                      _legend('Đặt trước', const Color(0xFFF57F17)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 180,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: MediaQuery.of(context).size.height > 500 ? 1.1 : 0.9,
                ),
                itemCount: filteredTables.length,
                itemBuilder: (context, index) {
                  final table = filteredTables[index];
                  final color = _color(table.status);
                  return InkWell(
                    onTap: () => _showTableActions(context, ref, table),
                    onLongPress: () => _showEditTableDialog(context, ref, table),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: color, width: 2),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 3, offset: Offset(0, 1))],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text(table.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis)),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                                child: Text(table.status.label, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: color)),
                              ),
                            ],
                          ),
                          Text(table.areaName, style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                          const Spacer(),
                          if (table.currentCustomerName != null)
                            Text(table.currentCustomerName!, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${table.seats} ghế', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                              if (table.occupiedAt != null)
                                Text(_duration(table.occupiedAt!), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.brown)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _legend(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 11)),
      ]),
    );
  }

  Color _color(TableStatus s) {
    switch (s) {
      case TableStatus.empty: return const Color(0xFF2E7D32);
      case TableStatus.occupied: return const Color(0xFFC62828);
      case TableStatus.ordering: return const Color(0xFF1565C0);
      case TableStatus.serving: return const Color(0xFF6A1B9A);
      case TableStatus.pendingPayment: return const Color(0xFFEF6C00);
      case TableStatus.paid: return const Color(0xFF00695C);
      case TableStatus.cleaning: return const Color(0xFF616161);
      case TableStatus.reserved: return const Color(0xFFF57F17);
    }
  }

  String _duration(DateTime t) {
    final d = DateTime.now().difference(t);
    return '${d.inHours.toString().padLeft(2, '0')}:${(d.inMinutes % 60).toString().padLeft(2, '0')}';
  }

  // ===== ADD AREA =====
  void _showAddAreaDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm khu vực mới'),
        content: TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên khu vực', hintText: 'VD: Tầng 3, Sân thượng')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isEmpty) return;
              final db = ref.read(dbProvider);
              final area = AreaModel(
                id: 'area_${DateTime.now().millisecondsSinceEpoch}',
                name: nameCtrl.text,
                displayOrder: db.areas.length + 1,
              );
              db.addArea(area);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã thêm khu vực "${area.name}"')));
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  // ===== AREA ACTIONS (Edit / Delete) =====
  void _showAreaActions(BuildContext context, WidgetRef ref, AreaModel area) {
    final db = ref.read(dbProvider);
    final tableCount = ref.read(tablesProvider).where((t) => t.areaId == area.id).length;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40, height: 4,
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(area.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('$tableCount bàn trong khu vực này', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text('Sửa tên khu vực'),
              onTap: () {
                Navigator.pop(ctx);
                _showEditAreaDialog(context, ref, area);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: tableCount > 0 ? Colors.grey : Colors.red),
              title: Text('Xóa khu vực', style: TextStyle(color: tableCount > 0 ? Colors.grey : Colors.red)),
              subtitle: tableCount > 0 ? const Text('Phải chuyển hoặc xóa hết bàn trước') : null,
              enabled: tableCount == 0,
              onTap: () {
                Navigator.pop(ctx);
                _confirmDeleteArea(context, ref, area);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showEditAreaDialog(BuildContext context, WidgetRef ref, AreaModel area) {
    final nameCtrl = TextEditingController(text: area.name);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sửa khu vực'),
        content: TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên khu vực')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isEmpty) return;
              final updated = AreaModel(id: area.id, name: nameCtrl.text, displayOrder: area.displayOrder);
              ref.read(dbProvider).updateArea(updated);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã cập nhật "${updated.name}"')));
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteArea(BuildContext context, WidgetRef ref, AreaModel area) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa khu vực'),
        content: Text('Xóa "${area.name}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              ref.read(dbProvider).deleteArea(area.id);
              ref.read(selectedAreaIdProvider.notifier).state = null;
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã xóa "${area.name}"')));
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // ===== ADD TABLE =====
  void _showAddTableDialog(BuildContext context, WidgetRef ref) {
    final db = ref.read(dbProvider);
    final areas = db.areas;
    final nameCtrl = TextEditingController();
    final seatsCtrl = TextEditingController(text: '4');
    String? areaId = areas.isNotEmpty ? areas.first.id : null;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, set) => AlertDialog(
          title: const Text('Thêm bàn mới'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên bàn', hintText: 'VD: Bàn B11')),
              const SizedBox(height: 12),
              TextField(controller: seatsCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Số ghế')),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: areaId,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Khu vực'),
                items: areas.map((a) => DropdownMenuItem(value: a.id, child: Text(a.name))).toList(),
                onChanged: (v) => set(() => areaId = v),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.isEmpty || areaId == null) return;
                final area = areas.firstWhere((a) => a.id == areaId);
                final table = TableModel(
                  id: 'tbl_${DateTime.now().millisecondsSinceEpoch}',
                  areaId: areaId!,
                  areaName: area.name,
                  name: nameCtrl.text,
                  seats: int.tryParse(seatsCtrl.text) ?? 4,
                  status: TableStatus.empty,
                );
                db.addTable(table);
                ref.read(tablesProvider.notifier).loadTables();
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã thêm ${table.name}')));
              },
              child: const Text('Thêm'),
            ),
          ],
        ),
      ),
    );
  }

  // ===== EDIT TABLE =====
  void _showEditTableDialog(BuildContext context, WidgetRef ref, TableModel table) {
    final db = ref.read(dbProvider);
    final areas = db.areas;
    final nameCtrl = TextEditingController(text: table.name);
    final seatsCtrl = TextEditingController(text: '${table.seats}');
    String areaId = table.areaId;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, set) => AlertDialog(
          title: const Text('Sửa bàn'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên bàn')),
              const SizedBox(height: 12),
              TextField(controller: seatsCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Số ghế')),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: areaId,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Khu vực'),
                items: areas.map((a) => DropdownMenuItem(value: a.id, child: Text(a.name))).toList(),
                onChanged: (v) => set(() => areaId = v!),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                _confirmDelete(context, ref, table);
              },
              child: const Text('Xóa bàn', style: TextStyle(color: Colors.red)),
            ),
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.isEmpty) return;
                final area = areas.firstWhere((a) => a.id == areaId);
                final updated = table.copyWith(
                  name: nameCtrl.text,
                  seats: int.tryParse(seatsCtrl.text) ?? table.seats,
                  areaId: areaId,
                  areaName: area.name,
                );
                db.updateTable(updated);
                ref.read(tablesProvider.notifier).loadTables();
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã cập nhật ${updated.name}')));
              },
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }

  // ===== DELETE TABLE =====
  void _confirmDelete(BuildContext context, WidgetRef ref, TableModel table) {
    if (table.status != TableStatus.empty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không thể xóa bàn đang có khách'), backgroundColor: Colors.orange),
      );
      return;
    }
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa bàn'),
        content: Text('Xóa "${table.name}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              ref.read(dbProvider).deleteTable(table.id);
              ref.read(tablesProvider.notifier).loadTables();
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã xóa ${table.name}')));
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // ===== TABLE ACTIONS =====
  void _showTableActions(BuildContext context, WidgetRef ref, TableModel table) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: MediaQuery.of(ctx).viewInsets.bottom + 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: _color(table.status).withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                child: Icon(Icons.table_restaurant, color: _color(table.status), size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${table.name} (${table.areaName})', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(table.status.label, style: TextStyle(color: _color(table.status), fontSize: 12)),
              ])),
              IconButton(onPressed: () => Navigator.pop(ctx), icon: const Icon(Icons.close, size: 20)),
            ]),
            const Divider(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 3,
              children: [
                ElevatedButton.icon(
                  onPressed: table.status == TableStatus.cleaning
                      ? null
                      : () {
                          Navigator.pop(ctx);
                          // If empty, auto-open table first
                          if (table.status == TableStatus.empty) {
                            ref.read(tablesProvider.notifier).updateTableStatus(table.id, TableStatus.occupied);
                          }
                          ref.read(cartProvider.notifier).selectTable(table);
                          _showOrderDialog(context, ref, table);
                        },
                  icon: const Icon(Icons.add_shopping_cart, size: 16),
                  label: Text(table.status == TableStatus.empty ? 'Mở bàn & Gọi món' : 'Gọi món', style: const TextStyle(fontSize: 12)),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A2C2A), foregroundColor: Colors.white),
                ),
                OutlinedButton.icon(
                  onPressed: () { Navigator.pop(ctx); _showTransferDialog(context, ref, table); },
                  icon: const Icon(Icons.move_up, size: 16),
                  label: const Text('Chuyển bàn', style: TextStyle(fontSize: 12)),
                ),
                OutlinedButton.icon(
                  onPressed: () { Navigator.pop(ctx); _showMergeDialog(context, ref, table); },
                  icon: const Icon(Icons.merge_type, size: 16),
                  label: const Text('Ghép bàn', style: TextStyle(fontSize: 12)),
                ),
                OutlinedButton.icon(
                  onPressed: table.status == TableStatus.empty
                      ? () { ref.read(tablesProvider.notifier).updateTableStatus(table.id, TableStatus.occupied); Navigator.pop(ctx); }
                      : table.status == TableStatus.cleaning
                          ? () { ref.read(tablesProvider.notifier).updateTableStatus(table.id, TableStatus.empty); Navigator.pop(ctx); }
                          : null,
                  icon: Icon(table.status == TableStatus.empty ? Icons.person_add : table.status == TableStatus.cleaning ? Icons.cleaning_services : Icons.block, size: 16),
                  label: Text(table.status == TableStatus.empty ? 'Mở bàn' : table.status == TableStatus.cleaning ? 'Dọn bàn' : 'Đang có KH', style: const TextStyle(fontSize: 12)),
                ),
                OutlinedButton.icon(
                  onPressed: () { Navigator.pop(ctx); _showEditTableDialog(context, ref, table); },
                  icon: const Icon(Icons.edit, size: 16),
                  label: const Text('Sửa bàn', style: TextStyle(fontSize: 12)),
                ),
                OutlinedButton.icon(
                  onPressed: table.status != TableStatus.empty ? null : () { Navigator.pop(ctx); _confirmDelete(context, ref, table); },
                  icon: const Icon(Icons.delete, size: 16, color: Colors.red),
                  label: const Text('Xóa bàn', style: TextStyle(fontSize: 12, color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showTransferDialog(BuildContext context, WidgetRef ref, TableModel from) {
    final tables = ref.read(tablesProvider).where((t) => t.id != from.id && t.status == TableStatus.empty).toList();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Chuyển ${from.name} sang bàn mới'),
        content: SizedBox(width: 300, child: ListView.builder(
          shrinkWrap: true,
          itemCount: tables.length,
          itemBuilder: (_, i) {
            final t = tables[i];
            return ListTile(
              title: Text('${t.name} (${t.areaName})'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () {
                ref.read(tablesProvider.notifier).transferTable(from.id, t.id);
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã chuyển ${from.name} sang ${t.name}')));
              },
            );
          },
        )),
      ),
    );
  }

  void _showMergeDialog(BuildContext context, WidgetRef ref, TableModel primary) {
    final tables = ref.read(tablesProvider).where((t) => t.id != primary.id && t.status != TableStatus.empty).toList();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ghép bàn vào ${primary.name}'),
        content: SizedBox(width: 300, child: ListView.builder(
          shrinkWrap: true,
          itemCount: tables.length,
          itemBuilder: (_, i) {
            final t = tables[i];
            return ListTile(
              title: Text('${t.name} (${t.areaName})'),
              subtitle: Text('Khách: ${t.currentCustomerName ?? "Khách"}'),
              onTap: () {
                ref.read(tablesProvider.notifier).mergeTables(primary.id, t.id);
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã ghép ${t.name} vào ${primary.name}')));
              },
            );
          },
        )),
      ),
    );
  }

  // ===== ORDER DIALOG =====
  void _showOrderDialog(BuildContext context, WidgetRef ref, TableModel table) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (ctx) => _OrderDialogContent(table: table, onNavigateToPos: onNavigateToPos),
    );
  }
}

class _OrderDialogContent extends ConsumerStatefulWidget {
  final TableModel table;
  final Function(int) onNavigateToPos;

  const _OrderDialogContent({required this.table, required this.onNavigateToPos});

  @override
  ConsumerState<_OrderDialogContent> createState() => _OrderDialogContentState();
}

class _OrderDialogContentState extends ConsumerState<_OrderDialogContent> {
  String? _selectedCategoryId;
  String _searchQuery = '';
  String _tab = 'menu'; // 'menu' or 'cart'

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    final db = ref.watch(dbProvider);
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    final filteredProducts = db.products.where((p) {
      bool catMatch = _selectedCategoryId == null || p.categoryId == _selectedCategoryId;
      bool searchMatch = _searchQuery.isEmpty ||
          p.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.code.toLowerCase().contains(_searchQuery.toLowerCase());
      return catMatch && searchMatch;
    }).toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (ctx, scrollController) => Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF4A2C2A),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(2))),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.table_restaurant, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Text('Gọi món - ${widget.table.name}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                    const Spacer(),
                    if (cart.items.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(12)),
                        child: Text('${cart.items.length}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => Navigator.pop(ctx),
                      icon: const Icon(Icons.close, color: Colors.white, size: 22),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Tab buttons
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _tab = 'menu'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: _tab == 'menu' ? Colors.white : Colors.white10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text('Thực đơn', style: TextStyle(
                              color: _tab == 'menu' ? const Color(0xFF4A2C2A) : Colors.white,
                              fontWeight: FontWeight.w600, fontSize: 13,
                            )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _tab = 'cart'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: _tab == 'cart' ? Colors.white : Colors.white10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Giỏ hàng', style: TextStyle(
                                  color: _tab == 'cart' ? const Color(0xFF4A2C2A) : Colors.white,
                                  fontWeight: FontWeight.w600, fontSize: 13,
                                )),
                                if (cart.items.isNotEmpty) ...[
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                    decoration: BoxDecoration(color: const Color(0xFF4A2C2A), borderRadius: BorderRadius.circular(8)),
                                    child: Text('${cart.items.length}', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: _tab == 'menu'
                ? _buildMenuTab(currency, db, filteredProducts, cartNotifier)
                : _buildCartTab(currency, cart, cartNotifier),
          ),

          // Bottom bar - total & checkout
          if (cart.items.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${cart.items.length} món', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      Text(currency.format(cart.totalAmount), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      final order = cartNotifier.checkout(paymentMethod: 'CASH', paymentStatus: 'PAID');
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Đã tạo đơn ${order.orderCode} - ${currency.format(order.totalAmount)}')),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D32), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                    child: const Text('Thanh toán', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMenuTab(NumberFormat currency, dynamic db, List filteredProducts, cartNotifier) {
    return Column(
      children: [
        // Search
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            onChanged: (v) => setState(() => _searchQuery = v),
            decoration: InputDecoration(
              hintText: 'Tìm món...',
              prefixIcon: const Icon(Icons.search, size: 20),
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
            ),
          ),
        ),
        // Categories
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              ChoiceChip(
                label: const Text('Tất cả', style: TextStyle(fontSize: 11)),
                selected: _selectedCategoryId == null,
                onSelected: (_) => setState(() => _selectedCategoryId = null),
                selectedColor: const Color(0xFF4A2C2A),
                labelStyle: TextStyle(color: _selectedCategoryId == null ? Colors.white : Colors.black),
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(width: 4),
              ...db.categories.map((cat) {
                final isSel = _selectedCategoryId == cat.id;
                return Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: ChoiceChip(
                    label: Text(cat.name, style: const TextStyle(fontSize: 11)),
                    selected: isSel,
                    onSelected: (_) => setState(() => _selectedCategoryId = isSel ? null : cat.id),
                    selectedColor: const Color(0xFF4A2C2A),
                    labelStyle: TextStyle(color: isSel ? Colors.white : Colors.black),
                    visualDensity: VisualDensity.compact,
                  ),
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Products grid
        Expanded(
          child: filteredProducts.isEmpty
              ? const Center(child: Text('Không tìm thấy món', style: TextStyle(color: Colors.grey)))
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 160, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 0.85),
                  itemCount: filteredProducts.length,
                  itemBuilder: (ctx, i) {
                    final p = filteredProducts[i];
                    return GestureDetector(
                      onTap: () => _showProductDetail(ctx, ref, p, currency),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4A2C2A).withValues(alpha: 0.06),
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                                ),
                                child: Icon(Icons.coffee_rounded, size: 32, color: const Color(0xFF4A2C2A).withValues(alpha: 0.4)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11), maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
                                  const SizedBox(height: 4),
                                  Text(currency.format(p.basePrice), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF4A2C2A))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildCartTab(NumberFormat currency, CartState cart, cartNotifier) {
    if (cart.items.isEmpty) {
      return const Center(child: Text('Chưa có món trong giỏ', style: TextStyle(color: Colors.grey)));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: cart.items.length,
      itemBuilder: (ctx, i) {
        final item = cart.items[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.productName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    if (item.sizeName.isNotEmpty || item.selectedToppings.isNotEmpty)
                      Text(
                        [if (item.sizeName.isNotEmpty) 'Size ${item.sizeName}', ...item.selectedToppings.map((t) => t.name)].join(', '),
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => cartNotifier.updateQuantity(i, -1),
                    icon: const Icon(Icons.remove_circle_outline, size: 20, color: Colors.grey),
                  ),
                  Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  IconButton(
                    onPressed: () => cartNotifier.updateQuantity(i, 1),
                    icon: const Icon(Icons.add_circle, size: 20, color: Color(0xFF4A2C2A)),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Text(currency.format(item.totalPrice), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF4A2C2A))),
            ],
          ),
        );
      },
    );
  }

  void _showProductDetail(BuildContext context, WidgetRef ref, ProductModel product, NumberFormat currency) {
    String selectedSize = product.sizes.isNotEmpty ? product.sizes.first.name : '';
    final Set<String> selectedToppings = {};
    int quantity = 1;
    final noteCtrl = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModal) {
          double unitPrice = product.basePrice;
          if (selectedSize.isNotEmpty && product.sizes.isNotEmpty) {
            final sizeObj = product.sizes.firstWhere((s) => s.name == selectedSize, orElse: () => product.sizes.first);
            unitPrice += sizeObj.extraPrice;
          }
          for (final tName in selectedToppings) {
            if (product.toppings.isNotEmpty) {
              final tObj = product.toppings.firstWhere((t) => t.name == tName, orElse: () => product.toppings.first);
              unitPrice += tObj.price;
            }
          }

          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom, left: 20, right: 20, top: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)))),
                  const SizedBox(height: 12),
                  Text(product.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(currency.format(product.basePrice), style: const TextStyle(color: Color(0xFF4A2C2A), fontWeight: FontWeight.w600)),
                  if (product.sizes.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    const Text('Size', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: product.sizes.map((size) {
                        final isSel = selectedSize == size.name;
                        return ChoiceChip(
                          label: Text('${size.name}${size.extraPrice > 0 ? ' (+${currency.format(size.extraPrice)})' : ''}'),
                          selected: isSel,
                          onSelected: (_) => setModal(() => selectedSize = size.name),
                          selectedColor: const Color(0xFF4A2C2A).withValues(alpha: 0.15),
                          labelStyle: TextStyle(color: isSel ? const Color(0xFF4A2C2A) : Colors.grey[600]),
                        );
                      }).toList(),
                    ),
                  ],
                  if (product.toppings.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    const Text('Topping', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8, runSpacing: 8,
                      children: product.toppings.map((t) {
                        final isSel = selectedToppings.contains(t.name);
                        return FilterChip(
                          label: Text('${t.name} (+${currency.format(t.price)})'),
                          selected: isSel,
                          onSelected: (sel) => setModal(() {
                            if (sel) { selectedToppings.add(t.name); } else { selectedToppings.remove(t.name); }
                          }),
                          selectedColor: const Color(0xFF4A2C2A).withValues(alpha: 0.15),
                          labelStyle: TextStyle(color: isSel ? const Color(0xFF4A2C2A) : Colors.grey[600]),
                        );
                      }).toList(),
                    ),
                  ],
                  const SizedBox(height: 16),
                  TextField(controller: noteCtrl, decoration: const InputDecoration(hintText: 'Ghi chú...', isDense: true)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: quantity > 1 ? () => setModal(() => quantity--) : null,
                              icon: const Icon(Icons.remove, size: 18),
                            ),
                            Text('$quantity', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            IconButton(
                              onPressed: () => setModal(() => quantity++),
                              icon: const Icon(Icons.add, size: 18),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(currency.format(unitPrice * quantity), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF4A2C2A))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final toppings = product.toppings.where((t) => selectedToppings.contains(t.name)).toList();
                        double sizeExtra = 0;
                        if (selectedSize.isNotEmpty && product.sizes.isNotEmpty) {
                          final sizeObj = product.sizes.firstWhere((s) => s.name == selectedSize, orElse: () => product.sizes.first);
                          sizeExtra = sizeObj.extraPrice;
                        }
                        ref.read(cartProvider.notifier).addItem(product,
                          sizeName: selectedSize,
                          sizeExtraPrice: sizeExtra,
                          toppings: toppings,
                          note: noteCtrl.text,
                        );
                        // Update quantity
                        for (var j = 1; j < quantity; j++) {
                          ref.read(cartProvider.notifier).updateQuantity(ref.read(cartProvider).items.length - 1, 1);
                        }
                        Navigator.pop(ctx);
                        setState(() => _tab = 'cart');
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A2C2A), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 12)),
                      child: const Text('Thêm vào giỏ', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
