import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user.dart';
import '../models/contact.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../models/call_history.dart';
import '../models/videocall_ops_models.dart';

Isar? _videoCallIsar;

final videoCallIsarProvider = Provider<Isar>((ref) {
  final isar = _videoCallIsar;
  if (isar != null) return isar;
  throw UnimplementedError('Isar is not initialized yet');
});

class VideoCallDatabaseSetup {
  static Future<Isar> init() async {
    if (_videoCallIsar != null && _videoCallIsar!.isOpen) return _videoCallIsar!;
    if (Isar.instanceNames.contains('kanposvnvideocall_db')) {
      _videoCallIsar = Isar.getInstance('kanposvnvideocall_db')!;
      return _videoCallIsar!;
    }
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
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
      name: 'kanposvnvideocall_db',
    );
    _videoCallIsar = isar;
    return isar;
  }
}
