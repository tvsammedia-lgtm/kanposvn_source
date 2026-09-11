import 'package:flutter/material.dart';

class PersonDetailScreen extends StatelessWidget {
  final String personId;
  const PersonDetailScreen({Key? key, required this.personId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết Thành viên'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              color: Colors.blue.withOpacity(0.1),
              width: double.infinity,
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text('Nguyễn Văn A', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Đời thứ 12 - Chi 1'),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text('Ngày sinh'),
              subtitle: const Text('01/01/1980'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Nơi sinh'),
              subtitle: const Text('Hà Nội'),
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Nghề nghiệp'),
              subtitle: const Text('Kỹ sư phần mềm'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.family_restroom),
              title: const Text('Gia đình (Vợ/Chồng)'),
              subtitle: const Text('Trần Thị B'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
