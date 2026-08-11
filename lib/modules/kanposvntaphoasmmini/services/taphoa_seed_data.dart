import '../models/product.dart';
import '../models/invoice.dart';
import '../models/inventory.dart';
import '../models/finance.dart';
import '../models/partner.dart';
import 'taphoa_isar_service.dart';

/// Dữ liệu mẫu MiniMart Pro - Siêu thị mini / Tạp hóa.
class TapHoaSeedData {
  static Future<void> seedIfEmpty(TapHoaIsarService isar) async {
    if (await isar.isSeeded()) return;

    // 1. NHÓM HÀNG
    final cats = <String, TapHoaCategory>{};
    const categoryNames = [
      'Đồ uống',
      'Bánh kẹo',
      'Gia vị',
      'Sữa & Bơ',
      'Mỹ phẩm',
      'Hóa mỹ phẩm',
      'Rau củ quả',
      'Thịt cá',
      'Đông lạnh',
      'Khác',
    ];
    for (final name in categoryNames) {
      final c = TapHoaCategory()
        ..categoryId = 'CAT_${name.hashCode.abs()}'
        ..name = name
        ..description = 'Nhóm hàng $name'
        ..updatedAt = DateTime.now();
      await isar.saveCategory(c);
      cats[name] = c;
    }

    // 2. HÀNG HÓA
    final now = DateTime.now();
    DateTime hsd(int days) => DateTime(now.year, now.month, now.day)
        .add(Duration(days: days));

    final rawProducts = [
      _Seed('HH001', '8934567001001', 'Trà sữa trân châu 500ml', 'Đồ uống', 'Chai', 18000, 15000, 16000, 0, 5, 120, 'Vinamilk'),
      _Seed('HH002', '8934567001002', 'Coca-Cola 330ml', 'Đồ uống', 'Lon', 10000, 8500, 9000, 0, 8, 200, 'Coca-Cola'),
      _Seed('HH003', '8934567001003', 'Bia Tiger bạc 330ml', 'Đồ uống', 'Lon', 15000, 12500, 13000, 0, 10, 180, 'Bia Sài Gòn'),
      _Seed('HH004', '8934567001004', 'Nước khoáng Lavie 500ml', 'Đồ uống', 'Chai', 7000, 5500, 6000, 0, 8, 200, 'Lavie'),
      _Seed('HH005', '8934567001005', 'Bánh Oreo vị socola 154g', 'Bánh kẹo', 'Gói', 25000, 21000, 22000, 0, 10, 90, 'Mondelez'),
      _Seed('HH006', '8934567001006', 'Kẹo dẻo Haribo 100g', 'Bánh kẹo', 'Gói', 20000, 16500, 17500, 0, 10, 60, 'Haribo'),
      _Seed('HH007', '8934567001007', 'Bánh quy Cosy vị sữa', 'Bánh kẹo', 'Gói', 15000, 12000, 13000, 0, 10, 45, 'Kinh Đô'),
      _Seed('HH008', '8934567001008', 'Mì tôm Hảo Hảo 75g', 'Bánh kẹo', 'Gói', 4000, 3500, 3600, 0, 10, 240, 'Acecook'),
      _Seed('HH009', '8934567001009', 'Nước mắm Nam Ngư 500ml', 'Gia vị', 'Chai', 45000, 38000, 40000, 0, 8, 360, 'Masangroup'),
      _Seed('HH010', '8934567001010', 'Dầu ăn Simply 1 lít', 'Gia vị', 'Chai', 60000, 52000, 55000, 0, 8, 300, 'Simply'),
      _Seed('HH011', '8934567001011', 'Bột ngọt Ajinomoto 454g', 'Gia vị', 'Gói', 55000, 48000, 50000, 0, 8, 365, 'Ajinomoto'),
      _Seed('HH012', '8934567001012', 'Sữa tươi Vinamilk 180ml', 'Sữa & Bơ', 'Hộp', 8000, 7000, 7200, 0, 5, 30, 'Vinamilk'),
      _Seed('HH013', '8934567001013', 'Sữa chua Vinamilk hũ', 'Sữa & Bơ', 'Hũ', 9000, 7500, 8000, 0, 5, 15, 'Vinamilk'),
      _Seed('HH014', '8934567001014', 'Sữa đặc Ông Thọ đỏ 380g', 'Sữa & Bơ', 'Lon', 28000, 24000, 25000, 0, 5, 120, 'Vinamilk'),
      _Seed('HH015', '8934567001015', 'Kem đánh răng P/S 200g', 'Mỹ phẩm', 'Cái', 32000, 27000, 29000, 0, 8, 180, 'Unilever'),
      _Seed('HH016', '8934567001016', 'Dầu gội Clear 350ml', 'Mỹ phẩm', 'Chai', 95000, 82000, 88000, 0, 10, 365, 'Unilever'),
      _Seed('HH017', '8934567001017', 'Bột giặt OMO 800g', 'Hóa mỹ phẩm', 'Gói', 55000, 47000, 50000, 0, 10, 365, 'Unilever'),
      _Seed('HH018', '8934567001018', 'Nước rửa chén Sunlight 750ml', 'Hóa mỹ phẩm', 'Chai', 35000, 30000, 32000, 0, 8, 365, 'Unilever'),
      _Seed('HH019', '8934567001019', 'Cà chua Đà Lạt', 'Rau củ quả', 'Kg', 25000, 18000, 22000, 0, 0, 5, 'Nông sản Đà Lạt'),
      _Seed('HH020', '8934567001020', 'Trứng gà ta (chục)', 'Rau củ quả', 'Chục', 38000, 33000, 35000, 0, 0, 21, 'Trang trại Minh Châu'),
      _Seed('HH021', '8934567001021', 'Thịt heo nạc vai', 'Thịt cá', 'Kg', 110000, 95000, 100000, 0, 0, 3, 'Thịt sạch 3S'),
      _Seed('HH022', '8934567001022', 'Cá thu đông lạnh', 'Thịt cá', 'Kg', 135000, 118000, 125000, 0, 0, 60, 'Hải sản Bình Định'),
      _Seed('HH023', '8934567001023', 'Xúc xích Đức Việt 300g', 'Đông lạnh', 'Gói', 45000, 38000, 41000, 0, 10, 45, 'Đức Việt'),
      _Seed('HH024', '8934567001024', 'Bánh tráng trộn 500g', 'Khác', 'Gói', 28000, 23000, 25000, 0, 8, 90, 'Tân Nhiên'),
    ];

    for (final s in rawProducts) {
      final p = TapHoaProduct()
        ..productId = 'PRD_${s.code}'
        ..productCode = s.code
        ..barcode = s.barcode
        ..qrCode = s.barcode
        ..sku = s.code
        ..productName = s.name
        ..unit = s.unit
        ..purchasePrice = s.purchase
        ..retailPrice = s.retail
        ..wholesalePrice = s.wholesale
        ..promotionPrice = s.promo
        ..vatRate = s.vat
        ..expiryDate = hsd(s.expiryDays)
        ..manufacturer = s.manufacturer
        ..note = 'Hàng hóa mẫu MiniMart Pro'
        ..createdAt = now
        ..updatedAt = now;
      p.category.value = cats[s.cat];
      await isar.saveProduct(p);
    }

    // 3. TỒN KHO (một số mặt hàng sắp hết → cảnh báo)
    final products = await isar.getProducts();
    final inventoryDefs = <String, (double, double, double, double)>{
      'HH001': (120, 30, 500, 15000),
      'HH002': (80, 50, 300, 8500),
      'HH003': (150, 40, 300, 12500),
      'HH004': (10, 40, 300, 5500),   // sắp hết
      'HH005': (200, 20, 200, 21000),
      'HH006': (60, 20, 200, 16500),
      'HH007': (45, 15, 100, 12000),  // sắp hết
      'HH008': (500, 100, 1000, 3500),
      'HH009': (90, 25, 200, 38000),
      'HH010': (70, 20, 150, 52000),
      'HH011': (40, 15, 100, 48000),
      'HH012': (18, 50, 400, 7000),   // sắp hết
      'HH013': (30, 50, 300, 7500),
      'HH014': (85, 20, 150, 24000),
      'HH015': (25, 15, 80, 27000),
      'HH016': (32, 10, 60, 82000),
      'HH017': (48, 20, 100, 47000),
      'HH018': (60, 20, 120, 30000),
      'HH019': (12, 10, 50, 18000),
      'HH020': (9, 15, 80, 33000),   // sắp hết
      'HH021': (15, 10, 60, 95000),
      'HH022': (8, 10, 40, 118000),  // sắp hết
      'HH023': (20, 10, 50, 38000),
      'HH024': (35, 15, 100, 23000),
    };
    for (final p in products) {
      final def = inventoryDefs[p.productCode];
      if (def == null) continue;
      final item = TapHoaInventoryItem()
        ..inventoryItemId = 'INV_${p.productId}'
        ..productId = p.productId
        ..productName = p.productName
        ..currentStock = def.$1
        ..minStock = def.$2
        ..maxStock = def.$3
        ..unit = p.unit
        ..costPrice = def.$4
        ..updatedAt = DateTime.now();
      await isar.saveInventoryItem(item);
    }

    // 4. KHÁCH HÀNG
    final customers = [
      TapHoaCustomer()
        ..customerId = 'CUS_KHACHLE'
        ..name = 'Khách lẻ'
        ..phone = ''
        ..address = ''
        ..debtAmount = 0
        ..totalSpent = 0
        ..rewardPoints = 0
        ..memberTier = 'Silver',
      TapHoaCustomer()
        ..customerId = 'CUS_NVA'
        ..name = 'Nguyễn Văn An'
        ..phone = '0901234567'
        ..address = '12 Lê Lợi, Q.1, TP.HCM'
        ..debtAmount = 150000
        ..totalSpent = 8600000
        ..rewardPoints = 860
        ..memberTier = 'Gold',
      TapHoaCustomer()
        ..customerId = 'CUS_TTB'
        ..name = 'Trần Thị Bích'
        ..phone = '0912345678'
        ..address = '45 Hai Bà Trưng, Q.1, TP.HCM'
        ..debtAmount = 0
        ..totalSpent = 1200000
        ..rewardPoints = 120
        ..memberTier = 'Silver',
      TapHoaCustomer()
        ..customerId = 'CUS_LVC'
        ..name = 'Lê Văn Cường'
        ..phone = '0933333333'
        ..address = '78 Nguyễn Huệ, Q.1, TP.HCM'
        ..debtAmount = 350000
        ..totalSpent = 25000000
        ..rewardPoints = 2500
        ..memberTier = 'Platinum',
      TapHoaCustomer()
        ..customerId = 'CUS_DAIHOA'
        ..name = 'Đại lý Hoàng Anh'
        ..phone = '0944444444'
        ..address = 'KCN Tân Thuận, Q.7, TP.HCM'
        ..debtAmount = 1200000
        ..totalSpent = 52000000
        ..rewardPoints = 5200
        ..memberTier = 'Diamond',
    ];
    for (final c in customers) {
      await isar.saveCustomer(c);
    }

    // 5. NHÀ CUNG CẤP
    final suppliers = [
      TapHoaSupplier()
        ..supplierId = 'SUP_NSGK'
        ..name = 'Công ty TNHH Nước Giải Khát Sài Gòn'
        ..phone = '02838211234'
        ..address = '289 Hai Bà Trưng, Q.3, TP.HCM'
        ..debtAmount = 2500000,
      TapHoaSupplier()
        ..supplierId = 'SUP_VINAMILK'
        ..name = 'Công ty CP Sữa Việt Nam (Vinamilk)'
        ..phone = '02854155555'
        ..address = '10 Tân Trào, Q.7, TP.HCM'
        ..debtAmount = 0,
      TapHoaSupplier()
        ..supplierId = 'SUP_GAO'
        ..name = 'Đại lý Gạo Thơm Việt'
        ..phone = '0905555555'
        ..address = 'Chợ Bình Điền, Q.8, TP.HCM'
        ..debtAmount = 1200000,
      TapHoaSupplier()
        ..supplierId = 'SUP_KD'
        ..name = 'Công ty CP Bánh Kẹo Kinh Đô'
        ..phone = '02839988888'
        ..address = 'Số 6 Trần Nguyên Đán, Q.Bình Thạnh'
        ..debtAmount = 800000,
      TapHoaSupplier()
        ..supplierId = 'SUP_UNILEVER'
        ..name = 'Unilever Việt Nam'
        ..phone = '02839101888'
        ..address = '156 Nguyễn Lương Bằng, Q.7, TP.HCM'
        ..debtAmount = 0,
    ];
    for (final s in suppliers) {
      await isar.saveSupplier(s);
    }

    // 6. HÓA ĐƠN MẪU (một vài ngày gần đây)
    final samples = await isar.getProducts();
    TapHoaProduct? byCode(String code) {
      for (final p in samples) {
        if (p.productCode == code) return p;
      }
      return null;
    }

    await _createInvoice(isar, 'HD001', now.subtract(const Duration(days: 1)),
        'CUS_NVA', 'Nguyễn Văn An', 'cash', 5000, [
      _Line(byCode('HH001'), 2),
      _Line(byCode('HH005'), 1),
      _Line(byCode('HH012'), 4),
    ]);

    await _createInvoice(isar, 'HD002', now.subtract(const Duration(days: 1)),
        '', 'Khách lẻ', 'cash', 0, [
      _Line(byCode('HH002'), 3),
      _Line(byCode('HH008'), 5),
    ]);

    await _createInvoice(isar, 'HD003', now.subtract(const Duration(days: 2)),
        'CUS_LVC', 'Lê Văn Cường', 'transfer', 10000, [
      _Line(byCode('HH016'), 2),
      _Line(byCode('HH017'), 3),
      _Line(byCode('HH018'), 2),
    ]);

    await _createInvoice(isar, 'HD004', now.subtract(const Duration(days: 3)),
        'CUS_DAIHOA', 'Đại lý Hoàng Anh', 'debt', 20000, [
      _Line(byCode('HH002'), 24),
      _Line(byCode('HH003'), 24),
      _Line(byCode('HH008'), 60),
    ]);

    await _createInvoice(isar, 'HD005', now.subtract(const Duration(days: 3)),
        '', 'Khách lẻ', 'qr', 0, [
      _Line(byCode('HH019'), 2),
      _Line(byCode('HH021'), 1),
    ]);

    // 7. THU CHI MẪU
    final cashTx = [
      TapHoaCashTransaction()
        ..transactionId = 'CTX_SEED_1'
        ..title = 'Thu bán hàng ngày'
        ..type = 'INCOME'
        ..category = 'Bán hàng'
        ..amount = 1850000
        ..paymentMethod = 'Tiền mặt'
        ..timestamp = now.subtract(const Duration(days: 1))
        ..performerName = 'Thu ngân'
        ..note = 'Tổng hợp cuối ngày',
      TapHoaCashTransaction()
        ..transactionId = 'CTX_SEED_2'
        ..title = 'Nhập hàng đợt 1'
        ..type = 'EXPENSE'
        ..category = 'Nhập hàng'
        ..amount = 4500000
        ..paymentMethod = 'Chuyển khoản'
        ..timestamp = now.subtract(const Duration(days: 2))
        ..performerName = 'Quản lý'
        ..note = 'Thanh toán NCC nước giải khát',
      TapHoaCashTransaction()
        ..transactionId = 'CTX_SEED_3'
        ..title = 'Tiền điện'
        ..type = 'EXPENSE'
        ..category = 'Tiền điện'
        ..amount = 780000
        ..paymentMethod = 'Chuyển khoản'
        ..timestamp = now.subtract(const Duration(days: 4))
        ..performerName = 'Kế toán'
        ..note = 'Hóa đơn điện tháng trước',
      TapHoaCashTransaction()
        ..transactionId = 'CTX_SEED_4'
        ..title = 'Thu công nợ Nguyễn Văn An'
        ..type = 'INCOME'
        ..category = 'Thu công nợ'
        ..amount = 200000
        ..paymentMethod = 'Tiền mặt'
        ..timestamp = now.subtract(const Duration(days: 5))
        ..performerName = 'Thu ngân'
        ..note = '',
      TapHoaCashTransaction()
        ..transactionId = 'CTX_SEED_5'
        ..title = 'Lương nhân viên'
        ..type = 'EXPENSE'
        ..category = 'Lương'
        ..amount = 6000000
        ..paymentMethod = 'Chuyển khoản'
        ..timestamp = now.subtract(const Duration(days: 6))
        ..performerName = 'Chủ cửa hàng'
        ..note = 'Lương tháng',
    ];
    for (final t in cashTx) {
      await isar.saveCashTransaction(t);
    }
  }

  static Future<void> _createInvoice(
    TapHoaIsarService isar,
    String number,
    DateTime createdAt,
    String customerId,
    String customerName,
    String paymentMethod,
    double discount,
    List<_Line> lines,
  ) async {
    final invoice = TapHoaInvoice()
      ..invoiceId = 'INV_$number'
      ..invoiceNumber = number
      ..createdAt = createdAt
      ..customerId = customerId
      ..customerName = customerName
      ..paymentMethod = paymentMethod
      ..status = 'completed'
      ..cashierName = 'Thu ngân'
      ..updatedAt = DateTime.now();

    final items = <TapHoaInvoiceItem>[];
    double total = 0;
    var seq = 0;
    for (final line in lines) {
      if (line.product == null) continue;
      seq++;
      final totalPrice = line.product!.retailPrice * line.qty;
      total += totalPrice;
      items.add(TapHoaInvoiceItem()
        ..invoiceItemId = 'ITEM_${number}_$seq'
        ..invoiceId = invoice.invoiceId
        ..productId = line.product!.productId
        ..productName = line.product!.productName
        ..productCode = line.product!.productCode
        ..quantity = line.qty
        ..price = line.product!.retailPrice
        ..discount = 0
        ..total = totalPrice
        ..updatedAt = DateTime.now());
    }
    invoice.totalAmount = total;
    invoice.discountAmount = discount;
    invoice.finalAmount = total - discount;
    invoice.amountPaid = invoice.finalAmount;
    invoice.changeAmount = 0;
    await isar.processCheckout(invoice, items,
        customer: customerId.isNotEmpty
            ? await _findCustomer(isar, customerId)
            : null);
  }

  static Future<TapHoaCustomer?> _findCustomer(
      TapHoaIsarService isar, String id) async {
    final list = await isar.getCustomers();
    for (final c in list) {
      if (c.customerId == id) return c;
    }
    return null;
  }
}

class _Seed {
  final String code;
  final String barcode;
  final String name;
  final String cat;
  final String unit;
  final double retail;
  final double purchase;
  final double wholesale;
  final double promo;
  final double vat;
  final int expiryDays;
  final String manufacturer;
  _Seed(this.code, this.barcode, this.name, this.cat, this.unit, this.retail,
      this.purchase, this.wholesale, this.promo, this.vat, this.expiryDays,
      this.manufacturer);
}

class _Line {
  final TapHoaProduct? product;
  final double qty;
  _Line(this.product, this.qty);
}
