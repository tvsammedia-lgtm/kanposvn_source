import 'package:isar/isar.dart';
import '../models/candidate.dart';
import '../models/employer.dart';
import '../models/job_category.dart';
import '../models/job_posting.dart';
import '../models/viec_ops_models.dart';

/// Bộ dữ liệu mẫu KanViec theo kanposvnviec.md.
class ViecSeedData {
  static Future<void> seedIfEmpty(Isar db) async {
    if (await db.viecCandidates.count() > 0) return;
    final now = DateTime.now();

    await db.writeTxn(() async {
      // ── §4. Danh mục ngành nghề (mẫu spec) ─────────────────────
      final catNames = [
        'Giúp việc nhà', 'Giữ trẻ', 'Chăm người già', 'Bảo vệ', 'Bốc xếp',
        'Thợ xây', 'Phụ hồ', 'Thợ điện', 'Thợ điện nước', 'Thợ điện lạnh',
        'Thợ sơn', 'Thợ mộc', 'Thợ hàn', 'Tài xế', 'Giao hàng',
        'Shipper', 'Lái xe tải', 'Lái xe khách', 'Lái xe container',
        'Thu ngân', 'Bán hàng', 'Nhân viên kho', 'Lễ tân', 'Pha chế',
        'Đầu bếp', 'Phụ bếp', 'Rửa chén', 'Tạp vụ', 'Lao động phổ thông'
      ];
      await db.viecJobCategorys.putAll([
        for (var i = 0; i < catNames.length; i++)
          ViecJobCategory()
            ..categoryId = 'cat_${i + 1}'
            ..name = catNames[i]
            ..description = 'Ngành ${catNames[i]}'
      ]);

      // ── §7. Nhà tuyển dụng ─────────────────────────────────────
      await db.viecEmployers.putAll([
        ViecEmployer()
          ..employerId = 'emp_coffee'
          ..companyName = 'Cà Phê Highlands Q1'
          ..contactName = 'Anh Tuấn'
          ..phone = '0918111222'
          ..address = '12 Nguyễn Trãi, Q.1, TP.HCM'
          ..lat = 10.762
          ..lng = 106.688
          ..rating = 4.6,
        ViecEmployer()
          ..employerId = 'emp_kho'
          ..companyName = 'Kho Vận Miền Đông'
          ..contactName = 'Chị Hằng'
          ..phone = '0918222333'
          ..address = 'KCN Tân Bình, Tân Phú, TP.HCM'
          ..lat = 10.800
          ..lng = 106.630
          ..rating = 4.2,
        ViecEmployer()
          ..employerId = 'emp_xaydung'
          ..companyName = 'Công Ty Xây Dựng Hòa Bình 2'
          ..contactName = 'Ông Thành'
          ..phone = '0918333444'
          ..address = 'Công trường Quận 7, TP.HCM'
          ..lat = 10.730
          ..lng = 106.715
          ..rating = 4.0,
        ViecEmployer()
          ..employerId = 'emp_benhvien'
          ..companyName = 'BV Hùng Vương'
          ..contactName = 'Chị Lan'
          ..phone = '0918444555'
          ..address = 'Quận 5, TP.HCM'
          ..lat = 10.755
          ..lng = 106.666
          ..rating = 4.9,
      ]);

      // ── §6. Ứng viên (đa dạng điều kiện) ───────────────────────
      await db.viecCandidates.putAll([
        ViecCandidate()
          ..candidateId = 'cd_phuc'
          ..fullName = 'Trần Văn Phúc'
          ..phone = '0932000111'
          ..gender = 'male'
          ..dateOfBirth = DateTime(1998, 4, 10)
          ..address = '22 Nguyễn Trãi, Q.1, TP.HCM' // cách emp_coffee ~250m
          ..lat = 10.7625
          ..lng = 106.6870
          ..workRadiusKm = 5
          ..categoryIds = ['cat_24', 'cat_27'] // Pha chế, Rửa chén
          ..desiredSalary = 5000000
          ..hasMotorbike = true
          ..experienceYears = 2,
        ViecCandidate()
          ..candidateId = 'cd_hoa'
          ..fullName = 'Nguyễn Thị Hoa'
          ..phone = '0932000222'
          ..gender = 'female'
          ..dateOfBirth = DateTime(2000, 8, 21)
          ..address = 'Q.7, TP.HCM'
          ..lat = 10.7311
          ..lng = 106.7140
          ..workRadiusKm = 10
          ..categoryIds = ['cat_1', 'cat_2'] // Giúp việc, Giữ trẻ
          ..desiredSalary = 6000000
          ..experienceYears = 1,
        ViecCandidate()
          ..candidateId = 'cd_baove'
          ..fullName = 'Lê Quốc Bảo'
          ..phone = '0932000333'
          ..gender = 'male'
          ..dateOfBirth = DateTime(1985, 2, 3)
          ..address = 'Q.5, TP.HCM'
          ..lat = 10.7540
          ..lng = 106.6670
          ..workRadiusKm = 15
          ..categoryIds = ['cat_4'] // Bảo vệ
          ..desiredSalary = 7000000
          ..hasMotorbike = true
          ..hasDrivingLicense = true
          ..experienceYears = 5,
        ViecCandidate()
          ..candidateId = 'cd_tho'
          ..fullName = 'Đặng Văn Thọ'
          ..phone = '0932000444'
          ..gender = 'male'
          ..dateOfBirth = DateTime(1990, 6, 15)
          ..address = 'Hóc Môn, TP.HCM' // xa các job trong Q.7/Q1
          ..lat = 10.8800
          ..lng = 106.5900
          ..workRadiusKm = 25 // §11 chấp nhận bán kính lớn (đi xa làm xây dựng)
          ..categoryIds = ['cat_6', 'cat_7'] // Thợ xây, Phụ hồ
          ..desiredSalary = 8000000
          ..experienceYears = 8,
        ViecCandidate()
          ..candidateId = 'cd_danglamlam'
          ..fullName = 'Vũ Thị Đang Làm'
          ..phone = '0932000555'
          ..gender = 'female'
          ..dateOfBirth = DateTime(1999, 12, 1)
          ..address = 'Q.1, TP.HCM'
          ..lat = 10.7700
          ..lng = 106.6900
          ..workRadiusKm = 20
          ..categoryIds = ['cat_24']
          ..desiredSalary = 4000000
          ..status = 'working', // đang làm -> bị loại khi ghép
      ]);

      // ── §8. Tin tuyển dụng ─────────────────────────────────────
      await db.viecJobPostings.putAll([
        ViecJobPosting() // khớp hoàn hảo cd_phuc: cùng ngành pha chế, gần 250m
          ..jobId = 'job_barista'
          ..employerId = 'emp_coffee'
          ..title = 'Tuyển Barista ca sáng'
          ..description = 'Pha chế cà phê, phục vụ.'
          ..categoryId = 'cat_24'
          ..quantity = 2
          ..address = '25 Nguyễn Trãi, Q.1, TP.HCM'
          ..lat = 10.7628
          ..lng = 106.6875
          ..salary = 5500000
          ..salaryType = 'month'
          ..requiredGender = 'any'
          ..ageMin = 18
          ..ageMax = 35
          ..minExperienceYears = 1
          ..endDate = now.add(const Duration(days: 10))
          ..createdAt = now.subtract(const Duration(days: 2)),
        ViecJobPosting() // khớp cd_baove: bảo vệ BV, nam, tuổi 35-50
          ..jobId = 'job_baove'
          ..employerId = 'emp_benhvien'
          ..title = 'Bảo vệ ca đêm bệnh viện'
          ..categoryId = 'cat_4'
          ..quantity = 3
          ..address = 'Quận 5, TP.HCM'
          ..lat = 10.7545
          ..lng = 106.6665
          ..salary = 7500000
          ..salaryType = 'month'
          ..requiredGender = 'male'
          ..ageMin = 30
          ..ageMax = 50
          ..minExperienceYears = 2
          ..endDate = now.add(const Duration(days: 2)) // sắp hết hạn §18
          ..createdAt = now.subtract(const Duration(days: 28)),
        ViecJobPosting() // thợ xây Q7
          ..jobId = 'job_xay'
          ..employerId = 'emp_xaydung'
          ..title = 'Tuyển thợ xây + phụ hồ gấp'
          ..categoryId = 'cat_6'
          ..quantity = 10
          ..address = 'Công trường Quận 7, TP.HCM'
          ..lat = 10.7305
          ..lng = 106.7155
          ..salary = 9000000
          ..salaryType = 'month'
          ..requiredGender = 'male'
          ..ageMax = 55
          ..minExperienceYears = 3
          ..endDate = now.add(const Duration(days: 15))
          ..createdAt = now.subtract(const Duration(days: 1)),
        ViecJobPosting() // giúp việc Q7 cho cd_hoa
          ..jobId = 'job_giupviec'
          ..employerId = 'emp_kho'
          ..title = 'Giúp việc nhà theo giờ Q7'
          ..categoryId = 'cat_1'
          ..quantity = 1
          ..address = 'Phú Mỹ Hưng, Q.7, TP.HCM'
          ..lat = 10.7320
          ..lng = 106.7130
          ..salary = 3000000
          ..salaryType = 'day'
          ..ageMin = 20
          ..ageMax = 40
          ..requiredGender = 'female'
          ..endDate = now.add(const Duration(days: 20))
          ..createdAt = now.subtract(const Duration(days: 5)),
        ViecJobPosting() // lương thấp hơn mong muốn của ai cũng ok (test filter)
          ..jobId = 'job_thapluong'
          ..employerId = 'emp_coffee'
          ..title = 'Rửa chén part-time'
          ..categoryId = 'cat_27'
          ..quantity = 1
          ..address = 'Q.1, TP.HCM'
          ..lat = 10.7630
          ..lng = 106.6870
          ..salary = 3000000 // < desiredSalary của cd_phuc (5tr)
          ..salaryType = 'month'
          ..endDate = now.add(const Duration(days: 8))
          ..createdAt = now.subtract(const Duration(days: 1)),
        ViecJobPosting() // đã đóng
          ..jobId = 'job_closed'
          ..employerId = 'emp_kho'
          ..title = 'Bốc xếp kho (đã đủ)'
          ..categoryId = 'cat_5'
          ..quantity = 5
          ..filledCount = 5
          ..address = 'Tân Phú, TP.HCM'
          ..lat = 10.8010
          ..lng = 106.6310
          ..salary = 6500000
          ..status = 'closed'
          ..createdAt = now.subtract(const Duration(days: 30)),
      ]);

      // ── §16. Thu chi mẫu tháng này ─────────────────────────────
      final monthStart = DateTime(now.year, now.month, 1);
      await db.viecFinanceTxs.putAll([
        ViecFinanceTx()
          ..txId = 'thu_vip_1'
          ..isIncome = true
          ..category = 'VIP_POSTING'
          ..amount = 500000
          ..note = 'Đăng tin VIP cho Highlands Q1'
          ..createdAt = monthStart.add(const Duration(days: 2)),
        ViecFinanceTx()
          ..txId = 'thu_renew_1'
          ..isIncome = true
          ..category = 'JOB_RENEWAL'
          ..amount = 200000
          ..note = 'Gia hạn tin bảo vệ BV'
          ..createdAt = monthStart.add(const Duration(days: 4)),
        ViecFinanceTx()
          ..txId = 'chi_luong_1'
          ..isIncome = false
          ..category = 'SALARY'
          ..amount = 15000000
          ..note = 'Lương nhân viên môi giới tháng này'
          ..createdAt = monthStart.add(const Duration(days: 5)),
        ViecFinanceTx()
          ..txId = 'chi_mkt_1'
          ..isIncome = false
          ..category = 'MARKETING'
          ..amount = 2500000
          ..note = 'Quảng cáo Zalo/Facebook tìm ứng viên'
          ..createdAt = monthStart.add(const Duration(days: 6)),
        ViecFinanceTx()
          ..txId = 'chi_vanphong_1'
          ..isIncome = false
          ..category = 'OFFICE_RENT'
          ..amount = 6000000
          ..note = 'Thuê văn phòng trung tâm'
          ..createdAt = monthStart.add(const Duration(days: 1)),
      ]);
    });
  }
}
