import 'package:uuid/uuid.dart';
import '../services/pawn_isar_service.dart';
import '../models/customer.dart';
import '../models/product.dart';

class PawnSeedData {
  static Future<void> seedIfEmpty(PawnIsarService isarService) async {
    final isar = await isarService.db;
    final customerCount = await isar.customers.count();

    if (customerCount == 0) {
      await isar.writeTxn(() async {
        final khachA = Customer()
          ..customerCode = 'KH${const Uuid().v4().substring(0, 8).toUpperCase()}'
          ..fullName = 'Nguyễn Văn An'
          ..phone = '0901234567'
          ..cccd = '079200012345'
          ..address = '123 Nguyễn Trãi, Q.1, TP.HCM'
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now();

        final khachB = Customer()
          ..customerCode = 'KH${const Uuid().v4().substring(0, 8).toUpperCase()}'
          ..fullName = 'Trần Thị Bích'
          ..phone = '0908765432'
          ..cccd = '079200098765'
          ..address = '456 Lê Lợi, Q.1, TP.HCM'
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now();

        await isar.customers.putAll([khachA, khachB]);
      });
    }

    final productCount = await isar.products.count();

    if (productCount == 0) {
      await isar.writeTxn(() async {
        final iphone = Product()
          ..name = 'iPhone 14 Pro Max'
          ..brand = 'Apple'
          ..category = 'Điện thoại'
          ..capacity = '256GB'
          ..color = 'Tím'
          ..condition = 'Mới 99%'
          ..costPrice = 22000000
          ..sellingPrice = 26000000
          ..importPrice = 21000000
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now();

        final laptop = Product()
          ..name = 'MacBook Pro 14'
          ..brand = 'Apple'
          ..category = 'Laptop'
          ..capacity = '1TB'
          ..color = 'Bạc'
          ..condition = 'Mới 95%'
          ..costPrice = 38000000
          ..sellingPrice = 42000000
          ..importPrice = 37000000
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now();

        final motorbike = Product()
          ..name = 'Honda SH 150i'
          ..brand = 'Honda'
          ..category = 'Xe máy'
          ..condition = 'Đã qua sử dụng'
          ..costPrice = 45000000
          ..sellingPrice = 52000000
          ..importPrice = 44000000
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now();

        await isar.products.putAll([iphone, laptop, motorbike]);
      });
    }
  }
}
