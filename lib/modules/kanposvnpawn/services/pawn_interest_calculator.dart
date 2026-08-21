import '../models/pawn_contract.dart';

class PawnInterestCalculator {
  /// Tính tiền lãi theo hợp đồng cầm đồ.
  ///
  /// Công thức (theo spec §13):
  /// - Theo ngày:  Tiền lãi = Tiền cầm × Lãi suất% × Số ngày
  /// - Theo tháng: Tiền lãi = Tiền cầm × Lãi suất%/tháng × Số tháng
  /// - Theo năm:   Tiền lãi = Tiền cầm × Lãi suất%/năm × Số năm
  /// - Lãi cố định:  entered as a flat amount per period
  /// - Theo dư nợ giảm dần: interest on remaining principal after each payment
  static double calculateInterest({
    required double pawnAmount,
    required double interestRate,
    required InterestType interestType,
    required int numberOfDays,
  }) {
    if (pawnAmount <= 0 || interestRate <= 0 || numberOfDays <= 0) return 0;

    switch (interestType) {
      case InterestType.daily:
        return pawnAmount * (interestRate / 100) * numberOfDays;

      case InterestType.monthly:
        final months = numberOfDays / 30.0;
        return pawnAmount * (interestRate / 100) * months;

      case InterestType.yearly:
        final years = numberOfDays / 365.0;
        return pawnAmount * (interestRate / 100) * years;

      case InterestType.fixedAmount:
        final periods = (numberOfDays / 30.0).ceil();
        return interestRate * periods;

      case InterestType.decliningBalance:
        final months = (numberOfDays / 30.0).ceil();
        double balance = pawnAmount;
        double totalInterest = 0;
        for (int i = 0; i < months; i++) {
          final monthInterest = balance * (interestRate / 100);
          totalInterest += monthInterest;
          balance -= (pawnAmount / months);
        }
        return totalInterest;
    }
  }

  /// Tính số ngày từ ngày cầm đến ngày đáo hạn.
  static int daysBetween(DateTime from, DateTime to) {
    final f = DateTime(from.year, from.month, from.day);
    final t = DateTime(to.year, to.month, to.day);
    return t.difference(f).inDays;
  }

  /// Tính số ngày từ ngày cầm đến hôm nay.
  static int daysSincePawn(DateTime pawnDate) {
    return daysBetween(pawnDate, DateTime.now());
  }

  /// Tính số ngày quá hạn.
  static int overdueDays(DateTime dueDate) {
    final now = DateTime.now();
    if (now.isAfter(dueDate)) {
      return daysBetween(dueDate, now);
    }
    return 0;
  }

  /// Tính tổng lãi suất đến hiện tại (kể từ lần thu lãi cuối).
  static double currentInterest({
    required PawnContract contract,
  }) {
    final pawnAmount = contract.pawnAmount ?? 0;
    final rate = contract.interestRate ?? 0;
    final type = contract.interestType;
    final lastCollection = contract.lastInterestCollectionDate ?? contract.pawnDate;
    if (lastCollection == null) return 0;
    final days = daysBetween(lastCollection, DateTime.now());
    return calculateInterest(
      pawnAmount: pawnAmount,
      interestRate: rate,
      interestType: type,
      numberOfDays: days,
    );
  }

  /// Tính số tiền phải trả để chuộc (gốc + lãi còn lại).
  static double redemptionAmount({
    required PawnContract contract,
  }) {
    final pawnAmount = contract.pawnAmount ?? 0;
    final unpaidInterest = currentInterest(contract: contract) - (contract.paidInterest ?? 0);
    return pawnAmount + unpaidInterest.clamp(0, double.infinity);
  }

  /// Tính ngày đáo hạn mới sau khi gia hạn (cộng thêm số tháng).
  static DateTime extendDueDate(DateTime currentDueDate, int months) {
    return DateTime(
      currentDueDate.year,
      currentDueDate.month + months,
      currentDueDate.day,
    );
  }

  /// Format số tiền VND.
  static String formatVnd(double amount) {
    final formatted = amount.toStringAsFixed(0);
    final buffer = StringBuffer();
    for (int i = 0; i < formatted.length; i++) {
      if (i > 0 && (formatted.length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(formatted[i]);
    }
    return '$bufferđ';
  }

  /// Format ngày dd/MM/yyyy.
  static String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
