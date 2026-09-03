/// Biến thể demo data theo CHI NHÁNH.
///
/// Mô hình 1 module = nhiều chi nhánh: mỗi chi nhánh (xác định qua `branchId`)
/// nên có bộ demo data riêng để màn hình admin phân biệt được từng nhánh
/// (doanh thu, công nợ khác nhau). `branchId` là UUID ổn định → ta băm nó ra
/// một chỉ số cố định, rồi suy ra nhãn (A..H) và hệ số nhân tiền cho chi nhánh.
class BranchVariant {
  final int index;
  final String label;
  final double multiplier;

  const BranchVariant({
    required this.index,
    required this.label,
    required this.multiplier,
  });

  /// Nhánh không có `branchId` (cửa hàng 1 chi nhánh) — không áp biến thể.
  static const BranchVariant none = BranchVariant(
    index: 0,
    label: '',
    multiplier: 1.0,
  );

  static const List<String> _labels = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
  ];

  /// 8 hệ số nhân tiền cố định, xoay vòng theo index để mỗi chi nhánh có
  /// doanh thu / công nợ khác nhau (nhưng không quá chênh lệch).
  static const List<double> _multipliers = [
    1.0, 1.35, 0.8, 1.6, 1.15, 0.7, 1.45, 0.9,
  ];

  factory BranchVariant.fromBranchId(String? branchId) {
    if (branchId == null || branchId.trim().isEmpty) return none;
    final h = _hash(branchId.trim());
    final index = h % _labels.length;
    return BranchVariant(
      index: index,
      label: _labels[index],
      multiplier: _multipliers[index],
    );
  }

  static int _hash(String s) {
    var h = 0;
    for (var i = 0; i < s.length; i++) {
      h = (h * 31 + s.codeUnitAt(i)) & 0x7fffffff;
    }
    return h;
  }

  /// Định dạng mã/hiệu cho một entity theo chi nhánh (vd "RO-A-1000001").
  String codeWith(String code) {
    if (index == 0) return code;
    final slash = code.lastIndexOf('-');
    if (slash <= 0 || slash == code.length - 1) return '$code-$label';
    final base = code.substring(0, slash);
    final num = code.substring(slash + 1);
    return '$base-$label-$num';
  }

  /// Làm tròn tiền sau khi nhân hệ số để số nhìn gọn.
  double scale(double value) => (value * multiplier).roundToDouble();

  int scaleInt(int value) => (value * multiplier).round();
}
