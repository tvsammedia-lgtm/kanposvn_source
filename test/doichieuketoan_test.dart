import 'package:flutter_test/flutter_test.dart';
import 'package:kanposvn/modules/kanposvndoichieuketoan/models/compare_config.dart';
import 'package:kanposvn/modules/kanposvndoichieuketoan/models/compare_report.dart';
import 'package:kanposvn/modules/kanposvndoichieuketoan/models/compare_status.dart';
import 'package:kanposvn/modules/kanposvndoichieuketoan/services/compare_engine.dart';
import 'package:kanposvn/modules/kanposvndoichieuketoan/services/normalize_service.dart';

const _columns = ['Số CT', 'Ngày', 'Số tiền', 'Tên'];
Map<String, String> get _identityMapping => {
      'Số CT': 'Số CT',
      'Ngày': 'Ngày',
      'Số tiền': 'Số tiền',
      'Tên': 'Tên',
    };

/// Chạy engine với dữ liệu theo cột chuẩn (ánh xạ identity).
/// nFiles = số file thực sự được chọn (slot không chọn có tên rỗng).
Future<CompareReport> runEngine(
  List<List<Map<String, dynamic>>> fileRows, {
  CompareConfig? config,
  int nFiles = 2,
}) async {
  List<String> names;
  switch (nFiles) {
    case 3:
      names = ['fileA.xlsx', 'fileB.xlsx', 'fileC.xlsx'];
      break;
    case 1:
      names = ['fileA.xlsx', '', ''];
      break;
    default:
      names = ['fileA.xlsx', 'fileB.xlsx', ''];
  }
  return CompareEngine.runIsolated(
    fileNames: names,
    fileColumns: List.generate(3, (_) => [..._columns]),
    columnMappings: List.generate(3, (_) => {..._identityMapping}),
    fileRows: fileRows,
    config: config ??
        const CompareConfig(
          keyColumns: ['Số CT'],
          compareColumns: ['Số CT', 'Ngày', 'Số tiền', 'Tên'],
          amountColumn: 'Số tiền',
        ),
  );
}

Map<String, dynamic> row(String ct, String ngay, String tien, String ten) =>
    {'Số CT': ct, 'Ngày': ngay, 'Số tiền': tien, 'Tên': ten};

void main() {
  group('normalize_service', () {
    test('1,250,000 vs 1.250.000 -> Trùng khớp', () {
      expect(parseNumber('1,250,000'), 1250000);
      expect(parseNumber('1.250.000'), 1250000);
      expect(parseNumber('1 250 000'), 1250000);
      expect(parseNumber('1250000'), 1250000);
    });

    test('kèm ký hiệu tiền tệ 1.000.000đ / 1,000,000 VND', () {
      expect(parseNumber('1.000.000đ'), 1000000);
      expect(parseNumber('1,000,000 VND'), 1000000);
      expect(parseNumber('₫1,000,000'), 1000000);
    });

    test('mã chứng từ CT01 KHÔNG được parse thành số', () {
      expect(parseNumber('CT01'), null);
      expect(parseNumber('HD-2026-001'), null);
    });

    test('parseNumber âm kiểu kế toán (100000) = -100000', () {
      expect(parseNumber('(100000)'), -100000);
      expect(parseNumber('-100000'), -100000);
    });

    test('parseNumber không hiểu chữ -> null', () {
      expect(parseNumber('N/A'), null);
      expect(parseNumber(''), null);
    });

    test('normalizeText bỏ dấu + lowercase + gộp khoảng trắng', () {
      expect(
        normalizeText('  Nguyễn  Văn   Anh  ',
            ignoreCase: true, trimSpaces: true, normalizeUnicode: true),
        'nguyen van anh',
      );
    });

    test('parseDate dd/MM/yyyy và yyyyMMdd', () {
      expect(parseDate('31/08/2026'), DateTime(2026, 8, 31));
      expect(parseDate('20260831'), DateTime(2026, 8, 31));
      expect(parseDate('2026-08-31'), DateTime(2026, 8, 31));
    });
  });

  group('compare_engine — khớp/khác (spec §36-§37)', () {
    test('2 file giống hệt -> Trùng khớp', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '1,250,000', 'Nguyễn Văn Anh')],
        [row('CT01', '31/01/2026', '1,250,000', 'Nguyễn Văn Anh')],
        const [],
      ]);
      expect(report.results.length, 1);
      expect(report.results.first.status, CompareStatus.matched);
      expect(report.results.first.differences, isEmpty);
      expect(report.countOf(CompareStatus.matched), 1);
    });

    test('cùng số tiền nhưng khác định dạng (1,250,000 vs 1.250.000) -> Trùng', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '1,250,000', 'A')],
        [row('CT01', '31/01/2026', '1.250.000', 'A')],
        const [],
      ]);
      expect(report.results.first.status, CompareStatus.matched);
    });

    test('sai lệch số tiền -> Khác số + numericDifference', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '1,250,000', 'A')],
        [row('CT01', '31/01/2026', '1,500,000', 'A')],
        const [],
      ]);
      final r = report.results.first;
      expect(r.status, CompareStatus.numberDifferent);
      expect(r.differences.single.column, 'Số tiền');
      expect(r.differences.single.numericDifference, 250000);
    });

    test('sai lệch trong tolerance -> Trùng', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '1,250,000', 'A')],
        [row('CT01', '31/01/2026', '1,250,100', 'A')],
        const [],
      ], config: const CompareConfig(
        keyColumns: ['Số CT'],
        compareColumns: ['Số tiền'],
        amountColumn: 'Số tiền',
        numberTolerance: 500,
      ));
      expect(report.results.first.status, CompareStatus.matched);
    });

    test('(-1000) == -1000 với negative kế toán', () async {
      final report = await runEngine([
        [row('CT02', '31/01/2026', '-1000', 'A')],
        [row('CT02', '31/01/2026', '(1000)', 'A')],
        const [],
      ]);
      expect(report.results.first.status, CompareStatus.matched);
    });

    test('khác ngày -> Khác ngày', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '1000', 'A')],
        [row('CT01', '01/02/2026', '1000', 'A')],
        const [],
      ]);
      expect(report.results.first.status, CompareStatus.dateDifferent);
    });

    test('khác ký tự (bỏ dấu) ở chế độ Exact -> Khác ký tự', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '1000', 'Nguyễn Văn Anh')],
        [row('CT01', '31/01/2026', '1000', 'Nguyễn Văn Ánh')],
        const [],
      ], config: const CompareConfig(
        keyColumns: ['Số CT'],
        compareColumns: ['Tên'],
        amountColumn: 'Số tiền',
        matchMode: 0,
      ));
      expect(report.results.first.status, CompareStatus.textDifferent);
    });

    test('cùng ký tự bỏ dấu ở chế độ Normalized -> Trùng', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '1000', 'Nguyễn Văn Anh')],
        [row('CT01', '31/01/2026', '1000', 'Nguyễn Văn Ánh')],
        const [],
      ], config: const CompareConfig(
        keyColumns: ['Số CT'],
        compareColumns: ['Tên'],
        amountColumn: 'Số tiền',
        matchMode: 1,
      ));
      expect(report.results.first.status, CompareStatus.matched);
    });

    test('rỗng vs có dữ liệu -> Khác dữ liệu rỗng', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '', 'A')],
        [row('CT01', '31/01/2026', '1000', 'A')],
        const [],
      ]);
      expect(report.results.first.status, CompareStatus.emptyDifferent);
    });
  });

  group('compare_engine — thiếu/dư (spec §36)', () {
    test('key chỉ có ở File A -> Dư', () async {
      final report = await runEngine([
        [row('CT10', '31/01/2026', '1000', 'A')],
        const [],
        const [],
      ]);
      expect(report.results.single.status, CompareStatus.extra);
    });

    test('key chỉ có ở File B -> Dư', () async {
      final report = await runEngine([
        const [],
        [row('CT10', '31/01/2026', '1000', 'A')],
        const [],
      ]);
      expect(report.results.single.status, CompareStatus.extra);
    });

    test('3 file, key có ở A, B nhưng không ở C -> Thiếu', () async {
      final report = await runEngine([
        [row('CT10', '31/01/2026', '1000', 'A')],
        [row('CT10', '31/01/2026', '1000', 'A')],
        const [],
      ], nFiles: 3);
      expect(report.results.single.status, CompareStatus.missing);
      expect(report.results.single.present, [true, true, false]);
    });
  });

  group('compare_engine — duplicate (spec §16, §44)', () {
    test('key lặp trong File A -> duplicate=true và ghi vào duplicates', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '1000', 'A'), row('CT01', '31/01/2026', '2000', 'B')],
        [row('CT01', '31/01/2026', '1000', 'A')],
        const [],
      ]);
      final r = report.results.single;
      expect(r.duplicate, isTrue);
      expect(report.duplicates.containsKey(r.key), isTrue);
      expect(report.duplicates[r.key]!.single, contains('2 dòng'));
      expect(report.warnings.any((w) => w.contains('key trùng')), isTrue);
    });

    test('duplicateMode=ignore -> bỏ key trùng ra khỏi kết quả', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '1000', 'A'), row('CT01', '31/01/2026', '2000', 'B')],
        [row('CT01', '31/01/2026', '1000', 'A')],
        const [],
      ], config: const CompareConfig(
        keyColumns: ['Số CT'],
        compareColumns: ['Số tiền'],
        amountColumn: 'Số tiền',
        duplicateMode: 'ignore',
      ));
      expect(report.results, isEmpty);
    });

    test('duplicateMode=aggregate -> gộp cộng số tiền', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '100000', 'A'), row('CT01', '31/01/2026', '100000', 'B')],
        [row('CT01', '31/01/2026', '300000', 'A')],
        const [],
      ], config: const CompareConfig(
        keyColumns: ['Số CT'],
        compareColumns: ['Số tiền'],
        amountColumn: 'Số tiền',
        duplicateMode: 'aggregate',
      ));
      final r = report.results.single;
      expect(r.status, CompareStatus.numberDifferent);
      expect(r.differences.single.numericDifference, 100000);
    });
  });

  group('compare_engine — tổng tiền cột (spec §45)', () {
    test('fileTotals tính đúng theo cột tiền', () async {
      final report = await runEngine([
        [row('CT01', '31/01/2026', '100,000', 'A'), row('CT02', '31/01/2026', '200,000', 'A')],
        [row('CT01', '31/01/2026', '100,000', 'A')],
        const [],
      ]);
      expect(report.fileTotals[0], 300000);
      expect(report.fileTotals[1], 100000);
      expect(report.amountDiffAB, 200000);
    });
  });
}