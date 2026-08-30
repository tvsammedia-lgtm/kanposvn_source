import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/contact.dart';
import '../models/user.dart';
import 'videocall_isar_provider.dart';
import 'package:uuid/uuid.dart';

final contactProvider = StateNotifierProvider<ContactNotifier, AsyncValue<List<VideoCallContact>>>((ref) {
  final isar = ref.watch(videoCallIsarProvider);
  return ContactNotifier(isar);
});

class ContactNotifier extends StateNotifier<AsyncValue<List<VideoCallContact>>> {
  final Isar isar;
  final uuid = const Uuid();

  ContactNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadContacts();
  }

  Future<void> loadContacts() async {
    try {
      state = const AsyncValue.loading();
      final contacts = await isar.videoCallContacts.where().findAll();
      if (!mounted) return;
      state = AsyncValue.data(contacts);
    } catch (e, st) {
      if (!mounted) return;
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addContact(VideoCallContact contact) async {
    try {
      if (contact.uuid == null || contact.uuid!.isEmpty) {
        contact.uuid = uuid.v4();
      }
      contact.createdAt = DateTime.now();
      contact.updatedAt = DateTime.now();
      contact.syncStatus = SyncStatus.pending; // Sẵn sàng đẩy lên cloud
      
      await isar.writeTxn(() async {
        await isar.videoCallContacts.put(contact);
      });
      await loadContacts();
    } catch (e, st) {
      if (!mounted) return;
      state = AsyncValue.error(e, st);
    }
  }
}
