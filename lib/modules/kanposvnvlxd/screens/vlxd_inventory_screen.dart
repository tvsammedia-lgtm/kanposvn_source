import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/vlxd_providers.dart';
import '../models/vlxd_inventory.dart';
import '../models/vlxd_product.dart';

class VlxdInventoryScreen extends ConsumerStatefulWidget {
  const VlxdInventoryScreen({super.key});

  @override
  ConsumerState<VlxdInventoryScreen> createState() => _VlxdInventoryScreenState();
}

class _VlxdInventoryScreenState extends ConsumerState<VlxdInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quản lý Kho hàng (VLXD)'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tồn kho hiện tại'),
              Tab(text: 'Lịch sử giao dịch (Nhập/Xuất)'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Tạo phiếu Nhập/Xuất',
              onPressed: () => _showCreateTransactionDialog(context, ref),
            )
          ],
        ),
        body: const TabBarView(
          children: [
            _StockListTab(),
            _TransactionHistoryTab(),
          ],
        ),
      ),
    );
  }

  void _showCreateTransactionDialog(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final noteController = TextEditingController();
    String? selectedWarehouseId;
    VlxdInventoryTransactionType selectedType = VlxdInventoryTransactionType.IMPORT;
    bool isSaving = false;
    final productsData = ref.read(vlxdProductsProvider).valueOrNull ?? const <VlxdProduct>[];
    final warehousesData = ref.read(vlxdWarehousesProvider).valueOrNull ?? const <VlxdWarehouse>[];
    final searchController = TextEditingController();
    String productSearchQuery = '';
    final selectedLines = <_InventoryVoucherLine>[];

    if (productsData.isEmpty || warehousesData.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            productsData.isEmpty && warehousesData.isEmpty
                ? 'Chưa có vật tư và kho để tạo phiếu.'
                : productsData.isEmpty
                    ? 'Chưa có vật tư để tạo phiếu.'
                    : 'Chưa có kho để tạo phiếu.',
          ),
        ),
      );
      noteController.dispose();
      searchController.dispose();
      return;
    }

    selectedWarehouseId = warehousesData.first.warehouseId;

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            void recalcSelectedLineDefaults() {
              for (final line in selectedLines) {
                line.applyDefaultPrice(selectedType);
              }
            }

            String get pricePresetLabel {
              return selectedType == VlxdInventoryTransactionType.IMPORT
                  ? 'Mặc định: giá nhập'
                  : 'Mặc định: giá bán lẻ';
            }

            void incrementLine(_InventoryVoucherLine line) {
              final nextValue = line.quantity + 1;
              line.qtyController.text = nextValue.toStringAsFixed(0);
              setState(() {});
            }

            void decrementLine(_InventoryVoucherLine line) {
              final nextValue = line.quantity - 1;
              line.qtyController.text = (nextValue < 1 ? 1 : nextValue).toStringAsFixed(0);
              setState(() {});
            }

            void addProduct(VlxdProduct product) {
              final existing = selectedLines.where((line) => line.product.productId == product.productId).firstOrNull;
              if (existing != null) {
                existing.qtyController.text = ((existing.quantity) + 1).toStringAsFixed(0);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Đã gộp ${product.productName} vào dòng hiện có.'),
                    duration: const Duration(seconds: 1),
                  ),
                );
                setState(() {});
                return;
              }
              setState(() {
                selectedLines.add(_InventoryVoucherLine(product, selectedType));
              });
            }

            void removeLine(_InventoryVoucherLine line) {
              setState(() {
                selectedLines.remove(line);
              });
              line.dispose();
            }

            Future<void> submit() async {
              if (!(formKey.currentState?.validate() ?? false)) return;
              if (selectedWarehouseId == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Chọn kho trước khi tạo phiếu.')),
                );
                return;
              }
              if (selectedLines.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Thêm ít nhất một vật tư vào phiếu.')),
                );
                return;
              }

              setState(() => isSaving = true);
              try {
                final warehouse = warehousesData.where((w) => w.warehouseId == selectedWarehouseId).firstOrNull;

                if (warehouse == null) {
                  throw StateError('Không tìm thấy kho đã chọn.');
                }

                final tx = VlxdInventoryTransaction()
                  ..transactionId = const Uuid().v4()
                  ..documentCode = '${selectedType == VlxdInventoryTransactionType.IMPORT ? 'PN' : 'PX'}-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
                  ..type = selectedType
                  ..transactionDate = DateTime.now()
                  ..note = noteController.text.trim();
                tx.warehouse.value = warehouse;

                final details = <VlxdInventoryTransactionDetail>[];
                for (final line in selectedLines) {
                  final qty = line.quantity;
                  if (qty <= 0) {
                    throw StateError('Số lượng từng dòng phải lớn hơn 0.');
                  }
                  final detail = VlxdInventoryTransactionDetail()
                    ..quantity = qty
                    ..unitPrice = line.unitPrice
                    ..totalAmount = qty * line.unitPrice;
                  detail.product.value = line.product;
                  detail.transaction.value = tx;
                  details.add(detail);
                }

                await ref.read(vlxdInventoryProvider.notifier).createTransaction(tx, details);
                await ref.read(vlxdStocksProvider.future);
                await ref.read(vlxdInventoryProvider.notifier).loadTransactions();

                if (ctx.mounted) Navigator.pop(ctx);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Đã tạo phiếu ${selectedType == VlxdInventoryTransactionType.IMPORT ? 'nhập' : 'xuất'} ${tx.documentCode}.',
                      ),
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Không thể tạo phiếu kho: $e')),
                  );
                }
              } finally {
                if (ctx.mounted) {
                  setState(() => isSaving = false);
                }
              }
            }

            return AlertDialog(
              title: const Text('Tạo Phiếu Kho'),
              content: SizedBox(
                width: 920,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<VlxdInventoryTransactionType>(
                              value: selectedType,
                              decoration: const InputDecoration(labelText: 'Loại phiếu'),
                              items: const [
                                DropdownMenuItem(
                                  value: VlxdInventoryTransactionType.IMPORT,
                                  child: Text('Nhập kho'),
                                ),
                                DropdownMenuItem(
                                  value: VlxdInventoryTransactionType.EXPORT,
                                  child: Text('Xuất kho'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedType = value ?? VlxdInventoryTransactionType.IMPORT;
                                  recalcSelectedLineDefaults();
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: selectedWarehouseId,
                              decoration: const InputDecoration(labelText: 'Kho'),
                              items: [
                                for (final w in warehousesData)
                                  DropdownMenuItem(
                                    value: w.warehouseId,
                                    child: Text('${w.name}${w.address.isNotEmpty ? ' - ${w.address}' : ''}'),
                                  ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedWarehouseId = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Chọn kho';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Chip(
                            label: Text(pricePresetLabel),
                            avatar: Icon(
                              selectedType == VlxdInventoryTransactionType.IMPORT
                                  ? Icons.download
                                  : Icons.upload,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 8),
                          TextButton.icon(
                            onPressed: () {
                              setState(() {
                                recalcSelectedLineDefaults();
                              });
                            },
                            icon: const Icon(Icons.auto_fix_high),
                            label: const Text('Áp giá mặc định'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          labelText: 'Tìm vật tư',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: productSearchQuery.isEmpty
                              ? null
                              : IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    setState(() {
                                      searchController.clear();
                                      productSearchQuery = '';
                                    });
                                  },
                                ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            productSearchQuery = value.trim().toLowerCase();
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 180,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: filteredProductList(productsData, productSearchQuery).isEmpty
                              ? const Center(child: Text('Không tìm thấy vật tư phù hợp.'))
                              : ListView.separated(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: filteredProductList(productsData, productSearchQuery).length,
                                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                                  itemBuilder: (context, index) {
                                    final product = filteredProductList(productsData, productSearchQuery)[index];
                                    return ListTile(
                                      dense: true,
                                      leading: const CircleAvatar(child: Icon(Icons.widgets, size: 18)),
                                      title: Text(product.productName, maxLines: 1, overflow: TextOverflow.ellipsis),
                                      subtitle: Text('${product.productCode} • ${product.unit}'),
                                      trailing: FilledButton.tonalIcon(
                                        onPressed: () => addProduct(product),
                                        icon: const Icon(Icons.add, size: 18),
                                        label: const Text('Thêm'),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Chi tiết phiếu (${selectedLines.length} dòng)',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 240,
                        child: selectedLines.isEmpty
                            ? const Center(child: Text('Chưa có vật tư nào trong phiếu.'))
                            : ListView.separated(
                                itemCount: selectedLines.length,
                                separatorBuilder: (_, __) => const SizedBox(height: 8),
                                itemBuilder: (context, index) {
                                  final line = selectedLines[index];
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  line.product.productName,
                                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                const SizedBox(height: 2),
                                                Text('${line.product.productCode} • ${line.product.unit}'),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          SizedBox(
                                            width: 170,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  tooltip: 'Giảm số lượng',
                                                  onPressed: () => decrementLine(line),
                                                  icon: const Icon(Icons.remove_circle_outline),
                                                ),
                                                Expanded(
                                                  child: TextFormField(
                                                    controller: line.qtyController,
                                                    decoration: const InputDecoration(labelText: 'Số lượng'),
                                                    keyboardType: TextInputType.number,
                                                    textAlign: TextAlign.center,
                                                    onChanged: (_) => setState(() {}),
                                                    validator: (value) {
                                                      final qty = double.tryParse((value ?? '').trim());
                                                      if (qty == null || qty <= 0) {
                                                        return 'Số lượng > 0';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                IconButton(
                                                  tooltip: 'Tăng số lượng',
                                                  onPressed: () => incrementLine(line),
                                                  icon: const Icon(Icons.add_circle_outline),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          SizedBox(
                                            width: 150,
                                            child: TextFormField(
                                              controller: line.priceController,
                                              decoration: const InputDecoration(labelText: 'Đơn giá'),
                                              keyboardType: TextInputType.number,
                                              textAlign: TextAlign.right,
                                              onChanged: (_) => setState(() {}),
                                              validator: (value) {
                                                final price = double.tryParse((value ?? '').trim());
                                                if (price == null || price < 0) {
                                                  return 'Giá không hợp lệ';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          SizedBox(
                                            width: 170,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Thành tiền',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  '${(line.quantity * line.unitPrice).toStringAsFixed(0)} đ',
                                                  textAlign: TextAlign.right,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          IconButton(
                                            tooltip: 'Xóa dòng',
                                            onPressed: () => removeLine(line),
                                            icon: const Icon(Icons.delete_outline),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: noteController,
                        decoration: const InputDecoration(labelText: 'Ghi chú'),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.indigo.withOpacity(0.15)),
                        ),
                        child: Builder(
                          builder: (_) {
                            final lineCount = selectedLines.length;
                            final subtotal = selectedLines.fold<double>(
                              0,
                              (sum, line) => sum + (line.quantity * line.unitPrice),
                            );
                            final totalQty = selectedLines.fold<double>(
                              0,
                              (sum, line) => sum + line.quantity,
                            );

                            return Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tổng tạm tính: ${subtotal.toStringAsFixed(0)} đ',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Số dòng: $lineCount  •  Tổng số lượng: ${totalQty.toStringAsFixed(0)}',
                                        style: TextStyle(color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  selectedType == VlxdInventoryTransactionType.IMPORT
                                      ? Icons.download
                                      : Icons.upload,
                                  color: Colors.indigo,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isSaving ? null : () => Navigator.pop(ctx),
                  child: const Text('Đóng'),
                ),
                ElevatedButton(
                  onPressed: isSaving ? null : submit,
                  child: Text(isSaving ? 'Đang lưu...' : 'Tạo phiếu'),
                ),
              ],
            );
          },
        );
      },
    ).whenComplete(() {
      noteController.dispose();
      searchController.dispose();
      for (final line in selectedLines) {
        line.dispose();
      }
    });
  }
}

class _InventoryVoucherLine {
  _InventoryVoucherLine(this.product, VlxdInventoryTransactionType type)
      : qtyController = TextEditingController(text: '1'),
        priceController = TextEditingController() {
    applyDefaultPrice(type);
  }

  final VlxdProduct product;
  final TextEditingController qtyController;
  final TextEditingController priceController;

  double get quantity => double.tryParse(qtyController.text.trim()) ?? 0;
  double get unitPrice => double.tryParse(priceController.text.trim()) ?? 0;

  void applyDefaultPrice(VlxdInventoryTransactionType type) {
    priceController.text = (type == VlxdInventoryTransactionType.IMPORT
        ? product.purchasePrice
        : product.retailPrice)
        .toStringAsFixed(0);
  }

  void dispose() {
    qtyController.dispose();
    priceController.dispose();
  }
}

List<VlxdProduct> filteredProductList(List<VlxdProduct> products, String query) {
  if (query.isEmpty) return products;
  return products.where((p) {
    return p.productName.toLowerCase().contains(query) ||
        p.productCode.toLowerCase().contains(query) ||
        p.barcode.toLowerCase().contains(query);
  }).toList();
}

class _StockListTab extends ConsumerWidget {
  const _StockListTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stocksAsync = ref.watch(vlxdStocksProvider);

    return stocksAsync.when(
      data: (stocks) {
        if (stocks.isEmpty) return const Center(child: Text('Kho trống. Chưa có giao dịch nhập.'));
        return ListView.builder(
          itemCount: stocks.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final stock = stocks[index];
            final product = stock.product.value;
            return Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.inventory_2)),
                title: Text(product?.productName ?? 'N/A', style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Tồn: ${stock.currentQuantity} ${product?.unit ?? ""}'),
                trailing: Text(stock.warehouse.value?.name ?? 'Kho chính'),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('Lỗi: $err')),
    );
  }
}

class _TransactionHistoryTab extends ConsumerWidget {
  const _TransactionHistoryTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txsAsync = ref.watch(vlxdInventoryProvider);

    return txsAsync.when(
      data: (txs) {
        if (txs.isEmpty) return const Center(child: Text('Chưa có lịch sử giao dịch.'));
        return ListView.builder(
          itemCount: txs.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final tx = txs[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: tx.type == VlxdInventoryTransactionType.IMPORT ? Colors.green : Colors.orange,
                  child: Icon(
                    tx.type == VlxdInventoryTransactionType.IMPORT ? Icons.download : Icons.upload,
                    color: Colors.white
                  ),
                ),
                title: Text('${tx.documentCode} - ${tx.type.label}'),
                subtitle: Text('Ngày: _formatDate(tx.transactionDate)'), // Date placeholder
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text('Lỗi: $err')),
    );
  }
}
