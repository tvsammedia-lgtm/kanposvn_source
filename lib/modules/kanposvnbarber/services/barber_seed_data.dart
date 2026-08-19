import 'package:isar/isar.dart';
import '../models/barber_customer.dart';
import '../models/barber_service.dart';
import '../models/barber_employee.dart';
import '../models/barber_product.dart';
import '../models/barber_appointment.dart';
import '../models/barber_invoice.dart';
import '../models/barber_invoice_detail.dart';
import '../models/barber_hair_style.dart';
import '../models/barber_expense.dart';
import '../models/barber_inventory_transaction.dart';
import '../models/barber_supplier.dart';

class BarberSeedData {
  static DateTime _daysAgo(int d) => DateTime.now().subtract(Duration(days: d));

  static Future<void> seedIfEmpty(Isar isar) async {
    final count = await isar.barberServices.count();
    if (count > 0) return;

    await _seedServices(isar);
    await _seedEmployees(isar);
    await _seedCustomers(isar);
    await _seedHairStyles(isar);
    await _seedProducts(isar);
    await _seedSuppliers(isar);
    await _seedAppointments(isar);
    await _seedInvoices(isar);
    await _seedExpenses(isar);
    await _seedInventoryTransactions(isar);
  }

  static Future<void> _seedServices(Isar isar) async {
    final services = [
      _s('SRV001', 'Cắt tóc nam', 80000, 30, 10, false),
      _s('SRV002', 'Cắt tóc nữ', 120000, 45, 10, false),
      _s('SRV003', 'Gội đầu massage', 60000, 20, 5, false),
      _s('SRV004', 'Cạo mặt', 50000, 15, 10, false),
      _s('SRV005', 'Uốn tóc nam', 300000, 90, 15, false),
      _s('SRV006', 'Duỗi tóc nữ', 400000, 120, 15, false),
      _s('SRV007', 'Nhuộm tóc', 350000, 100, 15, false),
      _s('SRV008', 'Phục hồi tóc Keratin', 500000, 90, 20, false),
      _s('SRV009', 'Wax tạo kiểu', 80000, 20, 10, false),
      _s('SRV010', 'Massage đầu cổ vai', 100000, 30, 10, false),
      _s('SRV011', 'Nhuộm highlight', 450000, 120, 20, false),
      _s('SRV012', 'Tẩy tóc', 250000, 60, 15, false),
      _s('SRV013', 'Uốn Hàn Quốc', 350000, 90, 15, false),
      _s('SRV014', 'Cắt + Gội combo', 120000, 40, 10, false),
      _s('SRV015', 'Treatment tóc', 200000, 45, 15, false),
    ];
    await isar.writeTxn(() async => await isar.barberServices.putAll(services));
  }

  static BarberService _s(String id, String name, double price, int dur, double comm, bool fixed) {
    return BarberService()
      ..serviceId = id
      ..name = name
      ..price = price
      ..durationMinutes = dur
      ..commissionRate = comm
      ..isFixedCommission = fixed
      ..createdAt = DateTime.now();
  }

  static Future<void> _seedEmployees(Isar isar) async {
    final employees = [
      _e('EMP001', 'Nguyễn Văn Hùng', 'Barber', '0901234567', 5000000, 4.8, 156),
      _e('EMP002', 'Trần Minh Tuấn', 'Barber', '0912345678', 5000000, 4.9, 189),
      _e('EMP003', 'Lê Hoàng Long', 'Barber', '0923456789', 4500000, 4.7, 134),
      _e('EMP004', 'Phạm Thanh Nam', 'Barber', '0934567890', 4500000, 4.6, 98),
      _e('EMP005', 'Hoàng Thị Mai', 'Quản lý', '0945678901', 7000000, 5.0, 0),
      _e('EMP006', 'Ngô Văn Bình', 'Thu ngân', '0956789012', 4000000, 4.5, 0),
    ];
    await isar.writeTxn(() async => await isar.barberEmployees.putAll(employees));
  }

  static BarberEmployee _e(String id, String name, String role, String phone, double salary, double rating, int customers) {
    return BarberEmployee()
      ..employeeId = id
      ..name = name
      ..role = role
      ..phone = phone
      ..basicSalary = salary
      ..rating = rating
      ..customerCount = customers
      ..totalRevenue = customers * 120000.0
      ..commissionEarned = customers * 12000.0
      ..createdAt = DateTime.now();
  }

  static Future<void> _seedCustomers(Isar isar) async {
    final customers = [
      _c('CUST001', 'Nguyễn Văn An', '0911111111', 'M', _daysAgo(3650), 850000, 12),
      _c('CUST002', 'Trần Thị Bích', '0922222222', 'F', _daysAgo(3200), 1200000, 18),
      _c('CUST003', 'Lê Minh Cường', '0933333333', 'M', _daysAgo(2800), 680000, 8),
      _c('CUST004', 'Phạm Thu Hương', '0944444444', 'F', _daysAgo(2500), 2100000, 25),
      _c('CUST005', 'Hoàng Văn Đức', '0955555555', 'M', _daysAgo(2000), 450000, 5),
      _c('CUST006', 'Ngô Thị Mai', '0966666666', 'F', _daysAgo(1800), 1600000, 20),
      _c('CUST007', 'Đỗ Quang Huy', '0977777777', 'M', _daysAgo(1500), 320000, 4),
      _c('CUST008', 'Bùi Thanh Loan', '0988888888', 'F', _daysAgo(1200), 980000, 14),
      _c('CUST009', 'Vũ Ngọc Sơn', '0999999999', 'M', _daysAgo(900), 220000, 3),
      _c('CUST010', 'Đặng Thị Lan', '0910101010', 'F', _daysAgo(600), 1450000, 19),
      _c('CUST011', 'Mai Đình Thắng', '0920202020', 'M', _daysAgo(300), 560000, 7),
      _c('CUST012', 'Lý Thị Hoa', '0930303030', 'F', _daysAgo(150), 380000, 5),
    ];
    await isar.writeTxn(() async => await isar.barberCustomers.putAll(customers));
  }

  static BarberCustomer _c(String id, String name, String phone, String gender, DateTime dob, double spent, int visits) {
    return BarberCustomer()
      ..customerId = id
      ..name = name
      ..phone = phone
      ..gender = gender
      ..dob = dob
      ..totalSpent = spent
      ..rewardPoints = (spent / 100000).round()
      ..lastVisit = _daysAgo(visits > 5 ? 2 : visits)
      ..createdAt = DateTime.now();
  }

  static Future<void> _seedHairStyles(Isar isar) async {
    final styles = [
      _hs('HS001', 'Buzz Cut', ['Mặt tròn', 'Mặt vuông'], ['Tóc mỏng', 'Tóc dày']),
      _hs('HS002', 'Crew Cut', ['Mặt oval', 'Mặt dài'], ['Tóc dày']),
      _hs('HS003', 'Undercut', ['Mặt oval', 'Mặt vuông', 'Mặt trái tim'], ['Tóc dày']),
      _hs('HS004', 'Pompadour', ['Mặt oval', 'Mặt dài'], ['Tóc dày', 'Tóc xoăn nhẹ']),
      _hs('HS005', 'Side Part', ['Mặt oval', 'Mặt tròn', 'Mặt vuông'], ['Tóc dày', 'Tóc mỏng']),
      _hs('HS006', 'Mohican', ['Mặt vuông', 'Mặt trái tim'], ['Tóc dày']),
      _hs('HS007', 'Layer', ['Mặt oval', 'Mặt dài', 'Mặt tròn'], ['Tóc dày', 'Tóc mỏng']),
      _hs('HS008', 'Two Block', ['Mặt oval', 'Mặt tròn'], ['Tóc dày']),
      _hs('HS009', 'Wolf Cut', ['Mặt oval', 'Mặt trái tim'], ['Tóc xoăn nhẹ', 'Tóc dày']),
      _hs('HS010', 'Mullet', ['Mặt vuông', 'Mặt dài'], ['Tóc dày']),
      _hs('HS011', 'French Crop', ['Mặt tròn', 'Mặt vuông'], ['Tóc mỏng', 'Tóc dày']),
      _hs('HS012', 'Fade', ['Mặt oval', 'Mặt vuông', 'Mặt tròn'], ['Tóc dày']),
      _hs('HS013', 'Quiff', ['Mặt oval', 'Mặt dài'], ['Tóc dày']),
    ];
    await isar.writeTxn(() async => await isar.barberHairStyles.putAll(styles));
  }

  static BarberHairStyle _hs(String id, String name, List<String> faces, List<String> hairs) {
    return BarberHairStyle()
      ..styleId = id
      ..name = name
      ..faceShapes = faces
      ..hairTypes = hairs
      ..createdAt = DateTime.now();
  }

  static Future<void> _seedProducts(Isar isar) async {
    final products = [
      _p('PRD001', 'Sáp vuốt tóc Volcanic', 'Wax', 150000, 320000, 15, 5),
      _p('PRD002', 'Dầu gội Clear Men', 'Shampoo', 45000, 85000, 30, 10),
      _p('PRD003', 'Thuốc nhuộm LOréal đen', 'Color', 80000, 180000, 8, 3),
      _p('PRD004', 'Thuốc nhuộm LOréal nâu', 'Color', 80000, 180000, 6, 3),
      _p('PRD005', 'Gel tạo kiểu Gatsby', 'Gel', 55000, 110000, 20, 8),
      _p('PRD006', 'Kem uốn Sedal', 'Chemical', 65000, 150000, 10, 4),
      _p('PRD007', 'Dầu dưỡng tóc Argan Oil', 'Treatment', 120000, 250000, 12, 5),
      _p('PRD008', 'Lược chải tóc được', 'Tools', 30000, 65000, 25, 10),
      _p('PRD009', 'Kéo cắt tóc Kamsa', 'Tools', 250000, 500000, 5, 2),
      _p('PRD010', 'Khăn bông 30x30', 'Accessories', 15000, 35000, 100, 30),
      _p('PRD011', 'Xịt giữ nếp Salon Pro', 'Spray', 75000, 160000, 18, 6),
      _p('PRD012', 'Nước oxy MLM 9%', 'Color', 35000, 70000, 25, 8),
      _p('PRD013', 'Bột tẩy tóc Blondep', 'Color', 40000, 90000, 20, 6),
      _p('PRD014', 'Dầu xả Pantene', 'Shampoo', 50000, 95000, 22, 8),
      _p('PRD015', 'Máy sấy tóc Panasonic', 'Equipment', 350000, 650000, 3, 1),
    ];
    await isar.writeTxn(() async => await isar.barberProducts.putAll(products));
  }

  static BarberProduct _p(String id, String name, String cat, double cost, double sell, int stock, int min) {
    return BarberProduct()
      ..productId = id
      ..name = name
      ..category = cat
      ..purchasePrice = cost
      ..sellingPrice = sell
      ..stock = stock
      ..minimumStock = min
      ..createdAt = DateTime.now();
  }

  static Future<void> _seedSuppliers(Isar isar) async {
    final suppliers = [
      _sup('SUP001', 'Phú Beauty Supply', '0901112222', 1500000, 25000000),
      _sup('SUP002', 'Minh Tâm Cosmetics', '0912223333', 800000, 18000000),
      _sup('SUP003', 'Hòa Phát Tools', '0923334444', 0, 12000000),
    ];
    await isar.writeTxn(() async => await isar.barberSuppliers.putAll(suppliers));
  }

  static BarberSupplier _sup(String id, String name, String phone, double debt, double total) {
    return BarberSupplier()
      ..supplierId = id
      ..name = name
      ..phone = phone
      ..currentDebt = debt
      ..totalPurchase = total
      ..createdAt = DateTime.now();
  }

  static Future<void> _seedAppointments(Isar isar) async {
    final now = DateTime.now();
    final appointments = [
      _apt('APT001', 'CUST001', 'Nguyễn Văn An', 'EMP001', 'Nguyễn Văn Hùng', now, '09:00', 'Hoàn thành', ['SRV001']),
      _apt('APT002', 'CUST002', 'Trần Thị Bích', 'EMP002', 'Trần Minh Tuấn', now, '09:30', 'Hoàn thành', ['SRV002', 'SRV007']),
      _apt('APT003', 'CUST003', 'Lê Minh Cường', 'EMP001', 'Nguyễn Văn Hùng', now, '10:00', 'Hoàn thành', ['SRV001']),
      _apt('APT004', 'CUST004', 'Phạm Thu Hương', 'EMP003', 'Lê Hoàng Long', now, '10:30', 'Hoàn thành', ['SRV007', 'SRV015']),
      _apt('APT005', 'CUST005', 'Hoàng Văn Đức', 'EMP002', 'Trần Minh Tuấn', now, '11:00', 'Hoàn thành', ['SRV001', 'SRV009']),
      _apt('APT006', 'CUST006', 'Ngô Thị Mai', 'EMP004', 'Phạm Thanh Nam', now, '11:30', 'Hoàn thành', ['SRV002']),
      _apt('APT007', 'CUST007', 'Đỗ Quang Huy', 'EMP001', 'Nguyễn Văn Hùng', now, '13:00', 'Hoàn thành', ['SRV001']),
      _apt('APT008', 'CUST008', 'Bùi Thanh Loan', 'EMP003', 'Lê Hoàng Long', now, '13:30', 'Đang phục vụ', ['SRV002', 'SRV011']),
      _apt('APT009', 'CUST009', 'Vũ Ngọc Sơn', 'EMP002', 'Trần Minh Tuấn', now, '14:00', 'Đã xác nhận', ['SRV001']),
      _apt('APT010', 'CUST010', 'Đặng Thị Lan', 'EMP001', 'Nguyễn Văn Hùng', now, '14:30', 'Đã xác nhận', ['SRV002', 'SRV005']),
      _apt('APT011', 'CUST011', 'Mai Đình Thắng', 'EMP004', 'Phạm Thanh Nam', now, '15:00', 'Chờ xác nhận', ['SRV001']),
      _apt('APT012', 'CUST012', 'Lý Thị Hoa', 'EMP003', 'Lê Hoàng Long', now, '15:30', 'Chờ xác nhận', ['SRV002']),
      // Past appointments
      _apt('APT013', 'CUST001', 'Nguyễn Văn An', 'EMP002', 'Trần Minh Tuấn', _daysAgo(3), '10:00', 'Hoàn thành', ['SRV001']),
      _apt('APT014', 'CUST004', 'Phạm Thu Hương', 'EMP001', 'Nguyễn Văn Hùng', _daysAgo(5), '14:00', 'Hoàn thành', ['SRV007']),
      _apt('APT015', 'CUST006', 'Ngô Thị Mai', 'EMP003', 'Lê Hoàng Long', _daysAgo(7), '09:30', 'Hoàn thành', ['SRV002', 'SRV010']),
    ];
    await isar.writeTxn(() async => await isar.barberAppointments.putAll(appointments));
  }

  static BarberAppointment _apt(String id, String custId, String custName, String empId, String empName, DateTime date, String time, String status, List<String> services) {
    return BarberAppointment()
      ..appointmentId = id
      ..customerId = custId
      ..customerName = custName
      ..employeeId = empId
      ..employeeName = empName
      ..appointmentDate = date
      ..appointmentTime = time
      ..status = status
      ..serviceIds = services
      ..createdAt = DateTime.now();
  }

  static Future<void> _seedInvoices(Isar isar) async {
    final invoices = <BarberInvoice>[
      // Today's invoices
      _inv('INV001', 'CUST001', 'Nguyễn Văn An', 'APT001', 80000, 0, 80000, 'Tiền mặt', 'Đã thanh toán', _daysAgo(0)),
      _inv('INV002', 'CUST002', 'Trần Thị Bích', 'APT002', 470000, 20000, 450000, 'QR Code', 'Đã thanh toán', _daysAgo(0)),
      _inv('INV003', 'CUST003', 'Lê Minh Cường', 'APT003', 80000, 0, 80000, 'Tiền mặt', 'Đã thanh toán', _daysAgo(0)),
      _inv('INV004', 'CUST004', 'Phạm Thu Hương', 'APT004', 550000, 50000, 500000, 'Chuyển khoản', 'Đã thanh toán', _daysAgo(0)),
      _inv('INV005', 'CUST005', 'Hoàng Văn Đức', 'APT005', 160000, 0, 160000, 'Tiền mặt', 'Đã thanh toán', _daysAgo(0)),
      _inv('INV006', 'CUST006', 'Ngô Thị Mai', 'APT006', 120000, 0, 120000, 'Ví điện tử', 'Đã thanh toán', _daysAgo(0)),
      _inv('INV007', 'CUST007', 'Đỗ Quang Huy', 'APT007', 80000, 0, 80000, 'Tiền mặt', 'Đã thanh toán', _daysAgo(0)),
      // Past invoices
      _inv('INV008', 'CUST001', 'Nguyễn Văn An', 'APT013', 80000, 0, 80000, 'Tiền mặt', 'Đã thanh toán', _daysAgo(3)),
      _inv('INV009', 'CUST004', 'Phạm Thu Hương', 'APT014', 350000, 0, 350000, 'QR Code', 'Đã thanh toán', _daysAgo(5)),
      _inv('INV010', 'CUST006', 'Ngô Thị Mai', 'APT015', 160000, 10000, 150000, 'Tiền mặt', 'Đã thanh toán', _daysAgo(7)),
      // Product sales
      _inv('INV011', null, 'Khách lẻ', null, 320000, 0, 320000, 'Tiền mặt', 'Đã thanh toán', _daysAgo(2)),
      _inv('INV012', 'CUST008', 'Bùi Thanh Loan', null, 250000, 0, 250000, 'Chuyển khoản', 'Đã thanh toán', _daysAgo(4)),
    ];
    await isar.writeTxn(() async => await isar.barberInvoices.putAll(invoices));

    // Invoice details
    final details = [
      _idt('INV001', 'SRV001', 'Cắt tóc nam', 'Service', 'EMP001', 1, 80000),
      _idt('INV002', 'SRV002', 'Cắt tóc nữ', 'Service', 'EMP002', 1, 120000),
      _idt('INV002', 'SRV007', 'Nhuộm tóc', 'Service', 'EMP002', 1, 350000),
      _idt('INV003', 'SRV001', 'Cắt tóc nam', 'Service', 'EMP001', 1, 80000),
      _idt('INV004', 'SRV007', 'Nhuộm tóc', 'Service', 'EMP003', 1, 350000),
      _idt('INV004', 'SRV015', 'Treatment tóc', 'Service', 'EMP003', 1, 200000),
      _idt('INV005', 'SRV001', 'Cắt tóc nam', 'Service', 'EMP002', 1, 80000),
      _idt('INV005', 'SRV009', 'Wax tạo kiểu', 'Service', 'EMP002', 1, 80000),
      _idt('INV006', 'SRV002', 'Cắt tóc nữ', 'Service', 'EMP004', 1, 120000),
      _idt('INV007', 'SRV001', 'Cắt tóc nam', 'Service', 'EMP001', 1, 80000),
      _idt('INV008', 'SRV001', 'Cắt tóc nam', 'Service', 'EMP002', 1, 80000),
      _idt('INV009', 'SRV007', 'Nhuộm tóc', 'Service', 'EMP001', 1, 350000),
      _idt('INV010', 'SRV002', 'Cắt tóc nữ', 'Service', 'EMP003', 1, 120000),
      _idt('INV010', 'SRV010', 'Massage đầu cổ vai', 'Service', 'EMP003', 1, 100000),
      _idt('INV011', 'PRD001', 'Sáp vuốt tóc Volcanic', 'Product', null, 1, 320000),
      _idt('INV012', 'PRD009', 'Kéo cắt tóc Kamsa', 'Product', null, 1, 500000),
    ];
    await isar.writeTxn(() async => await isar.barberInvoiceDetails.putAll(details));
  }

  static BarberInvoice _inv(String id, String? custId, String? custName, String? aptId, double sub, double disc, double total, String method, String status, DateTime date) {
    return BarberInvoice()
      ..invoiceId = id
      ..customerId = custId
      ..customerName = custName
      ..appointmentId = aptId
      ..subTotal = sub
      ..discount = disc
      ..total = total
      ..paymentMethod = method
      ..status = status
      ..createdAt = date;
  }

  static BarberInvoiceDetail _idt(String invId, String itemId, String itemName, String type, String? empId, double qty, double price) {
    return BarberInvoiceDetail()
      ..invoiceId = invId
      ..itemId = itemId
      ..itemName = itemName
      ..itemType = type
      ..employeeId = empId
      ..quantity = qty
      ..unitPrice = price
      ..total = qty * price
      ..createdAt = DateTime.now();
  }

  static Future<void> _seedExpenses(Isar isar) async {
    final expenses = [
      _exp('EXP001', 'Thuê mặt bằng', 'Tiền thuê tháng 8', 8000000, _daysAgo(5)),
      _exp('EXP002', 'Điện', 'Tiền điện tháng 7', 1200000, _daysAgo(10)),
      _exp('EXP003', 'Nước', 'Tiền nước tháng 7', 400000, _daysAgo(10)),
      _exp('EXP004', 'Internet', 'Internet Viettel', 350000, _daysAgo(8)),
      _exp('EXP005', 'Marketing', 'Facebook Ads tháng 8', 2000000, _daysAgo(3)),
      _exp('EXP006', 'Lương', 'Lương NV tháng 7 - Hùng', 5000000, _daysAgo(15)),
      _exp('EXP007', 'Lương', 'Lương NV tháng 7 - Tuấn', 5000000, _daysAgo(15)),
      _exp('EXP008', 'Mỹ phẩm', 'Nhập sáp + gel từ Phú Beauty', 2500000, _daysAgo(7)),
      _exp('EXP009', 'Thiết bị', 'Máy sấy mới Panasonic', 650000, _daysAgo(20)),
      _exp('EXP010', 'Mỹ phẩm', 'Nhập thuốc nhuộm LOréal', 1600000, _daysAgo(12)),
    ];
    await isar.writeTxn(() async => await isar.barberExpenses.putAll(expenses));
  }

  static BarberExpense _exp(String id, String cat, String desc, double amount, DateTime date) {
    return BarberExpense()
      ..expenseId = id
      ..category = cat
      ..description = desc
      ..amount = amount
      ..createdAt = date;
  }

  static Future<void> _seedInventoryTransactions(Isar isar) async {
    final txns = [
      _itx('ITX001', 'IMPORT', 'PRD001', 'Sáp vuốt tóc Volcanic', 20, 150000, 'Nhập kho từ Phú Beauty'),
      _itx('ITX002', 'IMPORT', 'PRD002', 'Dầu gội Clear Men', 30, 45000, 'Nhập kho từ Minh Tâm'),
      _itx('ITX003', 'EXPORT', 'PRD001', 'Sáp vuốt tóc Volcanic', 5, 150000, 'Bán cho khách'),
      _itx('ITX004', 'EXPORT', 'PRD003', 'Thuốc nhuộm LOréal đen', 3, 80000, 'Sử dụng dịch vụ nhuộm'),
      _itx('ITX005', 'IMPORT', 'PRD005', 'Gel tạo kiểu Gatsby', 15, 55000, 'Nhập kho'),
      _itx('ITX006', 'EXPORT', 'PRD010', 'Khăn bông 30x30', 50, 15000, 'Sử dụng hàng ngày'),
      _itx('ITX007', 'IMPORT', 'PRD007', 'Dầu dưỡng tóc Argan Oil', 10, 120000, 'Nhập từ Minh Tâm'),
      _itx('ITX008', 'EXPORT', 'PRD009', 'Kéo cắt tóc Kamsa', 1, 250000, 'Bán cho khách'),
    ];
    await isar.writeTxn(() async => await isar.barberInventoryTransactions.putAll(txns));
  }

  static BarberInventoryTransaction _itx(String id, String type, String productId, String productName, int qty, double cost, String reason) {
    return BarberInventoryTransaction()
      ..transactionId = id
      ..type = type
      ..productId = productId
      ..productName = productName
      ..quantity = qty
      ..unitCost = cost
      ..totalCost = qty * cost
      ..reason = reason
      ..createdAt = DateTime.now();
  }
}
