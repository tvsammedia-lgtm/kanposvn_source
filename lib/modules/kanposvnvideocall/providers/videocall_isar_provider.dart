import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user.dart';
import '../models/contact.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../models/call_history.dart';
import '../models/videocall_ops_models.dart';

final videoCallIsarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('videoCallIsarProvider must be overridden');
});

class VideoCallDatabaseSetup {
  static Future<Isar> init() async {
    const name = 'kanposvnvideocall_db';
    final existing = Isar.getInstance(name);
    if (existing != null && existing.isOpen) return existing;
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        VideoCallUserSchema,
        VideoCallContactSchema,
        VideoCallConversationSchema,
        VideoCallMessageSchema,
        VideoCallHistorySchema,
        VideoCallSessionSchema,
        VideoCallReactionSchema,
        VideoCallSyncQueueItemSchema,
      ],
      directory: dir.path,
      name: name,
    );
  }
}
