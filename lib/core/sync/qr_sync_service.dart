import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../db/database_service.dart';
import 'api_config.dart';

final qrSyncServiceProvider = Provider<QrSyncService>((ref) {
  final dbService = DatabaseService.instance; // Assuming we can use singleton or watch provider
  return QrSyncService(dbService);
});

class QrSyncService {
  final DatabaseService _dbService;
  Timer? _pollingTimer;
  bool _isSyncing = false;
  
  String? _appCode;
  String? _branchId;
  String _lastUpdated = ""; 

  QrSyncService(this._dbService);

  void startPolling({required String appCode, required String branchId}) {
    _appCode = appCode;
    _branchId = branchId;
    
    stopPolling();
    
    // Poll every 5 seconds
    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      _syncOrders();
    });
    
    // Trigger first sync immediately
    _syncOrders();
  }

  void stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }

  Future<void> _syncOrders() async {
    if (_isSyncing || _appCode == null || _branchId == null) return;
    _isSyncing = true;
    
    try {
      var urlStr = '${ApiConfig.baseUrl}/api/sync/orders?app_code=$_appCode&branch_id=$_branchId';
      if (_lastUpdated.isNotEmpty) {
        urlStr += '&updated_after=$_lastUpdated';
      }
      
      final response = await http.get(Uri.parse(urlStr));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List orders = data['orders'] ?? [];
        
        for (var orderMap in orders) {
          final orderId = orderMap['id'];
          final orderUpdatedAt = orderMap['updated_at'];
          
          final items = orderMap['items'] as List? ?? [];
          orderMap.remove('items'); 
          
          // Save order to DB (no trigger sync to avoid infinite loop)
          await _dbService.saveItem('orders', orderId, orderMap, triggerSync: false);
          
          // Save order items
          for (var item in items) {
            await _dbService.saveItem('order_items', item['id'], item, triggerSync: false);
          }
          
          if (_lastUpdated.isEmpty || orderUpdatedAt.compareTo(_lastUpdated) > 0) {
            _lastUpdated = orderUpdatedAt;
          }
        }
      }
    } catch (e) {
      print('QR Sync Error: $e');
    } finally {
      _isSyncing = false;
    }
  }
}
