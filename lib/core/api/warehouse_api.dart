import 'dart:convert';

import 'package:http/http.dart' as http;

import '../auth/auth_service.dart';
import '../sync/api_config.dart';

/// Lỗi gọi API kho — message tiếng Việt hiển thị được cho người dùng.
class WarehouseApiException implements Exception {
  final String message;
  WarehouseApiException(this.message);
  @override
  String toString() => message;
}

/// Sản phẩm của Customer (dùng chung mọi chi nhánh / kho).
class WhProduct {
  final String id;
  final String productCode;
  final String name;
  final String unit;
  final double price;
  final bool active;

  const WhProduct({
    required this.id,
    required this.productCode,
    required this.name,
    required this.unit,
    required this.price,
    required this.active,
  });

  factory WhProduct.fromJson(Map<String, dynamic> json) => WhProduct(
        id: json['id']?.toString() ?? '',
        productCode: json['product_code']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
        unit: json['unit']?.toString() ?? '',
        price: _num(json['price']),
        active: json['active'] == true,
      );
}

/// Kho thuộc chi nhánh (BRANCH) hoặc kho trung tâm (CENTRAL).
class WhWarehouse {
  final String id;
  final String customerId;
  final String? branchId;
  final String warehouseCode;
  final String warehouseName;
  final String warehouseType;
  final bool isDefault;
  final String status;
  final String? branchName;
  final String? branchCode;
  final int productCount;
  final double totalQuantity;

  const WhWarehouse({
    required this.id,
    required this.customerId,
    this.branchId,
    required this.warehouseCode,
    required this.warehouseName,
    required this.warehouseType,
    required this.isDefault,
    required this.status,
    this.branchName,
    this.branchCode,
    required this.productCount,
    required this.totalQuantity,
  });

  bool get isCentral => warehouseType == 'CENTRAL';

  String get label {
    final base = isDefault ? '$warehouseName (mặc định)' : warehouseName;
    final branch = branchName;
    return branch != null && branch.isNotEmpty ? '$base · $branch' : base;
  }

  factory WhWarehouse.fromJson(Map<String, dynamic> json) => WhWarehouse(
        id: json['id']?.toString() ?? '',
        customerId: json['customer_id']?.toString() ?? '',
        branchId: json['branch_id']?.toString(),
        warehouseCode: json['warehouse_code']?.toString() ?? '',
        warehouseName: json['warehouse_name']?.toString() ?? '',
        warehouseType: json['warehouse_type']?.toString() ?? 'BRANCH',
        isDefault: json['is_default'] == true,
        status: json['status']?.toString() ?? 'active',
        branchName: json['branch_name']?.toString(),
        branchCode: json['branch_code']?.toString(),
        productCount: (json['product_count'] as num?)?.toInt() ?? 0,
        totalQuantity: _num(json['total_quantity']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'branch_id': branchId,
        'warehouse_code': warehouseCode,
        'warehouse_name': warehouseName,
        'warehouse_type': warehouseType,
        'is_default': isDefault,
        'status': status,
        'branch_name': branchName,
        'branch_code': branchCode,
      };
}

/// Tồn kho của 1 sản phẩm trong 1 kho.
class WhStockRow {
  final String id;
  final String warehouseId;
  final String productId;
  final double quantity;
  final double minQuantity;
  final double maxQuantity;
  final String productCode;
  final String productName;
  final String unit;
  final double price;
  final String warehouseName;
  final String warehouseCode;

  const WhStockRow({
    required this.id,
    required this.warehouseId,
    required this.productId,
    required this.quantity,
    required this.minQuantity,
    required this.maxQuantity,
    required this.productCode,
    required this.productName,
    required this.unit,
    required this.price,
    required this.warehouseName,
    required this.warehouseCode,
  });

  factory WhStockRow.fromJson(Map<String, dynamic> json) => WhStockRow(
        id: json['id']?.toString() ?? '',
        warehouseId: json['warehouse_id']?.toString() ?? '',
        productId: json['product_id']?.toString() ?? '',
        quantity: _num(json['quantity']),
        minQuantity: _num(json['min_quantity']),
        maxQuantity: _num(json['max_quantity']),
        productCode: json['product_code']?.toString() ?? '',
        productName: json['product_name']?.toString() ?? '',
        unit: json['unit']?.toString() ?? '',
        price: _num(json['price']),
        warehouseName: json['warehouse_name']?.toString() ?? '',
        warehouseCode: json['warehouse_code']?.toString() ?? '',
      );
}

/// Phiếu chuyển kho (DRAFT → CONFIRMED → SHIPPING → RECEIVED / CANCELLED).
class WhTransfer {
  final String id;
  final String transferCode;
  final String fromWarehouseId;
  final String toWarehouseId;
  final String status;
  final String note;
  final String fromWarehouseName;
  final String toWarehouseName;
  final int itemCount;
  final List<WhTransferItem> items;

  const WhTransfer({
    required this.id,
    required this.transferCode,
    required this.fromWarehouseId,
    required this.toWarehouseId,
    required this.status,
    required this.note,
    required this.fromWarehouseName,
    required this.toWarehouseName,
    required this.itemCount,
    this.items = const [],
  });

  WhTransfer copyWith({List<WhTransferItem>? items}) => WhTransfer(
        id: id,
        transferCode: transferCode,
        fromWarehouseId: fromWarehouseId,
        toWarehouseId: toWarehouseId,
        status: status,
        note: note,
        fromWarehouseName: fromWarehouseName,
        toWarehouseName: toWarehouseName,
        itemCount: itemCount,
        items: items ?? this.items,
      );

  factory WhTransfer.fromJson(Map<String, dynamic> json) => WhTransfer(
        id: json['id']?.toString() ?? '',
        transferCode: json['transfer_code']?.toString() ?? '',
        fromWarehouseId: json['from_warehouse_id']?.toString() ?? '',
        toWarehouseId: json['to_warehouse_id']?.toString() ?? '',
        status: json['status']?.toString() ?? '',
        note: json['note']?.toString() ?? '',
        fromWarehouseName: json['from_warehouse_name']?.toString() ?? '',
        toWarehouseName: json['to_warehouse_name']?.toString() ?? '',
        itemCount: (json['item_count'] as num?)?.toInt() ?? 0,
        items: (json['items'] is List)
            ? (json['items'] as List)
                .map((e) => WhTransferItem.fromJson(e as Map<String, dynamic>))
                .toList()
            : const [],
      );
}

class WhTransferItem {
  final String productId;
  final String productCode;
  final String productName;
  final String unit;
  final double quantity;

  const WhTransferItem({
    required this.productId,
    required this.productCode,
    required this.productName,
    required this.unit,
    required this.quantity,
  });

  factory WhTransferItem.fromJson(Map<String, dynamic> json) =>
      WhTransferItem(
        productId: json['product_id']?.toString() ?? '',
        productCode: json['product_code']?.toString() ?? '',
        productName: json['product_name']?.toString() ?? '',
        unit: json['unit']?.toString() ?? '',
        quantity: _num(json['quantity']),
      );
}

double _num(dynamic v) {
  if (v == null) return 0;
  if (v is num) return v.toDouble();
  return double.tryParse(v.toString()) ?? 0;
}

/// Client gọi các API kho đa chi nhánh (Customer → Branch → Warehouse → Stock)
/// đã deploy tại `ApiConfig.baseUrl`. Xác thực bằng token của AuthService.
class WarehouseApi {
  static const Duration _timeout = Duration(seconds: 15);

  static Map<String, String> _headers() => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AuthService.instance?.token ?? ''}',
      };

  static Uri _uri(String path, [Map<String, String>? query]) =>
      Uri.parse('${ApiConfig.baseUrl}$path').replace(queryParameters: query);

  static Never _throwError(http.Response res) {
    String msg = 'Lỗi máy chủ (${res.statusCode})';
    try {
      final json = jsonDecode(utf8.decode(res.bodyBytes));
      if (json is Map && json['error'] != null) {
        msg = json['error'].toString();
      }
    } catch (_) {}
    throw WarehouseApiException(msg);
  }

  /// Danh sách kho + customer id. Có `branchId` → chỉ kho của chi nhánh đó.
  static Future<(List<WhWarehouse>, String? customerId)> fetchWarehouses(
    String appCode, {
    String? branchId,
  }) async {
    final query = <String, String>{'app_code': appCode};
    if (branchId != null && branchId.isNotEmpty) query['branch_id'] = branchId;
    final res = await http
        .get(_uri('/api/owner/warehouses', query), headers: _headers())
        .timeout(_timeout);
    if (res.statusCode != 200) _throwError(res);
    final json = jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
    final customer = json['customer'];
    final list = json['warehouses'];
    return (
      (list is List)
          ? list
              .map((e) => WhWarehouse.fromJson(e as Map<String, dynamic>))
              .toList()
          : const <WhWarehouse>[],
      customer is Map<String, dynamic> ? customer['id']?.toString() : null,
    );
  }

  /// Tạo kho mới (BRANCH cần branch_id; CENTRAL để trống branch_id).
  static Future<WhWarehouse> createWarehouse({
    required String appCode,
    String? branchId,
    required String warehouseName,
    String? warehouseCode,
    String warehouseType = 'BRANCH',
    bool isDefault = false,
  }) async {
    final res = await http
        .post(
          _uri('/api/owner/warehouses'),
          headers: _headers(),
          body: jsonEncode({
            'app_code': appCode,
            'branch_id': branchId,
            'warehouse_name': warehouseName,
            'warehouse_code': warehouseCode,
            'warehouse_type': warehouseType,
            'is_default': isDefault,
          }),
        )
        .timeout(_timeout);
    if (res.statusCode != 200 && res.statusCode != 201) _throwError(res);
    return WhWarehouse.fromJson(
      jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>,
    );
  }

  /// Tồn kho. Có `warehouseId` → tồn của 1 kho; không → tồn mọi kho được phép.
  static Future<(List<WhStockRow>, List<WhProduct>)> fetchStock(
    String appCode, {
    String? warehouseId,
  }) async {
    final query = <String, String>{'app_code': appCode};
    if (warehouseId != null && warehouseId.isNotEmpty) {
      query['warehouse_id'] = warehouseId;
    }
    final res = await http
        .get(_uri('/api/owner/stock', query), headers: _headers())
        .timeout(_timeout);
    if (res.statusCode != 200) _throwError(res);
    final json = jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
    final stock = json['stock'];
    final noStock = json['productsWithNoStock'];
    return (
      (stock is List)
          ? stock
              .map((e) => WhStockRow.fromJson(e as Map<String, dynamic>))
              .toList()
          : const <WhStockRow>[],
      (noStock is List)
          ? noStock
              .map((e) => WhProduct.fromJson(e as Map<String, dynamic>))
              .toList()
          : const <WhProduct>[],
    );
  }

  /// Danh sách sản phẩm của Customer.
  static Future<List<WhProduct>> fetchProducts(String appCode) async {
    final res = await http
        .get(
          _uri('/api/owner/products', {'app_code': appCode}),
          headers: _headers(),
        )
        .timeout(_timeout);
    if (res.statusCode != 200) _throwError(res);
    final json = jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
    final list = json['products'];
    return (list is List)
        ? list
            .map((e) => WhProduct.fromJson(e as Map<String, dynamic>))
            .toList()
        : const <WhProduct>[];
  }

  /// Tạo sản phẩm mới.
  static Future<WhProduct> createProduct({
    required String appCode,
    required String name,
    String? productCode,
    String? unit,
    double? price,
  }) async {
    final res = await http
        .post(
          _uri('/api/owner/products'),
          headers: _headers(),
          body: jsonEncode({
            'app_code': appCode,
            'name': name,
            'product_code': productCode,
            'unit': unit,
            'price': price ?? 0,
          }),
        )
        .timeout(_timeout);
    if (res.statusCode != 200 && res.statusCode != 201) _throwError(res);
    return WhProduct.fromJson(
      jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>,
    );
  }

  /// Ghi 1 giao dịch tồn kho. Quy tắc: mọi thay đổi tồn đều qua giao dịch.
  ///
  /// tx_type: IMPORT | EXPORT | SALE | TRANSFER_IN | TRANSFER_OUT |
  /// ADJUSTMENT_UP | ADJUSTMENT_DOWN.
  static Future<void> postTransaction({
    required String appCode,
    required String warehouseId,
    required String productId,
    required String txType,
    required double quantity,
    String? note,
    String? refType,
    String? refId,
  }) async {
    final res = await http
        .post(
          _uri('/api/owner/stock/transaction'),
          headers: _headers(),
          body: jsonEncode({
            'app_code': appCode,
            'warehouse_id': warehouseId,
            'product_id': productId,
            'tx_type': txType,
            'quantity': quantity,
            'note': note,
            'ref_type': refType,
            'ref_id': refId,
          }),
        )
        .timeout(_timeout);
    if (res.statusCode != 200 && res.statusCode != 201) _throwError(res);
  }

  /// Trừ tồn kho khi bán hàng (tx_type = SALE) theo hóa đơn — best-effort.
  static Future<void> postSaleDeductions({
    required String appCode,
    required String warehouseId,
    required String orderCode,
    required List<({String productId, double qty})> items,
  }) async {
    for (final it in items) {
      if (it.qty <= 0) continue;
      await postTransaction(
        appCode: appCode,
        warehouseId: warehouseId,
        productId: it.productId,
        txType: 'SALE',
        quantity: it.qty,
        note: 'Bán hàng $orderCode',
        refType: 'SALE_ORDER',
        refId: orderCode,
      );
    }
  }

  /// Danh sách phiếu chuyển kho của Customer.
  static Future<List<WhTransfer>> fetchTransfers(String appCode) async {
    final res = await http
        .get(
          _uri('/api/owner/stock/transfer', {'app_code': appCode}),
          headers: _headers(),
        )
        .timeout(_timeout);
    if (res.statusCode != 200) _throwError(res);
    final json = jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
    final list = json['transfers'];
    return (list is List)
        ? list
            .map((e) => WhTransfer.fromJson(e as Map<String, dynamic>))
            .toList()
        : const <WhTransfer>[];
  }

  /// Chi tiết phiếu chuyển kho (kèm danh sách mặt hàng).
  static Future<WhTransfer> fetchTransfer(String id) async {
    final res = await http
        .get(_uri('/api/owner/stock/transfer/$id'), headers: _headers())
        .timeout(_timeout);
    if (res.statusCode != 200) _throwError(res);
    return WhTransfer.fromJson(
      jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>,
    );
  }

  /// Tạo phiếu chuyển kho (DRAFT) — chưa làm thay đổi tồn kho.
  static Future<void> createTransfer({
    required String appCode,
    required String fromWarehouseId,
    required String toWarehouseId,
    String? note,
    required List<({String productId, double qty})> items,
  }) async {
    final res = await http
        .post(
          _uri('/api/owner/stock/transfer'),
          headers: _headers(),
          body: jsonEncode({
            'app_code': appCode,
            'from_warehouse_id': fromWarehouseId,
            'to_warehouse_id': toWarehouseId,
            'note': note,
            'items': [
              for (final it in items)
                {'product_id': it.productId, 'quantity': it.qty},
            ],
          }),
        )
        .timeout(_timeout);
    if (res.statusCode != 200 && res.statusCode != 201) _throwError(res);
  }

  /// Xử lý phiếu chuyển: confirm | ship | receive | cancel.
  static Future<void> transferAction(String transferId, String action) async {
    final res = await http
        .patch(
          _uri('/api/owner/stock/transfer/$transferId'),
          headers: _headers(),
          body: jsonEncode({'action': action}),
        )
        .timeout(_timeout);
    if (res.statusCode != 200) _throwError(res);
  }
}
