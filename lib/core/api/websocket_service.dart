import 'dart:async';
import 'dart:math';

class WebSocketEvent {
  final String type; // 'typing', 'new_message', 'incoming_call'
  final Map<String, dynamic> data;

  WebSocketEvent({required this.type, required this.data});
}

class WebSocketService {
  final _eventController = StreamController<WebSocketEvent>.broadcast();
  Stream<WebSocketEvent> get eventStream => _eventController.stream;
  Timer? _mockTimer;

  void connect() {
    print("WebSocket: Đã kết nối tới wss://your-vercel-api.app");
    
    // Giả lập Server thỉnh thoảng đẩy sự kiện về Client
    _mockTimer = Timer.periodic(const Duration(seconds: 15), (timer) {
      final random = Random().nextInt(3);
      if (random == 0) {
        // Mô phỏng ai đó đang gõ phím
        _eventController.add(WebSocketEvent(
          type: 'typing',
          data: {'senderUuid': 'FRIEND-001', 'isTyping': true}
        ));
        
        // Tắt typing sau 3 giây
        Future.delayed(const Duration(seconds: 3), () {
          _eventController.add(WebSocketEvent(
            type: 'typing',
            data: {'senderUuid': 'FRIEND-001', 'isTyping': false}
          ));
        });
      } else if (random == 1) {
        // Mô phỏng nhận tin nhắn mới
        _eventController.add(WebSocketEvent(
          type: 'new_message',
          data: {
            'senderUuid': 'FRIEND-001',
            'content': 'Chào bạn, đây là tin nhắn tự động từ WebSocket!',
            'conversationUuid': 'CONV-001'
          }
        ));
      } else {
        // Mô phỏng cuộc gọi đến
        _eventController.add(WebSocketEvent(
          type: 'incoming_call',
          data: {'callerName': 'John Doe', 'callType': 'video'}
        ));
      }
    });
  }

  void disconnect() {
    _mockTimer?.cancel();
    _eventController.close();
    print("WebSocket: Đã ngắt kết nối");
  }
}
