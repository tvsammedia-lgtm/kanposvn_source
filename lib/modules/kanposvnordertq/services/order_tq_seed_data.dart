import 'package:isar/isar.dart';
import '../models/order_local.dart';
import '../models/order_item_local.dart';
import '../models/customer_local.dart';
import '../models/vehicle_local.dart';
import '../models/trip_local.dart';
import '../models/location_local.dart';
import '../models/user_local.dart';
import '../models/driver_local.dart';
import '../models/employee_local.dart';
import '../models/payment_local.dart';
import '../models/notification_local.dart';
import '../models/shipment_local.dart';
import '../models/trip_order_local.dart';
import '../models/audit_log_local.dart';

class OrderTQSeedData {
  /// Chỉ seed nếu DB trống.
  static Future<void> seedIfEmpty(Isar isar) async {
    final count = await isar.orderLocals.count();
    if (count > 0) return;
    await seedSampleData(isar);
  }

  static Future<void> seedSampleData(Isar isar) async {
    final now = DateTime.now();

    // ── Users ──
    final users = [
      _user('user_admin', 'admin', 'ADMIN', now),
      _user('user_staff_01', 'staff01', 'STAFF', now),
      _user('user_driver_01', 'driver01', 'DRIVER', now),
      _user('user_driver_02', 'driver02', 'DRIVER', now),
      _user('user_customer_01', 'customer01', 'CUSTOMER', now),
      _user('user_customer_02', 'customer02', 'CUSTOMER', now),
      _user('user_customer_03', 'customer03', 'CUSTOMER', now),
    ];

    // ── Employees ──
    final employees = [
      _emp('emp_01', 'NV-001', 'Nguyễn Văn An', 'STAFF', now),
      _emp('emp_02', 'NV-002', 'Trần Thị Bình', 'STAFF', now),
      _emp('emp_03', 'NV-003', 'Lê Minh Cường', 'ADMIN', now),
    ];

    // ── Drivers ──
    final drivers = [
      _driver('driver_01', 'TX-001', 'Phạm Đức Dũng', 'GPLX-12345', 'ACTIVE', 'user_driver_01', now),
      _driver('driver_02', 'TX-002', 'Hoàng Văn Em', 'GPLX-67890', 'ACTIVE', 'user_driver_02', now),
    ];

    // ── Customers ──
    final customers = [
      _customer('cust_nam_01', 'KH-001', 'Ngô Thanh Nam', '0901234567', 'Hà Nội', 50000000, now),
      _customer('cust_nam_02', 'KH-002', 'Đỗ Quỳnh Oanh', '0912345678', 'TP.HCM', 80000000, now),
      _customer('cust_nam_03', 'KH-003', 'Bùi Minh Phúc', '0923456789', 'Đà Nẵng', 30000000, now),
    ];

    // ── Vehicles ──
    final vehicles = [
      _vehicle('veh_01', 'XE-001', '51C-12345', 'CONTAINER_20FT', 20000, 33, 'ACTIVE', now),
      _vehicle('veh_02', 'XE-002', '51C-67890', 'CONTAINER_40FT', 30000, 67, 'ACTIVE', now),
      _vehicle('veh_03', 'XE-003', '51C-11111', 'TRUCK_5T', 5000, 25, 'MAINTENANCE', now),
    ];

    // ── Orders ──
    final order1 = _order('ord_001', 'ORD-2026-00001', 'cust_nam_01', 'CONFIRMED', 'CNY', 3500, 1200000, 150000, 25000, 1375000, 500000, 875000, now);
    final order2 = _order('ord_002', 'ORD-2026-00002', 'cust_nam_01', 'SHIPPED', 'CNY', 3500, 850000, 120000, 20000, 990000, 990000, 0, now);
    final order3 = _order('ord_003', 'ORD-2026-00003', 'cust_nam_02', 'PENDING_CONFIRM', 'CNY', 3500, 2500000, 200000, 50000, 2750000, 0, 2750000, now);
    final order4 = _order('ord_004', 'ORD-2026-00004', 'cust_nam_02', 'DELIVERED', 'CNY', 3500, 500000, 50000, 10000, 560000, 560000, 0, now);
    final order5 = _order('ord_005', 'ORD-2026-00005', 'cust_nam_03', 'IN_TRANSIT', 'CNY', 3500, 1800000, 180000, 30000, 2010000, 1000000, 1010000, now);
    final order6 = _order('ord_006', 'ORD-2026-00006', 'cust_nam_01', 'DRAFT', 'CNY', 3500, 300000, 30000, 5000, 335000, 0, 335000, now);

    // ── Order Items ──
    final orderItems = [
      _orderItem('ord_001_item_0', 'ord_001', 'Tai nghe Bluetooth', 'SKU-TNBT-001', 20, 50000, 'CNY', 1000000, 0.5, 0.01),
      _orderItem('ord_001_item_1', 'ord_001', 'Ốp điện thoại iPhone 16', 'SKU-OP-002', 50, 40000, 'CNY', 200000, 0.2, 0.005),
      _orderItem('ord_002_item_0', 'ord_002', 'Quạt mini', 'SKU-QM-001', 30, 25000, 'CNY', 750000, 1.0, 0.02),
      _orderItem('ord_002_item_1', 'ord_002', 'Sạc nhanh USB-C', 'SKU-SC-002', 100, 10000, 'CNY', 1000000, 0.1, 0.002),
      _orderItem('ord_003_item_0', 'ord_003', 'Máy massage cổ', 'SKU-MM-001', 15, 150000, 'CNY', 2250000, 0.8, 0.015),
      _orderItem('ord_004_item_0', 'ord_004', 'Đèn bàn LED', 'SKU-DN-001', 10, 50000, 'CNY', 500000, 0.6, 0.01),
      _orderItem('ord_005_item_0', 'ord_005', 'Máy lọc nước mini', 'SKU-MLN-001', 5, 350000, 'CNY', 1750000, 2.5, 0.04),
      _orderItem('ord_006_item_0', 'ord_006', 'Gối đỡ cổ', 'SKU-GN-001', 25, 12000, 'CNY', 300000, 0.3, 0.008),
    ];

    // ── Trips ──
    final trip1 = _trip('trip_001', 'TRIP-2026-00001', 'veh_01', 'driver_01', 'TP.HCM', 'Hà Nội', 'IN_TRANSIT', now.subtract(const Duration(hours: 6)), now.subtract(const Duration(hours: 5)));
    final trip2 = _trip('trip_002', 'TRIP-2026-00002', 'veh_02', 'driver_02', 'Hà Nội', 'Đà Nẵng', 'PLANNED', now.add(const Duration(hours: 2)), now.add(const Duration(hours: 8)));
    final trip3 = _trip('trip_003', 'TRIP-2026-00003', 'veh_01', 'driver_01', 'Hà Nội', 'TP.HCM', 'ARRIVED', now.subtract(const Duration(days: 1)), now.subtract(const Duration(hours: 18)));

    // ── TripOrders ──
    final tripOrders = [
      _tripOrder('trip_001', 'ord_002'),
      _tripOrder('trip_001', 'ord_005'),
      _tripOrder('trip_003', 'ord_004'),
    ];

    // ── Shipments ──
    final shipments = [
      _shipment('shp_001', 'ord_002', 'CN-2026-00001', 'Quảng Châu', 'TP.HCM', 'SF Express', 'trip_001', 'IN_TRANSIT', now.subtract(const Duration(days: 2)), now.add(const Duration(days: 1))),
      _shipment('shp_002', 'ord_005', 'CN-2026-00002', 'Thâm Quyến', 'Đà Nẵng', 'YTO Express', 'trip_001', 'IN_TRANSIT', now.subtract(const Duration(days: 1)), now.add(const Duration(days: 2))),
      _shipment('shp_003', 'ord_004', 'CN-2026-00003', 'Bắc Kinh', 'Hà Nội', 'ZTO Express', 'trip_003', 'DELIVERED', now.subtract(const Duration(days: 3)), now.subtract(const Duration(days: 1))),
    ];

    // ── Locations (GPS for trip_001) ──
    final locations = [
      _location('loc_001', 'trip_001', 'veh_01', 'driver_01', 10.7769, 106.7009, 15.0, 0.0, now.subtract(const Duration(hours: 5))),
      _location('loc_002', 'trip_001', 'veh_01', 'driver_01', 10.8231, 106.6297, 10.0, 45.5, now.subtract(const Duration(hours: 4))),
      _location('loc_003', 'trip_001', 'veh_01', 'driver_01', 11.3167, 106.1000, 12.0, 52.3, now.subtract(const Duration(hours: 3))),
      _location('loc_004', 'trip_001', 'veh_01', 'driver_01', 12.2500, 107.0500, 8.0, 60.1, now.subtract(const Duration(hours: 2))),
      _location('loc_005', 'trip_001', 'veh_01', 'driver_01', 14.0583, 108.2772, 15.0, 55.8, now.subtract(const Duration(hours: 1))),
    ];

    // ── Payments ──
    final payments = [
      _payment('pay_001', 'cust_nam_01', 'ord_002', 500000, 'BANK_TRANSFER', 'CK-20260901-001', now.subtract(const Duration(days: 10))),
      _payment('pay_002', 'cust_nam_01', 'ord_002', 490000, 'BANK_TRANSFER', 'CK-20260903-002', now.subtract(const Duration(days: 8))),
      _payment('pay_003', 'cust_nam_01', 'ord_001', 500000, 'QR', 'QR-20260905-003', now.subtract(const Duration(days: 5))),
      _payment('pay_004', 'cust_nam_02', 'ord_004', 560000, 'CASH', 'TM-20260901-004', now.subtract(const Duration(days: 7))),
      _payment('pay_005', 'cust_nam_03', 'ord_005', 1000000, 'BANK_TRANSFER', 'CK-20260905-005', now.subtract(const Duration(days: 3))),
    ];

    // ── Notifications ──
    final notifications = [
      _notif('ntf_001', 'cust_nam_01', 'ORDER_CONFIRMED', 'Đơn hàng ORD-2026-00001 đã xác nhận', now.subtract(const Duration(days: 5))),
      _notif('ntf_002', 'cust_nam_01', 'ORDER_SHIPPED', 'Đơn hàng ORD-2026-00002 đã giao vận', now.subtract(const Duration(days: 2))),
      _notif('ntf_003', 'cust_nam_02', 'ETA_CHANGED', 'ETA đơn ORD-2026-00005 cập nhật: +2 giờ', now.subtract(const Duration(hours: 1))),
    ];

    // ── Audit Logs ──
    final auditLogs = [
      _audit('audit_001', 'admin', 'ORDER_CREATED', 'ORDER', 'ord_001', null, 'DRAFT', now.subtract(const Duration(days: 5))),
      _audit('audit_002', 'admin', 'ORDER_STATUS_CHANGED', 'ORDER', 'ord_001', 'DRAFT', 'CONFIRMED', now.subtract(const Duration(days: 5))),
      _audit('audit_003', 'driver01', 'TRIP_DEPARTED', 'TRIP', 'trip_001', null, 'IN_TRANSIT', now.subtract(const Duration(hours: 5))),
    ];

    await isar.writeTxn(() async {
      await isar.userLocals.putAll(users);
      await isar.employeeLocals.putAll(employees);
      await isar.driverLocals.putAll(drivers);
      await isar.customerLocals.putAll(customers);
      await isar.vehicleLocals.putAll(vehicles);
      await isar.orderLocals.putAll([order1, order2, order3, order4, order5, order6]);
      await isar.orderItemLocals.putAll(orderItems);
      await isar.tripLocals.putAll([trip1, trip2, trip3]);
      await isar.tripOrderLocals.putAll(tripOrders);
      await isar.shipmentLocals.putAll(shipments);
      await isar.locationLocals.putAll(locations);
      await isar.paymentLocals.putAll(payments);
      await isar.notificationLocals.putAll(notifications);
      await isar.auditLogLocals.putAll(auditLogs);
    });
  }

  // ── Helper constructors ──

  static UserLocal _user(String id, String username, String role, DateTime now) => UserLocal()
    ..userId = id
    ..username = username
    ..role = role
    ..status = 'ACTIVE'
    ..createdAt = now;

  static EmployeeLocal _emp(String id, String code, String name, String role, DateTime now) => EmployeeLocal()
    ..employeeId = id
    ..employeeCode = code
    ..name = name
    ..department = role == 'ADMIN' ? 'Quản lý' : 'Vận hành'
    ..status = 'ACTIVE'
    ..createdAt = now;

  static DriverLocal _driver(String id, String code, String name, String license, String status, String userId, DateTime now) => DriverLocal()
    ..driverId = id
    ..driverCode = code
    ..name = name
    ..licenseNumber = license
    ..licenseExpiry = now.add(const Duration(days: 365 * 3))
    ..status = status
    ..userId = userId
    ..createdAt = now;

  static CustomerLocal _customer(String id, String code, String name, String phone, String addr, double credit, DateTime now) => CustomerLocal()
    ..customerId = id
    ..customerCode = code
    ..name = name
    ..phone = phone
    ..address = addr
    ..status = 'ACTIVE'
    ..creditLimit = credit
    ..createdAt = now;

  static VehicleLocal _vehicle(String id, String code, String plate, String type, double capW, double capV, String status, DateTime now) => VehicleLocal()
    ..vehicleId = id
    ..vehicleCode = code
    ..plateNumber = plate
    ..vehicleType = type
    ..capacityWeight = capW
    ..capacityVolume = capV
    ..status = status
    ..createdAt = now;

  static OrderLocal _order(String id, String code, String customerId, String status, String currency, double exRate,
      double subtotal, double ship, double service, double total, double paid, double debt, DateTime now) => OrderLocal()
    ..orderId = id
    ..orderCode = code
    ..customerId = customerId
    ..status = status
    ..sourceCountry = 'CN'
    ..destinationCountry = 'VN'
    ..currency = currency
    ..exchangeRate = exRate
    ..subtotal = subtotal
    ..shippingFee = ship
    ..serviceFee = service
    ..totalAmount = total
    ..paidAmount = paid
    ..debtAmount = debt
    ..createdBy = 'admin'
    ..createdAt = now;

  static OrderItemLocal _orderItem(String id, String orderId, String name, String sku, double qty, double unitPrice,
      String currency, double amount, double weight, double volume) => OrderItemLocal()
    ..orderItemId = id
    ..orderId = orderId
    ..productName = name
    ..sku = sku
    ..quantity = qty
    ..unitPrice = unitPrice
    ..currency = currency
    ..amount = amount
    ..weight = weight
    ..volume = volume;

  static TripLocal _trip(String id, String code, String vehicleId, String driverId, String origin, String dest,
      String status, DateTime plannedDep, DateTime plannedArr) => TripLocal()
    ..tripId = id
    ..tripCode = code
    ..vehicleId = vehicleId
    ..driverId = driverId
    ..origin = origin
    ..destination = dest
    ..status = status
    ..plannedDeparture = plannedDep
    ..plannedArrival = plannedArr;

  static TripOrderLocal _tripOrder(String tripId, String orderId) => TripOrderLocal()
    ..tripId = tripId
    ..orderId = orderId
    ..createdAt = DateTime.now();

  static ShipmentLocal _shipment(String id, String orderId, String tracking, String origin, String dest,
      String carrier, String tripId, String status, DateTime estDep, DateTime estArr) => ShipmentLocal()
    ..shipmentId = id
    ..orderId = orderId
    ..trackingNumber = tracking
    ..origin = origin
    ..destination = dest
    ..carrier = carrier
    ..tripId = tripId
    ..status = status
    ..estimatedDeparture = estDep
    ..estimatedArrival = estArr
    ..createdAt = DateTime.now();

  static LocationLocal _location(String id, String tripId, String vehicleId, String driverId,
      double lat, double lng, double accuracy, double speed, DateTime recordedAt) => LocationLocal()
    ..locationId = id
    ..tripId = tripId
    ..vehicleId = vehicleId
    ..driverId = driverId
    ..latitude = lat
    ..longitude = lng
    ..accuracy = accuracy
    ..speed = speed
    ..recordedAt = recordedAt;

  static PaymentLocal _payment(String id, String customerId, String? orderId, double amount, String method,
      String ref, DateTime paidAt) => PaymentLocal()
    ..paymentId = id
    ..customerId = customerId
    ..orderId = orderId
    ..amount = amount
    ..method = method
    ..reference = ref
    ..paidAt = paidAt
    ..createdBy = 'admin'
    ..createdAt = paidAt;

  static NotificationLocal _notif(String id, String customerId, String type, String title, DateTime now) => NotificationLocal()
    ..notificationId = id
    ..customerId = customerId
    ..type = type
    ..title = title
    ..isRead = false
    ..createdAt = now;

  static AuditLogLocal _audit(String id, String userId, String action, String entity, String entityId,
      String? oldVal, String? newVal, DateTime now) => AuditLogLocal()
    ..auditId = id
    ..userId = userId
    ..action = action
    ..entity = entity
    ..entityId = entityId
    ..oldValue = oldVal
    ..newValue = newVal
    ..createdAt = now;
}
