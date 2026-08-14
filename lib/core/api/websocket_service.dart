import 'package:flutter/foundation.dart';
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
    debugPrint("WebSocket: ÄÃ£ káº¿t ná»‘i tá»›i wss://your-vercel-api.app");
    
    // Giáº£ láº­p Server thá»‰nh thoáº£ng Ä‘áº©y sá»± kiá»‡n vá» Client
    _mockTimer = Timer.periodic(const Duration(seconds: 15), (timer) {
      final random = Random().nextInt(3);
      if (random == 0) {
        // MÃ´ phá»ng ai Ä‘Ã³ Ä‘ang gÃµ phÃ­m
        _eventController.add(WebSocketEvent(
          type: 'typing',
          data: {'senderUuid': 'FRIEND-001', 'isTyping': true}
        ));
        
        // Táº¯t typing sau 3 giÃ¢y
        Future.delayed(const Duration(seconds: 3), () {
          _eventController.add(WebSocketEvent(
            type: 'typing',
            data: {'senderUuid': 'FRIEND-001', 'isTyping': false}
          ));
        });
      } else if (random == 1) {
        // MÃ´ phá»ng nháº­n tin nháº¯n má»›i
        _eventController.add(WebSocketEvent(
          type: 'new_message',
          data: {
            'senderUuid': 'FRIEND-001',
            'content': 'ChÃ o báº¡n, Ä‘Ã¢y lÃ  tin nháº¯n tá»± Ä‘á»™ng tá»« WebSocket!',
            'conversationUuid': 'CONV-001'
          }
        ));
      } else {
        // MÃ´ phá»ng cuá»™c gá»i Ä‘áº¿n
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
    debugPrint("WebSocket: ÄÃ£ ngáº¯t káº¿t ná»‘i");
  }
}

