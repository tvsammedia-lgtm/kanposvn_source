import '../models/nongsan_inventory_sales.dart';
import '../models/nongsan_partner.dart';
import '../models/nongsan_product.dart';
import 'nongsan_business_logic.dart';

/// Dữ liệu mẫu cho module [kanposvndailynongsan] — tạo một lần khi DB trống.
///
/// Theo đặc tả `agri_trade_manager_spec.md`: nhóm hàng Nông/Lâm/Thủy/Hải sản,
/// quy trình mua (phiếu cân -> kiểm phẩm -> nhập kho), bán hàng (tiền mặt +
/// ghi nợ), công nợ, bút toán tự động và báo cáo.
class NongSanSeedData {
  static const seedKey = 'nongsan_seed_v1';

  static const gaoSt25 = 'sp_gao_st25';
  static const caBasa = 'sp_cabasa';
  static const tomSu = 'sp_tomsu';
  static const mucOng = 'sp_mucong';
  static const caphe = 'sp_caphe';
  static const saurieng = 'sp_saurieng';
  static const gotram = 'sp_gotram';
  static const raucu = 'sp_raucu';

  static const nccMekong = 'ncc_mekong';
  static const nccTaynguyen = 'ncc_taynguyen';
  static const nccBiendong = 'ncc_biendong';

  static const khSieuthi = 'kh_sieuthi';
  static const khNhahang = 'kh_nhahang';
  static const khXuatkhau = 'kh_xuatkhau';

  static const khoNguyenlieu = 'kho_nguyenlieu';
  static const khoDonglanh = 'kho_donglanh';
  static const khoKho = 'kho_kho';

  static const weighGao = 'weigh_gao_v1';
  static const weighCa = 'weigh_ca_v1';
  static const kpGao = 'kp_gao_v1';
  static const kpCa = 'kp_ca_v1';

  /// Tạo dữ liệu mẫu nếu DB còn trống (idempotent).
  static Future<bool> seedIfEmpty(NongSanBusinessLogic bl) async {
    if ((await bl.products()).isNotEmpty) return false;

    final now = DateTime.now();

    // ── Danh mục cơ bản: 4 kho ───────────────────────────────────────
    await bl.saveWarehouse(NongSanWarehouse(
      id: khoNguyenlieu,
      name: 'Kho nguyên liệu',
      location: 'Tân Phú, TP.HCM',
      type: 'Nguyên liệu',
      updatedAt: now,
    ));
    await bl.saveWarehouse(NongSanWarehouse(
      id: khoDonglanh,
      name: 'Kho đông lạnh',
      location: 'Quận 8, TP.HCM',
      type: 'Đông lạnh',
      updatedAt: now,
    ));
    await bl.saveWarehouse(NongSanWarehouse(
      id: khoKho,
      name: 'Kho hàng khô',
      location: 'Hóc Môn, TP.HCM',
      type: 'Hàng khô',
      updatedAt: now,
    ));

    // ── Sản phẩm đa dạng nhóm hàng (§2) ──────────────────────────────
    final products = <NongSanProduct>[
      NongSanProduct(
        id: gaoSt25,
        code: 'NS-GAO-ST25',
        name: 'Gạo ST25 hạt dài',
        sku: 'ST25-1KG',
        category: 'Nông sản',
        unit: 'Kg',
        unitPurchase: 'Bao 50kg',
        unitSale: 'Kg',
        referencePrice: 17500,
        salePriceRef: 25000,
        updatedAt: now,
      ),
      NongSanProduct(
        id: caBasa,
        code: 'TS-CABASA',
        name: 'Cá basa fillet đông lạnh',
        sku: 'BAS-FLT-2',
        category: 'Thủy sản',
        unit: 'Kg',
        unitPurchase: 'Thùng 10kg',
        unitSale: 'Kg',
        referencePrice: 44000,
        salePriceRef: 65000,
        updatedAt: now,
      ),
      NongSanProduct(
        id: tomSu,
        code: 'HS-TOMSU-16',
        name: 'Tôm sú loại 16 con/kg',
        sku: 'TOM-16',
        category: 'Hải sản',
        unit: 'Kg',
        unitPurchase: 'Thùng 10kg',
        unitSale: 'Kg',
        referencePrice: 320000,
        salePriceRef: 420000,
        updatedAt: now,
      ),
      NongSanProduct(
        id: mucOng,
        code: 'HS-MUCO',
        name: 'Mực ống tươi',
        sku: 'MUC-ONG-1',
        category: 'Hải sản',
        unit: 'Kg',
        unitPurchase: 'Kg',
        unitSale: 'Kg',
        referencePrice: 260000,
        salePriceRef: 340000,
        updatedAt: now,
      ),
      NongSanProduct(
        id: caphe,
        code: 'NS-CP-ROB',
        name: 'Cà phê robusta nhân',
        sku: 'CP-RB-60',
        category: 'Nông sản',
        unit: 'Tấn',
        unitPurchase: 'Bao 60kg',
        unitSale: 'Tấn',
        referencePrice: 50000000,
        salePriceRef: 70000000,
        updatedAt: now,
      ),
      NongSanProduct(
        id: saurieng,
        code: 'NS-SRIENG-R6',
        name: 'Sầu riêng Ri6',
        sku: 'SR-R6-A',
        category: 'Nông sản',
        unit: 'Kg',
        unitPurchase: 'Kg',
        unitSale: 'Kg',
        referencePrice: 60000,
        salePriceRef: 80000,
        updatedAt: now,
      ),
      NongSanProduct(
        id: gotram,
        code: 'LS-GOTRAM',
        name: 'Gỗ tràm xẻ',
        sku: 'GT-XL-01',
        category: 'Lâm sản',
        unit: 'm3',
        unitPurchase: 'm3',
        unitSale: 'm3',
        referencePrice: 1200000,
        salePriceRef: 1600000,
        updatedAt: now,
      ),
      NongSanProduct(
        id: raucu,
        code: 'NS-RAUCU',
        name: 'Rau củ quả tươi',
        sku: 'RC-TUOI-1',
        category: 'Nông sản',
        unit: 'Kg',
        unitPurchase: 'Kg',
        unitSale: 'Kg',
        referencePrice: 12000,
        salePriceRef: 20000,
        updatedAt: now,
      ),
    ];
    for (final p in products) {
      await bl.saveProduct(p);
    }

    // ── Tiêu chuẩn chất lượng (§8.1) ─────────────────────────────────
    await bl.saveProductQuality(NongSanProductQuality(
      id: 'qual_gao',
      productId: gaoSt25,
      size: 'Hạt dài',
      grade: 'Loại 1',
      humidity: 14,
      impurityRate: 1,
      lossRate: 2,
    ));
    await bl.saveProductQuality(NongSanProductQuality(
      id: 'qual_ca',
      productId: caBasa,
      size: '2-3cm',
      grade: 'Fillet',
      humidity: 0,
      impurityRate: 0,
      lossRate: 3,
    ));
    await bl.saveProductQuality(NongSanProductQuality(
      id: 'qual_tom',
      productId: tomSu,
      size: '16 con/kg',
      grade: 'Tôm sú loại 1',
      humidity: 0,
      impurityRate: 0,
      lossRate: 1,
    ));
    await bl.saveProductQuality(NongSanProductQuality(
      id: 'qual_muc',
      productId: mucOng,
      size: '20-25 cm',
      grade: 'Loại A',
      humidity: 0,
      impurityRate: 0,
      lossRate: 1,
    ));
    await bl.saveProductQuality(NongSanProductQuality(
      id: 'qual_cp',
      productId: caphe,
      size: 'Sàng 18',
      grade: 'R1',
      humidity: 12,
      impurityRate: 1,
      lossRate: 1,
    ));
    await bl.saveProductQuality(NongSanProductQuality(
      id: 'qual_tram',
      productId: gotram,
      size: 'Dài 3m',
      grade: 'Loại A',
      humidity: 18,
      impurityRate: 0,
      lossRate: 1,
    ));

    // ── Nhà cung cấp (§14) ───────────────────────────────────────────
    await bl.saveSupplier(NongSanSupplier(
      id: nccMekong,
      name: 'Công ty Nông sản Mekong',
      phone: '0903123456',
      address: 'Tân Phú, TP.HCM',
      taxId: '0312345678',
      contactPerson: 'Nguyễn Văn An',
      customerType: 'Công ty',
      creditLimit: 500000000,
      paymentTermDays: 30,
      updatedAt: now,
    ));
    await bl.saveSupplier(NongSanSupplier(
      id: nccTaynguyen,
      name: 'HTX Nông sản Tây Nguyên',
      phone: '02638901234',
      address: 'Thành phố Buôn Ma Thuột, Đắk Lắk',
      taxId: '6001234567',
      contactPerson: 'Trần Thị Bình',
      customerType: 'Hợp tác xã',
      creditLimit: 300000000,
      paymentTermDays: 45,
      updatedAt: now,
    ));
    await bl.saveSupplier(NongSanSupplier(
      id: nccBiendong,
      name: 'Cửa hàng Hải sản Biển Đông',
      phone: '0987654321',
      address: 'Quận 8, TP.HCM',
      taxId: '0318765432',
      contactPerson: 'Lê Văn Cường',
      customerType: 'Thương lái',
      creditLimit: 200000000,
      paymentTermDays: 15,
      updatedAt: now,
    ));

    // ── Khách hàng (§15) ─────────────────────────────────────────────
    await bl.saveCustomer(NongSanCustomer(
      id: khSieuthi,
      name: 'Siêu thị Xanh Việt',
      phone: '02839450981',
      address: 'Quận 7, TP.HCM',
      company: 'Siêu thị Xanh Việt',
      taxId: '0314567890',
      contactPerson: 'Phạm Thị Dung',
      creditLimit: 200000000,
      paymentTermDays: 45,
      updatedAt: now,
    ));
    await bl.saveCustomer(NongSanCustomer(
      id: khNhahang,
      name: 'Nhà hàng Hải sản Biển Xanh',
      phone: '0911223344',
      address: 'Quận 1, TP.HCM',
      company: 'Nhà hàng Biển Xanh',
      taxId: '0315678901',
      contactPerson: 'Hoàng Văn Em',
      creditLimit: 100000000,
      paymentTermDays: 30,
      updatedAt: now,
    ));
    await bl.saveCustomer(NongSanCustomer(
      id: khXuatkhau,
      name: 'Công ty XNK Á Châu',
      phone: '02512345678',
      address: 'Cần Thơ',
      company: 'CTY XNK Á Châu',
      taxId: '1801234567',
      contactPerson: 'Đặng Thị Phương',
      creditLimit: 300000000,
      paymentTermDays: 60,
      updatedAt: now,
    ));

    // ── Đơn đặt hàng nhập (§12.1): 2 APPROVED, 1 DRAFT ───────────────
    await bl.createPurchaseOrder(
      id: 'po_gao_v1',
      supplierId: nccMekong,
      productId: gaoSt25,
      warehouseId: khoKho,
      expectedQuantity: 5000,
      expectedPrice: 17500,
      status: NongSanDocStatus.approved,
      note: 'Gạo ST25 vụ mùa',
      assignee: 'Nguyễn Văn An',
      date: now,
    );
    await bl.createPurchaseOrder(
      id: 'po_ca_v1',
      supplierId: nccBiendong,
      productId: caBasa,
      warehouseId: khoDonglanh,
      expectedQuantity: 1200,
      expectedPrice: 44000,
      status: NongSanDocStatus.approved,
      note: 'Cá basa fillet đông lạnh',
      assignee: 'Lê Văn Cường',
      date: now,
    );
    await bl.createPurchaseOrder(
      id: 'po_cp_draft',
      supplierId: nccTaynguyen,
      productId: caphe,
      warehouseId: khoKho,
      expectedQuantity: 2,
      expectedPrice: 50000000,
      status: NongSanDocStatus.draft,
      note: 'Cà phê robusta nhân',
      assignee: 'Nguyễn Văn An',
      date: now,
    );

    // ── Quy trình mua Gạo ST25: cân -> kiểm phẩm -> nhập kho (§42) ────
    final weighGaoId = await bl.createWeighingTicket(
      id: weighGao,
      supplierId: nccMekong,
      ticketNumber: 'PC-0724-0001',
      vehiclePlate: '51C-123.45',
      driverName: 'Nguyễn Hữu G',
      grossWeight: 20500,
      tareWeight: 14900,
      packagingWeight: 0,
      date: now,
    );
    final kpGaoId = await bl.createQualityInspection(
      id: kpGao,
      weighingTicketId: weighGaoId.id,
      productId: gaoSt25,
      humidity: 15.5,
      impurity: 1.5,
      deductedWeight: 600,
      adjustedPrice: 17500,
      grade: 'Loại 1',
      date: now,
    );
    await bl.receivePurchase(
      id: 'pn_gao_v1',
      supplierId: nccMekong,
      productId: gaoSt25,
      warehouseId: khoKho,
      weighingTicketId: weighGaoId.id,
      qualityInspectionId: kpGaoId.id,
      finalQuantity: 5000,
      unitPrice: 17500,
      shippingFee: 1000000,
      loadingFee: 200000,
      processingFee: 0,
      vatRate: 0.05,
      date: now,
    );

    // ── Quy trình mua Cá basa: cân -> kiểm phẩm -> nhập kho ──────────
    final weighCaId = await bl.createWeighingTicket(
      id: weighCa,
      supplierId: nccBiendong,
      ticketNumber: 'PC-0724-0002',
      vehiclePlate: '50D-987.65',
      driverName: 'Trần Văn H',
      grossWeight: 2600,
      tareWeight: 1100,
      packagingWeight: 0,
      date: now,
    );
    final kpCaId = await bl.createQualityInspection(
      id: kpCa,
      weighingTicketId: weighCaId.id,
      productId: caBasa,
      humidity: 0,
      impurity: 0,
      deductedWeight: 300,
      adjustedPrice: 44000,
      grade: 'Fillet',
      date: now,
    );
    await bl.receivePurchase(
      id: 'pn_ca_v1',
      supplierId: nccBiendong,
      productId: caBasa,
      warehouseId: khoDonglanh,
      weighingTicketId: weighCaId.id,
      qualityInspectionId: kpCaId.id,
      finalQuantity: 1200,
      unitPrice: 44000,
      shippingFee: 300000,
      loadingFee: 150000,
      processingFee: 0,
      vatRate: 0.05,
      date: now,
    );

    // ── Bán hàng: đơn -> duyệt -> xuất kho -> hóa đơn (§43) ───────────
    // 1. Bán tiền mặt Gạo ST25 cho siêu thị.
    final soGao = await bl.createSalesOrder(
      id: 'so_gao_v1',
      customerId: khSieuthi,
      warehouseId: khoKho,
      productId: gaoSt25,
      quantity: 2000,
      unitPrice: 25000,
      discount: 500000,
      taxRate: 0.08,
      note: 'Đơn gạo ST25 siêu thị',
    );
    await bl.approveSalesOrder(soGao.id);
    await bl.completeSale(
      id: 'hd_gao_v1',
      salesOrderId: soGao.id,
      paymentMethod: 'CASH',
      shippingFee: 0,
      date: now,
    );

    // 2. Bán ghi nợ Cá basa cho nhà hàng.
    final soCa = await bl.createSalesOrder(
      id: 'so_ca_v1',
      customerId: khNhahang,
      warehouseId: khoDonglanh,
      productId: caBasa,
      quantity: 800,
      unitPrice: 65000,
      discount: 0,
      taxRate: 0.08,
      note: 'Đơn cá basa nhà hàng',
    );
    await bl.approveSalesOrder(soCa.id);
    await bl.completeSale(
      id: 'hd_ca_v1',
      salesOrderId: soCa.id,
      paymentMethod: 'DEBT',
      shippingFee: 500000,
      date: now,
    );

    // ── Thu tiền một phần công nợ nhà hàng (§15) ──────────────────────
    await bl.receivePayment(
      id: 'pt_nhahang_v1',
      customerId: khNhahang,
      amount: 30000000,
      method: 'CASH',
      note: 'Thanh toán một phần đơn cá basa',
      date: now,
    );

    // ── Thanh toán một phần công nợ nhà cung cấp Gạo (§14) ───────────
    await bl.paySupplier(
      id: 'pc_mekong_v1',
      supplierId: nccMekong,
      amount: 50000000,
      method: 'CASH',
      note: 'Ứng trước tiền mua gạo',
      date: now,
    );

    // ── Chi phí bán hàng & quản lý (§16, §27) ─────────────────────────
    await bl.createExpense(
      id: 'cp_vc_v1',
      amount: 2000000,
      category: 'Vận chuyển',
      accountCode: NongSanBusinessLogic.accSelling,
      method: 'CASH',
      note: 'Vận chuyển gạo giao siêu thị',
      date: now,
    );
    await bl.createExpense(
      id: 'cp_dien_v1',
      amount: 1200000,
      category: 'Điện',
      accountCode: NongSanBusinessLogic.accAdmin,
      method: 'BANK',
      note: 'Tiền điện kho lạnh',
      date: now,
    );

    return true;
  }
}