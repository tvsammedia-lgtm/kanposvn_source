import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/barber_appointment.dart';
import 'barber_service_provider.dart';

class AppointmentNotifier extends StateNotifier<AsyncValue<List<BarberAppointment>>> {
  final Ref ref;

  AppointmentNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadAppointments();
  }

  Future<void> loadAppointments() async {
    try {
      state = const AsyncValue.loading();
      final dbService = await ref.read(barberDbServiceProvider.future);
      final appointments = await dbService.getAppointments();
      state = AsyncValue.data(appointments);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addAppointment(BarberAppointment appointment) async {
    try {
      final dbService = await ref.read(barberDbServiceProvider.future);
      await dbService.saveAppointment(appointment);
      await loadAppointments();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final appointmentProvider = StateNotifierProvider<AppointmentNotifier, AsyncValue<List<BarberAppointment>>>((ref) {
  return AppointmentNotifier(ref);
});
