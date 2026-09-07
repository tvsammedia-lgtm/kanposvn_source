import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/prescription.dart';
import '../models/patient.dart';
import '../providers/phongkham_provider.dart';
import 'phongkham_isar_service.dart';

final aiServiceProvider = Provider<AiService>((ref) {
  final svc = ref.watch(phongKhamServiceProvider);
  return AiServiceImpl(svc);
});

abstract class AiService {
  Future<String> summarizePatientHistory(Patient patient);
  Future<Prescription> generatePrescriptionDraft(String symptoms, String diagnosis);
  Future<void> logDoctorAction(String aiRequestId, String action, String details);
}

/// AiServiceImpl dựa trên PhongKhamIsarService thật (AI audit đầy đủ).
/// AI chỉ tạo bản nháp, bác sĩ phải xem xét và xác nhận.
class AiServiceImpl implements AiService {
  final PhongKhamIsarService _service;

  AiServiceImpl(this._service);

  @override
  Future<String> summarizePatientHistory(Patient patient) async {
    return 'Bản tóm tắt mẫu từ AI cho ${patient.fullName} '
        '(dị ứng: ${(patient.allergies ?? const []).join(', ')}). '
        'Bác sĩ cần xem xét trước khi sử dụng.';
  }

  @override
  Future<Prescription> generatePrescriptionDraft(String symptoms, String diagnosis) async {
    return Prescription()
      ..status = 'draft'
      ..diagnosis = diagnosis
      ..notes = 'AI draft — bác sĩ phải xác nhận trước khi phát hành';
  }

  @override
  Future<void> logDoctorAction(String aiRequestId, String action, String details) async {
    await _service.logAiDoctorAction(
      aiRequestId: aiRequestId,
      action: action,
      acceptedItems: action == 'accepted' ? [details] : null,
      rejectedItems: action == 'rejected' ? [details] : null,
      editedItems: action == 'edited' ? [details] : null,
      userId: details,
    );
  }
}