import 'package:flutter/material.dart';
import 'add_person_screen.dart';
import 'clans_list_screen.dart';
import 'ai_ocr_screen.dart';

class GiaphaDashboardScreen extends StatelessWidget {
  const GiaphaDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tổng quan Dòng họ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thống kê',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: const [
                          Text('Tổng số người', style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 8),
                          Text('0', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: const [
                          Text('Số đời', style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 8),
                          Text('0', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Phân bổ Giới tính', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Icon(Icons.man, color: Colors.blue, size: 40),
                            Text('Nam: 45%', style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(Icons.woman, color: Colors.pink, size: 40),
                            Text('Nữ: 55%', style: TextStyle(color: Colors.pink)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Thao tác nhanh',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildActionCard(context, Icons.person_add, 'Thêm người', Colors.green, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddPersonScreen()),
                  );
                }),
                _buildActionCard(context, Icons.account_tree, 'Quản lý Chi', Colors.blue, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ClansListScreen()),
                  );
                }),
                _buildActionCard(context, Icons.document_scanner, 'AI Quét', Colors.deepPurple, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AiOcrScreen()),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, IconData icon, String title, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
