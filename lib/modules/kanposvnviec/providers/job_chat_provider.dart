import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/job_chat.dart';
import 'job_isar_provider.dart';

final jobChatProvider = StateNotifierProvider.family<JobChatNotifier, AsyncValue<List<JobChat>>, String>((ref, jobUuid) {
  final isar = ref.watch(jobIsarProvider);
  return JobChatNotifier(isar, jobUuid);
});

class JobChatNotifier extends StateNotifier<AsyncValue<List<JobChat>>> {
  final Isar isar;
  final String jobUuid;
  Timer? _botTimer;

  JobChatNotifier(this.isar, this.jobUuid) : super(const AsyncValue.loading()) {
    _loadChat();
  }

  Future<void> _loadChat() async {
    try {
      final msgs = await isar.jobChats.where().jobUuidEqualTo(jobUuid).sortByCreatedAt().findAll();
      state = AsyncValue.data(msgs);

      // Nếu chưa có tin nhắn nào, Bot sẽ chào hỏi trước
      if (msgs.isEmpty) {
        await Future.delayed(const Duration(seconds: 1));
        await _botReply('Chào bạn! Cảm ơn bạn đã ứng tuyển. Bạn đã có kinh nghiệm ở vị trí này chưa?');
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> sendMessage(String text) async {
    final currentMsgs = state.value ?? [];
    
    final msg = JobChat()
      ..jobUuid = jobUuid
      ..sender = 'USER'
      ..message = text
      ..createdAt = DateTime.now();

    // Lạc quan update UI
    state = AsyncValue.data([...currentMsgs, msg]);

    try {
      await isar.writeTxn(() async {
        await isar.jobChats.put(msg);
      });

      // Kích hoạt bot trả lời tự động sau 2 giây
      _botTimer?.cancel();
      _botTimer = Timer(const Duration(seconds: 2), () {
        _handleBotLogic(currentMsgs.length + 1);
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> _handleBotLogic(int messageCount) async {
    if (messageCount == 2) {
      await _botReply('Rất tốt. Bạn có thể làm việc xoay ca (sáng/tối) được không?');
    } else if (messageCount == 4) {
      await _botReply('Cảm ơn bạn. Mức lương mong muốn của bạn là bao nhiêu?');
    } else if (messageCount >= 6) {
      await _botReply('Tuyệt vời! Phòng nhân sự sẽ xem xét CV của bạn và liên hệ hẹn lịch phỏng vấn trực tiếp nhé. Chúc bạn một ngày vui vẻ!');
    }
  }

  Future<void> _botReply(String text) async {
    final msg = JobChat()
      ..jobUuid = jobUuid
      ..sender = 'HR_BOT'
      ..message = text
      ..createdAt = DateTime.now();

    await isar.writeTxn(() async {
      await isar.jobChats.put(msg);
    });

    final currentMsgs = state.value ?? [];
    state = AsyncValue.data([...currentMsgs, msg]);
  }

  @override
  void dispose() {
    _botTimer?.cancel();
    super.dispose();
  }
}
