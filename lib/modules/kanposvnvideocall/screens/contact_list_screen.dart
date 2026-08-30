import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/contact_provider.dart';

class ContactListScreen extends ConsumerWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactState = ref.watch(contactProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Danh bạ')),
      body: contactState.when(
        data: (contacts) {
          if (contacts.isEmpty) {
            return const Center(child: Text('Danh bạ trống. Hãy thêm bạn bè.'));
          }
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: contact.contactAvatarUrl != null ? NetworkImage(contact.contactAvatarUrl!) : null,
                  child: contact.contactAvatarUrl == null ? const Icon(Icons.person) : null,
                ),
                title: Text(contact.contactName ?? 'Người bạn'),
                subtitle: Text('Trạng thái: ${contact.status.name}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(icon: const Icon(Icons.chat, color: Colors.blue), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.call, color: Colors.green), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.videocam, color: Colors.orange), onPressed: () {}),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'videocall_fab_contacts',
        onPressed: () {
          // Thêm bạn bè (hiện modal / chuyển trang)
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
