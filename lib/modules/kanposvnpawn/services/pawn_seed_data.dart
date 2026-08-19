import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../services/pawn_isar_service.dart';
import '../models/customer.dart';
import '../models/product.dart';
import '../models/supplier.dart';
import '../models/pawn_contract.dart';
import '../models/invoice.dart';
import '../models/pawn_cash_transaction.dart';
import '../models/pawn_repair_order.dart';

class PawnSeedData {
  static String _uuid() => const Uuid().v4().substring(0, 8).toUpperCase();
  static DateTime _daysAgo(int days) => DateTime.now().subtract(Duration(days: days));

  static Future<void> seedIfEmpty(PawnIsarService isarService) async {
    final isar = await isarService.db;

    final customerCount = await isar.customers.count();
    if (customerCount > 0) return;

    await _seedCustomers(isar);
    await _seedSuppliers(isar);
    await _seedProducts(isar);
    await _seedPawnContracts(isar);
    await _seedInvoices(isar);
    await _seedCashTransactions(isar);
    await _seedRepairOrders(isar);
  }

  static Future<void> _seedCustomers(Isar isar) async {
    final customers = [
      _c('KH${_uuid()}', 'Nguyễn Văn An', '0901234567', '079200012345', '123 Nguyễn Trãi, Q.1, TP.HCM', _daysAgo(3650), 'M', 1500000, 26000000, 15000000, 0, 120, 'Vip'),
      _c('KH${_uuid()}', 'Trần Thị Bích', '0908765432', '079200098765', '456 Lê Lợi, Q.1, TP.HCM', _daysAgo(3200), 'F', 0, 0, 0, 0, 50, 'Bạc'),
      _c('KH${_uuid()}', 'Lê Minh Cường', '0912345678', '079200011223', '789 Phan Đình Phùng, Phú Nhuận', _daysAgo(2800), 'M', 800000, 12000000, 8500000, 2000000, 85, 'Vàng'),
      _c('KH${_uuid()}', 'Phạm Thu Hương', '0923456789', '079200044556', '321 Hai Bà Trưng, Q.3', _daysAgo(2500), 'F', 2200000, 0, 18000000, 0, 200, 'Vip'),
      _c('KH${_uuid()}', 'Hoàng Văn Đức', '0934567890', '079200077889', '654 Võ Văn Tần, Q.3', _daysAgo(2000), 'M', 0, 8500000, 6000000, 3500000, 40, 'Bạc'),
      _c('KH${_uuid()}', 'Ngô Thị Mai', '0945678901', '079200033445', '987 Cách Mạng Tháng 8, Q.10', _daysAgo(1800), 'F', 500000, 15000000, 12000000, 0, 150, 'Vàng'),
      _c('KH${_uuid()}', 'Đỗ Quang Huy', '0956789012', '079200066778', '147 Trường Chinh, Tân Bình', _daysAgo(1500), 'M', 3000000, 0, 22000000, 5000000, 250, 'Vip'),
      _c('KH${_uuid()}', 'Bùi Thanh贷款', '0967890123', '079200099001', '258 Lũy Bán Bích, Tân Phú', _daysAgo(1200), 'F', 1200000, 6000000, 9000000, 0, 75, 'Bạc'),
      _c('KH${_uuid()}', 'Vũ Ngọc Sơn', '0978901234', '079200022334', '369 Điện Biên Phủ, Bình Thạnh', _daysAgo(900), 'M', 0, 0, 0, 4000000, 30, 'Đồng'),
      _c('KH${_uuid()}', 'Đặng Thị Lan', '0989012345', '079200055667', '741 Xô Viết Nghệ Tĩnh, Bình Thạnh', _daysAgo(600), 'F', 750000, 10000000, 7500000, 0, 100, 'Vàng'),
      _c('KH${_uuid()}', 'Mai Đình Thắng', '0990123456', '079200088990', '852 Quốc lộ 13, Thủ Đức', _daysAgo(300), 'M', 1800000, 4500000, 13000000, 1000000, 60, 'Bạc'),
      _c('KH${_uuid()}', 'Lý华庭', '0901122334', '079200012121', '963 Nguyễn Kiệm, Gò Vấp', _daysAgo(150), 'F', 400000, 0, 5000000, 0, 20, 'Đồng'),
    ];
    await isar.writeTxn(() async => await isar.customers.putAll(customers));
  }

  static Customer _c(
    String code, String name, String phone, String cccd, String address,
    DateTime dob, String gender, double debt, double totalPurchase,
    double totalPawn, double totalConsignment, int points, String tier,
  ) {
    final now = DateTime.now();
    return Customer()
      ..customerCode = code
      ..fullName = name
      ..phone = phone
      ..cccd = cccd
      ..address = address
      ..dateOfBirth = dob
      ..gender = gender
      ..debtAmount = debt
      ..totalPurchase = totalPurchase
      ..totalPawn = totalPawn
      ..totalConsignment = totalConsignment
      ..rewardPoints = points
      ..membershipTier = tier
      ..createdAt = now
      ..updatedAt = now;
  }

  static Future<void> _seedSuppliers(Isar isar) async {
    final suppliers = [
      _s('NCC001', 'Phú Thái Mobile', '0902345678', 'phuthai@mobile.vn', '12 Lý Tự Trọng, Q.1', '0301234567', 2500000, 45000000),
      _s('NCC002', 'Dũng MiniMart', '0913456789', 'dung@minimart.vn', '45 Bến Thành, Q.1', '0302345678', 800000, 28000000),
      _s('NCC003', 'Thịnh Phát Electronics', '0924567890', 'thinhp@e.vn', '78 Nguyễn Oanh, Gò Vấp', '0303456789', 0, 15000000),
      _s('NCC004', 'Hòa Bình Parts', '0935678901', 'hoabinh@parts.vn', '234 Trường Chinh, Tân Bình', '0304567890', 1500000, 32000000),
      _s('NCC005', 'An Phát Accessories', '0946789012', 'anphat@acc.vn', '567 Sư Vạn Hạnh, Q.10', '0305678901', 0, 18000000),
    ];
    await isar.writeTxn(() async => await isar.suppliers.putAll(suppliers));
  }

  static Supplier _s(String code, String name, String phone, String email, String addr, String tax, double debt, double total) {
    final now = DateTime.now();
    return Supplier()
      ..supplierCode = code
      ..name = name
      ..phone = phone
      ..email = email
      ..address = addr
      ..taxCode = tax
      ..currentDebt = debt
      ..totalPurchase = total
      ..createdAt = now
      ..updatedAt = now;
  }

  static Future<void> _seedProducts(Isar isar) async {
    final products = <Product>[
      // Phones
      _p('iPhone 15 Pro Max', 'Apple', 'Điện thoại', 'DT001', '35GKJ12345', 'SN1001', 'Titan Đen', '256GB', 'Mới', 28000000, 32000000, 27000000, 30000000, 5),
      _p('iPhone 14 Pro', 'Apple', 'Điện thoại', 'DT002', '35GKJ56789', 'SN1002', 'Tím', '128GB', 'Like New', 18000000, 22000000, 17000000, 20000000, 3),
      _p('Samsung Galaxy S24 Ultra', 'Samsung', 'Điện thoại', 'DT003', 'R5CX12345', 'SN1003', 'Xám', '256GB', 'Mới', 25000000, 29000000, 24000000, 27000000, 4),
      _p('Samsung Galaxy A54', 'Samsung', 'Điện thoại', 'DT004', 'R5CX67890', 'SN1004', 'Trắng', '128GB', '99%', 7500000, 9500000, 7000000, 8500000, 6),
      _p('Xiaomi 14', 'Xiaomi', 'Điện thoại', 'DT005', 'XM12345', 'SN1005', 'Xanh', '256GB', 'Mới', 15000000, 17500000, 14000000, 16000000, 3),
      _p('OPPO Reno 11', 'OPPO', 'Điện thoại', 'DT006', 'OP12345', 'SN1006', 'Vàng', '256GB', '95%', 8000000, 10000000, 7500000, 9000000, 4),
      _p('iPhone 13', 'Apple', 'Điện thoại', 'DT007', '35GKJ99999', 'SN1007', 'Xanh Dương', '128GB', '95%', 11000000, 13500000, 10500000, 12000000, 2),
      _p('Vivo V29', 'Vivo', 'Điện thoại', 'DT008', 'VV12345', 'SN1008', 'Đỏ', '256GB', '99%', 6500000, 8500000, 6000000, 7500000, 3),
      // Laptop
      _p('MacBook Pro 14 M3', 'Apple', 'Laptop', 'LT001', 'C02X12345', 'SN2001', 'Bạc', '512GB', 'Mới', 38000000, 42000000, 37000000, 40000000, 2),
      _p('MacBook Air M2', 'Apple', 'Laptop', 'LT002', 'C02X54321', 'SN2002', 'Xám', '256GB', 'Like New', 22000000, 26000000, 21000000, 24000000, 3),
      _p('Dell XPS 15', 'Dell', 'Laptop', 'LT003', 'DELL12345', 'SN2003', 'Bạc', '512GB', 'Mới', 32000000, 36000000, 31000000, 34000000, 2),
      // Tablet
      _p('iPad Pro 12.9 M2', 'Apple', 'iPad', 'TB001', 'DLX98765', 'SN3001', 'Xám', '256GB', 'Mới', 25000000, 28500000, 24000000, 27000000, 2),
      _p('iPad Air 5', 'Apple', 'iPad', 'TB002', 'DLX54321', 'SN3002', 'Trắng', '64GB', '99%', 13000000, 15500000, 12500000, 14000000, 3),
      // Watch
      _p('Apple Watch Ultra 2', 'Apple', 'Đồng hồ', 'DH001', 'AW12345', 'SN4001', 'Cam', '49mm', 'Mới', 18000000, 21000000, 17500000, 19500000, 2),
      _p('Apple Watch Series 9', 'Apple', 'Đồng hồ', 'DH002', 'AW67890', 'SN4002', 'Đen', '45mm', 'Like New', 9000000, 11000000, 8500000, 10000000, 4),
      // AirPods
      _p('AirPods Pro 2', 'Apple', 'Phụ kiện', 'PK001', 'AP12345', 'SN5001', 'Trắng', '', 'Mới', 5500000, 6500000, 5000000, 6000000, 8),
      _p('AirPods Max', 'Apple', 'Phụ kiện', 'PK002', 'AP67890', 'SN5002', 'Xanh Dương', '', '99%', 9000000, 10500000, 8500000, 9500000, 3),
      // Phone cases & accessories
      _p('Ốp lưng iPhone 15', 'Generic', 'Phụ kiện', 'PK003', '', '', 'Đen', '', 'Mới', 150000, 300000, 100000, 250000, 50),
      _p('Sạc nhanh 20W Type-C', 'Generic', 'Phụ kiện', 'PK004', '', '', 'Trắng', '', 'Mới', 200000, 450000, 150000, 350000, 30),
      _p('Tai nghe Bluetooth JBL', 'JBL', 'Phụ kiện', 'PK005', 'JBL12345', '', 'Đỏ', '', 'Mới', 800000, 1200000, 700000, 1000000, 10),
    ];
    await isar.writeTxn(() async => await isar.products.putAll(products));
  }

  static Product _p(
    String name, String brand, String category, String sku,
    String imei, String serial, String color, String capacity, String condition,
    double cost, double selling, double importing, double consignment, int stock,
  ) {
    final now = DateTime.now();
    return Product()
      ..name = name
      ..brand = brand
      ..category = category
      ..sku = sku
      ..imei = imei
      ..serial = serial
      ..color = color
      ..capacity = capacity
      ..condition = condition
      ..costPrice = cost
      ..sellingPrice = selling
      ..importPrice = importing
      ..consignmentPrice = consignment
      ..stock = stock
      ..createdAt = now
      ..updatedAt = now;
  }

  static Future<void> _seedPawnContracts(Isar isar) async {
    final customers = await isar.customers.where().findAll();
    if (customers.isEmpty) return;

    final contracts = <PawnContract>[
      // ACTIVE — daily interest, 30 days, some overdue
      _pc('HD${_uuid()}', customers[0], 8000000, 0.05, InterestType.daily, _daysAgo(45), 15, 'iPhone 14 Pro', 'Apple', '35GKJ56789', 'iPhone 14 Pro 128GB Tím, 99%', 12000000, PawnStatus.active, null, 1800000, 300000),
      _pc('HD${_uuid()}', customers[1], 5000000, 0.04, InterestType.daily, _daysAgo(20), 10, 'Samsung Galaxy S24', 'Samsung', 'R5CX12345', 'Galaxy S24 Ultra 256GB Xám', 15000000, PawnStatus.active, null, 400000, 0),
      // ACTIVE — monthly interest
      _pc('HD${_uuid()}', customers[2], 15000000, 3.0, InterestType.monthly, _daysAgo(60), 3, 'MacBook Pro 14 M3', 'Apple', 'C02X12345', 'MacBook Pro 14 inch M3 512GB', 42000000, PawnStatus.active, null, 1500000, 900000),
      // ACTIVE — overdue
      _pc('HD${_uuid()}', customers[3], 10000000, 0.06, InterestType.daily, _daysAgo(60), 30, 'iPad Pro 12.9', 'Apple', 'DLX98765', 'iPad Pro 12.9 M2 256GB', 28500000, PawnStatus.overdue, null, 3600000, 1200000),
      // ACTIVE — fixed amount
      _pc('HD${_uuid()}', customers[4], 3000000, 50000, InterestType.fixedAmount, _daysAgo(15), 1, 'iPhone 13', 'Apple', '35GKJ99999', 'iPhone 13 128GB Xanh', 13500000, PawnStatus.active, null, 50000, 0),
      // REDEEMED
      _pc('HD${_uuid()}', customers[5], 8000000, 0.05, InterestType.daily, _daysAgo(30), 15, 'Apple Watch Ultra', 'Apple', 'AW12345', 'Apple Watch Ultra 2 49mm', 21000000, PawnStatus.redeemed, _daysAgo(5), 2000000, 2000000),
      _pc('HD${_uuid()}', customers[6], 20000000, 2.5, InterestType.monthly, _daysAgo(90), 6, 'MacBook Air M2', 'Apple', 'C02X54321', 'MacBook Air M2 256GB Xám', 26000000, PawnStatus.redeemed, _daysAgo(20), 5000000, 5000000),
      // LIQUIDATED
      _pc('HD${_uuid()}', customers[7], 6000000, 0.05, InterestType.daily, _daysAgo(40), 20, 'OPPO Reno 11', 'OPPO', 'OP12345', 'OPPO Reno 11 256GB Vàng', 10000000, PawnStatus.liquidated, _daysAgo(10), 2000000, 2000000),
      // ACTIVE — more varied
      _pc('HD${_uuid()}', customers[0], 4000000, 0.04, InterestType.daily, _daysAgo(10), 7, 'AirPods Pro 2', 'Apple', 'AP12345', 'AirPods Pro 2 USB-C', 6500000, PawnStatus.active, null, 160000, 0),
      _pc('HD${_uuid()}', customers[8], 7000000, 0.05, InterestType.daily, _daysAgo(25), 15, 'Dell XPS 15', 'Dell', 'DELL12345', 'Dell XPS 15 512GB Bạc', 36000000, PawnStatus.active, null, 875000, 0),
      _pc('HD${_uuid()}', customers[9], 2500000, 3.5, InterestType.monthly, _daysAgo(35), 2, 'Vivo V29', 'Vivo', 'VV12345', 'Vivo V29 256GB Đỏ', 8500000, PawnStatus.active, null, 291666, 0),
      _pc('HD${_uuid()}', customers[10], 9000000, 0.05, InterestType.daily, _daysAgo(5), 5, 'Samsung Galaxy A54', 'Samsung', 'R5CX67890', 'Galaxy A54 128GB Trắng 99%', 9500000, PawnStatus.active, null, 225000, 0),
      _pc('HD${_uuid()}', customers[3], 12000000, 0.06, InterestType.daily, _daysAgo(70), 30, 'Xiaomi 14', 'Xiaomi', 'XM12345', 'Xiaomi 14 256GB Xanh Mới', 17500000, PawnStatus.overdue, null, 5040000, 1800000),
      _pc('HD${_uuid()}', customers[11], 1500000, 4.0, InterestType.monthly, _daysAgo(8), 1, 'iPhone 15 Pro Max', 'Apple', '35GKJ12345', 'iPhone 15 Pro Max 256GB', 32000000, PawnStatus.active, null, 16000, 0),
      _pc('HD${_uuid()}', customers[6], 5000000, 100000, InterestType.fixedAmount, _daysAgo(20), 2, 'Apple Watch Series 9', 'Apple', 'AW67890', 'Apple Watch S9 45mm Đen', 11000000, PawnStatus.active, null, 100000, 0),
    ];
    await isar.writeTxn(() async {
      for (final c in contracts) {
        await isar.pawnContracts.put(c);
        await c.customer.save();
      }
    });
  }

  static PawnContract _pc(
    String number, Customer customer, double amount, double rate,
    InterestType type, DateTime pawnDate, int days, String model,
    String brand, String imei, String desc, double assetValue,
    PawnStatus status, DateTime? redeemedAt,
    double totalInterest, double paidInterest,
  ) {
    final now = DateTime.now();
    return PawnContract()
      ..contractNumber = number
      ..customer.value = customer
      ..pawnAmount = amount
      ..interestRate = rate
      ..interestType = type
      ..pawnDate = pawnDate
      ..dueDate = pawnDate.add(Duration(days: days))
      ..numberOfDays = days
      ..assetModel = model
      ..assetBrand = brand
      ..imei = imei
      ..description = desc
      ..assetValue = assetValue
      ..status = status
      ..totalInterest = totalInterest
      ..paidInterest = paidInterest
      ..renewalCount = 0
      ..totalInterestCollected = paidInterest
      ..lastInterestCollectionDate = pawnDate.add(Duration(days: days ~/ 2))
      ..createdAt = now
      ..updatedAt = redeemedAt ?? now;
  }

  static Future<void> _seedInvoices(Isar isar) async {
    final customers = await isar.customers.where().findAll();
    if (customers.isEmpty) return;

    final invoices = <Invoice>[
      _inv('HD${_uuid()}', customers[0], InvoiceType.sale, 13500000, 0, 0, 13500000, PaymentMethod.cash, 'Bán iPhone 13', _daysAgo(25)),
      _inv('HD${_uuid()}', customers[2], InvoiceType.sale, 6500000, 500000, 0, 6000000, PaymentMethod.bankTransfer, 'Bán AirPods Pro 2', _daysAgo(18)),
      _inv('HD${_uuid()}', customers[5], InvoiceType.purchase, 22000000, 0, 0, 22000000, PaymentMethod.cash, 'Mua iPhone 14 Pro từ khách', _daysAgo(15)),
      _inv('HD${_uuid()}', customers[3], InvoiceType.sale, 9500000, 0, 0, 9500000, PaymentMethod.qrCode, 'Bán Samsung A54', _daysAgo(12)),
      _inv('HD${_uuid()}', customers[6], InvoiceType.sale, 42000000, 2000000, 0, 40000000, PaymentMethod.bankTransfer, 'Bán MacBook Pro 14', _daysAgo(10)),
      _inv('HD${_uuid()}', customers[8], InvoiceType.purchase, 8500000, 0, 0, 8500000, PaymentMethod.cash, 'Mua Vivo V29', _daysAgo(8)),
      _inv('HD${_uuid()}', customers[9], InvoiceType.sale, 11000000, 0, 0, 11000000, PaymentMethod.eWallet, 'Bán Apple Watch S9', _daysAgo(5)),
      _inv('HD${_uuid()}', customers[1], InvoiceType.sale, 17500000, 0, 0, 17500000, PaymentMethod.cash, 'Bán Xiaomi 14', _daysAgo(3)),
      _inv('HD${_uuid()}', customers[4], InvoiceType.repair, 1500000, 0, 0, 1500000, PaymentMethod.cash, 'Sửa iPhone 15 Pro Max - thay màn', _daysAgo(2)),
      _inv('HD${_uuid()}', customers[10], InvoiceType.sale, 1000000, 100000, 0, 900000, PaymentMethod.cash, 'Bán ốp lưng + sạc nhanh', _daysAgo(1)),
    ];
    await isar.writeTxn(() async {
      for (final inv in invoices) {
        await isar.invoices.put(inv);
        await inv.customer.save();
      }
    });
  }

  static Invoice _inv(
    String number, Customer customer, InvoiceType type,
    double subTotal, double discount, double tax, double total,
    PaymentMethod method, String note, DateTime date,
  ) {
    return Invoice()
      ..invoiceNumber = number
      ..customer.value = customer
      ..type = type
      ..subTotal = subTotal
      ..discount = discount
      ..tax = tax
      ..totalAmount = total
      ..amountPaid = total
      ..change = 0
      ..paymentMethod = method
      ..note = note
      ..createdAt = date
      ..updatedAt = date;
  }

  static Future<void> _seedCashTransactions(Isar isar) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final txns = <PawnCashTransaction>[
      _ct('PT001', TransactionType.income, 13500000, 'Bán hàng', 'Bán iPhone 13 - KH An', today.add(const Duration(hours: 9, minutes: 30)), _daysAgo(25)),
      _ct('PT002', TransactionType.income, 6000000, 'Bán hàng', 'Bán AirPods Pro 2 - KH Cường', today.subtract(const Duration(days: 1, hours: 3)), _daysAgo(18)),
      _ct('PT003', TransactionType.income, 2000000, 'Thu lãi cầm đồ', 'Thu lãi HĐ HDxxx - KH Mai', today.subtract(const Duration(days: 1, hours: 1)), _daysAgo(15)),
      _ct('PT004', TransactionType.expense, 27000000, 'Nhập hàng', 'Nhập lô iPhone từ Phú Thái', today.subtract(const Duration(days: 2)), _daysAgo(15)),
      _ct('PT005', TransactionType.income, 9500000, 'Bán hàng', 'Bán Samsung A54 - KH Hương', today.subtract(const Duration(days: 2, hours: 5)), _daysAgo(12)),
      _ct('PT006', TransactionType.expense, 1500000, 'Lương nhân viên', 'Lương tháng 7 - NV Hùng', today.subtract(const Duration(days: 3)), _daysAgo(10)),
      _ct('PT007', TransactionType.income, 40000000, 'Bán hàng', 'Bán MacBook Pro 14 - KH Huy', today.subtract(const Duration(days: 3, hours: 2)), _daysAgo(10)),
      _ct('PT008', TransactionType.expense, 350000, 'Điện nước', 'Tiền điện tháng 7', today.subtract(const Duration(days: 4)), _daysAgo(8)),
      _ct('PT009', TransactionType.expense, 800000, 'Thuê mặt bằng', 'Tiền thuê tháng 8', today.subtract(const Duration(days: 5)), _daysAgo(5)),
      _ct('PT010', TransactionType.income, 11000000, 'Bán hàng', 'Bán Apple Watch S9 - KH Lan', today.subtract(const Duration(days: 5, hours: 4)), _daysAgo(5)),
      _ct('PT011', TransactionType.income, 17500000, 'Bán hàng', 'Bán Xiaomi 14 - KH Bích', today.subtract(const Duration(hours: 6)), _daysAgo(3)),
      _ct('PT012', TransactionType.expense, 500000, 'Marketing', 'Facebook Ads tháng 8', today.subtract(const Duration(hours: 3)), _daysAgo(2)),
      _ct('PT013', TransactionType.income, 1500000, 'Thu lãi cầm đồ', 'Thu lãi HĐ HDxxx - KH Đức', today.add(const Duration(hours: 10)), _daysAgo(1)),
      _ct('PT014', TransactionType.expense, 300000, 'Chi khác', 'Mua bao bì, túi ni lông', today.add(const Duration(hours: 11)), _daysAgo(1)),
      _ct('PT015', TransactionType.income, 900000, 'Thu nợ khách hàng', 'KH Thắng trả nợ đợt 1', today.add(const Duration(hours: 8)), today),
      _ct('PT016', TransactionType.expense, 5000000, 'Nhập hàng', 'Nhập phụ kiện từ An Phát', today.add(const Duration(hours: 14)), today),
      _ct('PT017', TransactionType.income, 2000000, 'Thu lãi cầm đồ', 'Thu lãi HĐ HDxxx - KH Sơn', today.add(const Duration(hours: 15)), today),
    ];
    await isar.writeTxn(() async => await isar.pawnCashTransactions.putAll(txns));
  }

  static PawnCashTransaction _ct(
    String code, TransactionType type, double amount,
    String category, String desc, DateTime createdAt, DateTime refDate,
  ) {
    return PawnCashTransaction()
      ..documentCode = code
      ..type = type
      ..amount = amount
      ..category = category
      ..description = desc
      ..createdBy = 'Chủ cửa hàng'
      ..createdAt = createdAt;
  }

  static Future<void> _seedRepairOrders(Isar isar) async {
    final customers = await isar.customers.where().findAll();
    if (customers.isEmpty) return;

    final orders = <PawnRepairOrder>[
      _ro('SC001', customers[0], 'iPhone 15 Pro Max', '35GKJ12345', 'Màn hình bị vỡ góc trái', 'Nguyễn Kỹ thuật', 2500000, 2000000, RepairStatus.delivered, _daysAgo(10), _daysAgo(7), _daysAgo(5)),
      _ro('SC002', customers[3], 'Samsung Galaxy S24', 'R5CX12345', 'Pin chai, cần thay', 'Trần Kỹ thuật', 800000, 750000, RepairStatus.delivered, _daysAgo(8), _daysAgo(6), _daysAgo(4)),
      _ro('SC003', customers[6], 'MacBook Air M2', 'C02X54321', 'Bàn phím bị liệt 3 phím', 'Nguyễn Kỹ thuật', 3000000, 0, RepairStatus.inProgress, _daysAgo(5), _daysAgo(3), null),
      _ro('SC004', customers[1], 'iPhone 14 Pro', '35GKJ56789', 'Camera sau không lấy nét', 'Trần Kỹ thuật', 1800000, 0, RepairStatus.inProgress, _daysAgo(3), null, null),
      _ro('SC005', customers[9], 'iPad Air 5', 'DLX54321', 'Màn hình giật, lỗi cảm ứng', 'Nguyễn Kỹ thuật', 1500000, 0, RepairStatus.received, _daysAgo(2), null, null),
      _ro('SC006', customers[10], 'Dell XPS 15', 'DELL12345', 'Quạt tản nhiệt kêu to', 'Trần Kỹ thuật', 600000, 0, RepairStatus.received, _daysAgo(1), null, null),
    ];
    await isar.writeTxn(() async {
      for (final o in orders) {
        await isar.pawnRepairOrders.put(o);
        await o.customer.save();
      }
    });
  }

  static PawnRepairOrder _ro(
    String code, Customer customer, String model, String imei,
    String fault, String tech, double estimated, double actual,
    RepairStatus status, DateTime received, DateTime? completed, DateTime? delivered,
  ) {
    return PawnRepairOrder()
      ..orderCode = code
      ..customer.value = customer
      ..deviceModel = model
      ..imei = imei
      ..faultDescription = fault
      ..technicianName = tech
      ..estimatedCost = estimated
      ..actualCost = actual
      ..status = status
      ..receivedDate = received
      ..completedDate = completed
      ..deliveredDate = delivered
      ..createdAt = received
      ..updatedAt = delivered ?? completed ?? received;
  }
}
