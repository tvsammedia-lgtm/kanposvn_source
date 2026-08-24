import 'package:isar/isar.dart';

import 'attendance.dart' show LeaveType;

part 'leave_request.g.dart';

enum LeaveStatus { pending, approved, rejected, cancelled }

/// Đơn xin nghỉ phép — quy trình §8 nhansu.md:
/// Tạo đơn -> Duyệt/Từ chối -> trừ vào phép năm khi duyệt.
@collection
class LeaveRequest {
  Id id = Isar.autoIncrement;

  late int employeeId;
  late String employeeCode;
  late String employeeName;
  late String department;

  @Enumerated(EnumType.name)
  LeaveType leaveType = LeaveType.annual;

  late DateTime fromDate;
  late DateTime toDate;

  @ignore
  int get days =>
      toDate.difference(fromDate).inDays + 1;

  String? reason;

  @Enumerated(EnumType.name)
  LeaveStatus status = LeaveStatus.pending;

  String? approverName;
  String? approvalNote;
  DateTime? approvedAt;

  // Sync
  String? remoteId;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
