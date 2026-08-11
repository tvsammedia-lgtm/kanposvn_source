import 'package:flutter_test/flutter_test.dart';
import 'package:kanposvn/core/ai/ai_assistant_service.dart';
import 'package:kanposvn/core/module_enum.dart';

void main() {
  final service = AiAssistantService();

  test('trả lời theo nghiệp vụ của module cafe', () {
    final answer = service.reply(AppModule.kanposvncafe, 'Cách bán hàng?');
    expect(answer, contains('Bán hàng'));
    expect(answer, contains('POS'));
  });

  test('chuẩn hóa bỏ dấu tiếng Việt', () {
    expect(normalize('Bán Hàng Quán Cà Phê'), contains('ban hang'));
    expect(normalize('CÀ PHÊ'), contains('ca phe'));
  });

  test('trả lời theo nghiệp vụ của module spa', () {
    final answer = service.reply(AppModule.kanposvnspa, 'Quản lý giường spa?');
    expect(answer, contains('giường'));
  });

  test('trả lời lời chào', () {
    final answer = service.reply(AppModule.kanposvncrm, 'chào bạn');
    expect(answer, contains('Chào bạn'));
  });

  test('fallback khi module chưa có dữ liệu', () {
    final answer = service.reply(AppModule.kanposvncrm, 'cách bán hàng');
    expect(answer, contains('Bán hàng'));
  });
}
