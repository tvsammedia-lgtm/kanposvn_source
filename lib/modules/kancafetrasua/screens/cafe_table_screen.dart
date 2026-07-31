import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/db/database_service.dart';
import '../../../core/widgets/common_widgets.dart';
import '../models/table_model.dart';

class CafeTableScreen extends ConsumerStatefulWidget {
  const CafeTableScreen({super.key});

  @override
  ConsumerState<CafeTableScreen> createState() => _CafeTableScreenState();
}

class _CafeTableScreenState extends ConsumerState<CafeTableScreen> {
  String? _selectedAreaId;

  @override
  Widget build(BuildContext context) {
    ref.watch(databaseServiceProvider);
    final db = DatabaseService.instance;
    final areas = db.getCollection('areas');
    final tables = db.getCollection('tables');

    if (_selectedAreaId == null && areas.isNotEmpty) {
      _selectedAreaId = areas.first['id'];
    }

    final filteredTables = _selectedAreaId == null
        ? tables
        : tables.where((t) => t['areaId'] == _selectedAreaId).toList();

    final emptyCount = tables.where((t) => t['status'] == 'empty').length;
    final occupiedCount = tables.where((t) => t['status'] == 'occupied').length;
    final reservedCount =
        tables.where((t) => t['status'] == 'reserved').length;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(bottom: BorderSide(color: AppColors.border)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'table_map'.tr,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  _buildLegendItem('empty'.tr, AppColors.success, emptyCount),
                  const SizedBox(width: 16),
                  _buildLegendItem('in_use'.tr, AppColors.warning, occupiedCount),
                  const SizedBox(width: 16),
                  _buildLegendItem('reserved'.tr, AppColors.info, reservedCount),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline, size: 20),
                    onPressed: () => _showAddTableDialog(context),
                    tooltip: 'add_table'.tr,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (areas.isNotEmpty)
                SizedBox(
                  height: 36,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildAreaChip(null, 'all'.tr),
                      ...areas.map((a) => _buildAreaChip(a['id'], a['name'])),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: filteredTables.isEmpty
              ? EmptyState(
                  icon: Icons.table_restaurant_rounded,
                  title: 'no_tables'.tr,
                  subtitle: 'add_tables_to_manage'.tr,
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: filteredTables.length,
                  itemBuilder: (context, index) {
                    final table = filteredTables[index];
                    return _buildTableCard(context, table);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color, int count) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '$label ($count)',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildAreaChip(String? id, String label) {
    final isSelected = _selectedAreaId == id;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () => setState(() => _selectedAreaId = id),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTableCard(BuildContext context, Map<String, dynamic> table) {
    final status = table['status'] ?? 'empty';
    final name = table['name'] ?? '';
    final seats = table['seats'] ?? 0;

    Color borderColor;
    Color bgColor;
    Color iconColor;
    IconData icon;
    String statusLabel;

    switch (status) {
      case 'occupied':
        borderColor = AppColors.warning;
        bgColor = AppColors.warning.withOpacity(0.06);
        iconColor = AppColors.warning;
        icon = Icons.people_rounded;
        statusLabel = 'in_use'.tr;
        break;
      case 'reserved':
        borderColor = AppColors.info;
        bgColor = AppColors.info.withOpacity(0.06);
        iconColor = AppColors.info;
        icon = Icons.event_seat_rounded;
        statusLabel = 'reserved'.tr;
        break;
      default:
        borderColor = AppColors.success;
        bgColor = AppColors.success.withOpacity(0.06);
        iconColor = AppColors.success;
        icon = Icons.chair_rounded;
        statusLabel = 'empty'.tr;
    }

    return GestureDetector(
      onTap: () => _showTableDetailDialog(context, table),
      onLongPress: () => _showTableActions(context, table),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor.withOpacity(0.4), width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: borderColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 26),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: borderColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'seats_count'.trParams({'count': seats.toString()}),
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 6),
            StatusBadge(label: statusLabel, color: borderColor),
            if (status == 'occupied' && table['occupiedAt'] != null) ...[
              const SizedBox(height: 6),
              Text(
                _getTimeElapsed(table['occupiedAt']),
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getTimeElapsed(String isoDate) {
    final occupiedAt = DateTime.tryParse(isoDate);
    if (occupiedAt == null) return '';
    final diff = DateTime.now().difference(occupiedAt);
    if (diff.inHours > 0) {
      return '${diff.inHours}h ${diff.inMinutes % 60}m';
    }
    return 'time_elapsed'.trParams({'minutes': diff.inMinutes.toString()});
  }

  void _showTableDetailDialog(
      BuildContext context, Map<String, dynamic> table) {
    final status = table['status'] ?? 'empty';
    if (status == 'empty') return;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('table_detail'.trParams({'name': table['name'] ?? ''})),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trạng thái: $status'),
            if (table['occupiedAt'] != null)
              Text(
                  'Bắt đầu: ${AppFormatters.formatDateTime(DateTime.parse(table['occupiedAt']))}'),
            if (table['currentOrderId'] != null)
              Text('Đơn hàng: ${table['currentOrderId']}'),
          ],
        ),
        actions: [
          if (status == 'occupied' || status == 'reserved')
            TextButton(
              onPressed: () {
                DatabaseService.instance.saveItem(
                  'tables',
                  table['id'],
                  {
                    ...table,
                    'status': 'empty',
                    'currentOrderId': null,
                    'occupiedAt': null,
                  },
                );
                Navigator.pop(ctx);
              },
              child: Text('release_table'.tr,
                  style: const TextStyle(color: AppColors.success)),
            ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('close'.tr),
          ),
        ],
      ),
    );
  }

  void _showTableActions(BuildContext context, Map<String, dynamic> table) {
    final currentStatus = table['status'] ?? 'empty';
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'table_detail'.trParams({'name': table['name'] ?? ''}),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            if (currentStatus != 'occupied')
              ListTile(
                leading: const Icon(Icons.people_rounded,
                    color: AppColors.warning),
                title: Text('mark_in_use'.tr),
                onTap: () {
                  DatabaseService.instance.saveItem(
                    'tables',
                    table['id'],
                    {
                      ...table,
                      'status': 'occupied',
                      'occupiedAt': DateTime.now().toIso8601String(),
                    },
                  );
                  Navigator.pop(ctx);
                },
              ),
            if (currentStatus != 'reserved')
              ListTile(
                leading:
                    const Icon(Icons.event_seat_rounded, color: AppColors.info),
                title: Text('reserved'.tr),
                onTap: () {
                  DatabaseService.instance.saveItem(
                    'tables',
                    table['id'],
                    {
                      ...table,
                      'status': 'reserved',
                    },
                  );
                  Navigator.pop(ctx);
                },
              ),
            if (currentStatus != 'empty')
              ListTile(
                leading:
                    const Icon(Icons.check_circle_rounded, color: AppColors.success),
                title: Text('release_table'.tr),
                onTap: () {
                  DatabaseService.instance.saveItem(
                    'tables',
                    table['id'],
                    {
                      ...table,
                      'status': 'empty',
                      'currentOrderId': null,
                      'occupiedAt': null,
                    },
                  );
                  Navigator.pop(ctx);
                },
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showAddTableDialog(BuildContext context) {
    final nameController = TextEditingController();
    final seatsController = TextEditingController(text: '4');
    final db = DatabaseService.instance;
    final areas = db.getCollection('areas');
    String? selectedAreaId = areas.isNotEmpty ? areas.first['id'] : null;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text('add_table_new'.tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'table_name_hint'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: seatsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'seats'.tr),
              ),
              const SizedBox(height: 12),
              if (areas.isNotEmpty)
                DropdownButtonFormField<String>(
                  value: selectedAreaId,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: 'area'.tr),
                  items: areas
                      .map((a) => DropdownMenuItem<String>(
                            value: a['id'] as String?,
                            child: Text(a['name'] ?? ''),
                          ))
                      .toList(),
                  onChanged: (v) => setDialogState(() => selectedAreaId = v),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text('cancel'.tr),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty) return;
                final table = TableModel(
                  id: IdGenerator.generateId('TBL'),
                  name: nameController.text,
                  areaId: selectedAreaId ?? '',
                  seats: int.tryParse(seatsController.text) ?? 4,
                  status: TableStatus.empty,
                );
                db.saveItem('tables', table.id, table.toJson());
                Navigator.pop(ctx);
              },
              child: Text('add'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
