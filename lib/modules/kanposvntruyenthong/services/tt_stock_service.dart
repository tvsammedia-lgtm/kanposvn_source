import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/tt_finance.dart';
import '../models/tt_product.dart';
import '../models/tt_stock.dart';

/// Nghiệp vụ kho: tạo phiếu xuất kho (Hao hụt / Hư hỏng / Sử dụng nội bộ).
///
/// Quy tắc nghiệp vụ theo đặc tả:
/// - Trừ tồn kho theo **FIFO** với giá vốn thực tế của từng lô.
/// - Ghi StockIssue + StockMovement tương ứng (WASTE / DAMAGE / INTERNAL_USE).
/// - Với WASTE / DAMAGE: tự hạch toán Expense vào nhóm "Hao hụt/hư hỏng"
///   để chi phí hao hụt được tính vào báo cáo P&L (cân đối DT - CP).
/// - Nếu tồn kho không đủ: throw StateError và hủy toàn bộ giao dịch (atomic).
class TtStockService {
  TtStockService(this.db);

  final Isar db;

  Future<TtStockIssue> createStockIssue({
    required TtProduct product,
    required double qty,
    required TtIssueType issueType,
    String? note,
  }) async {
    final uuid = const Uuid();
    final now = DateTime.now();

    if (qty <= 0) {
      throw StateError('Số lượng xuất phải lớn hơn 0');
    }

    final issue = TtStockIssue()
      ..issueId = uuid.v4()
      ..issueNumber = 'XK${(await db.ttStockIssues.count()) + 1}'
      ..issueType = issueType
      ..date = now
      ..note = note?.trim() ?? ''
      ..totalCost = 0
      ..createdBy = 'inventory';

    double totalCost = 0;
    double remaining = qty;
    final movements = <TtStockMovement>[];

    await db.writeTxn(() async {
      await db.ttStockIssues.put(issue);

      // Trừ lô theo FIFO (giá vốn thực tế từng lô)
      final lots = await db.ttStockLots.filter()
          .product((p) => p.idEqualTo(product.id))
          .quantityRemainingGreaterThan(0)
          .sortByPurchaseDate()
          .findAll();

      for (final lot in lots) {
        if (remaining <= 0) break;
        final take = lot.quantityRemaining < remaining ? lot.quantityRemaining : remaining;
        lot.quantityOut += take;
        lot.quantityRemaining -= take;
        remaining -= take;
        totalCost += take * lot.unitCost;
        await db.ttStockLots.put(lot);

        movements.add(TtStockMovement()
          ..movementId = uuid.v4()
          ..product.value = product
          ..lot.value = lot
          ..movementType = issueType == TtIssueType.WASTE
              ? TtMovementType.WASTE
              : issueType == TtIssueType.DAMAGE
                  ? TtMovementType.DAMAGE
                  : TtMovementType.INTERNAL_USE
          ..referenceId = issue.issueNumber
          ..quantity = -take
          ..unitCost = lot.unitCost
          ..totalCost = take * lot.unitCost
          ..createdAt = now);
      }

      if (remaining > 0) {
        throw StateError(
            'Tồn kho ${product.name} không đủ: còn thiếu ${remaining.toStringAsFixed(1)} ${product.saleUnit}');
      }

      issue.totalCost = totalCost;
      await db.ttStockIssues.put(issue);

      await db.ttStockMovements.putAll(movements);
      for (final m in movements) {
        await m.product.save();
        await m.lot.save();
      }

      // Hao hụt/hư hỏng là một khoản chi phí (đưa vào báo cáo chi phí & P&L)
      if (issueType == TtIssueType.WASTE || issueType == TtIssueType.DAMAGE) {
        final wasteCats = await db.ttExpenseCategorys.where().findAll();
        TtExpenseCategory? wasteCat;
        for (final c in wasteCats) {
          final n = c.name.toLowerCase();
          if (n.contains('hao hụt') || n.contains('hư hỏng')) {
            wasteCat = c;
            break;
          }
        }
        if (wasteCat != null) {
          final exp = TtExpense()
            ..expenseId = uuid.v4()
            ..expenseNumber = 'PC${(await db.ttExpenses.count()) + 1}'
            ..category.value = wasteCat
            ..amount = totalCost
            ..paymentMethod = 'Nội bộ'
            ..date = now
            ..description = 'Hao hụt/hư hỏng ${issue.issueNumber}'
            ..createdBy = 'inventory';
          await db.ttExpenses.put(exp);
          await exp.category.save();
        }
      }
    });

    return issue;
  }
}