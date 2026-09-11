import 'package:flutter/material.dart';

class ClansListScreen extends StatelessWidget {
  const ClansListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Chi họ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Thêm chi họ mới
            },
          )
        ],
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.account_tree, color: Colors.blue),
            title: Text('Chi Trưởng'),
            subtitle: Text('Trưởng chi: Phạm Văn A'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.account_tree, color: Colors.green),
            title: Text('Chi Hai'),
            subtitle: Text('Trưởng chi: Phạm Văn B'),
            trailing: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
