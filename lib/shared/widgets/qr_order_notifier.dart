import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/db/database_service.dart';

class QrOrderNotifier extends ConsumerStatefulWidget {
  final Widget child;

  const QrOrderNotifier({Key? key, required this.child}) : super(key: key);

  @override
  _QrOrderNotifierState createState() => _QrOrderNotifierState();
}

class _QrOrderNotifierState extends ConsumerState<QrOrderNotifier> {
  int _lastOrderCount = 0;

  @override
  void initState() {
    super.initState();
    final db = DatabaseService.instance;
    db.addListener(_onDbChanged);
  }

  @override
  void dispose() {
    DatabaseService.instance.removeListener(_onDbChanged);
    super.dispose();
  }

  void _onDbChanged() {
    final db = DatabaseService.instance;
    final orders = db.getCollection('orders');
    
    // Đếm số đơn hàng QR mới (trạng thái NEW)
    final newQrOrders = orders.where((o) => o['source'] == 'QR' && o['status'] == 'NEW').toList();
    
    if (newQrOrders.length > _lastOrderCount) {
      // Có đơn mới -> Hiển thị thông báo
      final latestOrder = newQrOrders.last;
      _showNewOrderDialog(latestOrder);
    }
    
    _lastOrderCount = newQrOrders.length;
  }

  void _showNewOrderDialog(Map<String, dynamic> order) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: Text('🔔 CÓ ĐƠN HÀNG QR MỚI!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã đơn: ${order['order_no']}', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Bàn: ${order['table_name'] ?? 'Không rõ'}'), // Yêu cầu join hoặc load table
              SizedBox(height: 10),
              Text('Tổng tiền: ${order['total']} đ', style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Đổi trạng thái -> CANCELLED
                _updateOrderStatus(order['id'], 'CANCELLED');
                Navigator.pop(ctx);
              },
              child: Text('TỪ CHỐI', style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                // Đổi trạng thái -> CONFIRMED, tự động in / gửi bếp
                _updateOrderStatus(order['id'], 'CONFIRMED');
                Navigator.pop(ctx);
              },
              child: Text('XÁC NHẬN'),
            ),
          ],
        );
      }
    );
  }
  
  void _updateOrderStatus(String id, String newStatus) {
     final db = DatabaseService.instance;
     final order = db.getById('orders', id);
     if (order != null) {
       order['status'] = newStatus;
       db.saveItem('orders', id, order, triggerSync: true); // Sẽ sync lại lên server
     }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child; // Bọc toàn bộ ứng dụng hoặc màn hình POS
  }
}
