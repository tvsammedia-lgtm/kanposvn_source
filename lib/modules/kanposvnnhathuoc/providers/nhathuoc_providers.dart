import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../services/nhathuoc_isar_service.dart';
import '../services/nhathuoc_neon_sync_service.dart';
import '../services/nhathuoc_einvoice_settings.dart';
import '../models/nhathuoc_medicine.dart';
import '../models/nhathuoc_patient.dart';
import '../models/nhathuoc_order.dart';
import '../models/nhathuoc_purchase.dart';
import '../models/nhathuoc_prescription.dart';

// Services
final nhathuocIsarServiceProvider = Provider<NhathuocIsarService>((ref) {
  return NhathuocIsarService();
});

final nhathuocNeonSyncServiceProvider = Provider<NhathuocNeonSyncService>((ref) {
  final isarService = ref.watch(nhathuocIsarServiceProvider);
  return NhathuocNeonSyncService(isarService);
});

// Settings
final nhathuocEinvoiceSettingsProvider =
    ChangeNotifierProvider<NhathuocEinvoiceSettingsStore>((ref) {
  final store = NhathuocEinvoiceSettingsStore();
  store.load();
  return store;
});

// Medicines
class NhathuocMedicinesNotifier extends StateNotifier<AsyncValue<List<NhathuocMedicine>>> {
  final NhathuocIsarService _isarService;

  NhathuocMedicinesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadMedicines();
  }

  Future<void> loadMedicines() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final medicines = await db.nhathuocMedicines.where().findAll();
      state = AsyncValue.data(medicines);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addMedicine(NhathuocMedicine medicine) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.nhathuocMedicines.put(medicine);
    });
    await loadMedicines();
  }
}

final nhathuocMedicinesProvider = StateNotifierProvider<NhathuocMedicinesNotifier, AsyncValue<List<NhathuocMedicine>>>((ref) {
  final isarService = ref.watch(nhathuocIsarServiceProvider);
  return NhathuocMedicinesNotifier(isarService);
});

// Patients
class NhathuocPatientsNotifier extends StateNotifier<AsyncValue<List<NhathuocPatient>>> {
  final NhathuocIsarService _isarService;

  NhathuocPatientsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadPatients();
  }

  Future<void> loadPatients() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final patients = await db.nhathuocPatients.where().findAll();
      state = AsyncValue.data(patients);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addPatient(NhathuocPatient patient) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.nhathuocPatients.put(patient);
    });
    await loadPatients();
  }
}

final nhathuocPatientsProvider = StateNotifierProvider<NhathuocPatientsNotifier, AsyncValue<List<NhathuocPatient>>>((ref) {
  final isarService = ref.watch(nhathuocIsarServiceProvider);
  return NhathuocPatientsNotifier(isarService);
});

// Orders (POS)
class NhathuocOrdersNotifier extends StateNotifier<AsyncValue<List<NhathuocOrder>>> {
  final NhathuocIsarService _isarService;

  NhathuocOrdersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final orders = await db.nhathuocOrders.where().findAll();
      state = AsyncValue.data(orders);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createOrder(NhathuocOrder order, List<NhathuocOrderDetail> details) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.nhathuocOrders.put(order);
        if (order.patient.value != null) {
          await order.patient.save();
        }
        
        for (var d in details) {
          await db.nhathuocOrderDetails.put(d);
          await d.order.save();
          await d.medicine.save();

          // Deduct stock
          if (d.medicine.value != null) {
            final med = d.medicine.value!;
            med.currentStock -= d.quantity;
            await db.nhathuocMedicines.put(med);
          }
        }
      });
      await loadOrders();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final nhathuocOrdersProvider = StateNotifierProvider<NhathuocOrdersNotifier, AsyncValue<List<NhathuocOrder>>>((ref) {
  final isarService = ref.watch(nhathuocIsarServiceProvider);
  return NhathuocOrdersNotifier(isarService);
});

// Purchases (Inventory)
class NhathuocPurchasesNotifier extends StateNotifier<AsyncValue<List<NhathuocPurchase>>> {
  final NhathuocIsarService _isarService;

  NhathuocPurchasesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadPurchases();
  }

  Future<void> loadPurchases() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final purchases = await db.nhathuocPurchases.where().findAll();
      state = AsyncValue.data(purchases);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createPurchase(NhathuocPurchase purchase, List<NhathuocPurchaseDetail> details) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.nhathuocPurchases.put(purchase);
        if (purchase.supplier.value != null) {
          await purchase.supplier.save();
        }
        
        for (var d in details) {
          await db.nhathuocPurchaseDetails.put(d);
          await d.purchase.save();
          await d.medicine.save();

          // Add stock
          if (d.medicine.value != null) {
            final med = d.medicine.value!;
            med.currentStock += d.quantity;
            await db.nhathuocMedicines.put(med);
          }
        }
      });
      await loadPurchases();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final nhathuocPurchasesProvider = StateNotifierProvider<NhathuocPurchasesNotifier, AsyncValue<List<NhathuocPurchase>>>((ref) {
  final isarService = ref.watch(nhathuocIsarServiceProvider);
  return NhathuocPurchasesNotifier(isarService);
});

// Prescription Templates

class NhathuocPrescriptionTemplatesNotifier extends StateNotifier<AsyncValue<List<NhathuocPrescriptionTemplate>>> {
  final NhathuocIsarService _isarService;

  NhathuocPrescriptionTemplatesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTemplates();
  }

  Future<void> loadTemplates() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final templates = await db.nhathuocPrescriptionTemplates.where().findAll();
      state = AsyncValue.data(templates);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createTemplate(NhathuocPrescriptionTemplate template, List<NhathuocPrescriptionTemplateDetail> details) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.nhathuocPrescriptionTemplates.put(template);
        for (var d in details) {
          await db.nhathuocPrescriptionTemplateDetails.put(d);
          await d.template.save();
          await d.medicine.save();
        }
      });
      await loadTemplates();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final nhathuocPrescriptionTemplatesProvider = StateNotifierProvider<NhathuocPrescriptionTemplatesNotifier, AsyncValue<List<NhathuocPrescriptionTemplate>>>((ref) {
  final isarService = ref.watch(nhathuocIsarServiceProvider);
  return NhathuocPrescriptionTemplatesNotifier(isarService);
});

// Finance (Dashboard Metrics)
class NhathuocFinanceNotifier extends StateNotifier<AsyncValue<Map<String, double>>> {
  final NhathuocIsarService _isarService;

  NhathuocFinanceNotifier(this._isarService) : super(const AsyncValue.loading()) {
    calculateMetrics();
  }

  Future<void> calculateMetrics() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      
      double totalRevenue = 0;
      double totalCOGS = 0; // Cost of Goods Sold
      double inventoryValue = 0;

      // Calculate Revenue and COGS from Orders
      final orders = await db.nhathuocOrders.where().findAll();
      for (var order in orders) {
        totalRevenue += order.totalAmount;
        await order.details.load();
        for (var detail in order.details) {
          await detail.medicine.load();
          final med = detail.medicine.value;
          if (med != null) {
            totalCOGS += (detail.quantity * med.purchasePrice);
          }
        }
      }

      // Calculate Inventory Value from Medicines
      final medicines = await db.nhathuocMedicines.where().findAll();
      for (var med in medicines) {
        if (med.currentStock > 0) {
          inventoryValue += (med.currentStock * med.purchasePrice);
        }
      }

      double grossProfit = totalRevenue - totalCOGS;

      state = AsyncValue.data({
        'revenue': totalRevenue,
        'cogs': totalCOGS,
        'profit': grossProfit,
        'inventory': inventoryValue,
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final nhathuocFinanceProvider = StateNotifierProvider<NhathuocFinanceNotifier, AsyncValue<Map<String, double>>>((ref) {
  final isarService = ref.watch(nhathuocIsarServiceProvider);
  return NhathuocFinanceNotifier(isarService);
});
