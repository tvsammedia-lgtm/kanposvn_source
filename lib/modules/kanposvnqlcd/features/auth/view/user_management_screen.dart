import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/user.dart';
import '../../../data/repositories/user_repository.dart';
import '../controller/auth_controller.dart';

class UserManagementScreen extends ConsumerStatefulWidget {
  const UserManagementScreen({super.key});

  @override
  ConsumerState<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends ConsumerState<UserManagementScreen> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final repo = ref.read(userRepositoryProvider);
    final users = await repo.getAllUsers();
    setState(() {
      _users = users;
    });
  }

  void _showAddEditDialog([User? user]) {
    final usernameCtrl = TextEditingController(text: user?.username ?? '');
    final passwordCtrl = TextEditingController(text: user?.password ?? '');
    String role = user?.role ?? 'staff';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(user == null ? 'Thêm tài khoản' : 'Sửa tài khoản'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usernameCtrl,
                decoration: const InputDecoration(labelText: 'Tài khoản'),
              ),
              TextField(
                controller: passwordCtrl,
                decoration: const InputDecoration(labelText: 'Mật khẩu'),
              ),
              DropdownButtonFormField<String>(
                value: role,
                items: const [
                  DropdownMenuItem(value: 'admin', child: Text('Admin')),
                  DropdownMenuItem(value: 'staff', child: Text('Staff')),
                ],
                onChanged: (val) => role = val!,
                decoration: const InputDecoration(labelText: 'Phân quyền'),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Huỷ')),
            ElevatedButton(
              onPressed: () async {
                final repo = ref.read(userRepositoryProvider);
                final newUser = user ?? User();
                newUser.username = usernameCtrl.text.trim();
                newUser.password = passwordCtrl.text;
                newUser.role = role;

                await repo.saveUser(newUser);
                if (mounted) Navigator.pop(context);
                _loadUsers();
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý phân quyền'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEditDialog(),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final u = _users[index];
          return ListTile(
            title: Text(u.username),
            subtitle: Text('Quyền: ${u.role}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _showAddEditDialog(u),
                ),
                if (u.id != currentUser?.id) // Không cho xoá chính mình
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await ref.read(userRepositoryProvider).deleteUser(u.id);
                      _loadUsers();
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
