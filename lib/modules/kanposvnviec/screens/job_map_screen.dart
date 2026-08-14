import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/job_provider.dart';
import 'job_detail_screen.dart';
import 'cv_profile_screen.dart';
import 'job_create_screen.dart';

class JobMapScreen extends ConsumerStatefulWidget {
  const JobMapScreen({super.key});

  @override
  ConsumerState<JobMapScreen> createState() => _JobMapScreenState();
}

class _JobMapScreenState extends ConsumerState<JobMapScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(jobSearchProvider.notifier).findJobsNearby());
  }

  @override
  Widget build(BuildContext context) {
    final jobsState = ref.watch(jobSearchProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tìm Việc Quanh Đây'), 
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CvProfileScreen())),
          ),
          IconButton(
            icon: const Icon(Icons.add_box),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const JobCreateScreen())),
          ),
        ],
      ),
      body: jobsState.when(
        loading: () => _buildRadarScanning(),
        error: (e, st) => Center(child: Text('Lỗi: $e')),
        data: (jobs) {
          if (jobs.isEmpty) return const Center(child: Text('Không tìm thấy công việc nào gần bạn.'));

          return Column(
            children: [
              // Nửa trên: Bản đồ Radar mô phỏng
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  color: Colors.green.shade50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Vẽ các vòng tròn đồng tâm
                      _buildRadarCircle(300),
                      _buildRadarCircle(200),
                      _buildRadarCircle(100),
                      
                      // User ở giữa
                      const Icon(Icons.my_location, color: Colors.blue, size: 32),
                      
                      // Các điểm Job
                      ...jobs.map((j) {
                        // Tính toán vị trí random trên màn hình dựa vào distance
                        // (Mô phỏng tọa độ)
                        final angle = Random().nextDouble() * 2 * pi;
                        // distance max ~ 5km -> map to max radius 150
                        final radius = (j.distance / 5.0) * 150; 
                        final dx = radius * cos(angle);
                        final dy = radius * sin(angle);

                        return Transform.translate(
                          offset: Offset(dx, dy),
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${j.job.title} - Cách bạn ${j.distance.toStringAsFixed(1)}km')));
                            },
                            child: const Icon(Icons.location_on, color: Colors.red, size: 28),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
              // Nửa dưới: Danh sách List
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      final item = jobs[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        child: ListTile(
                          leading: const CircleAvatar(backgroundColor: Colors.teal, child: Icon(Icons.work, color: Colors.white)),
                          title: Text(item.job.title ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.job.company ?? ''),
                              Text('Cách bạn: ${item.distance.toStringAsFixed(1)} km', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(NumberFormat.compactCurrency(locale: 'vi_VN', symbol: '').format(item.job.salary), style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                              Text(item.job.tags ?? '', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => JobDetailScreen(jobItem: item)));
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildRadarScanning() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(color: Colors.teal),
          SizedBox(height: 16),
          Text('Đang quét vệ tinh tìm công việc quanh bạn...', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget _buildRadarCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.teal.withOpacity(0.3), width: 1),
      ),
    );
  }
}
