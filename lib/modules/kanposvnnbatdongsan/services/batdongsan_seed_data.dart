import 'package:uuid/uuid.dart';
import '../models/floor_fee.dart';
import '../models/property.dart';
import '../models/customer.dart';
import '../models/broker.dart';
import '../models/transaction.dart';
import '../repositories/isar_db.dart';

/// Bộ dữ liệu mẫu cho module Bất động sản (PRD kanbatdongsan.md).
///
/// Phủ đủ: 4 nhóm phân loại BĐS (§8), 5 trạng thái giao dịch (§12),
/// hoa hồng chi tiết (§13), 5 loại phí sàn (§14), khách mua có nhu cầu
/// đầy đủ để demo so khớp tự động (§11). Ngày tính tương đối theo
/// DateTime.now() nên Dashboard luôn có "Giao dịch hôm nay/tháng".
class BatDongSanSeedData {
  static DateTime _ago(int days) =>
      DateTime.now().subtract(Duration(days: days));

  static Future<void> seedIfEmpty() async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    final propertyCount = await isar.propertys.count();
    if (propertyCount > 0) return;

    final uuid = const Uuid();

    await isar.writeTxn(() async {
      final now = DateTime.now();

      // ================= MÔI GIÓI =================
      final brokers = [
        Broker()
          ..remoteId = uuid.v4()
          ..brokerCode = 'MB001'
          ..fullName = 'Trần Văn Minh'
          ..phone = '0901234567'
          ..email = 'minh.tran@kanpos.vn'
          ..cccd = '079123456001'
          ..branch = 'CN Quận 1'
          ..joinDate = DateTime(2023, 5, 10)
          ..status = BrokerStatus.active
          ..updatedAt = now,
        Broker()
          ..remoteId = uuid.v4()
          ..brokerCode = 'MB002'
          ..fullName = 'Nguyễn Thị Lan'
          ..phone = '0912345678'
          ..email = 'lan.nguyen@kanpos.vn'
          ..cccd = '079123456002'
          ..branch = 'CN Quận 7'
          ..joinDate = DateTime(2023, 9, 1)
          ..status = BrokerStatus.active
          ..updatedAt = now,
        Broker()
          ..remoteId = uuid.v4()
          ..brokerCode = 'MB003'
          ..fullName = 'Lê Hoàng Phong'
          ..phone = '0987654321'
          ..email = 'phong.le@kanpos.vn'
          ..cccd = '079123456003'
          ..branch = 'CN Thủ Đức'
          ..joinDate = DateTime(2024, 2, 15)
          ..status = BrokerStatus.active
          ..updatedAt = now,
        Broker()
          ..remoteId = uuid.v4()
          ..brokerCode = 'MB004'
          ..fullName = 'Phạm Thị Mai'
          ..phone = '0905551234'
          ..email = 'mai.pham@kanpos.vn'
          ..cccd = '079123456004'
          ..branch = 'CN Quận 1'
          ..joinDate = DateTime(2022, 11, 20)
          ..status = BrokerStatus.active
          ..updatedAt = now,
        Broker()
          ..remoteId = uuid.v4()
          ..brokerCode = 'MB005'
          ..fullName = 'Vũ Đức Long'
          ..phone = '0933221100'
          ..email = 'long.vu@kanpos.vn'
          ..cccd = '079123456005'
          ..branch = 'CN Thủ Đức'
          ..joinDate = DateTime(2024, 6, 1)
          ..status = BrokerStatus.active
          ..updatedAt = now,
        Broker()
          ..remoteId = uuid.v4()
          ..brokerCode = 'MB006'
          ..fullName = 'Hoàng Ngọc Hà'
          ..phone = '0977889900'
          ..email = 'ha.hoang@kanpos.vn'
          ..cccd = '079123456006'
          ..branch = 'CN Quận 7'
          ..joinDate = DateTime(2023, 1, 5)
          ..status = BrokerStatus.suspended
          ..updatedAt = now,
      ];
      await isar.brokers.putAll(brokers);

      // ================= NGƯỜI BÁN =================
      final sellers = [
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Phạm Văn Dũng'
          ..phone = '0901111222'
          ..email = 'dung.pham@gmail.com'
          ..address = 'Số 12 Nguyễn Trãi, Q.5, TP.HCM'
          ..notes = 'Chủ sở hữu nhiều BĐS mặt tiền'
          ..type = CustomerType.seller
          ..updatedAt = now,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Hoàng Thị Em'
          ..phone = '0903333444'
          ..email = 'em.hoang@gmail.com'
          ..address = 'Số 45 Lê Lợi, Q.1, TP.HCM'
          ..notes = 'Bán nhà phố + đất nền Thủ Đức'
          ..type = CustomerType.seller
          ..updatedAt = now,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Công ty CP Đầu tư An Cư'
          ..phone = '02838889999'
          ..email = 'kd@ancu.com.vn'
          ..address = 'Lô A2 Khu dân cư Linh Xuân, Thủ Đức'
          ..notes = 'Khách bán doanh nghiệp - đất nền dự án'
          ..type = CustomerType.seller
          ..isVip = true
          ..updatedAt = now,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Trương Mỹ Lệ'
          ..phone = '0918777666'
          ..email = 'le.truong@gmail.com'
          ..address = 'Số 8 Phan Văn Trị, Bình Thạnh'
          ..notes = 'Bán chung cư + nhà ngõ'
          ..type = CustomerType.seller
          ..updatedAt = now,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Đoàn Quốc Cường'
          ..phone = '0988111222'
          ..email = 'cuong.doan@gmail.com'
          ..address = 'Ấp Bình Lơi, X. Trung Chánh, Củ Chi'
          ..notes = 'Bán đất vườn 500m2'
          ..type = CustomerType.seller
          ..updatedAt = now,
      ];
      await isar.customers.putAll(sellers);

      // ================= KHÁCH MUA =================
      final buyers = [
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Nguyễn Thị Hồng'
          ..phone = '0902222333'
          ..email = 'hong.nguyen@gmail.com'
          ..address = 'Số 78 Cách Mạng Tháng 8, Q.10'
          ..notes = 'Tìm chung cư 2-3PN view sông cho gia đình'
          ..type = CustomerType.buyer
          ..isVip = true
          ..demandCity = 'TP. Hồ Chí Minh'
          ..demandDistrict = 'Quận 7'
          ..demandWard = 'Phường Tân Thuận'
          ..demandArea = 'Gần cầu Phú Mỹ'
          ..demandPriceFrom = 3.5
          ..demandPriceTo = 4.5
          ..demandAreaFrom = 80
          ..demandAreaTo = 100
          ..demandPropertyType = 'Chung cư 3PN'
          ..demandDirection = 'Nam'
          ..demandLegalStatus = 'Sổ hồng'
          ..updatedAt = now,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Đặng Quốc Huy'
          ..phone = '0904444555'
          ..email = 'huy.dang@gmail.com'
          ..address = 'Số 21 Xa lộ Hà Nội, Thủ Đức'
          ..notes = 'Tìm đất nền Thủ Đức đầu tư, pháp lý sạch'
          ..type = CustomerType.buyer
          ..demandCity = 'TP. Hồ Chí Minh'
          ..demandDistrict = 'Thủ Đức'
          ..demandPriceFrom = 1.5
          ..demandPriceTo = 3.0
          ..demandAreaFrom = 90
          ..demandAreaTo = 120
          ..demandPropertyType = 'Đất nền'
          ..demandLegalStatus = 'Sổ đỏ'
          ..updatedAt = now,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Vũ Đình Khang'
          ..phone = '0906666777'
          ..email = 'khang.vu@gmail.com'
          ..address = 'Số 99 Trần Hưng Đạo, Q.1'
          ..notes = 'Doanh nhân - mua nhà mặt phố/Văn phòng, ngân sách cao'
          ..type = CustomerType.buyer
          ..isVip = true
          ..demandCity = 'TP. Hồ Chí Minh'
          ..demandDistrict = 'Quận 1'
          ..demandPriceFrom = 6.0
          ..demandPriceTo = 12.0
          ..demandAreaFrom = 50
          ..demandPropertyType = 'Nhà mặt phố'
          ..demandFrontage = 'Góc 2 mặt tiền'
          ..demandLegalStatus = 'Sổ đỏ'
          ..updatedAt = now,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Lý Thu Sương'
          ..phone = '0908888999'
          ..email = 'suong.ly@gmail.com'
          ..address = 'Số 150 Trường Chinh, Tân Bình'
          ..notes = 'Mua shophouse kinh doanh cafe'
          ..type = CustomerType.buyer
          ..demandCity = 'TP. Hồ Chí Minh'
          ..demandDistrict = 'Tân Bình'
          ..demandPriceFrom = 7.0
          ..demandPriceTo = 10.0
          ..demandAreaFrom = 60
          ..demandPropertyType = 'Shophouse'
          ..demandFrontage = 'Mặt phố'
          ..updatedAt = now,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Hồ Văn Nghĩa'
          ..phone = '0911222333'
          ..email = 'nghia.ho@gmail.com'
          ..address = 'Số 5 Quang Trung, Q.12'
          ..notes = 'Gia đình trẻ tìm nhà cấp 4 giá mềm'
          ..type = CustomerType.buyer
          ..demandCity = 'TP. Hồ Chí Minh'
          ..demandDistrict = 'Quận 12'
          ..demandPriceFrom = 2.0
          ..demandPriceTo = 3.5
          ..demandAreaFrom = 50
          ..demandAreaTo = 100
          ..demandPropertyType = 'Nhà cấp 4'
          ..updatedAt = now,
        Customer()
          ..remoteId = uuid.v4()
          ..name = 'Châu Anh Thy'
          ..phone = '0933444555'
          ..email = 'thy.chau@gmail.com'
          ..address = 'Số 300 Nguyễn Oanh, Gò Vấp'
          ..notes = 'Mua căn hộ nhỏ ở Gò Vấp, ưu tiên 1PN/Studio'
          ..type = CustomerType.buyer
          ..demandCity = 'TP. Hồ Chí Minh'
          ..demandDistrict = 'Gò Vấp'
          ..demandPriceFrom = 1.5
          ..demandPriceTo = 2.5
          ..demandAreaFrom = 40
          ..demandAreaTo = 65
          ..demandPropertyType = 'Chung cư 1PN'
          ..demandDirection = 'Đông'
          ..updatedAt = now,
      ];
      await isar.customers.putAll(buyers);

      // ================= BẤT ĐỘNG SẢN (12 - đủ 4 nhóm §8) =================
      final properties = [
        // --- Nhóm Đất ---
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0001'
          ..title = 'Đất nền khu dân cư Linh Xuân Thủ Đức'
          ..description = 'Đất nền 5x20m hạ tầng hoàn thiện, sổ đỏ riêng, '
              'cách xa lộ Hà Nội 800m'
          ..ownerId = sellers[2].remoteId
          ..brokerId = brokers[2].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Thủ Đức'
          ..ward = 'Phường Linh Xuân'
          ..area = 'Khu dân cư hiện hữu'
          ..price = 2.6
          ..areaSize = 100
          ..width = 5
          ..length = 20
          ..propertyType = 'Đất nền'
          ..legalStatus = 'Sổ đỏ'
          ..direction = 'Đông'
          ..frontage = 'Hẻm xe hơi'
          ..features = ['Gần trường', 'Gần chợ']
          ..status = PropertyStatus.sold
          ..updatedAt = now,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0002'
          ..title = 'Chung cư 3PN view sông Saigon Pearl'
          ..description = 'Căn góc 95m2, 3PN 2WC, nội thất cao cấp, '
              'view sông Sài Gòn'
          ..ownerId = sellers[3].remoteId
          ..brokerId = brokers[1].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Bình Thạnh'
          ..ward = 'Phường 22'
          ..area = 'Gần cầu Sài Gòn'
          ..price = 4.2
          ..areaSize = 95
          ..floors = 18
          ..bedrooms = 3
          ..bathrooms = 2
          ..propertyType = 'Chung cư 3PN'
          ..legalStatus = 'Sổ hồng'
          ..direction = 'Nam'
          ..frontage = 'Đường 2 chiều'
          ..features = ['Gần trường', 'Gần bệnh viện']
          ..status = PropertyStatus.deposited
          ..updatedAt = now,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0003'
          ..title = 'Nhà mặt phố Nguyễn Trãi góc 2 mặt tiền'
          ..description = 'Nhà 4 tầng mặt tiền Nguyễn Trãi, vị trí đắc địa '
              'kinh doanh văn phòng'
          ..ownerId = sellers[0].remoteId
          ..brokerId = brokers[0].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Quận 1'
          ..ward = 'Phường Nguyễn Thái Bình'
          ..area = 'Trung tâm Q1'
          ..price = 8.8
          ..areaSize = 88
          ..width = 6
          ..length = 15
          ..floors = 4
          ..bedrooms = 4
          ..bathrooms = 4
          ..propertyType = 'Nhà mặt phố'
          ..legalStatus = 'Sổ đỏ'
          ..direction = 'Tây'
          ..frontage = 'Góc 2 mặt tiền'
          ..features = ['Chính chủ', 'Góc 2 mặt tiền', 'Gần chợ']
          ..status = PropertyStatus.negotiating
          ..updatedAt = now,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0004'
          ..title = 'Đất thổ cư Gò Vấp 60m2 hẻm 5m'
          ..description = 'Đất thổ cư 60m2, hẻm 5m xe hơi, dân cư đông, '
              'gần chợ Phước Long'
          ..ownerId = sellers[1].remoteId
          ..brokerId = brokers[0].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Gò Vấp'
          ..ward = 'Phường Phước Long'
          ..area = 'Hẻm dân sinh'
          ..price = 2.2
          ..areaSize = 60
          ..width = 4
          ..length = 15
          ..propertyType = 'Đất thổ cư'
          ..legalStatus = 'Đang làm sổ'
          ..direction = 'Nam'
          ..frontage = 'Hẻm xe hơi'
          ..features = ['Gần chợ', 'Hẻm xe hơi']
          ..status = PropertyStatus.available
          ..updatedAt = now,
        // --- Nhóm Nhà ---
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0005'
          ..title = 'Biệt thự Thảo Điền sân vườn 400m2'
          ..description = 'Biệt thự 2 tầng sân vườn, hồ bơi, an ninh 24/7, '
              'khu ngoại giao Thảo Điền'
          ..ownerId = sellers[1].remoteId
          ..brokerId = brokers[2].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Thủ Đức'
          ..ward = 'Phường Thảo Điền'
          ..area = 'Khu biệt thự Thảo Điền'
          ..price = 15.0
          ..areaSize = 400
          ..width = 15
          ..length = 26
          ..floors = 2
          ..bedrooms = 5
          ..bathrooms = 6
          ..propertyType = 'Biệt thự'
          ..legalStatus = 'Sổ hồng'
          ..direction = 'Nam'
          ..frontage = 'Đường 2 chiều'
          ..features = ['Chính chủ', 'Gần trường', 'Gần bệnh viện']
          ..status = PropertyStatus.available
          ..updatedAt = now,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0006'
          ..title = 'Shophouse mặt tiền Cộng Hòa'
          ..description = 'Shophouse 3 tầng mặt tiền đường lớn, vỉa hè rộng, '
              'thích hợp kinh doanh'
          ..ownerId = sellers[0].remoteId
          ..brokerId = brokers[1].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Tân Bình'
          ..ward = 'Phường 4'
          ..area = 'Mặt tiền Cộng Hòa'
          ..price = 9.5
          ..areaSize = 75
          ..width = 5
          ..length = 15
          ..floors = 3
          ..bedrooms = 3
          ..bathrooms = 3
          ..propertyType = 'Shophouse'
          ..legalStatus = 'Sổ hồng'
          ..direction = 'Bắc'
          ..frontage = 'Mặt phố'
          ..features = ['Chính chủ', 'Gần bệnh viện']
          ..status = PropertyStatus.available
          ..updatedAt = now,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0007'
          ..title = 'Chung cư 1PN Gò Vấp view thoáng'
          ..description = 'Căn hộ 48m2 1PN 1WC, đầy đủ nội thất, '
              'phù hợp người trẻ / đầu tư'
          ..ownerId = sellers[3].remoteId
          ..brokerId = brokers[0].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Gò Vấp'
          ..ward = 'Phường 16'
          ..area = 'Gần sân bay Tân Sơn Nhất'
          ..price = 1.8
          ..areaSize = 48
          ..floors = 12
          ..bedrooms = 1
          ..bathrooms = 1
          ..propertyType = 'Chung cư 1PN'
          ..legalStatus = 'Sổ hồng'
          ..direction = 'Đông'
          ..frontage = 'Hẻm xe hơi'
          ..features = ['Gần chợ']
          ..status = PropertyStatus.available
          ..updatedAt = now,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0008'
          ..title = 'Nhà cấp 4 Quận 12 sân rộng 90m2'
          ..description = 'Nhà cấp 4 mới xây 90m2, sân để xe hơi, '
              'giá mềm khu Quang Trung'
          ..ownerId = sellers[1].remoteId
          ..brokerId = brokers[4].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Quận 12'
          ..ward = 'Phường Trung Mỹ Tây'
          ..area = 'Khu dân cư Quang Trung'
          ..price = 2.8
          ..areaSize = 90
          ..width = 6
          ..length = 15
          ..floors = 1
          ..bedrooms = 2
          ..bathrooms = 2
          ..propertyType = 'Nhà cấp 4'
          ..legalStatus = 'Hợp đồng mua bán'
          ..direction = 'Tây'
          ..frontage = 'Hẻm nhỏ'
          ..features = ['Chính chủ', 'Hẻm nhỏ']
          ..status = PropertyStatus.deposited
          ..updatedAt = now,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0009'
          ..title = 'Nhà ngõ Bình Thạnh 3 tầng hẻm xe hơi'
          ..description = 'Nhà 3 tầng 65m2, hẻm 5m ô tô đỗ cửa, '
              'gần chợ Ba Cuờng'
          ..ownerId = sellers[3].remoteId
          ..brokerId = brokers[3].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Bình Thạnh'
          ..ward = 'Phường 17'
          ..area = 'Hẻm xe hơi'
          ..price = 4.5
          ..areaSize = 65
          ..width = 4.5
          ..length = 14.5
          ..floors = 3
          ..bedrooms = 3
          ..bathrooms = 3
          ..propertyType = 'Nhà ngõ'
          ..legalStatus = 'Sổ hồng'
          ..direction = 'Nam'
          ..frontage = 'Hẻm xe hơi'
          ..features = ['Gần chợ', 'Gần trường']
          ..status = PropertyStatus.sold
          ..updatedAt = now,
        // --- Nhóm Mặt bằng ---
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0010'
          ..title = 'Văn phòng nguyên block Lê Lợi Q1'
          ..description = 'Sàn văn phòng 220m2 nguyên block tòa nhà hạng B, '
              'thang máy riêng'
          ..ownerId = sellers[0].remoteId
          ..brokerId = brokers[3].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Quận 1'
          ..ward = 'Phường Bến Nghé'
          ..area = 'Trung tâm Q1'
          ..price = 11.0
          ..areaSize = 220
          ..floors = 8
          ..bedrooms = 0
          ..bathrooms = 2
          ..propertyType = 'Văn phòng'
          ..legalStatus = 'Sổ đỏ'
          ..direction = 'Bắc'
          ..frontage = 'Đường 1 chiều'
          ..features = ['Gần chợ']
          ..status = PropertyStatus.available
          ..updatedAt = now,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0011'
          ..title = 'Đất vườn Củ Chi 500m2 trồng cây ăn trái'
          ..description = 'Đất vườn 500m2 đang trồng sầu riêng, '
              'có giếng khoan + điện'
          ..ownerId = sellers[4].remoteId
          ..brokerId = brokers[2].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Củ Chi'
          ..ward = 'Xã Trung Chánh'
          ..area = 'Vùng nông thôn'
          ..price = 3.2
          ..areaSize = 500
          ..width = 20
          ..length = 25
          ..propertyType = 'Đất vườn'
          ..legalStatus = 'Sổ đỏ'
          ..direction = 'Đông Nam'
          ..frontage = 'Hẻm xe hơi'
          ..features = ['Chính chủ']
          ..status = PropertyStatus.available
          ..updatedAt = now,
        BdsProperty()
          ..remoteId = uuid.v4()
          ..propertyCode = 'BDS0012'
          ..title = 'Chung cư Studio Bình Thạnh giá đầu tư'
          ..description = 'Căn hộ Studio 32m2 full nội thất, dòng tiền '
              'cho thuê 8 triệu/tháng'
          ..ownerId = sellers[3].remoteId
          ..brokerId = brokers[1].remoteId
          ..province = 'TP. Hồ Chí Minh'
          ..district = 'Bình Thạnh'
          ..ward = 'Phường 25'
          ..area = 'Gần Đại học Mở'
          ..price = 1.6
          ..areaSize = 32
          ..floors = 10
          ..bedrooms = 1
          ..bathrooms = 1
          ..propertyType = 'Chung cư Studio'
          ..legalStatus = 'Sổ hồng'
          ..direction = 'Tây Nam'
          ..frontage = 'Hẻm nhỏ'
          ..features = ['Gần trường']
          ..status = PropertyStatus.available
          ..updatedAt = now,
      ];
      await isar.propertys.putAll(properties);

      // ================= GIAO DỊCH (13 - đủ 5 trạng thái §12) =================
      TransactionRecord tx(
        String code,
        int daysAgo,
        dynamic seller,
        dynamic buyer,
        dynamic prop,
        dynamic broker,
        double asking,
        double? finalP,
        double comm,
        double fee,
        TransactionStatus st, {
        double? rate,
        double? bonus,
        double? deduction,
        String? notes,
      }) =>
          TransactionRecord()
            ..remoteId = uuid.v4()
            ..transactionCode = code
            ..transactionDate = _ago(daysAgo)
            ..sellerId = seller.remoteId as String?
            ..buyerId = buyer.remoteId as String?
            ..propertyId = prop.propertyCode as String?
            ..brokerId = broker.remoteId as String?
            ..askingPrice = asking
            ..finalPrice = finalP
            ..commission = comm
            ..floorFee = fee
            ..commissionRate = rate
            ..brokerBonus = bonus
            ..brokerDeduction = deduction
            ..notes = notes
            ..status = st
            ..updatedAt = now;

      final transactions = [
        tx('GD0001', 182, sellers[2], buyers[1], properties[0], brokers[2],
            2.75, 2.6, 0.078, 0.039, TransactionStatus.completed,
            rate: 40, bonus: 0.005, notes: 'Khách thanh toán đủ 100%'),
        tx('GD0002', 165, sellers[3], buyers[4], properties[8], brokers[3],
            4.6, 4.35, 0.130, 0.065, TransactionStatus.completed,
            rate: 45, bonus: 0.010, deduction: 0.005,
            notes: 'Khách mua ở thật, hỗ trợ vay ngân hàng'),
        tx('GD0003', 120, sellers[1], buyers[5], properties[3], brokers[0],
            2.3, 2.15, 0.065, 0.032, TransactionStatus.completed,
            rate: 35, notes: 'Đang làm sổ, hoàn tất sau 30 ngày'),
        tx('GD0004', 92, sellers[1], buyers[4], properties[7], brokers[4],
            2.85, 2.72, 0.082, 0.041, TransactionStatus.notarized,
            rate: 40, bonus: 0.005,
            notes: 'Đã công chứng, chờ sang tên'),
        tx('GD0005', 76, sellers[0], buyers[2], properties[9], brokers[3],
            11.0, 10.5, 0.315, 0.157, TransactionStatus.cancelled,
            notes: 'Khách đổi ý mua tòa nhà khác, mất cọc 500 triệu'),
        tx('GD0006', 61, sellers[0], buyers[2], properties[2], brokers[0],
            9.0, 8.5, 0.255, 0.128, TransactionStatus.negotiating,
            notes: 'Đang thương lượng giá, khách muốn trả góp'),
        tx('GD0007', 45, sellers[0], buyers[3], properties[5], brokers[1],
            9.5, 9.2, 0.276, 0.138, TransactionStatus.deposited,
            notes: 'Đặt cọc 1 tỷ, dự kiến công chứng tháng sau'),
        tx('GD0008', 30, sellers[1], buyers[2], properties[4], brokers[4],
            15.5, 15.0, 0.450, 0.225, TransactionStatus.negotiating,
            notes: 'Khách VIP xem nhà 3 lần, đang đàm phán khấu trừ nội thất'),
        tx('GD0009', 20, sellers[3], buyers[5], properties[6], brokers[0],
            1.85, 1.78, 0.053, 0.027, TransactionStatus.notarized,
            rate: 35, notes: 'Đã công chứng, hẹn bàn giao cuối tháng'),
        tx('GD0010', 12, sellers[3], buyers[5], properties[11], brokers[1],
            1.6, 1.55, 0.047, 0.023, TransactionStatus.deposited,
            notes: 'Đặt cọc 200 triệu giữ chỗ'),
        tx('GD0011', 7, sellers[4], buyers[1], properties[10], brokers[2],
            3.3, 3.15, 0.095, 0.047, TransactionStatus.negotiating,
            notes: 'Khách định giá lại cây sầu riêng'),
        tx('GD0012', 3, sellers[3], buyers[0], properties[1], brokers[1],
            4.4, 4.25, 0.128, 0.064, TransactionStatus.deposited,
            rate: 40, notes: 'Đặt cọc 500 triệu, khách VIP ưu tiên ký nhanh'),
        tx('GD0013', 0, sellers[0], buyers[2], properties[9], brokers[3],
            11.0, 10.8, 0.324, 0.162, TransactionStatus.deposited,
            rate: 50, bonus: 0.020, deduction: 0.010,
            notes: 'Hôm nay khách đặt cọc 1.2 tỷ văn phòng Lê Lợi'),
      ];
      await isar.transactionRecords.putAll(transactions);

      // ================= PHÍ SÀN (§14) =================
      FloorFee fee(String code, int daysAgo, FloorFeeType type, double amount,
              {String? gd, String? notes}) =>
          FloorFee()
            ..remoteId = uuid.v4()
            ..feeCode = code
            ..feeDate = _ago(daysAgo)
            ..feeType = type
            ..amount = amount
            ..transactionCode = gd
            ..notes = notes
            ..updatedAt = now;

      final fees = [
        fee('PFS0001', 182, FloorFeeType.transaction, 0.039,
            gd: 'GD0001', notes: 'Phí giao dịch đất nền Linh Xuân'),
        fee('PFS0002', 182, FloorFeeType.document, 0.005,
            gd: 'GD0001', notes: 'Phí hồ sơ công chứng'),
        fee('PFS0003', 90, FloorFeeType.advertising, 0.020,
            notes: 'Quảng cáo sàn trên batdongsan.com 3 tháng'),
        fee('PFS0004', 58, FloorFeeType.service, 0.015,
            gd: 'GD0006', notes: 'Dịch vụ thẩm định pháp lý'),
        fee('PFS0005', 20, FloorFeeType.document, 0.004,
            gd: 'GD0009', notes: 'Phí hồ sơ sang tên'),
        fee('PFS0006', 15, FloorFeeType.advertising, 0.008,
            notes: 'Đăng tin biệt thự Thảo Điền BDS0005'),
        fee('PFS0007', 10, FloorFeeType.other, 0.012,
            notes: 'Chi phí flycam chụp ảnh biệt thự BDS0005'),
        fee('PFS0008', 3, FloorFeeType.transaction, 0.064,
            gd: 'GD0012', notes: 'Phí giao dịch căn hộ Q7'),
        fee('PFS0009', 0, FloorFeeType.service, 0.020,
            gd: 'GD0013', notes: 'Phí dịch vụ môi giới thuê ngoài'),
        fee('PFS0010', 0, FloorFeeType.other, 0.006,
            gd: 'GD0013', notes: 'Chi phí công chứng hôm nay'),
      ];
      await isar.floorFees.putAll(fees);
    });
  }
}
