import 'package:uuid/uuid.dart';
import '../models/property.dart';
import '../models/customer.dart';
import '../models/broker.dart';
import '../models/transaction.dart';
import '../repositories/isar_db.dart';

class BatDongSanSeedData {
  static Future<void> seedIfEmpty() async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    final propertyCount = await isar.propertys.count();
    if (propertyCount > 0) return;

    final uuid = const Uuid();

    await isar.writeTxn(() async {
      final now = DateTime.now();

      // ---- Brokers ----
      final brokers = [
        Broker()
          ..remoteId = uuid.v4()
          ..brokerCode = 'MB001'
          ..fullName = 'Nguyễn Văn An'
          ..phone = '0901234567'
          ..email = 'an.nguyen@gmail.com'
          ..cccd = '012345678901'
          ..branch = 'Chi nhánh Quận 1'
          ..joinDate = DateTime(2024, 1, 15)
          ..status = BrokerStatus.active
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Broker()
          ..remoteId = uuid.v4()
          ..brokerCode = 'MB002'
          ..fullName = 'Trần Thị Bình'
          ..phone = '0912345678'
          ..email = 'binh.tran@gmail.com'
          ..cccd = '012345678902'
          ..branch = 'Chi nhánh Quận 2'
          ..joinDate = DateTime(2024, 3, 20)
          ..status = BrokerStatus.active
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Broker()
          ..remoteId = uuid.v4()
          ..brokerCode = 'MB003'
          ..fullName = 'Lê Minh Châu'
          ..phone = '0987654321'
          ..email = 'chau.le@gmail.com'
          ..cccd = '012345678903'
          ..branch = 'Chi nhánh Quận 1'
          ..joinDate = DateTime(2023, 11, 5)
          ..status = BrokerStatus.suspended
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
      ];
      await isar.brokers.putAll(brokers);

      // ---- Customers ----
      final sellers = [
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Phạm Văn Dũng'
          ..phone = '0901111222'
          ..email = 'dung.pham@gmail.com'
          ..address = 'Số 12, Đường Nguyễn Trãi, Quận 5'
          ..notes = 'Bán đất mặt tiền'
          ..type = CustomerType.seller
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Hoàng Thị Em'
          ..phone = '0903333444'
          ..email = 'em.hoang@gmail.com'
          ..address = 'Số 45, Đường Lê Lợi, Quận 1'
          ..notes = 'Bán nhà phố'
          ..type = CustomerType.seller
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
      ];

      final buyers = [
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Vũ Đình Gia'
          ..phone = '0905555666'
          ..email = 'gia.vu@gmail.com'
          ..address = 'Số 78, Đường Cách Mạng Tháng 8, Quận 10'
          ..notes = 'Tìm mua chung cư 2-3 phòng ngủ'
          ..type = CustomerType.buyer
          ..demandCity = 'TP. Hồ Chí Minh'
          ..demandDistrict = 'Quận 7'
          ..demandPriceFrom = 2.5
          ..demandPriceTo = 4.5
          ..demandArea = 80
          ..demandPropertyType = 'Chung cư'
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Đặng Thu Hà'
          ..phone = '0907777888'
          ..email = 'ha.dang@gmail.com'
          ..address = 'Số 99, Đường Trần Hưng Đạo, Quận 1'
          ..notes = 'Tìm mua đất nền đầu tư'
          ..type = CustomerType.buyer
          ..demandCity = 'TP. Hồ Chí Minh'
          ..demandDistrict = 'Thủ Đức'
          ..demandPriceFrom = 1.5
          ..demandPriceTo = 3.0
          ..demandArea = 100
          ..demandPropertyType = 'Đất'
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
      ];
      await isar.customers.putAll(sellers);
      await isar.customers.putAll(buyers);

      // ---- Properties ----
      final properties = [
        Property()
          ..remoteId = uuid.v4()
          ..title = 'Đất mặt tiền đường Nguyễn Trãi'
          ..description = 'Đất trống 5x20m, khu dân cư đông đúc, tiện kinh doanh'
          ..ownerId = sellers[0].remoteId
          ..brokerId = brokers[0].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Quận 5'
          ..ward = 'Phường 4'
          ..area = 'Mặt tiền'
          ..price = 8.5
          ..areaSize = 100
          ..width = 5
          ..length = 20
          ..propertyType = 'Đất'
          ..legalStatus = 'Sổ đỏ'
          ..features = ['Mặt tiền', 'Sổ đỏ', 'Kinh doanh tốt']
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Property()
          ..remoteId = uuid.v4()
          ..title = 'Nhà phố Lê Lợi 2 tầng'
          ..description = 'Nhà 2 tầng, 3 phòng ngủ, nội thất cơ bản'
          ..ownerId = sellers[1].remoteId
          ..brokerId = brokers[1].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Quận 1'
          ..ward = 'Phường Bến Nghé'
          ..area = 'Hẻm'
          ..price = 6.2
          ..areaSize = 60
          ..width = 4
          ..length = 15
          ..floors = 2
          ..bedrooms = 3
          ..bathrooms = 2
          ..propertyType = 'Nhà'
          ..legalStatus = 'Sổ hồng'
          ..features = ['Hẻm rộng', 'Sổ hồng']
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Property()
          ..remoteId = uuid.v4()
          ..title = 'Chung cư Vinhomes Central Park'
          ..description = 'Căn hộ 3PN 2WC, view sông, nội thất cao cấp'
          ..ownerId = sellers[0].remoteId
          ..brokerId = brokers[0].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Bình Thạnh'
          ..ward = 'Phường 22'
          ..area = 'Căn hộ'
          ..price = 4.8
          ..areaSize = 90
          ..floors = 15
          ..bedrooms = 3
          ..bathrooms = 2
          ..propertyType = 'Chung cư'
          ..legalStatus = 'Sổ hồng'
          ..features = ['View sông', 'Sổ hồng', 'Nội thất']
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Property()
          ..remoteId = uuid.v4()
          ..title = 'Đất nền Thủ Đức 100m2'
          ..description = 'Đất nền trong khu dân cư, hạ tầng hoàn thiện'
          ..ownerId = sellers[1].remoteId
          ..brokerId = brokers[1].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Thủ Đức'
          ..ward = 'Phường Linh Xuân'
          ..area = 'Khu dân cư'
          ..price = 2.3
          ..areaSize = 100
          ..width = 5
          ..length = 20
          ..propertyType = 'Đất'
          ..legalStatus = 'Sổ đỏ'
          ..features = ['Khu dân cư', 'Sổ đỏ']
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Property()
          ..remoteId = uuid.v4()
          ..title = 'Mặt bằng kinh doanh Quận 10'
          ..description = 'Mặt bằng trệt 40m2, mặt tiền đường lớn'
          ..ownerId = sellers[0].remoteId
          ..brokerId = brokers[0].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Quận 10'
          ..ward = 'Phường 12'
          ..area = 'Mặt tiền'
          ..price = 5.5
          ..areaSize = 40
          ..width = 4
          ..length = 10
          ..propertyType = 'Mặt bằng'
          ..legalStatus = 'Sổ hồng'
          ..features = ['Mặt tiền', 'Kinh doanh tốt']
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Property()
          ..remoteId = uuid.v4()
          ..title = 'Nhà trọ 10 phòng Quận 7'
          ..description = 'Dãy nhà trọ 10 phòng, dòng tiền ổn định 15 triệu/tháng'
          ..ownerId = sellers[1].remoteId
          ..brokerId = brokers[2].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Quận 7'
          ..ward = 'Phường Tân Thuận'
          ..area = 'Nhà trọ'
          ..price = 9.0
          ..areaSize = 150
          ..width = 6
          ..length = 25
          ..floors = 2
          ..propertyType = 'Nhà'
          ..legalStatus = 'Sổ hồng'
          ..features = ['Dòng tiền', 'Sổ hồng']
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
      ];
      await isar.propertys.putAll(properties);

      // ---- Transactions ----
      final transactions = [
        TransactionRecord()
          ..remoteId = uuid.v4()
          ..transactionCode = 'GD0001'
          ..transactionDate = DateTime(2026, 6, 10)
          ..sellerId = sellers[0].remoteId
          ..buyerId = buyers[0].remoteId
          ..propertyId = properties[2].remoteId
          ..brokerId = brokers[0].remoteId
          ..askingPrice = 5.0
          ..finalPrice = 4.8
          ..commission = 0.15
          ..floorFee = 0.1
          ..notes = 'Đã đặt cọc 200 triệu'
          ..status = TransactionStatus.deposited
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        TransactionRecord()
          ..remoteId = uuid.v4()
          ..transactionCode = 'GD0002'
          ..transactionDate = DateTime(2026, 5, 25)
          ..sellerId = sellers[1].remoteId
          ..buyerId = buyers[1].remoteId
          ..propertyId = properties[3].remoteId
          ..brokerId = brokers[1].remoteId
          ..askingPrice = 2.4
          ..finalPrice = 2.3
          ..commission = 0.1
          ..floorFee = 0.05
          ..notes = 'Đã công chứng xong'
          ..status = TransactionStatus.completed
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        TransactionRecord()
          ..remoteId = uuid.v4()
          ..transactionCode = 'GD0003'
          ..transactionDate = DateTime(2026, 6, 20)
          ..sellerId = sellers[0].remoteId
          ..buyerId = buyers[0].remoteId
          ..propertyId = properties[0].remoteId
          ..brokerId = brokers[0].remoteId
          ..askingPrice = 8.5
          ..finalPrice = 8.2
          ..commission = 0.3
          ..floorFee = 0.15
          ..notes = 'Đang thương lượng giá'
          ..status = TransactionStatus.negotiating
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        TransactionRecord()
          ..remoteId = uuid.v4()
          ..transactionCode = 'GD0004'
          ..transactionDate = DateTime(2026, 4, 15)
          ..sellerId = sellers[1].remoteId
          ..buyerId = buyers[1].remoteId
          ..propertyId = properties[5].remoteId
          ..brokerId = brokers[2].remoteId
          ..askingPrice = 9.0
          ..finalPrice = 8.8
          ..commission = 0.35
          ..floorFee = 0.2
          ..notes = 'Giao dịch hủy do khách không đủ vốn'
          ..status = TransactionStatus.cancelled
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
      ];
      await isar.transactionRecords.putAll(transactions);
    });
  }
}
