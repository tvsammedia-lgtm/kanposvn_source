import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/invoice.dart';
import '../models/partner.dart';
import '../providers/taphoa_providers.dart';
import '../services/taphoa_receipt_printer.dart';
import '../widgets/taphoa_barcode_scanner.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/receipt_print_mode.dart';

class TapHoaPosScreen extends ConsumerStatefulWidget {
  const TapHoaPosScreen({super.key});

  @override
  ConsumerState<TapHoaPosScreen> createState() => _TapHoaPosScreenState();
}

class _TapHoaPosScreenState extends ConsumerState<TapHoaPosScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(tapHoaProductsProvider.notifier).loadProducts();
      ref.read(tapHoaCustomersProvider.notifier).loadCustomers();
      ref.read(tapHoaInventoryProvider.notifier).loadInventory();
      ref.read(tapHoaPosCartProvider.notifier).startNewOrder();
    });
  }

  void _showPaymentSheet(List<TapHoaInvoiceItem> cart) {
    final customers = ref.read(tapHoaCustomersProvider);
    final totalAmount = cart.fold<double>(0, (s, i) => s + i.total);
    final amountController =
        TextEditingController(text: totalAmount.toStringAsFixed(0));
    String paymentMethod = 'cash';
    String customerId = '';
    String customerName = '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final amountPaid = double.tryParse(amountController.text) ?? 0;
            final change = amountPaid - totalAmount;
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Thanh toán hóa đơn',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tổng tiền: ${totalAmount.toStringAsFixed(0)} đ',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Số tiền khách đưa',
                        prefixText: '₫ ',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => setSheetState(() {}),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      change >= 0
                          ? 'Tiền thừa trả khách: ${change.toStringAsFixed(0)} đ'
                          : 'Còn thiếu: ${(-change).toStringAsFixed(0)} đ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: change >= 0 ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      initialValue: customerId.isEmpty ? null : customerId,
                      decoration: const InputDecoration(
                        labelText: 'Khách hàng',
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        const DropdownMenuItem(value: '', child: Text('Khách lẻ')),
                        ...customers.map((c) =>
                            DropdownMenuItem(value: c.customerId, child: Text(c.name))),
                      ],
                      onChanged: (value) {
                        customerId = value ?? '';
                        customerName =
                            customers.where((e) => e.customerId == customerId).firstOrNull?.name ?? '';
                        setSheetState(() {});
                      },
                    ),
                    const SizedBox(height: 12),
                    const Text('Phương thức thanh toán'),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        _methodChip(setSheetState, 'cash', 'Tiền mặt', Icons.payments,
                            paymentMethod, (v) => paymentMethod = v),
                        _methodChip(setSheetState, 'qr', 'QR Code', Icons.qr_code, paymentMethod,
                            (v) => paymentMethod = v),
                        _methodChip(setSheetState, 'transfer', 'Chuyển khoản',
                            Icons.account_balance, paymentMethod, (v) => paymentMethod = v),
                        _methodChip(setSheetState, 'debt', 'Công nợ', Icons.credit_score,
                            paymentMethod, (v) => paymentMethod = v),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: cart.isEmpty
                          ? null
                          : () async {
                              final customer = customerId.isEmpty
                                  ? null
                                  : customers
                                      .where((c) => c.customerId == customerId)
                                      .firstOrNull;
                              Navigator.of(context).pop();
                              await _completeCheckout(
                                cart,
                                ReceiptPrintMode.auto,
                                amountPaid: amountPaid,
                                paymentMethod: paymentMethod,
                                customerId: customerId,
                                customerName: customerName,
                                customer: customer,
                              );
                            },
                      child: const Text('THANH TOÁN', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Hoàn tất thanh toán (tạo hóa đơn, trừ kho, ghi doanh thu) rồi in theo [mode].
  Future<void> _completeCheckout(
    List<TapHoaInvoiceItem> cart,
    ReceiptPrintMode mode, {
    double? amountPaid,
    String paymentMethod = 'cash',
    String customerId = '',
    String customerName = '',
    TapHoaCustomer? customer,
  }) async {
    if (cart.isEmpty) return;
    final totalAmount = cart.fold<double>(0, (s, i) => s + i.total);
    final paid = amountPaid ?? totalAmount;
    final change = paid - totalAmount;

    final invoiceId = 'HD_${DateTime.now().millisecondsSinceEpoch}';
    final invoice = TapHoaInvoice()
      ..invoiceId = invoiceId
      ..invoiceNumber = 'HD${DateTime.now().millisecondsSinceEpoch}'
      ..createdAt = DateTime.now()
      ..customerId = customerId
      ..customerName = customerName
      ..totalAmount = totalAmount
      ..discountAmount = 0
      ..finalAmount = totalAmount
      ..paymentMethod = paymentMethod
      ..status = 'completed'
      ..amountPaid = paymentMethod == 'debt' ? 0 : paid
      ..changeAmount = paymentMethod == 'debt' ? 0 : (change > 0 ? change : 0)
      ..cashierName = 'Thu ngân';

    final items = <TapHoaInvoiceItem>[];
    for (var i in cart) {
      items.add(TapHoaInvoiceItem()
        ..invoiceItemId = i.invoiceItemId
        ..invoiceId = invoiceId
        ..productId = i.productId
        ..productName = i.productName
        ..productCode = i.productCode
        ..quantity = i.quantity
        ..price = i.price
        ..discount = i.discount
        ..total = i.total);
    }

    await ref
        .read(tapHoaInvoicesProvider.notifier)
        .checkout(invoice, items, customer: customer);
    ref.read(tapHoaPosCartProvider.notifier).startNewOrder();
    ref.read(tapHoaInventoryProvider.notifier).loadInventory();

    final stateContext = context;
    try {
      await printReceiptByMode(
        stateContext,
        ref,
        await buildTapHoaReceiptData(invoice, items),
        mode,
        pdfFilename: 'HoaDon_${invoice.invoiceNumber}.pdf',
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(stateContext).showSnackBar(
          SnackBar(content: Text('In hóa đơn thất bại: $e')),
        );
      }
    }
    if (mounted) {
      ScaffoldMessenger.of(stateContext).showSnackBar(
        const SnackBar(content: Text('Thanh toán thành công!')),
      );
    }
  }

  Widget _methodChip(StateSetter setSheetState, String value, String label, IconData icon,
      String current, ValueChanged<String> onSelect) {
    final selected = current == value;
    return FilterChip(
      selected: selected,
      avatar: Icon(icon, size: 18),
      label: Text(label),
      onSelected: (_) {
        onSelect(value);
        setSheetState(() {});
      },
    );
  }

  bool get _isCameraSupported {
    if (kIsWeb) return true;
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS;
  }

  void _openScanner() {
    final products = ref.read(tapHoaProductsProvider);
    if (products.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Chưa có sản phẩm nào để quét.')),
      );
      return;
    }
    final inventory = ref.read(tapHoaInventoryProvider);
    double stockOf(String productId) {
      final inv = inventory.where((i) => i.productId == productId).firstOrNull;
      return inv?.currentStock ?? 0;
    }

    if (_isCameraSupported) {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) => TapHoaBarcodeScannerDialog(
          products: products,
          stockOf: stockOf,
          onScanned: (product) {
            if (mounted) {
              ref.read(tapHoaPosCartProvider.notifier).addItem(product);
            }
          },
        ),
      );
    } else {
      showDialog<void>(
        context: context,
        builder: (_) => TapHoaBarcodeEntryDialog(
          products: products,
          stockOf: stockOf,
          onScanned: (product) {
            if (mounted) {
              ref.read(tapHoaPosCartProvider.notifier).addItem(product);
            }
          },
        ),
      );
    }
  }

  void _handleBarcodeInput(String text) {
    final products = ref.read(tapHoaProductsProvider);
    final product = tapHoaFindByCode(products, text);
    if (product == null) return;
    final inventory = ref.read(tapHoaInventoryProvider);
    final stock =
        inventory.where((i) => i.productId == product.productId).firstOrNull?.currentStock ?? 0;
    if (stock <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product.productName} đã hết hàng')),
      );
      return;
    }
    ref.read(tapHoaPosCartProvider.notifier).addItem(product);
    _searchController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(tapHoaProductsProvider);
    final cart = ref.watch(tapHoaPosCartProvider);
    final inventory = ref.watch(tapHoaInventoryProvider);

    double stockOf(String productId) {
      final inv = inventory.where((i) => i.productId == productId).firstOrNull;
      return inv?.currentStock ?? 0;
    }

    final searchQuery = _searchController.text.toLowerCase();
    final filteredProducts = products.where((p) {
      return p.productName.toLowerCase().contains(searchQuery) ||
          p.barcode.toLowerCase().contains(searchQuery) ||
          p.productCode.toLowerCase().contains(searchQuery);
    }).toList();

    final totalAmount = cart.fold<double>(0, (s, i) => s + i.total);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bán Hàng (POS)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            tooltip: 'Quét mã vạch / QR code',
            onPressed: _openScanner,
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Tìm theo tên, mã, barcode...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onChanged: (value) => setState(() {}),
                    onSubmitted: _handleBarcodeInput,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      final stock = stockOf(product.productId);
                      return InkWell(
                        onTap: () {
                          if (stock <= 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${product.productName} đã hết hàng')),
                            );
                            return;
                          }
                          ref.read(tapHoaPosCartProvider.notifier).addItem(product);
                        },
                        child: Card(
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.productName,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${product.retailPrice.toStringAsFixed(0)} đ',
                                      style: const TextStyle(
                                          color: Colors.red, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Kho: ${stock.toInt()}',
                                      style: TextStyle(
                                          color: stock > 0 ? Colors.green : Colors.red,
                                          fontSize: 12),
                                    ),
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
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[50],
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Giỏ hàng (${cart.length})',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () => ref.read(tapHoaPosCartProvider.notifier).startNewOrder(),
                          child: const Icon(Icons.delete_outline, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: cart.isEmpty
                        ? const Center(child: Text('Chưa có sản phẩm trong giỏ'))
                        : ListView.builder(
                            itemCount: cart.length,
                            itemBuilder: (context, index) {
                              final item = cart[index];
                              return ListTile(
                                title: Text(item.productName),
                                subtitle: Text(
                                    '${item.price.toStringAsFixed(0)} đ x ${item.quantity.toInt()}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle_outline),
                                      onPressed: () {
                                        ref
                                            .read(tapHoaPosCartProvider.notifier)
                                            .updateQuantity(index, item.quantity - 1);
                                      },
                                    ),
                                    Text('${item.quantity.toInt()}'),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle_outline),
                                      onPressed: () {
                                        final stock = stockOf(item.productId);
                                        if (item.quantity >= stock) return;
                                        ref
                                            .read(tapHoaPosCartProvider.notifier)
                                            .updateQuantity(index, item.quantity + 1);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Khách cần trả', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text(
                              '${totalAmount.toStringAsFixed(0)} đ',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 44,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: cart.isEmpty
                                      ? null
                                      : () => _completeCheckout(
                                            cart,
                                            ReceiptPrintMode.thermal80,
                                          ),
                                  icon: const Icon(Icons.print, size: 16),
                                  label: const Text('IN BILL 80mm',
                                      style: TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SizedBox(
                                height: 44,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: cart.isEmpty
                                      ? null
                                      : () => _completeCheckout(
                                            cart,
                                            ReceiptPrintMode.pdf,
                                          ),
                                  icon: const Icon(Icons.picture_as_pdf, size: 16),
                                  label: const Text('IN PDF',
                                      style: TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: cart.isEmpty ? null : () => _showPaymentSheet(cart),
                            child: const Text('THANH TOÁN',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
