import 'gara_isar_service.dart';
import '../models/gara_product.dart';
import '../models/gara_customer.dart';
import '../models/gara_vehicle.dart';
import '../models/gara_supplier.dart';
import '../models/gara_repair_order.dart';
import '../models/gara_inventory.dart';
import '../models/gara_finance.dart';

class GaraSeedData {
  static Future<void> seedIfEmpty(GaraIsarService service) async {
    final db = await service.db;
    final count = await db.garaProducts.count();
    if (count > 0) return;

    final now = DateTime.now();

    // ── Phase 1: Independent entities ──────────────────────────

    // ── Products (10 parts + 10 services) ──────────────────────
    final products = <GaraProduct>[
      // PARTS
      GaraProduct()..productId = 'PT-NHOT01'..sku = 'PT-NHOT01'..name = 'Nhớt Castrol Magnatec 10W-40'..type = GaraProductType.PART..retailPrice = 120000..purchasePrice = 90000..unit = 'Chai'..currentStock = 50,
      GaraProduct()..productId = 'PT-NHOT02'..sku = 'PT-NHOT02'..name = 'Nhớt Shell Helix HX7 10W-40'..type = GaraProductType.PART..retailPrice = 140000..purchasePrice = 105000..unit = 'Chai'..currentStock = 40,
      GaraProduct()..productId = 'PT-BOGI01'..sku = 'PT-BOGI01'..name = 'Bugi Bosch铱金'..type = GaraProductType.PART..retailPrice = 80000..purchasePrice = 50000..unit = 'Cái'..currentStock = 100,
      GaraProduct()..productId = 'PT-BOGI02'..sku = 'PT-BOGI02'..name = 'Bugi Denso Iridium'..type = GaraProductType.PART..retailPrice = 90000..purchasePrice = 60000..unit = 'Cái'..currentStock = 80,
      GaraProduct()..productId = 'PT-LOC01'..sku = 'PT-LOC01'..name = 'Lọc nhớt Fram PH2815'..type = GaraProductType.PART..retailPrice = 60000..purchasePrice = 35000..unit = 'Cái'..currentStock = 60,
      GaraProduct()..productId = 'PT-LOCGIO1'..sku = 'PT-LOCGIO1'..name = 'Lọc gió Denso'..type = GaraProductType.PART..retailPrice = 150000..purchasePrice = 90000..unit = 'Cái'..currentStock = 30,
      GaraProduct()..productId = 'PT-ACQUY1'..sku = 'PT-ACQUY1'..name = 'Ắc quy GS MF40'..type = GaraProductType.PART..retailPrice = 900000..purchasePrice = 650000..unit = 'Cái'..currentStock = 10,
      GaraProduct()..productId = 'PT-LO1'..sku = 'PT-LO1'..name = 'Lốp Michelin 195/55R16'..type = GaraProductType.PART..retailPrice = 1200000..purchasePrice = 900000..unit = 'Cái'..currentStock = 12,
      GaraProduct()..productId = 'PT-MAPHAN1'..sku = 'PT-MAPHAN1'..name = 'Má phanh Timeceramik'..type = GaraProductType.PART..retailPrice = 450000..purchasePrice = 280000..unit = 'Bộ'..currentStock = 20,
      GaraProduct()..productId = 'PT-CUROA1'..sku = 'PT-CUROA1'..name = 'Dây curoa Gates'..type = GaraProductType.PART..retailPrice = 180000..purchasePrice = 110000..unit = 'Cái'..currentStock = 25,
      // SERVICES
      GaraProduct()..productId = 'SV-RUAXE'..sku = 'SV-RUAXE'..name = 'Rửa xe bọt tuyết'..type = GaraProductType.SERVICE..retailPrice = 50000..unit = 'Lần',
      GaraProduct()..productId = 'SV-THAYNHOT'..sku = 'SV-THAYNHOT'..name = 'Công thay nhớt'..type = GaraProductType.SERVICE..retailPrice = 50000..unit = 'Lần',
      GaraProduct()..productId = 'SV-THAYBOGI'..sku = 'SV-THAYBOGI'..name = 'Công thay bugi'..type = GaraProductType.SERVICE..retailPrice = 30000..unit = 'Lần',
      GaraProduct()..productId = 'SV-THAYLOC'..sku = 'SV-THAYLOC'..name = 'Công thay lọc gió'..type = GaraProductType.SERVICE..retailPrice = 30000..unit = 'Lần',
      GaraProduct()..productId = 'SV-BAODUONG'..sku = 'SV-BAODUONG'..name = 'Bảo dưỡng định kỳ'..type = GaraProductType.SERVICE..retailPrice = 200000..unit = 'Lần',
      GaraProduct()..productId = 'SV-VAPHAN'..sku = 'SV-VAPHAN'..name = 'Vá lốp'..type = GaraProductType.SERVICE..retailPrice = 80000..unit = 'Lần',
      GaraProduct()..productId = 'SV-DONGSON'..sku = 'SV-DONGSON'..name = 'Đồng sơn xe'..type = GaraProductType.SERVICE..retailPrice = 2000000..unit = 'Xe',
      GaraProduct()..productId = 'SV-DOTDONGCO'..sku = 'SV-DOTDONGCO'..name = 'Đại tu động cơ'..type = GaraProductType.SERVICE..retailPrice = 5000000..unit = 'Xe',
      GaraProduct()..productId = 'SV-KIEMTRA'..sku = 'SV-KIEMTRA'..name = 'Kiểm tra tổng quát'..type = GaraProductType.SERVICE..retailPrice = 100000..unit = 'Lần',
      GaraProduct()..productId = 'SV-THAYACQUY'..sku = 'SV-THAYACQUY'..name = 'Công thay ắc quy'..type = GaraProductType.SERVICE..retailPrice = 50000..unit = 'Lần',
    ];
    await db.writeTxn(() async {
      await db.garaProducts.putAll(products);
    });

    // ── Customers ──────────────────────────────────────────────
    final customers = <GaraCustomer>[
      GaraCustomer()..customerId = 'KH-001'..name = 'Nguyễn Văn An'..phone = '0901234567'..address = '123 Lê Lợi, Q.1, TP.HCM'..currentDebt = 0,
      GaraCustomer()..customerId = 'KH-002'..name = 'Trần Thị Bình'..phone = '0912345678'..address = '456 Nguyễn Huệ, Q.3, TP.HCM'..currentDebt = 350000,
      GaraCustomer()..customerId = 'KH-003'..name = 'Lê Hoàng Nam'..phone = '0923456789'..address = '789 Hai Bà Trưng, TP.HCM'..currentDebt = 0,
      GaraCustomer()..customerId = 'KH-004'..name = 'Phạm Thị Dung'..phone = '0934567890'..address = '321 Trường Chinh, Q.Tân Bình'..currentDebt = 1200000,
      GaraCustomer()..customerId = 'KH-005'..name = 'Hoàng Văn Em'..phone = '0945678901'..address = '654 Điện Biên Phủ, Q.Bình Thạnh'..currentDebt = 0,
      GaraCustomer()..customerId = 'KH-006'..name = 'Đỗ Thị Giang'..phone = '0956789012'..address = '987 Võ Văn Tần, Q.3'..currentDebt = 280000,
      GaraCustomer()..customerId = 'KH-007'..name = 'Vũ Minh Hoa'..phone = '0967890123'..address = '147 Phan Đình Phùng, Q.Phú Nhuận'..currentDebt = 0,
      GaraCustomer()..customerId = 'KH-008'..name = 'Ngô Thanh Kỳ'..phone = '0978901234'..address = '258 Lý Tự Trọng, Q.1'..currentDebt = 550000,
      GaraCustomer()..customerId = 'KH-009'..name = 'Bùi Văn Lân'..phone = '0989012345'..address = '369 Trần Hưng Đạo, Q.5'..currentDebt = 0,
      GaraCustomer()..customerId = 'KH-010'..name = 'Lý Thị Mai'..phone = '0990123456'..address = '741 Nguyễn Trãi, Q.1'..currentDebt = 0,
    ];
    await db.writeTxn(() async {
      await db.garaCustomers.putAll(customers);
    });

    // ── Suppliers ──────────────────────────────────────────────
    final suppliers = <GaraSupplier>[
      GaraSupplier()..supplierId = 'NCC-001'..name = 'Công ty CP Dầu nhờn Việt Nam'..phone = '02812345678'..address = 'KCN Bình Dương'..currentDebt = 2500000,
      GaraSupplier()..supplierId = 'NCC-002'..name = 'Phụ Tùng Honda Sài Gòn'..phone = '02823456789'..address = '120 Cộng Hòa, Q.Tân Bình'..currentDebt = 800000,
      GaraSupplier()..supplierId = 'NCC-003'..name = 'Lốp Michelin Vietnam'..phone = '02834567890'..address = 'KCN Long An'..currentDebt = 0,
      GaraSupplier()..supplierId = 'NCC-004'..name = 'Ắc quy GS Battery'..phone = '02845678901'..address = 'KCN Đồng Nai'..currentDebt = 1500000,
      GaraSupplier()..supplierId = 'NCC-005'..name = 'Bosch Vietnam'..phone = '02856789012'..address = 'Q.7, TP.HCM'..currentDebt = 0,
    ];
    await db.writeTxn(() async {
      await db.garaSuppliers.putAll(suppliers);
    });

    // ── Vehicles (linked to customers) ─────────────────────────
    final vehicles = <GaraVehicle>[
      GaraVehicle()..vehicleId = 'XE-001'..licensePlate = '51F-12345'..brand = 'Toyota'..modelName = 'Vios'..vin = 'MR05AXXX1234'..engineNumber = '2NZ1234567'..owner.value = customers[0],
      GaraVehicle()..vehicleId = 'XE-002'..licensePlate = '51G-67890'..brand = 'Honda'..modelName = 'SH 150i'..vin = 'RKCXX1234567'..engineNumber = 'K62E1234567'..owner.value = customers[1],
      GaraVehicle()..vehicleId = 'XE-003'..licensePlate = '59X-11111'..brand = 'Toyota'..modelName = 'Camry'..vin = 'MR05BXXX7890'..engineNumber = 'A251234567'..owner.value = customers[2],
      GaraVehicle()..vehicleId = 'XE-004'..licensePlate = '51H-22222'..brand = 'Honda'..modelName = 'City'..vin = 'MRHXX2222222'..engineNumber = 'L15B1234567'..owner.value = customers[3],
      GaraVehicle()..vehicleId = 'XE-005'..licensePlate = '60A-33333'..brand = 'Mazda'..modelName = 'CX-5'..vin = 'JM3KEXXX3333'..engineNumber = 'PY1234567'..owner.value = customers[4],
      GaraVehicle()..vehicleId = 'XE-006'..licensePlate = '51B-44444'..brand = 'Hyundai'..modelName = 'Accent'..vin = 'KMHCTXXX4444'..engineNumber = 'Kappa123456'..owner.value = customers[5],
      GaraVehicle()..vehicleId = 'XE-007'..licensePlate = '59P-55555'..brand = 'Kia'..modelName = 'Morning'..vin = 'KNAXBXXX5555'..engineNumber = 'Kappa567890'..owner.value = customers[6],
      GaraVehicle()..vehicleId = 'XE-008'..licensePlate = '60C-66666'..brand = 'Toyota'..modelName = 'Fortuner'..vin = 'MR05CXXX6666'..engineNumber = '2GD1234567'..owner.value = customers[7],
      GaraVehicle()..vehicleId = 'XE-009'..licensePlate = '51D-77777'..brand = 'Honda'..modelName = 'CR-V'..vin = 'MRHXX7777777'..engineNumber = 'L15C1234567'..owner.value = customers[8],
      GaraVehicle()..vehicleId = 'XE-010'..licensePlate = '60D-88888'..brand = 'Ford'..modelName = 'Ranger'..vin = 'MNAXXXX8888'..engineNumber = 'YLN1234567'..owner.value = customers[9],
    ];
    await db.writeTxn(() async {
      await db.garaVehicles.putAll(vehicles);
      for (final v in vehicles) {
        await v.owner.save();
      }
    });

    // ── Phase 2: Linked entities ───────────────────────────────

    // ── Repair Orders (12 orders across all statuses) ──────────
    final orders = <GaraRepairOrder>[
      // 3 COMPLETED + DELIVERED (paid)
      GaraRepairOrder()..orderId = 'RO-SEED-01'..orderCode = 'RO-1000001'..status = GaraOrderStatus.DELIVERED..orderDate = now.subtract(const Duration(days: 20))..currentKm = 35000..notes = 'Thay nhớt, thay bugi'..totalAmount = 380000..paidAmount = 380000..customer.value = customers[0]..vehicle.value = vehicles[0],
      GaraRepairOrder()..orderId = 'RO-SEED-02'..orderCode = 'RO-1000002'..status = GaraOrderStatus.DELIVERED..orderDate = now.subtract(const Duration(days: 15))..currentKm = 12000..notes = 'Bảo dưỡng định kỳ'..totalAmount = 420000..paidAmount = 420000..customer.value = customers[1]..vehicle.value = vehicles[1],
      GaraRepairOrder()..orderId = 'RO-SEED-03'..orderCode = 'RO-1000003'..status = GaraOrderStatus.DELIVERED..orderDate = now.subtract(const Duration(days: 10))..currentKm = 45000..notes = 'Vá lốp + thay má phanh'..totalAmount = 980000..paidAmount = 980000..customer.value = customers[2]..vehicle.value = vehicles[2],
      // 2 COMPLETED (not yet delivered)
      GaraRepairOrder()..orderId = 'RO-SEED-04'..orderCode = 'RO-1000004'..status = GaraOrderStatus.COMPLETED..orderDate = now.subtract(const Duration(days: 3))..currentKm = 28000..notes = 'Thay lọc gió, thay nhớt'..totalAmount = 350000..paidAmount = 200000..customer.value = customers[3]..vehicle.value = vehicles[3],
      GaraRepairOrder()..orderId = 'RO-SEED-05'..orderCode = 'RO-1000005'..status = GaraOrderStatus.COMPLETED..orderDate = now.subtract(const Duration(days: 1))..currentKm = 50000..notes = 'Thay ắc quy, kiểm tra tổng quát'..totalAmount = 1050000..paidAmount = 1050000..customer.value = customers[4]..vehicle.value = vehicles[4],
      // 3 IN_PROGRESS
      GaraRepairOrder()..orderId = 'RO-SEED-06'..orderCode = 'RO-1000006'..status = GaraOrderStatus.IN_PROGRESS..orderDate = now.subtract(const Duration(days: 2))..currentKm = 67000..notes = 'Đồng sơn toàn xe'..totalAmount = 2000000..paidAmount = 500000..customer.value = customers[5]..vehicle.value = vehicles[5],
      GaraRepairOrder()..orderId = 'RO-SEED-07'..orderCode = 'RO-1000007'..status = GaraOrderStatus.IN_PROGRESS..orderDate = now.subtract(const Duration(days: 1))..currentKm = 82000..notes = 'Đại tu động cơ'..totalAmount = 5000000..paidAmount = 2000000..customer.value = customers[6]..vehicle.value = vehicles[6],
      GaraRepairOrder()..orderId = 'RO-SEED-08'..orderCode = 'RO-1000008'..status = GaraOrderStatus.IN_PROGRESS..orderDate = now.subtract(const Duration(hours: 8))..currentKm = 15000..notes = 'Thay lốp, thay curoa'..totalAmount = 1500000..paidAmount = 0..customer.value = customers[7]..vehicle.value = vehicles[7],
      // 4 RECEPTION (waiting)
      GaraRepairOrder()..orderId = 'RO-SEED-09'..orderCode = 'RO-1000009'..status = GaraOrderStatus.RECEPTION..orderDate = now.subtract(const Duration(hours: 6))..currentKm = 42000..notes = 'Thay nhớt + lọc nhớt'..customer.value = customers[8]..vehicle.value = vehicles[8],
      GaraRepairOrder()..orderId = 'RO-SEED-10'..orderCode = 'RO-1000010'..status = GaraOrderStatus.RECEPTION..orderDate = now.subtract(const Duration(hours: 4))..currentKm = 20000..notes = 'Kiểm tra phanh'..customer.value = customers[9]..vehicle.value = vehicles[9],
      GaraRepairOrder()..orderId = 'RO-SEED-11'..orderCode = 'RO-1000011'..status = GaraOrderStatus.RECEPTION..orderDate = now.subtract(const Duration(hours: 2))..currentKm = 55000..notes = 'Rửa xe + vệ sinh nội thất'..customer.value = customers[0]..vehicle.value = vehicles[4],
      GaraRepairOrder()..orderId = 'RO-SEED-12'..orderCode = 'RO-1000012'..status = GaraOrderStatus.RECEPTION..orderDate = now.subtract(const Duration(hours: 1))..currentKm = 30000..notes = 'Bảo dưỡng định kỳ'..customer.value = customers[3]..vehicle.value = vehicles[9],
    ];
    await db.writeTxn(() async {
      await db.garaRepairOrders.putAll(orders);
      for (final o in orders) {
        await o.customer.save();
        await o.vehicle.save();
      }
    });

    // ── Repair Details (for completed/delivered orders) ────────
    final detailSets = <int, List<GaraRepairDetail>>{
      0: [ // RO-01: thay nhớt + bugi
        GaraRepairDetail()..quantity = 1..unitPrice = 120000..total = 120000..product.value = products[0]..order.value = orders[0],
        GaraRepairDetail()..quantity = 4..unitPrice = 80000..total = 320000..product.value = products[2]..order.value = orders[0],
        GaraRepairDetail()..quantity = 1..unitPrice = 50000..total = 50000..product.value = products[11]..order.value = orders[0],
        GaraRepairDetail()..quantity = 1..unitPrice = 30000..total = 30000..product.value = products[12]..order.value = orders[0],
      ],
      1: [ // RO-02: bảo dưỡng
        GaraRepairDetail()..quantity = 1..unitPrice = 140000..total = 140000..product.value = products[1]..order.value = orders[1],
        GaraRepairDetail()..quantity = 1..unitPrice = 60000..total = 60000..product.value = products[4]..order.value = orders[1],
        GaraRepairDetail()..quantity = 1..unitPrice = 150000..total = 150000..product.value = products[5]..order.value = orders[1],
        GaraRepairDetail()..quantity = 1..unitPrice = 50000..total = 50000..product.value = products[11]..order.value = orders[1],
        GaraRepairDetail()..quantity = 1..unitPrice = 200000..total = 200000..product.value = products[14]..order.value = orders[1],
      ],
      2: [ // RO-03: vá lốp + má phanh
        GaraRepairDetail()..quantity = 2..unitPrice = 80000..total = 160000..product.value = products[15]..order.value = orders[2],
        GaraRepairDetail()..quantity = 1..unitPrice = 450000..total = 450000..product.value = products[8]..order.value = orders[2],
        GaraRepairDetail()..quantity = 1..unitPrice = 80000..total = 80000..product.value = products[16]..order.value = orders[2],
      ],
      3: [ // RO-04: lọc gió + nhớt
        GaraRepairDetail()..quantity = 1..unitPrice = 150000..total = 150000..product.value = products[5]..order.value = orders[3],
        GaraRepairDetail()..quantity = 1..unitPrice = 60000..total = 60000..product.value = products[4]..order.value = orders[3],
        GaraRepairDetail()..quantity = 1..unitPrice = 120000..total = 120000..product.value = products[0]..order.value = orders[3],
        GaraRepairDetail()..quantity = 1..unitPrice = 50000..total = 50000..product.value = products[13]..order.value = orders[3],
      ],
      4: [ // RO-05: ắc quy + kiểm tra
        GaraRepairDetail()..quantity = 1..unitPrice = 900000..total = 900000..product.value = products[6]..order.value = orders[4],
        GaraRepairDetail()..quantity = 1..unitPrice = 100000..total = 100000..product.value = products[18]..order.value = orders[4],
        GaraRepairDetail()..quantity = 1..unitPrice = 50000..total = 50000..product.value = products[19]..order.value = orders[4],
      ],
      5: [ // RO-06: đồng sơn
        GaraRepairDetail()..quantity = 1..unitPrice = 2000000..total = 2000000..product.value = products[16]..order.value = orders[5],
      ],
      6: [ // RO-07: đại tu động cơ
        GaraRepairDetail()..quantity = 1..unitPrice = 5000000..total = 5000000..product.value = products[17]..order.value = orders[6],
      ],
      7: [ // RO-08: lốp + curoa
        GaraRepairDetail()..quantity = 2..unitPrice = 1200000..total = 2400000..product.value = products[7]..order.value = orders[7],
        GaraRepairDetail()..quantity = 1..unitPrice = 180000..total = 180000..product.value = products[9]..order.value = orders[7],
        GaraRepairDetail()..quantity = 1..unitPrice = 80000..total = 80000..product.value = products[15]..order.value = orders[7],
      ],
    };
    await db.writeTxn(() async {
      for (final entry in detailSets.entries) {
        for (final d in entry.value) {
          await db.garaRepairDetails.put(d);
          await d.order.save();
          await d.product.save();
        }
      }
    });

    // ── Inventory Transactions ─────────────────────────────────
    final invTxs = <GaraInventoryTransaction>[
      GaraInventoryTransaction()..transactionId = 'INV-001'..documentCode = 'NK-1000001'..type = GaraInventoryTransactionType.IMPORT..transactionDate = now.subtract(const Duration(days: 25)),
      GaraInventoryTransaction()..transactionId = 'INV-002'..documentCode = 'NK-1000002'..type = GaraInventoryTransactionType.IMPORT..transactionDate = now.subtract(const Duration(days: 20)),
      GaraInventoryTransaction()..transactionId = 'INV-003'..documentCode = 'NK-1000003'..type = GaraInventoryTransactionType.IMPORT..transactionDate = now.subtract(const Duration(days: 15)),
      GaraInventoryTransaction()..transactionId = 'INV-004'..documentCode = 'XK-1000001'..type = GaraInventoryTransactionType.EXPORT..transactionDate = now.subtract(const Duration(days: 20)),
      GaraInventoryTransaction()..transactionId = 'INV-005'..documentCode = 'XK-1000002'..type = GaraInventoryTransactionType.EXPORT..transactionDate = now.subtract(const Duration(days: 15)),
      GaraInventoryTransaction()..transactionId = 'INV-006'..documentCode = 'NK-1000004'..type = GaraInventoryTransactionType.IMPORT..transactionDate = now.subtract(const Duration(days: 10)),
      GaraInventoryTransaction()..transactionId = 'INV-007'..documentCode = 'XK-1000003'..type = GaraInventoryTransactionType.EXPORT..transactionDate = now.subtract(const Duration(days: 3)),
      GaraInventoryTransaction()..transactionId = 'INV-008'..documentCode = 'XK-1000004'..type = GaraInventoryTransactionType.EXPORT..transactionDate = now.subtract(const Duration(days: 1)),
      GaraInventoryTransaction()..transactionId = 'INV-009'..documentCode = 'NK-1000005'..type = GaraInventoryTransactionType.IMPORT..transactionDate = now.subtract(const Duration(hours: 12)),
      GaraInventoryTransaction()..transactionId = 'INV-010'..documentCode = 'XK-1000005'..type = GaraInventoryTransactionType.EXPORT..transactionDate = now.subtract(const Duration(hours: 6)),
    ];
    await db.writeTxn(() async {
      await db.garaInventoryTransactions.putAll(invTxs);
    });

    final invDetails = <GaraInventoryDetail>[
      // NK-01: nhập nhớt Castrol + Shell
      GaraInventoryDetail()..quantity = 50..unitPrice = 90000..totalAmount = 4500000..product.value = products[0]..transaction.value = invTxs[0],
      GaraInventoryDetail()..quantity = 30..unitPrice = 105000..totalAmount = 3150000..product.value = products[1]..transaction.value = invTxs[0],
      // NK-02: nhập bugi + lọc
      GaraInventoryDetail()..quantity = 100..unitPrice = 50000..totalAmount = 5000000..product.value = products[2]..transaction.value = invTxs[1],
      GaraInventoryDetail()..quantity = 60..unitPrice = 35000..totalAmount = 2100000..product.value = products[4]..transaction.value = invTxs[1],
      // NK-03: nhập lốp + ắc quy
      GaraInventoryDetail()..quantity = 12..unitPrice = 900000..totalAmount = 10800000..product.value = products[7]..transaction.value = invTxs[2],
      GaraInventoryDetail()..quantity = 10..unitPrice = 650000..totalAmount = 6500000..product.value = products[6]..transaction.value = invTxs[2],
      // XK-01: xuất nhớt + bugi (cho RO-01)
      GaraInventoryDetail()..quantity = 1..unitPrice = 90000..totalAmount = 90000..product.value = products[0]..transaction.value = invTxs[3],
      GaraInventoryDetail()..quantity = 4..unitPrice = 50000..totalAmount = 200000..product.value = products[2]..transaction.value = invTxs[3],
      // XK-02: xuất nhớt + lọc + gió (cho RO-02)
      GaraInventoryDetail()..quantity = 1..unitPrice = 105000..totalAmount = 105000..product.value = products[1]..transaction.value = invTxs[4],
      GaraInventoryDetail()..quantity = 1..unitPrice = 35000..totalAmount = 35000..product.value = products[4]..transaction.value = invTxs[4],
      // NK-04: nhập má phanh + curoa
      GaraInventoryDetail()..quantity = 20..unitPrice = 280000..totalAmount = 5600000..product.value = products[8]..transaction.value = invTxs[5],
      GaraInventoryDetail()..quantity = 25..unitPrice = 110000..totalAmount = 2750000..product.value = products[9]..transaction.value = invTxs[5],
      // XK-03: xuất má phanh + bugi (cho RO-03)
      GaraInventoryDetail()..quantity = 1..unitPrice = 280000..totalAmount = 280000..product.value = products[8]..transaction.value = invTxs[6],
      // XK-04: xuất lọc gió + nhớt (cho RO-04)
      GaraInventoryDetail()..quantity = 1..unitPrice = 90000..totalAmount = 90000..product.value = products[5]..transaction.value = invTxs[7],
      GaraInventoryDetail()..quantity = 1..unitPrice = 90000..totalAmount = 90000..product.value = products[0]..transaction.value = invTxs[7],
      // NK-05: nhập lốp bổ sung
      GaraInventoryDetail()..quantity = 8..unitPrice = 900000..totalAmount = 7200000..product.value = products[7]..transaction.value = invTxs[8],
      // XK-05: xuất ắc quy (cho RO-05)
      GaraInventoryDetail()..quantity = 1..unitPrice = 650000..totalAmount = 650000..product.value = products[6]..transaction.value = invTxs[9],
    ];
    await db.writeTxn(() async {
      for (final d in invDetails) {
        await db.garaInventoryDetails.put(d);
        await d.product.save();
        await d.transaction.save();
      }
    });

    // ── Finance Transactions ───────────────────────────────────
    final finTxs = <GaraFinanceTransaction>[
      // Receipts (Thu tiền khách)
      GaraFinanceTransaction()..transactionId = 'FIN-001'..documentCode = 'PT-1000001'..type = GaraFinanceTransactionType.RECEIPT..amount = 380000..description = 'Thu tiền sửa xe Nguyễn Văn An - RO-1000001'..transactionDate = now.subtract(const Duration(days: 20))..customer.value = customers[0],
      GaraFinanceTransaction()..transactionId = 'FIN-002'..documentCode = 'PT-1000002'..type = GaraFinanceTransactionType.RECEIPT..amount = 420000..description = 'Thu tiền sửa xe Trần Thị Bình - RO-1000002'..transactionDate = now.subtract(const Duration(days: 15))..customer.value = customers[1],
      GaraFinanceTransaction()..transactionId = 'FIN-003'..documentCode = 'PT-1000003'..type = GaraFinanceTransactionType.RECEIPT..amount = 980000..description = 'Thu tiền sửa xe Lê Hoàng Nam - RO-1000003'..transactionDate = now.subtract(const Duration(days: 10))..customer.value = customers[2],
      GaraFinanceTransaction()..transactionId = 'FIN-004'..documentCode = 'PT-1000004'..type = GaraFinanceTransactionType.RECEIPT..amount = 200000..description = 'Thu tạm ứng Phạm Thị Dung - RO-1000004'..transactionDate = now.subtract(const Duration(days: 3))..customer.value = customers[3],
      GaraFinanceTransaction()..transactionId = 'FIN-005'..documentCode = 'PT-1000005'..type = GaraFinanceTransactionType.RECEIPT..amount = 1050000..description = 'Thu tiền sửa xe Hoàng Văn Em - RO-1000005'..transactionDate = now.subtract(const Duration(days: 1))..customer.value = customers[4],
      GaraFinanceTransaction()..transactionId = 'FIN-006'..documentCode = 'PT-1000006'..type = GaraFinanceTransactionType.RECEIPT..amount = 500000..description = 'Thu tạm ứng Đỗ Thị Giang - RO-1000006'..transactionDate = now.subtract(const Duration(days: 2))..customer.value = customers[5],
      GaraFinanceTransaction()..transactionId = 'FIN-007'..documentCode = 'PT-1000007'..type = GaraFinanceTransactionType.RECEIPT..amount = 2000000..description = 'Thu tạm ứng Vũ Minh Hoa - RO-1000007'..transactionDate = now.subtract(const Duration(days: 1))..customer.value = customers[6],
      // Payments (Chi tiền NCC)
      GaraFinanceTransaction()..transactionId = 'FIN-008'..documentCode = 'PC-1000001'..type = GaraFinanceTransactionType.PAYMENT..amount = 5000000..description = 'Thanh toán NCC Dầu nhờn VN (NK-1000001)'..transactionDate = now.subtract(const Duration(days: 22))..supplier.value = suppliers[0],
      GaraFinanceTransaction()..transactionId = 'FIN-009'..documentCode = 'PC-1000002'..type = GaraFinanceTransactionType.PAYMENT..amount = 3000000..description = 'Thanh toán NCC Phụ tùng Honda (NK-1000002)'..transactionDate = now.subtract(const Duration(days: 18))..supplier.value = suppliers[1],
      GaraFinanceTransaction()..transactionId = 'FIN-010'..documentCode = 'PC-1000003'..type = GaraFinanceTransactionType.PAYMENT..amount = 7100000..description = 'Thanh toán NCC Lốp Michelin (NK-1000003)'..transactionDate = now.subtract(const Duration(days: 12))..supplier.value = suppliers[2],
      GaraFinanceTransaction()..transactionId = 'FIN-011'..documentCode = 'PC-1000004'..type = GaraFinanceTransactionType.PAYMENT..amount = 5000000..description = 'Thanh toán NCC Ắc quy GS (NK-1000002)'..transactionDate = now.subtract(const Duration(days: 12))..supplier.value = suppliers[3],
      GaraFinanceTransaction()..transactionId = 'FIN-012'..documentCode = 'PC-1000005'..type = GaraFinanceTransactionType.PAYMENT..amount = 2500000..description = 'Chi tiền lương nhân viên'..transactionDate = now.subtract(const Duration(days: 5)),
    ];
    await db.writeTxn(() async {
      for (final tx in finTxs) {
        await db.garaFinanceTransactions.put(tx);
        await tx.customer.save();
        await tx.supplier.save();
      }
    });
  }
}
