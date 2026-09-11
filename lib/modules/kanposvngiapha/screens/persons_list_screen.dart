import 'package:flutter/material.dart';
import 'person_detail_screen.dart';
import 'add_person_screen.dart';

class PersonsListScreen extends StatelessWidget {
  const PersonsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Thành viên'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPersonScreen()),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 3, // Mock data
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Thành viên mẫu số ${index + 1}'),
            subtitle: Text('Đời thứ 12'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonDetailScreen(personId: 'mock_$index'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
