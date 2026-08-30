import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnvideocall/models/conversation.dart';
import 'package:kanposvn/modules/kanposvnvideocall/models/message.dart';
import 'package:kanposvn/modules/kanposvnvideocall/providers/conversation_provider.dart';
import 'package:kanposvn/modules/kanposvnvideocall/providers/message_provider.dart';
import 'package:kanposvn/modules/kanposvnvideocall/providers/videocall_isar_provider.dart';
import 'package:kanposvn/modules/kanposvnvideocall/screens/kanposvnvideocall_shell.dart';
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
    tempDir = await Directory.systemTemp.createTemp('videocall_repro');
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

  test('ConversationList query (giống conversationProvider)', () async {
    final convs = await db.videoCallConversations
        .where()
        .sortByLastMessageAtDesc()
        .findAll();
    expect(convs, isNotEmpty);
    final direct = convs.firstWhere((c) => c.type == ConversationType.direct);
    expect(direct, isNotNull);
    expect(direct.name, isNull); // tile hiện "Trò chuyện"
    expect(direct.uuid, 'conv_an_binh');
  });

  test('ChatScreen query loadMessages (giống messageListProvider)', () async {
    // Đúng chain mà ChatScreen -> MessageNotifier.loadMessages() dùng
    final messages = await db.videoCallMessages
        .where()
        .conversationUuidEqualTo('conv_an_binh')
        .sortByCreatedAt()
        .findAll();
    expect(messages, isNotEmpty);
  });

  test('Gửi tin: writeTxn + put + update conversation', () async {
    await db.writeTxn(() async {
      final msg = VideoCallMessage()
        ..clientMessageId = 'repro_1'
        ..conversationUuid = 'conv_an_binh'
        ..senderUuid = 'ME'
        ..content = 'test'
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();
      await db.videoCallMessages.put(msg);
      final conv = await db.videoCallConversations
          .where()
          .uuidEqualTo('conv_an_binh')
          .findFirst();
      expect(conv, isNotNull);
    });
  });

  test('Provider chain (conversation + message) resolve không treo', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    // Thêm client để giữ provider sống (không bị dispose khi không watch)
    final convSub = container.listen(conversationProvider, (_, __) {});
    final msgSub =
        container.listen(messageListProvider('conv_an_binh'), (_, __) {});

    Future<void> waitReady(AsyncValue<Object?> Function() read) async {
      for (var i = 0; i < 50; i++) {
        final s = read();
        if (!s.isLoading) return;
        await Future<void>.delayed(const Duration(milliseconds: 20));
      }
      fail('Provider không resolve trong 1s (treo)');
    }

    await waitReady(() => container.read(conversationProvider));
    final convs = container.read(conversationProvider);
    expect(convs.valueOrNull, isNotNull);
    expect(convs.valueOrNull, isNotEmpty);

    await waitReady(() => container.read(messageListProvider('conv_an_binh')));
    final msgs = container.read(messageListProvider('conv_an_binh'));
    expect(msgs.valueOrNull, isNotNull);
    expect(msgs.valueOrNull, isNotEmpty);

    convSub.close();
    msgSub.close();
  });

  testWidgets('Shell -> tap "Trò chuyện" -> ChatScreen không treo', (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(ProviderScope(
        child: const MaterialApp(home: KanPosVnVideoCallShell()),
      ));
      // Shell tự gọi _initDb qua addPostFrameCallback → để cho nó chạy thật
      for (var i = 0; i < 10; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 300));
        await tester.pump();
        if (find.text('Trò chuyện').evaluate().isNotEmpty) break;
      }
      debugPrint('=== ALL TEXT SAU KHI PUMP SHELL ===');
      for (final w in tester.allWidgets) {
        if (w is Text) debugPrint('SHELL TEXT: ${w.data}');
      }
      expect(find.text('Trò chuyện'), findsOneWidget);
      debugPrint('=== Tìm thấy tile "Trò chuyện", bấm...');
      await tester.tap(find.text('Trò chuyện'));
      // Đợi route transition hoàn tất (hera/animation)
      var chatVisible = false;
      for (var i = 0; i < 20; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 150));
        await tester.pump(const Duration(milliseconds: 150));
        if (find.text('Nhập tin nhắn...').evaluate().isNotEmpty) {
          chatVisible = true;
          break;
        }
      }
      debugPrint('=== Đã bấm, chatVisible=$chatVisible, kiểm tra ô nhập tin nhắn...');
      for (final w in tester.allWidgets) {
        if (w is Text) debugPrint('CHAT TEXT: ${w.data}');
      }
      expect(chatVisible, isTrue, reason: 'ChatScreen không hiện sau khi bấm "Trò chuyện"');
    });
  });
}