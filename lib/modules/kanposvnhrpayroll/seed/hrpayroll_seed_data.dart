import 'dart:math';

import 'package:isar/isar.dart';
import '../models/attendance.dart';
import '../models/driver.dart';
import '../models/employee.dart';
import '../models/kpi.dart';
import '../models/leave_request.dart';
import '../models/payroll.dart';
import '../models/trip.dart';
import '../models/vehicle.dart';
import '../services/payroll_calculator_service.dart';

/// Bộ dữ liệu mẫu module HR Payroll — Công ty vận tải hàng hóa
/// theo nhansu.md: nhân viên 6 phòng ban, tài xế GPLX, đội xe
/// đầu kéo + mooc, phân công chuyến, chấm công, KPI, thưởng/phạt.
///
/// Ngày tính TƯƠNG ĐỐI theo DateTime.now() nên Dashboard/KPI luôn có
/// số liệu tháng hiện tại.
class HrPayrollSeedData {
  static final _rand = Random(42);

  static DateTime _daysAgo(int d) => DateTime.now().subtract(Duration(days: d));

  /// Gọi từ DatabaseService.seedIfEmpty().
  static Future<void> seed() async {
    final isar = Isar.getInstance('hrpayroll_db');
    if (isar == null) throw Exception('Isar hrpayroll_db not initialized');
    await _seed(isar);
  }

  /// Cho phép test truyền isar riêng.
  static Future<void> seedInto(Isar isar) => _seed(isar);

  static Future<void> _seed(Isar isar) async {
    final now = DateTime.now();
    final thisMonth = DateTime(now.year, now.month);
    final lastMonth = DateTime(now.year, now.month - 1);

    await isar.writeTxn(() async {
      // ══════════════════ NHÂN VIÊN VĂN PHÒNG (§2, §3) ══════════════════
      Employee emp(
        String code,
        String name,
        String dept,
        String position,
        double salary, {
        Gender gender = Gender.male,
        int joinYearsAgo = 3,
        int dependents = 0,
        MaritalStatus marital = MaritalStatus.married,
      }) =>
          Employee()
            ..employeeCode = code
            ..fullName = name
            ..birthDate = DateTime(1985 + (_rand.nextInt(10)), _rand.nextInt(12) + 1, _rand.nextInt(27) + 1)
            ..cccd = '0791${_rand.nextInt(100000000).toString().padLeft(8, '0')}'
            ..cccdIssueDate = DateTime(2021, 5, 10)
            ..cccdIssuePlace = 'Cục Cảnh sát QLHC về TTXH'
            ..address = 'TP. Hồ Chí Minh'
            ..phone = '09${_rand.nextInt(100000000).toString().padLeft(8, '0')}'
            ..email = '${code.toLowerCase()}@vantaicanhvn.vn'
            ..gender = gender
            ..maritalStatus = marital
            ..emergencyContact = 'Người thân'
            ..emergencyPhone = '0987654321'
            ..taxCode = null
            ..socialInsuranceCode =
                'BHXH${_rand.nextInt(10000000).toString().padLeft(7, '0')}'
            ..bankAccount = _rand.nextInt(1000000000).toString().padLeft(9, '0')
            ..bankName = 'Vietcombank'
            ..department = dept
            ..position = position
            ..joinDate = DateTime(now.year - joinYearsAgo, 2, 1)
            ..status = EmployeeStatus.active
            ..baseSalary = salary
            ..allowancePhone = 200000
            ..allowanceMeal = 600000
            ..allowanceTransport = 300000
            ..dependents = dependents;

      final officeStaff = <Employee>[
        emp('NV001', 'Trần Quốc Bảo', 'Ban Giám đốc', 'Giám đốc', 45000000,
            joinYearsAgo: 8, dependents: 2),
        emp('NV002', 'Lê Thị Hồng Nhung', 'Ban Giám đốc', 'Phó Giám đốc',
            35000000, gender: Gender.female, joinYearsAgo: 7, dependents: 1),
        emp('NV003', 'Phan Văn Điều', 'Điều hành vận tải', 'Trưởng phòng',
            22000000, joinYearsAgo: 6),
        emp('NV004', 'Nguyễn Minh Tuấn', 'Điều hành vận tải', 'Điều xe',
            14000000, joinYearsAgo: 4),
        emp('NV005', 'Võ Thanh Hải', 'Điều hành vận tải', 'Điều phối',
            12000000, joinYearsAgo: 3),
        emp('NV006', 'Hoàng Thị Mai', 'Phòng nhân sự', 'Nhân viên tuyển dụng',
            11000000, gender: Gender.female, joinYearsAgo: 4),
        emp('NV007', 'Đặng Ngọc Lan', 'Phòng nhân sự', 'Nhân viên chấm công',
            10000000, gender: Gender.female, joinYearsAgo: 2),
        emp('NV008', 'Bùi Trọng Khánh', 'Phòng nhân sự', 'Nhân viên tiền lương',
            12000000, joinYearsAgo: 5),
        emp('NV009', 'Lý Thu Phượng', 'Phòng kế toán', 'Kế toán trưởng',
            18000000, gender: Gender.female, joinYearsAgo: 6),
        emp('NV010', 'Trịnh Văn Cường', 'Phòng kế toán', 'Kế toán công nợ',
            12000000, joinYearsAgo: 3),
        emp('NV011', 'Chu Thị Bích Hòa', 'Phòng kế toán', 'Kế toán thu chi',
            11500000, gender: Gender.female, joinYearsAgo: 2),
        emp('NV012', 'Dương Văn Én', 'Phòng kỹ thuật', 'Trưởng phòng kỹ thuật',
            19000000, joinYearsAgo: 7),
        emp('NV013', 'Ngô Đức Thắng', 'Phòng kỹ thuật', 'Thợ bảo dưỡng',
            9000000, joinYearsAgo: 2),
        emp('NV014', 'Phạm Xuân Trường', 'Phòng kho', 'Thủ kho',
            11000000, joinYearsAgo: 5),
        emp('NV015', 'Tăng Thị Kim Yến', 'Phòng kho', 'Nhân viên nhiên liệu',
            9500000, gender: Gender.female, joinYearsAgo: 1),
      ];
      await isar.employees.putAll(officeStaff);

      // ══════════════════ NHÂN VIÊN LÀ TÀI XẾ (§4) ══════════════════
      Employee driverEmp(String code, String name, {int joinYearsAgo = 3}) =>
          emp(code, name, 'Đội xe', 'Tài xế', 8000000,
              joinYearsAgo: joinYearsAgo);

      final driverEmployees = <Employee>[
        driverEmp('TX001', 'Nguyễn Văn An'),
        driverEmp('TX002', 'Trần Văn Bình'),
        driverEmp('TX003', 'Lê Hoài Nam'),
        driverEmp('TX004', 'Phạm Đức Long'),
        driverEmp('TX005', 'Hoàng Văn Sơn'),
        driverEmp('TX006', 'Vũ Quang Huy'),
        driverEmp('TX007', 'Đỗ Thanh Tâm'),
        driverEmp('TX008', 'Bá Quốc Việt'),
      ];
      await isar.employees.putAll(driverEmployees);

      Driver drv({
        required Employee e,
        DriverLicenseClass cls = DriverLicenseClass.f,
        int licExpDays = 500,
        int healthDays = 200,
        int exp = 5,
        bool adr = false,
        bool hazmat = false,
        DriverStatus status = DriverStatus.driving,
        double base = 9000000,
        double perTrip = 350000,
        double perKm = 1200,
        double perContainer = 150000,
        double revenuePct = 1.5,
      }) =>
          Driver()
            ..employeeId = e.id
            ..employeeCode = e.employeeCode
            ..fullName = e.fullName
            ..licenseNumber = 'GPLX${e.employeeCode.substring(2)}'
            ..licenseClass = cls
            ..licenseIssueDate = _daysAgo(licExpDays + 1825)
            ..licenseExpiryDate = _daysAgo(-licExpDays)
            ..healthCheckDate = _daysAgo(365 - healthDays)
            ..healthCheckExpiry = _daysAgo(-healthDays)
            ..experienceYears = exp
            ..canDriveContainer = true
            ..canDriveTractor = true
            ..canDriveTruck = true
            ..canDriveMooc = true
            ..hasAdrCertificate = adr
            ..hasDangerousGoodsCert = hazmat
            ..status = status
            ..baseSalary = base
            ..salaryPerTrip = perTrip
            ..salaryPerKm = perKm
            ..salaryPerContainer = perContainer
            ..revenueSharePercent = revenuePct
            ..allowancePhone = 200000
            ..allowanceMeal = 700000
            ..allowanceNightStay = 400000
            ..allowanceFuel = 0;

      final drivers = <Driver>[
        drv(e: driverEmployees[0], exp: 12, adr: true, hazmat: true),
        drv(e: driverEmployees[1], exp: 9),
        drv(e: driverEmployees[2], exp: 7, licExpDays: 20), // sắp hết hạn GPLX
        drv(e: driverEmployees[3], exp: 5, healthDays: 15), // sắp hết hạn khám
        drv(e: driverEmployees[4], exp: 4, status: DriverStatus.onLeave),
        drv(e: driverEmployees[5], exp: 3),
        drv(e: driverEmployees[6], exp: 2, status: DriverStatus.suspended),
        drv(e: driverEmployees[7], exp: 1, cls: DriverLicenseClass.c),
      ];
      await isar.drivers.putAll(drivers);

      // ══════════════════ ĐỘI XE (§5) ══════════════════
      Vehicle veh(String plate, VehicleType t, String brand, int year,
              double capacity,
              {VehicleStatus st = VehicleStatus.active,
              int regExpDays = 300,
              bool gps = true,
              String? mooc}) =>
          Vehicle()
            ..licensePlate = plate
            ..chassisNumber = ' chassis-${plate.replaceAll('-', '')}'
            ..engineNumber = 'eng-${plate.replaceAll('-', '')}'
            ..vehicleType = t
            ..brand = brand
            ..manufacturingYear = year
            ..loadCapacity = capacity
            ..registrationDate = _daysAgo(regExpDays + 300)
            ..registrationExpiry = _daysAgo(-regExpDays)
            ..insuranceNumber = 'BH${plate.replaceAll('-', '').substring(1)}'
            ..insuranceExpiry = _daysAgo(-400)
            ..gpsDeviceId = gps ? 'GPS-$plate' : null
            ..hasGps = gps
            ..etcDeviceId = 'ETC-$plate'
            ..hasEtc = true
            ..pairedMoocPlate = mooc
            ..status = st;

      final vehicles = <Vehicle>[
        veh('51C-001.11', VehicleType.tractor, 'Hyundai HD700', 2020, 40,
            mooc: '51M-555.01'),
        veh('51C-002.22', VehicleType.tractor, 'Hino 500', 2021, 40,
            mooc: '51M-555.02'),
        veh('51C-003.33', VehicleType.tractor, 'Isuzu Giga', 2019, 38,
            regExpDays: 12, mooc: '51M-555.03'), // sắp hết hạn đăng kiểm
        veh('51C-004.44', VehicleType.truck, 'Hyundai Mighty', 2022, 8),
        veh('51C-005.55', VehicleType.truck, 'Fuso Canter', 2021, 5),
        veh('51M-555.01', VehicleType.mooc, 'Sacomae 40ft', 2020, 40),
        veh('51M-555.02', VehicleType.mooc, 'Sacomae 40ft', 2021, 40),
        veh('51M-555.03', VehicleType.mooc, 'Thaco 45ft', 2019, 45),
        veh('51C-006.66', VehicleType.container, 'Hapag 40HC', 2022, 30),
        veh('51C-007.77', VehicleType.tractor, 'Volvo FH500', 2018, 42,
            st: VehicleStatus.maintenance), // đang bảo dưỡng
      ];
      await isar.vehicles.putAll(vehicles);

      // ══════════════════ PHÂN CÔNG CHUYẾN XE (§6) ══════════════════
      const customers = [
        'Công ty CP Vật tư XNK Miền Nam',
        'Công ty TNHH Thực phẩm Sao Mai',
        'Tập đoàn Hòa Phát',
        'Công ty CP Dệt may Việt Tiến',
        'Công ty TNHH SX Nhựa An Phát',
      ];
      const cargoTypes = ['Container 40ft', 'Container 20ft', 'Hàng rời', 'Thép cuộn'];
      const routes = [
        ['ICD Phú Lộc, Thủ Đức', 'Cát Lái, Thủ Đức'],
        ['Depot Sóng Thần, Bình Dương', 'Cảng Cát Lái'],
        ['Khu công nghiệp VSIP', 'Long Thành, Đồng Nai'],
        ['Cảng Hiệp Phước', 'KCN Tân Tạo'],
      ];

      var tripNo = 1;
      final trips = <Trip>[];
      Trip mkTrip(int daysAgo, Employee main, Driver mainDrv,
          {Employee? assistant,
          String status = 'completed',
          double kmBase = 90}) {
        final route = routes[_rand.nextInt(routes.length)];
        final km = kmBase * (0.8 + _rand.nextDouble() * 0.6);
        final revenue = (6500000 + _rand.nextInt(30) * 100000).toDouble();
        final expenses = (revenue * (0.52 + _rand.nextDouble() * 0.12)).roundToDouble();
        return Trip()
          ..tripCode = 'CX${tripNo.toString().padLeft(4, '0')}'
          ..tripDate = _daysAgo(daysAgo)
          ..customerName = customers[_rand.nextInt(customers.length)]
          ..pickupPoint = route[0]
          ..deliveryPoint = route[1]
          ..cargoType = cargoTypes[_rand.nextInt(cargoTypes.length)]
          ..cargoWeight = 15 + _rand.nextDouble() * 15
          ..containerNumber =
              'MSCU${_rand.nextInt(1000000).toString().padLeft(6, '0')}'
          ..vehiclePlate = vehicles[_rand.nextInt(6)].licensePlate
          ..moocPlate = '51M-555.0${1 + _rand.nextInt(3)}'
          ..mainDriverId = main.id
          ..mainDriverName = main.fullName
          ..assistantDriverId = assistant?.id
          ..assistantDriverName = assistant?.fullName
          ..coordinatorName = 'Nguyễn Minh Tuấn'
          ..departureDate = _daysAgo(daysAgo)
          ..returnDate = _daysAgo(max(0, daysAgo - 1))
          ..distanceKm = km
          ..revenue = revenue
          ..expenses = expenses
          ..status = TripStatus.values.firstWhere((s) => s.name == status)
          ..notes = null;
      }

      // ~46 chuyến trong 60 ngày qua cho 6 tài xế đang hoạt động.
      final activeDrivers = [drivers[0], drivers[1], drivers[2], drivers[3], drivers[5], drivers[7]];
      for (var d = 59; d >= 0; d--) {
        if (_rand.nextDouble() < 0.25) continue; // ngày nghỉ trống
        final count = 1 + _rand.nextInt(2);
        for (var i = 0; i < count; i++) {
          final drvIdx = activeDrivers[_rand.nextInt(activeDrivers.length)];
          trips.add(mkTrip(
            d,
            drvIdx.employeeCode == drivers[7].employeeCode
                ? driverEmployees[7]
                : driverEmployees[activeDrivers.indexOf(drvIdx)],
            drvIdx,
            status: d <= 1 ? 'inProgress' : 'completed',
          ));
          tripNo++;
        }
      }
      // Chuyến mới giao hôm nay (chưa chạy).
      trips.add(mkTrip(0, driverEmployees[0], drivers[0], status: 'assigned'));
      await isar.trips.putAll(trips);

      // ══════════════════ CHẤM CÔNG (§7) ══════════════════
      Future<void> attendanceFor(DateTime month, {bool current = false}) async {
        final dayOfMonth = current ? now.day : 26;
        final records = <Attendance>[];

        for (final e in [...officeStaff, ...driverEmployees]) {
          final isDriver = e.department == 'Đội xe';
          final a = Attendance()
            ..employeeId = e.id
            ..employeeCode = e.employeeCode
            ..employeeName = e.fullName
            ..year = month.year
            ..month = month.month
            ..attendanceType =
                isDriver ? AttendanceType.driver : AttendanceType.office;
          if (isDriver) {
            // Tổng hợp từ chuyến thực tế trong tháng đó.
            final monthTrips = trips
                .where((t) =>
                    t.mainDriverId == e.id &&
                    t.tripDate!.year == month.year &&
                    t.tripDate!.month == month.month)
                .toList();
            a.totalTrips = monthTrips.length;
            a.totalKm = monthTrips.fold<double>(0, (s, t) => s + (t.distanceKm ?? 0));
            a.totalContainers = monthTrips.length;
            a.totalDrivingHours = a.totalTrips * 9;
            a.restHours = a.totalTrips * 2.0;
          } else {
            final absent = _rand.nextInt(3); // 0..2 ngày nghỉ
            a.workingDays = max(0, dayOfMonth - absent).toDouble();
            a.morningShifts = a.workingDays;
            a.afternoonShifts = a.workingDays;
            a.overtimeHours = _rand.nextInt(14).toDouble();
            a.leaveDays = absent.toDouble();
            if (absent > 0 && e.employeeCode == 'NV006') {
              a.annualLeaveDays = absent.toDouble(); // NV006 nghỉ phép năm
            } else if (absent > 0) {
              a.unpaidLeaveDays = absent.toDouble();
            }
            a.lateDays = _rand.nextInt(3).toDouble();
            a.earlyLeaveDays = _rand.nextInt(2).toDouble();
          }
          records.add(a);
        }
        await isar.attendances.putAll(records);
      }

      await attendanceFor(lastMonth);
      await attendanceFor(thisMonth, current: true);

      // ══════════════════ KPI TÀI XẾ (§10) ══════════════════
      final kpis = <KpiRecord>[];
      for (final d in activeDrivers) {
        final monthTrips = trips
            .where((t) => t.mainDriverId == d.employeeId)
            .length;
        final violations = _rand.nextInt(3);
        kpis.add(KpiRecord()
          ..driverId = d.employeeId
          ..driverName = d.fullName
          ..year = thisMonth.year
          ..month = thisMonth.month
          ..onTimeScore = 85 + _rand.nextInt(16).toDouble()
          ..totalTrips = monthTrips
          ..totalKm = monthTrips * 95
          ..fuelConsumption = 26 + _rand.nextDouble() * 8
          ..fuelTarget = 30
          ..violations = violations
          ..accidents = _rand.nextInt(100) == 0 ? 1 : 0
          ..customerRating = 7.5 + _rand.nextDouble() * 2.5
          ..kpiScore = 0 // tính bên dưới
          ..kpiBonus = 0);
      }
      for (final k in kpis) {
        k.kpiScore = (k.onTimeScore * 0.35 +
                (k.violations == 0 ? 100 : 70) * 0.2 +
                (k.accidents == 0 ? 100 : 0) * 0.25 +
                k.customerRating * 10 * 0.2)
            .clamp(0, 100);
        k.kpiBonus = k.kpiScore >= 90
            ? 1000000
            : k.kpiScore >= 80
                ? 500000
                : 0;
      }
      await isar.kpiRecords.putAll(kpis);

      // ══════════════════ THƯỞNG & KỶ LUẬT (§11, §12) ══════════════════
      final bonuses = <BonusRecord>[
        BonusRecord()
          ..employeeId = driverEmployees[0].id
          ..employeeName = driverEmployees[0].fullName
          ..bonusType = 'safety'
          ..description = 'Thưởng an toàn giao thông quý'
          ..bonusDate = _daysAgo(10)
          ..year = thisMonth.year
          ..month = thisMonth.month
          ..bonusAmount = 1500000
          ..approvedBy = 'Trần Quốc Bảo',
        BonusRecord()
          ..employeeId = driverEmployees[1].id
          ..employeeName = driverEmployees[1].fullName
          ..bonusType = 'fuelSaving'
          ..description = 'Thưởng tiết kiệm nhiên liệu'
          ..bonusDate = _daysAgo(8)
          ..year = thisMonth.year
          ..month = thisMonth.month
          ..bonusAmount = 800000
          ..approvedBy = 'Dương Văn Én',
        BonusRecord()
          ..employeeId = officeStaff[3].id // Điều xe
          ..employeeName = officeStaff[3].fullName
          ..bonusType = 'monthly'
          ..description = 'Thưởng điều phối tốt tháng trước'
          ..bonusDate = _daysAgo(5)
          ..year = thisMonth.year
          ..month = thisMonth.month
          ..bonusAmount = 500000
          ..approvedBy = 'Phan Văn Điều',
        BonusRecord()
          ..employeeId = driverEmployees[5].id
          ..employeeName = driverEmployees[5].fullName
          ..bonusType = 'holiday'
          ..description = 'Thưởng lễ 30/4 - 1/5'
          ..bonusDate = _daysAgo(40)
          ..year = lastMonth.year
          ..month = lastMonth.month
          ..bonusAmount = 1000000
          ..approvedBy = 'Trần Quốc Bảo',
      ];
      await isar.bonusRecords.putAll(bonuses);

      final disciplines = <DisciplineRecord>[
        DisciplineRecord()
          ..employeeId = driverEmployees[2].id
          ..employeeName = driverEmployees[2].fullName
          ..violationType = 'lateArrival'
          ..description = 'Đến nhận xe trễ 45 phút không báo trước'
          ..violationDate = _daysAgo(12)
          ..penaltyAmount = 200000
          ..handledBy = 'Phan Văn Điều',
        DisciplineRecord()
          ..employeeId = driverEmployees[5].id
          ..employeeName = driverEmployees[5].fullName
          ..violationType = 'speeding'
          ..description = 'Vi phạm tốc độ trên cao tốc TP.HCM - Long Thành - Dầu Giây'
          ..violationDate = _daysAgo(20)
          ..penaltyAmount = 500000
          ..handledBy = 'Phan Văn Điều',
        DisciplineRecord()
          ..employeeId = officeStaff[13].id
          ..employeeName = officeStaff[13].fullName
          ..violationType = 'noReport'
          ..description = 'Không báo cáo tồn kho nhiên liệu tuần'
          ..violationDate = _daysAgo(7)
          ..penaltyAmount = 100000
          ..handledBy = 'Phạm Xuân Trường',
      ];
      await isar.disciplineRecords.putAll(disciplines);

      // ══════════════════ ĐƠN NGHỈ PHÉP (§8) ══════════════════
      LeaveRequest leave(
        Employee e,
        LeaveType type,
        int inDays,
        int days_,
        LeaveStatus st, {
        String? approver,
        String? note,
      }) =>
          LeaveRequest()
            ..employeeId = e.id
            ..employeeCode = e.employeeCode
            ..employeeName = e.fullName
            ..department = e.department
            ..leaveType = type
            ..fromDate = _daysAgo(-inDays)
            ..toDate = _daysAgo(-inDays - days_ + 1)
            ..reason = switch (type) {
              LeaveType.annual => 'Việc gia đình',
              LeaveType.sick => 'Khám bệnh, nghỉ dưỡng',
              LeaveType.maternity => 'Thai sản',
              LeaveType.unpaid => 'Việc riêng',
              LeaveType.holiday => 'Nghỉ lễ',
            }
            ..status = st
            ..approverName = approver
            ..approvalNote = note
            ..approvedAt = st == LeaveStatus.pending ? null : _daysAgo(inDays - 1);

      final leaves = <LeaveRequest>[
        leave(officeStaff[5], LeaveType.sick, 2, 2, LeaveStatus.pending),
        leave(driverEmployees[4], LeaveType.annual, 5, 3, LeaveStatus.approved,
            approver: 'Phan Văn Điều', note: 'Đồng ý, bàn giao tuyến cho TX006'),
        leave(officeStaff[6], LeaveType.unpaid, 9, 1, LeaveStatus.rejected,
            approver: 'Lê Thị Hồng Nhung', note: 'Cuối tháng cần chốt chấm công'),
        leave(driverEmployees[1], LeaveType.annual, -20, 2, LeaveStatus.approved,
            approver: 'Phan Văn Điều'),
      ];
      await isar.leaveRequests.putAll(leaves);

    });
    // HẾT TRANSACTION — không được query trong writeTxn (Isar cấm lồng nhau).

    // Bảng lương tháng TRƯỚC đã phát sinh -> dashboard có số liệu khi lùi
    // tháng. Tính NGOÀI transaction rồi lưu bằng transaction riêng.
    final calculated = await PayrollCalculatorService.instance
        .calculateMonthlyPayrollFor(lastMonth.year, lastMonth.month, isar);
    final lastMonthPayrolls =
        calculated.where((p) => p.netSalary > 0).toList();
    for (final p in lastMonthPayrolls) {
      p.status = PayrollStatus.paid;
      p.paidDate = DateTime(lastMonth.year, lastMonth.month + 1, 5);
    }
    await isar.writeTxn(() => isar.payrolls.putAll(lastMonthPayrolls));
  }
}
