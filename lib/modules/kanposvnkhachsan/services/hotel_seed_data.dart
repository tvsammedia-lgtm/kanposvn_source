import 'package:uuid/uuid.dart';
import 'package:isar/isar.dart';
import '../models/hotel_room.dart';
import '../models/hotel_service.dart';
import '../models/hotel_inventory.dart';
import '../models/hotel_finance_accounting.dart';
import '../models/hotel_customer_supplier.dart';
import 'hotel_isar_service.dart';

class HotelSeedData {
  static Future<void> seed(HotelIsarService isarService) async {
    final db = await isarService.db;
    final uuid = const Uuid();

    // ---- Seed Menu dịch vụ (tham khảo từ KANHOT DB) ----
    final serviceCount = await db.hotelServiceItems.count();
    if (serviceCount == 0) {
      await isarService.saveAll(_buildServiceItems(uuid));
    }

    // ---- Seed Phòng / Tầng / Loại phòng ----
    final roomsCount = await db.hotelRooms.count();
    if (roomsCount == 0) {
      await _seedRooms(isarService, uuid);
    }

    // ---- Seed Kho hàng + Nhà cung cấp ----
    final stockCount = await db.hotelInventoryItems.count();
    if (stockCount == 0) {
      await _seedStock(isarService, uuid);
    }

    // ---- Seed Thu - chi (quỹ tiền mặt) ----
    final cashCount = await db.hotelCashTransactions.count();
    if (cashCount == 0) {
      await _seedCash(isarService, uuid);
    }

    // ---- Seed Báo cáo ca ----
    final shiftCount = await db.hotelShiftReports.count();
    if (shiftCount == 0) {
      await _seedShifts(isarService, uuid);
    }

    // ---- Seed Khách hàng ----
    final customerCount = await db.hotelCustomers.count();
    if (customerCount == 0) {
      await _seedCustomers(isarService, uuid);
    }
  }

  // -------- PHÒNG / TẦNG / LOẠI PHÒNG --------

  static Future<void> _seedRooms(HotelIsarService isarService, Uuid uuid) async {
    final db = await isarService.db;

    // 8 tầng
    final floors = <HotelFloor>[];
    for (int f = 1; f <= 8; f++) {
      floors.add(HotelFloor()
        ..floorName = 'Tầng $f'
        ..floorCode = 'F$f'
        ..description = 'Phòng tầng $f'
        ..displayOrder = f);
    }

    // 6 loại phòng theo giá KANHOT (LOAI1 -> LOAI6)
    // Giá: Giờ đầu / Giờ tiếp / Qua đêm(18-20h) / Ngày
    // Qua đêm theo khung: [18-20h, 20-22h, 22h-2h(cao nhất), 2h-12h]
    final types = <RoomType>[];
    // [hourly, extra, overnight18_20, daily, area, capacity, weekendExtra, extraPersonSurcharge]
    final priceSheet = <List<double>>[
      [60000, 20000, 200000, 270000, 20, 2, 30000, 100000],
      [70000, 20000, 210000, 300000, 22, 2, 30000, 100000],
      [80000, 20000, 230000, 320000, 25, 3, 40000, 120000],
      [90000, 20000, 240000, 350000, 28, 3, 50000, 120000],
      [90000, 20000, 250000, 400000, 30, 4, 50000, 150000],
      [100000, 20000, 280000, 400000, 35, 4, 60000, 150000],
    ];
    // Chênh lệch qua đêm theo khung giờ (so với 18-20h)
    final overnightPeakExtra = [0, 0, 20000, 0];
    for (int i = 0; i < 6; i++) {
      final p = priceSheet[i];
      final overnightBase = p[2];
      final dailyRate = p[3];
      types.add(RoomType()
        ..typeCode = 'LOAI${i + 1}'
        ..typeName = 'Phòng Loại ${i + 1}'
        ..hourlyPrice = p[0]
        ..hourlyExtraHour = p[1]
        ..overnightPrice = overnightBase
        ..overnightPricesByTimeSlot = [
          overnightBase + overnightPeakExtra[0],
          overnightBase + overnightPeakExtra[1],
          overnightBase + overnightPeakExtra[2],
          overnightBase + overnightPeakExtra[3],
        ]
        ..basePrice = dailyRate
        ..dailyPricesByWeekday = List.filled(7, dailyRate)
        ..area = p[4]
        ..capacity = p[5].toInt()
        ..weekendPrice = dailyRate + p[6]
        ..holidayPrice = dailyRate + p[6] * 2
        ..extraPersonSurcharge = p[7]
        ..description =
            'Giờ: ${p[0].toStringAsFixed(0)}đ (+${p[1].toStringAsFixed(0)}đ) - Qua đêm: ${overnightBase.toStringAsFixed(0)}đ - Ngày: ${dailyRate.toStringAsFixed(0)}đ');
    }

    await isarService.saveAll(floors);
    await isarService.saveAll(types);

    final savedFloors = await db.hotelFloors.where().findAll();
    final savedTypes = await db.roomTypes.where().findAll();

    // 40 phòng: 101-105, 201-205, ..., 801-805
    final List<HotelRoom> rooms = [];
    for (int f = 1; f <= 8; f++) {
      final floor = savedFloors.firstWhere((x) => x.floorCode == 'F$f');
      final type = savedTypes.firstWhere((x) => x.typeCode == 'LOAI${((f - 1) % 6) + 1}');
      for (int r = 1; r <= 5; r++) {
        final n = f * 100 + r;
        rooms.add(HotelRoom()
          ..roomId = uuid.v4()
          ..roomName = 'P.$n'
          ..roomNumber = '$n'
          ..floor.value = floor
          ..roomType.value = type
          ..status = RoomStatus.AVAILABLE);
      }
    }

    await db.writeTxn(() async {
      for (var room in rooms) {
        await db.hotelRooms.put(room);
        room.floor.save();
        room.roomType.save();
      }
    });
  }

  // -------- MENU DỊCH VỤ (tham khảo từ KANHOT DB) --------

  static List<HotelServiceItem> _buildServiceItems(Uuid uuid) {
    final rows = <(String, double, String)>[
      // CƠM
      ('CƠM GÀ', 38000, 'CƠM'),
      ('CƠM SƯỜN XÚC XÍCH', 35000, 'CƠM'),
      ('CƠM CÁ SỐT CÀ (HỘP)', 35000, 'CƠM'),
      ('CƠM THỊT HEO HẦM ĐẬU', 38000, 'CƠM'),
      ('CƠM HEO 2 LÁT', 38000, 'CƠM'),
      ('CƠM LẠP XƯỞNG', 35000, 'CƠM'),
      ('CƠM GÀ TRỨNG CHIÊN', 45000, 'CƠM'),
      ('CƠM KHÔNG', 5000, 'CƠM'),
      ('CƠM BÒ XÀO', 50000, 'CƠM'),
      ('CƠM SƯỜN TRỨNG', 40000, 'CƠM'),
      ('CƠM SƯỜN LẠP XƯỞNG', 40000, 'CƠM'),
      ('CƠM TRỨNG CHIÊN', 22000, 'CƠM'),
      ('CƠM CHIÊN TỎI', 20000, 'CƠM'),
      // BÒ
      ('BÒ BÍT TẾT KHOAI TÂY + KHOAI BÁNH MÌ', 50000, 'BÒ'),
      ('BÒ LÚC LẮC KHOAI + BÁNH MÌ', 50000, 'BÒ'),
      ('BÒ XÀO HÀNH TÂY', 50000, 'BÒ'),
      ('BÒ XÀO MÌ', 50000, 'BÒ'),
      ('BÒ BÍT TẾT TRỨNG', 55000, 'BÒ'),
      ('BÒ LÚC LẮC TRỨNG', 55000, 'BÒ'),
      ('CHÈN BÒ VIÊN', 15000, 'BÒ'),
      // BÁNH MÌ
      ('BÁNH MÌ ỐP LA', 20000, 'BÁNH MÌ'),
      ('BÁNH MÌ ỐP LA PATE', 25000, 'BÁNH MÌ'),
      ('BÁNH MÌ HEO 2 LÁT', 38000, 'BÁNH MÌ'),
      ('BÁNH MÌ CÁ', 35000, 'BÁNH MÌ'),
      ('BÁNH MÌ OMELET', 20000, 'BÁNH MÌ'),
      ('BÁNH MÌ KHÔNG', 5000, 'BÁNH MÌ'),
      // MÌ NƯỚC
      ('MÌ BÒ TÁI', 25000, 'MÌ NƯỚC'),
      ('MÌ HỘT GÀ', 25000, 'MÌ NƯỚC'),
      ('MÌ BÒ TÁI + TRỨNG', 35000, 'MÌ NƯỚC'),
      ('MÌ BÒ TÁI + BÒ VIÊN', 35000, 'MÌ NƯỚC'),
      ('MÌ BÒ TÁI + XÚC XÍCH', 35000, 'MÌ NƯỚC'),
      ('MÌ TRỨNG XÚC XÍCH', 30000, 'MÌ NƯỚC'),
      ('MÌ BÒ VIÊN', 25000, 'MÌ NƯỚC'),
      ('MÌ KHÔNG 2 GÓI', 20000, 'MÌ NƯỚC'),
      ('MÌ TÁI TRỨNG XÚC XÍCH BÒ VIÊN', 40000, 'MÌ NƯỚC'),
      ('MÌ XÚC XÍCH', 25000, 'MÌ NƯỚC'),
      ('MÌ KHÔNG 1 GÓI', 15000, 'MÌ NƯỚC'),
      // RAU TRỘN
      ('XÀ LÁCH TRỘN DẦU GIẤM', 25000, 'RAU TRỘN'),
      ('XÀ LÁCH THỊT BÒ', 45000, 'RAU TRỘN'),
      ('XÀ LÁCH CÁ MỒI', 45000, 'RAU TRỘN'),
      ('XÀ LÁCH CÁ NGỪ', 45000, 'RAU TRỘN'),
      ('DƯA LEO', 15000, 'RAU TRỘN'),
      ('RAU SỐNG', 10000, 'RAU TRỘN'),
      ('RAU LUỘC', 10000, 'RAU TRỘN'),
      ('CÀ CHUA', 15000, 'RAU TRỘN'),
      ('KHOAI TÂY CHIÊN', 25000, 'RAU TRỘN'),
      // GIẢI KHÁT
      ('CAFE ĐEN', 15000, 'GIẢI KHÁT'),
      ('CAFE ĐÁ', 15000, 'GIẢI KHÁT'),
      ('CAFE SỮA ĐÁ', 20000, 'GIẢI KHÁT'),
      ('ĐÁ CHANH', 20000, 'GIẢI KHÁT'),
      ('CAM VẮT', 25000, 'GIẢI KHÁT'),
      ('SODA CHANH', 25000, 'GIẢI KHÁT'),
      ('SODA CAM', 35000, 'GIẢI KHÁT'),
      ('SODA HỘT GÀ', 30000, 'GIẢI KHÁT'),
      ('SODA CAM SỮA', 35000, 'GIẢI KHÁT'),
      ('SODA CAM SỮA TRỨNG', 40000, 'GIẢI KHÁT'),
      ('BÒ HÚC (LON) THÁI', 15000, 'GIẢI KHÁT'),
      ('YẾN (LON)', 12000, 'GIẢI KHÁT'),
      ('NƯỚC NGỌT LON', 12000, 'GIẢI KHÁT'),
      ('NƯỚC NGỌT CHAI', 12000, 'GIẢI KHÁT'),
      ('SỮA NÓNG', 15000, 'GIẢI KHÁT'),
      ('NƯỚC SÂM HQ', 20000, 'GIẢI KHÁT'),
      // BIA
      ('HEINEKEN', 22000, 'BIA'),
      ('TIGER', 20000, 'BIA'),
      ('BIA 333', 16000, 'BIA'),
      ('SAI GON ĐỎ 11', 12000, 'BIA'),
      ('SAI GON XANH', 11000, 'BIA'),
      // TRỨNG GÀ
      ('TRỨNG LUỘC', 6000, 'TRỨNG GÀ'),
      ('TRỨNG CHIÊN', 15000, 'TRỨNG GÀ'),
      // CANH
      ('CANH', 10000, 'CANH'),
      // XÚC XÍCH
      ('XÚC XÍCH', 6000, 'XÚC XÍCH'),
      ('MÌ TRỨNG XÚC XÍCH', 35000, 'XÚC XÍCH'),
      ('MÌ XÚC XÍCH', 25000, 'XÚC XÍCH'),
      // GIẶT
      ('ÁO SƠ MI - GIẶT', 7000, 'GIẶT'),
      ('ÁO ĐẦM - GIẶT', 10000, 'GIẶT'),
      ('ÁO KIỂU - GIẶT', 5000, 'GIẶT'),
      ('ÁO THUN - GIẶT', 5000, 'GIẶT'),
      ('ÁO ẤM - GIẶT', 10000, 'GIẶT'),
      ('QUẦN TÂY - GIẶT', 8000, 'GIẶT'),
      ('QUẦN SỌT - GIẶT', 7000, 'GIẶT'),
      ('VÁY - GIẶT', 10000, 'GIẶT'),
      ('BỘ ĐỒ NGỦ - GIẶT', 10000, 'GIẶT'),
      ('QUẦN LÓT NAM - GIẶT', 5000, 'GIẶT'),
      ('QUẦN LÓT NỮ - GIẶT', 5000, 'GIẶT'),
      ('ÁO LÓT NỮ - GIẶT', 5000, 'GIẶT'),
      ('VỚ - GIẶT', 5000, 'GIẶT'),
      ('KHĂN TAY - GIẶT', 5000, 'GIẶT'),
      ('KHĂN TẮM - GIẶT', 7000, 'GIẶT'),
      ('ÁO QUẦN TRẺ EM - GIẶT', 10000, 'GIẶT'),
      ('BỘ QUẦN ÁO - GIẶT', 15000, 'GIẶT'),
      ('QUẦN JEAN - GIẶT', 12000, 'GIẶT'),
      ('BA LÔ - GIẶT', 15000, 'GIẶT'),
      // GIẶT-ỦI
      ('BỘ QUẦN ÁO', 28000, 'GIẶT-ỦI'),
      // ỦI
      ('ÁO SƠ MI - ỦI', 6000, 'ỦI'),
      ('ÁO ĐẦM - ỦI', 10000, 'ỦI'),
      ('ÁO KIỂU - ỦI', 5000, 'ỦI'),
      ('ÁO THUN - ỦI', 5000, 'ỦI'),
      ('ÁO ẤM - ỦI', 6000, 'ỦI'),
      ('QUẦN TÂY - ỦI', 7000, 'ỦI'),
      ('QUẦN SỌT - ỦI', 5000, 'ỦI'),
      ('BỘ ĐỒ NGỦ - ỦI', 5000, 'ỦI'),
      ('KHĂN TAY - ỦI', 2000, 'ỦI'),
      ('KHĂN TẮM - ỦI', 5000, 'ỦI'),
      ('ÁO QUẦN TRẺ EM - ỦI', 5000, 'ỦI'),
      ('BỘ QUẦN ÁO - ỦI', 13000, 'ỦI'),
      // THUỐC LÁ
      ('THUỐC 555', 30000, 'THUỐC LÁ'),
      ('THUỐC MÈO', 25000, 'THUỐC LÁ'),
      ('TÀO', 5000, 'THUỐC LÁ'),
      ('QUẸT', 3000, 'THUỐC LÁ'),
      // TỦ BÁNH
      ('BÁNH POCA', 10000, 'TỦ BÁNH'),
      ('BÁNH TÔM', 6000, 'TỦ BÁNH'),
      ('BÁNH QUE', 15000, 'TỦ BÁNH'),
      ('BÁNH OREO', 17000, 'TỦ BÁNH'),
      ('BÁNH RITZ', 17000, 'TỦ BÁNH'),
      ('BÁNH CREAM', 13000, 'TỦ BÁNH'),
      ('BÁNH CHOCO PIE', 12000, 'TỦ BÁNH'),
      ('BÁNH CUSTAS', 12000, 'TỦ BÁNH'),
      ('ĐẬU PHỘNG', 17000, 'TỦ BÁNH'),
      ('KẸO MENTOS', 6000, 'TỦ BÁNH'),
      ('KẸO ALPENLIEBE', 6000, 'TỦ BÁNH'),
      ('KẸO GOLIA', 6000, 'TỦ BÁNH'),
      ('MÍT SẤY', 10000, 'TỦ BÁNH'),
      ('DAO CAO RAU', 10000, 'TỦ BÁNH'),
      ('KHĂN GIẤY', 5000, 'TỦ BÁNH'),
      ('DẦU THÁI', 20000, 'TỦ BÁNH'),
      ('BÁNH QUY COSY', 22000, 'TỦ BÁNH'),
      ('ÁO MƯA', 10000, 'TỦ BÁNH'),
      ('BÀN CHẢI', 12000, 'TỦ BÁNH'),
      ('SỮA TẮM', 22000, 'TỦ BÁNH'),
      ('QUẸT GAZ', 3000, 'TỦ BÁNH'),
      ('BÁNH AFC', 15000, 'TỦ BÁNH'),
      ('SNACK TÔM', 7000, 'TỦ BÁNH'),
      ('DẦU HÀ LAN', 12000, 'TỦ BÁNH'),
      ('BÁNH PINGO', 12000, 'TỦ BÁNH'),
      ('KHÔ BÒ', 22000, 'TỦ BÁNH'),
      ('CHẢ GIÒ', 13000, 'TỦ BÁNH'),
      // NƯỚC SUỐI
      ('NƯỚC SUỐI NHỎ', 5000, 'NƯỚC SUỐI'),
      ('NƯỚC SUỐI DASA', 10000, 'NƯỚC SUỐI'),
      // TIỀN PHỤ THU
      ('PHỤ THU 1 KHÁCH', 70000, 'TIỀN PHỤ THU'),
      ('PHỤ THU 2 KHÁCH', 140000, 'TIỀN PHỤ THU'),
    ];

    return [
      for (final r in rows)
        HotelServiceItem()
          ..itemId = uuid.v4()
          ..itemName = r.$1
          ..price = r.$2
          ..category = r.$3
          ..isInventoryTracked = false,
    ];
  }

  // -------- KHO HÀNG + NHÀ CUNG CẤP --------

  static Future<void> _seedStock(HotelIsarService isarService, Uuid uuid) async {
    final db = await isarService.db;

    final items = <HotelInventoryItem>[
      HotelInventoryItem()
        ..itemId = uuid.v4()
        ..itemName = 'Bia Tiger (Lon)'
        ..sku = 'BIA-TIGER'
        ..unit = 'Lon'
        ..costPrice = 15000
        ..currentStock = 48
        ..minStock = 12,
      HotelInventoryItem()
        ..itemId = uuid.v4()
        ..itemName = 'Bánh Poca'
        ..sku = 'BANH-POCA'
        ..unit = 'Gói'
        ..costPrice = 7000
        ..currentStock = 30
        ..minStock = 10,
      HotelInventoryItem()
        ..itemId = uuid.v4()
        ..itemName = 'Nước suối (Chai)'
        ..sku = 'NUOC-SUOI'
        ..unit = 'Chai'
        ..costPrice = 4000
        ..currentStock = 100
        ..minStock = 24,
      HotelInventoryItem()
        ..itemId = uuid.v4()
        ..itemName = 'Xà phòng khách sạn'
        ..sku = 'XA-PHONG'
        ..unit = 'Cái'
        ..costPrice = 3000
        ..currentStock = 60
        ..minStock = 20,
    ];
    await isarService.saveAll(items);
    final saved = await db.hotelInventoryItems.where().findAll();

    final suppliers = <HotelSupplier>[
      HotelSupplier()
        ..supplierId = uuid.v4()
        ..supplierName = 'Công ty TNHH Bia Sài Gòn'
        ..contactPerson = 'Nguyễn Văn A'
        ..phoneNumber = '02838250858'
        ..address = 'Thành phố Hồ Chí Minh',
      HotelSupplier()
        ..supplierId = uuid.v4()
        ..supplierName = 'Cửa hàng Đồ dùng Khách sạn'
        ..contactPerson = 'Trần Thị B'
        ..phoneNumber = '0900000111'
        ..address = 'Thành phố Hồ Chí Minh',
    ];
    await isarService.saveAll(suppliers);

    HotelInventoryItem byName(String name) => saved.firstWhere((i) => i.itemName == name);

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final defs = <(String, String, InventoryTransactionType, int, double, String)>[
      ('Bia Tiger (Lon)', 'PN-0001', InventoryTransactionType.IMPORT, 48, 15000, 'Công ty TNHH Bia Sài Gòn'),
      ('Bánh Poca', 'PN-0001', InventoryTransactionType.IMPORT, 30, 7000, 'Công ty TNHH Bia Sài Gòn'),
      ('Nước suối (Chai)', 'PN-0002', InventoryTransactionType.IMPORT, 100, 4000, 'Cửa hàng Đồ dùng Khách sạn'),
      ('Xà phòng khách sạn', 'PN-0002', InventoryTransactionType.IMPORT, 60, 3000, 'Cửa hàng Đồ dùng Khách sạn'),
      ('Bia Tiger (Lon)', 'XK-0001', InventoryTransactionType.EXPORT, 6, 15000, 'Xuất cho quầy bar tầng 1'),
      ('Nước suối (Chai)', 'XK-0001', InventoryTransactionType.EXPORT, 12, 4000, 'Xuất cho phòng 101'),
    ];

    await db.writeTxn(() async {
      for (var i = 0; i < defs.length; i++) {
        final d = defs[i];
        final t = HotelInventoryTransaction()
          ..transactionId = uuid.v4()
          ..type = d.$3
          ..quantity = d.$4
          ..unitPrice = d.$5
          ..referenceInfo = d.$2
          ..note = d.$6
          ..createdAt = today.add(Duration(hours: 8 + i));
        await db.hotelInventoryTransactions.put(t);
        t.item.value = byName(d.$1);
        t.item.save();
      }
    });
  }

  // -------- THU - CHI (QUỸ TIỀN MẶT) --------

  static Future<void> _seedCash(HotelIsarService isarService, Uuid uuid) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final cash = <HotelCashTransaction>[
      // ── Hôm qua ──
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.INCOME
        ..amount = 300000
        ..category = 'Tiền phòng'
        ..description = 'Thu tiền phòng 101 - Thuê theo ngày (hôm qua)'
        ..createdBy = 'Lễ tân'
        ..createdAt = yesterday.add(const Duration(hours: 10)),
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.INCOME
        ..amount = 120000
        ..category = 'Dịch vụ'
        ..description = 'Thu giờ đầu phòng 203 - Thuê theo giờ'
        ..createdBy = 'Lễ tân'
        ..createdAt = yesterday.add(const Duration(hours: 14)),
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.EXPENSE
        ..amount = 1500000
        ..category = 'Lương'
        ..description = 'Chi lương nhân viên ca sáng'
        ..createdBy = 'Quản lý'
        ..createdAt = yesterday.add(const Duration(hours: 16)),
      // ── Hôm nay ──
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.INCOME
        ..amount = 270000
        ..category = 'Tiền phòng'
        ..description = 'Thu tiền phòng 101 - Thuê theo ngày'
        ..createdBy = 'Lễ tân'
        ..createdAt = today.add(const Duration(hours: 9)),
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.INCOME
        ..amount = 120000
        ..category = 'Tiền phòng'
        ..description = 'Thu tiền phòng 205 - Thuê theo giờ (2h)'
        ..createdBy = 'Lễ tân'
        ..createdAt = today.add(const Duration(hours: 10)),
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.INCOME
        ..amount = 88000
        ..category = 'Dịch vụ'
        ..description = 'Thu dịch vụ minibar phòng 102'
        ..createdBy = 'Lễ tân'
        ..createdAt = today.add(const Duration(hours: 11, minutes: 30)),
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.INCOME
        ..amount = 350000
        ..category = 'Tiền phòng'
        ..description = 'Thu tiền phòng 301 - Qua đêm'
        ..createdBy = 'Lễ tân'
        ..createdAt = today.add(const Duration(hours: 12)),
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.INCOME
        ..amount = 45000
        ..category = 'Giặt ủi'
        ..description = 'Thu giặt ủi phòng 101 (3 áo)'
        ..createdBy = 'Buồng phòng'
        ..createdAt = today.add(const Duration(hours: 13)),
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.EXPENSE
        ..amount = 720000
        ..category = 'Thanh toán NCC'
        ..description = 'Chi trả tiền mua Bia Tiger (48 lon) - Công ty TNHH Bia Sài Gòn'
        ..createdBy = 'Kế toán'
        ..createdAt = today.add(const Duration(hours: 14)),
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.EXPENSE
        ..amount = 200000
        ..category = 'Vệ sinh'
        ..description = 'Chi mua xà phòng, vật tư vệ sinh phòng'
        ..createdBy = 'Kế toán'
        ..createdAt = today.add(const Duration(hours: 15)),
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.EXPENSE
        ..amount = 450000
        ..category = 'Điện'
        ..description = 'Tiền điện tháng trước'
        ..createdBy = 'Kế toán'
        ..createdAt = today.add(const Duration(hours: 16)),
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.EXPENSE
        ..amount = 180000
        ..category = 'Nước'
        ..description = 'Tiền nước tháng trước'
        ..createdBy = 'Kế toán'
        ..createdAt = today.add(const Duration(hours: 16, minutes: 30)),
      HotelCashTransaction()
        ..transactionId = uuid.v4()
        ..type = CashTransactionType.EXPENSE
        ..amount = 120000
        ..category = 'Internet'
        ..description = 'Tiền internet tháng này'
        ..createdBy = 'Kế toán'
        ..createdAt = today.add(const Duration(hours: 17)),
    ];
    await isarService.saveAll(cash);
  }

  // -------- BÁO CÁO CA --------

  static Future<void> _seedShifts(HotelIsarService isarService, Uuid uuid) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final shifts = <HotelShiftReport>[
      HotelShiftReport()
        ..reportId = uuid.v4()
        ..shiftName = 'Ca sáng'
        ..employeeName = 'Lễ tân'
        ..startTime = today.add(const Duration(hours: 6))
        ..endTime = today.add(const Duration(hours: 14))
        ..startingCash = 1000000
        ..totalCashIncome = 358000
        ..totalCashExpense = 920000
        ..endingCash = 438000
        ..difference = 0
        ..note = ''
        ..isClosed = true,
      HotelShiftReport()
        ..reportId = uuid.v4()
        ..shiftName = 'Ca chiều'
        ..employeeName = 'Quản lý'
        ..startTime = today.add(const Duration(hours: 14))
        ..endTime = today.add(const Duration(hours: 22))
        ..startingCash = 0
        ..totalCashIncome = 540000
        ..totalCashExpense = 0
        ..endingCash = 540000
        ..difference = 0
        ..note = ''
        ..isClosed = true,
    ];
    await isarService.saveAll(shifts);
  }

  // -------- KHÁCH HÀNG --------

  static Future<void> _seedCustomers(HotelIsarService isarService, Uuid uuid) async {
    final customers = <HotelCustomer>[
      HotelCustomer()
        ..customerId = uuid.v4()
        ..fullName = 'Nguyễn Văn An'
        ..phoneNumber = '0901234567'
        ..email = 'an.nguyen@gmail.com'
        ..identityNumber = '079201012345'
        ..address = '123 Lê Lợi, Q.1, TP.HCM'
        ..totalVisits = 12
        ..totalSpent = 4500000
        ..debt = 0
        ..loyaltyPoints = 450
        ..membershipTier = 'VIP',
      HotelCustomer()
        ..customerId = uuid.v4()
        ..fullName = 'Trần Thị Bình'
        ..phoneNumber = '0912345678'
        ..email = 'binh.tran@yahoo.com'
        ..identityNumber = '079202023456'
        ..address = '45 Nguyễn Huệ, Q.1, TP.HCM'
        ..totalVisits = 8
        ..totalSpent = 2800000
        ..debt = 150000
        ..loyaltyPoints = 280
        ..membershipTier = 'Gold',
      HotelCustomer()
        ..customerId = uuid.v4()
        ..fullName = 'Lê Minh Châu'
        ..phoneNumber = '0923456789'
        ..identityNumber = '079203034567'
        ..address = '78 Hai Bà Trưng, Q.3, TP.HCM'
        ..totalVisits = 3
        ..totalSpent = 960000
        ..debt = 0
        ..loyaltyPoints = 96
        ..membershipTier = 'Silver',
      HotelCustomer()
        ..customerId = uuid.v4()
        ..fullName = 'Phạm Đức Dũng'
        ..phoneNumber = '0934567890'
        ..identityNumber = '079204045678'
        ..address = '210 Võ Văn Tần, Q.3, TP.HCM'
        ..totalVisits = 1
        ..totalSpent = 320000
        ..debt = 320000
        ..loyaltyPoints = 32
        ..membershipTier = 'Normal',
      HotelCustomer()
        ..customerId = uuid.v4()
        ..fullName = 'Hoàng Thị Em'
        ..phoneNumber = '0945678901'
        ..email = 'em.hoang@gmail.com'
        ..identityNumber = '079205056789'
        ..address = '55 Nguyễn Đình Chiểu, Q.1, TP.HCM'
        ..totalVisits = 5
        ..totalSpent = 1750000
        ..debt = 0
        ..loyaltyPoints = 175
        ..membershipTier = 'Silver',
      HotelCustomer()
        ..customerId = uuid.v4()
        ..fullName = 'Đỗ Minh Giới'
        ..phoneNumber = '0956789012'
        ..identityNumber = '079206067890'
        ..address = '99 Phan Đình Phùng, Phú Nhuận, TP.HCM'
        ..totalVisits = 15
        ..totalSpent = 7200000
        ..debt = 500000
        ..loyaltyPoints = 720
        ..membershipTier = 'VIP',
    ];
    await isarService.saveAll(customers);
  }
}
