import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/core.dart';
import '../models/product.dart';
import '../models/tank.dart';
import '../models/sale.dart';
import '../models/inventory.dart';
import 'tramxang_account_seed.dart';
import 'tramxang_isar_service.dart';

/// Bộ dữ liệu mẫu cho module Trạm Xăng + POS tạp hóa (FuelStationPOS).
///
/// Gồm: công ty, trạm, chi nhánh, user, danh mục, sản phẩm (nhiên liệu/nhớt/
/// phụ tùng/tạp hóa), bồn, trụ & vòi bơm, khách hàng, nhà cung cấp, số đo bồn
/// ban đầu và tồn kho mở đầu (InventoryTransaction loại IMPORT).
class TramXangSeedData {
  static Future<void> seedIfEmpty(TramXangIsarService isarService) async {
    final db = await isarService.db;
    if (await db.tramXangCompanys.count() > 0) return;
    await seedSampleData(isarService, force: true);
  }

  static Future<void> seedSampleData(
    TramXangIsarService isarService, {
    bool force = false,
  }) async {
    final db = await isarService.db;
    if (!force && await db.tramXangCompanys.count() > 0) return;

    final uuid = const Uuid();

    // ============ 1. CÔNG TY / TRẠM / CHI NHÁNH / USER ============
    final company = TramXangCompany()
      ..companyId = uuid.v4()
      ..code = 'TD-Company'
      ..name = 'CÔNG TY TNHH XĂNG DẦU THÔNG ĐẶC'
      ..taxCode = '0312345678'
      ..address = 'Quốc lộ 1A, huyện Thống Nhất, Đồng Nai'
      ..phone = '0908567567'
      ..email = 'tramxang.thongdac@gmail.com'
      ..accountingMethod = 'WEIGHTED_AVERAGE'
      ..fiscalYear = '2026'
      ..currency = 'VND'
      ..active = true;

    final station = TramXangStation()
      ..stationId = 'station_thong_dac'
      ..company.value = company
      ..code = 'TX-TD-01'
      ..name = 'TRẠM XĂNG DẦU THÔNG ĐẶC'
      ..address = 'Quốc lộ 1A, huyện Thống Nhất, Đồng Nai'
      ..timezone = 'Asia/Ho_Chi_Minh'
      ..active = true;

    final branch = TramXangBranch()
      ..branchId = uuid.v4()
      ..company.value = company
      ..station.value = station
      ..code = 'CN-TXTD-01'
      ..name = 'Chi nhánh Trạm Thông Đặc';

    final owner = TramXangUser()
      ..userId = uuid.v4()
      ..username = 'admin_tx'
      ..passwordHash = '***'
      ..employeeId = 'EMP_OWNER'
      ..station.value = station
      ..roleId = 'ROLE_OWNER'
      ..active = true;

    await db.writeTxn(() async {
      await db.tramXangCompanys.put(company);
      await db.tramXangStations.put(station);
      await db.tramXangBranchs.put(branch);
      await db.tramXangUsers.put(owner);
    });

    TramXangIsarService.currentStationId = station.stationId;

    // ============ 2. DANH MỤC ============
    final cats = [
      TramXangCategory()..categoryId = 'cat_fuel'..name = 'NHIÊN LIỆU'..description = 'Xăng dầu',
      TramXangCategory()..categoryId = 'cat_lube'..name = 'NHỚT DẦU'..description = 'Nhớt xe máy/ô tô',
      TramXangCategory()..categoryId = 'cat_part'..name = 'PHỤ TÙNG'..description = 'Phụ tùng xe máy',
      TramXangCategory()..categoryId = 'cat_grocery'..name = 'TẠP HÓA'..description = 'Nước, bánh, mì ...',
    ];
    await db.writeTxn(() async {
      await db.tramXangCategorys.putAll(cats);
    });

    // ============ 3. SẢN PHẨM ============
    final fuelRon95 = TramXangProduct()
      ..productId = 'fuel_ron95'
      ..sku = 'RON95-III'
      ..barcode = 'FUEL-RON95'
      ..name = 'Xăng RON95-III'
      ..productType = 'FUEL'
      ..unit = 'L'
      ..brand = 'Petrolimex'
      ..category.value = cats[0]
      ..importPrice = 22000
      ..retailPrice = 23500
      ..taxRate = 10
      ..costMethod = 'WEIGHTED_AVERAGE'
      ..trackInventory = true
      ..minStock = 3000
      ..maxStock = 14000
      ..active = true;

    final fuelE5 = TramXangProduct()
      ..productId = 'fuel_e5'
      ..sku = 'E5-RON92'
      ..barcode = 'FUEL-E5'
      ..name = 'Xăng E5 RON92'
      ..productType = 'FUEL'
      ..unit = 'L'
      ..brand = 'Petrolimex'
      ..category.value = cats[0]
      ..importPrice = 21000
      ..retailPrice = 22500
      ..taxRate = 10
      ..costMethod = 'WEIGHTED_AVERAGE'
      ..trackInventory = true
      ..minStock = 2000
      ..maxStock = 12000
      ..active = true;

    final fuelDo = TramXangProduct()
      ..productId = 'fuel_do'
      ..sku = 'DO-0.001S'
      ..barcode = 'FUEL-DO'
      ..name = 'Dầu DO 0.001S'
      ..productType = 'FUEL'
      ..unit = 'L'
      ..brand = 'PVOIL'
      ..category.value = cats[0]
      ..importPrice = 19200
      ..retailPrice = 20500
      ..taxRate = 10
      ..costMethod = 'WEIGHTED_AVERAGE'
      ..trackInventory = true
      ..minStock = 2000
      ..maxStock = 12000
      ..active = true;

    final lubeCastrol = TramXangProduct()
      ..productId = 'lube_castrol'
      ..sku = 'CASTROL-10W40-4L'
      ..barcode = 'LUB-CASTROL'
      ..name = 'Nhớt Castrol Magnatec 10W-40 (4L)'
      ..productType = 'LUBRICANT'
      ..unit = 'CAN'
      ..brand = 'Castrol'
      ..category.value = cats[1]
      ..importPrice = 720000
      ..retailPrice = 890000
      ..taxRate = 10
      ..costMethod = 'WEIGHTED_AVERAGE'
      ..trackInventory = true
      ..minStock = 5
      ..maxStock = 40
      ..active = true;

    final lubeShell = TramXangProduct()
      ..productId = 'lube_shell'
      ..sku = 'SHELL-HX7-4L'
      ..barcode = 'LUB-SHELL'
      ..name = 'Nhớt Shell Helix HX7 10W-40 (4L)'
      ..productType = 'LUBRICANT'
      ..unit = 'CAN'
      ..brand = 'Shell'
      ..category.value = cats[1]
      ..importPrice = 680000
      ..retailPrice = 850000
      ..taxRate = 10
      ..costMethod = 'WEIGHTED_AVERAGE'
      ..trackInventory = true
      ..minStock = 5
      ..maxStock = 30
      ..active = true;

    final partFilter = TramXangProduct()
      ..productId = 'part_filter'
      ..sku = 'FILTER-XM'
      ..barcode = 'PART-FILTER'
      ..name = 'Lọc gió xe máy'
      ..productType = 'SPARE_PART'
      ..unit = 'PIECE'
      ..brand = 'Vespa'
      ..category.value = cats[2]
      ..importPrice = 50000
      ..retailPrice = 85000
      ..taxRate = 10
      ..costMethod = 'WEIGHTED_AVERAGE'
      ..trackInventory = true
      ..minStock = 10
      ..maxStock = 100
      ..active = true;

    final partBugi = TramXangProduct()
      ..productId = 'part_bugi'
      ..sku = 'BUGI-NGK'
      ..barcode = 'PART-BUGI'
      ..name = 'Bugi NGK C7HSA'
      ..productType = 'SPARE_PART'
      ..unit = 'PIECE'
      ..brand = 'NGK'
      ..category.value = cats[2]
      ..importPrice = 30000
      ..retailPrice = 45000
      ..taxRate = 10
      ..costMethod = 'WEIGHTED_AVERAGE'
      ..trackInventory = true
      ..minStock = 10
      ..maxStock = 80
      ..active = true;

    final gCoca = TramXangProduct()
      ..productId = 'grocery_coca'
      ..sku = 'COCA-15L'
      ..barcode = '8934802000002'
      ..name = 'Nước ngọt Coca-Cola 1.5L'
      ..productType = 'GROCERY'
      ..unit = 'BOTTLE'
      ..brand = 'Coca-Cola'
      ..category.value = cats[3]
      ..importPrice = 14000
      ..retailPrice = 18000
      ..taxRate = 10
      ..costMethod = 'WEIGHTED_AVERAGE'
      ..trackInventory = true
      ..minStock = 12
      ..maxStock = 200
      ..active = true;

    final gLavie = TramXangProduct()
      ..productId = 'grocery_lavie'
      ..sku = 'LAVIE-500ML'
      ..barcode = '8934866305078'
      ..name = 'Nước suối Lavie 500ml'
      ..productType = 'GROCERY'
      ..unit = 'BOTTLE'
      ..brand = 'Lavie'
      ..category.value = cats[3]
      ..importPrice = 7000
      ..retailPrice = 10000
      ..taxRate = 10
      ..costMethod = 'WEIGHTED_AVERAGE'
      ..trackInventory = true
      ..minStock = 24
      ..maxStock = 300
      ..active = true;

    final gMi = TramXangProduct()
      ..productId = 'grocery_mi'
      ..sku = 'MILICUA-HH'
      ..barcode = '8934572200252'
      ..name = 'Mì tôm Hảo Hảo chua cay'
      ..productType = 'GROCERY'
      ..unit = 'PACK'
      ..brand = 'Acecook'
      ..category.value = cats[3]
      ..importPrice = 7000
      ..retailPrice = 9500
      ..taxRate = 10
      ..costMethod = 'WEIGHTED_AVERAGE'
      ..trackInventory = true
      ..minStock = 24
      ..maxStock = 300
      ..active = true;

    final gBanh = TramXangProduct()
      ..productId = 'grocery_banh'
      ..sku = 'COSY-BANH'
      ..barcode = '8935042270070'
      ..name = 'Banh quy Cosy vi sua (hop)'
      ..productType = 'GROCERY'
      ..unit = 'BOX'
      ..brand = 'Kinh Đô'
      ..category.value = cats[3]
      ..importPrice = 38000
      ..retailPrice = 48000
      ..taxRate = 10
      ..costMethod = 'WEIGHTED_AVERAGE'
      ..trackInventory = true
      ..minStock = 6
      ..maxStock = 80
      ..active = true;

    final allProducts = [
      fuelRon95,
      fuelE5,
      fuelDo,
      lubeCastrol,
      lubeShell,
      partFilter,
      partBugi,
      gCoca,
      gLavie,
      gMi,
      gBanh,
    ];
    await db.writeTxn(() async {
      for (final p in allProducts) {
        await db.tramXangProducts.put(p);
      }
    });

    // ============ 4. BỒN CHỨA ============
    final tankRon95 = TramXangTank()
      ..tankId = 'tank_ron95'
      ..stationId = station.stationId
      ..code = 'B1-RON95'
      ..name = 'Bồn RON95-III'
      ..product.value = fuelRon95
      ..productId = fuelRon95.productId
      ..capacityLiter = 15000
      ..safeCapacityLiter = 14000
      ..minLevelLiter = 3000
      ..criticalLevelLiter = 1500
      ..currentQuantity = 10500
      ..openingQuantity = 10500
      ..active = true;

    final tankE5 = TramXangTank()
      ..tankId = 'tank_e5'
      ..stationId = station.stationId
      ..code = 'B2-E5'
      ..name = 'Bồn E5 RON92'
      ..product.value = fuelE5
      ..productId = fuelE5.productId
      ..capacityLiter = 12000
      ..safeCapacityLiter = 11000
      ..minLevelLiter = 2500
      ..criticalLevelLiter = 1200
      ..currentQuantity = 5600
      ..openingQuantity = 5600
      ..active = true;

    final tankDo = TramXangTank()
      ..tankId = 'tank_do'
      ..stationId = station.stationId
      ..code = 'B3-DO'
      ..name = 'Bồn DO 0.001S'
      ..product.value = fuelDo
      ..productId = fuelDo.productId
      ..capacityLiter = 12000
      ..safeCapacityLiter = 11000
      ..minLevelLiter = 2500
      ..criticalLevelLiter = 1200
      ..currentQuantity = 0 // cạn, để demo cảnh báo đỏ + nhập nhiên liệu
      ..openingQuantity = 8000
      ..active = true;

    final allTanks = [tankRon95, tankE5, tankDo];
    await db.writeTxn(() async {
      for (final t in allTanks) {
        await db.tramXangTanks.put(t);
      }
    });

    // ============ 5. TRỤ & VÒI BƠM ============
    final pump1 = TramXangPump()
      ..pumpId = 'pump_a'
      ..stationId = station.stationId
      ..code = 'TRU-A'
      ..name = 'Trụ bơm A'
      ..manufacturer = 'TATSUNO'
      ..model = 'TX-22'
      ..ipAddress = '192.168.1.101'
      ..port = 3001
      ..protocol = 'TATSUNO'
      ..active = true;

    final pump2 = TramXangPump()
      ..pumpId = 'pump_b'
      ..stationId = station.stationId
      ..code = 'TRU-B'
      ..name = 'Trụ bơm B'
      ..manufacturer = 'TOKHEIM'
      ..model = 'Quantum'
      ..ipAddress = '192.168.1.102'
      ..port = 3002
      ..protocol = 'GILBARCO'
      ..active = true;

    final nozzleA1 = TramXangPumpNozzle()
      ..nozzleId = 'pump_a_1'
      ..pump.value = pump1
      ..product.value = fuelRon95
      ..tank.value = tankRon95
      ..pumpId = pump1.pumpId
      ..productId = fuelRon95.productId
      ..tankId = tankRon95.tankId
      ..nozzleNo = 1
      ..totalizerOpen = 15420.5
      ..totalizerClose = 15420.5
      ..meterType = 'MECHANICAL';

    final nozzleA2 = TramXangPumpNozzle()
      ..nozzleId = 'pump_a_2'
      ..pump.value = pump1
      ..product.value = fuelDo
      ..tank.value = tankDo
      ..pumpId = pump1.pumpId
      ..productId = fuelDo.productId
      ..tankId = tankDo.tankId
      ..nozzleNo = 2
      ..totalizerOpen = 8022.0
      ..totalizerClose = 8022.0
      ..meterType = 'MECHANICAL';

    final nozzleB1 = TramXangPumpNozzle()
      ..nozzleId = 'pump_b_1'
      ..pump.value = pump2
      ..product.value = fuelRon95
      ..tank.value = tankRon95
      ..pumpId = pump2.pumpId
      ..productId = fuelRon95.productId
      ..tankId = tankRon95.tankId
      ..nozzleNo = 1
      ..totalizerOpen = 9874.25
      ..totalizerClose = 9874.25
      ..meterType = 'ELECTRONIC';

    final nozzleB2 = TramXangPumpNozzle()
      ..nozzleId = 'pump_b_2'
      ..pump.value = pump2
      ..product.value = fuelE5
      ..tank.value = tankE5
      ..pumpId = pump2.pumpId
      ..productId = fuelE5.productId
      ..tankId = tankE5.tankId
      ..nozzleNo = 2
      ..totalizerOpen = 6130.8
      ..totalizerClose = 6130.8
      ..meterType = 'ELECTRONIC';

    await db.writeTxn(() async {
      await db.tramXangPumps.putAll([pump1, pump2]);
      for (final n in [nozzleA1, nozzleA2, nozzleB1, nozzleB2]) {
        await db.tramXangPumpNozzles.put(n);
      }
    });

    // ============ 6. KHÁCH HÀNG ============
    final custLe = TramXangCustomer()
      ..customerId = 'cust_le'
      ..code = 'KH-LE'
      ..name = 'Khách lẻ'
      ..phone = ''
      ..taxCode = ''
      ..address = ''
      ..creditLimit = 0
      ..paymentTerm = 0
      ..openingBalance = 0
      ..active = true;

    final custTanTien = TramXangCustomer()
      ..customerId = 'cust_tantien'
      ..code = 'KH-01'
      ..name = 'Công ty TNHH Vận tải Tân Tiến'
      ..phone = '0912345678'
      ..taxCode = '0309876543'
      ..address = 'KCN Long Bình, Biên Hòa, Đồng Nai'
      ..creditLimit = 50000000
      ..paymentTerm = 30
      ..openingBalance = 12500000
      ..active = true;

    final custChiMinh = TramXangCustomer()
      ..customerId = 'cust_chiminh'
      ..code = 'KH-02'
      ..name = 'Chị Minh (Cửa hàng tạp hóa đối diện)'
      ..phone = '0908123456'
      ..taxCode = ''
      ..address = 'QL1A, huyện Thống Nhất'
      ..creditLimit = 20000000
      ..paymentTerm = 15
      ..openingBalance = 0
      ..active = true;

    await db.writeTxn(() async {
      await db.tramXangCustomers.putAll([custLe, custTanTien, custChiMinh]);
    });

    // ============ 7. NHÀ CUNG CẤP ============
    final suPtlimex = TramXangSupplier()
      ..supplierId = 'sup_petrolimex'
      ..code = 'NCC-01'
      ..name = 'Tổng Công ty Xăng dầu Petrolimex'
      ..taxCode = '0100108001'
      ..phone = '19006006'
      ..address = 'Số 1 Khâm Thiên, Đống Đa, Hà Nội'
      ..paymentTerm = 30
      ..openingBalance = 0;

    final suCastrol = TramXangSupplier()
      ..supplierId = 'sup_castrol'
      ..code = 'NCC-02'
      ..name = 'Công ty TNHH Nhớt Castrol VN'
      ..taxCode = '0304523456'
      ..phone = '02837891234'
      ..address = 'KCN Sóng Thần, Bình Dương'
      ..paymentTerm = 15
      ..openingBalance = 0;

    final suTapHoa = TramXangSupplier()
      ..supplierId = 'sup_minhchau'
      ..code = 'NCC-03'
      ..name = 'Đại lý tạp hóa Minh Châu'
      ..taxCode = ''
      ..phone = '0909988776'
      ..address = 'Thống Nhất, Đồng Nai'
      ..paymentTerm = 7
      ..openingBalance = 0;

    await db.writeTxn(() async {
      await db.tramXangSuppliers.putAll([suPtlimex, suCastrol, suTapHoa]);
    });

    // ============ 8. SỐ ĐO BỒN MỞ ĐẦU ============
    DateTime d = DateTime.now();
    for (final t in allTanks) {
      final r = TramXangTankReading()
        ..readingId = uuid.v4()
        ..tank.value = t
        ..readingTime = d
        ..quantity = t.currentQuantity
        ..height = t.currentQuantity / 100
        ..temperature = 30.2
        ..waterLevel = 0
        ..density = t.productId == 'fuel_do' ? 0.845 : t.productId == 'fuel_e5' ? 0.71 : 0.735
        ..source = 'MANUAL'
        ..employeeId = 'EMP_OWNER';
      await db.writeTxn(() async {
        await db.tramXangTankReadings.put(r);
      });
    }

    // ============ 9. TỒN KHO MỞ ĐẦU ============
    Map<String, double> openingQty = {
      'fuel_ron95': 10500,
      'fuel_e5': 5600,
      'fuel_do': 8000,
      'lube_castrol': 20,
      'lube_shell': 15,
      'part_filter': 50,
      'part_bugi': 40,
      'grocery_coca': 120,
      'grocery_lavie': 200,
      'grocery_mi': 150,
      'grocery_banh': 30,
    };
    Map<String, String> whByProduct = {
      'fuel_ron95': 'TANK-RON95',
      'fuel_e5': 'TANK-E5',
      'fuel_do': 'TANK-DO',
      'lube_castrol': 'SHOP',
      'lube_shell': 'SHOP',
      'part_filter': 'SHOP',
      'part_bugi': 'SHOP',
      'grocery_coca': 'SHOP',
      'grocery_lavie': 'SHOP',
      'grocery_mi': 'SHOP',
      'grocery_banh': 'SHOP',
    };
    final savedProducts = await db.tramXangProducts.where().findAll();
    await db.writeTxn(() async {
      for (final p in savedProducts) {
        final qty = openingQty[p.productId] ?? 0;
        if (qty <= 0) continue;
        final cost = p.productType == 'FUEL'
            ? p.importPrice
            : p.importPrice;
        final tx = TramXangInventoryTransaction()
          ..transactionId = uuid.v4()
          ..warehouseId = whByProduct[p.productId] ?? 'WAREHOUSE'
          ..product.value = p
          ..productId = p.productId
          ..documentType = 'OPENING'
          ..documentId = 'OPENING'
          ..inQty = qty
          ..outQty = 0
          ..unitCost = cost
          ..balanceQty = qty
          ..balanceValue = qty * cost;
        await db.tramXangInventoryTransactions.put(tx);
      }
    });

    // ============ 10. KẾ TOÁN MẪU (TK + mặc định + bút toán mua/bán xăng) ============
    await TramXangAccountSeedData.seedAccountsAndEntries(db);
  }
}