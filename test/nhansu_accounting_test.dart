import 'package:flutter_test/flutter_test.dart';
import 'package:kanposvn/modules/nhansu/models/accounting_model.dart';

void main() {
  group('NhanSuAccount', () {
    test('toJson/fromJson roundtrip', () {
      final acc = NhanSuAccount(
        id: 'ACC-001',
        code: '6422',
        name: 'Chi phí lương NSDLĐ',
        group: '6',
        isActive: true,
        isDebit: true,
      );
      final json = acc.toJson();
      final restored = NhanSuAccount.fromJson(json);

      expect(restored.id, 'ACC-001');
      expect(restored.code, '6422');
      expect(restored.name, 'Chi phí lương NSDLĐ');
      expect(restored.group, '6');
      expect(restored.isActive, true);
      expect(restored.isDebit, true);
    });

    test('copyWith preserves unchanged fields', () {
      final acc = NhanSuAccount(
        id: 'ACC-002',
        code: '334',
        name: 'BHXH phải nộp',
        group: '3',
      );
      final updated = acc.copyWith(name: 'BHXH, BHYT, BHTN phải nộp');

      expect(updated.id, 'ACC-002');
      expect(updated.code, '334');
      expect(updated.name, 'BHXH, BHYT, BHTN phải nộp');
      expect(updated.group, '3');
    });

    test('default values', () {
      final json = <String, dynamic>{'id': 'X', 'code': '111', 'name': 'TM', 'group': '1'};
      final acc = NhanSuAccount.fromJson(json);
      expect(acc.isActive, true);
      expect(acc.isDebit, true);
    });
  });

  group('NhanSuJournalLine', () {
    test('toJson/fromJson roundtrip', () {
      final line = NhanSuJournalLine(
        accountCode: '6422',
        accountName: 'Chi phí lương',
        debit: 50000000,
        credit: 0,
        description: 'Lương tháng 8',
      );
      final json = line.toJson();
      final restored = NhanSuJournalLine.fromJson(json);

      expect(restored.accountCode, '6422');
      expect(restored.accountName, 'Chi phí lương');
      expect(restored.debit, 50000000);
      expect(restored.credit, 0);
      expect(restored.description, 'Lương tháng 8');
    });

    test('amount getter returns debit when debit > 0', () {
      final line = NhanSuJournalLine(accountCode: '111', debit: 1000000, credit: 0);
      expect(line.amount, 1000000);
      expect(line.isDebit, true);
    });

    test('amount getter returns credit when credit > 0', () {
      final line = NhanSuJournalLine(accountCode: '334', debit: 0, credit: 500000);
      expect(line.amount, 500000);
      expect(line.isDebit, false);
    });

    test('copyWith', () {
      final line = NhanSuJournalLine(accountCode: '111', debit: 100);
      final updated = line.copyWith(credit: 100, debit: 0);
      expect(updated.accountCode, '111');
      expect(updated.debit, 0);
      expect(updated.credit, 100);
    });
  });

  group('NhanSuJournalEntry', () {
    test('toJson/fromJson roundtrip', () {
      final entry = NhanSuJournalEntry(
        id: 'JEN-001',
        journalID: 'JEN-SALARY-2026-08',
        entryType: 'SALARY',
        year: 2026,
        month: 8,
        description: 'Chi phí lương T08/2026',
        lines: [
          NhanSuJournalLine(accountCode: '6422', debit: 80000000, credit: 0),
          NhanSuJournalLine(accountCode: '3341', debit: 0, credit: 80000000),
        ],
        isPosted: true,
      );
      final json = entry.toJson();
      final restored = NhanSuJournalEntry.fromJson(json);

      expect(restored.id, 'JEN-001');
      expect(restored.journalID, 'JEN-SALARY-2026-08');
      expect(restored.entryType, 'SALARY');
      expect(restored.year, 2026);
      expect(restored.month, 8);
      expect(restored.description, 'Chi phí lương T08/2026');
      expect(restored.lines.length, 2);
      expect(restored.isPosted, true);
    });

    test('totalDebit and totalCredit', () {
      final entry = NhanSuJournalEntry(
        id: 'JEN-002',
        journalID: 'JEN-GL-2026-08',
        year: 2026,
        month: 8,
        lines: [
          NhanSuJournalLine(accountCode: '6422', debit: 50000000, credit: 0),
          NhanSuJournalLine(accountCode: '334', debit: 0, credit: 5250000),
          NhanSuJournalLine(accountCode: '3382', debit: 0, credit: 5250000),
          NhanSuJournalLine(accountCode: '3341', debit: 0, credit: 39500000),
        ],
      );

      expect(entry.totalDebit, 50000000);
      expect(entry.totalCredit, 50000000);
      expect(entry.isBalanced, true);
    });

    test('isBalanced returns false when unbalanced', () {
      final entry = NhanSuJournalEntry(
        id: 'JEN-003',
        journalID: 'JEN-GL-2026-08',
        year: 2026,
        month: 8,
        lines: [
          NhanSuJournalLine(accountCode: '6422', debit: 50000000, credit: 0),
          NhanSuJournalLine(accountCode: '3341', debit: 0, credit: 40000000),
        ],
      );

      expect(entry.isBalanced, false);
    });

    test('copyWith preserves unchanged fields', () {
      final entry = NhanSuJournalEntry(
        id: 'JEN-004',
        journalID: 'JEN-INS-2026-08',
        entryType: 'INS',
        year: 2026,
        month: 8,
        description: 'Bảo hiểm',
      );
      final updated = entry.copyWith(description: 'Bảo hiểm T08/2026');

      expect(updated.id, 'JEN-004');
      expect(updated.entryType, 'INS');
      expect(updated.description, 'Bảo hiểm T08/2026');
    });

    test('default entryType is GL', () {
      final entry = NhanSuJournalEntry(
        id: 'X',
        journalID: 'X',
        year: 2026,
        month: 8,
      );
      expect(entry.entryType, 'GL');
      expect(entry.isPosted, false);
      expect(entry.isReversed, false);
      expect(entry.lines, isEmpty);
    });

    test('fromJson handles missing optional fields', () {
      final json = <String, dynamic>{
        'id': 'JEN-MIN',
        'journalID': 'JEN-MIN',
        'year': 2026,
        'month': 8,
      };
      final entry = NhanSuJournalEntry.fromJson(json);
      expect(entry.entryType, 'GL');
      expect(entry.description, '');
      expect(entry.lines, isEmpty);
      expect(entry.isPosted, false);
    });
  });

  group('NhanSuAccountDefault', () {
    test('toJson/fromJson roundtrip', () {
      final def = NhanSuAccountDefault(
        id: 'AD-001',
        refType: 'SALARY',
        debitAccount: '6422',
        creditAccount: '3341',
        description: 'Chi phí lương',
      );
      final json = def.toJson();
      final restored = NhanSuAccountDefault.fromJson(json);

      expect(restored.id, 'AD-001');
      expect(restored.refType, 'SALARY');
      expect(restored.debitAccount, '6422');
      expect(restored.creditAccount, '3341');
      expect(restored.description, 'Chi phí lương');
    });
  });

  group('NhanSuEntryType', () {
    test('fromCode returns correct type', () {
      expect(NhanSuEntryType.fromCode('SALARY'), NhanSuEntryType.salaryExpense);
      expect(NhanSuEntryType.fromCode('INS'), NhanSuEntryType.insurance);
      expect(NhanSuEntryType.fromCode('TAX'), NhanSuEntryType.tax);
      expect(NhanSuEntryType.fromCode('PAY'), NhanSuEntryType.payment);
      expect(NhanSuEntryType.fromCode('BONUS'), NhanSuEntryType.bonus);
      expect(NhanSuEntryType.fromCode('ADV'), NhanSuEntryType.advance);
      expect(NhanSuEntryType.fromCode('GL'), NhanSuEntryType.gl);
    });

    test('fromCode defaults to GL for unknown code', () {
      expect(NhanSuEntryType.fromCode('UNKNOWN'), NhanSuEntryType.gl);
    });

    test('code and label properties', () {
      expect(NhanSuEntryType.gl.code, 'GL');
      expect(NhanSuEntryType.gl.label, 'Bút toán tổng hợp');
      expect(NhanSuEntryType.salaryExpense.code, 'SALARY');
      expect(NhanSuEntryType.salaryExpense.label, 'Chi phí lương');
    });
  });

  group('Salary journal entry generation', () {
    test('generates correct DR/CR from payroll data', () {
      final payrolls = [
        {
          'earnedBaseSalary': 8000000,
          'deductions': {'BHXH': 840000, 'Thuế TNCN': 0},
          'netSalary': 7160000,
        },
        {
          'earnedBaseSalary': 12000000,
          'deductions': {'BHXH': 1260000, 'Thuế TNCN': 98000},
          'netSalary': 10642000,
        },
      ];

      double totalSalary = 0, totalBHXH = 0, totalTax = 0, totalNet = 0;
      for (final p in payrolls) {
        totalSalary += (p['earnedBaseSalary'] as num).toDouble();
        final deductions = p['deductions'] as Map<String, dynamic>;
        totalBHXH += (deductions['BHXH'] as num).toDouble();
        totalTax += (deductions['Thuế TNCN'] as num).toDouble();
        totalNet += (p['netSalary'] as num).toDouble();
      }

      // Salary entry: DR 6422 = gross, CR 334 = employee BHXH, CR 3335 = PIT, CR 3341 = net payable
      final lines = [
        NhanSuJournalLine(accountCode: '6422', debit: totalSalary, credit: 0),
        NhanSuJournalLine(accountCode: '334', debit: 0, credit: totalBHXH),
        NhanSuJournalLine(accountCode: '3335', debit: 0, credit: totalTax),
        NhanSuJournalLine(accountCode: '3341', debit: 0, credit: totalNet),
      ];

      final entry = NhanSuJournalEntry(
        id: 'JEN-TEST',
        journalID: 'JEN-SALARY-2026-08',
        entryType: 'SALARY',
        year: 2026,
        month: 8,
        description: 'Test salary entry',
        lines: lines,
      );

      expect(entry.totalDebit, 20000000);
      expect(entry.totalCredit, totalBHXH + totalTax + totalNet);
      expect(entry.isBalanced, true);
    });

    test('reverse entry swaps DR and CR', () {
      final original = NhanSuJournalEntry(
        id: 'JEN-ORIG',
        journalID: 'JEN-ORIG',
        year: 2026,
        month: 8,
        description: 'Original',
        lines: [
          NhanSuJournalLine(accountCode: '6422', debit: 50000000, credit: 0),
          NhanSuJournalLine(accountCode: '3341', debit: 0, credit: 50000000),
        ],
      );

      final reversedLines = original.lines.map((l) => NhanSuJournalLine(
        accountCode: l.accountCode,
        accountName: l.accountName,
        debit: l.credit,
        credit: l.debit,
        description: 'Đảo: ${l.description}',
      )).toList();

      final reversed = original.copyWith(
        description: 'Đảo: Original',
        lines: reversedLines,
        isReversed: true,
      );

      expect(reversed.lines[0].debit, 0);
      expect(reversed.lines[0].credit, 50000000);
      expect(reversed.lines[1].debit, 50000000);
      expect(reversed.lines[1].credit, 0);
      expect(reversed.isBalanced, true);
      expect(reversed.isReversed, true);
    });
  });

  group('Multi-month entries', () {
    test('entries filter by year and month', () {
      final entries = [
        NhanSuJournalEntry(id: '1', journalID: 'A', year: 2026, month: 8),
        NhanSuJournalEntry(id: '2', journalID: 'B', year: 2026, month: 7),
        NhanSuJournalEntry(id: '3', journalID: 'C', year: 2026, month: 8),
        NhanSuJournalEntry(id: '4', journalID: 'D', year: 2026, month: 9),
      ];

      final augEntries = entries.where((e) => e.year == 2026 && e.month == 8).toList();
      expect(augEntries.length, 2);
      expect(augEntries[0].id, '1');
      expect(augEntries[1].id, '3');
    });

    test('reversed entries can be filtered out', () {
      final entries = [
        NhanSuJournalEntry(id: '1', journalID: 'A', year: 2026, month: 8, isReversed: false),
        NhanSuJournalEntry(id: '2', journalID: 'B', year: 2026, month: 8, isReversed: true),
        NhanSuJournalEntry(id: '3', journalID: 'C', year: 2026, month: 8, isReversed: false),
      ];

      final active = entries.where((e) => !e.isReversed).toList();
      expect(active.length, 2);
    });
  });

  group('Account groups', () {
    test('group classification', () {
      final accounts = [
        NhanSuAccount(id: '1', code: '111', name: 'TM', group: '1', isDebit: true),
        NhanSuAccount(id: '2', code: '334', name: 'BH', group: '3', isDebit: false),
        NhanSuAccount(id: '3', code: '6422', name: 'CP Lương', group: '6', isDebit: true),
      ];

      final assetAccounts = accounts.where((a) => a.group == '1').toList();
      final liabilityAccounts = accounts.where((a) => a.group == '3').toList();
      final expenseAccounts = accounts.where((a) => a.group == '6').toList();

      expect(assetAccounts.length, 1);
      expect(liabilityAccounts.length, 1);
      expect(expenseAccounts.length, 1);
    });
  });
}
