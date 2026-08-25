import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/call_history.dart';
import '../models/contact.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../models/user.dart';
import '../models/videocall_ops_models.dart';

/// Toàn bộ nghiệp vụ chat/gọi theo kanposvn_videocall.md (offline-first).
class VideoCallBusinessLogic {
  static const uuid = Uuid();

  // ══════════════ §5-§6. USER & DANH BẠ ══════════════

  static Future<VideoCallUser> registerUser(Isar db,
      {required String username,
      required String displayName,
      required String phone,
      required String passwordHash,
      String email = ''}) async {
    final dup =
        await db.videoCallUsers.filter().usernameEqualTo(username).findFirst();
    if (dup != null) throw Exception('Username đã tồn tại.');
    final dupPhone = await db.videoCallUsers
        .filter()
        .phoneEqualTo(phone)
        .findFirst();
    if (dupPhone != null) throw Exception('Số điện thoại đã đăng ký.');

    late VideoCallUser u;
    await db.writeTxn(() async {
      u = VideoCallUser()
        ..uuid = 'user_${username.toLowerCase()}'
        ..username = username
        ..displayName = displayName
        ..phone = phone
        ..email = email
        ..passwordHash = passwordHash
        ..status = UserStatus.online
        ..lastSeen = DateTime.now()
        ..createdAt = DateTime.now()
        ..syncStatus = SyncStatus.pending; // §16 chờ sync lên server
      await db.videoCallUsers.put(u);
    });
    await _enqueue(db, 'USER', u.uuid!, 'CREATE');
    return u;
  }

  /// §6. Tìm người dùng theo username / SĐT / tên hiển thị.
  static Future<List<VideoCallUser>> searchUsers(Isar db, String query) async {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return [];
    return db.videoCallUsers
        .filter()
        .usernameContains(q, caseSensitive: false)
        .or()
        .phoneContains(q)
        .or()
        .displayNameContains(q, caseSensitive: false)
        .findAll();
  }

  /// Gửi lời mời kết bạn: tạo contact PENDING cho cả 2 phía.
  static Future<void> sendFriendRequest(
      Isar db, VideoCallUser owner, VideoCallUser target) async {
    if (owner.uuid == target.uuid) throw Exception('Không thể tự kết bạn.');
    final existing = await db.videoCallContacts
        .filter()
        .ownerUuidEqualTo(owner.uuid!)
        .contactUuidEqualTo(target.uuid!)
        .findFirst();
    if (existing != null && existing.status != ContactStatus.rejected) {
      throw Exception('Đã có quan hệ danh bạ với ${target.displayName}.');
    }
    await db.writeTxn(() async {
      for (final pair in [
        [owner.uuid!, target.uuid!],
        [target.uuid!, owner.uuid!]
      ]) {
        await db.videoCallContacts.put(VideoCallContact()
          ..uuid = 'ct_${pair[0]}_${pair[1]}'
          ..ownerUuid = pair[0]
          ..contactUuid = pair[1]
          ..contactName = pair[1] == target.uuid ? target.displayName : owner.displayName
          ..status = ContactStatus.pending);
      }
    });
  }

  /// Chấp nhận lời mời -> cả 2 chuyển accepted.
  static Future<void> acceptFriendRequest(
      Isar db, VideoCallUser owner, VideoCallUser requester) async {
    await db.writeTxn(() async {
      for (final pair in [
        [owner.uuid!, requester.uuid!],
        [requester.uuid!, owner.uuid!]
      ]) {
        final c = await db.videoCallContacts
            .filter()
            .ownerUuidEqualTo(pair[0])
            .contactUuidEqualTo(pair[1])
            .findFirst();
        if (c != null) {
          c.status = ContactStatus.accepted;
          c.contactName ??= pair[1];
          await db.videoCallContacts.put(c);
        }
      }
    });
  }

  static Future<void> rejectFriendRequest(
      Isar db, VideoCallUser owner, VideoCallUser requester) async {
    await db.writeTxn(() async {
      final c = await db.videoCallContacts
          .filter()
          .ownerUuidEqualTo(owner.uuid!)
          .contactUuidEqualTo(requester.uuid!)
          .findFirst();
      if (c != null) {
        c.status = ContactStatus.rejected;
        await db.videoCallContacts.put(c);
      }
    });
  }

  static Future<void> blockUser(
      Isar db, VideoCallUser owner, VideoCallUser target) async {
    await db.writeTxn(() async {
      final c = await db.videoCallContacts
          .filter()
          .ownerUuidEqualTo(owner.uuid!)
          .contactUuidEqualTo(target.uuid!)
          .findFirst();
      if (c == null) throw Exception('Chưa có trong danh bạ.');
      c.status = ContactStatus.blocked;
      await db.videoCallContacts.put(c);
    });
  }

  static Future<void> unblockUser(
      Isar db, VideoCallUser owner, VideoCallUser target) async {
    await db.writeTxn(() async {
      final c = await db.videoCallContacts
          .filter()
          .ownerUuidEqualTo(owner.uuid!)
          .contactUuidEqualTo(target.uuid!)
          .findFirst();
      if (c != null && c.status == ContactStatus.blocked) {
        c.status = ContactStatus.accepted;
        await db.videoCallContacts.put(c);
      }
    });
  }

  /// Kiểm tra 2 user được phép nhắn tin/gọi nhau.
  static Future<bool> canInteract(
      Isar db, String aUuid, String bUuid) async {
    final c = await db.videoCallContacts
        .filter()
        .ownerUuidEqualTo(aUuid)
        .contactUuidEqualTo(bUuid)
        .findFirst();
    if (c == null) return false;
    return c.status == ContactStatus.accepted;
  }

  // ══════════════ §7+§15+§19. CHAT 1-1 OFFLINE-FIRST ══════════════

  /// Lấy/tạo conversation direct giữa 2 người.
  static Future<VideoCallConversation> getOrCreateDirectConversation(
      Isar db, String aUuid, String bUuid) async {
    final convs = await db.videoCallConversations
        .filter()
        .typeEqualTo(ConversationType.direct)
        .memberUuidsElementContains(aUuid)
        .findAll();
    for (final c in convs) {
      if (c.memberUuids.contains(bUuid)) return c;
    }
    late VideoCallConversation conv;
    await db.writeTxn(() async {
      conv = VideoCallConversation()
        ..uuid = 'conv_${aUuid}_$bUuid'
        ..type = ConversationType.direct
        ..memberUuids = [aUuid, bUuid]
        ..createdAt = DateTime.now();
      await db.videoCallConversations.put(conv);
    });
    return conv;
  }

  /// Gửi tin nhắn: lưu local status=pending + clientMessageId chống trùng
  /// (§19). Trả về message đã tạo. Nếu trùng clientMessageId -> trả bản cũ.
  static Future<VideoCallMessage> sendMessage(
    Isar db, {
    required String conversationUuid,
    required String senderUuid,
    String text = '',
    MessageType type = MessageType.text,
    String? attachmentUrl,
    String? replyToId,
    String? clientMessageId,
  }) async {
    final cmid = clientMessageId ?? uuid.v4();

    // §19. Duplicate check.
    final dup = await db.videoCallMessages
        .filter()
        .clientMessageIdEqualTo(cmid)
        .findFirst();
    if (dup != null) return dup;

    if ((type == MessageType.text || type == MessageType.system) &&
        text.trim().isEmpty) {
      throw Exception('Tin nhắn văn bản không được trống.');
    }

    final conv = await db.videoCallConversations
        .filter()
        .uuidEqualTo(conversationUuid)
        .findFirst();
    if (conv == null) throw Exception('Không tìm thấy cuộc trò chuyện.');

    late VideoCallMessage m;
    await db.writeTxn(() async {
      m = VideoCallMessage()
        ..clientMessageId = cmid
        ..conversationUuid = conversationUuid
        ..senderUuid = senderUuid
        ..messageType = type
        ..content = text.isEmpty ? null : text
        ..attachmentUrl = attachmentUrl
        ..replyToId = replyToId
        ..status = MessageStatus.pending // §16 offline-first
        ..createdAt = DateTime.now()
        ..syncStatus = SyncStatus.pending;
      await db.videoCallMessages.put(m);

      conv.lastMessageId = m.clientMessageId;
      conv.lastMessageContent = text;
      conv.lastMessageAt = m.createdAt;
      await db.videoCallConversations.put(conv);
    });
    await _enqueue(db, 'MESSAGE', cmid, 'CREATE');
    return m;
  }

  /// §16+§18+§43. Flush hàng đợi: mô phỏng server nhận -> gán serverId +
  /// chuyển pending/sending thành sent.
  static Future<int> flushPendingMessages(Isar db) async {
    final pendings = await db.videoCallMessages
        .filter()
        .statusEqualTo(MessageStatus.pending)
        .findAll();
    await db.writeTxn(() async {
      for (final m in pendings) {
        m.serverId = 'srv_${m.clientMessageId}';
        m.status = MessageStatus.sent;
        m.syncStatus = SyncStatus.synced;
        m.updatedAt = DateTime.now();
        await db.videoCallMessages.put(m);
      }
    });
    return pendings.length;
  }

  static Future<int> pendingMessageCount(Isar db) async {
    return db.videoCallMessages
        .filter()
        .statusEqualTo(MessageStatus.pending)
        .count();
  }

  /// Đối phương nhận/đọc: delivered/read cho các tin của mình trong hội thoại.
  static Future<void> markConversationDelivered(Isar db, String conversationUuid,
      {String exceptSenderUuid = ''}) async {
    final msgs = await db.videoCallMessages
        .filter()
        .conversationUuidEqualTo(conversationUuid)
        .statusEqualTo(MessageStatus.sent)
        .findAll();
    await db.writeTxn(() async {
      for (final m in msgs) {
        if (m.senderUuid == exceptSenderUuid) continue;
        m.status = MessageStatus.delivered;
        await db.videoCallMessages.put(m);
      }
    });
  }

  static Future<void> markConversationRead(Isar db, String conversationUuid,
      {String readerUuid = ''}) async {
    final msgs = await db.videoCallMessages
        .filter()
        .conversationUuidEqualTo(conversationUuid)
        .findAll();
    await db.writeTxn(() async {
      for (final m in msgs) {
        if (m.senderUuid == readerUuid) continue;
        if (m.status == MessageStatus.sent ||
            m.status == MessageStatus.delivered) {
          m.status = MessageStatus.read;
          await db.videoCallMessages.put(m);
        }
      }
    });
  }

  /// §7. Sửa tin nhắn (chỉ người gửi, chỉ tin đã gửi).
  static Future<void> editMessage(
      Isar db, String clientMessageId, String senderUuid, String newText) async {
    final m = await db.videoCallMessages
        .filter()
        .clientMessageIdEqualTo(clientMessageId)
        .findFirst();
    if (m == null) throw Exception('Không tìm thấy tin nhắn.');
    if (m.senderUuid != senderUuid) {
      throw Exception('Chỉ người gửi mới được sửa.');
    }
    if (m.status == MessageStatus.deleted) throw Exception('Tin đã xóa.');
    await db.writeTxn(() async {
      m.content = newText;
      m.isEdited = true;
      m.updatedAt = DateTime.now();
      await db.videoCallMessages.put(m);
    });
  }

  /// §7. Xóa tin (soft delete).
  static Future<void> deleteMessage(
      Isar db, String clientMessageId, String requesterUuid) async {
    final m = await db.videoCallMessages
        .filter()
        .clientMessageIdEqualTo(clientMessageId)
        .findFirst();
    if (m == null) return;
    if (m.senderUuid != requesterUuid) throw Exception('Không có quyền xóa.');
    await db.writeTxn(() async {
      m.deletedAt = DateTime.now();
      m.status = MessageStatus.deleted;
      m.content = null;
      await db.videoCallMessages.put(m);
    });
  }

  /// §50. React emoji — toggle: react lại cùng emoji thì bỏ.
  static Future<void> toggleReaction(
      Isar db, String clientMessageId, String userId, String emoji) async {
    final rid = '${clientMessageId}_$userId';
    final exist = await db.videoCallReactions
        .filter()
        .reactionIdEqualTo(rid)
        .findFirst();
    await db.writeTxn(() async {
      if (exist != null) {
        if (exist.emoji == emoji) {
          await db.videoCallReactions.delete(exist.id);
          return;
        }
        exist.emoji = emoji;
        await db.videoCallReactions.put(exist);
      } else {
        await db.videoCallReactions.put(VideoCallReaction()
          ..reactionId = rid
          ..clientMessageId = clientMessageId
          ..userId = userId
          ..emoji = emoji);
      }
    });
  }

  /// §44. Tìm kiếm tin nhắn local.
  static Future<List<VideoCallMessage>> searchMessages(Isar db, String query,
      {String? conversationUuid}) async {
    var f = db.videoCallMessages.filter().contentContains(query, caseSensitive: false);
    if (conversationUuid != null) {
      f = f.and().conversationUuidEqualTo(conversationUuid);
    }
    return f.sortByCreatedAtDesc().findAll();
  }

  // ══════════════ §8. NHÓM ══════════════

  /// Quyền: creator là owner; adminUuids giữ co-admin.
  static Future<VideoCallConversation> createGroup(Isar db,
      {required String name,
      required String creatorUuid,
      List<String> memberUuids = const []}) async {
    late VideoCallConversation conv;
    await db.writeTxn(() async {
      conv = VideoCallConversation()
        ..uuid = 'grp_${DateTime.now().millisecondsSinceEpoch}'
        ..type = ConversationType.group
        ..name = name
        ..memberUuids = [creatorUuid, ...memberUuids.where((m) => m != creatorUuid)]
        ..createdAt = DateTime.now()
        ..syncStatus = SyncStatus.pending;
      await db.videoCallConversations.put(conv);
      await _addSystemMessage(db, conv, '$creatorUuid đã tạo nhóm "$name"');
    });
    return conv;
  }

  static bool isGroupOwner(VideoCallConversation conv, String uuid) =>
      conv.createdAt != null &&
      conv.memberUuids.isNotEmpty &&
      uuid == conv.memberUuids.first;

  /// Thêm thành viên (yêu cầu owner/admin — đơn giản: owner là member đầu tiên).
  static Future<void> addGroupMember(
      Isar db, VideoCallConversation conv, String actorUuid, String newMemberUuid) async {
    _requireGroup(conv);
    if (!isGroupOwner(conv, actorUuid)) {
      throw Exception('Chỉ owner/admin mới thêm thành viên.');
    }
    if (conv.memberUuids.contains(newMemberUuid)) {
      throw Exception('Đã là thành viên.');
    }
    await db.writeTxn(() async {
      conv.memberUuids = [...conv.memberUuids, newMemberUuid];
      await db.videoCallConversations.put(conv);
      await _addSystemMessage(db, conv, '$actorUuid đã thêm $newMemberUuid vào nhóm');
    });
  }

  static Future<void> removeGroupMember(
      Isar db, VideoCallConversation conv, String actorUuid, String memberUuid) async {
    _requireGroup(conv);
    if (!isGroupOwner(conv, actorUuid)) throw Exception('Chỉ owner/admin được xóa.');
    if (memberUuid == actorUuid) throw Exception('Dùng "Rời nhóm".');
    await db.writeTxn(() async {
      conv.memberUuids = conv.memberUuids.where((m) => m != memberUuid).toList();
      await db.videoCallConversations.put(conv);
      await _addSystemMessage(db, conv, '$actorUuid đã xóa $memberUuid khỏi nhóm');
    });
  }

  static Future<void> leaveGroup(
      Isar db, VideoCallConversation conv, String actorUuid) async {
    _requireGroup(conv);
    if (!conv.memberUuids.contains(actorUuid)) {
      throw Exception('Bạn không ở trong nhóm.');
    }
    if (isGroupOwner(conv, actorUuid) && conv.memberUuids.length > 1) {
      throw Exception('Owner phải chuyển quyền hoặc giải tán nhóm trước.');
    }
    await db.writeTxn(() async {
      conv.memberUuids = conv.memberUuids.where((m) => m != actorUuid).toList();
      await db.videoCallConversations.put(conv);
      await _addSystemMessage(db, conv, '$actorUuid đã rời nhóm');
    });
  }

  /// Giải tán: chỉ owner, xóa mềm toàn bộ hội thoại.
  static Future<void> dissolveGroup(
      Isar db, VideoCallConversation conv, String actorUuid) async {
    _requireGroup(conv);
    if (!isGroupOwner(conv, actorUuid)) {
      throw Exception('Chỉ owner mới giải tán nhóm.');
    }
    await db.writeTxn(() async {
      final msgs = await db.videoCallMessages
          .filter()
          .conversationUuidEqualTo(conv.uuid!)
          .findAll();
      for (final m in msgs) {
        m.deletedAt = DateTime.now();
        m.status = MessageStatus.deleted;
        await db.videoCallMessages.put(m);
      }
      await db.videoCallConversations.delete(conv.id);
    });
  }

  static void _requireGroup(VideoCallConversation conv) {
    if (conv.type != ConversationType.group) {
      throw Exception('Chức năng chỉ dành cho chat nhóm.');
    }
  }

  /// System message (§MessageType.system).
  static Future<void> _addSystemMessage(
      Isar db, VideoCallConversation conv, String text) async {
    await db.videoCallMessages.put(VideoCallMessage()
      ..clientMessageId = uuid.v4()
      ..conversationUuid = conv.uuid
      ..senderUuid = 'SYSTEM'
      ..messageType = MessageType.system
      ..content = text
      ..status = MessageStatus.sent
      ..createdAt = DateTime.now());
    conv.lastMessageContent = text;
    conv.lastMessageAt = DateTime.now();
    await db.videoCallConversations.put(conv);
  }

  // ══════════════ §9-§12+§29. CUỘC GỌI (12 trạng thái) ══════════════

  /// A gọi B: state calling + tạo lịch sử (startedAt).
  static Future<VideoCallSession> startCall(Isar db,
      {required VideoCallUser caller,
      required VideoCallUser receiver,
      required String callType}) async {
    if (caller.uuid == receiver.uuid) throw Exception('Không thể tự gọi mình.');
    if (!(await canInteract(db, caller.uuid!, receiver.uuid!))) {
      throw Exception('Chỉ gọi được người trong danh bạ (đã kết bạn).');
    }
    late VideoCallSession s;
    await db.writeTxn(() async {
      s = VideoCallSession()
        ..callId = 'call_${DateTime.now().millisecondsSinceEpoch}'
        ..callerUuid = caller.uuid!
        ..receiverUuid = receiver.uuid!
        ..callType = callType
        ..state = CallSessionState.calling
        ..createdAt = DateTime.now();
      await db.videoCallSessions.put(s);
      await db.videoCallHistorys.put(VideoCallHistory()
        ..uuid = 'hist_${s.callId}'
        ..callerUuid = caller.uuid
        ..receiverUuid = receiver.uuid
        ..type = callType == 'video' ? CallType.video : CallType.voice
        ..status = CallHistoryStatus.missed // mặc định; cập nhật khi kết thúc
        ..startedAt = DateTime.now());
    });
    return s;
  }

  /// B điện thoại reo -> ringing.
  static Future<VideoCallSession> markRinging(Isar db, String callId) =>
      _transition(db, callId, CallSessionState.ringing, from: [CallSessionState.calling]);

  /// B chấp nhận -> accepted.
  static Future<VideoCallSession> acceptCall(Isar db, String callId) async {
    final s = await _transition(db, callId, CallSessionState.accepted,
        from: [CallSessionState.calling, CallSessionState.ringing]);
    await db.writeTxn(() async {
      final h = await db.videoCallHistorys
          .filter()
          .uuidEqualTo('hist_$callId')
          .findFirst();
      if (h != null) h.answeredAt = DateTime.now();
      if (h != null) await db.videoCallHistorys.put(h);
    });
    return s;
  }

  /// WebRTC handshake xong -> connected (ghi connectedAt để tính duration).
  static Future<VideoCallSession> connectCall(Isar db, String callId) async {
    final s = await _transition(db, callId, CallSessionState.connected,
        from: [CallSessionState.accepted, CallSessionState.connecting]);
    await db.writeTxn(() async {
      s.connectedAt = DateTime.now();
      await db.videoCallSessions.put(s);
    });
    return s;
  }

  static Future<VideoCallSession> connectingCall(Isar db, String callId) =>
      _transition(db, callId, CallSessionState.connecting,
          from: [CallSessionState.accepted]);

  /// Kết thúc: tính duration, cập nhật lịch sử Completed.
  static Future<VideoCallHistory> endCall(Isar db, String callId) async {
    final s = await _transition(db, callId, CallSessionState.ended,
        from: [CallSessionState.connected, CallSessionState.reconnecting]);
    late VideoCallHistory h;
    await db.writeTxn(() async {
      s.endedAt = DateTime.now();
      await db.videoCallSessions.put(s);
      h = (await db.videoCallHistorys
              .filter()
              .uuidEqualTo('hist_$callId')
              .findFirst())!;
      h.endedAt = s.endedAt;
      h.durationSeconds =
          s.connectedAt?.difference(s.createdAt).inSeconds ?? 0;
      h.status = CallHistoryStatus.completed;
      await db.videoCallHistorys.put(h);
    });
    return h;
  }

  static Future<VideoCallHistory> rejectCall(Isar db, String callId) async {
    await _transition(db, callId, CallSessionState.rejected,
        from: [CallSessionState.calling, CallSessionState.ringing]);
    return _closeHistory(db, callId, CallHistoryStatus.rejected);
  }

  static Future<VideoCallHistory> cancelCall(Isar db, String callId) async {
    await _transition(db, callId, CallSessionState.cancelled,
        from: [CallSessionState.calling, CallSessionState.ringing]);
    return _closeHistory(db, callId, CallHistoryStatus.cancelled);
  }

  /// Không ai bắt máy sau timeout -> missed.
  static Future<VideoCallHistory> markMissed(Isar db, String callId) async {
    await _transition(db, callId, CallSessionState.missed,
        from: [CallSessionState.calling, CallSessionState.ringing]);
    return _closeHistory(db, callId, CallHistoryStatus.missed);
  }

  static Future<VideoCallHistory> busyCall(Isar db, String callId) async {
    await _transition(db, callId, CallSessionState.busy,
        from: [CallSessionState.calling, CallSessionState.ringing]);
    return _closeHistory(db, callId, CallHistoryStatus.missed);
  }

  static Future<VideoCallSession> reconnectingCall(Isar db, String callId) =>
      _transition(db, callId, CallSessionState.reconnecting,
          from: [CallSessionState.connected]);

  static Future<VideoCallSession> failCall(Isar db, String callId) async {
    final s = await _transition(db, callId, CallSessionState.failed,
        from: CallSessionState.values);
    return s;
  }

  static Future<VideoCallSession> _transition(Isar db, String callId,
      CallSessionState to,
      {List<CallSessionState> from = const []}) async {
    final s = await db.videoCallSessions.filter().callIdEqualTo(callId).findFirst();
    if (s == null) throw Exception('Không tìm thấy cuộc gọi $callId');
    if (from.isNotEmpty && !from.contains(s.state)) {
      throw Exception(
          'Không chuyển từ ${s.state.name} sang ${to.name}.');
    }
    await db.writeTxn(() async {
      s.state = to;
      await db.videoCallSessions.put(s);
    });
    return s;
  }

  static Future<VideoCallHistory> _closeHistory(
      Isar db, String callId, CallHistoryStatus status) async {
    late VideoCallHistory h;
    await db.writeTxn(() async {
      h = (await db.videoCallHistorys
              .filter()
              .uuidEqualTo('hist_$callId')
              .findFirst())!;
      h.endedAt = DateTime.now();
      h.durationSeconds = 0;
      h.status = status;
      await db.videoCallHistorys.put(h);
      final s = await db.videoCallSessions.filter().callIdEqualTo(callId).findFirst();
      if (s != null) {
        s.endedAt = h.endedAt;
        await db.videoCallSessions.put(s);
      }
    });
    return h;
  }

  // ══════════════ §43. SYNC QUEUE ══════════════

  static Future<void> _enqueue(Isar db, String entity, String entityUuid,
      String operation,
      {Map<String, dynamic>? payload}) async {
    await db.writeTxn(() async {
      await db.videoCallSyncQueueItems.put(VideoCallSyncQueueItem()
        ..queueId = 'q_${entity}_${entityUuid}_$operation'
        ..entityType = entity
        ..entityUuid = entityUuid
        ..operation = operation
        ..payloadJson = jsonEncode(payload ?? {})
        ..updatedAt = DateTime.now());
    });
  }

  static Future<int> pendingSyncCount(Isar db) async {
    return db.videoCallSyncQueueItems.filter().statusEqualTo('PENDING').count();
  }

  static Future<int> flushSyncQueue(Isar db) async {
    final pendings = await db.videoCallSyncQueueItems
        .filter()
        .statusEqualTo('PENDING')
        .findAll();
    await db.writeTxn(() async {
      for (final p in pendings) {
        p.status = 'SYNCED';
        p.updatedAt = DateTime.now();
        await db.videoCallSyncQueueItems.put(p);
      }
    });
    return pendings.length;
  }

  // ══════════════ §53+§54. DASHBOARD & BÁO CÁO CUỘC GỌI ══════════════

  static Future<Map<String, dynamic>> dashboardSummary(Isar db) async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final tomorrow = todayStart.add(const Duration(days: 1));
    final monthStart = DateTime(now.year, now.month);

    final users = await db.videoCallUsers.where().findAll();
    final convs = await db.videoCallConversations.where().findAll();
    final messages = await db.videoCallMessages.where().findAll();
    final calls = await db.videoCallHistorys.where().findAll();

    return {
      'totalUsers': users.length,
      'onlineUsers': users.where((u) => u.status == UserStatus.online).length,
      'newUsersThisMonth': users
          .where((u) =>
              u.createdAt != null && u.createdAt!.isAfter(monthStart))
          .length,
      'totalConversations': convs.length,
      'messagesToday': messages
          .where((m) =>
              m.createdAt != null &&
              !m.createdAt!.isBefore(todayStart) &&
              m.createdAt!.isBefore(tomorrow))
          .length,
      'callsToday': calls
          .where((c) =>
              c.startedAt != null &&
              !c.startedAt!.isBefore(todayStart) &&
              c.startedAt!.isBefore(tomorrow))
          .length,
      'videoCalls': calls.where((c) => c.type == CallType.video).length,
      'voiceCalls': calls.where((c) => c.type == CallType.voice).length,
    };
  }

  static Future<Map<String, dynamic>> callReport(Isar db) async {
    final calls = await db.videoCallHistorys.where().findAll();
    final completed = calls.where((c) => c.status == CallHistoryStatus.completed);
    final durations = completed.map((c) => c.durationSeconds ?? 0).toList();
    final avg = durations.isEmpty
        ? 0.0
        : durations.reduce((a, b) => a + b) / durations.length;
    return {
      'totalCalls': calls.length,
      'completed': completed.length,
      'rejected': calls.where((c) => c.status == CallHistoryStatus.rejected).length,
      'missed': calls.where((c) => c.status == CallHistoryStatus.missed).length,
      'cancelled': calls.where((c) => c.status == CallHistoryStatus.cancelled).length,
      'avgDurationSeconds': avg,
      'videoCalls': calls.where((c) => c.type == CallType.video).length,
      'voiceCalls': calls.where((c) => c.type == CallType.voice).length,
    };
  }
}
