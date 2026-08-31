import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import '../models/compare_config.dart';
import '../models/compare_report.dart';
import '../models/compare_result.dart';
import '../models/compare_status.dart';
import '../services/compare_engine.dart';
import '../services/file_service.dart';
import '../services/history_service.dart';
import '../services/normalize_service.dart';

/// Một file đã chọn + lưới dữ liệu đã decode + dòng header đã chọn.
class DoiChieuFileSlot {
  final String path;
  final String name;
  final List<List<dynamic>> grid;
  final int headerRow;

  const DoiChieuFileSlot({
    required this.path,
    required this.name,
    required this.grid,
    required this.headerRow,
  });

  DoiChieuFileSlot copyWith({int? headerRow}) {
    return DoiChieuFileSlot(
      path: path,
      name: name,
      grid: grid,
      headerRow: headerRow ?? this.headerRow,
    );
  }
}

class DoiChieuState {
  final List<DoiChieuFileSlot?> slots;
  final CompareConfig config;
  final List<Map<String, String>> mappings;
  final List<String> canonicalColumns;
  final CompareReport? report;
  final bool running;
  final String progressLabel;
  final String? error;

  const DoiChieuState({
    this.slots = const [null, null, null],
    this.config = const CompareConfig(),
    this.mappings = const [{}, {}, {}],
    this.canonicalColumns = const [],
    this.report,
    this.running = false,
    this.progressLabel = '',
    this.error,
  });

  DoiChieuState copyWith({
    List<DoiChieuFileSlot?>? slots,
    CompareConfig? config,
    List<Map<String, String>>? mappings,
    List<String>? canonicalColumns,
    CompareReport? report,
    bool? running,
    String? progressLabel,
    String? error,
  }) {
    return DoiChieuState(
      slots: slots ?? this.slots,
      config: config ?? this.config,
      mappings: mappings ?? this.mappings,
      canonicalColumns: canonicalColumns ?? this.canonicalColumns,
      report: report ?? this.report,
      running: running ?? this.running,
      progressLabel: progressLabel ?? this.progressLabel,
      error: error ?? this.error,
    );
  }
}

final doichieuFlowProvider =
    NotifierProvider<DoiChieuNotifier, DoiChieuState>(DoiChieuNotifier.new);

final doichieuTabIndexProvider = StateProvider<int>((ref) => 0);

/// Danh sách kết quả đã lưu (tab Lưu trữ) — spec §28.
final doichieuHistoryProvider =
    FutureProvider<List<HistoryEntry>>((ref) => HistoryService.listHistory());

const _headerKeywords = r'chứng từ|chung tu|ngày|ngay|số ct|so ct|tiền|tien|thành tiền|'
    r'thanh tien|mã|ma|khách|khach|tên|ten|số lượng|so luong|đơn giá|don gia|hd|hoa don|'
    r'so tien|số tiền|ky hieu|kyhieu';

class DoiChieuNotifier extends Notifier<DoiChieuState> {
  @override
  DoiChieuState build() => const DoiChieuState();

  // ---- Chọn file ----

  Future<void> pickFile(int slotIndex) async {
    state = state.copyWith(error: null);
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'csv'],
      allowMultiple: false,
    );
    if (result == null || result.files.isEmpty) return;
    final file = result.files.single;
    final path = file.path;
    if (path == null || path.isEmpty) {
      state = state.copyWith(error: 'Không đọc được đường dẫn file');
      return;
    }
    final unsupported = FileService.unsupportedReason(file.name);
    if (unsupported != null) {
      state = state.copyWith(error: unsupported);
      return;
    }
    state = state.copyWith(
      running: true,
      progressLabel: 'Đang đọc ${file.name}...',
    );
    try {
      final bytes = await File(path).readAsBytes();
      final grid = await FileService.decodeFile(bytes, file.name);
      final autoRow = suggestHeaderRow(grid);
      final newSlot = DoiChieuFileSlot(path: path, name: file.name, grid: grid, headerRow: autoRow);
      final slots = [...state.slots];
      slots[slotIndex] = newSlot;
      state = state.copyWith(
        slots: slots,
        running: false,
        progressLabel: '',
      );
      _refreshCanonicalAndMappings();
    } catch (e) {
      state = state.copyWith(
        running: false,
        progressLabel: '',
        error: 'Không đọc được file: $e',
      );
    }
  }

  void clearSlot(int slotIndex) {
    final slots = [...state.slots];
    slots[slotIndex] = null;
    state = state.copyWith(slots: slots, report: state.report, error: null);
    if (slotIndex == 0) {
      _refreshCanonicalAndMappings(resetCredential: true);
    } else {
      _refreshCanonicalAndMappings();
    }
  }

  void setHeaderRow(int slotIndex, int row) {
    final slots = [...state.slots];
    final slot = slots[slotIndex];
    if (slot == null) return;
    slots[slotIndex] = slot.copyWith(headerRow: row);
    state = state.copyWith(slots: slots);
    _refreshCanonicalAndMappings();
  }

  void setMapping(int slotIndex, String canonicalColumn, String actualColumn) {
    final mappings = [...state.mappings];
    final m = {...mappings[slotIndex]};
    m[canonicalColumn] = actualColumn;
    mappings[slotIndex] = m;
    state = state.copyWith(mappings: mappings);
  }

  // ---- Cấu hình ----

  void updateConfig(CompareConfig next) {
    final config = next.copyWith(
      keyColumns: next.keyColumns.where((c) => state.canonicalColumns.isEmpty || state.canonicalColumns.contains(c)).toList(),
      compareColumns: next.compareColumns.where((c) => state.canonicalColumns.isEmpty || state.canonicalColumns.contains(c)).toList(),
    );
    state = state.copyWith(config: config);
  }

  void applyTemplate(CompareConfig config) {
    state = state.copyWith(config: config);
  }

  // ---- Đối chiếu ----

  Future<void> runCompare() async {
    if (state.running) return;
    final err = _validate();
    if (err != null) {
      state = state.copyWith(error: err);
      return;
    }
    state = state.copyWith(
      running: true,
      progressLabel: 'Đang chuẩn bị dữ liệu...',
      error: null,
    );

    await Future<void>.delayed(const Duration(milliseconds: 50));

    final fileNames = <String>[];
    final fileColumns = <List<String>>[];
    final fileRows = <List<Map<String, dynamic>>>[];
    final mappings = <Map<String, String>>[];
    for (var i = 0; i < 3; i++) {
      final slot = state.slots[i];
      if (slot == null || slot.grid.isEmpty || slot.headerRow >= slot.grid.length) {
        fileNames.add('');
        fileColumns.add(const []);
        fileRows.add(const []);
        mappings.add(const {});
        continue;
      }
      final headers = _deriveHeaders(slot.grid, slot.headerRow);
      fileNames.add(slot.name);
      fileColumns.add(headers);
      mappings.add(state.mappings[i]);
      final rows = <Map<String, dynamic>>[];
      for (var r = slot.headerRow + 1; r < slot.grid.length; r++) {
        final rowData = <String, dynamic>{};
        var any = false;
        final cells = slot.grid[r];
        final upto = cells.length < headers.length ? cells.length : headers.length;
        for (var c = 0; c < upto; c++) {
          final v = cells[c];
          if (v != null && v.toString().trim().isNotEmpty) {
            any = true;
          }
          rowData[headers[c]] = v;
        }
        if (any) rows.add(rowData);
      }
      fileRows.add(rows);
    }

    state = state.copyWith(
      progressLabel: 'Đang chỉ mục và đối chiếu (chạy nền)...',
    );

    try {
      final report = await CompareEngine.runIsolated(
        fileNames: fileNames,
        fileColumns: fileColumns,
        columnMappings: mappings,
        fileRows: fileRows,
        config: state.config,
      );
      final entryName = fileNames.where((n) => n.isNotEmpty).join(' ↔ ');
      await _saveReportToHistory(report, name: entryName);
      state = state.copyWith(
        report: report,
        running: false,
        progressLabel: 'Hoàn thành',
      );
      _resetResultFilters();
    } catch (e) {
      state = state.copyWith(
        running: false,
        progressLabel: '',
        error: 'Lỗi khi đối chiếu: $e',
      );
    }
  }

  /// Lưu kết quả phiên hiện tại vào tab Lưu trữ (có thể đặt tên).
  /// Trả về đường dẫn file đã lưu, null nếu không có kết quả/lỗi.
  Future<String?> saveCurrentReport({String? name}) async {
    final report = state.report;
    if (report == null) return null;
    try {
      return await HistoryService.saveReport(report, name: name);
    } catch (_) {
      return null;
    }
  }

  /// Nạp 3 file dữ liệu mẫu (sinh bởi tool/generate_doichieu_samples.dart)
  /// vào slot A/B/C để dùng thử nhanh.
  Future<void> useSampleData() async {
    state = state.copyWith(
      running: true,
      progressLabel: 'Đang nạp dữ liệu mẫu...',
      error: null,
    );
    try {
      const base = 'assets/kanposvndoichieuketoan/samples/';
      const samples = [
        'A_so_cai_202608.xlsx',
        'B_so_chi_tiet_202608.xlsx',
        'C_ngan_hang_202608.xlsx',
      ];
      final slots = [...state.slots];
      for (var i = 0; i < samples.length; i++) {
        final data = await rootBundle.load('$base${samples[i]}');
        final grid =
            await FileService.decodeFile(data.buffer.asUint8List(), samples[i]);
        slots[i] = DoiChieuFileSlot(
          path: 'sample://${samples[i]}',
          name: samples[i],
          grid: grid,
          headerRow: suggestHeaderRow(grid),
        );
      }
      state = state.copyWith(slots: slots, running: false, progressLabel: '');
      _refreshCanonicalAndMappings();
      _resetResultFilters();
    } catch (e) {
      state = state.copyWith(
        running: false,
        progressLabel: '',
        error: 'Không nạp được dữ liệu mẫu: $e',
      );
    }
  }

  Future<void> _saveReportToHistory(CompareReport report, {String? name}) async {
    try {
      await HistoryService.saveReport(report, name: name);
    } catch (_) {
      // lỗi lưu lịch sử không ảnh hưởng kết quả đối chiếu
    }
  }

  void restoreReport(CompareReport report) {
    state = state.copyWith(
      report: report,
      running: false,
      progressLabel: '',
      error: null,
      canonicalColumns: report.canonicalColumns,
    );
    _resetResultFilters();
  }

  void reset() {
    state = const DoiChieuState();
    _resetResultFilters();
  }

  void _resetResultFilters() {
    ref.read(doichieuResultFilterProvider.notifier).state = null;
    ref.read(doichieuSearchProvider.notifier).state = '';
    ref.read(doichieuShowDuplicateProvider.notifier).state = false;
  }

  String? _validate() {
    if (state.slots[0] == null) return 'Vui lòng chọn File A';
    if (state.slots[1] == null) return 'Vui lòng chọn File B';
    if (state.config.keyColumns.isEmpty) return 'Vui lòng chọn ít nhất 1 cột khóa (Key)';
    final s0 = state.slots[0]!;
    final s1 = state.slots[1]!;
    if (s0.headerRow >= s0.grid.length) return 'File A: header vượt quá số dòng';
    if (s1.headerRow >= s1.grid.length) return 'File B: header vượt quá số dòng';
    return null;
  }

  // ---- Helper ----

  void _refreshCanonicalAndMappings({bool resetCredential = false}) {
    final slot0 = state.slots[0];
    if (slot0 == null) {
      state = state.copyWith(
        canonicalColumns: const [],
        mappings: const [{}, {}, {}],
        config: const CompareConfig(),
      );
      return;
    }
    final canonical = _deriveHeaders(slot0.grid, slot0.headerRow);
    final mappings = List.generate(3, (i) {
      final slot = state.slots[i];
      final headers = (slot == null || slot.headerRow >= slot.grid.length)
          ? const <String>[]
          : _deriveHeaders(slot.grid, slot.headerRow);
      final m = <String, String>{};
      if (headers.isEmpty) return m;
      if (i == 0) {
        for (final c in canonical) {
          m[c] = c;
        }
        return m;
      }
      for (final c in canonical) {
        m[c] = bestMapping(c, headers);
      }
      return m;
    });

    final config = resetCredential || state.canonicalColumns.isEmpty || !_sameList(state.canonicalColumns, canonical)
        ? _defaultConfig(canonical)
        : state.config;

    state = state.copyWith(
      canonicalColumns: canonical,
      mappings: mappings,
      config: config,
    );
  }

  static List<String> _deriveHeaders(List<List<dynamic>> grid, int headerRow) {
    if (grid.isEmpty || headerRow >= grid.length) return const [];
    final raw = grid[headerRow];
    final headers = <String>[];
    final seen = <String>{};
    for (var i = 0; i < raw.length; i++) {
      var name = raw[i] == null ? '' : raw[i].toString().trim();
      if (name.isEmpty) name = 'Cột ${i + 1}';
      if (seen.contains(name)) {
        var n = 2;
        while (seen.contains('$name ($n)')) {
          n++;
        }
        name = '$name ($n)';
      }
      seen.add(name);
      headers.add(name);
    }
    return headers;
  }

  static bool _sameList(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  static CompareConfig _defaultConfig(List<String> canonical) {
    if (canonical.isEmpty) return const CompareConfig();
    final amountColumn = _findAmountColumn(canonical);
    return CompareConfig(
      keyColumns: [canonical.first],
      compareColumns: canonical,
      amountColumn: amountColumn,
    );
  }

  static String? _findAmountColumn(List<String> canonical) {
    for (final c in canonical) {
      final n = _norm(c);
      if (n.contains('tien') ||
          n.contains('amount') ||
          n.contains('gia tri') ||
          n.contains('tong')) {
        return c;
      }
    }
    return null;
  }
}

/// Đề xuất dòng header: dòng đầu tiên có >= 3 cell và chứa từ khóa cột.
int suggestHeaderRow(List<List<dynamic>> grid) {
  if (grid.isEmpty) return 0;
  final limit = grid.length < 10 ? grid.length : 10;
  final keyword = RegExp(_headerKeywords, caseSensitive: false);
  for (var r = 0; r < limit; r++) {
    final cells = grid[r].where((c) => c != null && c.toString().trim().isNotEmpty).toList();
    if (cells.length >= 2 && cells.any((c) => keyword.hasMatch(c.toString()))) {
      return r;
    }
  }
  return 0;
}

/// Danh sách tiêu đề cột của một slot (dùng chung cho UI ánh xạ).
List<String> dcHeadersOf(DoiChieuFileSlot slot) =>
    DoiChieuNotifier._deriveHeaders(slot.grid, slot.headerRow);

String bestMapping(String canonical, List<String> headers) {
  final normC = _norm(canonical);
  String? best;
  var bestScore = 0.399;
  for (final h in headers) {
    final nh = _norm(h);
    var score = 0.0;
    if (nh == normC) return h;
    if (nh.contains(normC) || normC.contains(nh)) {
      score = 0.9;
    } else if (_tokensShare(normC, nh)) {
      score = 0.7;
    }
    if (score > bestScore) {
      bestScore = score;
      best = h;
    }
  }
  return best ?? '';
}

bool _tokensShare(String a, String b) {
  final ta = a.split(' ').where((t) => t.length > 1).toSet();
  final tb = b.split(' ').where((t) => t.length > 1).toSet();
  return ta.intersection(tb).isNotEmpty;
}

String _norm(String s) => normalizeText(s, ignoreCase: true, trimSpaces: true, normalizeUnicode: true);

// ---- Bộ lọc kết quả ----

final doichieuResultFilterProvider = StateProvider<CompareStatus?>((ref) => null);
final doichieuSearchProvider = StateProvider<String>((ref) => '');
final doichieuShowDuplicateProvider = StateProvider<bool>((ref) => false);

final doichieuVisibleResultsProvider = Provider<List<CompareResult>>((ref) {
  final report = ref.watch(doichieuFlowProvider.select((s) => s.report));
  if (report == null) return const [];
  final status = ref.watch(doichieuResultFilterProvider);
  final showDup = ref.watch(doichieuShowDuplicateProvider);
  final q = ref.watch(doichieuSearchProvider).trim().toLowerCase();

  var list = report.results;
  if (showDup) list = list.where((r) => r.duplicate).toList();
  if (status != null) {
    list = list.where((r) => r.status == status).toList();
  }
  if (q.isNotEmpty) {
    list = list.where((r) => r.key.toLowerCase().contains(q)).toList();
  }
  if (list.length > 1) {
    final sorted = [...list];
    sorted.sort((a, b) => a.key.compareTo(b.key));
    list = sorted;
  }
  return list;
});