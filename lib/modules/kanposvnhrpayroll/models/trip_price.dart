import 'package:isar/isar.dart';

part 'trip_price.g.dart';

/// Bảng giá lương chuyến (bảng lương chuyến) theo NHÓM TẢI TRỌNG + MÃ TUYẾN.
/// Nguồn tham khảo: file "BẢNG LƯƠNG CHUYẾN" của Công ty CP Vận tải HEO VÀNG
/// (sheets BL.3.5T / BL.5T / BL.8T).
///
/// Mỗi dòng = 1 mức giá cho 1 nhóm tải trọng xe trên 1 tuyến (mã chuyến).
/// Lương chuyến của 1 chuyến = giá tra theo tải trọng xe + nơi giao hàng.
@collection
class TripPrice {
  Id id = Isar.autoIncrement;

  /// Nhóm tải trọng xe: "3.5T", "5T", "8T", "15T", "HT" (xe tải lớn / đầu kéo).
  @Index(composite: [CompositeIndex('routeCode')])
  late String capacityBucket;

  /// Mã chuyến / mã tuyến (VD: "HCM", "BD", "DN", "GL", "NTG", ...).
  late String routeCode;

  /// Tên nơi giao hàng (VD: "TP.HCM", "Bình Dương", "Gia Lai", "Nha Trang").
  late String routeName;

  /// Đơn giá lương chuyến (VNĐ/chuyến).
  double price = 0;

  /// Thứ tự sắp xếp hiển thị trong bảng giá.
  int sortOrder = 0;

  bool inactive = false;

  // Sync
  String? remoteId;
  DateTime? lastSyncAt;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
