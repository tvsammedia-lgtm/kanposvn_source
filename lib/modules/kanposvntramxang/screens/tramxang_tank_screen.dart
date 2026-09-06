import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tramxang_providers.dart';

class TramXangTankScreen extends ConsumerStatefulWidget {
  const TramXangTankScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TramXangTankScreen> createState() => _TramXangTankScreenState();
}

class _TramXangTankScreenState extends ConsumerState<TramXangTankScreen> {
  @override
  Widget build(BuildContext context) {
    final tanks = ref.watch(tramXangTanksProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản Lý Bồn Xăng'),
      ),
      body: tanks.isEmpty 
          ? const Center(child: Text('Chưa có bồn nào.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tanks.length,
              itemBuilder: (context, index) {
                final tank = tanks[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${tank.name} (${tank.code})', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: tank.capacityLiter > 0 ? tank.currentQuantity / tank.capacityLiter : 0,
                          minHeight: 20,
                          backgroundColor: Colors.grey[300],
                          color: tank.currentQuantity <= tank.criticalLevelLiter 
                              ? Colors.red 
                              : tank.currentQuantity <= tank.minLevelLiter 
                                  ? Colors.orange 
                                  : Colors.green,
                        ),
                        const SizedBox(height: 8),
                        Text('Tồn: ${tank.currentQuantity} L / ${tank.capacityLiter} L'),
                      ],
                    ),
                  ),
                );
              }
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add tank or record reading
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
