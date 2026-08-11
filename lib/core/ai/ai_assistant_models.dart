import '../module_enum.dart';

/// Một chủ đề (FAQ) mà trợ lý ảo có thể trả lời.
class AiAssistantTopic {
  /// Các từ khóa để khớp câu hỏi của user (kèm cả bản không dấu).
  final List<String> keywords;
  final String answer;

  const AiAssistantTopic(this.keywords, this.answer);
}

/// Dữ liệu trợ lý ảo cho một module.
class AiAssistantModuleData {
  final AppModule module;
  final String assistantName;
  final String intro;
  final List<String> suggestions;
  final List<AiAssistantTopic> topics;

  const AiAssistantModuleData({
    required this.module,
    required this.assistantName,
    required this.intro,
    required this.suggestions,
    required this.topics,
  });
}
