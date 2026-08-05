import 'package:flutter/material.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';

class _CartItem {
  String medicineId;
  String name;
  String unit;
  int quantity = 1;
  double unitPrice;
  double discount = 0;

  _CartItem({
    required this.medicineId,
    required this.name,
    this.unit = 'Hộp',
    required this.unitPrice,
  });

  double get totalPrice => (unitPrice * quantity) - discount;
}

class NhaThuocPosScreen extends StatefulWidget {
  const NhaThuocPosScreen({super.key});

  @override
  State<NhaThuocPosScreen> createState() => _NhaThuocPosScreenState();
}

class _NhaThuocPosScreenState extends State<NhaThuocPosScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  final List<_CartItem> _cart = [];
  String _selectedSaleType = 'Bán lẻ';

  static const _sampleMedicines = [
    {'id': 'M001', 'name': 'Paracetamol 500mg', 'unit': 'Hộp', 'price': 50000.0, 'stock': 120},
    {'id': 'M002', 'name': 'Amoxicillin 500mg', 'unit': 'Hộp', 'price': 20000.0, 'stock': 85},
    {'id': 'M003', 'name': 'Omeprazol 20mg', 'unit': 'Hộp', 'price': 150000.0, 'stock': 60},
    {'id': 'M004', 'name': 'Cetirizin 10mg', 'unit': 'Hộp', 'price': 80000.0, 'stock': 95},
    {'id': 'M005', 'name': 'Ibuprofen 400mg', 'unit': 'Hộp', 'price': 65000.0, 'stock': 40},
    {'id': 'M006', 'name': 'Vitamin C 1000mg', 'unit': 'Hộp', 'price': 120000.0, 'stock': 200},
    {'id': 'M007', 'name': 'Azithromycin 500mg', 'unit': 'Hộp', 'price': 180000.0, 'stock': 30},
    {'id': 'M008', 'name': 'Loratadin 10mg', 'unit': 'Hộp', 'price': 55000.0, 'stock': 75},
    {'id': 'M009', 'name': 'Metformin 500mg', 'unit': 'Hộp', 'price': 95000.0, 'stock': 50},
    {'id': 'M010', 'name': 'Dexamethasone 0.5mg', 'unit': 'Hộp', 'price': 35000.0, 'stock': 150},
    {'id': 'M011', 'name': 'Clarithromycin 250mg', 'unit': 'Hộp', 'price': 145000.0, 'stock': 45},
    {'id': 'M012', 'name': 'Salbutamol 2mg', 'unit': 'Hộp', 'price': 110000.0, 'stock': 25},
  ];

  List<Map<String, dynamic>> get _filteredMedicines {
    if (_searchQuery.isEmpty) return _sampleMedicines;
    return _sampleMedicines
        .where((m) => (m['name'] as String).toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  double get _subtotal => _cart.fold(0, (sum, item) => sum + item.totalPrice);
  double get _totalDiscount => _cart.fold(0, (sum, item) => sum + item.discount);
  double get _grandTotal => _subtotal;

  void _addToCart(Map<String, dynamic> medicine) {
    final existing = _cart.where((c) => c.medicineId == medicine['id']).toList();
    setState(() {
      if (existing.isNotEmpty) {
        existing.first.quantity++;
      } else {
        _cart.add(_CartItem(
          medicineId: medicine['id'] as String,
          name: medicine['name'] as String,
          unit: medicine['unit'] as String,
          unitPrice: medicine['price'] as double,
        ));
      }
    });
  }

  void _removeFromCart(int index) {
    setState(() => _cart.removeAt(index));
  }

  void _updateQuantity(int index, int delta) {
    setState(() {
      final item = _cart[index];
      final newQty = item.quantity + delta;
      if (newQty <= 0) {
        _cart.removeAt(index);
      } else {
        item.quantity = newQty;
      }
    });
  }

  void _checkout() {
    if (_cart.isEmpty) return;
    final invoiceNumber = IdGenerator.generateInvoiceCode();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('confirm_payment'.tr),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('invoice'.trParams({'code': invoiceNumber})),
            const SizedBox(height: 8),
            Text('items_count'.trParams({'count': '${_cart.length}'})),
            Text('total_amount'.trParams({'amount': AppFormatters.formatCurrency(_grandTotal)})),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('cancel'.tr)),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() => _cart.clear());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('payment_success'.trParams({'code': invoiceNumber})),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            child: Text('confirm'.tr),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('sell'.tr, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
        actions: [
          SegmentedButton<String>(
            segments: [
              ButtonSegment(value: 'Bán lẻ', label: Text('retail'.tr)),
              ButtonSegment(value: 'Kê đơn', label: Text('prescription'.tr)),
            ],
            selected: {_selectedSaleType},
            onSelectionChanged: (v) => setState(() => _selectedSaleType = v.first),
            style: SegmentedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 12),
              visualDensity: VisualDensity.compact,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: isWide ? _buildWideLayout() : _buildMobileLayout(),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
        Expanded(flex: 3, child: _buildMedicineGrid()),
        Container(
          width: 380,
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border(left: BorderSide(color: AppColors.border)),
          ),
          child: _buildCartPanel(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        Expanded(child: _buildMedicineGrid()),
        Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.45),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border(top: BorderSide(color: AppColors.border)),
          ),
          child: _buildCartPanel(),
        ),
      ],
    );
  }

  Widget _buildMedicineGrid() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: _searchController,
            onChanged: (v) => setState(() => _searchQuery = v),
            decoration: InputDecoration(
              hintText: 'search_medicine'.tr,
              prefixIcon: const Icon(Icons.search, size: 18),
              isDense: true,
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 16),
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _searchQuery = '');
                      },
                    )
                  : null,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _gridColumns(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.4,
            ),
            itemCount: _filteredMedicines.length,
            itemBuilder: (context, index) {
              final m = _filteredMedicines[index];
              final stock = m['stock'] as int;
              return GestureDetector(
                onTap: stock > 0 ? () => _addToCart(m) : null,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: stock > 0 ? AppColors.border : AppColors.danger.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(m['name'] as String,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppFormatters.formatCurrency((m['price'] as num).toDouble()),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.primary)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: stock > 10 ? AppColors.success.withOpacity(0.1) : AppColors.danger.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text('stock_label'.trParams({'count': '$stock'}),
                                style: TextStyle(
                                    fontSize: 10,
                                    color: stock > 10 ? AppColors.success : AppColors.danger,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
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

  int _gridColumns() {
    final w = MediaQuery.of(context).size.width;
    if (w > 1200) return 6;
    if (w > 900) return 5;
    if (w > 600) return 3;
    return 2;
  }

  Widget _buildCartPanel() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.border)),
          ),
          child: Row(
            children: [
              const Icon(Icons.shopping_cart_rounded, size: 18, color: AppColors.primary),
              const SizedBox(width: 8),
              Text('cart'.trParams({'count': '${_cart.length}'}),
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              const Spacer(),
              if (_cart.isNotEmpty)
                TextButton(
                  onPressed: () => setState(() => _cart.clear()),
                  child: Text('clear_all'.tr, style: const TextStyle(color: AppColors.danger, fontSize: 12)),
                ),
            ],
          ),
        ),
        Expanded(
          child: _cart.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_cart_outlined, size: 48, color: AppColors.textMuted),
                      const SizedBox(height: 8),
                      Text('no_items'.tr, style: const TextStyle(color: AppColors.textMuted)),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  itemCount: _cart.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = _cart[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(item.name,
                                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close, size: 16),
                                visualDensity: VisualDensity.compact,
                                onPressed: () => _removeFromCart(index),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(AppFormatters.formatCurrency(item.unitPrice),
                                  style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.border),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () => _updateQuantity(index, -1),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        child: Icon(Icons.remove, size: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Text('${item.quantity}',
                                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                                    ),
                                    InkWell(
                                      onTap: () => _updateQuantity(index, 1),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        child: Icon(Icons.add, size: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(AppFormatters.formatCurrency(item.totalPrice),
                                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.border)),
          ),
          child: Column(
            children: [
              if (_totalDiscount > 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('discount'.tr, style: const TextStyle(fontSize: 13)),
                      Text('-${AppFormatters.formatCurrency(_totalDiscount)}',
                          style: const TextStyle(color: AppColors.danger, fontSize: 13)),
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('total'.tr, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                  Text(AppFormatters.formatCurrency(_grandTotal),
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 16, color: AppColors.primary)),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _cart.isEmpty ? null : _checkout,
                  icon: const Icon(Icons.payment_rounded, size: 18),
                  label: Text('payment'.tr),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
