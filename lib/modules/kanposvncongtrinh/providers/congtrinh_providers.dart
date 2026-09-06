import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/labor.dart';
import '../models/material.dart';
import '../models/project.dart';
import '../models/supplier.dart';
import '../services/congtrinh_isar_service.dart';
import '../services/congtrinh_engine.dart';

final congTrinhIsarServiceProvider = Provider<CongTrinhIsarService>((ref) {
  return CongTrinhIsarService();
});

// ---------------------------------------------------------------------------
// Đảm bảo dữ liệu mẫu đã được nạp + làm mới toàn bộ provider khi mở module.
// ---------------------------------------------------------------------------
class CongTrinhBootstrapNotifier extends StateNotifier<bool> {
  final CongTrinhIsarService _isar;
  final Ref _ref;
  bool _seeding = false;

  CongTrinhBootstrapNotifier(this._isar, this._ref) : super(false);

  Future<void> seedAndRefresh({bool force = false}) async {
    if (_seeding) return;
    _seeding = true;
    try {
      if (force) {
        await _isar.resetAndSeed();
      } else {
        await _isar.ensureSeeded();
      }
      await _ref.read(congTrinhProjectsProvider.notifier).loadProjects();
      await _ref.read(congTrinhCategoriesProvider.notifier).loadCategories();
      await _ref.read(congTrinhMaterialsProvider.notifier).loadMaterials();
      await _ref
          .read(congTrinhMaterialNormsProvider.notifier)
          .loadMaterialNorms();
      await _ref
          .read(congTrinhMaterialPricesProvider.notifier)
          .loadMaterialPrices();
      await _ref.read(congTrinhLaborTypesProvider.notifier).loadLaborTypes();
      await _ref
          .read(congTrinhLaborNormsProvider.notifier)
          .loadLaborNorms();
      await _ref.read(congTrinhSuppliersProvider.notifier).loadSuppliers();
      state = true;
    } finally {
      _seeding = false;
    }
  }
}

final congTrinhBootstrapProvider =
    StateNotifierProvider<CongTrinhBootstrapNotifier, bool>((ref) {
  return CongTrinhBootstrapNotifier(
      ref.watch(congTrinhIsarServiceProvider), ref);
});

// ---------------------------------------------------------------------------
// Projects
// ---------------------------------------------------------------------------
class CongTrinhProjectsNotifier extends StateNotifier<List<CongTrinhProject>> {
  final CongTrinhIsarService _isar;
  bool _isLoading = false;

  CongTrinhProjectsNotifier(this._isar) : super([]);

  Future<void> loadProjects() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getProjects();
    _isLoading = false;
  }

  Future<void> saveProject(CongTrinhProject project) async {
    await _isar.saveProject(project);
    await loadProjects();
  }

  Future<void> deleteProject(CongTrinhProject project) async {
    await _isar.softDeleteProject(project);
    await loadProjects();
  }
}

final congTrinhProjectsProvider =
    StateNotifierProvider<CongTrinhProjectsNotifier, List<CongTrinhProject>>(
        (ref) {
  return CongTrinhProjectsNotifier(ref.watch(congTrinhIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Categories & Materials
// ---------------------------------------------------------------------------
class CongTrinhCategoriesNotifier
    extends StateNotifier<List<CongTrinhMaterialCategory>> {
  final CongTrinhIsarService _isar;
  bool _isLoading = false;

  CongTrinhCategoriesNotifier(this._isar) : super([]);

  Future<void> loadCategories() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getCategories();
    _isLoading = false;
  }

  Future<void> saveCategory(CongTrinhMaterialCategory category) async {
    await _isar.saveCategory(category);
    await loadCategories();
  }
}

final congTrinhCategoriesProvider =
    StateNotifierProvider<CongTrinhCategoriesNotifier, List<CongTrinhMaterialCategory>>(
        (ref) {
  return CongTrinhCategoriesNotifier(ref.watch(congTrinhIsarServiceProvider));
});

class CongTrinhMaterialsNotifier extends StateNotifier<List<CongTrinhMaterial>> {
  final CongTrinhIsarService _isar;
  bool _isLoading = false;

  CongTrinhMaterialsNotifier(this._isar) : super([]);

  Future<void> loadMaterials() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getMaterials();
    _isLoading = false;
  }

  Future<void> saveMaterial(CongTrinhMaterial material) async {
    await _isar.saveMaterial(material);
    await loadMaterials();
  }
}

final congTrinhMaterialsProvider =
    StateNotifierProvider<CongTrinhMaterialsNotifier, List<CongTrinhMaterial>>(
        (ref) {
  return CongTrinhMaterialsNotifier(ref.watch(congTrinhIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Norms & Prices
// ---------------------------------------------------------------------------
class CongTrinhMaterialNormsNotifier
    extends StateNotifier<List<CongTrinhMaterialNorm>> {
  final CongTrinhIsarService _isar;
  bool _isLoading = false;

  CongTrinhMaterialNormsNotifier(this._isar) : super([]);

  Future<void> loadMaterialNorms() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getMaterialNorms();
    _isLoading = false;
  }

  Future<void> saveMaterialNorm(CongTrinhMaterialNorm norm) async {
    await _isar.saveMaterialNorm(norm);
    await loadMaterialNorms();
  }
}

final congTrinhMaterialNormsProvider =
    StateNotifierProvider<CongTrinhMaterialNormsNotifier, List<CongTrinhMaterialNorm>>(
        (ref) {
  return CongTrinhMaterialNormsNotifier(ref.watch(congTrinhIsarServiceProvider));
});

class CongTrinhMaterialPricesNotifier
    extends StateNotifier<List<CongTrinhMaterialPrice>> {
  final CongTrinhIsarService _isar;
  bool _isLoading = false;

  CongTrinhMaterialPricesNotifier(this._isar) : super([]);

  Future<void> loadMaterialPrices() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getMaterialPrices();
    _isLoading = false;
  }

  Future<void> saveMaterialPrice(CongTrinhMaterialPrice price) async {
    await _isar.saveMaterialPrice(price);
    await loadMaterialPrices();
  }
}

final congTrinhMaterialPricesProvider =
    StateNotifierProvider<CongTrinhMaterialPricesNotifier, List<CongTrinhMaterialPrice>>(
        (ref) {
  return CongTrinhMaterialPricesNotifier(
      ref.watch(congTrinhIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Labor
// ---------------------------------------------------------------------------
class CongTrinhLaborTypesNotifier extends StateNotifier<List<CongTrinhLaborType>> {
  final CongTrinhIsarService _isar;
  bool _isLoading = false;

  CongTrinhLaborTypesNotifier(this._isar) : super([]);

  Future<void> loadLaborTypes() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getLaborTypes();
    _isLoading = false;
  }

  Future<void> saveLaborType(CongTrinhLaborType laborType) async {
    await _isar.saveLaborType(laborType);
    await loadLaborTypes();
  }
}

final congTrinhLaborTypesProvider =
    StateNotifierProvider<CongTrinhLaborTypesNotifier, List<CongTrinhLaborType>>(
        (ref) {
  return CongTrinhLaborTypesNotifier(ref.watch(congTrinhIsarServiceProvider));
});

class CongTrinhLaborNormsNotifier extends StateNotifier<List<CongTrinhLaborNorm>> {
  final CongTrinhIsarService _isar;
  bool _isLoading = false;

  CongTrinhLaborNormsNotifier(this._isar) : super([]);

  Future<void> loadLaborNorms() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getLaborNorms();
    _isLoading = false;
  }

  Future<void> saveLaborNorm(CongTrinhLaborNorm norm) async {
    await _isar.saveLaborNorm(norm);
    await loadLaborNorms();
  }
}

final congTrinhLaborNormsProvider =
    StateNotifierProvider<CongTrinhLaborNormsNotifier, List<CongTrinhLaborNorm>>(
        (ref) {
  return CongTrinhLaborNormsNotifier(ref.watch(congTrinhIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Suppliers
// ---------------------------------------------------------------------------
class CongTrinhSuppliersNotifier extends StateNotifier<List<CongTrinhSupplier>> {
  final CongTrinhIsarService _isar;
  bool _isLoading = false;

  CongTrinhSuppliersNotifier(this._isar) : super([]);

  Future<void> loadSuppliers() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getSuppliers();
    _isLoading = false;
  }

  Future<void> saveSupplier(CongTrinhSupplier supplier) async {
    await _isar.saveSupplier(supplier);
    await loadSuppliers();
  }
}

final congTrinhSuppliersProvider =
    StateNotifierProvider<CongTrinhSuppliersNotifier, List<CongTrinhSupplier>>(
        (ref) {
  return CongTrinhSuppliersNotifier(ref.watch(congTrinhIsarServiceProvider));
});

// ---------------------------------------------------------------------------
// Tra cứu trực tiếp (dự toán, chi tiết dự toán, bảng giá)
// ---------------------------------------------------------------------------
final congTrinhEstimatesProvider =
    FutureProvider.family<List<CongTrinhEstimate>, String>((ref, projectId) {
  return ref.watch(congTrinhIsarServiceProvider).getEstimates(projectId);
});

final congTrinhEstimateItemsProvider =
    FutureProvider.family<List<CongTrinhEstimateItem>, String>((ref, estimateId) {
  return ref.watch(congTrinhIsarServiceProvider).getEstimateItems(estimateId);
});

final congTrinhBestMaterialPriceProvider =
    FutureProvider.family<CongTrinhMaterialPrice?, String>((ref, materialId) {
  return ref
      .watch(congTrinhIsarServiceProvider)
      .getBestMaterialPrice(materialId);
});

// Engine instance: dùng trực tiếp trong Project/Estimate workflow.
final congTrinhEngineProvider = Provider<CongTrinhEstimationEngine>((ref) {
  return CongTrinhEstimationEngine(ref.watch(congTrinhIsarServiceProvider));
});