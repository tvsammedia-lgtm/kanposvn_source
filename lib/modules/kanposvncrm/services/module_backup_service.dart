import 'dart:convert';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/db/database_service.dart' as core_db;
import '../../../core/db/isar_models/data_entity.dart';
import '../../../core/module_enum.dart';
import 'crm_isar_service.dart';
import '../../kanposvnbanvevantai/services/vantai_isar_service.dart';
import '../../kanposvnbanvevantai/services/vantai_seed_data.dart';
import '../../kanposvnnhahangquanan/services/restaurant_isar_service.dart';
import '../../kanposvnnhahangquanan/services/restaurant_seed_data.dart';
import '../../kanposvnnbatdongsan/repositories/isar_db.dart';
import '../../kanposvnnbatdongsan/services/batdongsan_seed_data.dart';
import '../../kanposvnhrpayroll/services/database_service.dart';
import '../../kanposvnbida/services/bida_isar_service.dart';
import '../../kanposvnbida/services/bida_seed_data.dart';
import '../../kanposvnbida/models/bida_finance.dart';
import '../../kanposvnbida/models/bida_inventory_tx.dart';
import '../../kanposvnbida/models/bida_item.dart';
import '../../kanposvnbida/models/bida_partner.dart';
import '../../kanposvnbida/models/bida_session.dart';
import '../../kanposvnbida/models/bida_table.dart';
import '../../kanposvnparking/services/parking_isar_service.dart';
import '../../kanposvnparking/services/parking_seed_data.dart';
import '../../kanposvnparking/models/camera.dart';
import '../../kanposvnparking/models/monthly_ticket.dart';
import '../../kanposvnparking/models/parking_area.dart';
import '../../kanposvnparking/models/parking_customer.dart';
import '../../kanposvnparking/models/parking_finance.dart';
import '../../kanposvnparking/models/parking_ticket.dart';
import '../../kanposvnparking/models/parking_tariff.dart';
import '../../kanposvnparking/models/rental.dart';
import '../../kanposvnparking/models/vehicle.dart';
import '../../kanposvnxeom/providers/xeom_isar_provider.dart';
import '../../kanposvnxeom/services/xeom_seed_data.dart';
import '../../kanposvnxeom/models/booking.dart' as xeom_booking;
import '../../kanposvnxeom/models/customer.dart' as xeom_customer;
import '../../kanposvnxeom/models/driver.dart' as xeom_driver;
import '../../kanposvnxeom/models/payment.dart' as xeom_payment;
import '../../kanposvnxeom/models/vehicle.dart' as xeom_vehicle;
import '../../kanposvnxeom/models/ops_models.dart' as xeom_ops;
import '../../kanposvnride/providers/ride_isar_provider.dart';
import '../../kanposvnride/services/ride_seed_data.dart';
import '../../kanposvnride/models/ride_booking.dart' as ride_booking;
import '../../kanposvnride/models/ride_driver.dart' as ride_driver;
import '../../kanposvnride/models/ride_ops_models.dart' as ride_ops;
import '../../kanposvnride/models/ride_transaction.dart' as ride_tx;
import '../../kanposvnride/models/ride_trip.dart' as ride_trip;
import '../../kanposvnride/models/ride_user.dart' as ride_user;
import '../../kanposvnride/models/ride_vehicle_type.dart' as ride_vt;
import '../../kanposvnngoaingu/providers/ngoaingu_isar_provider.dart';
import '../../kanposvnngoaingu/services/ngoai_ngo_seed_data.dart';
import '../../kanposvnngoaingu/models/ai_evaluation.dart' as nn_ai;
import '../../kanposvnngoaingu/models/assignment.dart' as nn_asg;
import '../../kanposvnngoaingu/models/course_class.dart' as nn_cls;
import '../../kanposvnngoaingu/models/ngoai_ngo_ops.dart' as nn_ops;
import '../../kanposvnngoaingu/models/schedule.dart' as nn_sch;
import '../../kanposvnngoaingu/models/student.dart' as nn_stu;
import '../../kanposvnngoaingu/models/teacher.dart' as nn_tch;
import '../../kanposvnngoaingu/models/user.dart' as nn_user;
import '../../kanposvnviec/services/viec_isar_service.dart';
import '../../kanposvnviec/services/viec_seed_data.dart';
import '../../kanposvnviec/models/candidate.dart' as viec_cand;
import '../../kanposvnviec/models/contract.dart' as viec_ct;
import '../../kanposvnviec/models/employer.dart' as viec_emp;
import '../../kanposvnviec/models/job_category.dart' as viec_cat;
import '../../kanposvnviec/models/job_match.dart' as viec_m;
import '../../kanposvnviec/models/job_posting.dart' as viec_job;
import '../../kanposvnviec/models/payment.dart' as viec_pay;
import '../../kanposvnviec/models/viec_ops_models.dart' as viec_ops;
import '../../kanposvneshop/services/eshop_isar_service.dart';
import '../../kanposvneshop/services/eshop_seed_data.dart';
import '../../kanposvneshop/models/eshop_category.dart' as es_cat;
import '../../kanposvneshop/models/eshop_cart.dart' as es_cart;
import '../../kanposvneshop/models/eshop_gps_models.dart' as es_gps;
import '../../kanposvnvideocall/providers/videocall_isar_provider.dart' as vc_prov;
import '../../kanposvnvideocall/services/videocall_seed_data.dart' as vc_seed;
import '../../kanposvnvideocall/models/call_history.dart' as vc_hist;
import '../../kanposvnvideocall/models/contact.dart' as vc_ct;
import '../../kanposvnvideocall/models/conversation.dart' as vc_conv;
import '../../kanposvnvideocall/models/message.dart' as vc_msg;
import '../../kanposvnvideocall/models/user.dart' as vc_user;
import '../../kanposvnvideocall/models/videocall_ops_models.dart' as vc_ops;
import '../../kanposvnairbook/providers/airbook_isar_provider.dart' as ab_prov;
import '../../kanposvnairbook/services/airbook_seed_data.dart' as ab_seed;
import '../../kanposvnairbook/models/airbook_ops_models.dart' as ab_ops;
import '../../kanposvnairbook/models/booking.dart' as ab_bk;
import '../../kanposvnairbook/models/flight_offer.dart' as ab_of;
import '../../kanposvnairbook/models/sync_queue.dart' as ab_sq;
import '../../kanposvneshop/models/eshop_ops_models.dart' as es_ops;
import '../../kanposvneshop/models/eshop_order.dart' as es_ord;
import '../../kanposvneshop/models/eshop_product.dart' as es_prod;
import '../../kanposvneshop/models/eshop_shop.dart' as es_shop;
import '../../kanposvneshop/models/eshop_wallet.dart' as es_wallet;

/// Một module có DB Isar riêng, đăng ký vào bảng quản lý backup.
class ModuleBackupEntry {
  final String id;
  final String name;
  final String isarName;
  final Future<Isar> Function() open;

  /// Xóa toàn bộ dữ liệu rồi seed lại mẫu. null = module không có seed
  /// (reset sẽ chỉ xóa trắng).
  final Future<void> Function()? resetToSeed;

  const ModuleBackupEntry({
    required this.id,
    required this.name,
    required this.isarName,
    required this.open,
    this.resetToSeed,
  });
}

/// Kết quả thao tác backup/restore để UI hiển thị.
class BackupFileInfo {
  final File file;
  final DateTime modified;
  final int sizeBytes;

  BackupFileInfo({
    required this.file,
    required this.modified,
    required this.sizeBytes,
  });

  String get sizeLabel {
    final kb = sizeBytes / 1024;
    if (kb >= 1024) return '${(kb / 1024).toStringAsFixed(1)} MB';
    return '${kb.toStringAsFixed(0)} KB';
  }
}

/// Quản lý backup / restore dữ liệu Isar của từng module.
///
/// - Backup: `Isar.copyToFile` tạo bản chụp gọn nhẹ mà KHÔNG cần đóng DB.
/// - Restore từ file: đóng instance -> thay file .isar -> mở lại.
/// - Reset seed: xóa trắng collection + chạy lại seedIfEmpty của module.
class ModuleBackupService {
  static final List<ModuleBackupEntry> modules = [
    ModuleBackupEntry(
      id: 'core',
      name: 'POS chung (Core — cafe, tạp hóa, VLXD...)',
      isarName: 'kanposvn_data',
      open: () => DatabaseServiceCore.openShared(),
    ),
    ModuleBackupEntry(
      id: 'crm',
      name: 'CRM',
      isarName: 'kanposvncrm_db',
      open: () => CrmIsarServiceBridge.open(),
    ),
    ModuleBackupEntry(
      id: 'restaurant',
      name: 'Nhà hàng / Quán ăn',
      isarName: 'restaurant_db',
      open: () => RestaurantIsarServiceBridge.open(),
      resetToSeed: () => RestaurantIsarServiceBridge.resetSeed(),
    ),
    ModuleBackupEntry(
      id: 'vantai',
      name: 'Vận tải / Bán vé',
      isarName: 'vantai_db',
      open: () => VantaiIsarServiceBridge.open(),
      resetToSeed: () => VantaiIsarServiceBridge.resetSeed(),
    ),
    ModuleBackupEntry(
      id: 'batdongsan',
      name: 'Bất động sản',
      isarName: 'kanbatdongsan_v2',
      open: () async => KanBatDongSanIsarDB.getInstance(),
      resetToSeed: () async {
        KanBatDongSanIsarDB.debugOverride = null;
        await BatDongSanSeedData.seedIfEmpty();
      },
    ),
    ModuleBackupEntry(
      id: 'hrpayroll',
      name: 'HR Payroll (Nhân sự - Tiền lương)',
      isarName: 'hrpayroll_db',
      open: () async {
        await DatabaseService.instance.initialize();
        return DatabaseService.instance.isar;
      },
      resetToSeed: () async {
        await DatabaseService.instance.resetAndSeed();
      },
    ),
    ModuleBackupEntry(
      id: 'bida',
      name: 'Quán Bida',
      isarName: 'bida_db',
      open: () => BidaIsarService().db,
      resetToSeed: () async {
        final db = await BidaIsarService().db;
        await db.writeTxn(() async {
          await db.bidaSessions.clear();
          await db.bidaTables.clear();
          await db.bidaItems.clear();
          await db.bidaInventoryTxs.clear();
          await db.bidaCustomers.clear();
          await db.bidaSuppliers.clear();
          await db.bidaFinanceTxs.clear();
          await db.bidaPricingRules.clear();
          await db.bidaBlockPlans.clear();
        });
        await BidaSeedData.seedIfEmpty(BidaIsarService());
      },
    ),
    ModuleBackupEntry(
      id: 'parking',
      name: 'Kan Parking (Bãi giữ xe & Cho thuê)',
      isarName: 'kanposvnparking_db',
      open: () => ParkingIsarService().db,
      resetToSeed: () async {
        final db = await ParkingIsarService().db;
        await db.writeTxn(() async {
          await db.parkingTickets.clear();
          await db.parkingVehicles.clear();
          await db.parkingAreas.clear();
          await db.parkingMonthlyTickets.clear();
          await db.parkingRentals.clear();
          await db.parkingCameras.clear();
          await db.parkingCustomers.clear();
          await db.parkingFinanceTxs.clear();
          await db.parkingTariffs.clear();
        });
        await ParkingSeedData.seedIfEmpty(db);
      },
    ),
    ModuleBackupEntry(
      id: 'xeom',
      name: 'Xe Ôm / Taxi (Đặt & Gọi xe)',
      isarName: 'kanposvnxeom_db',
      open: () => XeOmDatabaseSetup.init(),
      resetToSeed: () async {
        final db = await XeOmDatabaseSetup.init();
        await db.writeTxn(() async {
          await db.xeOmBookings.clear();
          await db.xeOmPayments.clear();
          await db.xeOmDrivers.clear();
          await db.xeOmVehicles.clear();
          await db.xeOmCustomers.clear();
          await db.xeOmExpenses.clear();
          await db.xeOmPromotions.clear();
          await db.xeOmTariffs.clear();
        });
        await XeOmSeedData.seedIfEmpty(db);
      },
    ),
    ModuleBackupEntry(
      id: 'ride',
      name: 'KanRide (Gọi xe)',
      isarName: 'kanposvnride_db',
      open: () => RideDatabaseSetup.init(),
      resetToSeed: () async {
        final db = await RideDatabaseSetup.init();
        await db.writeTxn(() async {
          await db.rideBookings.clear();
          await db.rideDrivers.clear();
          await db.rideUsers.clear();
          await db.kanRideTrips.clear();
          await db.rideTransactions.clear();
          await db.kanRideVehicleTypes.clear();
          await db.kanRidePromotions.clear();
          await db.rideRatings.clear();
          await db.rideChatMessages.clear();
          await db.rideMaskedCalls.clear();
          await db.rideNotifications.clear();
          await db.rideGeoFences.clear();
          await db.rideSupportTickets.clear();
          await db.rideAuditLogs.clear();
          await db.rideSelfDriveRentals.clear();
          await db.rideDeliveryOrders.clear();
          await db.rideCorporateAccounts.clear();
          await db.ridePartnerApiKeys.clear();
        });
        await RideSeedData.seedIfEmpty(db);
      },
    ),
    ModuleBackupEntry(
      id: 'ngoaingu',
      name: 'Trung tâm Ngoại ngữ',
      isarName: 'kanposvnngoaingu_db',
      open: () => NgoaiNguDatabaseSetup.init(),
      resetToSeed: () async {
        final db = await NgoaiNguDatabaseSetup.init();
        await db.writeTxn(() async {
          await db.ngoaiNguUsers.clear();
          await db.ngoaiNguStudents.clear();
          await db.ngoaiNguTeachers.clear();
          await db.ngoaiNguCourses.clear();
          await db.ngoaiNguClass.clear();
          await db.ngoaiNguRooms.clear();
          await db.ngoaiNguLessons.clear();
          await db.ngoaiNguAttendances.clear();
          await db.ngoaiNguAssignments.clear();
          await db.ngoaiNguAssignmentSubmissions.clear();
          await db.ngoaiNguAIAssessments.clear();
          await db.ngoaiNguClassStudents.clear();
          await db.ngoaiNguQuestions.clear();
          await db.ngoaiNguTestAttempts.clear();
          await db.ngoaiNguCertificates.clear();
          await db.ngoaiNguInvoices.clear();
          await db.ngoaiNguPaymentRecords.clear();
          await db.ngoaiNguVouchers.clear();
          await db.ngoaiNguProgressEntrys.clear();
          await db.ngoaiNguSyncQueueItems.clear();
          await db.ngoaiNguAuditLogs.clear();
        });
        await NgoaiNguSeedData.seedIfEmpty(db);
      },
    ),
    ModuleBackupEntry(
      id: 'viec',
      name: 'KanViec (Môi giới việc làm)',
      isarName: 'kanposvnviec_db',
      open: () => ViecIsarService().db,
      resetToSeed: () async {
        final db = await ViecIsarService().db;
        await db.writeTxn(() async {
          await db.viecCandidates.clear();
          await db.viecEmployers.clear();
          await db.viecJobCategorys.clear();
          await db.viecJobPostings.clear();
          await db.viecJobMatchs.clear();
          await db.viecContracts.clear();
          await db.viecPayments.clear();
          await db.viecWorkSessions.clear();
          await db.viecFinanceTxs.clear();
          await db.viecRatings.clear();
          await db.viecNotifications.clear();
          await db.viecAuditLogs.clear();
        });
        await ViecSeedData.seedIfEmpty(db);
      },
    ),
    ModuleBackupEntry(
      id: 'eshop',
      name: 'KanShop (Thương mại điện tử)',
      isarName: 'kanposvneshop_db',
      open: () => EshopIsarService().db,
      resetToSeed: () async {
        final db = await EshopIsarService().db;
        await db.writeTxn(() async {
          await db.kanShopStores.clear();
          await db.kanShopProducts.clear();
          await db.kanShopCategorys.clear();
          await db.kanShopCartItems.clear();
          await db.kanShopOrders.clear();
          await db.kanShopWallets.clear();
          await db.eshopVouchers.clear();
          await db.eshopFlashSales.clear();
          await db.eshopReviews.clear();
          await db.eshopWishlistItems.clear();
          await db.eshopShopFollows.clear();
          await db.eshopChatMessages.clear();
          await db.eshopWalletTransactions.clear();
          await db.eshopComplaintTickets.clear();
          await db.eshopAffiliateReferrals.clear();
          await db.eshopPointEntrys.clear();
          await db.eshopShipments.clear();
          await db.eshopGpsPings.clear();
        });
        await EshopSeedData.seedIfEmpty(db);
      },
    ),
    ModuleBackupEntry(
      id: 'videocall',
      name: 'VideoCall / Chat',
      isarName: 'kanposvnvideocall_db',
      open: () => vc_prov.VideoCallDatabaseSetup.init(),
      resetToSeed: () async {
        final db = await vc_prov.VideoCallDatabaseSetup.init();
        await db.writeTxn(() async {
          await db.videoCallUsers.clear();
          await db.videoCallContacts.clear();
          await db.videoCallConversations.clear();
          await db.videoCallMessages.clear();
          await db.videoCallHistorys.clear();
          await db.videoCallSessions.clear();
          await db.videoCallReactions.clear();
          await db.videoCallSyncQueueItems.clear();
        });
        await vc_seed.VideoCallSeedData.seedIfEmpty(db);
      },
    ),
    ModuleBackupEntry(
      id: 'airbook',
      name: 'KanAirBook (Đặt vé máy bay)',
      isarName: 'kanposvnairbook_db',
      open: () => ab_prov.AirbookDatabaseSetup.init(),
      resetToSeed: () async {
        final db = await ab_prov.AirbookDatabaseSetup.init();
        await db.writeTxn(() async {
          await db.flightOffers.clear();
          await db.bookingLocals.clear();
          await db.syncQueueLocals.clear();
          await db.airPassengers.clear();
          await db.airPayments.clear();
          await db.airPromotions.clear();
          await db.airAuditLogs.clear();
        });
        await ab_seed.AirBookSeedData.seedIfEmpty(db);
      },
    ),
  ];

  // ─── Thư mục backup ──────────────────────────────────────────────────────

  static String? _cachedBackupRoot;

  /// Thư mục GỐC chứa backup theo nền tảng:
  /// - Windows/desktop: `<Documents>/kanposvn_backups`
  /// - Android: `/storage/emulated/0/Android/data/<pkg>/files/kanposvn_backups`
  ///   (bộ nhớ ngoài của app — mở được bằng trình quản lý file / cáp USB,
  ///    KHÔNG cần xin quyền storage)
  /// - Nền tảng khác (iOS...): giữ nguyên thư mục Documents của app.
  static Future<Directory> backupRootDir() async {
    final Directory base;
    if (Platform.isAndroid) {
      base = await getExternalStorageDirectory() ??
          await getApplicationDocumentsDirectory();
    } else {
      base = await getApplicationDocumentsDirectory();
    }
    return Directory(
        '${base.path}${Platform.pathSeparator}kanposvn_backups');
  }

  /// Đường dẫn gốc backup để hiển thị trên UI (gọi sau initDocsCache()).
  static String get backupRootPath {
    final p = _cachedBackupRoot;
    if (p == null) {
      throw StateError('Gọi initDocsCache() trước khi đọc backupRootPath');
    }
    return p;
  }

  /// Root backup dạng sync (listBackups chạy đồng bộ).
  static String _backupRootSafe() {
    final p = _cachedBackupRoot;
    if (p != null) return p;
    throw StateError('Gọi initDocsCache() trước khi list backup đồng bộ');
  }

  static Future<Directory> _moduleDir(String id) async {
    final root = await backupRootDir();
    final dir =
        Directory('${root.path}${Platform.pathSeparator}$id');
    if (!dir.existsSync()) dir.createSync(recursive: true);
    return dir;
  }

  /// Dung lượng file DB chính của module (chưa tính lock/wal).
  static Future<int> dbSize(ModuleBackupEntry m) async {
    final docs = await getApplicationDocumentsDirectory();
    final f = File(
        '${docs.path}${Platform.pathSeparator}${m.isarName}.isar');
    return f.existsSync() ? f.lengthSync() : 0;
  }

  // ─── Backup ──────────────────────────────────────────────────────────────

  /// Tạo bản sao lưu mới cho module. Trả về file đã lưu.
  static Future<File> createBackup(ModuleBackupEntry m) async {
    final isar = await m.open();
    final dir = await _moduleDir(m.id);
    final ts = DateTime.now();
    final stamp = '${ts.year}${_p2(ts.month)}${_p2(ts.day)}_'
        '${_p2(ts.hour)}${_p2(ts.minute)}${_p2(ts.second)}';
    final path = '${dir.path}${Platform.pathSeparator}'
        '${m.isarName}_$stamp.isar';
    await isar.copyToFile(path);
    return File(path);
  }

  static List<BackupFileInfo> listBackups(ModuleBackupEntry m) {
    final dirPath =
        '${_backupRootSafe()}${Platform.pathSeparator}${m.id}';
    final dir = Directory(dirPath);
    if (!dir.existsSync()) return [];
    return dir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.isar'))
        .map((f) => BackupFileInfo(
              file: f,
              modified: f.lastModifiedSync(),
              sizeBytes: f.lengthSync(),
            ))
        .toList()
      ..sort((a, b) => b.modified.compareTo(a.modified));
  }

  static void deleteBackup(File f) {
    if (f.existsSync()) f.deleteSync();
  }

  // ─── Restore ─────────────────────────────────────────────────────────────

  /// Phục hồi module từ một file backup: đóng DB -> thay file -> mở lại.
  static Future<void> restoreFromBackup(
      ModuleBackupEntry m, File backup) async {
    if (!backup.existsSync()) {
      throw Exception('File backup không tồn tại');
    }
    final docs = await getApplicationDocumentsDirectory();
    final target =
        File('${docs.path}${Platform.pathSeparator}${m.isarName}.isar');

    // Đóng instance đang mở (nếu có) để nhả khóa file.
    final existing = Isar.getInstance(m.isarName);
    if (existing != null && existing.isOpen) {
      await existing.close();
    }
    // Copy qua file tạm rồi replace để tránh hỏng DB nếu copy dở.
    final tmp = File('${target.path}.restore_tmp');
    await backup.copy(tmp.path);
    if (target.existsSync()) target.deleteSync();
    tmp.renameSync(target.path);

    // Mở lại để các module dùng tiếp như bình thường.
    await m.open();
  }

  /// Xóa trắng dữ liệu và seed lại mẫu (nếu module hỗ trợ).
  static Future<void> resetToSeed(ModuleBackupEntry m) async {
    final isar = await m.open();
    await isar.writeTxn(() => isar.clear());
    if (m.resetToSeed != null) {
      await m.resetToSeed!();
    } else {
      // Không có seed -> mở lại instance sạch.
      await m.open();
    }
  }

  // ─── helpers ─────────────────────────────────────────────────────────────

  static String _p2(int n) => n.toString().padLeft(2, '0');

  /// Docs dir không await (dùng đồng bộ cho listBackups).
  static String? _cachedDocs;
  static String _docsDirSafe() {
    if (_cachedDocs != null) return _cachedDocs!;
    throw StateError('Gọi initDocsCache() trước khi list backup đồng bộ');
  }

  /// Gọi một lần lúc màn hình khởi động để listBackups chạy được sync.
  static Future<void> initDocsCache() async {
    final docs = await getApplicationDocumentsDirectory();
    _cachedDocs = docs.path;
    final root = await backupRootDir();
    if (!root.existsSync()) root.createSync(recursive: true);
    _cachedBackupRoot = root.path;
  }

  // ════════════════════════════════════════════════════════════════════════
  //  MODULE DÙNG CHUNG POS — backup JSON TÁCH RIÊNG theo appCode
  //  (các module chia sẻ file kanposvn_data.isar qua collection DataEntity,
  //   dữ liệu phân biệt bằng trường appCode -> export/import từng phần)
  // ════════════════════════════════════════════════════════════════════════

  /// Quét DB dùng chung: mỗi appCode đang có bao nhiêu bản ghi.
  /// Chỉ hiện những module CÓ DỮ LIỆU trên máy hiện tại.
  static Future<List<({String appCode, String label, int records})>>
      listSharedModules() async {
    final isar = await DatabaseServiceCore.openShared();
    final all = await isar.dataEntitys.where().findAll();
    final byApp = <String, int>{};
    for (final e in all) {
      byApp[e.appCode] = (byApp[e.appCode] ?? 0) + 1;
    }
    final result = <({String appCode, String label, int records})>[];
    for (final entry in byApp.entries) {
      final label = AppModule.values
          .where((m) => m.appCode == entry.key)
          .map((m) => m.label)
          .firstWhere((_) => true, orElse: () => entry.key);
      result.add((appCode: entry.key, label: label, records: entry.value));
    }
    result.sort((a, b) => b.records.compareTo(a.records));
    return result;
  }

  static Directory _sharedDir(String appCode) {
    final safeId = 'shared_${appCode.replaceAll(RegExp(r'[^a-z0-9_]'), '_')}';
    return Directory('${_backupRootSafe()}${Platform.pathSeparator}$safeId')
      ..createSync(recursive: true);
  }

  /// Export toàn bộ DataEntity của MỘT appCode ra file JSON riêng biệt.
  static Future<File> createSharedBackup(String appCode) async {
    final isar = await DatabaseServiceCore.openShared();
    final rows = await isar.dataEntitys
        .filter()
        .appCodeEqualTo(appCode)
        .findAll();

    final payload = {
      'type': 'kanposvn_shared_module_backup',
      'appCode': appCode,
      'exportedAt': DateTime.now().toIso8601String(),
      'recordCount': rows.length,
      'rows': rows.map(_entityToJson).toList(),
    };

    final ts = DateTime.now();
    final stamp = '${ts.year}${_p2(ts.month)}${_p2(ts.day)}_'
        '${_p2(ts.hour)}${_p2(ts.minute)}${_p2(ts.second)}';
    final file = File('${_sharedDir(appCode).path}${Platform.pathSeparator}'
        'shared_${appCode}_$stamp.json');
    return file.writeAsString(
        const JsonEncoder.withIndent('  ').convert(payload));
  }

  static List<BackupFileInfo> listSharedBackups(String appCode) {
    final dir = _sharedDir(appCode);
    if (!dir.existsSync()) return [];
    return dir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.json'))
        .map((f) => BackupFileInfo(
              file: f,
              modified: f.lastModifiedSync(),
              sizeBytes: f.lengthSync(),
            ))
        .toList()
      ..sort((a, b) => b.modified.compareTo(a.modified));
  }

  /// Import lại từ file JSON: xóa dữ liệu hiện tại của appCode rồi chèn
  /// bản ghi trong file. KHÔNG đụng appCode khác. Trả về số bản ghi phục hồi.
  static Future<int> restoreSharedBackup(String appCode, File backup) async {
    final content = await backup.readAsString();
    final data = jsonDecode(content) as Map<String, dynamic>;
    if (data['type'] != 'kanposvn_shared_module_backup') {
      throw Exception('File không phải bản sao lưu module KanPosVN');
    }
    final fileAppCode = data['appCode']?.toString();
    if (fileAppCode != appCode) {
      throw Exception(
          'File thuộc module "$fileAppCode", không khớp "$appCode"');
    }
    final rows = (data['rows'] as List)
        .cast<Map<String, dynamic>>()
        .map(_entityFromJson)
        .toList();

    final isar = await DatabaseServiceCore.openShared();
    await isar.writeTxn(() async {
      // Xóa sạch appCode này trước khi chèn lại (replace toàn phần).
      await isar.dataEntitys.filter().appCodeEqualTo(appCode).deleteAll();
      await isar.dataEntitys.putAll(rows);
    });
    return rows.length;
  }

  /// Xóa dữ liệu của MỘT module dùng chung (không đụng module khác).
  static Future<int> resetSharedModule(String appCode) async {
    final isar = await DatabaseServiceCore.openShared();
    var deleted = 0;
    await isar.writeTxn(() async {
      deleted = await isar.dataEntitys
          .filter()
          .appCodeEqualTo(appCode)
          .deleteAll();
    });
    return deleted;
  }

  static Map<String, dynamic> _entityToJson(DataEntity e) => {
        'id': e.id,
        'collection': e.collection,
        'appCode': e.appCode,
        'itemId': e.itemId,
        'jsonData': e.jsonData,
        'isSynced': e.isSynced,
        'deviceId': e.deviceId,
        'version': e.version,
        'updatedAt': e.updatedAt.toIso8601String(),
        'deletedAt': e.deletedAt?.toIso8601String(),
      };

  static DataEntity _entityFromJson(Map<String, dynamic> j) => DataEntity()
    ..id = (j['id'] as num).toInt()
    ..collection = j['collection']?.toString() ?? ''
    ..appCode = j['appCode']?.toString() ?? ''
    ..itemId = j['itemId']?.toString() ?? ''
    ..jsonData = j['jsonData']?.toString() ?? ''
    ..isSynced = j['isSynced'] == true
    ..deviceId = j['deviceId']?.toString() ?? ''
    ..version = (j['version'] as num?)?.toInt() ?? 1
    ..updatedAt =
        DateTime.tryParse(j['updatedAt']?.toString() ?? '') ?? DateTime.now()
    ..deletedAt = DateTime.tryParse(j['deletedAt']?.toString() ?? '');

  // ════════════════════════════════════════════════════════════════════════
  //  CỬA HÀNG CLOUD — DB riêng isar_store_<storeId>.isar cho từng cửa hàng
  // ════════════════════════════════════════════════════════════════════════

  /// Quét các DB cửa hàng tồn tại trên máy này.
  static List<BackupFileInfo> listStoreDbs() {
    final docs = Directory(_docsDirSafe());
    if (!docs.existsSync()) return [];
    return docs
        .listSync()
        .whereType<File>()
        .where((f) {
          final name = f.uri.pathSegments.last;
          return name.startsWith('isar_store_') && name.endsWith('.isar');
        })
        .map((f) => BackupFileInfo(
              file: f,
              modified: f.lastModifiedSync(),
              sizeBytes: f.lengthSync(),
            ))
        .toList()
      ..sort((a, b) => b.modified.compareTo(a.modified));
  }

  static String storeIdOf(BackupFileInfo dbFile) =>
      dbFile.file.uri.pathSegments.last
          .replaceFirst('isar_store_', '')
          .replaceFirst('.isar', '');

  /// Backup file DB cửa hàng (mở bằng schema DataEntity nếu chưa mở).
  static Future<File> createStoreDbBackup(BackupFileInfo storeDb) async {
    final storeId = storeIdOf(storeDb);
    final isar = await core_db.DatabaseService.openStoreIsar(storeId);
    final dir = await _moduleDir('stores');
    final ts = DateTime.now();
    final stamp = '${ts.year}${_p2(ts.month)}${_p2(ts.day)}_'
        '${_p2(ts.hour)}${_p2(ts.minute)}${_p2(ts.second)}';
    final path = '${dir.path}${Platform.pathSeparator}'
        'isar_store_${storeId}_$stamp.isar';
    await isar.copyToFile(path);
    return File(path);
  }

  static List<BackupFileInfo> listStoreDbBackups(String storeId) {
    return listBackupsById('stores')
        .where((b) => b.file.uri.pathSegments.last
            .startsWith('isar_store_${storeId}_'))
        .toList();
  }

  /// Danh sách backup theo id thư mục bất kỳ (dùng chung cho stores).
  static List<BackupFileInfo> listBackupsById(String id) {
    final dir = Directory(
        '${_backupRootSafe()}${Platform.pathSeparator}$id');
    if (!dir.existsSync()) return [];
    return dir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.isar'))
        .map((f) => BackupFileInfo(
              file: f,
              modified: f.lastModifiedSync(),
              sizeBytes: f.lengthSync(),
            ))
        .toList()
      ..sort((a, b) => b.modified.compareTo(a.modified));
  }

  /// Phục hồi DB cửa hàng từ backup file: đóng instance -> thay -> mở lại.
  static Future<void> restoreStoreDb(BackupFileInfo storeDb, File backup) =>
      restoreFromBackup(
        ModuleBackupEntry(
          id: 'stores',
          name: 'Cửa hàng ${storeIdOf(storeDb)}',
          isarName: 'isar_store_${storeIdOf(storeDb)}',
          open: () => core_db.DatabaseService.openStoreIsar(storeIdOf(storeDb)),
        ),
        backup,
      );
}

/// Bridge truy cập DB các module — LUÔN delegate về service chuẩn của từng
/// module để mở đúng FULL schema (mở bằng schema rỗng vào DB có sẵn sẽ bị
/// IsarError schema mismatch — bug đã xảy ra khi backup Nhà hàng).
class DatabaseServiceCore {
  static Future<Isar> openShared() => core_db.DatabaseService.openIsar();
}

class CrmIsarServiceBridge {
  static Future<Isar> open() => CrmIsarService().db;
}

class RestaurantIsarServiceBridge {
  static Future<Isar> open() => RestaurantIsarService().db;

  static Future<void> resetSeed() async {
    final service = RestaurantIsarService();
    await service.db;
    await RestaurantSeedData.seedIfEmpty(service);
  }
}

class VantaiIsarServiceBridge {
  static Future<Isar> open() => VantaiIsarService().db;

  static Future<void> resetSeed() async {
    final service = VantaiIsarService();
    await service.db;
    await VantaiSeedData.seedIfEmpty(service);
  }
}
