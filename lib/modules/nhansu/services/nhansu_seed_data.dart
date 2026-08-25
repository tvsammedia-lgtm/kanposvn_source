import '../../../core/db/database_service.dart';
import '../../../core/utils/id_generator.dart';
import '../models/employee_model.dart';
import '../models/attendance_model.dart';
import '../models/payroll_model.dart';
import '../models/accounting_model.dart';

class NhanSuSeedData {
  static Future<void> seedIfEmpty() async {
    final db = DatabaseService.instance;
    if (db.getCollection('employees').isNotEmpty) return;

    final now = DateTime.now();
    final year = now.year;
    final month = now.month;

    final employees = [
      EmployeeModel(
        id: 'NV-001',
        employeeCode: 'NV-001',
        fullName: 'Nguyễn Văn An',
        birthDate: DateTime(1995, 3, 12),
        gender: 'Nam',
        phone: '0911111222',
        email: 'an.nguyen@nhansu.com',
        department: 'Phòng Kế toán',
        position: 'Nhân viên kế toán',
        joinDate: DateTime(2022, 5, 1),
        baseSalary: 8000000,
        allowances: {'xangXe': 500000},
      ),
      EmployeeModel(
        id: 'NV-002',
        employeeCode: 'NV-002',
        fullName: 'Trần Thị Bích',
        birthDate: DateTime(1992, 7, 25),
        gender: 'Nữ',
        phone: '0911111333',
        email: 'bich.tran@nhansu.com',
        department: 'Phòng Nhân sự',
        position: 'Chuyên viên nhân sự',
        joinDate: DateTime(2021, 8, 15),
        baseSalary: 9000000,
        allowances: {'anTrua': 500000},
      ),
      EmployeeModel(
        id: 'NV-003',
        employeeCode: 'NV-003',
        fullName: 'Lê Văn Cường',
        birthDate: DateTime(1990, 1, 8),
        gender: 'Nam',
        phone: '0911111444',
        email: 'cuong.le@nhansu.com',
        department: 'Phòng Kỹ thuật',
        position: 'Kỹ sư',
        joinDate: DateTime(2019, 3, 1),
        baseSalary: 12000000,
        allowances: {'phuCap': 1000000},
      ),
      EmployeeModel(
        id: 'NV-004',
        employeeCode: 'NV-004',
        fullName: 'Phạm Minh Đức',
        birthDate: DateTime(1997, 11, 30),
        gender: 'Nam',
        phone: '0911111555',
        email: 'duc.pham@nhansu.com',
        department: 'Phòng IT',
        position: 'Lập trình viên',
        joinDate: DateTime(2023, 2, 1),
        baseSalary: 15000000,
      ),
      EmployeeModel(
        id: 'NV-005',
        employeeCode: 'NV-005',
        fullName: 'Hoàng Thị Lan',
        birthDate: DateTime(1988, 5, 17),
        gender: 'Nữ',
        phone: '0911111666',
        email: 'lan.hoang@nhansu.com',
        department: 'Phòng Kế toán',
        position: 'Kế toán trưởng',
        joinDate: DateTime(2018, 1, 1),
        baseSalary: 18000000,
        allowances: {'phuCap': 2000000},
      ),
      EmployeeModel(
        id: 'NV-006',
        employeeCode: 'NV-006',
        fullName: 'Đặng Quốc Bảo',
        birthDate: DateTime(1986, 9, 2),
        gender: 'Nam',
        phone: '0911111777',
        email: 'bao.dang@nhansu.com',
        department: 'Phòng Kinh doanh',
        position: 'Trưởng phòng kinh doanh',
        joinDate: DateTime(2017, 6, 1),
        baseSalary: 16000000,
        allowances: {'phuCap': 1500000},
      ),
    ];

    for (final emp in employees) {
      final json = emp.toJson();
      json['status'] = emp.id == 'NV-006' ? 'inactive' : 'active';
      await db.saveItem('employees', emp.id, json, triggerSync: false);
    }

    final attendances = [
      AttendanceModel(id: 'AT-001', employeeId: 'NV-001', employeeCode: 'NV-001', employeeName: 'Nguyễn Văn An', year: year, month: month, workingDays: 22, overtimeHours: 12, leaveDays: 0),
      AttendanceModel(id: 'AT-002', employeeId: 'NV-002', employeeCode: 'NV-002', employeeName: 'Trần Thị Bích', year: year, month: month, workingDays: 21, overtimeHours: 0, leaveDays: 1),
      AttendanceModel(id: 'AT-003', employeeId: 'NV-003', employeeCode: 'NV-003', employeeName: 'Lê Văn Cường', year: year, month: month, workingDays: 20, overtimeHours: 20, leaveDays: 2),
      AttendanceModel(id: 'AT-004', employeeId: 'NV-004', employeeCode: 'NV-004', employeeName: 'Phạm Minh Đức', year: year, month: month, workingDays: 23, overtimeHours: 10, leaveDays: 0),
      AttendanceModel(id: 'AT-005', employeeId: 'NV-005', employeeCode: 'NV-005', employeeName: 'Hoàng Thị Lan', year: year, month: month, workingDays: 22, overtimeHours: 0, leaveDays: 0),
      AttendanceModel(id: 'AT-006', employeeId: 'NV-006', employeeCode: 'NV-006', employeeName: 'Đặng Quốc Bảo', year: year, month: month, workingDays: 18, overtimeHours: 0, leaveDays: 4),
    ];

    for (final att in attendances) {
      await db.saveItem('attendance', att.id, att.toJson(), triggerSync: false);
    }

    final payrolls = [
      PayrollModel(id: 'PR-001', employeeId: 'NV-001', employeeCode: 'NV-001', employeeName: 'Nguyễn Văn An', department: 'Phòng Kế toán', position: 'Nhân viên kế toán', year: year, month: month, baseSalary: 8000000, earnedBaseSalary: 8000000, overtimePay: 600000, allowances: {'xangXe': 500000}, bonus: 1000000, deductions: {'baoHiem': 800000, 'thueTNCN': 100000}, netSalary: 9200000, status: 'paid'),
      PayrollModel(id: 'PR-002', employeeId: 'NV-002', employeeCode: 'NV-002', employeeName: 'Trần Thị Bích', department: 'Phòng Nhân sự', position: 'Chuyên viên nhân sự', year: year, month: month, baseSalary: 9000000, earnedBaseSalary: 9000000, overtimePay: 0, allowances: {'anTrua': 500000}, bonus: 500000, deductions: {'baoHiem': 900000}, netSalary: 9100000, status: 'paid'),
      PayrollModel(id: 'PR-003', employeeId: 'NV-003', employeeCode: 'NV-003', employeeName: 'Lê Văn Cường', department: 'Phòng Kỹ thuật', position: 'Kỹ sư', year: year, month: month, baseSalary: 12000000, earnedBaseSalary: 12000000, overtimePay: 1200000, allowances: {'phuCap': 1000000}, bonus: 1500000, deductions: {'baoHiem': 1200000}, netSalary: 14500000, status: 'paid'),
      PayrollModel(id: 'PR-004', employeeId: 'NV-004', employeeCode: 'NV-004', employeeName: 'Phạm Minh Đức', department: 'Phòng IT', position: 'Lập trình viên', year: year, month: month, baseSalary: 15000000, earnedBaseSalary: 15000000, overtimePay: 900000, allowances: {}, bonus: 2000000, deductions: {'baoHiem': 1500000, 'thueTNCN': 300000}, netSalary: 16100000, status: 'draft'),
      PayrollModel(id: 'PR-005', employeeId: 'NV-005', employeeCode: 'NV-005', employeeName: 'Hoàng Thị Lan', department: 'Phòng Kế toán', position: 'Kế toán trưởng', year: year, month: month, baseSalary: 18000000, earnedBaseSalary: 18000000, overtimePay: 0, allowances: {'phuCap': 2000000}, bonus: 3000000, deductions: {'baoHiem': 1800000, 'thueTNCN': 500000}, netSalary: 20700000, status: 'paid'),
      PayrollModel(id: 'PR-006', employeeId: 'NV-006', employeeCode: 'NV-006', employeeName: 'Đặng Quốc Bảo', department: 'Phòng Kinh doanh', position: 'Trưởng phòng kinh doanh', year: year, month: month, baseSalary: 16000000, earnedBaseSalary: 16000000, overtimePay: 0, allowances: {'phuCap': 1500000}, bonus: 2500000, deductions: {'baoHiem': 1600000}, netSalary: 18400000, status: 'paid'),
    ];

    for (final pr in payrolls) {
      await db.saveItem('payrolls', pr.id, pr.toJson(), triggerSync: false);
    }

    // Seed chart of accounts (TT133)
    if (db.getCollection('hs_accounts').isEmpty) {
      final accounts = [
        NhanSuAccount(id: 'ACC-001', code: '111', name: 'Tiền mặt', group: '1', isDebit: true),
        NhanSuAccount(id: 'ACC-002', code: '112', name: 'Tiền gửi ngân hàng', group: '1', isDebit: true),
        NhanSuAccount(id: 'ACC-003', code: '1121', name: 'Tiền gửi thanh toán', group: '1', isDebit: true),
        NhanSuAccount(id: 'ACC-004', code: '141', name: 'Hàng hóa', group: '1', isDebit: true),
        NhanSuAccount(id: 'ACC-005', code: '1411', name: 'Nguyên vật liệu', group: '1', isDebit: true),
        NhanSuAccount(id: 'ACC-006', code: '3331', name: 'Thuế GTGT được khấu trừ', group: '3', isDebit: false),
        NhanSuAccount(id: 'ACC-007', code: '3332', name: 'Thuế GTGT phải nộp', group: '3', isDebit: false),
        NhanSuAccount(id: 'ACC-008', code: '3335', name: 'Thuế TNCN phải nộp', group: '3', isDebit: false),
        NhanSuAccount(id: 'ACC-009', code: '334', name: 'BHXH, BHYT, BHTN phải nộp', group: '3', isDebit: false),
        NhanSuAccount(id: 'ACC-010', code: '3341', name: 'Lương phải trả', group: '3', isDebit: false),
        NhanSuAccount(id: 'ACC-011', code: '3342', name: 'Phúc lợi phải trả', group: '3', isDebit: false),
        NhanSuAccount(id: 'ACC-012', code: '3382', name: 'BHXH NSDLĐ phải nộp', group: '3', isDebit: false),
        NhanSuAccount(id: 'ACC-013', code: '3383', name: 'BHYT NSDLĐ phải nộp', group: '3', isDebit: false),
        NhanSuAccount(id: 'ACC-014', code: '3384', name: 'BHTN NSDLĐ phải nộp', group: '3', isDebit: false),
        NhanSuAccount(id: 'ACC-015', code: '3385', name: 'KPCĐ NSDLĐ phải nộp', group: '3', isDebit: false),
        NhanSuAccount(id: 'ACC-016', code: '6422', name: 'Chi phí lương NSDLĐ', group: '6', isDebit: true),
        NhanSuAccount(id: 'ACC-017', code: '6423', name: 'Chi phí phúc lợi NSDLĐ', group: '6', isDebit: true),
        NhanSuAccount(id: 'ACC-018', code: '6424', name: 'Chi phí BHXH NSDLĐ', group: '6', isDebit: true),
        NhanSuAccount(id: 'ACC-019', code: '6426', name: 'Chi phí công đoàn', group: '6', isDebit: true),
        NhanSuAccount(id: 'ACC-020', code: '6428', name: 'Chi phí khác cho NLĐ', group: '6', isDebit: true),
      ];

      for (final acc in accounts) {
        await db.saveItem('hs_accounts', acc.id, acc.toJson(), triggerSync: false);
      }

      // Seed a sample GL journal entry from payroll
      final totalSalary = payrolls.fold<double>(0, (s, p) => s + p.earnedBaseSalary);
      final totalBHXH = payrolls.fold<double>(0, (s, p) => s + (p.deductions['BHXH'] ?? p.deductions['baoHiem'] ?? 0));
      final totalTax = payrolls.fold<double>(0, (s, p) => s + (p.deductions['Thuế TNCN'] ?? p.deductions['thueTNCN'] ?? 0));
      final totalNet = payrolls.fold<double>(0, (s, p) => s + p.netSalary);

      if (totalSalary > 0) {
        final entry = NhanSuJournalEntry(
          id: IdGenerator.generateId('JEN'),
          journalID: 'JEN-SALARY-$year-${month.toString().padLeft(2, '0')}',
          entryType: 'SALARY',
          year: year,
          month: month,
          date: DateTime(year, month, DateTime(year, month + 1, 0).day),
          description: 'Chi phí lương T$month/$year (${payrolls.length} NV)',
          lines: [
            NhanSuJournalLine(accountCode: '6422', accountName: 'Chi phí lương NSDLĐ', debit: totalSalary, credit: 0, description: 'Tổng lương NSDLĐ'),
            NhanSuJournalLine(accountCode: '334', accountName: 'BHXH, BHYT, BHTN phải nộp', debit: 0, credit: totalBHXH, description: 'BHXH phần NLĐ đóng'),
            NhanSuJournalLine(accountCode: '3335', accountName: 'Thuế TNCN phải nộp', debit: 0, credit: totalTax, description: 'Thuế TNCN tạm khấu trừ'),
            NhanSuJournalLine(accountCode: '3341', accountName: 'Lương phải trả', debit: 0, credit: totalNet, description: 'Lương NET phải trả cho NLĐ'),
          ],
          isPosted: true,
        );
        await db.saveItem('hs_journal_entries', entry.id, entry.toJson(), triggerSync: false);
      }
    }
  }
}
