import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ai_assistant_service.dart';

final aiAssistantServiceProvider = Provider<AiAssistantService>((ref) {
  return AiAssistantService();
});
