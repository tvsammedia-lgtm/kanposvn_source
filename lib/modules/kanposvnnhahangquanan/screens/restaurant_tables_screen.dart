import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/restaurant_providers.dart';
import '../models/restaurant_table.dart';
import 'restaurant_pos_screen.dart';

class RestaurantTablesScreen extends ConsumerStatefulWidget {
  const RestaurantTablesScreen({super.key});

  @override
  ConsumerState<RestaurantTablesScreen> createState() => _RestaurantTablesScreenState();
}

class _RestaurantTablesScreenState extends ConsumerState<RestaurantTablesScreen> {
  String _selectedZone = 'Tất cả';

  @override
  Widget build(BuildContext context) {
    final tablesAsync = ref.watch(restaurantTablesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sơ Đồ Bàn - Nhà Hàng')),
      body: tablesAsync.when(
        data: (tables) {
          if (tables.isEmpty) return const Center(child: Text('Chưa có bàn nào.'));
          
          final zones = ['Tất cả', ...tables.map((t) => t.zone).toSet()];
          final filteredTables = _selectedZone == 'Tất cả' ? tables : tables.where((t) => t.zone == _selectedZone).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 8,
                  children: zones.map((zone) => ChoiceChip(
                    label: Text(zone, style: const TextStyle(fontWeight: FontWeight.bold)),
                    selected: _selectedZone == zone,
                    onSelected: (selected) {
                      if (selected) setState(() => _selectedZone = zone);
                    },
                  )).toList(),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: filteredTables.length,
                  itemBuilder: (context, index) {
                    final table = filteredTables[index];
                    final isEmpty = table.status == RestaurantTableStatus.EMPTY;
                    final isWaiting = table.status == RestaurantTableStatus.WAITING_PAYMENT;
                    
                    Color bgColor = Colors.green[400]!;
                    if (!isEmpty) bgColor = Colors.red[400]!;
                    if (isWaiting) bgColor = Colors.orange[400]!;

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RestaurantPosScreen(table: table),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.table_restaurant, size: 40, color: Colors.white),
                            const SizedBox(height: 8),
                            Text(table.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
                            const SizedBox(height: 4),
                            Text(table.zone, style: const TextStyle(color: Colors.white70)),
                            Text(table.status.label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}
