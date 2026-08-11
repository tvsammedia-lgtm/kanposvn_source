import '../module_enum.dart';
import 'ai_assistant_data.dart';
import 'ai_assistant_models.dart';

/// Trợ lý ảo rule-based: khớp câu hỏi với từ khóa nghiệp vụ của module.
class AiAssistantService {
  static const List<AiAssistantTopic> _greetings = [
    AiAssistantTopic(
      ['chao', 'hello', 'hi', 'helo', 'xin chao', 'alo'],
      'Chào bạn! Rất vui được hỗ trợ. Bạn có thể hỏi mình về các chức năng '
          'của module, hoặc thử các câu hỏi gợi ý bên dưới.',
    ),
  ];

  static const List<AiAssistantTopic> _thanks = [
    AiAssistantTopic(
      ['cam on', 'cảm ơn', 'thanks', 'thank', 'tks', 'ok'],
      'Không có gì! Nếu cần hỗ trợ thêm, bạn cứ hỏi mình nhé.',
    ),
  ];

  /// Trả lời cho câu hỏi của user trong ngữ cảnh module.
  String reply(AppModule module, String question) {
    final normalized = normalize(question);
    final data = assistantDataFor(module);

    if (normalized.isEmpty) {
      return data.intro;
    }

    final greeting = _findMatch(_greetings, normalized);
    if (greeting != null) return greeting.answer;

    final thanks = _findMatch(_thanks, normalized);
    if (thanks != null) return thanks.answer;

    final topic = _findMatch(data.topics, normalized);
    if (topic != null) return topic.answer;

    return 'Mình chưa rõ câu hỏi "${question.trim()}" thuộc phần nào của '
        '"${data.assistantName}". Bạn có thể hỏi về: bán hàng, kho, thu chi, '
        'báo cáo, hoặc bấm vào một câu gợi ý bên dưới để mình hướng dẫn nhé.';
  }

  AiAssistantTopic? _findMatch(List<AiAssistantTopic> topics, String normalized) {
    AiAssistantTopic? best;
    var bestLength = 0;
    for (final topic in topics) {
      for (final kw in topic.keywords) {
        final key = normalize(kw);
        if (key.isNotEmpty &&
            normalized.contains(key) &&
            key.length > bestLength) {
          best = topic;
          bestLength = key.length;
        }
      }
    }
    return best;
  }
}

/// Chuẩn hóa chuỗi: bỏ dấu tiếng Việt, lowercase, rút gọn khoảng trắng.
String normalize(String input) {
  final withDiacritics = 'áàảãạăắằẳẵặâấầẩẫậđéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵ';
  final withoutDiacritics = 'aaaaaaaaaaaaaaaaadeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuuyyyyy';
  final buffer = StringBuffer();
  for (final ch in input.toLowerCase().split('')) {
    final idx = withDiacritics.indexOf(ch);
    buffer.write(idx >= 0 ? withoutDiacritics[idx] : ch);
  }
  return buffer
      .toString()
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}
