import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'qr_api_client.dart';
import 'qr_catalog.dart';

/// Cầu nối QR Order Online giữa cloud (kanposvn-admin) và module POS.
///
/// Mỗi module cài đặt các hook biến đổi catalog/bàn/đơn sang model riêng:
///   - [buildCatalogInput]: đọc bàn + món hiện có gửi lên web.
///   - [persistRemoteOrder]: lưu đơn online vào DB module (dedupe theo 'QR-' + id).
///   - [onLocalStatusChanged]: phản ứng khi POS đổi trạng thái đơn online.
///   - [onAfterPoll]: reload danh sách hiển thị của module sau khi đồng bộ.
///
/// Trạng thái (branchId, bàn, đơn, updatedAfter) được giữ trong prefs để
/// sống sót qua restart. Polling mặc định 5 giây.
abstract class QrOrderBridge extends ChangeNotifier {
  QrOrderBridge() : _api = QrApiClient();

  final QrApiClient _api;
  Timer? _timer;

  String get appCode;
  String get label;
  String get defaultBranchName;
  String? get defaultBranchCode;

  Future<QrCatalogInput> buildCatalogInput();
  Future<void> persistRemoteOrder(QrRemoteOrder order);
  Future<void> onLocalStatusChanged(QrRemoteOrder order, String newStatus);
  Future<void> onAfterPoll();

  SharedPreferences? _prefs;
  String? _branchId;
  String _updatedAfter = '';
  bool _isPolling = false;
  bool _busy = false;
  String? _lastError;
  DateTime? _lastSyncAt;
  List<QrTableInfo> _cloudTables = [];
  List<QrRemoteOrder> _remoteOrders = [];

  String get _kBranch => 'qr_branch_id_$appCode';
  String get _kTables => 'qr_tables_$appCode';
  String get _kOrders => 'qr_orders_$appCode';
  String get _kUpdated => 'qr_updated_after_$appCode';
  String get _kPolling => 'qr_polling_$appCode';

  bool get isInitialized => _prefs != null;
  bool get isPolling => _isPolling;
  bool get isBusy => _busy;
  String? get branchId => _branchId;
  String? get lastError => _lastError;
  DateTime? get lastSyncAt => _lastSyncAt;
  List<QrTableInfo> get cloudTables => List.unmodifiable(_cloudTables);
  List<QrRemoteOrder> get remoteOrders => List.unmodifiable(_remoteOrders);

  /// Nạp trạng thái đã lưu + auto-start polling nếu trước đó đang bật.
  Future<void> initialize() async {
    if (_prefs != null) return;
    final prefs = await SharedPreferences.getInstance();
    _prefs = prefs;
    _branchId = prefs.getString(_kBranch);
    _updatedAfter = prefs.getString(_kUpdated) ?? '';

    final tablesRaw = prefs.getString(_kTables);
    if (tablesRaw != null && tablesRaw.isNotEmpty) {
      _cloudTables = (jsonDecode(tablesRaw) as List)
          .whereType<Map>()
          .map<QrTableInfo>(
              (e) => QrTableInfo.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    final ordersRaw = prefs.getString(_kOrders);
    if (ordersRaw != null && ordersRaw.isNotEmpty) {
      _remoteOrders = (jsonDecode(ordersRaw) as List)
          .whereType<Map>()
          .map<QrRemoteOrder>(
              (e) => QrRemoteOrder.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    if (prefs.getBool(_kPolling) ?? false) {
      await startPolling();
    }
    notifyListeners();
  }

  /// Gửi toàn bộ bàn + menu lên web, nhận lại QR token cho từng bàn.
  Future<QrPublishResult> publishCatalog() async {
    _lastError = null;
    _busy = true;
    notifyListeners();
    try {
      final input = await buildCatalogInput();
      final result = await _api.publish(
        appCode: appCode,
        branchId: _branchId,
        branchCode: input.branchCode ?? defaultBranchCode,
        branchName: input.branchName.isNotEmpty ? input.branchName : defaultBranchName,
        tables: input.tables.map((t) => t.toJson()).toList(),
        categories: input.categories.map((c) => c.toJson()).toList(),
        items: input.items.map((i) => i.toJson()).toList(),
      );
      if (result.branchId != null && result.branchId!.isNotEmpty) {
        _branchId = result.branchId;
        await _prefs?.setString(_kBranch, _branchId!);
      }
      _cloudTables = result.tables;
      await _prefs?.setString(
          _kTables, jsonEncode(result.tables.map((t) => t.toJson()).toList()));
      _lastSyncAt = DateTime.now();
      await onAfterPoll();
      return result;
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    } finally {
      _busy = false;
      notifyListeners();
    }
  }

  Future<void> startPolling() async {
    if (_branchId == null) return;
    _isPolling = true;
    await _prefs?.setBool(_kPolling, true);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) => pollNow());
    if (!_busy) {
      await pollNow();
    }
    notifyListeners();
  }

  void stopPolling() {
    _isPolling = false;
    _prefs?.setBool(_kPolling, false);
    _timer?.cancel();
    _timer = null;
    notifyListeners();
  }

  Future<void> pollNow() async {
    if (_branchId == null || _busy || !_isPolling) return;
    _busy = true;
    try {
      final orders = await _api.fetchOrders(
        appCode: appCode,
        branchId: _branchId!,
        updatedAfter: _updatedAfter,
      );
      var newest = _updatedAfter;
      for (final order in orders) {
        _upsertRemoteOrder(order);
        try {
          await persistRemoteOrder(order);
        } catch (e) {
          _lastError = 'Lưu đơn ${order.orderNo} lỗi: $e';
        }
        if (order.updatedAtIso.compareTo(newest) > 0) newest = order.updatedAtIso;
      }
      if (orders.isNotEmpty) {
        _updatedAfter = newest;
        await _prefs?.setString(_kUpdated, _updatedAfter);
        await _prefs?.setString(
            _kOrders, jsonEncode(_remoteOrders.map((o) => o.toJson()).toList()));
        await onAfterPoll();
      }
      _lastSyncAt = DateTime.now();
      _lastError = null;
    } catch (e) {
      _lastError = e.toString();
    } finally {
      _busy = false;
      notifyListeners();
    }
  }

  void _upsertRemoteOrder(QrRemoteOrder order) {
    final idx = _remoteOrders.indexWhere((o) => o.id == order.id);
    if (idx >= 0) {
      _remoteOrders[idx] = order;
    } else {
      _remoteOrders.insert(0, order);
    }
  }

  /// POS đổi trạng thái đơn online → cập nhật web + DB module.
  Future<void> updateRemoteStatus(String orderId, String status) async {
    _lastError = null;
    _busy = true;
    notifyListeners();
    try {
      await _api.updateStatus(appCode: appCode, orderId: orderId, status: status);
      final idx = _remoteOrders.indexWhere((o) => o.id == orderId);
      if (idx >= 0) {
        final updated = _remoteOrders[idx].copyWith(status: status);
        _remoteOrders[idx] = updated;
        await _prefs?.setString(
            _kOrders, jsonEncode(_remoteOrders.map((o) => o.toJson()).toList()));
        await onLocalStatusChanged(updated, status);
        await onAfterPoll();
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    } finally {
      _busy = false;
      notifyListeners();
    }
  }

  /// Map cloud table uuid → local table code/id (mapping do publish trả về).
  String? remoteTableCode(String cloudTableId) {
    for (final t in _cloudTables) {
      if (t.cloudId == cloudTableId) return t.code;
    }
    return null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}