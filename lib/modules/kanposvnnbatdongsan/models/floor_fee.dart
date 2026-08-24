import 'package:isar/isar.dart';

part 'floor_fee.g.dart';

/// Phí sàn theo PRD mục 14.
///
/// - transaction / advertising / service / document: khoản SÀN THU.
/// - other ("Chi phí khác"): khoản SÀN CHI → dùng cho báo cáo lợi nhuận.
@collection
class FloorFee {
  Id id = Isar.autoIncrement;
  DateTime? deletedAt;
  String deviceId = "";

  @Index(unique: true, replace: true)
  String? remoteId;

  String? feeCode; // PFS0001

  @Enumerated(EnumType.name)
  FloorFeeType feeType = FloorFeeType.transaction;

  double? amount;
  DateTime? feeDate;
  String? transactionCode; // Gắn với giao dịch (tuỳ chọn)
  String? notes;

  // Sync details
  DateTime? updatedAt;
  int? version;
  bool isSynced = false;
}

enum FloorFeeType {
  transaction, // Phí giao dịch
  advertising, // Phí quảng cáo
  service, // Phí dịch vụ
  document, // Phí hồ sơ
  other, // Chi phí khác (chi)
}

extension FloorFeeTypeX on FloorFeeType {
  String get label {
    switch (this) {
      case FloorFeeType.transaction:
        return 'Phí giao dịch';
      case FloorFeeType.advertising:
        return 'Phí quảng cáo';
      case FloorFeeType.service:
        return 'Phí dịch vụ';
      case FloorFeeType.document:
        return 'Phí hồ sơ';
      case FloorFeeType.other:
        return 'Chi phí khác';
    }
  }

  /// Khoản thu (false) hay chi phí (true).
  bool get isExpense => this == FloorFeeType.other;
}
