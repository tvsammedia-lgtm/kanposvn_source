import 'package:isar/isar.dart';

import '../models/account.dart';
import '../models/account_default.dart';
import '../models/accounting_entry.dart';

/// Bộ dữ liệu kế toán mẫu cho module Trạm Xăng (TT133 / NĐ 123-2020).
///
/// Gồm: hệ thống tài khoản (Chart of Accounts) của trạm xăng, tài khoản
/// mặc định theo loại chứng từ và BÚT TOÁN MẪU về MUA & BÁN XĂNG DẦU:
///
///  • MUA xăng dầu nhập kho (chịu NCC):
///      Nợ 1561 (giá mua) + Nợ 1331 (VAT đầu vào) / Có 331 (phải trả NCC).
///  • BÁN xăng dầu thu tiền mặt:
///      Nợ 1111 (tiền mặt)                              / Có 5111 (doanh thu) + 3331 (VAT).
///  • KẾT CHUYỂN GIÁ VỐN:
///      Nợ 632 (giá vốn) / Có 1561 (xuất kho).
/// Mọi bút toán tuân thủ: Tổng Nợ = Tổng Có.
class TramXangAccountSeedData {
  static (List<TramXangAccount>, List<TramXangAccountDefault>, List<TramXangAccountingEntry>, List<TramXangAccountingEntryLine>)
      _build() {
    // ---------- CHART OF ACCOUNTS ----------
    final accounts = <TramXangAccount>[
      _acct('111', 'Tiền mặt', 'Cash in hand', 1, null, true, TramXangAccountCategoryKind.balanceSheet),
      _acct('1111', 'Tiền Việt Nam', 'Vietnam dong', 2, 1, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('112', 'Tiền gửi Ngân hàng', 'Cash in bank', 1, null, true, TramXangAccountCategoryKind.balanceSheet),
      _acct('1121', 'Tiền Việt Nam', 'Vietnam dong', 2, 3, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('131', 'Phải thu của khách hàng', 'Accounts receivable', 1, null, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('133', 'Thuế GTGT được khấu trừ', 'Input VAT', 1, null, true, TramXangAccountCategoryKind.balanceSheet),
      _acct('1331', 'Thuế GTGT được khấu trừ của HHDV', 'Input VAT on goods', 2, 6, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('141', 'Tạm ứng', 'Advances', 1, null, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('151', 'Hàng mua đang đi đường', 'Goods in transit', 1, null, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('156', 'Hàng hóa', 'Merchandise', 1, null, true, TramXangAccountCategoryKind.balanceSheet),
      _acct('1561', 'Giá mua hàng hóa (xăng dầu)', 'Fuel inventory cost', 2, 10, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('211', 'Tài sản cố định hữu hình', 'Tangible fixed assets', 1, null, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('214', 'Hao mòn TSCĐ', 'Accumulated depreciation', 1, null, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('331', 'Phải trả người bán', 'Accounts payable', 1, null, false, TramXangAccountCategoryKind.offBalanceSheet),
      _acct('333', 'Thuế và các khoản phải nộp NS', 'Taxes payable', 1, null, true, TramXangAccountCategoryKind.offBalanceSheet),
      _acct('3331', 'Thuế GTGT đầu ra', 'Output VAT payable', 2, 15, false, TramXangAccountCategoryKind.offBalanceSheet),
      _acct('334', 'Phải trả người lao động', 'Payable to employees', 1, null, false, TramXangAccountCategoryKind.offBalanceSheet),
      _acct('338', 'Phải trả, phải nộp khác', 'Other payable', 1, null, false, TramXangAccountCategoryKind.offBalanceSheet),
      _acct('411', 'Vốn đầu tư của chủ sở hữu', 'Owner equity', 1, null, false, TramXangAccountCategoryKind.offBalanceSheet),
      _acct('421', 'Lợi nhuận chưa phân phối', 'Retained earnings', 1, null, false, TramXangAccountCategoryKind.offBalanceSheet),
      _acct('511', 'Doanh thu bán hàng & cung cấp DV', 'Sales revenue', 1, null, true, TramXangAccountCategoryKind.balanceSheet),
      _acct('5111', 'Doanh thu bán hàng hóa', 'Revenue from goods', 2, 21, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('515', 'Doanh thu hoạt động tài chính', 'Financial income', 1, null, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('632', 'Giá vốn hàng bán', 'Cost of goods sold', 1, null, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('642', 'Chi phí quản lý DN', 'General & admin expenses', 1, null, true, TramXangAccountCategoryKind.balanceSheet),
      _acct('6422', 'Chi phí quản lý DN', 'G&A expenses', 2, 25, false, TramXangAccountCategoryKind.balanceSheet),
      _acct('911', 'Xác định kết quả kinh doanh', 'Income determination', 1, null, false, TramXangAccountCategoryKind.balanceSheet),
    ];

    // ---------- ACCOUNT DEFAULTS ----------
    final defaults = <TramXangAccountDefault>[
      _def(1550, 'Mua xăng dầu nhập kho (chịu)', 'FuelPurchase', '1561', '331',
          crossDebit: '1331'),
      _def(1551, 'Mua xăng dầu trả tiền mặt', 'FuelPurchase', '1561', '1111',
          crossDebit: '1331'),
      _def(1552, 'Mua xăng dầu trả ngân hàng', 'FuelPurchase', '1561', '1121',
          crossDebit: '1331'),
      _def(1111, 'Bán xăng dầu thu tiền mặt', 'FuelSale', '1111', '5111',
          crossCredit: '3331'),
      _def(1122, 'Bán xăng dầu thu chuyển khoản/QR', 'FuelSale', '1121', '5111',
          crossCredit: '3331'),
      _def(1311, 'Bán xăng dầu chịu (công nợ)', 'FuelSale', '131', '5111',
          crossCredit: '3331'),
      _def(6321, 'Kết chuyển giá vốn hàng bán', 'FuelCost', '632', '1561'),
      _def(4010, 'Nghiệp vụ khác', 'GLVoucher', '6422', '1111'),
      _def(4011, 'Thu khác / thu nợ khách hàng', 'GLVoucher', '1111', '131'),
    ];

    // ---------- BÚT TOÁN MẪU MUA / BÁN XĂNG DẦU ----------
    // MUA 5.000 L Xăng RON95-III giá 22.000 đ/L — chịu NCC Petrolimex.
    final muaJournal = 'JRN-MAU-MUA-RON95';
    final mua = TramXangAccountingEntry()
      ..voucherNumber = 'MUA-2026/09-001'
      ..journalID = muaJournal
      ..year = 2026
      ..month = 9
      ..entryType = TramXangEntryType.fuelPurchase
      ..status = TramXangEntryStatus.posted
      ..postingDate = DateTime(2026, 9, 1, 8)
      ..documentDate = DateTime(2026, 9, 1)
      ..postedDate = DateTime(2026, 9, 1, 8)
      ..refType = 1550
      ..description = 'Mua 5.000 L Xăng RON95-III @22.000 (chịu Petrolimex)'
      ..objectCode = 'sup_petrolimex'
      ..objectName = 'Tổng Công ty Xăng dầu Petrolimex'
      ..totalDebit = 121000000
      ..totalCredit = 121000000
      ..paymentMethod = 'debt'
      ..isAutoGenerated = false;

    // BÁN 3.000 L Xăng RON95-III giá 23.500 đ/L — thu tiền mặt.
    final banJournal = 'JRN-MAU-BAN-RON95';
    final ban = TramXangAccountingEntry()
      ..voucherNumber = 'HD-2026/09-001'
      ..journalID = banJournal
      ..year = 2026
      ..month = 9
      ..entryType = TramXangEntryType.fuelSale
      ..status = TramXangEntryStatus.posted
      ..postingDate = DateTime(2026, 9, 2, 10)
      ..documentDate = DateTime(2026, 9, 2)
      ..postedDate = DateTime(2026, 9, 2, 10)
      ..refType = 1111
      ..description = 'Bán 3.000 L Xăng RON95-III @23.500 thu tiền mặt'
      ..objectCode = 'cust_le'
      ..objectName = 'Khách lẻ'
      ..totalDebit = 77550000
      ..totalCredit = 77550000
      ..paymentMethod = 'cash'
      ..isAutoGenerated = false;

    // KẾT CHUYỂN GIÁ VỐN 3.000 L @22.000 = 66.000.000 đ.
    final gvJournal = 'JRN-MAU-GV-RON95';
    final gv = TramXangAccountingEntry()
      ..voucherNumber = 'GV-2026/09-001'
      ..journalID = gvJournal
      ..year = 2026
      ..month = 9
      ..entryType = TramXangEntryType.fuelCost
      ..status = TramXangEntryStatus.posted
      ..postingDate = DateTime(2026, 9, 2, 10)
      ..documentDate = DateTime(2026, 9, 2)
      ..postedDate = DateTime(2026, 9, 2, 10)
      ..refType = 6321
      ..description = 'Kết chuyển giá vốn 3.000 L Xăng RON95-III @22.000'
      ..totalDebit = 66000000
      ..totalCredit = 66000000
      ..isAutoGenerated = false;

    final entries = [mua, ban, gv];
    final lines = <TramXangAccountingEntryLine>[
      _ln(muaJournal, 0, debit: '1561', amount: 110000000, desc: 'Giá mua 5.000 L xăng chưa thuế'),
      _ln(muaJournal, 1, debit: '1331', amount: 11000000, desc: 'Thuế GTGT đầu vào'),
      _ln(muaJournal, 2, credit: '331', amount: 121000000, desc: 'Phải trả Petrolimex'),
      _ln(banJournal, 0, debit: '1111', amount: 77550000, desc: 'Thu tiền mặt bán hàng'),
      _ln(banJournal, 1, credit: '5111', amount: 70500000, desc: 'Doanh thu bán xăng chưa thuế'),
      _ln(banJournal, 2, credit: '3331', amount: 7050000, desc: 'Thuế GTGT đầu ra'),
      _ln(gvJournal, 0, debit: '632', amount: 66000000, desc: 'Giá vốn hàng bán'),
      _ln(gvJournal, 1, credit: '1561', amount: 66000000, desc: 'Xuất kho xăng dầu'),
    ];

    return (accounts, defaults, entries, lines);
  }

  static Future<void> seedAccountsAndEntries(Isar isar) async {
    if (await isar.tramXangAccounts.count() > 0) return;
    final (accounts, defaults, entries, lines) = _build();
    await isar.writeTxn(() async {
      await isar.tramXangAccounts.putAll(accounts);
      await isar.tramXangAccountDefaults.putAll(defaults);
      await isar.tramXangAccountingEntrys.putAll(entries);
      await isar.tramXangAccountingEntryLines.putAll(lines);
    });
  }

  static TramXangAccount _acct(
    String number,
    String name,
    String? english,
    int grade,
    int? parentId,
    bool isParent,
    TramXangAccountCategoryKind kind,
  ) {
    return TramXangAccount()
      ..accountNumber = number
      ..accountName = name
      ..accountNameEnglish = english
      ..grade = grade
      ..parentId = parentId
      ..isParent = isParent
      ..accountCategoryKind = kind;
  }

  static TramXangAccountDefault _def(
    int refType,
    String name,
    String voucherType,
    String debit,
    String credit, {
    String? crossDebit,
    String? crossCredit,
  }) {
    return TramXangAccountDefault()
      ..refType = refType
      ..refTypeName = name
      ..voucherType = voucherType
      ..defaultDebitAccount = debit
      ..defaultCreditAccount = credit
      ..crossDebitAccount = crossDebit
      ..crossCreditAccount = crossCredit;
  }

  static TramXangAccountingEntryLine _ln(
    String journalID,
    int order, {
    String debit = '',
    String credit = '',
    required double amount,
    String? desc,
    String? objectCode,
    String? objectName,
  }) {
    return TramXangAccountingEntryLine()
      ..journalID = journalID
      ..lineOrder = order
      ..debitAccountNumber = debit
      ..creditAccountNumber = credit
      ..amount = amount
      ..description = desc
      ..objectCode = objectCode
      ..objectName = objectName;
  }
}