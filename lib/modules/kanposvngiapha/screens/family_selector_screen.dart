import 'package:flutter/material.dart';
import '../giapha_navigation.dart';

class FamilySelectorScreen extends StatelessWidget {
  const FamilySelectorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn Dòng Họ (Tenant)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_tree, size: 64, color: Colors.blue),
            const SizedBox(height: 16),
            const Text('Danh sách dòng họ bạn được phân quyền truy cập'),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.shield),
              title: const Text('Dòng họ Phạm Thanh Giang'),
              subtitle: const Text('Quyền: OWNER'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GiaphaNavigation()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
