import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/patient.dart';
import '../models/appointment.dart';
import '../models/clinical.dart';
import '../models/prescription.dart';
import '../services/phongkham_isar_service.dart';

/// Provider cho service. Ứng dụng override `.shared` trong main/test.
final phongKhamServiceProvider = Provider<PhongKhamIsarService>((ref) {
  final s = PhongKhamIsarService.instance;
  return s;
});

final patientsProvider = FutureProvider<List<Patient>>((ref) async {
  final svc = ref.watch(phongKhamServiceProvider);
  return svc.listPatients();
});

final patientDetailProvider = FutureProvider.family<Patient?, String>((ref, uuid) async {
  final svc = ref.watch(phongKhamServiceProvider);
  return svc.getPatient(uuid);
});

final appointmentsProvider = FutureProvider<List<Appointment>>((ref) async {
  final svc = ref.watch(phongKhamServiceProvider);
  return svc.listAppointments();
});

final appointmentsByDateProvider =
    FutureProvider.family<List<Appointment>, DateTime>((ref, date) async {
  final svc = ref.watch(phongKhamServiceProvider);
  return svc.listAppointments(onDate: date);
});

final encountersProvider = FutureProvider<List<Encounter>>((ref) async {
  final svc = ref.watch(phongKhamServiceProvider);
  return svc.listEncounters();
});

final encounterListProvider =
    FutureProvider.family<List<Encounter>, String>((ref, patientId) async {
  final svc = ref.watch(phongKhamServiceProvider);
  return svc.listEncounters(patientId: patientId);
});

// --- AI Prescription Draft ---
final currentPrescriptionProvider = StateProvider<Prescription?>((ref) => null);

final pendingSyncProvider = FutureProvider<List>((ref) async {
  final svc = ref.watch(phongKhamServiceProvider);
  return svc.getPendingSync();
});

final aiRequestsProvider = FutureProvider<List>((ref) async {
  final svc = ref.watch(phongKhamServiceProvider);
  return svc.listAiRequests();
});