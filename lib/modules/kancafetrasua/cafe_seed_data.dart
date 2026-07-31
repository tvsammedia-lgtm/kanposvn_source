import '../../core/db/database_service.dart';
import 'src/services/database_service.dart' as cafe_db;

class CafeSeedData {
  static Future<void> seedIfEmpty(DatabaseService db) async {
    // Always init kancafetrasua's own DatabaseService (screens use this one)
    await cafe_db.DatabaseService().init();

    if (db.getCollection('products').isNotEmpty) return;

    // Also seed into kanposvn's DatabaseService for screens that use it
    final areas = [
      {'id': 'area_1', 'name': 'Tầng 1', 'displayOrder': 1},
      {'id': 'area_2', 'name': 'Tầng 2', 'displayOrder': 2},
      {'id': 'area_3', 'name': 'Sân vườn', 'displayOrder': 3},
    ];
    for (final a in areas) {
      await db.saveItem('areas', a['id'] as String, a, triggerSync: false);
    }

    // Tables
    final tables = [
      {'id': 'tbl_1', 'areaId': 'area_1', 'areaName': 'Tầng 1', 'name': 'Bàn B1', 'seats': 4, 'status': 'empty'},
      {'id': 'tbl_2', 'areaId': 'area_1', 'areaName': 'Tầng 1', 'name': 'Bàn B2', 'seats': 4, 'status': 'empty'},
      {'id': 'tbl_3', 'areaId': 'area_1', 'areaName': 'Tầng 1', 'name': 'Bàn B3', 'seats': 2, 'status': 'empty'},
      {'id': 'tbl_4', 'areaId': 'area_1', 'areaName': 'Tầng 1', 'name': 'Bàn B4', 'seats': 6, 'status': 'empty'},
      {'id': 'tbl_5', 'areaId': 'area_2', 'areaName': 'Tầng 2', 'name': 'Bàn B5', 'seats': 4, 'status': 'empty'},
      {'id': 'tbl_6', 'areaId': 'area_2', 'areaName': 'Tầng 2', 'name': 'Bàn B6', 'seats': 4, 'status': 'empty'},
      {'id': 'tbl_7', 'areaId': 'area_2', 'areaName': 'Tầng 2', 'name': 'Bàn B7', 'seats': 8, 'status': 'empty'},
      {'id': 'tbl_8', 'areaId': 'area_3', 'areaName': 'Sân vườn', 'name': 'Bàn B8', 'seats': 4, 'status': 'empty'},
      {'id': 'tbl_9', 'areaId': 'area_3', 'areaName': 'Sân vườn', 'name': 'Bàn B9', 'seats': 4, 'status': 'empty'},
      {'id': 'tbl_10', 'areaId': 'area_3', 'areaName': 'Sân vườn', 'name': 'Bàn B10', 'seats': 6, 'status': 'empty'},
    ];
    for (final t in tables) {
      await db.saveItem('tables', t['id'] as String, t, triggerSync: false);
    }

    // Toppings
    final toppings = [
      {'id': 'top_1', 'name': 'Trân Châu', 'price': 5000.0},
      {'id': 'top_2', 'name': 'Pudding', 'price': 8000.0},
      {'id': 'top_3', 'name': 'Kem Cheese', 'price': 10000.0},
      {'id': 'top_4', 'name': 'Thạch Trái Cây', 'price': 5000.0},
      {'id': 'top_5', 'name': 'Bánh Flan', 'price': 10000.0},
      {'id': 'top_6', 'name': 'Foam Milk', 'price': 8000.0},
    ];

    // Sizes
    final sizes = [
      {'name': 'S', 'extraPrice': 0.0},
      {'name': 'M', 'extraPrice': 5000.0},
      {'name': 'L', 'extraPrice': 10000.0},
    ];

    // Categories
    final categories = [
      {'id': 'cat_cafe', 'name': 'Cafe', 'iconName': 'local_cafe'},
      {'id': 'cat_tea', 'name': 'Trà Sữa', 'iconName': 'emoji_food_beverage'},
      {'id': 'cat_smoothie', 'name': 'Sinh Tố', 'iconName': 'local_bar'},
      {'id': 'cat_juice', 'name': 'Nước Ép', 'iconName': 'local_drink'},
      {'id': 'cat_bakery', 'name': 'Bánh Ngọt', 'iconName': 'cake'},
    ];
    for (final c in categories) {
      await db.saveItem('categories', c['id'] as String, c, triggerSync: false);
    }

    // Products
    final products = [
      {
        'id': 'prod_1', 'categoryId': 'cat_cafe', 'categoryName': 'Cafe', 'code': 'CF01',
        'name': 'Cafe Đen Đá', 'basePrice': 25000.0, 'description': 'Cafe pha phin đậm đà truyền thống',
        'sizes': sizes, 'toppings': <dynamic>[], 'isAvailable': true,
      },
      {
        'id': 'prod_2', 'categoryId': 'cat_cafe', 'categoryName': 'Cafe', 'code': 'CF02',
        'name': 'Cafe Sữa Đá', 'basePrice': 29000.0, 'description': 'Cafe phin kết hợp sữa đặc',
        'sizes': sizes, 'toppings': <dynamic>[], 'isAvailable': true,
      },
      {
        'id': 'prod_3', 'categoryId': 'cat_cafe', 'categoryName': 'Cafe', 'code': 'CF03',
        'name': 'Bạc Xỉu Sài Gòn', 'basePrice': 32000.0, 'description': 'Nhiều sữa ít cafe thơm béo',
        'sizes': sizes, 'toppings': <dynamic>[], 'isAvailable': true,
      },
      {
        'id': 'prod_4', 'categoryId': 'cat_cafe', 'categoryName': 'Cafe', 'code': 'CF04',
        'name': 'Cappuccino', 'basePrice': 45000.0, 'description': 'Espresso cùng bọt sữa siêu mịn',
        'sizes': sizes, 'toppings': <dynamic>[], 'isAvailable': true,
      },
      {
        'id': 'prod_5', 'categoryId': 'cat_tea', 'categoryName': 'Trà Sữa', 'code': 'TS01',
        'name': 'Trà Sữa Truyền Thống', 'basePrice': 35000.0, 'description': 'Trà đen đậm vị hòa quyện sữa béo',
        'sizes': sizes, 'toppings': toppings, 'isAvailable': true,
      },
      {
        'id': 'prod_6', 'categoryId': 'cat_tea', 'categoryName': 'Trà Sữa', 'code': 'TS02',
        'name': 'Trà Sữa Matcha Nhật', 'basePrice': 42000.0, 'description': 'Bột matcha Uji cao cấp nhập khẩu',
        'sizes': sizes, 'toppings': toppings, 'isAvailable': true,
      },
      {
        'id': 'prod_7', 'categoryId': 'cat_tea', 'categoryName': 'Trà Sữa', 'code': 'TS03',
        'name': 'Trà Sữa Oolong Kem Cheese', 'basePrice': 45000.0, 'description': 'Trà Oolong nướng phủ lớp phô mai',
        'sizes': sizes, 'toppings': toppings, 'isAvailable': true,
      },
      {
        'id': 'prod_8', 'categoryId': 'cat_smoothie', 'categoryName': 'Sinh Tố', 'code': 'ST01',
        'name': 'Sinh Tố Bơ Đắk Lắk', 'basePrice': 48000.0, 'description': 'Bơ sáp dẻo quánh xay nguyên chất',
        'sizes': sizes, 'toppings': <dynamic>[], 'isAvailable': true,
      },
      {
        'id': 'prod_9', 'categoryId': 'cat_smoothie', 'categoryName': 'Sinh Tố', 'code': 'ST02',
        'name': 'Sinh Tố Dâu Tây', 'basePrice': 45000.0, 'description': 'Dâu Đà Lạt tươi xay mứt ngọt thanh',
        'sizes': sizes, 'toppings': <dynamic>[], 'isAvailable': true,
      },
      {
        'id': 'prod_10', 'categoryId': 'cat_bakery', 'categoryName': 'Bánh Ngọt', 'code': 'BN01',
        'name': 'Bánh Tiramisu Phô Mai', 'basePrice': 38000.0, 'description': 'Bánh đắng ngọt hài hòa hương cafe',
        'sizes': <dynamic>[], 'toppings': <dynamic>[], 'isAvailable': true,
      },
      {
        'id': 'prod_11', 'categoryId': 'cat_juice', 'categoryName': 'Nước Ép', 'code': 'NE01',
        'name': 'Nước Cam Tươi', 'basePrice': 35000.0, 'description': 'Cam vắt tươi nguyên chất',
        'sizes': sizes, 'toppings': <dynamic>[], 'isAvailable': true,
      },
      {
        'id': 'prod_12', 'categoryId': 'cat_tea', 'categoryName': 'Trà Sữa', 'code': 'TS04',
        'name': 'Trà Đào Cam Sả', 'basePrice': 38000.0, 'description': 'Trà đào thơm nồng kết hợp cam sả',
        'sizes': sizes, 'toppings': toppings, 'isAvailable': true,
      },
    ];
    for (final p in products) {
      await db.saveItem('products', p['id'] as String, p, triggerSync: false);
    }

    // Inventory
    final inventory = [
      {'id': 'inv_1', 'name': 'Hạt Cafe Robusta', 'sku': 'NL01', 'unit': 'kg', 'currentStock': 15.5, 'minStock': 3.0, 'costPrice': 180000.0, 'supplierName': 'Kho Cafe Buôn Ma Thuột'},
      {'id': 'inv_2', 'name': 'Sữa Đặc Phương Nam', 'sku': 'NL02', 'unit': 'lon', 'currentStock': 48.0, 'minStock': 10.0, 'costPrice': 22000.0, 'supplierName': 'Vinamilk VN'},
      {'id': 'inv_3', 'name': 'Trân Châu Đen', 'sku': 'NL03', 'unit': 'kg', 'currentStock': 8.0, 'minStock': 2.0, 'costPrice': 45000.0, 'supplierName': 'Nguyên Liệu Trà Sữa'},
      {'id': 'inv_4', 'name': 'Bột Matcha Nhật', 'sku': 'NL04', 'unit': 'kg', 'currentStock': 1.2, 'minStock': 2.0, 'costPrice': 650000.0, 'supplierName': 'Import Japan'},
      {'id': 'inv_5', 'name': 'Bơ Sáp Tươi', 'sku': 'NL05', 'unit': 'kg', 'currentStock': 4.5, 'minStock': 5.0, 'costPrice': 60000.0, 'supplierName': 'Nông Sản Đắk Lắk'},
      {'id': 'inv_6', 'name': 'Đường Phèn', 'sku': 'NL06', 'unit': 'kg', 'currentStock': 20.0, 'minStock': 5.0, 'costPrice': 25000.0, 'supplierName': 'Đường Biên Hòa'},
      {'id': 'inv_7', 'name': 'Sữa Tươi Vinamilk', 'sku': 'NL07', 'unit': 'lít', 'currentStock': 30.0, 'minStock': 10.0, 'costPrice': 35000.0, 'supplierName': 'Vinamilk VN'},
      {'id': 'inv_8', 'name': 'Đá Viên', 'sku': 'NL08', 'unit': 'kg', 'currentStock': 25.0, 'minStock': 10.0, 'costPrice': 5000.0, 'supplierName': 'Đá Tuyết'},
    ];
    for (final i in inventory) {
      await db.saveItem('inventory', i['id'] as String, i, triggerSync: false);
    }

    // Recipes
    final recipes = [
      {
        'id': 'rec_1', 'productId': 'prod_2', 'productName': 'Cafe Sữa Đá',
        'ingredients': [
          {'inventoryItemId': 'inv_1', 'inventoryItemName': 'Hạt Cafe Robusta', 'quantityPerUnit': 0.025, 'unit': 'kg'},
          {'inventoryItemId': 'inv_2', 'inventoryItemName': 'Sữa Đặc Phương Nam', 'quantityPerUnit': 0.1, 'unit': 'lon'},
        ],
      },
      {
        'id': 'rec_2', 'productId': 'prod_5', 'productName': 'Trà Sữa Truyền Thống',
        'ingredients': [
          {'inventoryItemId': 'inv_3', 'inventoryItemName': 'Trân Châu Đen', 'quantityPerUnit': 0.05, 'unit': 'kg'},
          {'inventoryItemId': 'inv_6', 'inventoryItemName': 'Đường Phèn', 'quantityPerUnit': 0.03, 'unit': 'kg'},
        ],
      },
      {
        'id': 'rec_3', 'productId': 'prod_8', 'productName': 'Sinh Tố Bơ Đắk Lắk',
        'ingredients': [
          {'inventoryItemId': 'inv_5', 'inventoryItemName': 'Bơ Sáp Tươi', 'quantityPerUnit': 0.2, 'unit': 'kg'},
          {'inventoryItemId': 'inv_7', 'inventoryItemName': 'Sữa Tươi Vinamilk', 'quantityPerUnit': 0.08, 'unit': 'lít'},
        ],
      },
      {
        'id': 'rec_4', 'productId': 'prod_6', 'productName': 'Trà Sữa Matcha Nhật',
        'ingredients': [
          {'inventoryItemId': 'inv_4', 'inventoryItemName': 'Bột Matcha Nhật', 'quantityPerUnit': 0.015, 'unit': 'kg'},
          {'inventoryItemId': 'inv_7', 'inventoryItemName': 'Sữa Tươi Vinamilk', 'quantityPerUnit': 0.1, 'unit': 'lít'},
        ],
      },
    ];
    for (final r in recipes) {
      await db.saveItem('recipes', r['id'] as String, r, triggerSync: false);
    }

    // Customers
    final customers = [
      {'id': 'cust_1', 'name': 'Nguyễn Văn A', 'phone': '0908123456', 'points': 150, 'membershipTier': 'Vàng', 'debt': 0.0, 'totalSpent': 1250000.0},
      {'id': 'cust_2', 'name': 'Trần Thị B', 'phone': '0912987654', 'points': 45, 'membershipTier': 'Đồng', 'debt': 85000.0, 'totalSpent': 340000.0},
      {'id': 'cust_3', 'name': 'Lê Minh C', 'phone': '0987654321', 'points': 300, 'membershipTier': 'Kim Cương', 'debt': 0.0, 'totalSpent': 5800000.0},
    ];
    for (final c in customers) {
      await db.saveItem('customers', c['id'] as String, c, triggerSync: false);
    }

    // Suppliers
    final suppliers = [
      {'id': 'sup_1', 'name': 'Kho Cafe Buôn Ma Thuột', 'phone': '02623555888', 'company': 'Công ty Cafe Tây Nguyên', 'debt': 1500000.0},
      {'id': 'sup_2', 'name': 'Vinamilk Việt Nam', 'phone': '1900636979', 'company': 'Tập đoàn Vinamilk', 'debt': 0.0},
    ];
    for (final s in suppliers) {
      await db.saveItem('suppliers', s['id'] as String, s, triggerSync: false);
    }

    // Sample Orders
    final orders = [
      {
        'id': 'ord_1', 'orderCode': 'HD0001', 'type': 'atTable', 'status': 'COMPLETED',
        'tableId': 'tbl_1', 'tableName': 'Bàn B1', 'areaName': 'Tầng 1',
        'customerName': 'Nguyễn Văn A', 'customerPhone': '0908123456',
        'items': [
          {'productId': 'prod_2', 'productName': 'Cafe Sữa Đá', 'sizeName': 'M', 'sizeExtraPrice': 5000.0, 'selectedToppings': <dynamic>[], 'unitPrice': 29000.0, 'quantity': 2, 'note': '', 'totalPrice': 68000.0},
          {'productId': 'prod_5', 'productName': 'Trà Sữa Truyền Thống', 'sizeName': 'L', 'sizeExtraPrice': 10000.0, 'selectedToppings': [{'id': 'top_1', 'name': 'Trân Châu', 'price': 5000.0}], 'unitPrice': 35000.0, 'quantity': 1, 'note': '', 'totalPrice': 50000.0},
        ],
        'subtotal': 118000.0, 'discountPercent': 0.0, 'discountAmount': 0.0,
        'totalAmount': 118000.0, 'paymentMethod': 'CASH', 'paymentStatus': 'PAID',
        'note': '', 'createdAt': DateTime.now().subtract(const Duration(hours: 3)).toIso8601String(),
        'paidAt': DateTime.now().subtract(const Duration(hours: 2, minutes: 50)).toIso8601String(),
      },
      {
        'id': 'ord_2', 'orderCode': 'HD0002', 'type': 'atTable', 'status': 'COMPLETED',
        'tableId': 'tbl_3', 'tableName': 'Bàn B3', 'areaName': 'Tầng 1',
        'items': [
          {'productId': 'prod_7', 'productName': 'Trà Sữa Oolong Kem Cheese', 'sizeName': 'M', 'sizeExtraPrice': 5000.0, 'selectedToppings': <dynamic>[], 'unitPrice': 45000.0, 'quantity': 2, 'note': '', 'totalPrice': 100000.0},
        ],
        'subtotal': 100000.0, 'discountPercent': 10.0, 'discountAmount': 10000.0,
        'totalAmount': 90000.0, 'paymentMethod': 'VIETQR', 'paymentStatus': 'PAID',
        'note': '', 'createdAt': DateTime.now().subtract(const Duration(hours: 2)).toIso8601String(),
        'paidAt': DateTime.now().subtract(const Duration(hours: 1, minutes: 40)).toIso8601String(),
      },
      {
        'id': 'ord_3', 'orderCode': 'HDMD0001', 'type': 'takeaway', 'status': 'COMPLETED',
        'items': [
          {'productId': 'prod_1', 'productName': 'Cafe Đen Đá', 'sizeName': 'L', 'sizeExtraPrice': 10000.0, 'selectedToppings': <dynamic>[], 'unitPrice': 25000.0, 'quantity': 1, 'note': '', 'totalPrice': 35000.0},
        ],
        'subtotal': 35000.0, 'discountPercent': 0.0, 'discountAmount': 0.0,
        'totalAmount': 35000.0, 'paymentMethod': 'CASH', 'paymentStatus': 'PAID',
        'note': '', 'createdAt': DateTime.now().subtract(const Duration(hours: 1)).toIso8601String(),
        'paidAt': DateTime.now().subtract(const Duration(minutes: 50)).toIso8601String(),
      },
    ];
    for (final o in orders) {
      await db.saveItem('orders', o['id'] as String, o, triggerSync: false);
    }

    // Expenses
    final expenses = [
      {'id': 'exp_1', 'title': 'Nhập hạt cafe Robusta', 'categoryName': 'Nhập hàng', 'type': 'EXPENSE', 'amount': 900000.0, 'supplierOrCustomerName': 'Kho Cafe Buôn Ma Thuột', 'createdAt': DateTime.now().subtract(const Duration(days: 5)).toIso8601String()},
      {'id': 'exp_2', 'title': 'Tiền điện tháng này', 'categoryName': 'Điện nước', 'type': 'EXPENSE', 'amount': 2400000.0, 'createdAt': DateTime.now().subtract(const Duration(days: 3)).toIso8601String()},
      {'id': 'exp_3', 'title': 'Thu nợ khách Trần Thị B', 'categoryName': 'Thu nợ', 'type': 'INCOME', 'amount': 50000.0, 'supplierOrCustomerName': 'Trần Thị B', 'createdAt': DateTime.now().subtract(const Duration(days: 1)).toIso8601String()},
      {'id': 'exp_4', 'title': 'Nhập sữa đặc', 'categoryName': 'Nhập hàng', 'type': 'EXPENSE', 'amount': 440000.0, 'supplierOrCustomerName': 'Vinamilk VN', 'createdAt': DateTime.now().subtract(const Duration(hours: 6)).toIso8601String()},
    ];
    for (final e in expenses) {
      await db.saveItem('expenses', e['id'] as String, e, triggerSync: false);
    }
  }
}
