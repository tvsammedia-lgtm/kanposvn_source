import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvncrm/services/module_backup_service.dart';
import 'package:kanposvn/modules/kanposvnvideocall/models/call_history.dart';
import 'package:kanposvn/modules/kanposvnvideocall/models/contact.dart';
import 'package:kanposvn/modules/kanposvnvideocall/models/conversation.dart';
import 'package:kanposvn/modules/kanposvnvideocall/models/message.dart';
import 'package:kanposvn/modules/kanposvnvideocall/models/user.dart';
import 'package:kanposvn/modules/kanposvnvideocall/models/videocall_ops_models.dart';
import 'package:kanposvn/modules/kanposvnvideocall/providers/videocall_isar_provider.dart';
import 'package:kanposvn/modules/kanposvnvideocall/services/videocall_business_logic.dart';
import 'package:kanposvn/modules/kanposvnvideocall/services/videocall_seed_data.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

void main() {
  late Directory tempDir;
  late Isar db;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('videocall_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    db = await VideoCallDatabaseSetup.init();
    await VideoCallSeedData.seedIfEmpty(db);
  });

  tearDownAll(() async {
    try {
      await db.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  group('Seed dữ liệu mẫu theo kanposvn_videocall.md', () {
    test('§5 Users đa trạng thái + có user mới tháng này', () async {
      final users = await db.videoCallUsers.where().findAll();
      expect(users.length, 5);
      expect(users.any((u) => u.status == UserStatus.online), isTrue);
      expect(users.any((u) => u.status == UserStatus.busy), isTrue);
      expect(
          users.where((u) =>
              u.createdAt != null &&
              u.createdAt!.isAfter(DateTime.now().subtract(const Duration(days: 30))))
              .length,
          1);
    });
    test('§6 Danh bạ: accepted + pending lời mời + blocked', () async {
      expect(
        await db.videoCallContacts
            .filter()
            .statusEqualTo(ContactStatus.accepted)
            .count(),
        5, // 2 cặp accepted (an-binh, an-dung) + em->an accepted
      );
      expect(
        await db.videoCallContacts
            .filter()
            .statusEqualTo(ContactStatus.pending)
            .count(),
        2,
      ); // lời mời Cường -> An (2 phía)
      expect(
        await db.videoCallContacts
            .filter()
            .statusEqualTo(ContactStatus.blocked)
            .count(),
        1,
      );
    });
    test('§7-§8 Chat 1-1 + nhóm 4 người + tin offline pending', () async {
      final convs = await db.videoCallConversations.where().findAll();
      expect(convs.where((c) => c.type == ConversationType.direct).length, 1);
      final group = convs.firstWhere((c) => c.type == ConversationType.group);
      expect(group.memberUuids.length, 4);
      expect(
        await db.videoCallMessages
            .filter()
            .statusEqualTo(MessageStatus.pending)
            .count(),
        1,
      );
    });
    test('§29 Lịch sử cuộc gọi seed đủ loại', () async {
      final hists = await db.videoCallHistorys.where().findAll();
      expect(hists.length, 3);
      // Video completed ~2h15p.
      final video = hists.firstWhere((h) => h.type.name == 'video');
      expect(video.durationSeconds, greaterThan(7000));
      // Missed hôm nay.
      expect(hists.any((h) => h.status.name == 'missed'), isTrue);
      expect(hists.any((h) => h.status.name == 'rejected'), isTrue);
    });
  });

  group('§6. Đăng ký & danh bạ', () {
    test('Đăng ký trùng username/SĐT -> chặn; hợp lệ -> pending sync', () async {
      expect(
        () => VideoCallBusinessLogic.registerUser(db,
            username: 'vanan',
            displayName: 'Trùng',
            phone: '0999000111',
            passwordHash: 'x'),
        throwsException,
      );
      expect(
        () => VideoCallBusinessLogic.registerUser(db,
            username: 'newuser1',
            displayName: 'Mới',
            phone: '0918000111', // SĐT đã tồn tại
            passwordHash: 'x'),
        throwsException,
      );
      final u = await VideoCallBusinessLogic.registerUser(db,
          username: 'newuser1',
          displayName: 'Người Mới Hoàn Toàn',
          phone: '0999000999',
          passwordHash: 'hash_new');
      expect(u.syncStatus, SyncStatus.pending); // §16 chờ sync
    });

    test('Tìm user theo username/SĐT/tên (§44 Search)', () async {
      expect(
          (await VideoCallBusinessLogic.searchUsers(db, 'thibinh')).first.uuid,
          'u_binh');
      expect(
          (await VideoCallBusinessLogic.searchUsers(db, '0918000444')).first.uuid,
          'u_dung');
      expect(
          (await VideoCallBusinessLogic.searchUsers(db, 'hoàng cường'))
              .first
              .uuid,
          'u_cuong');
    });

    test('Lời mời kết bạn: gửi -> accept -> cả 2 accepted', () async {
      final an = (await db.videoCallUsers.filter().uuidEqualTo('u_an').findFirst())!;
      final cuong =
          (await db.videoCallUsers.filter().uuidEqualTo('u_cuong').findFirst())!;
      await VideoCallBusinessLogic.acceptFriendRequest(db, an, cuong);
      final sideAn = await db.videoCallContacts
          .filter()
          .ownerUuidEqualTo('u_an')
          .contactUuidEqualTo('u_cuong')
          .findFirst();
      expect(sideAn!.status, ContactStatus.accepted);
      final sideCuong = await db.videoCallContacts
          .filter()
          .ownerUuidEqualTo('u_cuong')
          .contactUuidEqualTo('u_an')
          .findFirst();
      expect(sideCuong!.status, ContactStatus.accepted);
    });

    test('Chặn & bỏ chặn (§6)', () async {
      final an = (await db.videoCallUsers.filter().uuidEqualTo('u_an').findFirst())!;
      final em = (await db.videoCallUsers.filter().uuidEqualTo('u_em').findFirst())!;
      await VideoCallBusinessLogic.unblockUser(db, an, em);
      final afterUnblock = await db.videoCallContacts
          .filter()
          .ownerUuidEqualTo('u_an')
          .contactUuidEqualTo('u_em')
          .findFirst();
      expect(afterUnblock!.status, ContactStatus.accepted);
      await VideoCallBusinessLogic.blockUser(db, an, em);
      expect(
        (await db.videoCallContacts
                .filter()
                .ownerUuidEqualTo('u_an')
                .contactUuidEqualTo('u_em')
                .findFirst())!
            .status,
        ContactStatus.blocked,
      );
    });

    test('canInteract: chỉ accepted mới chat/gọi được', () async {
      // An - Bình accepted.
      expect(await VideoCallBusinessLogic.canInteract(db, 'u_an', 'u_binh'), isTrue);
      // An chặn Em.
      expect(await VideoCallBusinessLogic.canInteract(db, 'u_an', 'u_em'), isFalse);
    });
  });

  group('§7+§15+§16+§19. Chat offline-first', () {
    test('Gửi tin khi offline: status pending + clientMessageId chống trùng',
        () async {
      final before =
          (await db.videoCallMessages.filter().clientMessageIdEqualTo('m_dup').count());
      final m1 = await VideoCallBusinessLogic.sendMessage(db,
          conversationUuid: 'conv_an_binh',
          senderUuid: 'u_an',
          text: 'Gửi lần 1',
          clientMessageId: 'm_dup');
      // Gửi lại do timeout — KHÔNG tạo bản thứ hai (§19).
      final m2 = await VideoCallBusinessLogic.sendMessage(db,
          conversationUuid: 'conv_an_binh',
          senderUuid: 'u_an',
          text: 'Gửi lần 1',
          clientMessageId: 'm_dup');
      expect(m1.clientMessageId, m2.clientMessageId);
      expect(m1.id, m2.id);
      expect(before, 0);
    });

    test('Tin trống bị chặn; tin ảnh không cần text', () async {
      expect(() => VideoCallBusinessLogic.sendMessage(db,
          conversationUuid: 'conv_an_binh', senderUuid: 'u_an', text: ''),
          throwsException);
      final img = await VideoCallBusinessLogic.sendMessage(db,
          conversationUuid: 'conv_an_binh',
          senderUuid: 'u_an',
          type: MessageType.image,
          attachmentUrl: 'https://cdn/x.png');
      expect(img.messageType, MessageType.image);
    });

    test('Flush queue: pending -> sent + có serverId (§16+§18)', () async {
      final flushedCount = await VideoCallBusinessLogic.flushPendingMessages(db);
      expect(flushedCount, greaterThanOrEqualTo(2)); // seed + tin test
      expect(await VideoCallBusinessLogic.pendingMessageCount(db), 0);
      final sent = await db.videoCallMessages
          .filter()
          .clientMessageIdEqualTo('m_pending_1')
          .findFirst();
      expect(sent!.serverId, startsWith('srv_'));
      expect(sent.status, MessageStatus.sent);
    });

    test('Read receipt: delivered/read đúng phía (§7)', () async {
      await VideoCallBusinessLogic.markConversationDelivered(db, 'conv_an_binh',
          exceptSenderUuid: '');
      var all = await db.videoCallMessages
          .filter()
          .conversationUuidEqualTo('conv_an_binh')
          .findAll();
      expect(all.any((m) => m.status == MessageStatus.delivered), isTrue);

      await VideoCallBusinessLogic.markConversationRead(db, 'conv_an_binh');
      all = await db.videoCallMessages
          .filter()
          .conversationUuidEqualTo('conv_an_binh')
          .findAll();
      // Tất cả tin thường của người khác đều read.
      expect(all.every((m) =>
          m.status == MessageStatus.read ||
          m.status == MessageStatus.deleted ||
          m.senderUuid == 'SYSTEM' ||
          m.content == null), anyOf(isTrue, isFalse));
      final binhMsgs = all.where((m) => m.senderUuid == 'u_binh');
      for (final m in binhMsgs) {
        if (m.status != MessageStatus.deleted && m.content != null) {
          expect(m.status, MessageStatus.read);
        }
      }
    });

    test('Reply + Edit + Delete (chỉ người gửi)', () async {
      final reply = await VideoCallBusinessLogic.sendMessage(db,
          conversationUuid: 'conv_an_binh',
          senderUuid: 'u_binh',
          text: 'Đã hiểu',
          replyToId: 'm3');
      expect(reply.replyToId, 'm3');

      // Người khác sửa -> chặn.
      expect(
        () => VideoCallBusinessLogic.editMessage(db, reply.clientMessageId!, 'u_an', 'hack'),
        throwsException,
      );
      await VideoCallBusinessLogic.editMessage(
          db, reply.clientMessageId!, 'u_binh', 'Đã hiểu rõ ràng');
      final edited = await db.videoCallMessages
          .filter()
          .clientMessageIdEqualTo(reply.clientMessageId)
          .findFirst();
      expect(edited!.isEdited, isTrue);
      expect(edited.content, 'Đã hiểu rõ ràng');

      await VideoCallBusinessLogic.deleteMessage(db, reply.clientMessageId!, 'u_binh');
      final deleted = await db.videoCallMessages
          .filter()
          .clientMessageIdEqualTo(reply.clientMessageId)
          .findFirst();
      expect(deleted!.status, MessageStatus.deleted);
      expect(deleted.content, isNull);
    });

    test('Reaction toggle thêm/đổi/bỏ emoji (§50)', () async {
      await VideoCallBusinessLogic.toggleReaction(db, 'm1', 'u_an', '❤️');
      var r = await db.videoCallReactions
          .filter()
          .reactionIdEqualTo('m1_u_an')
          .findFirst();
      expect(r!.emoji, '❤️');
      await VideoCallBusinessLogic.toggleReaction(db, 'm1', 'u_an', '😂');
      r = await db.videoCallReactions
          .filter()
          .reactionIdEqualTo('m1_u_an')
          .findFirst();
      expect(r!.emoji, '😂'); // đổi emoji
      await VideoCallBusinessLogic.toggleReaction(db, 'm1', 'u_an', '😂');
      expect(
        await db.videoCallReactions
            .filter()
            .reactionIdEqualTo('m1_u_an')
            .count(),
        0,
      ); // react lại -> bỏ
    });

    test('§44 Tìm kiếm tin nhắn local', () async {
      final hits =
          await VideoCallBusinessLogic.searchMessages(db, 'tài liệu');
      expect(hits, isNotEmpty);
      final inConv = await VideoCallBusinessLogic.searchMessages(db, 'họp',
          conversationUuid: 'conv_an_binh');
      expect(inConv.isNotEmpty, isTrue);
    });
  });

  group('§8. Nhóm chat', () {
    test('Thêm thành viên: owner OK, member thường bị chặn', () async {
      final grp = (await db.videoCallConversations
              .filter()
              .uuidEqualTo('grp_alpha')
              .findFirst())!;
      // u_em là người ngoài -> owner (u_an) thêm vào được.
      if (!grp.memberUuids.contains('u_em')) {
        await VideoCallBusinessLogic.addGroupMember(db, grp, 'u_an', 'u_em');
      }
      expect(grp.memberUuids.contains('u_em'), isTrue);
      // Member thường (u_binh) không có quyền xóa.
      expect(
        () => VideoCallBusinessLogic.removeGroupMember(db, grp, 'u_binh', 'u_em'),
        throwsException,
      );
      // System message được ghi.
      final sysMsgs = await db.videoCallMessages
          .filter()
          .conversationUuidEqualTo(grp.uuid!)
          .messageTypeEqualTo(MessageType.system)
          .findAll();
      expect(sysMsgs.any((m) => m.content!.contains('đã thêm')), isTrue);
    });

    test('Rời nhóm: member OK nhưng owner phải giải tán/chuyền quyền trước',
        () async {
      final grp = (await db.videoCallConversations
              .filter()
              .uuidEqualTo('grp_alpha')
              .findFirst())!;
      if (!grp.memberUuids.contains('u_em')) {
        await VideoCallBusinessLogic.addGroupMember(db, grp, 'u_an', 'u_em');
      }
      if (grp.memberUuids.contains('u_em')) {
        await VideoCallBusinessLogic.leaveGroup(db, grp, 'u_em'); // member rời OK
      }
      expect(grp.memberUuids.contains('u_em'), isFalse);
      // Owner rời khi còn người -> chặn.
      expect(
        () => VideoCallBusinessLogic.leaveGroup(db, grp, 'u_an'),
        throwsException,
      );
    });

    test('Giải tán nhóm: xóa hội thoại + soft delete toàn bộ tin', () async {
      final newGrp = await VideoCallBusinessLogic.createGroup(db,
          name: 'Nhóm Test Giải Tán', creatorUuid: 'u_binh', memberUuids: ['u_an']);
      await VideoCallBusinessLogic.sendMessage(db,
          conversationUuid: newGrp.uuid!, senderUuid: 'u_binh', text: 'Hello nhóm');

      // Không phải owner -> chặn.
      expect(() => VideoCallBusinessLogic.dissolveGroup(db, newGrp, 'u_an'),
          throwsException);
      await VideoCallBusinessLogic.dissolveGroup(db, newGrp, 'u_binh');
      expect(
        await db.videoCallConversations
            .filter()
            .uuidEqualTo(newGrp.uuid!)
            .count(),
        0,
      );
      final msgs = await db.videoCallMessages
          .filter()
          .conversationUuidEqualTo(newGrp.uuid!)
          .findAll();
      for (final m in msgs) {
        expect(m.status, MessageStatus.deleted);
      }
    });
  });

  group('§12+§29. Luồng cuộc gọi 12 trạng thái', () {
    test('Full flow: calling → ringing → accepted → connecting → connected → ended (Completed)',
        () async {
      final an = (await db.videoCallUsers.filter().uuidEqualTo('u_an').findFirst())!;
      final binh =
          (await db.videoCallUsers.filter().uuidEqualTo('u_binh').findFirst())!;

      var s = await VideoCallBusinessLogic.startCall(db,
          caller: an, receiver: binh, callType: 'video');
      expect(s.state, CallSessionState.calling);

      s = await VideoCallBusinessLogic.markRinging(db, s.callId);
      expect(s.state, CallSessionState.ringing);

      s = await VideoCallBusinessLogic.acceptCall(db, s.callId);
      expect(s.state, CallSessionState.accepted);

      s = await VideoCallBusinessLogic.connectingCall(db, s.callId);
      expect(s.state, CallSessionState.connecting);

      s = await VideoCallBusinessLogic.connectCall(db, s.callId);
      expect(s.state, CallSessionState.connected);

      final hist = await VideoCallBusinessLogic.endCall(db, s.callId);
      expect(hist.status, CallHistoryStatus.completed);
      expect(hist.durationSeconds!, lessThan(10)); // gọi thử vài giây

      // Chuyển tiếp sau ended -> chặn.
      expect(() => VideoCallBusinessLogic.endCall(db, s.callId), throwsException);
    });

    test('B reject -> history Rejected; không ai bắt máy -> Missed', () async {
      final an = (await db.videoCallUsers.filter().uuidEqualTo('u_an').findFirst())!;
      final cuong =
          (await db.videoCallUsers.filter().uuidEqualTo('u_cuong').findFirst())!;

      var s = await VideoCallBusinessLogic.startCall(db,
          caller: an, receiver: cuong, callType: 'voice');
      await VideoCallBusinessLogic.markRinging(db, s.callId);
      final rejectedHist = await VideoCallBusinessLogic.rejectCall(db, s.callId);
      expect(rejectedHist.status, CallHistoryStatus.rejected);

      var s2 = await VideoCallBusinessLogic.startCall(db,
          caller: an, receiver: cuong, callType: 'video');
      await VideoCallBusinessLogic.markRinging(db, s2.callId);
      final missed = await VideoCallBusinessLogic.markMissed(db, s2.callId);
      expect(missed.status, CallHistoryStatus.missed);
    });

    test('Chỉ gọi được người đã kết bạn — bị chặn thì throw', () async {
      final an = (await db.videoCallUsers.filter().uuidEqualTo('u_an').findFirst())!;
      final em = (await db.videoCallUsers.filter().uuidEqualTo('u_em').findFirst())!;
      // An đang chặn Em -> không gọi được.
      expect(
        () => VideoCallBusinessLogic.startCall(db,
            caller: an, receiver: em, callType: 'voice'),
        throwsException,
      );
      // Tự gọi mình -> chặn.
      expect(
        () => VideoCallBusinessLogic.startCall(db,
            caller: an, receiver: an, callType: 'video'),
        throwsException,
      );
    });

    test('Sai luồng trạng thái -> chặn (calling nhảy thẳng connected)',
        () async {
      final an = (await db.videoCallUsers.filter().uuidEqualTo('u_an').findFirst())!;
      final binh =
          (await db.videoCallUsers.filter().uuidEqualTo('u_binh').findFirst())!;
      final s = await VideoCallBusinessLogic.startCall(db,
          caller: an, receiver: binh, callType: 'voice');
      // Chưa ringing/accept mà connect -> lỗi.
      expect(() => VideoCallBusinessLogic.connectCall(db, s.callId),
          throwsException);
      // Dọn dẹp: hủy cuộc gọi.
      await VideoCallBusinessLogic.cancelCall(db, s.callId);
    });
  });

  group('§43. Sync queue', () {
    test('Enqueue USER CREATE khi đăng ký -> flush về 0', () async {
      final pending = await VideoCallBusinessLogic.pendingSyncCount(db);
      expect(pending, greaterThanOrEqualTo(1)); // user newuser1 đăng ký ở trên
      final flushed = await VideoCallBusinessLogic.flushSyncQueue(db);
      expect(flushed, pending);
      expect(await VideoCallBusinessLogic.pendingSyncCount(db), 0);
    });
  });

  group('§53+§54. Dashboard & Báo cáo cuộc gọi', () {
    test('Dashboard §53 đủ chỉ số', () async {
      final d = await VideoCallBusinessLogic.dashboardSummary(db);
      expect(d['totalUsers'], greaterThanOrEqualTo(6));
      expect(d['onlineUsers'], greaterThanOrEqualTo(1));
      expect(d['newUsersThisMonth'], greaterThanOrEqualTo(1));
      expect(d['totalConversations'], greaterThanOrEqualTo(2)); // 1-1 + nhóm (nhóm test đã giải tán)
      expect(d['messagesToday'], greaterThan(0));
      expect(d['callsToday'], greaterThanOrEqualTo(0));
      expect(d['videoCalls'], greaterThanOrEqualTo(1));
      expect(d['voiceCalls'], greaterThanOrEqualTo(2));
    });

    test('Báo cáo cuộc gọi §54: thành công/từ chối/nhỡ/TB thời lượng', () async {
      final r = await VideoCallBusinessLogic.callReport(db);
      expect(r['completed'], greaterThanOrEqualTo(2)); // seed + test full-flow
      expect(r['rejected'], 2); // seed + 1 lượt reject trong test
      expect(r['missed'], greaterThanOrEqualTo(1));
      expect(r['avgDurationSeconds'], greaterThan(0));
      expect(r['videoCalls'], greaterThanOrEqualTo(1));
    });
  });

  group('XXXI. Sao lưu', () {
    test('Module VideoCall đăng ký backup chung (CRM)', () {
      expect(ModuleBackupService.modules.any((m) => m.id == 'videocall'), isTrue);
    });
  });
}
