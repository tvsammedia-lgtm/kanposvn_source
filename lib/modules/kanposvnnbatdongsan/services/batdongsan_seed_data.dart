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
          ..fullName = 'Nguyá»…n VÄƒn An'
          ..phone = '0901234567'
          ..email = 'an.nguyen@gmail.com'
          ..cccd = '012345678901'
          ..branch = 'Chi nhÃ¡nh Quáº­n 1'
          ..joinDate = DateTime(2024, 1, 15)
          ..status = BrokerStatus.active
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Broker()
          ..remoteId = uuid.v4()
          ..brokerCode = 'MB002'
          ..fullName = 'Tráº§n Thá»‹ BÃ¬nh'
          ..phone = '0912345678'
          ..email = 'binh.tran@gmail.com'
          ..cccd = '012345678902'
          ..branch = 'Chi nhÃ¡nh Quáº­n 2'
          ..joinDate = DateTime(2024, 3, 20)
          ..status = BrokerStatus.active
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Broker()
          ..remoteId = uuid.v4()
          ..brokerCode = 'MB003'
          ..fullName = 'LÃª Minh ChÃ¢u'
          ..phone = '0987654321'
          ..email = 'chau.le@gmail.com'
          ..cccd = '012345678903'
          ..branch = 'Chi nhÃ¡nh Quáº­n 1'
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
          ..name = 'Pháº¡m VÄƒn DÅ©ng'
          ..phone = '0901111222'
          ..email = 'dung.pham@gmail.com'
          ..address = 'Sá»‘ 12, ÄÆ°á»ng Nguyá»…n TrÃ£i, Quáº­n 5'
          ..notes = 'BÃ¡n Ä‘áº¥t máº·t tiá»n'
          ..type = CustomerType.seller
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'HoÃ ng Thá»‹ Em'
          ..phone = '0903333444'
          ..email = 'em.hoang@gmail.com'
          ..address = 'Sá»‘ 45, ÄÆ°á»ng LÃª Lá»£i, Quáº­n 1'
          ..notes = 'BÃ¡n nhÃ  phá»‘'
          ..type = CustomerType.seller
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
      ];

      final buyers = [
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'VÅ© ÄÃ¬nh Gia'
          ..phone = '0905555666'
          ..email = 'gia.vu@gmail.com'
          ..address = 'Sá»‘ 78, ÄÆ°á»ng CÃ¡ch Máº¡ng ThÃ¡ng 8, Quáº­n 10'
          ..notes = 'TÃ¬m mua chung cÆ° 2-3 phÃ²ng ngá»§'
          ..type = CustomerType.buyer
          ..demandCity = 'TP. Há»“ ChÃ­ Minh'
          ..demandDistrict = 'Quáº­n 7'
          ..demandPriceFrom = 2.5
          ..demandPriceTo = 4.5
          ..demandArea = 80
          ..demandPropertyType = 'Chung cÆ°'
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Äáº·ng Thu HÃ '
          ..phone = '0907777888'
          ..email = 'ha.dang@gmail.com'
          ..address = 'Sá»‘ 99, ÄÆ°á»ng Tráº§n HÆ°ng Äáº¡o, Quáº­n 1'
          ..notes = 'TÃ¬m mua Ä‘áº¥t ná»n Ä‘áº§u tÆ°'
          ..type = CustomerType.buyer
          ..demandCity = 'TP. Há»“ ChÃ­ Minh'
          ..demandDistrict = 'Thá»§ Äá»©c'
          ..demandPriceFrom = 1.5
          ..demandPriceTo = 3.0
          ..demandArea = 100
          ..demandPropertyType = 'Äáº¥t'
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
      ];
      await isar.customers.putAll(sellers);
      await isar.customers.putAll(buyers);

      // ---- Properties ----
      final properties = [
        BdsProperty()
          ..remoteId = uuid.v4()
          ..title = 'Äáº¥t máº·t tiá»n Ä‘Æ°á»ng Nguyá»…n TrÃ£i'
          ..description = 'Äáº¥t trá»‘ng 5x20m, khu dÃ¢n cÆ° Ä‘Ã´ng Ä‘Ãºc, tiá»‡n kinh doanh'
          ..ownerId = sellers[0].remoteId
          ..brokerId = brokers[0].remoteId
          ..province = 'TP. Há»“ ChÃ­ Minh'
          ..district = 'Quáº­n 5'
          ..ward = 'PhÆ°á»ng 4'
          ..area = 'Máº·t tiá»n'
          ..price = 8.5
          ..areaSize = 100
          ..width = 5
          ..length = 20
          ..propertyType = 'Äáº¥t'
          ..legalStatus = 'Sá»• Ä‘á»'
          ..features = ['Máº·t tiá»n', 'Sá»• Ä‘á»', 'Kinh doanh tá»‘t']
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..title = 'NhÃ  phá»‘ LÃª Lá»£i 2 táº§ng'
          ..description = 'NhÃ  2 táº§ng, 3 phÃ²ng ngá»§, ná»™i tháº¥t cÆ¡ báº£n'
          ..ownerId = sellers[1].remoteId
          ..brokerId = brokers[1].remoteId
          ..province = 'TP. Há»“ ChÃ­ Minh'
          ..district = 'Quáº­n 1'
          ..ward = 'PhÆ°á»ng Báº¿n NghÃ©'
          ..area = 'Háº»m'
          ..price = 6.2
          ..areaSize = 60
          ..width = 4
          ..length = 15
          ..floors = 2
          ..bedrooms = 3
          ..bathrooms = 2
          ..propertyType = 'NhÃ '
          ..legalStatus = 'Sá»• há»“ng'
          ..features = ['Háº»m rá»™ng', 'Sá»• há»“ng']
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..title = 'Chung cÆ° Vinhomes Central Park'
          ..description = 'CÄƒn há»™ 3PN 2WC, view sÃ´ng, ná»™i tháº¥t cao cáº¥p'
          ..ownerId = sellers[0].remoteId
          ..brokerId = brokers[0].remoteId
          ..province = 'TP. Há»“ ChÃ­ Minh'
          ..district = 'BÃ¬nh Tháº¡nh'
          ..ward = 'PhÆ°á»ng 22'
          ..area = 'CÄƒn há»™'
          ..price = 4.8
          ..areaSize = 90
          ..floors = 15
          ..bedrooms = 3
          ..bathrooms = 2
          ..propertyType = 'Chung cÆ°'
          ..legalStatus = 'Sá»• há»“ng'
          ..features = ['View sÃ´ng', 'Sá»• há»“ng', 'Ná»™i tháº¥t']
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..title = 'Äáº¥t ná»n Thá»§ Äá»©c 100m2'
          ..description = 'Äáº¥t ná»n trong khu dÃ¢n cÆ°, háº¡ táº§ng hoÃ n thiá»‡n'
          ..ownerId = sellers[1].remoteId
          ..brokerId = brokers[1].remoteId
          ..province = 'TP. Há»“ ChÃ­ Minh'
          ..district = 'Thá»§ Äá»©c'
          ..ward = 'PhÆ°á»ng Linh XuÃ¢n'
          ..area = 'Khu dÃ¢n cÆ°'
          ..price = 2.3
          ..areaSize = 100
          ..width = 5
          ..length = 20
          ..propertyType = 'Äáº¥t'
          ..legalStatus = 'Sá»• Ä‘á»'
          ..features = ['Khu dÃ¢n cÆ°', 'Sá»• Ä‘á»']
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..title = 'Máº·t báº±ng kinh doanh Quáº­n 10'
          ..description = 'Máº·t báº±ng trá»‡t 40m2, máº·t tiá»n Ä‘Æ°á»ng lá»›n'
          ..ownerId = sellers[0].remoteId
          ..brokerId = brokers[0].remoteId
          ..province = 'TP. Há»“ ChÃ­ Minh'
          ..district = 'Quáº­n 10'
          ..ward = 'PhÆ°á»ng 12'
          ..area = 'Máº·t tiá»n'
          ..price = 5.5
          ..areaSize = 40
          ..width = 4
          ..length = 10
          ..propertyType = 'Máº·t báº±ng'
          ..legalStatus = 'Sá»• há»“ng'
          ..features = ['Máº·t tiá»n', 'Kinh doanh tá»‘t']
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..title = 'NhÃ  trá» 10 phÃ²ng Quáº­n 7'
          ..description = 'DÃ£y nhÃ  trá» 10 phÃ²ng, dÃ²ng tiá»n á»•n Ä‘á»‹nh 15 triá»‡u/thÃ¡ng'
          ..ownerId = sellers[1].remoteId
          ..brokerId = brokers[2].remoteId
          ..province = 'TP. Há»“ ChÃ­ Minh'
          ..district = 'Quáº­n 7'
          ..ward = 'PhÆ°á»ng TÃ¢n Thuáº­n'
          ..area = 'NhÃ  trá»'
          ..price = 9.0
          ..areaSize = 150
          ..width = 6
          ..length = 25
          ..floors = 2
          ..propertyType = 'NhÃ '
          ..legalStatus = 'Sá»• há»“ng'
          ..features = ['DÃ²ng tiá»n', 'Sá»• há»“ng']
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
          ..notes = 'ÄÃ£ Ä‘áº·t cá»c 200 triá»‡u'
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
          ..notes = 'ÄÃ£ cÃ´ng chá»©ng xong'
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
          ..notes = 'Äang thÆ°Æ¡ng lÆ°á»£ng giÃ¡'
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
          ..notes = 'Giao dá»‹ch há»§y do khÃ¡ch khÃ´ng Ä‘á»§ vá»‘n'
          ..status = TransactionStatus.cancelled
          ..updatedAt = now
          ..version = 1
          ..isSynced = false,
      ];
      await isar.transactionRecords.putAll(transactions);
    });
  }
}
