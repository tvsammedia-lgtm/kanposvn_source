import 'package:isar/isar.dart';
import '../models/call_history.dart';
import '../models/contact.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../models/user.dart';

/// Bộ dữ liệu mẫu KanVideoCall theo kanposvn_videocall.md.
class VideoCallSeedData {
  static Future<void> seedIfEmpty(Isar db) async {
    if (await db.videoCallUsers.count() > 0) return;
    final now = DateTime.now();

    await db.writeTxn(() async {
      // ── §5. Users ──────────────────────────────────────────────
      final users = <VideoCallUser>[
        VideoCallUser()
          ..uuid = 'u_an'
          ..username = 'vanan'
          ..displayName = 'Nguyễn Văn An'
          ..phone = '0918000111'
          ..email = 'an@gmail.com'
          ..passwordHash = 'hash_an'
          ..bio = 'Yêu màu hồng'
          ..status = UserStatus.online
          ..lastSeen = now
          ..createdAt = now.subtract(const Duration(days: 300)),
        VideoCallUser()
          ..uuid = 'u_binh'
          ..username = 'thibinh'
          ..displayName = 'Trần Thị Bình'
          ..phone = '0918000222'
          ..passwordHash = 'hash_binh'
          ..status = UserStatus.busy
          ..lastSeen = now.subtract(const Duration(minutes: 5))
          ..createdAt = now.subtract(const Duration(days: 200)),
        VideoCallUser()
          ..uuid = 'u_cuong'
          ..username = 'hoangcuong'
          ..displayName = 'Lê Hoàng Cường'
          ..phone = '0918000333'
          ..passwordHash = 'hash_cuong'
          ..status = UserStatus.offline
          ..lastSeen = now.subtract(const Duration(hours: 8))
          ..createdAt = now.subtract(const Duration(days: 100)),
        VideoCallUser()
          ..uuid = 'u_dung'
          ..username = 'minhdung'
          ..displayName = 'Phạm Minh Dũng'
          ..phone = '0918000444'
          ..passwordHash = 'hash_dung'
          ..status = UserStatus.offline
          ..lastSeen = now.subtract(const Duration(days: 2))
          ..createdAt = now.subtract(const Duration(days: 10)), // user mới tháng này
        VideoCallUser()
          ..uuid = 'u_em'
          ..username = 'ngocem'
          ..displayName = 'Bùi Ngọc Em'
          ..phone = '0918000555'
          ..passwordHash = 'hash_em'
          ..status = UserStatus.offline
          ..lastSeen = now.subtract(const Duration(days: 60))
          ..createdAt = now.subtract(const Duration(days: 500)),
      ];
      await db.videoCallUsers.putAll(users);

      // ── §6. Danh bạ: accepted / pending / blocked ──────────────
      await db.videoCallContacts.putAll([
        VideoCallContact()
          ..uuid = 'ct_u_an_u_binh'
          ..ownerUuid = 'u_an'
          ..contactUuid = 'u_binh'
          ..contactName = 'Bình (đồng nghiệp)'
          ..status = ContactStatus.accepted,
        VideoCallContact()
          ..uuid = 'ct_u_binh_u_an'
          ..ownerUuid = 'u_binh'
          ..contactUuid = 'u_an'
          ..contactName = 'Văn An'
          ..status = ContactStatus.accepted,
        VideoCallContact()
          ..uuid = 'ct_u_an_u_dung'
          ..ownerUuid = 'u_an'
          ..contactUuid = 'u_dung'
          ..contactName = 'Minh Dũng'
          ..status = ContactStatus.accepted,
        VideoCallContact()
          ..uuid = 'ct_u_dung_u_an'
          ..ownerUuid = 'u_dung'
          ..contactUuid = 'u_an'
          ..contactName = 'An'
          ..status = ContactStatus.accepted,
        // Lời mời chờ: Cường -> An (§6 friend_requests)
        VideoCallContact()
          ..uuid = 'ct_u_an_u_cuong'
          ..ownerUuid = 'u_an'
          ..contactUuid = 'u_cuong'
          ..contactName = 'Hoàng Cường'
          ..status = ContactStatus.pending,
        VideoCallContact()
          ..uuid = 'ct_u_cuong_u_an'
          ..ownerUuid = 'u_cuong'
          ..contactUuid = 'u_an'
          ..contactName = 'Văn An'
          ..status = ContactStatus.pending,
        // Chặn: An chặn Em
        VideoCallContact()
          ..uuid = 'ct_u_an_u_em'
          ..ownerUuid = 'u_an'
          ..contactUuid = 'u_em'
          ..contactName = 'Spam Em'
          ..status = ContactStatus.blocked,
        VideoCallContact()
          ..uuid = 'ct_u_em_u_an'
          ..ownerUuid = 'u_em'
          ..contactUuid = 'u_an'
          ..contactName = 'An'
          ..status = ContactStatus.accepted,
      ]);

      // ── §7. Chat 1-1 An ↔ Bình ─────────────────────────────────
      final convDirect = VideoCallConversation()
        ..uuid = 'conv_an_binh'
        ..type = ConversationType.direct
        ..memberUuids = ['u_an', 'u_binh']
        ..createdAt = now.subtract(const Duration(days: 90));
      await db.videoCallConversations.put(convDirect);

      final msgs = <VideoCallMessage>[
        _msg('m1', convDirect.uuid!, 'u_binh', 'Chiều nay họp lúc mấy giờ?'),
        _msg('m2', convDirect.uuid!, 'u_an', '3 giờ nhé, phòng A102'),
        _msg('m3', convDirect.uuid!, 'u_binh', 'OK, mình sẽ mang tài liệu',
            replyTo: 'm2'),
        _msg('m4', convDirect.uuid!, 'u_an', null, type: MessageType.image,
            attachmentUrl: 'https://cdn/tailieu.png'),
      ];
      // Trạng thái đọc cho các tin cũ.
      msgs[0].status = MessageStatus.read;
      msgs[1].status = MessageStatus.read;
      msgs[2].status = MessageStatus.delivered;
      msgs[3].status = MessageStatus.sent;
      for (final m in msgs) {
        await db.videoCallMessages.put(m);
      }
      convDirect.lastMessageId = 'm4';
      convDirect.lastMessageContent = null; // ảnh
      convDirect.lastMessageAt = now.subtract(const Duration(hours: 1));
      await db.videoCallConversations.put(convDirect);

      // Tin chưa gửi (offline queue §16): An soạn khi mất mạng.
      await db.videoCallMessages.put(_msg('m_pending_1', convDirect.uuid!,
          'u_an', 'Nhớ mua cà phê về', status: MessageStatus.pending));

      // ── §8. Nhóm "Team Dự Án Alpha" 4 người ────────────────────
      final group = VideoCallConversation()
        ..uuid = 'grp_alpha'
        ..type = ConversationType.group
        ..name = 'Team Dự Án Alpha'
        ..memberUuids = ['u_an', 'u_binh', 'u_cuong', 'u_dung']
        ..createdAt = now.subtract(const Duration(days: 30));
      await db.videoCallConversations.put(group);
      await db.videoCallMessages.put(VideoCallMessage()
        ..clientMessageId = 'sys_grp_create'
        ..conversationUuid = group.uuid
        ..senderUuid = 'SYSTEM'
        ..messageType = MessageType.system
        ..content = 'u_an đã tạo nhóm "Team Dự Án Alpha"'
        ..status = MessageStatus.sent
        ..createdAt = now.subtract(const Duration(days: 30)));
      await db.videoCallMessages.put(_msg(
          'gm1', group.uuid!, 'u_cuong', 'Sprint này mình làm gì trước?'));

      // ── §29. Lịch sử cuộc gọi ──────────────────────────────────
      await db.videoCallHistorys.putAll([
        VideoCallHistory() // video completed 2h15p hôm qua
          ..uuid = 'hist_video_1'
          ..callerUuid = 'u_an'
          ..receiverUuid = 'u_binh'
          ..type = CallType.video
          ..status = CallHistoryStatus.completed
          ..startedAt = now.subtract(const Duration(days: 1, hours: 4))
          ..answeredAt =
              now.subtract(const Duration(days: 1, hours: 4)).add(const Duration(seconds: 7))
          ..endedAt =
              now.subtract(const Duration(days: 1, hours: 4)).add(const Duration(minutes: 135))
          ..durationSeconds = 135 * 60 - 420 + 420, // ~2h15
        VideoCallHistory() // voice missed hôm nay
          ..uuid = 'hist_missed_1'
          ..callerUuid = 'u_cuong'
          ..receiverUuid = 'u_an'
          ..type = CallType.voice
          ..status = CallHistoryStatus.missed
          ..startedAt = now.subtract(const Duration(hours: 3)),
        VideoCallHistory() // bị từ chối
          ..uuid = 'hist_rej_1'
          ..callerUuid = 'u_dung'
          ..receiverUuid = 'u_an'
          ..type = CallType.voice
          ..status = CallHistoryStatus.rejected
          ..startedAt = now.subtract(const Duration(hours: 26))
          ..endedAt = now.subtract(const Duration(hours: 26)),
      ]);
    });
  }

  static VideoCallMessage _msg(String cmid, String conv, String sender, String? text,
      {MessageType type = MessageType.text,
      String? attachmentUrl,
      String? replyTo,
      MessageStatus status = MessageStatus.sent}) {
    return VideoCallMessage()
      ..clientMessageId = cmid
      ..conversationUuid = conv
      ..senderUuid = sender
      ..messageType = type
      ..content = text
      ..attachmentUrl = attachmentUrl
      ..replyToId = replyTo
      ..status = status
      ..createdAt = DateTime.now();
  }
}
