import '../../../core/db/database_service.dart';
import '../models/cafe_table.dart';
import '../models/cafe_menu.dart';
import '../models/cafe_recipe.dart';
import '../models/cafe_inventory.dart';
import '../models/cafe_customer_supplier.dart';
import '../models/cafe_finance_accounting.dart';
import '../models/cafe_user_role.dart';
import 'cafe_isar_service.dart';

class CafeSeedData {
  static Future<void> seedIfEmpty(DatabaseService db) async {
    final isarService = CafeIsarService();
    final existingAreas = isarService.getAreas();
    if (existingAreas.isNotEmpty) return; // Already seeded

    // 1. SEED AREAS
    final area1 = CafeArea(
      id: 'AREA-1',
      name: 'Tầng 1',
      description: 'Không gian tầng 1',
      sortOrder: 1,
    );
    final area2 = CafeArea(
      id: 'AREA-2',
      name: 'Tầng 2',
      description: 'Không gian tầng 2',
      sortOrder: 2,
    );

    for (var a in [area1, area2]) {
      await isarService.saveArea(a);
    }

    // 2. SEED TABLES (6 bàn - 2 tầng)
    final tables = [
      // Tầng 1
      CafeTable(
        id: 'TAB-T1',
        name: 'Bàn T1',
        areaId: area1.id,
        areaName: area1.name,
        seatCount: 4,
        status: TableStatus.coKhach,
        customerInfo: TableCustomerInfo(
          customerName: 'Nguyễn Văn A',
          phone: '0901234567',
          guestCount: 3,
          checkInTime: DateTime.now().subtract(const Duration(minutes: 45)),
          currentTotal: 125000,
        ),
      ),
      CafeTable(
        id: 'TAB-T2',
        name: 'Bàn T2',
        areaId: area1.id,
        areaName: area1.name,
        seatCount: 4,
        status: TableStatus.choThanhToan,
        customerInfo: TableCustomerInfo(
          customerName: 'Trần Thị B',
          guestCount: 2,
          checkInTime: DateTime.now().subtract(const Duration(minutes: 60)),
          currentTotal: 95000,
        ),
      ),
      CafeTable(
        id: 'TAB-T3',
        name: 'Bàn T3',
        areaId: area1.id,
        areaName: area1.name,
        seatCount: 4,
        status: TableStatus.trong,
      ),

      // Tầng 2
      CafeTable(
        id: 'TAB-T4',
        name: 'Bàn T4',
        areaId: area2.id,
        areaName: area2.name,
        seatCount: 4,
        status: TableStatus.dangPhucVu,
        customerInfo: TableCustomerInfo(
          customerName: 'Lê Văn C',
          guestCount: 4,
          checkInTime: DateTime.now().subtract(const Duration(minutes: 20)),
          currentTotal: 210000,
        ),
      ),
      CafeTable(
        id: 'TAB-T5',
        name: 'Bàn T5',
        areaId: area2.id,
        areaName: area2.name,
        seatCount: 8,
        status: TableStatus.daDatTruoc,
        note: 'Khách đặt tiệc sinh nhật 19h',
      ),
      CafeTable(
        id: 'TAB-T6',
        name: 'Bàn T6',
        areaId: area2.id,
        areaName: area2.name,
        seatCount: 2,
        status: TableStatus.trong,
      ),
    ];

    for (var t in tables) {
      await isarService.saveTable(t);
    }

    // 3. SEED CATEGORIES
    final catCafe = CafeCategory(
      id: 'CAT-1',
      name: 'Cafe',
      iconName: 'coffee',
      sortOrder: 1,
    );
    final catTraSua = CafeCategory(
      id: 'CAT-2',
      name: 'Trà Sữa',
      iconName: 'emoji_food_beverage',
      sortOrder: 2,
    );
    final catSinhTo = CafeCategory(
      id: 'CAT-3',
      name: 'Sinh Tố & Nước Ép',
      iconName: 'local_drink',
      sortOrder: 3,
    );
    final catDaXay = CafeCategory(
      id: 'CAT-4',
      name: 'Đá Xay (Ice Blended)',
      iconName: 'ac_unit',
      sortOrder: 4,
    );
    final catTraiCay = CafeCategory(
      id: 'CAT-5',
      name: 'Trà Trái Cây',
      iconName: 'local_florist',
      sortOrder: 5,
    );
    final catGiaiKhat = CafeCategory(
      id: 'CAT-6',
      name: 'Nước Giải Khát',
      iconName: 'weekend',
      sortOrder: 6,
    );
    final catBanh = CafeCategory(
      id: 'CAT-7',
      name: 'Bánh Ngọt & Snack',
      iconName: 'cake',
      sortOrder: 7,
    );

    for (var c in [
      catCafe,
      catTraSua,
      catSinhTo,
      catDaXay,
      catTraiCay,
      catGiaiKhat,
      catBanh,
    ]) {
      await isarService.saveCategory(c);
    }

    // 4. SEED TOPPINGS
    final topTranChauDen = MenuItemTopping(
      id: 'TOP-1',
      name: 'Trân châu đen',
      price: 8000,
    );
    final topTranChauHoangKim = MenuItemTopping(
      id: 'TOP-2',
      name: 'Trân châu hoàng kim',
      price: 10000,
    );
    final topPudding = MenuItemTopping(
      id: 'TOP-3',
      name: 'Pudding Flan',
      price: 10000,
    );
    final topKemCheese = MenuItemTopping(
      id: 'TOP-4',
      name: 'Kem Cheese / Foam',
      price: 12000,
    );
    final topThachTraiCay = MenuItemTopping(
      id: 'TOP-5',
      name: 'Thạch trái cây',
      price: 8000,
    );

    final standardSizes = [
      MenuItemSize(name: 'S', extraPrice: 0),
      MenuItemSize(name: 'M', extraPrice: 5000),
      MenuItemSize(name: 'L', extraPrice: 10000),
    ];

    // 5. SEED MENU ITEMS
    final menuItems = [
      // --- Cafe ---
      CafeMenuItem(
        id: 'MN-1',
        code: 'CF01',
        name: 'Cafe Đen Đá',
        categoryId: catCafe.id,
        categoryName: catCafe.name,
        basePrice: 16000,
        description: 'Cafe Phin đậm đà truyền thống',
        sizes: standardSizes,
        availableToppings: [topKemCheese],
      ),
      CafeMenuItem(
        id: 'MN-2',
        code: 'CF02',
        name: 'Cafe Sữa Đá',
        categoryId: catCafe.id,
        categoryName: catCafe.name,
        basePrice: 19000,
        description: 'Cafe Phin kết hợp sữa đặc Ngôi Sao Phương Nam',
        sizes: standardSizes,
        availableToppings: [topKemCheese, topPudding],
      ),
      CafeMenuItem(
        id: 'MN-3',
        code: 'CF03',
        name: 'Bạc Xỉu',
        categoryId: catCafe.id,
        categoryName: catCafe.name,
        basePrice: 22000,
        description: 'Nhiều sữa ít cafe béo ngậy thơm ngon',
        sizes: standardSizes,
        availableToppings: [topPudding, topKemCheese],
      ),
      CafeMenuItem(
        id: 'MN-9',
        code: 'CF04',
        name: 'Cafe Trứng',
        categoryId: catCafe.id,
        categoryName: catCafe.name,
        basePrice: 35000,
        description: 'Cafe đánh trứng kiểu Hà Nội, béo mịn thơm phức',
        sizes: [MenuItemSize(name: 'Tiêu chuẩn', extraPrice: 0)],
        availableToppings: [topPudding],
      ),

      // --- Trà Sữa ---
      CafeMenuItem(
        id: 'MN-4',
        code: 'TS01',
        name: 'Trà Sữa Truyền Thống',
        categoryId: catTraSua.id,
        categoryName: catTraSua.name,
        basePrice: 25000,
        description: 'Trà đen đậm vị kết hợp sữa thơm lừng',
        sizes: standardSizes,
        availableToppings: [
          topTranChauDen,
          topTranChauHoangKim,
          topPudding,
          topKemCheese,
          topThachTraiCay,
        ],
      ),
      CafeMenuItem(
        id: 'MN-5',
        code: 'TS02',
        name: 'Trà Sữa Matcha Uji',
        categoryId: catTraSua.id,
        categoryName: catTraSua.name,
        basePrice: 29000,
        description: 'Bột Matcha Nhật Bản chuẩn Uji',
        sizes: standardSizes,
        availableToppings: [topTranChauDen, topPudding, topKemCheese],
      ),
      CafeMenuItem(
        id: 'MN-10',
        code: 'TS03',
        name: 'Trà Sữa Khoai Môn',
        categoryId: catTraSua.id,
        categoryName: catTraSua.name,
        basePrice: 30000,
        description: 'Khoai môn tươi xay nhuyễn, thơm béo đặc trưng',
        sizes: standardSizes,
        availableToppings: [
          topTranChauDen,
          topTranChauHoangKim,
          topPudding,
          topThachTraiCay,
        ],
      ),
      CafeMenuItem(
        id: 'MN-11',
        code: 'TS04',
        name: 'Sữa Tươi Trân Châu Đường Đen',
        categoryId: catTraSua.id,
        categoryName: catTraSua.name,
        basePrice: 35000,
        description: 'Sữa tươi kết hợp trân châu nấu đường đen thơm mềm',
        sizes: standardSizes,
        availableToppings: [topTranChauDen, topTranChauHoangKim, topKemCheese],
      ),

      // --- Sinh Tố & Nước Ép ---
      CafeMenuItem(
        id: 'MN-6',
        code: 'ST01',
        name: 'Sinh Tố Bơ Sáp',
        categoryId: catSinhTo.id,
        categoryName: catSinhTo.name,
        basePrice: 35000,
        description: 'Bơ sáp Đắk Lắk dẻo mịn béo ngậy',
        sizes: standardSizes,
      ),
      CafeMenuItem(
        id: 'MN-7',
        code: 'NE01',
        name: 'Nước Ép Cam Tươi',
        categoryId: catSinhTo.id,
        categoryName: catSinhTo.name,
        basePrice: 25000,
        description: 'Cam sành vắt tươi 100% không chất bảo quản',
        sizes: standardSizes,
      ),
      CafeMenuItem(
        id: 'MN-12',
        code: 'ST02',
        name: 'Sinh Tố Mãng Cầu',
        categoryId: catSinhTo.id,
        categoryName: catSinhTo.name,
        basePrice: 30000,
        description: 'Mãng cầu xiêm tươi xay mịn, chua chua ngọt ngọt',
        sizes: standardSizes,
      ),
      CafeMenuItem(
        id: 'MN-13',
        code: 'NE02',
        name: 'Nước Ép Cà Rốt',
        categoryId: catSinhTo.id,
        categoryName: catSinhTo.name,
        basePrice: 25000,
        description: 'Cà rốt tươi ép giàu Vitamin A, giải nhiệt ngày hè',
        sizes: standardSizes,
      ),

      // --- Đá Xay (Ice Blended) ---
      CafeMenuItem(
        id: 'MN-14',
        code: 'DX01',
        name: 'Cafe Đá Xay (Frappuccino)',
        categoryId: catDaXay.id,
        categoryName: catDaXay.name,
        basePrice: 35000,
        description: 'Cafe đá xay mịn cùng đá bào, kem tươi béo mát',
        sizes: standardSizes,
        availableToppings: [topKemCheese, topPudding],
      ),
      CafeMenuItem(
        id: 'MN-15',
        code: 'DX02',
        name: 'Matcha Đá Xay',
        categoryId: catDaXay.id,
        categoryName: catDaXay.name,
        basePrice: 39000,
        description: 'Matcha Nhật xay mịn cùng sữa và đá, thơm mát thanh tao',
        sizes: standardSizes,
        availableToppings: [topKemCheese, topPudding],
      ),
      CafeMenuItem(
        id: 'MN-16',
        code: 'DX03',
        name: 'Socola Đá Xay',
        categoryId: catDaXay.id,
        categoryName: catDaXay.name,
        basePrice: 39000,
        description: 'Socola đậm vị xay cùng đá bào và kem tươi',
        sizes: standardSizes,
        availableToppings: [topKemCheese],
      ),

      // --- Trà Trái Cây ---
      CafeMenuItem(
        id: 'MN-17',
        code: 'TTC01',
        name: 'Trà Đào Cam Sả',
        categoryId: catTraiCay.id,
        categoryName: catTraiCay.name,
        basePrice: 25000,
        description: 'Trà lài kết hợp đào miếng, cam tươi và sả, thơm mát',
        sizes: standardSizes,
      ),
      CafeMenuItem(
        id: 'MN-18',
        code: 'TTC02',
        name: 'Trà Vải Hạt Sen',
        categoryId: catTraiCay.id,
        categoryName: catTraiCay.name,
        basePrice: 25000,
        description: 'Trà xanh kết hợp vải thiều và hạt sen tươi bùi bùi',
        sizes: standardSizes,
      ),
      CafeMenuItem(
        id: 'MN-19',
        code: 'TTC03',
        name: 'Trà Chanh Dây',
        categoryId: catTraiCay.id,
        categoryName: catTraiCay.name,
        basePrice: 20000,
        description: 'Trà thanh nhiệt kết hợp chanh dây chua chua ngọt ngọt',
        sizes: standardSizes,
      ),

      // --- Nước Giải Khát ---
      CafeMenuItem(
        id: 'MN-20',
        code: 'GK01',
        name: 'Sting Dâu',
        categoryId: catGiaiKhat.id,
        categoryName: catGiaiKhat.name,
        basePrice: 15000,
        description: 'Nước tăng lực Sting vị dâu',
        sizes: [MenuItemSize(name: 'Lon', extraPrice: 0)],
      ),
      CafeMenuItem(
        id: 'MN-21',
        code: 'GK02',
        name: 'Pepsi / Coca-Cola',
        categoryId: catGiaiKhat.id,
        categoryName: catGiaiKhat.name,
        basePrice: 12000,
        description: 'Nước ngọt có ga Pepsi hoặc Coca-Cola chọn theo tủ lạnh',
        sizes: [MenuItemSize(name: 'Lon', extraPrice: 0)],
      ),
      CafeMenuItem(
        id: 'MN-22',
        code: 'GK03',
        name: 'Nước Suối Aquafina',
        categoryId: catGiaiKhat.id,
        categoryName: catGiaiKhat.name,
        basePrice: 10000,
        description: 'Nước khoáng Aquafina 500ml',
        sizes: [MenuItemSize(name: 'Chai', extraPrice: 0)],
      ),
      CafeMenuItem(
        id: 'MN-23',
        code: 'GK04',
        name: 'Nước Tăng Lực Red Bull',
        categoryId: catGiaiKhat.id,
        categoryName: catGiaiKhat.name,
        basePrice: 15000,
        description: 'Red Bull cho một ngày tràn đầy năng lượng',
        sizes: [MenuItemSize(name: 'Lon', extraPrice: 0)],
      ),
      CafeMenuItem(
        id: 'MN-24',
        code: 'GK05',
        name: 'Sữa Đậu Nành',
        categoryId: catGiaiKhat.id,
        categoryName: catGiaiKhat.name,
        basePrice: 15000,
        description: 'Sữa đậu nành tươi thơm mát',
        sizes: [MenuItemSize(name: 'Ly', extraPrice: 0)],
      ),

      // --- Bánh Ngọt & Snack ---
      CafeMenuItem(
        id: 'MN-8',
        code: 'BN01',
        name: 'Bánh Tiramisu',
        categoryId: catBanh.id,
        categoryName: catBanh.name,
        basePrice: 35000,
        description: 'Bánh Tiramisu phô mai ca cao mềm mịn',
        sizes: [MenuItemSize(name: 'Tiêu chuẩn', extraPrice: 0)],
      ),
      CafeMenuItem(
        id: 'MN-25',
        code: 'BN02',
        name: 'Bánh Mousse Xoài',
        categoryId: catBanh.id,
        categoryName: catBanh.name,
        basePrice: 25000,
        description: 'Bánh Mousse xoài tươi mát lạnh thơm ngon',
        sizes: [MenuItemSize(name: 'Tiêu chuẩn', extraPrice: 0)],
      ),
      CafeMenuItem(
        id: 'MN-26',
        code: 'BN03',
        name: 'Khoai Tây Chiên',
        categoryId: catBanh.id,
        categoryName: catBanh.name,
        basePrice: 20000,
        description: 'Khoai tây chiên vàng giòn, sốt tương ớt mayo',
        sizes: [MenuItemSize(name: 'Tiêu chuẩn', extraPrice: 0)],
      ),
      CafeMenuItem(
        id: 'MN-27',
        code: 'BN04',
        name: 'Bánh Chuối Nướng',
        categoryId: catBanh.id,
        categoryName: catBanh.name,
        basePrice: 20000,
        description: 'Bánh chuối nướng cốt dừa thơm lừng',
        sizes: [MenuItemSize(name: 'Tiêu chuẩn', extraPrice: 0)],
      ),
    ];

    for (var m in menuItems) {
      await isarService.saveMenuItem(m);
    }

    // 6. SEED INVENTORY
    final invCafe = InventoryItem(
      id: 'INV-1',
      code: 'NL-CF',
      name: 'Hạt Cafe Roaster',
      unit: 'g',
      currentStock: 5000,
      minStock: 1000,
      costPrice: 200,
    );
    final invSuaDac = InventoryItem(
      id: 'INV-2',
      code: 'NL-SD',
      name: 'Sữa đặc Ngôi Sao',
      unit: 'ml',
      currentStock: 8000,
      minStock: 2000,
      costPrice: 50,
    );
    final invSuaTuoi = InventoryItem(
      id: 'INV-3',
      code: 'NL-ST',
      name: 'Sữa tươi Vinamilk',
      unit: 'ml',
      currentStock: 10000,
      minStock: 2000,
      costPrice: 30,
    );
    final invDuong = InventoryItem(
      id: 'INV-4',
      code: 'NL-D',
      name: 'Đường cát trắng',
      unit: 'g',
      currentStock: 15000,
      minStock: 3000,
      costPrice: 20,
    );
    final invTranChau = InventoryItem(
      id: 'INV-5',
      code: 'NL-TC',
      name: 'Trân châu đen',
      unit: 'g',
      currentStock: 3000,
      minStock: 800,
      costPrice: 40,
    );
    final invBo = InventoryItem(
      id: 'INV-6',
      code: 'NL-BO',
      name: 'Bơ sáp tươi',
      unit: 'g',
      currentStock: 2500,
      minStock: 500,
      costPrice: 80,
    );

    for (var inv in [
      invCafe,
      invSuaDac,
      invSuaTuoi,
      invDuong,
      invTranChau,
      invBo,
    ]) {
      await isarService.saveInventoryItem(inv);
    }

    // 7. SEED RECIPES
    final recipeCafeSua = CafeRecipe(
      id: 'RCP-1',
      menuItemId: 'MN-2',
      menuItemName: 'Cafe Sữa Đá',
      ingredients: [
        RecipeIngredient(
          inventoryItemId: invCafe.id,
          ingredientName: invCafe.name,
          quantity: 25,
          unit: 'g',
        ),
        RecipeIngredient(
          inventoryItemId: invSuaDac.id,
          ingredientName: invSuaDac.name,
          quantity: 20,
          unit: 'ml',
        ),
        RecipeIngredient(
          inventoryItemId: invDuong.id,
          ingredientName: invDuong.name,
          quantity: 10,
          unit: 'g',
        ),
      ],
    );

    final recipeTraSua = CafeRecipe(
      id: 'RCP-2',
      menuItemId: 'MN-4',
      menuItemName: 'Trà Sữa Truyền Thống',
      ingredients: [
        RecipeIngredient(
          inventoryItemId: invSuaTuoi.id,
          ingredientName: invSuaTuoi.name,
          quantity: 100,
          unit: 'ml',
        ),
        RecipeIngredient(
          inventoryItemId: invSuaDac.id,
          ingredientName: invSuaDac.name,
          quantity: 15,
          unit: 'ml',
        ),
        RecipeIngredient(
          inventoryItemId: invTranChau.id,
          ingredientName: invTranChau.name,
          quantity: 30,
          unit: 'g',
        ),
      ],
    );

    for (var r in [recipeCafeSua, recipeTraSua]) {
      await isarService.saveRecipe(r);
    }

    // 8. SEED CUSTOMERS & SUPPLIERS
    final cus1 = CafeCustomer(
      id: 'CUS-1',
      name: 'Nguyễn Văn A',
      phone: '0901234567',
      rewardPoints: 120,
      tier: CustomerTier.bac,
      totalSpent: 1250000,
    );
    final cus2 = CafeCustomer(
      id: 'CUS-2',
      name: 'Trần Thị B',
      phone: '0987654321',
      rewardPoints: 450,
      tier: CustomerTier.vang,
      totalSpent: 4500000,
    );

    for (var cus in [cus1, cus2]) {
      await isarService.saveCustomer(cus);
    }

    final sup1 = CafeSupplier(
      id: 'SUP-1',
      name: 'Công ty Cafe Buôn Ma Thuột',
      phone: '02623888999',
      address: 'Đắk Lắk',
      debtAmount: 2500000,
    );
    final sup2 = CafeSupplier(
      id: 'SUP-2',
      name: 'Nhà phân phối Sữa Vinamilk',
      phone: '02854155555',
      address: 'TP.HCM',
      debtAmount: 0,
    );

    for (var sup in [sup1, sup2]) {
      await isarService.saveSupplier(sup);
    }

    // 9. SEED USERS
    final users = [
      CafeUser(
        id: 'USR-1',
        username: 'admin',
        fullName: 'Quản trị viên',
        role: CafeRole.admin,
      ),
      CafeUser(
        id: 'USR-2',
        username: 'thungan',
        fullName: 'Phạm Thu Ngân',
        role: CafeRole.thuNgan,
      ),
      CafeUser(
        id: 'USR-3',
        username: 'phache',
        fullName: 'Trần Pha Chế',
        role: CafeRole.phaChe,
      ),
    ];

    for (var u in users) {
      await isarService.saveUser(u);
    }

    // 10. SEED CASH TRANSACTIONS
    await isarService.saveCashTransaction(
      CashTransaction(
        id: 'CTX-1',
        title: 'Thu doanh thu bán ca sáng',
        type: 'INCOME',
        category: 'Doanh thu bán hàng',
        amount: 1850000,
      ),
    );

    await isarService.saveCashTransaction(
      CashTransaction(
        id: 'CTX-2',
        title: 'Chi tiền điện nước tháng',
        type: 'EXPENSE',
        category: 'Điện nước',
        amount: 450000,
      ),
    );
  }
}
