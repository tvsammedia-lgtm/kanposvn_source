import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';

class TableManagementScreen extends ConsumerStatefulWidget {
  const TableManagementScreen({super.key});

  @override
  ConsumerState<TableManagementScreen> createState() => _TableManagementScreenState();
}

class _TableManagementScreenState extends ConsumerState<TableManagementScreen> {
  final _uuid = const Uuid();

  // ===================== AREA CRUD =====================

  void _showAddAreaDialog() {
    final nameController = TextEditingController();
    final tableCountController = TextEditingController(text: '4');
    final chairCountController = TextEditingController(text: '4');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm khu vực mới'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Tên khu vực', hintText: 'VD: Tầng 3, Sân thượng...', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: tableCountController, decoration: const InputDecoration(labelText: 'Số lượng bàn', border: OutlineInputBorder()), keyboardType: TextInputType.number),
            const SizedBox(height: 12),
            TextField(controller: chairCountController, decoration: const InputDecoration(labelText: 'Số ghế/bàn', border: OutlineInputBorder()), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty) return;
              final name = nameController.text.trim();
              final tableCount = int.tryParse(tableCountController.text) ?? 4;
              final chairCount = int.tryParse(chairCountController.text) ?? 4;

              final db = ref.read(dbProvider);
              final areaId = 'area_${_uuid.v4().substring(0, 8)}';
              final area = AreaModel(id: areaId, name: name, displayOrder: db.areas.length + 1);
              db.addArea(area);

              // Auto-create tables
              for (int i = 1; i <= tableCount; i++) {
              db.addTable(TableModel(
                id: 'tbl_${_uuid.v4().substring(0, 8)}',
                areaId: areaId,
                areaName: name,
                name: '$name - B$i',
                seats: chairCount,
                status: TableStatus.empty,
              ));
              }

              ref.read(tablesProvider.notifier).loadTables();
              setState(() {});
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã thêm "$name" với $tableCount bàn')));
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  void _showEditAreaDialog(AreaModel area) {
    final nameController = TextEditingController(text: area.name);
    final db = ref.read(dbProvider);
    final currentTableCount = db.tables.where((t) => t.areaId == area.id).length;
    final tableCountController = TextEditingController(text: currentTableCount.toString());
    final chairCountController = TextEditingController(text: '4');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Sửa khu vực: ${area.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Tên khu vực', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: tableCountController, decoration: InputDecoration(labelText: 'Số bàn hiện tại: $currentTableCount', border: OutlineInputBorder()), keyboardType: TextInputType.number),
            const SizedBox(height: 8),
            Text('Nhập số bàn mới để thêm/xóa tự động', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
            const SizedBox(height: 12),
            TextField(controller: chairCountController, decoration: const InputDecoration(labelText: 'Số ghế/bàn mới', border: OutlineInputBorder()), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              final newName = nameController.text.trim();
              final newTableCount = int.tryParse(tableCountController.text) ?? currentTableCount;
              final chairCount = int.tryParse(chairCountController.text) ?? 4;

              // Update area name
              db.updateArea(AreaModel(id: area.id, name: newName, displayOrder: area.displayOrder));

              // Adjust table count
              final existingTables = db.tables.where((t) => t.areaId == area.id).toList();
              final diff = newTableCount - existingTables.length;

              if (diff > 0) {
                // Add tables
                for (int i = 1; i <= diff; i++) {
                  db.addTable(TableModel(
                    id: 'tbl_${_uuid.v4().substring(0, 8)}',
                    areaId: area.id,
                    areaName: newName,
                    name: '$newName - B${existingTables.length + i}',
                    seats: chairCount,
                    status: TableStatus.empty,
                  ));
                }
              } else if (diff < 0) {
                // Remove excess tables (keep occupied ones, remove empty ones)
                final removable = existingTables.where((t) => t.status == TableStatus.empty).toList();
                final toRemove = removable.take(-diff).toList();
                for (var t in toRemove) {
                  db.deleteTable(t.id);
                }
              }

              ref.read(tablesProvider.notifier).loadTables();
              setState(() {});
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã cập nhật "$newName"')));
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  void _deleteArea(AreaModel area) {
    final db = ref.read(dbProvider);
    final tableCount = db.tables.where((t) => t.areaId == area.id).length;
    final hasActive = db.tables.any((t) => t.areaId == area.id && t.status != TableStatus.empty);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa khu vực'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Xóa khu vực "${area.name}" và $tableCount bàn?'),
            if (hasActive) ...[
              const SizedBox(height: 8),
              const Text('Cảnh báo: Có bàn đang có khách!', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ],
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              db.deleteArea(area.id);
              ref.read(tablesProvider.notifier).loadTables();
              setState(() {});
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã xóa "${area.name}"')));
            },
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }

  // ===================== TABLE CRUD =====================

  void _showAddTableDialog(AreaModel area) {
    final nameController = TextEditingController(text: '${area.name} - B');
    final seatsController = TextEditingController(text: '4');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Thêm bàn vào ${area.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Tên bàn', hintText: 'VD: Bàn B1', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: seatsController, decoration: const InputDecoration(labelText: 'Số ghế', border: OutlineInputBorder()), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty) return;
              final db = ref.read(dbProvider);
              db.addTable(TableModel(
                id: 'tbl_${_uuid.v4().substring(0, 8)}',
                areaId: area.id,
                areaName: area.name,
                name: nameController.text.trim(),
                seats: int.tryParse(seatsController.text) ?? 4,
                status: TableStatus.empty,
              ));
              ref.read(tablesProvider.notifier).loadTables();
              setState(() {});
              Navigator.pop(ctx);
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  void _deleteTable(TableModel table) {
    if (table.status != TableStatus.empty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Không thể xóa bàn đang có khách!'), backgroundColor: Colors.red));
      return;
    }
    final db = ref.read(dbProvider);
    db.deleteTable(table.id);
    ref.read(tablesProvider.notifier).loadTables();
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã xóa "${table.name}"')));
  }

  // ===================== UI =====================

  Color _getTableColor(TableStatus status) {
    switch (status) {
      case TableStatus.empty: return const Color(0xFF2E7D32);
      case TableStatus.occupied: return const Color(0xFFC62828);
      case TableStatus.ordering: return const Color(0xFF1565C0);
      case TableStatus.serving: return const Color(0xFF6A1B9A);
      case TableStatus.pendingPayment: return const Color(0xFFEF6C00);
      case TableStatus.paid: return const Color(0xFF009688);
      case TableStatus.cleaning: return const Color(0xFF616161);
      case TableStatus.reserved: return const Color(0xFFF57F17);
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(dbProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text('Quản lý Bàn & Khu Vực', style: TextStyle(color: Color(0xFF4A2C2A), fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: _showAddAreaDialog, tooltip: 'Thêm khu vực'),
        ],
      ),
      body: db.areas.isEmpty
          ? Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.map_outlined, size: 64, color: Colors.grey.shade400),
                const SizedBox(height: 16),
                Text('Chưa có khu vực nào', style: TextStyle(fontSize: 18, color: Colors.grey.shade600)),
                const SizedBox(height: 8),
                ElevatedButton.icon(onPressed: _showAddAreaDialog, icon: const Icon(Icons.add), label: const Text('Thêm khu vực đầu tiên')),
              ]),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: db.areas.length,
              itemBuilder: (context, index) {
                final area = db.areas[index];
                final tables = db.tables.where((t) => t.areaId == area.id).toList();
                final emptyCount = tables.where((t) => t.status == TableStatus.empty).length;
                final occupiedCount = tables.where((t) => t.status != TableStatus.empty).length;

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      // Area header
                      Row(children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: const Color(0xFF4A2C2A).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.layers, color: Color(0xFF4A2C2A), size: 24),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(area.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                            Text('${tables.length} bàn • $emptyCount trống • $occupiedCount đang dùng', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                          ]),
                        ),
                        IconButton(icon: const Icon(Icons.edit, size: 20), onPressed: () => _showEditAreaDialog(area), tooltip: 'Sửa'),
                        IconButton(icon: const Icon(Icons.delete, color: Colors.red, size: 20), onPressed: () => _deleteArea(area), tooltip: 'Xóa'),
                      ]),
                      const Divider(height: 24),

                      // Action buttons
                      Row(children: [
                        ElevatedButton.icon(
                          onPressed: () => _showAddTableDialog(area),
                          icon: const Icon(Icons.add, size: 16),
                          label: const Text('Thêm bàn'),
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A2C2A), foregroundColor: Colors.white),
                        ),
                      ]),
                      const SizedBox(height: 12),

                      // Tables grid
                      if (tables.isEmpty)
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(child: Text('Chưa có bàn. Bấm "Thêm bàn" để bắt đầu.', style: TextStyle(color: Colors.grey[500]))),
                        )
                      else
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: tables.map((table) {
                            return Chip(
                              avatar: CircleAvatar(
                                backgroundColor: _getTableColor(table.status),
                                radius: 10,
                                child: Text(table.name.length > 2 ? table.name.substring(table.name.length - 2) : table.name, style: const TextStyle(fontSize: 9, color: Colors.white)),
                              ),
                              label: Text('${table.name} (${table.seats} ghế)', style: const TextStyle(fontSize: 12)),
                              backgroundColor: Colors.grey.shade100,
                              deleteIcon: const Icon(Icons.close, size: 16),
                              onDeleted: () => _deleteTable(table),
                            );
                          }).toList(),
                        ),
                    ]),
                  ),
                );
              },
            ),
    );
  }
}
