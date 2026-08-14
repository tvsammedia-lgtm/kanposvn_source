import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/job.dart';
import 'job_isar_provider.dart';

class JobWithDistance {
  final JobLocal job;
  final double distance; // tính bằng km

  JobWithDistance(this.job, this.distance);
}

final jobSearchProvider = StateNotifierProvider<JobSearchNotifier, AsyncValue<List<JobWithDistance>>>((ref) {
  final isar = ref.watch(jobIsarProvider);
  return JobSearchNotifier(isar);
});

class JobSearchNotifier extends StateNotifier<AsyncValue<List<JobWithDistance>>> {
  final Isar isar;
  final uuid = const Uuid();
  final random = Random();

  // Tọa độ giả lập của người dùng (TT Hà Nội)
  final double userLat = 21.028511;
  final double userLng = 105.804817;

  JobSearchNotifier(this.isar) : super(const AsyncValue.data([]));

  Future<void> findJobsNearby() async {
    state = const AsyncValue.loading();
    try {
      await Future.delayed(const Duration(milliseconds: 800)); // Giả lập quét GPS
      
      final mockJobs = _generateMockJobs();
      
      // Lưu vào DB
      await isar.writeTxn(() async {
        await isar.jobLocals.clear(); // Xóa cũ để mock cho lẹ
        await isar.jobLocals.putAll(mockJobs);
      });

      // Tính khoảng cách
      final List<JobWithDistance> result = [];
      for (var job in mockJobs) {
        final d = _calculateDistance(userLat, userLng, job.latitude!, job.longitude!);
        result.add(JobWithDistance(job, d));
      }

      // Sắp xếp từ gần đến xa
      result.sort((a, b) => a.distance.compareTo(b.distance));

      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createJob(JobLocal job) async {
    try {
      job.uuid = uuid.v4();
      job.status = JobStatus.open;
      job.createdAt = DateTime.now();
      
      // Gán tọa độ ngẫu nhiên gần user để hiện lên map luôn
      final latOffset = (random.nextDouble() - 0.5) * 0.02;
      final lngOffset = (random.nextDouble() - 0.5) * 0.02;
      job.latitude = userLat + latOffset;
      job.longitude = userLng + lngOffset;

      await isar.writeTxn(() async {
        await isar.jobLocals.put(job);
      });
      
      // Refresh lại list
      await findJobsNearby();
    } catch (e) {
      // Bỏ qua error handle cho gọn
    }
  }

  List<JobLocal> _generateMockJobs() {
    final jobs = <JobLocal>[];
    final titles = ['Nhân viên phục vụ', 'Pha chế (Barista)', 'Bảo vệ ca đêm', 'Thu ngân siêu thị', 'Shipper giao hàng', 'Gia sư Tiếng Anh'];
    final companies = ['The Coffee House', 'Highlands Coffee', 'VinMart+', 'Circle K', 'Công ty ABC', 'Trung tâm XYZ'];
    
    for (int i = 0; i < 15; i++) {
      // Bán kính khoảng 0.05 độ (~5km)
      final latOffset = (random.nextDouble() - 0.5) * 0.05;
      final lngOffset = (random.nextDouble() - 0.5) * 0.05;
      
      jobs.add(
        JobLocal()
          ..uuid = uuid.v4()
          ..title = titles[random.nextInt(titles.length)]
          ..company = companies[random.nextInt(companies.length)]
          ..address = 'Đường số ${random.nextInt(100) + 1}, Quận Cầu Giấy'
          ..latitude = userLat + latOffset
          ..longitude = userLng + lngOffset
          ..salary = (random.nextInt(5) + 3) * 1000000.0 // 3tr - 7tr
          ..salaryType = 'VND/tháng'
          ..tags = random.nextBool() ? 'Part-time' : 'Full-time'
          ..description = 'Cần tuyển người chăm chỉ, nhiệt tình...'
          ..status = JobStatus.open
          ..createdAt = DateTime.now(),
      );
    }
    return jobs;
  }

  // Thuật toán Haversine tính khoảng cách 2 điểm GPS (trả về km)
  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p) / 2 + 
          c(lat1 * p) * c(lat2 * p) * 
          (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)); // 2 * R; R = 6371 km
  }
}
