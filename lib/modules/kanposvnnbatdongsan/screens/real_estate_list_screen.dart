import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/real_estate_provider.dart';
import 'real_estate_detail_screen.dart';
import 'real_estate_create_screen.dart';

class RealEstateListScreen extends ConsumerWidget {
  const RealEstateListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bdsState = ref.watch(realEstateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chợ Tốt - Bất động sản'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {
              // Demo Filter
              ref.read(realEstateProvider.notifier).loadListings(maxPrice: 10000000000); // Lọc giá < 10 tỷ
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã lọc BĐS < 10 tỷ')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(realEstateProvider.notifier).loadListings();
            },
          )
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: bdsState.when(
        data: (listings) {
          if (listings.isEmpty) return const Center(child: Text('Chưa có tin đăng nào.'));
          
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: listings.length,
            itemBuilder: (context, index) {
              final bds = listings[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => RealEstateDetailScreen(bds: bds)),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hình ảnh
                      ClipRRect(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                        child: Image.network(
                          bds.imageUrl ?? 'https://dummyimage.com/120x120/cccccc/000',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(width: 120, height: 120, color: Colors.grey),
                        ),
                      ),
                      // Thông tin
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(bds.title ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), maxLines: 2, overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 8),
                              Text('${_formatCurrency(bds.price ?? 0)} - ${bds.area} m²', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14)),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.location_on, size: 14, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Expanded(child: Text(bds.address ?? '', style: const TextStyle(color: Colors.grey, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Lỗi: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const RealEstateCreateScreen()));
        },
        backgroundColor: Colors.orange,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('ĐĂNG TIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  String _formatCurrency(double amount) {
    if (amount >= 1000000000) {
      return '${(amount / 1000000000).toStringAsFixed(1)} Tỷ';
    } else if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(0)} Triệu';
    }
    return '${amount.toStringAsFixed(0)} đ';
  }
}
