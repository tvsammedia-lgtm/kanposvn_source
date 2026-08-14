import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/job_provider.dart';
import 'job_chat_screen.dart';

class JobDetailScreen extends StatelessWidget {
  final JobWithDistance jobItem;
  const JobDetailScreen({super.key, required this.jobItem});

  @override
  Widget build(BuildContext context) {
    final job = jobItem.job;
    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết công việc'), backgroundColor: Colors.teal),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 30, backgroundColor: Colors.teal, child: Icon(Icons.business, color: Colors.white, size: 30)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(job.title ?? '', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text(job.company ?? '', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoBadge(Icons.monetization_on, Colors.red, NumberFormat.compactCurrency(locale: 'vi_VN', symbol: 'đ').format(job.salary)),
                _buildInfoBadge(Icons.location_on, Colors.blue, 'Cách ${jobItem.distance.toStringAsFixed(1)}km'),
                _buildInfoBadge(Icons.access_time, Colors.orange, job.tags ?? 'Full-time'),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(),
            ),
            const Text('Địa điểm làm việc', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.map, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(child: Text(job.address ?? '')),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Mô tả công việc', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text(job.description ?? '', style: const TextStyle(height: 1.5)),
            
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (_) => JobChatScreen(
                      jobUuid: job.uuid ?? '',
                      jobTitle: job.title ?? '',
                      company: job.company ?? '',
                    ))
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: const Text('NỘP HỒ SƠ ỨNG TUYỂN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBadge(IconData icon, Color color, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
