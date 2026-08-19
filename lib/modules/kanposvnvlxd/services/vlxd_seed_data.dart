import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../models/vlxd_product.dart';
import '../models/vlxd_order.dart';
import '../models/vlxd_inventory.dart';
import '../models/vlxd_partner.dart';
import '../models/vlxd_finance.dart';
import 'vlxd_isar_service.dart';

/// Seed dữ liệu VLXD: mặt hàng (133) lấy từ MATHANG_KANVLXD_ONE.xls của KANVLXD_ONE,
/// kèm khách hàng, nhà cung cấp, kho, đơn hàng, thu chi, nhập - xuất - tồn mẫu.
class VlxdSeedData {
  static Future<void> seedIfEmpty(VlxdIsarService isarService) async {
    final db = await isarService.db;
    final categoryCount = await db.vlxdProductCategorys.count();
    if (categoryCount > 0) return;
    final uuid = const Uuid();

    // ----------------------------------------------------------------
    // 1. Danh mục (theo cột DANHMUC trong file mặt hàng KANVLXD)
    // ----------------------------------------------------------------
    final cats = [
      VlxdProductCategory()..categoryId = uuid.v4()..name = 'GẠCH MEN',
      VlxdProductCategory()..categoryId = uuid.v4()..name = 'BỒN NƯỚC',
      VlxdProductCategory()..categoryId = uuid.v4()..name = 'XI MĂNG',
      VlxdProductCategory()..categoryId = uuid.v4()..name = 'SẮT',
      VlxdProductCategory()..categoryId = uuid.v4()..name = 'DỤNG CỤ VỆ SINH',
      VlxdProductCategory()..categoryId = uuid.v4()..name = 'ĐIỆN ',
      VlxdProductCategory()..categoryId = uuid.v4()..name = 'KHÁC',
      VlxdProductCategory()..categoryId = uuid.v4()..name = 'CỬA CHỚP',
      VlxdProductCategory()..categoryId = uuid.v4()..name = 'GẠCH ỐNG thường',
      VlxdProductCategory()..categoryId = uuid.v4()..name = 'GẠCH ỐNG nam việt',
    ];
    await db.writeTxn(() async {
      await db.vlxdProductCategorys.putAll(cats);
    });

    final savedCats = await db.vlxdProductCategorys.where().findAll();
    final cat0 = savedCats.firstWhere((c) => c.name == 'GẠCH MEN');
    final cat1 = savedCats.firstWhere((c) => c.name == 'BỒN NƯỚC');
    final cat2 = savedCats.firstWhere((c) => c.name == 'XI MĂNG');
    final cat3 = savedCats.firstWhere((c) => c.name == 'SẮT');
    final cat4 = savedCats.firstWhere((c) => c.name == 'DỤNG CỤ VỆ SINH');
    final cat5 = savedCats.firstWhere((c) => c.name == 'ĐIỆN ');
    final cat6 = savedCats.firstWhere((c) => c.name == 'KHÁC');
    final cat7 = savedCats.firstWhere((c) => c.name == 'CỬA CHỚP');
    final cat8 = savedCats.firstWhere((c) => c.name == 'GẠCH ỐNG thường');
    final cat9 = savedCats.firstWhere((c) => c.name == 'GẠCH ỐNG nam việt');

    // ----------------------------------------------------------------
    // 2. Mặt hàng (133) — giá nhập = 75% giá bán lẻ (file gốc không có cột giá nhập)
    // ----------------------------------------------------------------
    final products = <VlxdProduct>[
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006354804'
        ..barcode = '0006354804'
        ..productName = 'gạch 40x40 vân kem'
        ..unit = 'thùng'
        ..purchasePrice = 63750
        ..retailPrice = 85000
        ..wholesalePrice = 85000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006355518'
        ..barcode = '0006355518'
        ..productName = 'gạch 40x40 (L3) xanh'
        ..unit = 'thùng'
        ..purchasePrice = 56250
        ..retailPrice = 75000
        ..wholesalePrice = 75000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006356068'
        ..barcode = '0006356068'
        ..productName = 'gạch 40x40 (L3) trắng'
        ..unit = 'thùng'
        ..purchasePrice = 56250
        ..retailPrice = 75000
        ..wholesalePrice = 75000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006356998'
        ..barcode = '0006356998'
        ..productName = 'gạch 40x40 mẻ trắng'
        ..unit = 'thùng'
        ..purchasePrice = 52500
        ..retailPrice = 70000
        ..wholesalePrice = 70000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006357489'
        ..barcode = '0006357489'
        ..productName = 'gạch 50x50 mè xanh'
        ..unit = 'm'
        ..purchasePrice = 93750
        ..retailPrice = 125000
        ..wholesalePrice = 125000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006357914'
        ..barcode = '0006357914'
        ..productName = 'gạch 25x40 bông xanh'
        ..unit = 'm'
        ..purchasePrice = 58500
        ..retailPrice = 78000
        ..wholesalePrice = 78000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006358052'
        ..barcode = '0006358052'
        ..productName = 'gạch 25x40 bông trắng'
        ..unit = 'm'
        ..purchasePrice = 58500
        ..retailPrice = 78000
        ..wholesalePrice = 78000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006358498'
        ..barcode = '0006358498'
        ..productName = 'gạch 25x40 vuông trăắng'
        ..unit = 'm'
        ..purchasePrice = 65250
        ..retailPrice = 87000
        ..wholesalePrice = 87000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006358718'
        ..barcode = '0006358718'
        ..productName = 'gạch 25x40 vân kem'
        ..unit = 'm'
        ..purchasePrice = 67500
        ..retailPrice = 90000
        ..wholesalePrice = 90000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006358962'
        ..barcode = '0006358962'
        ..productName = 'gạch 25x25 xanh'
        ..unit = 'm'
        ..purchasePrice = 60000
        ..retailPrice = 80000
        ..wholesalePrice = 80000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006359737'
        ..barcode = '0006359737'
        ..productName = 'gạch 26x25 đỏ'
        ..unit = 'm'
        ..purchasePrice = 60000
        ..retailPrice = 80000
        ..wholesalePrice = 80000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006359864'
        ..barcode = '0006359864'
        ..productName = 'gạch 25x25 bọt biển xanh'
        ..unit = 'm'
        ..purchasePrice = 67500
        ..retailPrice = 90000
        ..wholesalePrice = 90000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006361308'
        ..barcode = '0006361308'
        ..productName = 'gạch 25x25 bọt biển trắng'
        ..unit = 'm'
        ..purchasePrice = 67500
        ..retailPrice = 90000
        ..wholesalePrice = 90000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006361492'
        ..barcode = '0006361492'
        ..productName = 'gạch 25x40 cắt len'
        ..unit = 'm'
        ..purchasePrice = 60000
        ..retailPrice = 80000
        ..wholesalePrice = 80000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006362056'
        ..barcode = '0006362056'
        ..productName = 'gạch 25x25 đen'
        ..unit = 'm'
        ..purchasePrice = 60000
        ..retailPrice = 80000
        ..wholesalePrice = 80000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006362381'
        ..barcode = '0006362381'
        ..productName = 'gạch 30x30 '
        ..unit = 'm'
        ..purchasePrice = 123750
        ..retailPrice = 165000
        ..wholesalePrice = 165000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006363192'
        ..barcode = '0006363192'
        ..productName = 'gạch 50x 50 đá'
        ..unit = 'm'
        ..purchasePrice = 138750
        ..retailPrice = 185000
        ..wholesalePrice = 185000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006363703'
        ..barcode = '0006363703'
        ..productName = 'len 50x50'
        ..unit = 'viên'
        ..purchasePrice = 30000
        ..retailPrice = 40000
        ..wholesalePrice = 40000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006363806'
        ..barcode = '0006363806'
        ..productName = 'len 30x30'
        ..unit = 'viên'
        ..purchasePrice = 15000
        ..retailPrice = 20000
        ..wholesalePrice = 20000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006363867'
        ..barcode = '0006363867'
        ..productName = 'gạch 30x30 '
        ..unit = 'm'
        ..purchasePrice = 123750
        ..retailPrice = 165000
        ..wholesalePrice = 165000
        ..vatRate = 10
        ..category.value = cat0,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006363988'
        ..barcode = '0006363988'
        ..productName = 'bồn 500n nhựa HG'
        ..unit = 'cái'
        ..purchasePrice = 877500
        ..retailPrice = 1170000
        ..wholesalePrice = 1170000
        ..vatRate = 10
        ..category.value = cat1,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006364236'
        ..barcode = '0006364236'
        ..productName = 'bôồn 300n nhựa HG'
        ..unit = 'cái'
        ..purchasePrice = 562500
        ..retailPrice = 750000
        ..wholesalePrice = 750000
        ..vatRate = 10
        ..category.value = cat1,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006364506'
        ..barcode = '0006364506'
        ..productName = 'máng heo'
        ..unit = 'cái'
        ..purchasePrice = 18750
        ..retailPrice = 25000
        ..wholesalePrice = 25000
        ..vatRate = 10
        ..category.value = cat1,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006364914'
        ..barcode = '0006364914'
        ..productName = 'bông gió'
        ..unit = 'cái'
        ..purchasePrice = 6750
        ..retailPrice = 9000
        ..wholesalePrice = 9000
        ..vatRate = 10
        ..category.value = cat1,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006364934'
        ..barcode = '0006364934'
        ..productName = 'bánh ú'
        ..unit = 'cái'
        ..purchasePrice = 6750
        ..retailPrice = 9000
        ..wholesalePrice = 9000
        ..vatRate = 10
        ..category.value = cat1,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006364950'
        ..barcode = '0006364950'
        ..productName = 'ngói nóc ĐN'
        ..unit = 'cái'
        ..purchasePrice = 18750
        ..retailPrice = 25000
        ..wholesalePrice = 25000
        ..vatRate = 10
        ..category.value = cat1,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006365179'
        ..barcode = '0006365179'
        ..productName = 'ngói lợp ĐN'
        ..unit = 'cái'
        ..purchasePrice = 9000
        ..retailPrice = 12000
        ..wholesalePrice = 12000
        ..vatRate = 10
        ..category.value = cat1,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006365284'
        ..barcode = '0006365284'
        ..productName = 'gạch thẻ '
        ..unit = 'm'
        ..purchasePrice = 112500
        ..retailPrice = 150000
        ..wholesalePrice = 150000
        ..vatRate = 10
        ..category.value = cat1,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006365472'
        ..barcode = '0006365472'
        ..productName = 'xi măng ht'
        ..unit = 'bao'
        ..purchasePrice = 70500
        ..retailPrice = 94000
        ..wholesalePrice = 94000
        ..vatRate = 10
        ..category.value = cat2,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006365829'
        ..barcode = '0006365829'
        ..productName = 'xi măng top'
        ..unit = 'bao'
        ..purchasePrice = 67125
        ..retailPrice = 89500
        ..wholesalePrice = 89500
        ..vatRate = 10
        ..category.value = cat2,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006365849'
        ..barcode = '0006365849'
        ..productName = 'xi măng sao mai'
        ..unit = 'bao'
        ..purchasePrice = 68250
        ..retailPrice = 91000
        ..wholesalePrice = 91000
        ..vatRate = 10
        ..category.value = cat2,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006365973'
        ..barcode = '0006365973'
        ..productName = 'sắt 6'
        ..unit = 'kg'
        ..purchasePrice = 13875
        ..retailPrice = 18500
        ..wholesalePrice = 18500
        ..vatRate = 10
        ..category.value = cat3,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006366646'
        ..barcode = '0006366646'
        ..productName = 'sắt 8'
        ..unit = 'kg'
        ..purchasePrice = 13875
        ..retailPrice = 18500
        ..wholesalePrice = 18500
        ..vatRate = 10
        ..category.value = cat3,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006366740'
        ..barcode = '0006366740'
        ..productName = 'sắt 12'
        ..unit = 'cây'
        ..purchasePrice = 140250
        ..retailPrice = 187000
        ..wholesalePrice = 187000
        ..vatRate = 10
        ..category.value = cat3,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006366763'
        ..barcode = '0006366763'
        ..productName = 'sắt 14'
        ..unit = 'cây'
        ..purchasePrice = 189000
        ..retailPrice = 252000
        ..wholesalePrice = 252000
        ..vatRate = 10
        ..category.value = cat3,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006367060'
        ..barcode = '0006367060'
        ..productName = 'kẽo bô'
        ..unit = 'kg'
        ..purchasePrice = 18000
        ..retailPrice = 24000
        ..wholesalePrice = 24000
        ..vatRate = 10
        ..category.value = cat3,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006367270'
        ..barcode = '0006367270'
        ..productName = 'củ sen piano'
        ..unit = 'cái'
        ..purchasePrice = 150000
        ..retailPrice = 200000
        ..wholesalePrice = 200000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006367565'
        ..barcode = '0006367565'
        ..productName = 'vòi la liano'
        ..unit = 'cái'
        ..purchasePrice = 150000
        ..retailPrice = 200000
        ..wholesalePrice = 200000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006367887'
        ..barcode = '0006367887'
        ..productName = 'vòi chén piano'
        ..unit = 'cái'
        ..purchasePrice = 150000
        ..retailPrice = 200000
        ..wholesalePrice = 200000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006368309'
        ..barcode = '0006368309'
        ..productName = 'vỉ sen'
        ..unit = 'cái'
        ..purchasePrice = 150000
        ..retailPrice = 200000
        ..wholesalePrice = 200000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006368430'
        ..barcode = '0006368430'
        ..productName = 'xịt vs inax'
        ..unit = 'cái'
        ..purchasePrice = 180000
        ..retailPrice = 240000
        ..wholesalePrice = 240000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006368574'
        ..barcode = '0006368574'
        ..productName = 'xịt vs inox'
        ..unit = 'cái'
        ..purchasePrice = 93750
        ..retailPrice = 125000
        ..wholesalePrice = 125000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006368957'
        ..barcode = '0006368957'
        ..productName = 'xịt vs nhựa'
        ..unit = 'cái'
        ..purchasePrice = 75000
        ..retailPrice = 100000
        ..wholesalePrice = 100000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006369436'
        ..barcode = '0006369436'
        ..productName = 'kiếng 6 món 201'
        ..unit = 'cái'
        ..purchasePrice = 337500
        ..retailPrice = 450000
        ..wholesalePrice = 450000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006369439'
        ..barcode = '0006369439'
        ..productName = 'kiếng 6 món 304'
        ..unit = 'cái'
        ..purchasePrice = 562500
        ..retailPrice = 750000
        ..wholesalePrice = 750000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006369791'
        ..barcode = '0006369791'
        ..productName = 'dây cấp'
        ..unit = 'cái'
        ..purchasePrice = 22500
        ..retailPrice = 30000
        ..wholesalePrice = 30000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006369965'
        ..barcode = '0006369965'
        ..productName = 'kệ kiến'
        ..unit = 'cái'
        ..purchasePrice = 105000
        ..retailPrice = 140000
        ..wholesalePrice = 140000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006370343'
        ..barcode = '0006370343'
        ..productName = 'móc áo 304'
        ..unit = 'cái'
        ..purchasePrice = 105000
        ..retailPrice = 140000
        ..wholesalePrice = 140000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006371652'
        ..barcode = '0006371652'
        ..productName = 'móc áo thường'
        ..unit = 'cái'
        ..purchasePrice = 33750
        ..retailPrice = 45000
        ..wholesalePrice = 45000
        ..vatRate = 10
        ..category.value = cat4,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006371744'
        ..barcode = '0006371744'
        ..productName = 'keo dđen'
        ..unit = 'cuộn'
        ..purchasePrice = 9000
        ..retailPrice = 12000
        ..wholesalePrice = 12000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006371774'
        ..barcode = '0006371774'
        ..productName = 'máng 1.2m'
        ..unit = 'cây'
        ..purchasePrice = 71250
        ..retailPrice = 95000
        ..wholesalePrice = 95000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006372573'
        ..barcode = '0006372573'
        ..productName = 'máng 0.6m'
        ..unit = 'cây'
        ..purchasePrice = 63750
        ..retailPrice = 85000
        ..wholesalePrice = 85000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006372871'
        ..barcode = '0006372871'
        ..productName = 'bóng 1.2m'
        ..unit = 'bóng'
        ..purchasePrice = 9000
        ..retailPrice = 12000
        ..wholesalePrice = 12000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006373125'
        ..barcode = '0006373125'
        ..productName = 'bóng 0,6m'
        ..unit = 'bóng'
        ..purchasePrice = 7500
        ..retailPrice = 10000
        ..wholesalePrice = 10000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006374514'
        ..barcode = '0006374514'
        ..productName = 'đồng hồ điện'
        ..unit = 'cái'
        ..purchasePrice = 123750
        ..retailPrice = 165000
        ..wholesalePrice = 165000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006374875'
        ..barcode = '0006374875'
        ..productName = 'bóng 3u 80w'
        ..unit = 'cái'
        ..purchasePrice = 33750
        ..retailPrice = 45000
        ..wholesalePrice = 45000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006375895'
        ..barcode = '0006375895'
        ..productName = 'đui đèn đường'
        ..unit = 'cái'
        ..purchasePrice = 18750
        ..retailPrice = 25000
        ..wholesalePrice = 25000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006377287'
        ..barcode = '0006377287'
        ..productName = 'quạt hút'
        ..unit = 'cái'
        ..purchasePrice = 285000
        ..retailPrice = 380000
        ..wholesalePrice = 380000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006378237'
        ..barcode = '0006378237'
        ..productName = 'đế đơn sino'
        ..unit = 'cái'
        ..purchasePrice = 3750
        ..retailPrice = 5000
        ..wholesalePrice = 5000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006378274'
        ..barcode = '0006378274'
        ..productName = 'đế đôi sino'
        ..unit = 'cái'
        ..purchasePrice = 11250
        ..retailPrice = 15000
        ..wholesalePrice = 15000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006378432'
        ..barcode = '0006378432'
        ..productName = 'nối 10'
        ..unit = 'cái'
        ..purchasePrice = 11250
        ..retailPrice = 15000
        ..wholesalePrice = 15000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006378754'
        ..barcode = '0006378754'
        ..productName = 'nối 20 thường'
        ..unit = 'cái'
        ..purchasePrice = 15000
        ..retailPrice = 20000
        ..wholesalePrice = 20000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006379045'
        ..barcode = '0006379045'
        ..productName = 'nối 25'
        ..unit = 'cái'
        ..purchasePrice = 22500
        ..retailPrice = 30000
        ..wholesalePrice = 30000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006379445'
        ..barcode = '0006379445'
        ..productName = 'nối 20 sino'
        ..unit = 'cái'
        ..purchasePrice = 18750
        ..retailPrice = 25000
        ..wholesalePrice = 25000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006380594'
        ..barcode = '0006380594'
        ..productName = 'ruột gà 25 sino'
        ..unit = 'cuộn'
        ..purchasePrice = 191250
        ..retailPrice = 255000
        ..wholesalePrice = 255000
        ..vatRate = 10
        ..category.value = cat5,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006380816'
        ..barcode = '0006380816'
        ..productName = 'a dao'
        ..unit = 'hủ'
        ..purchasePrice = 3750
        ..retailPrice = 5000
        ..wholesalePrice = 5000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006381216'
        ..barcode = '0006381216'
        ..productName = 'sơn xịt'
        ..unit = 'chai'
        ..purchasePrice = 21000
        ..retailPrice = 28000
        ..wholesalePrice = 28000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006381491'
        ..barcode = '0006381491'
        ..productName = 'đinh dù'
        ..unit = 'hộp'
        ..purchasePrice = 11250
        ..retailPrice = 15000
        ..wholesalePrice = 15000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006383318'
        ..barcode = '0006383318'
        ..productName = 'màu voi'
        ..unit = 'hôp'
        ..purchasePrice = 3750
        ..retailPrice = 5000
        ..wholesalePrice = 5000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006383418'
        ..barcode = '0006383418'
        ..productName = 'đinh thép 5\''
        ..unit = 'hộp'
        ..purchasePrice = 2250
        ..retailPrice = 3000
        ..wholesalePrice = 3000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006383452'
        ..barcode = '0006383452'
        ..productName = 'đinh thép 2\''
        ..unit = 'hộp'
        ..purchasePrice = 2250
        ..retailPrice = 3000
        ..wholesalePrice = 3000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006383522'
        ..barcode = '0006383522'
        ..productName = 'đinh thép 4\''
        ..unit = 'hộp'
        ..purchasePrice = 2250
        ..retailPrice = 3000
        ..wholesalePrice = 3000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006384422'
        ..barcode = '0006384422'
        ..productName = 'đinh thép 3\''
        ..unit = 'hộp'
        ..purchasePrice = 2250
        ..retailPrice = 3000
        ..wholesalePrice = 3000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006384794'
        ..barcode = '0006384794'
        ..productName = 'đinh thép 6\''
        ..unit = 'hộp'
        ..purchasePrice = 2250
        ..retailPrice = 3000
        ..wholesalePrice = 3000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006384943'
        ..barcode = '0006384943'
        ..productName = 'móc mùng 1 tất'
        ..unit = 'hộp'
        ..purchasePrice = 2250
        ..retailPrice = 3000
        ..wholesalePrice = 3000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006385281'
        ..barcode = '0006385281'
        ..productName = 'móc mùng 6\''
        ..unit = 'hộp'
        ..purchasePrice = 2250
        ..retailPrice = 3000
        ..wholesalePrice = 3000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006385576'
        ..barcode = '0006385576'
        ..productName = 'móc mùng 8\''
        ..unit = 'hộp'
        ..purchasePrice = 2250
        ..retailPrice = 3000
        ..wholesalePrice = 3000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006385624'
        ..barcode = '0006385624'
        ..productName = 'lưởi cắt đá hoa cương'
        ..unit = 'cái'
        ..purchasePrice = 63750
        ..retailPrice = 85000
        ..wholesalePrice = 85000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006385768'
        ..barcode = '0006385768'
        ..productName = 'lưởi cắt sắt 1.2t'
        ..unit = 'cái'
        ..purchasePrice = 11250
        ..retailPrice = 15000
        ..wholesalePrice = 15000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006386741'
        ..barcode = '0006386741'
        ..productName = 'lưởi cắt sắt 1t'
        ..unit = 'cái'
        ..purchasePrice = 7500
        ..retailPrice = 10000
        ..wholesalePrice = 10000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006387066'
        ..barcode = '0006387066'
        ..productName = 'lưởi cắt sắt 3.5t'
        ..unit = 'cái'
        ..purchasePrice = 26250
        ..retailPrice = 35000
        ..wholesalePrice = 35000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006387374'
        ..barcode = '0006387374'
        ..productName = 'lưởi cắt gạch'
        ..unit = 'cái'
        ..purchasePrice = 48750
        ..retailPrice = 65000
        ..wholesalePrice = 65000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006388389'
        ..barcode = '0006388389'
        ..productName = 'sinicol apolo'
        ..unit = 'chai'
        ..purchasePrice = 30000
        ..retailPrice = 40000
        ..wholesalePrice = 40000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006388457'
        ..barcode = '0006388457'
        ..productName = 'sinicol '
        ..unit = 'chai'
        ..purchasePrice = 22500
        ..retailPrice = 30000
        ..wholesalePrice = 30000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006388487'
        ..barcode = '0006388487'
        ..productName = 'van nhựa 27'
        ..unit = 'cái'
        ..purchasePrice = 18750
        ..retailPrice = 25000
        ..wholesalePrice = 25000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006388883'
        ..barcode = '0006388883'
        ..productName = 'cán chổi'
        ..unit = 'cây'
        ..purchasePrice = 3000
        ..retailPrice = 4000
        ..wholesalePrice = 4000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006389830'
        ..barcode = '0006389830'
        ..productName = 'vít tôn 5\' sắt'
        ..unit = 'bịt'
        ..purchasePrice = 63750
        ..retailPrice = 85000
        ..wholesalePrice = 85000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006390491'
        ..barcode = '0006390491'
        ..productName = 'viít laphong 5\' đầu dù'
        ..unit = 'bịt'
        ..purchasePrice = 131250
        ..retailPrice = 175000
        ..wholesalePrice = 175000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006390607'
        ..barcode = '0006390607'
        ..productName = 'đá mài dao'
        ..unit = 'cái'
        ..purchasePrice = 11250
        ..retailPrice = 15000
        ..wholesalePrice = 15000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006390628'
        ..barcode = '0006390628'
        ..productName = 'keo con chó'
        ..unit = 'huủ'
        ..purchasePrice = 11250
        ..retailPrice = 15000
        ..wholesalePrice = 15000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006390831'
        ..barcode = '0006390831'
        ..productName = 'thước kéo 3m'
        ..unit = 'cái'
        ..purchasePrice = 11250
        ..retailPrice = 15000
        ..wholesalePrice = 15000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006390993'
        ..barcode = '0006390993'
        ..productName = 'thước kéo 5m'
        ..unit = 'cái'
        ..purchasePrice = 15000
        ..retailPrice = 20000
        ..wholesalePrice = 20000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006392029'
        ..barcode = '0006392029'
        ..productName = 'thước keéo 7.5m'
        ..unit = 'cái'
        ..purchasePrice = 18750
        ..retailPrice = 25000
        ..wholesalePrice = 25000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006392174'
        ..barcode = '0006392174'
        ..productName = 'thước bảng'
        ..unit = 'cây'
        ..purchasePrice = 41250
        ..retailPrice = 55000
        ..wholesalePrice = 55000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006392705'
        ..barcode = '0006392705'
        ..productName = 'kéo số 2 usa'
        ..unit = 'cái'
        ..purchasePrice = 285000
        ..retailPrice = 380000
        ..wholesalePrice = 380000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006393450'
        ..barcode = '0006393450'
        ..productName = 'keo số 3 usa'
        ..unit = 'cái'
        ..purchasePrice = 210000
        ..retailPrice = 280000
        ..wholesalePrice = 280000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006393664'
        ..barcode = '0006393664'
        ..productName = 'vòi heo 21'
        ..unit = 'cái'
        ..purchasePrice = 18750
        ..retailPrice = 25000
        ..wholesalePrice = 25000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006394425'
        ..barcode = '0006394425'
        ..productName = 'vòi heo 27'
        ..unit = 'cái'
        ..purchasePrice = 18750
        ..retailPrice = 25000
        ..wholesalePrice = 25000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006394720'
        ..barcode = '0006394720'
        ..productName = 'cọ lăn vm'
        ..unit = 'cây'
        ..purchasePrice = 15000
        ..retailPrice = 20000
        ..wholesalePrice = 20000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006394787'
        ..barcode = '0006394787'
        ..productName = 'cọ 5 thanh bình'
        ..unit = 'cây'
        ..purchasePrice = 10500
        ..retailPrice = 14000
        ..wholesalePrice = 14000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006395149'
        ..barcode = '0006395149'
        ..productName = 'giấy nhám '
        ..unit = 'tờ'
        ..purchasePrice = 450
        ..retailPrice = 600
        ..wholesalePrice = 600
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006395641'
        ..barcode = '0006395641'
        ..productName = 'giấy nhám vải'
        ..unit = 'tờ'
        ..purchasePrice = 3750
        ..retailPrice = 5000
        ..wholesalePrice = 5000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006395921'
        ..barcode = '0006395921'
        ..productName = 'chống thấm ck'
        ..unit = 'bình'
        ..purchasePrice = 187500
        ..retailPrice = 250000
        ..wholesalePrice = 250000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006396413'
        ..barcode = '0006396413'
        ..productName = 'ti lôp ngói'
        ..unit = 'cây'
        ..purchasePrice = 562
        ..retailPrice = 750
        ..wholesalePrice = 750
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006396766'
        ..barcode = '0006396766'
        ..productName = 'đầu bắn tôn'
        ..unit = 'cái'
        ..purchasePrice = 11250
        ..retailPrice = 15000
        ..wholesalePrice = 15000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006398600'
        ..barcode = '0006398600'
        ..productName = 'đầu 3 kê'
        ..unit = 'cái'
        ..purchasePrice = 9000
        ..retailPrice = 12000
        ..wholesalePrice = 12000
        ..vatRate = 10
        ..category.value = cat6,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006398773'
        ..barcode = '0006398773'
        ..productName = '3x5'
        ..unit = 'cái'
        ..purchasePrice = 48750
        ..retailPrice = 65000
        ..wholesalePrice = 65000
        ..vatRate = 10
        ..category.value = cat7,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006399372'
        ..barcode = '0006399372'
        ..productName = '4x6'
        ..unit = 'cái'
        ..purchasePrice = 63750
        ..retailPrice = 85000
        ..wholesalePrice = 85000
        ..vatRate = 10
        ..category.value = cat7,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006400062'
        ..barcode = '0006400062'
        ..productName = '6x8'
        ..unit = 'cái'
        ..purchasePrice = 138750
        ..retailPrice = 185000
        ..wholesalePrice = 185000
        ..vatRate = 10
        ..category.value = cat7,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006400420'
        ..barcode = '0006400420'
        ..productName = '8x1m'
        ..unit = 'cái'
        ..purchasePrice = 165000
        ..retailPrice = 220000
        ..wholesalePrice = 220000
        ..vatRate = 10
        ..category.value = cat7,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006400751'
        ..barcode = '0006400751'
        ..productName = 'gaạch ống '
        ..unit = 'viên'
        ..purchasePrice = 390
        ..retailPrice = 520
        ..wholesalePrice = 520
        ..vatRate = 10
        ..category.value = cat8,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006439687'
        ..barcode = '0006439687'
        ..productName = 'gạch cháy'
        ..unit = 'viên'
        ..purchasePrice = 382
        ..retailPrice = 510
        ..wholesalePrice = 510
        ..vatRate = 10
        ..category.value = cat8,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006439889'
        ..barcode = '0006439889'
        ..productName = 'gạch ống'
        ..unit = 'viên'
        ..purchasePrice = 390
        ..retailPrice = 520
        ..wholesalePrice = 520
        ..vatRate = 10
        ..category.value = cat8,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006441575'
        ..barcode = '0006441575'
        ..productName = 'gạch cháy'
        ..unit = 'viên'
        ..purchasePrice = 390
        ..retailPrice = 520
        ..wholesalePrice = 520
        ..vatRate = 10
        ..category.value = cat8,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006442060'
        ..barcode = '0006442060'
        ..productName = 'gạch đinh'
        ..unit = 'viên'
        ..purchasePrice = 278
        ..retailPrice = 370
        ..wholesalePrice = 370
        ..vatRate = 10
        ..category.value = cat8,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006444007'
        ..barcode = '0006444007'
        ..productName = 'gạch ống'
        ..unit = 'viên'
        ..purchasePrice = 390
        ..retailPrice = 520
        ..wholesalePrice = 520
        ..vatRate = 10
        ..category.value = cat8,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006444124'
        ..barcode = '0006444124'
        ..productName = 'gạch ống'
        ..unit = 'viên'
        ..purchasePrice = 390
        ..retailPrice = 520
        ..wholesalePrice = 520
        ..vatRate = 10
        ..category.value = cat8,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006450604'
        ..barcode = '0006450604'
        ..productName = 'gạch ống'
        ..unit = 'viên'
        ..purchasePrice = 390
        ..retailPrice = 520
        ..wholesalePrice = 520
        ..vatRate = 10
        ..category.value = cat8,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006451498'
        ..barcode = '0006451498'
        ..productName = 'gạch ống đỏ'
        ..unit = 'viên'
        ..purchasePrice = 480
        ..retailPrice = 640
        ..wholesalePrice = 640
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0006456811'
        ..barcode = '0006456811'
        ..productName = 'gạch ống đỏ'
        ..unit = 'viên'
        ..purchasePrice = 480
        ..retailPrice = 640
        ..wholesalePrice = 640
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008122977'
        ..barcode = '0008122977'
        ..productName = 'gạch ống đỏ'
        ..unit = 'viên'
        ..purchasePrice = 480
        ..retailPrice = 640
        ..wholesalePrice = 640
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008123562'
        ..barcode = '0008123562'
        ..productName = 'gạch ống đỏ'
        ..unit = 'viên'
        ..purchasePrice = 480
        ..retailPrice = 640
        ..wholesalePrice = 640
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008124528'
        ..barcode = '0008124528'
        ..productName = 'gạch chaáy'
        ..unit = 'viên'
        ..purchasePrice = 480
        ..retailPrice = 640
        ..wholesalePrice = 640
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008129756'
        ..barcode = '0008129756'
        ..productName = 'gạch đinh'
        ..unit = 'viên'
        ..purchasePrice = 352
        ..retailPrice = 470
        ..wholesalePrice = 470
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008131024'
        ..barcode = '0008131024'
        ..productName = 'gạch ống đỏ'
        ..unit = 'viên'
        ..purchasePrice = 480
        ..retailPrice = 640
        ..wholesalePrice = 640
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008133009'
        ..barcode = '0008133009'
        ..productName = 'gạch cháy'
        ..unit = 'viên'
        ..purchasePrice = 472
        ..retailPrice = 630
        ..wholesalePrice = 630
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008194451'
        ..barcode = '0008194451'
        ..productName = 'gạch đinh'
        ..unit = 'viên'
        ..purchasePrice = 352
        ..retailPrice = 470
        ..wholesalePrice = 470
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008195382'
        ..barcode = '0008195382'
        ..productName = 'gạch đờ mi'
        ..unit = 'viên'
        ..purchasePrice = 352
        ..retailPrice = 470
        ..wholesalePrice = 470
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008195865'
        ..barcode = '0008195865'
        ..productName = 'gạch ống đỏ'
        ..unit = 'viên'
        ..purchasePrice = 480
        ..retailPrice = 640
        ..wholesalePrice = 640
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008196211'
        ..barcode = '0008196211'
        ..productName = 'gạch đinh'
        ..unit = 'viên'
        ..purchasePrice = 352
        ..retailPrice = 470
        ..wholesalePrice = 470
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008196348'
        ..barcode = '0008196348'
        ..productName = 'gạch ống đỏ'
        ..unit = 'viên'
        ..purchasePrice = 480
        ..retailPrice = 640
        ..wholesalePrice = 640
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008197636'
        ..barcode = '0008197636'
        ..productName = 'gạch ống đỏ'
        ..unit = 'viên'
        ..purchasePrice = 480
        ..retailPrice = 640
        ..wholesalePrice = 640
        ..vatRate = 10
        ..category.value = cat9,
      VlxdProduct()
        ..productId = uuid.v4()
        ..productCode = '0008198602'
        ..barcode = '0008198602'
        ..productName = 'gạch đinh'
        ..unit = 'viên'
        ..purchasePrice = 352
        ..retailPrice = 470
        ..wholesalePrice = 470
        ..vatRate = 10
        ..category.value = cat9,
    ];
    await db.writeTxn(() async {
      await db.vlxdProducts.putAll(products);
    });

    // ----------------------------------------------------------------
    // 3. Khách hàng, nhà cung cấp, kho
    // ----------------------------------------------------------------
    final customers = [
      VlxdCustomer()..customerId = uuid.v4()..name = 'Khách lẻ'..phone = '0901234001'..email = 'kle@kanposvn.vn'..taxCode = ''..type = CustomerType.RETAIL..debtLimit = 0,
      VlxdCustomer()..customerId = uuid.v4()..name = 'Đại lý Hoàng Anh'..phone = '0901234002'..email = 'hoanganh@gmail.com'..taxCode = '0123456789'..type = CustomerType.AGENCY..currentDebt = 15000000..discountRate = 5..debtLimit = 50000000..deliveryAddress = '123 Nguyễn Văn Linh, Q.7, TP.HCM',
      VlxdCustomer()..customerId = uuid.v4()..name = 'Công trình Minh Phát'..phone = '0901234003'..email = 'minhphat@congtrinh.vn'..taxCode = '0987654321'..type = CustomerType.PROJECT..currentDebt = 85000000..debtLimit = 200000000..deliveryAddress = 'Khu đô thị mới, Long An',
      VlxdCustomer()..customerId = uuid.v4()..name = 'Nhà thầu Xây dựng Sông Đà'..phone = '0901234004'..email = 'songda@nhathau.vn'..taxCode = '0567891234'..type = CustomerType.CONTRACTOR..currentDebt = 120000000..discountRate = 8..debtLimit = 300000000..deliveryAddress = 'P.501, Tòa nhà ABC, Q.3, TP.HCM',
      VlxdCustomer()..customerId = uuid.v4()..name = 'Doanh nghiệp ABC'..phone = '0901234005'..email = 'abc@dnhn.vn'..taxCode = '0345678901'..type = CustomerType.ENTERPRISE..currentDebt = 35000000..debtLimit = 100000000..deliveryAddress = 'KCN Bình Dương',
      VlxdCustomer()..customerId = uuid.v4()..name = 'Đại lý Vật tư Sài Gòn'..phone = '0901234006'..email = 'dailysg@gmail.com'..taxCode = '0678901234'..type = CustomerType.AGENCY..currentDebt = 28000000..discountRate = 6..debtLimit = 80000000..deliveryAddress = '456 Lê Văn Sỹ, Q. Tân Bình',
      VlxdCustomer()..customerId = uuid.v4()..name = 'Nhà thầu Delta'..phone = '0901234007'..email = 'delta@nhathau.vn'..taxCode = '0456789012'..type = CustomerType.CONTRACTOR..currentDebt = 67000000..discountRate = 7..debtLimit = 150000000..deliveryAddress = '789 Cách Mạng Tháng 8, Q.10',
      VlxdCustomer()..customerId = uuid.v4()..name = 'Công trình Trường học XYZ'..phone = '0901234008'..email = 'truonghoc@congtrinh.vn'..taxCode = '0789012345'..type = CustomerType.PROJECT..currentDebt = 0..debtLimit = 250000000..deliveryAddress = 'Ấp 5, H. Bình Chánh',
    ];
    await db.writeTxn(() async {
      await db.vlxdCustomers.putAll(customers);
    });

    final suppliers = [
      VlxdSupplier()..supplierId = uuid.v4()..name = 'Công ty Thép Việt'..phone = '0281234001'..email = 'info@thepviet.vn'..taxCode = '1000000001'..address = 'Bình Dương'..contactPerson = 'Mr. Lực'..currentDebt = 55000000,
      VlxdSupplier()..supplierId = uuid.v4()..name = 'Xi măng Hoàng Thạch'..phone = '0281234002'..email = 'sales@hoangthach.vn'..taxCode = '1000000002'..address = 'Hải Phòng'..contactPerson = 'Mr. Thạch'..currentDebt = 0,
      VlxdSupplier()..supplierId = uuid.v4()..name = 'Gạch men Tân Thanh'..phone = '0281234003'..email = 'tanthanh@gach.vn'..taxCode = '1000000003'..address = 'Đồng Nai'..contactPerson = 'Mr. Thanh'..currentDebt = 25000000,
      VlxdSupplier()..supplierId = uuid.v4()..name = 'Tôn Hoa Sen'..phone = '0281234004'..email = 'contact@hoasen.vn'..taxCode = '1000000004'..address = 'Bình Định'..contactPerson = 'Ms. Lan'..currentDebt = 0,
      VlxdSupplier()..supplierId = uuid.v4()..name = 'Ống nhựa Hoa Việt'..phone = '0281234005'..email = 'hoaviet@ongnhua.vn'..taxCode = '1000000005'..address = 'Bắc Ninh'..contactPerson = 'Mr. Dũng'..currentDebt = 12000000,
      VlxdSupplier()..supplierId = uuid.v4()..name = 'Sơn Nippon'..phone = '0281234006'..email = 'info@nippon.vn'..taxCode = '1000000006'..address = 'TP.HCM'..contactPerson = 'Mr. Tuấn'..currentDebt = 0,
    ];
    await db.writeTxn(() async {
      await db.vlxdSuppliers.putAll(suppliers);
    });

    final warehouses = [
      VlxdWarehouse()..warehouseId = uuid.v4()..name = 'Kho Trung Tâm'..address = 'Số 1, đường số 2, Q. Bình Tân',
      VlxdWarehouse()..warehouseId = uuid.v4()..name = 'Kho Sắt Thép'..address = 'Bình Dương',
      VlxdWarehouse()..warehouseId = uuid.v4()..name = 'Kho Vật Tư'..address = 'Đồng Nai',
      VlxdWarehouse()..warehouseId = uuid.v4()..name = 'Kho Gạch Men'..address = 'KCN Long Hậu, Long An',
    ];
    await db.writeTxn(() async {
      await db.vlxdWarehouses.putAll(warehouses);
    });

    final savedCustomers = await db.vlxdCustomers.where().findAll();
    final savedSuppliers = await db.vlxdSuppliers.where().findAll();
    final savedWarehouses = await db.vlxdWarehouses.where().findAll();
    final cusLe = savedCustomers[0];
    final cusDaiLy = savedCustomers[1];
    final cusCongTrinh = savedCustomers[2];
    final cusNhaThau = savedCustomers[3];
    final cusDN = savedCustomers[4];
    final cusDaiLySG = savedCustomers[5];
    final supThep = savedSuppliers[0];
    final supXiMang = savedSuppliers[1];
    final supGach = savedSuppliers[2];
    final khoTT = savedWarehouses[0];
    final khoSat = savedWarehouses[1];
    final khoVatTu = savedWarehouses[2];
    final khoGach = savedWarehouses[3];

    // ----------------------------------------------------------------
    // 4. Đơn hàng mẫu (bán lẻ + hợp đồng sỉ)
    // ----------------------------------------------------------------
    final orders = <VlxdOrder>[
      VlxdOrder()..orderId = uuid.v4()..orderCode = 'HD000001'..customer.value = cusLe..isWholesaleContract = false..subTotal = 2560000..discount = 0..vatAmount = 256000..shippingFee = 50000..totalAmount = 2866000..paidAmount = 2866000..paymentMethod = PaymentMethod.CASH..status = OrderStatus.COMPLETED..orderDate = DateTime.now().subtract(const Duration(days: 2))..notes = 'Bán lẻ tại quầy',
      VlxdOrder()..orderId = uuid.v4()..orderCode = 'HD000002'..customer.value = cusDaiLy..isWholesaleContract = true..subTotal = 42000000..discount = 2100000..vatAmount = 3990000..shippingFee = 0..totalAmount = 43890000..paidAmount = 20000000..paymentMethod = PaymentMethod.DEBT..status = OrderStatus.DELIVERING..orderDate = DateTime.now().subtract(const Duration(days: 6))..notes = 'Giao bán sỉ cho đại lý',
      VlxdOrder()..orderId = uuid.v4()..orderCode = 'HD000003'..customer.value = cusCongTrinh..isWholesaleContract = true..subTotal = 96000000..discount = 4800000..vatAmount = 9120000..shippingFee = 0..totalAmount = 100320000..paidAmount = 40000000..paymentMethod = PaymentMethod.DEBT..status = OrderStatus.COMPLETED..orderDate = DateTime.now().subtract(const Duration(days: 20))..notes = 'Hợp đồng công trình',
      VlxdOrder()..orderId = uuid.v4()..orderCode = 'HD000004'..customer.value = cusNhaThau..isWholesaleContract = true..subTotal = 150000000..discount = 7500000..vatAmount = 14250000..shippingFee = 0..totalAmount = 157500000..paidAmount = 50000000..paymentMethod = PaymentMethod.DEBT..status = OrderStatus.PENDING..orderDate = DateTime.now().subtract(const Duration(days: 35))..notes = 'Chờ giao cho nhà thầu',
      VlxdOrder()..orderId = uuid.v4()..orderCode = 'HD000005'..customer.value = cusLe..isWholesaleContract = false..subTotal = 3800000..discount = 0..vatAmount = 380000..shippingFee = 0..totalAmount = 4180000..paidAmount = 4180000..paymentMethod = PaymentMethod.CASH..status = OrderStatus.COMPLETED..orderDate = DateTime.now()..notes = 'POS bán lẻ hôm nay',
      VlxdOrder()..orderId = uuid.v4()..orderCode = 'HD000006'..customer.value = cusDaiLySG..isWholesaleContract = false..subTotal = 12500000..discount = 625000..vatAmount = 1187500..shippingFee = 200000..totalAmount = 13262500..paidAmount = 13262500..paymentMethod = PaymentMethod.TRANSFER..status = OrderStatus.COMPLETED..orderDate = DateTime.now().subtract(const Duration(days: 1))..notes = 'Chuyển khoản hôm qua',
      VlxdOrder()..orderId = uuid.v4()..orderCode = 'HD000007'..customer.value = cusDN..isWholesaleContract = true..subTotal = 78000000..discount = 3900000..vatAmount = 7410000..shippingFee = 0..totalAmount = 81510000..paidAmount = 0..paymentMethod = PaymentMethod.DEBT..status = OrderStatus.PENDING..orderDate = DateTime.now().subtract(const Duration(days: 3))..notes = 'Hợp đồng DN ABC',
      VlxdOrder()..orderId = uuid.v4()..orderCode = 'HD000008'..customer.value = cusLe..isWholesaleContract = false..subTotal = 1950000..discount = 0..vatAmount = 195000..shippingFee = 0..totalAmount = 2145000..paidAmount = 2145000..paymentMethod = PaymentMethod.QR..status = OrderStatus.COMPLETED..orderDate = DateTime.now().subtract(const Duration(days: 2))..notes = 'QR thanh toán',
    ];
    await db.writeTxn(() async {
      await db.vlxdOrders.putAll(orders);
    });

    final savedOrders = await db.vlxdOrders.where().findAll();
    final savedProducts = await db.vlxdProducts.where().findAll();
    final p1 = savedProducts[0];
    final p2 = savedProducts[1];
    final p3 = savedProducts[2];
    final p4 = savedProducts[3];
    final p5 = savedProducts[4];
    final p6 = savedProducts[5];

    final orderDetails = <VlxdOrderDetail>[
      VlxdOrderDetail()..order.value = savedOrders[0]..product.value = p1..quantity = 20..unitPrice = p1.retailPrice..total = p1.retailPrice * 20,
      VlxdOrderDetail()..order.value = savedOrders[0]..product.value = p2..quantity = 8..unitPrice = p2.retailPrice..total = p2.retailPrice * 8,
      VlxdOrderDetail()..order.value = savedOrders[1]..product.value = p3..quantity = 150..unitPrice = p3.wholesalePrice..total = p3.wholesalePrice * 150,
      VlxdOrderDetail()..order.value = savedOrders[2]..product.value = p4..quantity = 200..unitPrice = p4.wholesalePrice..total = p4.wholesalePrice * 200,
      VlxdOrderDetail()..order.value = savedOrders[3]..product.value = p1..quantity = 500..unitPrice = p1.wholesalePrice..total = p1.wholesalePrice * 500,
      VlxdOrderDetail()..order.value = savedOrders[3]..product.value = p3..quantity = 80..unitPrice = p3.wholesalePrice..total = p3.wholesalePrice * 80,
      VlxdOrderDetail()..order.value = savedOrders[4]..product.value = p1..quantity = 10..unitPrice = p1.retailPrice..total = p1.retailPrice * 10,
      VlxdOrderDetail()..order.value = savedOrders[4]..product.value = p5..quantity = 5..unitPrice = p5.retailPrice..total = p5.retailPrice * 5,
      VlxdOrderDetail()..order.value = savedOrders[5]..product.value = p2..quantity = 30..unitPrice = p2.retailPrice..total = p2.retailPrice * 30,
      VlxdOrderDetail()..order.value = savedOrders[5]..product.value = p6..quantity = 20..unitPrice = p6.retailPrice..total = p6.retailPrice * 20,
      VlxdOrderDetail()..order.value = savedOrders[6]..product.value = p3..quantity = 100..unitPrice = p3.wholesalePrice..total = p3.wholesalePrice * 100,
      VlxdOrderDetail()..order.value = savedOrders[7]..product.value = p1..quantity = 8..unitPrice = p1.retailPrice..total = p1.retailPrice * 8,
    ];
    await db.writeTxn(() async {
      await db.vlxdOrderDetails.putAll(orderDetails);
    });

    // ----------------------------------------------------------------
    // 4b. Phiếu giao hàng mẫu
    // ----------------------------------------------------------------
    final deliveryTickets = <VlxdDeliveryTicket>[
      VlxdDeliveryTicket()..ticketId = uuid.v4()..order.value = savedOrders[1]..vehicleInfo = '51C-12345'..driverName = 'Nguyễn Văn A'..deliveryDate = DateTime.now().subtract(const Duration(days: 5))..status = OrderStatus.COMPLETED,
      VlxdDeliveryTicket()..ticketId = uuid.v4()..order.value = savedOrders[2]..vehicleInfo = '51C-67890'..driverName = 'Trần Văn B'..deliveryDate = DateTime.now().subtract(const Duration(days: 18))..status = OrderStatus.PENDING,
      VlxdDeliveryTicket()..ticketId = uuid.v4()..order.value = savedOrders[0]..vehicleInfo = '29C-11111'..driverName = 'Lê Văn C'..deliveryDate = DateTime.now().subtract(const Duration(days: 1))..status = OrderStatus.COMPLETED,
    ];
    await db.writeTxn(() async {
      await db.vlxdDeliveryTickets.putAll(deliveryTickets);
    });

    // ----------------------------------------------------------------
    // 5. Nhập / xuất kho mẫu (để báo cáo tồn kho có số liệu)
    // ----------------------------------------------------------------
    final invTx = <VlxdInventoryTransaction>[
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'PN000001'..type = VlxdInventoryTransactionType.IMPORT..supplier.value = supThep..warehouse.value = khoTT..transactionDate = DateTime.now().subtract(const Duration(days: 10))..note = 'Nhập thép',
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'PN000002'..type = VlxdInventoryTransactionType.IMPORT..supplier.value = supXiMang..warehouse.value = khoTT..transactionDate = DateTime.now().subtract(const Duration(days: 8))..note = 'Nhập xi măng',
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'PN000003'..type = VlxdInventoryTransactionType.IMPORT..supplier.value = supGach..warehouse.value = khoVatTu..transactionDate = DateTime.now().subtract(const Duration(days: 5))..note = 'Nhập gạch men',
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'PX000001'..type = VlxdInventoryTransactionType.EXPORT..warehouse.value = khoTT..transactionDate = DateTime.now().subtract(const Duration(days: 3))..note = 'Xuất bán lẻ',
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'PN000004'..type = VlxdInventoryTransactionType.IMPORT..supplier.value = supThep..warehouse.value = khoSat..transactionDate = DateTime.now().subtract(const Duration(days: 2))..note = 'Nhập thép',
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'PX000002'..type = VlxdInventoryTransactionType.EXPORT..warehouse.value = khoTT..transactionDate = DateTime.now().subtract(const Duration(days: 1))..note = 'Xuất bán sỉ',
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'PD000001'..type = VlxdInventoryTransactionType.ADJUSTMENT..warehouse.value = khoTT..transactionDate = DateTime.now().subtract(const Duration(days: 4))..note = 'Kiểm kê điều chỉnh +50',
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'CK000001'..type = VlxdInventoryTransactionType.TRANSFER..warehouse.value = khoTT..transactionDate = DateTime.now().subtract(const Duration(days: 1))..note = 'Chuyển từ Trung Tâm sang Kho Sắt Thép',
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'PH000001'..type = VlxdInventoryTransactionType.DESTROY..warehouse.value = khoVatTu..transactionDate = DateTime.now()..note = 'Phá hủy gạch hư hỏng 20 viên',
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'PN000005'..type = VlxdInventoryTransactionType.IMPORT..supplier.value = supXiMang..warehouse.value = khoTT..transactionDate = DateTime.now()..note = 'Nhập xi măng bổ sung',
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'PX000003'..type = VlxdInventoryTransactionType.EXPORT..warehouse.value = khoSat..transactionDate = DateTime.now()..note = 'Xuất thép công trình',
      VlxdInventoryTransaction()..transactionId = uuid.v4()..documentCode = 'PN000006'..type = VlxdInventoryTransactionType.IMPORT..supplier.value = supGach..warehouse.value = khoGach..transactionDate = DateTime.now().subtract(const Duration(days: 6))..note = 'Nhập gạch men kho mới',
    ];
    await db.writeTxn(() async {
      await db.vlxdInventoryTransactions.putAll(invTx);
    });

    final savedInvTx = await db.vlxdInventoryTransactions.where().findAll();
    final invDetails = <VlxdInventoryTransactionDetail>[
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[0]..product.value = p1..quantity = 600..unitPrice = p1.purchasePrice..totalAmount = p1.purchasePrice * 600,
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[1]..product.value = p3..quantity = 500..unitPrice = p3.purchasePrice..totalAmount = p3.purchasePrice * 500,
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[2]..product.value = p2..quantity = 300..unitPrice = p2.purchasePrice..totalAmount = p2.purchasePrice * 300,
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[3]..product.value = p1..quantity = 20..unitPrice = p1.purchasePrice..totalAmount = p1.purchasePrice * 20,
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[4]..product.value = p1..quantity = 500..unitPrice = p1.purchasePrice..totalAmount = p1.purchasePrice * 500,
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[5]..product.value = p2..quantity = 10..unitPrice = p2.retailPrice..totalAmount = p2.retailPrice * 10,
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[6]..product.value = p3..quantity = 50..unitPrice = p3.purchasePrice..totalAmount = p3.purchasePrice * 50,
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[7]..product.value = p1..quantity = 20..unitPrice = p1.purchasePrice..totalAmount = p1.purchasePrice * 20,
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[8]..product.value = p2..quantity = 20..unitPrice = p2.purchasePrice..totalAmount = p2.purchasePrice * 20,
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[9]..product.value = p3..quantity = 200..unitPrice = p3.purchasePrice..totalAmount = p3.purchasePrice * 200,
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[10]..product.value = p1..quantity = 100..unitPrice = p1.purchasePrice..totalAmount = p1.purchasePrice * 100,
      VlxdInventoryTransactionDetail()..transaction.value = savedInvTx[11]..product.value = p2..quantity = 50..unitPrice = p2.purchasePrice..totalAmount = p2.purchasePrice * 50,
    ];
    await db.writeTxn(() async {
      await db.vlxdInventoryTransactionDetails.putAll(invDetails);
    });

    // ----------------------------------------------------------------
    // 5b. Tồn kho kho (để dashboard lowStock / inventoryValue hoạt động)
    // ----------------------------------------------------------------
    final stocks = <VlxdInventoryStock>[
      VlxdInventoryStock()..stockId = uuid.v4()..product.value = p1..warehouse.value = khoTT..currentQuantity = 80..minQuantity = 50..maxQuantity = 500,
      VlxdInventoryStock()..stockId = uuid.v4()..product.value = p2..warehouse.value = khoTT..currentQuantity = 20..minQuantity = 30..maxQuantity = 200,
      VlxdInventoryStock()..stockId = uuid.v4()..product.value = p3..warehouse.value = khoSat..currentQuantity = 150..minQuantity = 100..maxQuantity = 1000,
      VlxdInventoryStock()..stockId = uuid.v4()..product.value = p4..warehouse.value = khoTT..currentQuantity = 40..minQuantity = 20..maxQuantity = 300,
      VlxdInventoryStock()..stockId = uuid.v4()..product.value = p5..warehouse.value = khoVatTu..currentQuantity = 5..minQuantity = 10..maxQuantity = 100,
      VlxdInventoryStock()..stockId = uuid.v4()..product.value = p6..warehouse.value = khoTT..currentQuantity = 100..minQuantity = 50..maxQuantity = 500,
    ];
    await db.writeTxn(() async {
      await db.vlxdInventoryStocks.putAll(stocks);
    });

    // ----------------------------------------------------------------
    // 6. Thu chi mẫu (để báo cáo quỹ tiền mặt / phiếu thu chi có số liệu)
    // ----------------------------------------------------------------
    final finance = <VlxdFinanceTransaction>[
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PT000001'..type = FinanceTransactionType.RECEIPT..amount = 2866000..category = 'Thu tiền hàng'..customer.value = cusLe..paymentMethod = 'Tiền mặt'..description = 'Thu tiền HĐ000001'..transactionDate = DateTime.now().subtract(const Duration(days: 2)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PT000002'..type = FinanceTransactionType.RECEIPT..amount = 20000000..category = 'Thu tiền hàng'..customer.value = cusDaiLy..paymentMethod = 'Chuyển khoản'..description = 'Thu tiền HĐ000002'..transactionDate = DateTime.now().subtract(const Duration(days: 5)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PT000003'..type = FinanceTransactionType.RECEIPT..amount = 40000000..category = 'Thu tiền hàng'..customer.value = cusCongTrinh..paymentMethod = 'Chuyển khoản'..description = 'Thu tiền HĐ000003'..transactionDate = DateTime.now().subtract(const Duration(days: 18)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PC000001'..type = FinanceTransactionType.PAYMENT..amount = 55000000..category = 'Thanh toán NCC'..supplier.value = supThep..paymentMethod = 'Chuyển khoản'..description = 'Trả tiền mua thép'..transactionDate = DateTime.now().subtract(const Duration(days: 9)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PC000002'..type = FinanceTransactionType.PAYMENT..amount = 25000000..category = 'Thanh toán NCC'..supplier.value = supGach..paymentMethod = 'Tiền mặt'..description = 'Trả tiền mua gạch'..transactionDate = DateTime.now().subtract(const Duration(days: 4)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PT000004'..type = FinanceTransactionType.RECEIPT..amount = 4180000..category = 'Thu tiền hàng'..customer.value = cusLe..paymentMethod = 'Tiền mặt'..description = 'Thu tiền HĐ000005'..transactionDate = DateTime.now(),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PT000005'..type = FinanceTransactionType.RECEIPT..amount = 13262500..category = 'Thu tiền hàng'..customer.value = cusDaiLySG..paymentMethod = 'Chuyển khoản'..description = 'Thu tiền HĐ000006'..transactionDate = DateTime.now().subtract(const Duration(days: 1)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PT000006'..type = FinanceTransactionType.RECEIPT..amount = 35000000..category = 'Thu tiền hàng'..customer.value = cusDN..paymentMethod = 'Chuyển khoản'..description = 'Thu tiền HĐ000007 (đợt 1)'..transactionDate = DateTime.now().subtract(const Duration(days: 2)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PC000003'..type = FinanceTransactionType.PAYMENT..amount = 15000000..category = 'Lương nhân viên'..paymentMethod = 'Tiền mặt'..description = 'Lương tháng này'..transactionDate = DateTime.now().subtract(const Duration(days: 1)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PC000004'..type = FinanceTransactionType.PAYMENT..amount = 2500000..category = 'Tiền điện kho'..paymentMethod = 'Chuyển khoản'..description = 'Tiền điện kho tháng trước'..transactionDate = DateTime.now().subtract(const Duration(days: 7)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PC000005'..type = FinanceTransactionType.PAYMENT..amount = 3500000..category = 'Vận chuyển hàng'..paymentMethod = 'Tiền mặt'..description = 'Phí vận chuyển đơn HD000002'..transactionDate = DateTime.now().subtract(const Duration(days: 6)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PC000006'..type = FinanceTransactionType.PAYMENT..amount = 20000000..category = 'Thuê mặt bằng'..paymentMethod = 'Chuyển khoản'..description = 'Thuê mặt bằng tháng này'..transactionDate = DateTime.now().subtract(const Duration(days: 10)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PC000007'..type = FinanceTransactionType.PAYMENT..amount = 5000000..category = 'Marketing online'..paymentMethod = 'Chuyển khoản'..description = 'Quảng cáo Google Ads'..transactionDate = DateTime.now().subtract(const Duration(days: 3)),
      VlxdFinanceTransaction()..transactionId = uuid.v4()..documentCode = 'PC000008'..type = FinanceTransactionType.PAYMENT..amount = 1200000..category = 'Chi phí khác'..paymentMethod = 'Tiền mặt'..description = 'Văn phòng phẩm'..transactionDate = DateTime.now().subtract(const Duration(days: 8)),
    ];
    await db.writeTxn(() async {
      await db.vlxdFinanceTransactions.putAll(finance);
    });
  }
}
