import 'package:isar/isar.dart';
import '../models/barber_customer.dart';
import '../models/barber_appointment.dart';
import '../models/barber_service.dart';
import '../models/barber_employee.dart';
// import '../models/barber_invoice.dart';
// import '../models/barber_invoice_detail.dart';

class BarberDbService {
  final Isar isar;

  BarberDbService(this.isar);

  // Khách hàng
  Future<void> saveCustomer(BarberCustomer customer) async {
    await isar.writeTxn(() async {
      await isar.barberCustomers.put(customer);
    });
  }

  Future<List<BarberCustomer>> getCustomers() async {
    return await isar.barberCustomers.where().findAll();
  }

  // Lịch hẹn
  Future<void> saveAppointment(BarberAppointment appointment) async {
    await isar.writeTxn(() async {
      await isar.barberAppointments.put(appointment);
    });
  }

  Future<List<BarberAppointment>> getAppointments() async {
    return await isar.barberAppointments.where().findAll();
  }

  // Dịch vụ
  Future<void> saveService(BarberService service) async {
    await isar.writeTxn(() async {
      await isar.barberServices.put(service);
    });
  }

  Future<List<BarberService>> getServices() async {
    return await isar.barberServices.where().findAll();
  }
}
