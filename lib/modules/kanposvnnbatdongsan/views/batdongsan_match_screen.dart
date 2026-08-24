import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/customer.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_business_logic.dart';
import 'transaction_form_screen.dart';

/// So khớp tự động khách mua ↔ BĐS theo điểm phù hợp %
/// (PRD kanbatdongsan.md mục 11).
class BatDongSanMatchScreen extends ConsumerStatefulWidget {
  const BatDongSanMatchScreen({super.key});

  @override
  ConsumerState<BatDongSanMatchScreen> createState() =>
      _BatDongSanMatchScreenState();
}

class _BatDongSanMatchScreenState extends ConsumerState<BatDongSanMatchScreen> {
  Customer? _selectedBuyer;

  Color _scoreColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return const Color(0xFF0284C7);
    if (score >= 40) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final buyersAsync = ref.watch(buyersProvider);
    final propsAsync = ref.watch(propertiesProvider);

    final buyers = buyersAsync.value ?? [];

    // Gợi ý BĐS cho khách đang chọn.
    final results = (_selectedBuyer == null)
        ? <BdsMatchResult>[]
        : BdsBusinessLogic.matchPropertiesForBuyer(
            _selectedBuyer!, propsAsync.value ?? []);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: DropdownButtonFormField<Customer>(
              value: _selectedBuyer,
              isExpanded: true,
              decoration: InputDecoration(
                labelText: 'Chọn khách mua để so khớp',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)),
                prefixIcon: const Icon(Icons.person_search),
                helperText: 'Hệ thống tự tính độ phù hợp theo '
                    'khu vực, giá, diện tích, loại, hướng, pháp lý, mặt tiền',
              ),
              items: buyers
                  .map((c) => DropdownMenuItem(
                        value: c,
                        child: Text(
                          '${c.isVip ? "⭐ " : ""}${c.name} · '
                          '${c.demandPropertyType ?? "BĐS"} · '
                          '${c.demandDistrict ?? c.demandCity ?? "không rõ khu vực"}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              onChanged: (c) => setState(() => _selectedBuyer = c),
            ),
          ),
          if (_selectedBuyer != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nhu cầu: giá ${BdsBusinessLogic.formatMoney(_selectedBuyer!.demandPriceFrom)} - '
                  '${BdsBusinessLogic.formatMoney(_selectedBuyer!.demandPriceTo)} · '
                  'DT ${_selectedBuyer!.demandAreaFrom ?? "?"}-${_selectedBuyer!.demandAreaTo ?? "?"} m²'
                  '${_selectedBuyer!.demandDirection != null ? " · hướng ${_selectedBuyer!.demandDirection}" : ""}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              ),
            ),
          Expanded(
            child: _selectedBuyer == null
                ? const Center(
                    child: Text('Chọn một khách mua để xem gợi ý phù hợp'))
                : results.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.search_off,
                                size: 48, color: Colors.grey),
                            const SizedBox(height: 8),
                            Text(
                                'Không có BĐS nào đạt ≥40% phù hợp '
                                'với "${_selectedBuyer!.name}"'),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(bottom: 24),
                        itemCount: results.length,
                        itemBuilder: (context, i) {
                          final r = results[i];
                          final color = _scoreColor(r.score);
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: ListTile(
                              title: Row(children: [
                                Expanded(
                                  child: Text(
                                    '[${r.property.propertyCode}] '
                                    '${r.property.title ?? ''}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.15),
                                    borderRadius:
                                        BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '${r.score.toStringAsFixed(0)}%',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: color),
                                  ),
                                ),
                              ]),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 2),
                                  Text(
                                    '${r.property.propertyType ?? "-"} · '
                                    '${BdsBusinessLogic.formatMoney(r.property.areaSize)}m² · '
                                    '${r.property.district ?? "-"} · '
                                    '${BdsBusinessLogic.formatMoney(r.property.price)}đ',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(height: 4),
                                  Wrap(
                                    spacing: 4,
                                    runSpacing: 4,
                                    children: r.reasons
                                        .take(4)
                                        .map((reason) => Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 1),
                                              decoration: BoxDecoration(
                                                color: Colors.green
                                                    .withOpacity(0.08),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text('✓ $reason',
                                                  style: const TextStyle(
                                                      fontSize: 10)),
                                            ))
                                        .toList(),
                                  ),
                                ],
                              ),
                              trailing: ElevatedButton.icon(
                                onPressed: () async {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              TransactionFormScreen()));
                                },
                                icon: const Icon(Icons.handshake, size: 16),
                                label: const Text('Lập GD',
                                    style: TextStyle(fontSize: 12)),
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
