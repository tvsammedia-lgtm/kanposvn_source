import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

import '../models/real_estate_comment.dart';
import 'bds_isar_provider.dart';

// Tham số truyền vào là UUID của bài BĐS
final realEstateCommentProvider = StateNotifierProvider.family<RealEstateCommentNotifier, AsyncValue<List<RealEstateComment>>, String>((ref, bdsUuid) {
  final isar = ref.watch(bdsIsarProvider);
  return RealEstateCommentNotifier(isar, bdsUuid);
});

class RealEstateCommentNotifier extends StateNotifier<AsyncValue<List<RealEstateComment>>> {
  final Isar isar;
  final String bdsUuid;
  final uuid = const Uuid();
  Timer? _botTimer;

  RealEstateCommentNotifier(this.isar, this.bdsUuid) : super(const AsyncValue.loading()) {
    loadComments();
    _startBotSimulation();
  }

  Future<void> loadComments() async {
    try {
      final comments = await isar.realEstateComments
          .where()
          .realEstateUuidEqualTo(bdsUuid)
          .sortByCreatedAt()
          .findAll();
      state = AsyncValue.data(comments);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addComment(String userName, String content) async {
    try {
      final comment = RealEstateComment()
        ..uuid = uuid.v4()
        ..realEstateUuid = bdsUuid
        ..userName = userName
        ..content = content
        ..createdAt = DateTime.now();

      await isar.writeTxn(() async {
        await isar.realEstateComments.put(comment);
      });
      await loadComments();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // Giả lập bot chat (Real-time mockup)
  void _startBotSimulation() {
    final random = Random();
    final mockMessages = [
      "Nhà này có bớt lộc không chủ ơi?",
      "Khu vực này có ngập nước không nhỉ?",
      "Sổ sách giấy tờ pháp lý rõ ràng chứ?",
      "Ib mình xin thêm thông tin nha.",
      "Quan tâm!",
      "Nhà đẹp quá, cuối tuần mình qua xem được không?"
    ];

    final botNames = ["Tuấn Anh", "Chị Mai", "Hưng Nguyễn", "Bình BĐS", "Thanh Trúc"];

    // Cứ 5-10 giây bot sẽ nhả 1 comment
    _botTimer = Timer.periodic(Duration(seconds: 5 + random.nextInt(5)), (timer) {
      if (mounted) {
        final randomMsg = mockMessages[random.nextInt(mockMessages.length)];
        final randomName = botNames[random.nextInt(botNames.length)];
        addComment(randomName, randomMsg);
      }
    });
  }

  @override
  void dispose() {
    _botTimer?.cancel();
    super.dispose();
  }
}
