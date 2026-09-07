import 'dart:convert';
import 'dart:math';
import 'package:isar/isar.dart';

import '../models/order_local.dart';
import '../models/order_item_local.dart';
import '../models/customer_local.dart';
import '../models/vehicle_local.dart';
import '../models/trip_local.dart';
import '../models/shipment_local.dart';
import '../models/location_local.dart';
import '../models/sync_task.dart';
import '../models/payment_local.dart';
import '../models/user_local.dart';
import '../models/employee_local.dart';
import '../models/driver_local.dart';
import '../models/notification_local.dart';
import '../models/audit_log_local.dart';
import '../models/incident_local.dart';
import '../models/trip_order_local.dart';
import '../models/sync_cursor.dart';
import '../models/app_setting.dart';
import 'order_tq_seed_data.dart';

/// Interface cho sync API. Test dùng mock.
abstract class SyncApiClient {
  Future<Map<String, dynamic>> push({
    required String deviceId,
    required List<Map<String, dynamic>> operations,
  });
  Future<Map<String, dynamic>> pull({
    required String deviceId,
    String? lastCursor,
  });
}

/// Simple in-memory mock cho tests.
class MockSyncApiClient implements SyncApiClient {
  @override
  Future<Map<String, dynamic>> push({
    required String deviceId,
    required List<Map<String, dynamic>> operations,
  }) async => {'status': 'ok', 'processed': operations.length};

  @override
  Future<Map<String, dynamic>> pull({
    required String deviceId,
    String? lastCursor,
  }) async => {'status': 'ok', 'updates': <dynamic>[]};
}

/// GPS thresholds (configurable via AppSetting).
class GpsThresholds {
  final double maxSpeed;      // km/h
  final double jumpDistanceKm; // km within 1 min
  final int lostMinutes;      // no GPS for X min
  final int delayedSeconds;   // timestamp too old
  final int duplicateSeconds; // same location within X sec

  const GpsThresholds({
    this.maxSpeed = 120,
    this.jumpDistanceKm = 50,
    this.lostMinutes = 10,
    this.delayedSeconds = 300,
    this.duplicateSeconds = 3,
  });
}

/// Order status transitions allowed per spec.
const Map<String, List<String>> orderStatusTransitions = {
  'DRAFT': ['PENDING_CONFIRM'],
  'PENDING_CONFIRM': ['CONFIRMED', 'CANCELLED'],
  'CONFIRMED': ['PROCESSING', 'CANCELLED'],
  'PROCESSING': ['READY_TO_SHIP', 'CANCELLED'],
  'READY_TO_SHIP': ['SHIPPED'],
  'SHIPPED': ['IN_TRANSIT'],
  'IN_TRANSIT': ['CUSTOMS_HOLD', 'DELIVERED', 'LOST', 'DAMAGED'],
  'CUSTOMS_HOLD': ['IN_TRANSIT', 'DELIVERED'],
  'DELIVERED': ['COMPLETED'],
  'COMPLETED': ['RETURNED'],
};

class OrderTQIsarService {
  late Future<Isar> db;
  final SyncApiClient _syncClient;
  final String _deviceId;

  OrderTQIsarService({
    SyncApiClient? syncClient,
    String? deviceId,
    Isar? isar,
  })  : _syncClient = syncClient ?? MockSyncApiClient(),
        _deviceId = deviceId ?? 'device_001' {
    if (isar != null) {
      db = Future.value(isar);
    } else {
      db = Isar.open(
        [
          OrderLocalSchema,
          OrderItemLocalSchema,
          CustomerLocalSchema,
          VehicleLocalSchema,
          TripLocalSchema,
          ShipmentLocalSchema,
          LocationLocalSchema,
          SyncTaskSchema,
          PaymentLocalSchema,
          UserLocalSchema,
          DriverLocalSchema,
          EmployeeLocalSchema,
          NotificationLocalSchema,
          AuditLogLocalSchema,
          IncidentLocalSchema,
          TripOrderLocalSchema,
          SyncCursorSchema,
          AppSettingSchema,
        ],
        directory: '.',
        name: 'kanposvnordertq',
      );
    }
  }

  // ──────────────── RBAC ────────────────
  bool hasPermission(String role, String action) {
    const perms = {
      'ADMIN': {
        'order.create', 'order.read', 'order.update', 'order.cancel',
        'order.delete', 'trip.create', 'trip.read', 'trip.update',
        'vehicle.create', 'vehicle.read', 'vehicle.update',
        'customer.create', 'customer.read', 'customer.update',
        'payment.create', 'payment.read',
        'shipment.create', 'shipment.read', 'shipment.update',
        'report.view', 'audit.read', 'incident.create', 'incident.read',
        'sync.push', 'sync.pull', 'setting.write',
      },
      'STAFF': {
        'order.create', 'order.read', 'order.update', 'order.cancel',
        'trip.read', 'vehicle.read', 'customer.create', 'customer.read',
        'payment.create', 'payment.read',
        'shipment.read', 'incident.create', 'incident.read',
      },
      'DRIVER': {
        'order.read', 'trip.read', 'trip.update',
        'vehicle.read', 'incident.create', 'incident.read',
      },
      'CUSTOMER': {
        'order.create', 'order.read',
        'payment.read', 'incident.read',
      },
    };
    return perms[role]?.contains(action) ?? false;
  }

  // ──────────────── SEED ────────────────
  Future<void> seedIfEmpty() async {
    final isar = await db;
    await OrderTQSeedData.seedIfEmpty(isar);
  }

  // ──────────────── ORDERS ────────────────
  Future<String> createOrder({
    required String customerId,
    required String createdBy,
    required String createdByRole,
    List<Map<String, dynamic>>? items,
    String sourceCountry = 'CN',
    String destinationCountry = 'VN',
    String currency = 'CNY',
    double exchangeRate = 3500,
    double? shippingFee,
    double? serviceFee,
    String? note,
  }) async {
    if (!hasPermission(createdByRole, 'order.create')) {
      throw StateError('FORBIDDEN: No permission to create order');
    }
    final isar = await db;
    final orderCount = await isar.orderLocals.count();
    final orderId = 'ord_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(9999).toString().padLeft(4, '0')}';
    final orderCode = 'ORD-${DateTime.now().year}-${(orderCount + 1).toString().padLeft(5, '0')}';
    final now = DateTime.now();

    double subtotal = 0;
    double totalWeight = 0;
    double totalVolume = 0;

    final orderItems = <OrderItemLocal>[];
    if (items != null) {
      for (int i = 0; i < items.length; i++) {
        final item = items[i];
        final amount = (item['unit_price'] as double) * (item['quantity'] as double);
        final oi = OrderItemLocal()
          ..orderItemId = '${orderId}_item_$i'
          ..orderId = orderId
          ..productName = item['product_name'] as String?
          ..sku = item['sku'] as String?
          ..quantity = item['quantity'] as double?
          ..unitPrice = item['unit_price'] as double?
          ..currency = currency
          ..amount = amount
          ..weight = item['weight'] as double?
          ..volume = item['volume'] as double?
          ..trackingNumberCn = item['tracking_number_cn'] as String?
          ..productUrl = item['product_url'] as String?
          ..note = item['note'] as String?
          ..createdAt = now
          ..updatedAt = now;
        orderItems.add(oi);
        subtotal += amount;
        totalWeight += (item['weight'] as double?) ?? 0;
        totalVolume += (item['volume'] as double?) ?? 0;
      }
    }

    final totalAmount = subtotal + (shippingFee ?? 0) + (serviceFee ?? 0);
    final order = OrderLocal()
      ..orderId = orderId
      ..orderCode = orderCode
      ..customerId = customerId
      ..status = 'DRAFT'
      ..sourceCountry = sourceCountry
      ..destinationCountry = destinationCountry
      ..currency = currency
      ..exchangeRate = exchangeRate
      ..subtotal = subtotal
      ..shippingFee = shippingFee
      ..serviceFee = serviceFee
      ..totalAmount = totalAmount
      ..paidAmount = 0
      ..debtAmount = totalAmount
      ..weight = totalWeight
      ..volume = totalVolume
      ..note = note
      ..createdBy = createdBy
      ..createdAt = now
      ..updatedAt = now
      ..syncedAt = null;

    await isar.writeTxn(() async {
      await isar.orderLocals.put(order);
      await isar.orderItemLocals.putAll(orderItems);
    });

    await _addAuditLog(isar, userId: createdBy, action: 'ORDER_CREATED', entity: 'ORDER', entityId: orderId, newValue: jsonEncode({'status': 'DRAFT'}));
    await _addNotification(isar, customerId: customerId, type: 'ORDER_CREATED', title: 'Đơn hàng mới', body: 'Đơn hàng $orderCode đã được tạo');
    await enqueueSync(isar, entity: 'Order', entityId: orderId, operation: 'CREATE', payload: jsonEncode({'orderId': orderId, 'orderCode': orderCode}));
    return orderId;
  }

  Future<void> changeOrderStatus(String orderId, String newStatus, {required String userId, required String role, String? note}) async {
    final isar = await db;
    final order = await isar.orderLocals.where().orderIdEqualTo(orderId).findFirst();
    if (order == null) throw StateError('Order $orderId not found');
    if (!hasPermission(role, 'order.update')) throw StateError('FORBIDDEN');

    final allowed = orderStatusTransitions[order.status];
    if (allowed == null || !allowed.contains(newStatus)) {
      throw StateError('Invalid transition: ${order.status} -> $newStatus');
    }

    final oldStatus = order.status!;
    order.status = newStatus;
    order.updatedAt = DateTime.now();
    order.syncedAt = null;

    await isar.writeTxn(() async {
      await isar.orderLocals.put(order);
    });

    await _addAuditLog(isar, userId: userId, action: 'ORDER_STATUS_CHANGED', entity: 'ORDER', entityId: orderId, oldValue: oldStatus, newValue: newStatus, note: note);
    final typeMap = {
      'CONFIRMED': ('ORDER_CONFIRMED', 'Đơn hàng đã xác nhận'),
      'SHIPPED': ('ORDER_SHIPPED', 'Đơn hàng đã giao vận'),
      'IN_TRANSIT': ('ORDER_IN_TRANSIT', 'Đơn hàng đang vận chuyển'),
      'DELIVERED': ('ORDER_DELIVERED', 'Đơn hàng đã giao hàng'),
      'COMPLETED': ('ORDER_COMPLETED', 'Đơn hàng hoàn thành'),
    };
    if (typeMap.containsKey(newStatus)) {
      final (type, msg) = typeMap[newStatus]!;
      await _addNotification(isar, customerId: order.customerId, type: type, title: msg, body: 'Đơn hàng ${order.orderCode} - trạng thái mới: $newStatus');
    }
    await enqueueSync(isar, entity: 'Order', entityId: orderId, operation: 'UPDATE', payload: jsonEncode({'status': newStatus}));
  }

  Future<OrderLocal?> getOrder(String orderId) async {
    final isar = await db;
    return isar.orderLocals.where().orderIdEqualTo(orderId).findFirst();
  }

  Future<List<OrderLocal>> getOrders({String? customerId, String? status}) async {
    final isar = await db;
    List<OrderLocal> orders;
    if (customerId != null) {
      orders = await isar.orderLocals.where().customerIdEqualTo(customerId).findAll();
    } else {
      orders = await isar.orderLocals.where().findAll();
    }
    if (status != null) {
      orders = orders.where((o) => o.status == status).toList();
    }
    return orders.where((o) => !o.isDeleted).toList();
  }

  Future<List<OrderItemLocal>> getOrderItems(String orderId) async {
    final isar = await db;
    return isar.orderItemLocals.where().orderIdEqualTo(orderId).findAll();
  }

  Future<void> cancelOrder(String orderId, {required String userId, required String role, String? reason}) async {
    await changeOrderStatus(orderId, 'CANCELLED', userId: userId, role: role, note: reason);
  }

  // ──────────────── CUSTOMERS ────────────────
  Future<String> addCustomer({
    required String customerCode,
    required String name,
    String? phone,
    String? email,
    String? address,
    double? creditLimit,
  }) async {
    final isar = await db;
    final customerId = 'cust_${DateTime.now().millisecondsSinceEpoch}';
    final now = DateTime.now();
    final customer = CustomerLocal()
      ..customerId = customerId
      ..customerCode = customerCode
      ..name = name
      ..phone = phone
      ..email = email
      ..address = address
      ..status = 'ACTIVE'
      ..creditLimit = creditLimit
      ..createdAt = now
      ..updatedAt = now;
    await isar.writeTxn(() async => await isar.customerLocals.put(customer));
    await enqueueSync(isar, entity: 'Customer', entityId: customerId, operation: 'CREATE');
    return customerId;
  }

  Future<CustomerLocal?> getCustomer(String customerId) async {
    final isar = await db;
    return isar.customerLocals.where().customerIdEqualTo(customerId).findFirst();
  }

  Future<List<CustomerLocal>> getCustomers({String? status}) async {
    final isar = await db;
    final list = await isar.customerLocals.where().findAll();
    if (status != null) return list.where((c) => c.status == status).toList();
    return list;
  }

  Future<Map<String, dynamic>> getCustomerDebt(String customerId) async {
    final isar = await db;
    final orders = await isar.orderLocals.where().customerIdEqualTo(customerId).findAll();
    double totalDebt = 0;
    double totalPaid = 0;
    double totalOrders = 0;
    for (final o in orders.where((o) => !o.isDeleted)) {
      totalDebt += o.debtAmount ?? 0;
      totalPaid += o.paidAmount ?? 0;
      totalOrders += o.totalAmount ?? 0;
    }
    return {
      'customer_id': customerId,
      'total_orders': totalOrders,
      'total_paid': totalPaid,
      'total_debt': totalDebt,
      'order_count': orders.where((o) => !o.isDeleted).length,
    };
  }

  // ──────────────── VEHICLES ────────────────
  Future<String> addVehicle({
    required String vehicleCode,
    String? plateNumber,
    String? vehicleType,
    double? capacityWeight,
    double? capacityVolume,
  }) async {
    if (vehicleCode.isEmpty) throw StateError('vehicleCode required');
    final isar = await db;
    final vid = 'veh_${DateTime.now().millisecondsSinceEpoch}';
    final now = DateTime.now();
    final v = VehicleLocal()
      ..vehicleId = vid
      ..vehicleCode = vehicleCode
      ..plateNumber = plateNumber
      ..vehicleType = vehicleType
      ..capacityWeight = capacityWeight
      ..capacityVolume = capacityVolume
      ..status = 'AVAILABLE'
      ..createdAt = now
      ..updatedAt = now;
    await isar.writeTxn(() async => await isar.vehicleLocals.put(v));
    return vid;
  }

  Future<List<VehicleLocal>> getVehicles({String? status}) async {
    final isar = await db;
    final list = await isar.vehicleLocals.where().findAll();
    if (status != null) return list.where((v) => v.status == status).toList();
    return list;
  }

  // ──────────────── TRIPS ────────────────
  Future<String> createTrip({
    required String vehicleId,
    required String driverId,
    String? origin,
    String? destination,
    DateTime? plannedDeparture,
    DateTime? plannedArrival,
    required String createdBy,
  }) async {
    final isar = await db;
    final tripId = 'trip_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(9999).toString().padLeft(4, '0')}';
    final now = DateTime.now();
    final tripCount = await isar.tripLocals.count();
    final trip = TripLocal()
      ..tripId = tripId
      ..tripCode = 'TRIP-${now.year}-${(tripCount + 1).toString().padLeft(5, '0')}'
      ..vehicleId = vehicleId
      ..driverId = driverId
      ..origin = origin
      ..destination = destination
      ..status = 'PLANNED'
      ..plannedDeparture = plannedDeparture
      ..plannedArrival = plannedArrival
      ..createdAt = now
      ..updatedAt = now;
    await isar.writeTxn(() async => await isar.tripLocals.put(trip));
    await _addAuditLog(isar, userId: createdBy, action: 'TRIP_CREATED', entity: 'TRIP', entityId: tripId);
    await enqueueSync(isar, entity: 'Trip', entityId: tripId, operation: 'CREATE');
    return tripId;
  }

  Future<void> assignOrderToTrip(String tripId, String orderId) async {
    final isar = await db;
    final link = TripOrderLocal()
      ..tripId = tripId
      ..orderId = orderId
      ..createdAt = DateTime.now();
    await isar.writeTxn(() async => await isar.tripOrderLocals.put(link));
    await enqueueSync(isar, entity: 'TripOrder', entityId: '${tripId}_$orderId', operation: 'CREATE');
  }

  Future<void> departTrip(String tripId, {required String userId, required String role}) async {
    final isar = await db;
    final trip = await isar.tripLocals.where().tripIdEqualTo(tripId).findFirst();
    if (trip == null) throw StateError('Trip $tripId not found');
    if (!hasPermission(role, 'trip.update')) throw StateError('FORBIDDEN');
    if (trip.status != 'PLANNED') throw StateError('Invalid status: ${trip.status}');
    trip.status = 'IN_TRANSIT';
    trip.actualDeparture = DateTime.now();
    trip.updatedAt = DateTime.now();
    trip.syncedAt = null;
    await isar.writeTxn(() async => await isar.tripLocals.put(trip));
    await _addAuditLog(isar, userId: userId, action: 'TRIP_DEPARTED', entity: 'TRIP', entityId: tripId);
    await enqueueSync(isar, entity: 'Trip', entityId: tripId, operation: 'UPDATE', payload: jsonEncode({'status': 'IN_TRANSIT'}));
  }

  Future<void> arriveTrip(String tripId, {required String userId, required String role}) async {
    final isar = await db;
    final trip = await isar.tripLocals.where().tripIdEqualTo(tripId).findFirst();
    if (trip == null) throw StateError('Trip $tripId not found');
    if (!hasPermission(role, 'trip.update')) throw StateError('FORBIDDEN');
    if (trip.status != 'IN_TRANSIT') throw StateError('Invalid status: ${trip.status}');
    trip.status = 'ARRIVED';
    trip.actualArrival = DateTime.now();
    trip.updatedAt = DateTime.now();
    trip.syncedAt = null;
    await isar.writeTxn(() async => await isar.tripLocals.put(trip));
    await _addAuditLog(isar, userId: userId, action: 'TRIP_ARRIVED', entity: 'TRIP', entityId: tripId);
    await enqueueSync(isar, entity: 'Trip', entityId: tripId, operation: 'UPDATE');
  }

  Future<void> completeTrip(String tripId, {required String userId, required String role}) async {
    final isar = await db;
    final trip = await isar.tripLocals.where().tripIdEqualTo(tripId).findFirst();
    if (trip == null) throw StateError('Trip $tripId not found');
    if (!hasPermission(role, 'trip.update')) throw StateError('FORBIDDEN');
    if (trip.status != 'ARRIVED') throw StateError('Invalid status: ${trip.status}');
    trip.status = 'COMPLETED';
    trip.updatedAt = DateTime.now();
    trip.syncedAt = null;
    await isar.writeTxn(() async => await isar.tripLocals.put(trip));
    await _addAuditLog(isar, userId: userId, action: 'TRIP_COMPLETED', entity: 'TRIP', entityId: tripId);
    await enqueueSync(isar, entity: 'Trip', entityId: tripId, operation: 'UPDATE');
  }

  Future<TripLocal?> getTrip(String tripId) async {
    final isar = await db;
    return isar.tripLocals.where().tripIdEqualTo(tripId).findFirst();
  }

  Future<List<TripLocal>> getTrips({String? status}) async {
    final isar = await db;
    final list = await isar.tripLocals.where().findAll();
    if (status != null) return list.where((t) => t.status == status).toList();
    return list;
  }

  Future<List<String>> getTripOrderIds(String tripId) async {
    final isar = await db;
    final links = await isar.tripOrderLocals.where().tripIdEqualTo(tripId).findAll();
    return links.where((l) => !l.isDeleted).map((l) => l.orderId).toList();
  }

  Future<Map<String, dynamic>> getTripPerformance(String tripId) async {
    final isar = await db;
    final trip = await isar.tripLocals.where().tripIdEqualTo(tripId).findFirst();
    if (trip == null) throw StateError('Trip $tripId not found');
    final plannedDuration = trip.plannedDeparture != null && trip.plannedArrival != null
        ? trip.plannedArrival!.difference(trip.plannedDeparture!).inMinutes
        : 0;
    final actualDuration = trip.actualDeparture != null && trip.actualArrival != null
        ? trip.actualArrival!.difference(trip.actualDeparture!).inMinutes
        : 0;
    final onTime = actualDuration > 0 && plannedDuration > 0 && actualDuration <= plannedDuration;
    final orderIds = await getTripOrderIds(tripId);
    return {
      'trip_id': tripId,
      'planned_duration_min': plannedDuration,
      'actual_duration_min': actualDuration,
      'on_time': onTime,
      'order_count': orderIds.length,
      'efficiency': plannedDuration > 0 ? (plannedDuration / actualDuration).clamp(0.0, 2.0) : 0.0,
    };
  }

  // ──────────────── GPS / LOCATION ────────────────
  Future<String> recordLocation({
    required String tripId,
    required String vehicleId,
    required String driverId,
    required double latitude,
    required double longitude,
    double? accuracy,
    double? speed,
    double? heading,
    double? batteryLevel,
    DateTime? recordedAt,
  }) async {
    final isar = await db;
    final now = DateTime.now();
    final timestamp = recordedAt ?? now;
    final locationId = 'loc_${timestamp.millisecondsSinceEpoch}_${Random().nextInt(9999).toString().padLeft(4, '0')}';

    final lastLoc = await isar.locationLocals
        .where()
        .filter()
        .vehicleIdEqualTo(vehicleId)
        .sortByRecordedAtDesc()
        .findFirst();

    final validation = _validateGps(lastLoc, latitude, longitude, timestamp, now, speed);
    if (validation != 'NORMAL') {
      final anomaly = LocationLocal()
        ..locationId = locationId
        ..tripId = tripId
        ..vehicleId = vehicleId
        ..driverId = driverId
        ..latitude = latitude
        ..longitude = longitude
        ..accuracy = accuracy
        ..speed = speed
        ..heading = heading
        ..batteryLevel = batteryLevel
        ..recordedAt = timestamp
        ..serverReceivedAt = now
        ..syncedAt = null;
      await isar.writeTxn(() async => await isar.locationLocals.put(anomaly));
      await _addAuditLog(isar, userId: driverId, action: 'GPS_$validation', entity: 'LOCATION', entityId: locationId, note: 'GPS $validation: $latitude,$longitude');
      await enqueueSync(isar, entity: 'Location', entityId: locationId, operation: 'CREATE');
      return locationId;
    }

    final loc = LocationLocal()
      ..locationId = locationId
      ..tripId = tripId
      ..vehicleId = vehicleId
      ..driverId = driverId
      ..latitude = latitude
      ..longitude = longitude
      ..accuracy = accuracy
      ..speed = speed
      ..heading = heading
      ..batteryLevel = batteryLevel
      ..recordedAt = timestamp
      ..serverReceivedAt = now
      ..syncedAt = null;
    await isar.writeTxn(() async => await isar.locationLocals.put(loc));
    await enqueueSync(isar, entity: 'Location', entityId: locationId, operation: 'CREATE');
    return locationId;
  }

  String _validateGps(LocationLocal? prev, double lat, double lng, DateTime ts, DateTime serverNow, double? speed) {
    if (serverNow.difference(ts).inSeconds > const GpsThresholds().delayedSeconds) return 'DELAYED';
    if (prev != null && prev.latitude != null && prev.longitude != null && prev.recordedAt != null) {
      final dSec = ts.difference(prev.recordedAt!).inSeconds;
      if (dSec <= const GpsThresholds().duplicateSeconds && prev.latitude == lat && prev.longitude == lng) return 'DUPLICATE';
    }
    if (prev != null && prev.latitude != null && prev.longitude != null && prev.recordedAt != null) {
      final dSec = ts.difference(prev.recordedAt!).inSeconds;
      if (dSec > 0) {
        final dist = _haversineKm(prev.latitude!, prev.longitude!, lat, lng);
        final speedKmH = dist / (dSec / 3600.0);
        if (dist > const GpsThresholds().jumpDistanceKm) return 'JUMP';
        if (speedKmH > const GpsThresholds().maxSpeed) return 'JUMP';
      }
    }
    return 'NORMAL';
  }

  static double _haversineKm(double lat1, double lon1, double lat2, double lon2) {
    const r = 6371.0;
    final dLat = _deg2rad(lat2 - lat1);
    final dLon = _deg2rad(lon2 - lon1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_deg2rad(lat1)) * cos(_deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    return r * 2 * atan2(sqrt(a), sqrt(1 - a));
  }

  static double _deg2rad(double deg) => deg * pi / 180;

  Future<List<LocationLocal>> getTrackHistory(String tripId) async {
    final isar = await db;
    return isar.locationLocals.where().tripIdEqualTo(tripId).sortByRecordedAt().findAll();
  }

  // ──────────────── SHIPMENTS ────────────────
  Future<String> createShipment({
    required String orderId,
    String? origin,
    String? destination,
    String? carrier,
    DateTime? estimatedDeparture,
    DateTime? estimatedArrival,
  }) async {
    final isar = await db;
    final shipmentCount = await isar.shipmentLocals.count();
    final shipmentId = 'shp_${DateTime.now().millisecondsSinceEpoch}';
    final trackingNumber = 'CN-${DateTime.now().year}-${(shipmentCount + 1).toString().padLeft(5, '0')}';
    final now = DateTime.now();
    final shp = ShipmentLocal()
      ..shipmentId = shipmentId
      ..orderId = orderId
      ..trackingNumber = trackingNumber
      ..origin = origin
      ..destination = destination
      ..carrier = carrier
      ..status = 'CREATED'
      ..estimatedDeparture = estimatedDeparture
      ..estimatedArrival = estimatedArrival
      ..createdAt = now
      ..updatedAt = now;
    await isar.writeTxn(() async => await isar.shipmentLocals.put(shp));
    await _addNotification(isar, orderId: orderId, type: 'SHIPMENT_CREATED', title: 'Vận đơn mới', body: 'Tracking: $trackingNumber');
    await enqueueSync(isar, entity: 'Shipment', entityId: shipmentId, operation: 'CREATE');
    return shipmentId;
  }

  Future<void> assignShipmentToTrip(String shipmentId, String tripId) async {
    final isar = await db;
    final shp = await isar.shipmentLocals.where().shipmentIdEqualTo(shipmentId).findFirst();
    if (shp == null) throw StateError('Shipment not found');
    shp.tripId = tripId;
    shp.status = 'ASSIGNED';
    shp.updatedAt = DateTime.now();
    shp.syncedAt = null;
    await isar.writeTxn(() async => await isar.shipmentLocals.put(shp));
    await enqueueSync(isar, entity: 'Shipment', entityId: shipmentId, operation: 'UPDATE');
  }

  // ──────────────── PAYMENTS ────────────────
  Future<String> addPayment({
    required String customerId,
    String? orderId,
    required double amount,
    required String method,
    String? reference,
    required String createdBy,
  }) async {
    final isar = await db;
    final paymentId = 'pay_${DateTime.now().millisecondsSinceEpoch}';
    final now = DateTime.now();
    final payment = PaymentLocal()
      ..paymentId = paymentId
      ..customerId = customerId
      ..orderId = orderId
      ..amount = amount
      ..method = method
      ..reference = reference
      ..paidAt = now
      ..createdBy = createdBy
      ..createdAt = now
      ..updatedAt = now;
    await isar.writeTxn(() async => await isar.paymentLocals.put(payment));
    if (orderId != null) {
      final order = await isar.orderLocals.where().orderIdEqualTo(orderId).findFirst();
      if (order != null) {
        order.paidAmount = (order.paidAmount ?? 0) + amount;
        order.debtAmount = (order.totalAmount ?? 0) - (order.paidAmount ?? 0);
        order.updatedAt = now;
        order.syncedAt = null;
        await isar.writeTxn(() async => await isar.orderLocals.put(order));
      }
    }
    await _addAuditLog(isar, userId: createdBy, action: 'PAYMENT_RECORDED', entity: 'PAYMENT', entityId: paymentId);
    await enqueueSync(isar, entity: 'Payment', entityId: paymentId, operation: 'CREATE');
    return paymentId;
  }

  Future<List<PaymentLocal>> getPayments({String? customerId, String? orderId}) async {
    final isar = await db;
    List<PaymentLocal> list = await isar.paymentLocals.where().findAll();
    if (customerId != null) list = list.where((p) => p.customerId == customerId).toList();
    if (orderId != null) list = list.where((p) => p.orderId == orderId).toList();
    return list;
  }

  // ──────────────── INCIDENTS ────────────────
  Future<String> reportIncident({
    required String? tripId,
    required String? orderId,
    required String type,
    required String severity,
    required String description,
    required String reportedBy,
  }) async {
    final isar = await db;
    final incidentId = 'inc_${DateTime.now().millisecondsSinceEpoch}';
    final now = DateTime.now();
    final inc = IncidentLocal()
      ..incidentId = incidentId
      ..tripId = tripId
      ..orderId = orderId
      ..type = type
      ..severity = severity
      ..description = description
      ..status = 'REPORTED'
      ..reportedAt = now
      ..reportedBy = reportedBy
      ..createdAt = now
      ..updatedAt = now;
    await isar.writeTxn(() async => await isar.incidentLocals.put(inc));
    await _addAuditLog(isar, userId: reportedBy, action: 'INCIDENT_REPORTED', entity: 'INCIDENT', entityId: incidentId);
    await enqueueSync(isar, entity: 'Incident', entityId: incidentId, operation: 'CREATE');
    return incidentId;
  }

  Future<List<IncidentLocal>> getIncidents({String? tripId}) async {
    final isar = await db;
    List<IncidentLocal> list = await isar.incidentLocals.where().findAll();
    if (tripId != null) list = list.where((i) => i.tripId == tripId).toList();
    return list;
  }

  // ──────────────── NOTIFICATIONS ────────────────
  Future<List<NotificationLocal>> listNotifications({String? customerId, String? userId, bool unreadOnly = false}) async {
    final isar = await db;
    List<NotificationLocal> list;
    if (customerId != null && customerId.isNotEmpty) {
      list = await isar.notificationLocals.where().customerIdEqualTo(customerId).findAll();
    } else if (userId != null && userId.isNotEmpty) {
      list = await isar.notificationLocals.where().userIdEqualTo(userId).findAll();
    } else {
      list = await isar.notificationLocals.where().findAll();
    }
    if (unreadOnly) list = list.where((n) => !n.isRead).toList();
    return list;
  }

  Future<int> markNotificationRead(String notificationId) async {
    final isar = await db;
    final n = await isar.notificationLocals.where().notificationIdEqualTo(notificationId).findFirst();
    if (n == null) return 0;
    n.isRead = true;
    await isar.writeTxn(() async => await isar.notificationLocals.put(n));
    return 1;
  }

  Future<int> markAllNotificationsRead({String? customerId}) async {
    final isar = await db;
    List<NotificationLocal> list;
    if (customerId != null) {
      list = await isar.notificationLocals.where().customerIdEqualTo(customerId).findAll();
    } else {
      list = await isar.notificationLocals.where().findAll();
    }
    final unread = list.where((n) => !n.isRead).toList();
    await isar.writeTxn(() async {
      for (final n in unread) {
        n.isRead = true;
        await isar.notificationLocals.put(n);
      }
    });
    return unread.length;
  }

  // ──────────────── AUDIT LOGS ────────────────
  Future<List<AuditLogLocal>> getAuditLogs({String? entity, String? entityId, String? userId}) async {
    final isar = await db;
    List<AuditLogLocal> list = await isar.auditLogLocals.where().findAll();
    if (entity != null) list = list.where((a) => a.entity == entity).toList();
    if (entityId != null) list = list.where((a) => a.entityId == entityId).toList();
    if (userId != null) list = list.where((a) => a.userId == userId).toList();
    return list;
  }

  // ──────────────── SYNC ────────────────
  Future<void> enqueueSync(Isar isar, {required String entity, required String entityId, required String operation, String? payload}) async {
    final task = SyncTask()
      ..entity = entity
      ..entityId = entityId
      ..operation = operation
      ..payload = payload
      ..createdAt = DateTime.now()
      ..status = 'PENDING';
    await isar.writeTxn(() async => await isar.syncTasks.put(task));
  }

  Future<List<SyncTask>> getPendingSyncTasks() async {
    final isar = await db;
    return isar.syncTasks.where().statusEqualTo('PENDING').findAll();
  }

  Future<void> pushSyncTasks() async {
    final isar = await db;
    final pending = await isar.syncTasks.where().statusEqualTo('PENDING').limit(100).findAll();
    if (pending.isEmpty) return;
    final ops = pending.map((t) => {
      'entity': t.entity,
      'entity_id': t.entityId,
      'operation': t.operation,
      'payload': t.payload,
    }).toList();
    try {
      await _syncClient.push(deviceId: _deviceId, operations: ops);
      await isar.writeTxn(() async {
        for (final t in pending) {
          t.status = 'SUCCESS';
          await isar.syncTasks.put(t);
        }
      });
    } catch (e) {
      await isar.writeTxn(() async {
        for (final t in pending) {
          t.status = 'FAILED';
          t.lastError = e.toString();
          t.retryCount += 1;
          await isar.syncTasks.put(t);
        }
      });
    }
  }

  Future<Map<String, dynamic>> pullUpdates() async {
    final isar = await db;
    final cursor = await isar.syncCursors.where().deviceIdEqualTo(_deviceId).findFirst();
    final lastCursor = cursor?.lastCursor;
    final result = await _syncClient.pull(deviceId: _deviceId, lastCursor: lastCursor);
    final now = DateTime.now();
    final c = cursor ?? SyncCursor()..deviceId = _deviceId;
    c.lastCursor = result['cursor'] as String? ?? lastCursor ?? now.toIso8601String();
    c.updatedAt = now;
    await isar.writeTxn(() async => await isar.syncCursors.put(c));
    return result;
  }

  // ──────────────── REPORTS ────────────────
  Future<Map<String, int>> getOrderStatsByStatus() async {
    final isar = await db;
    final orders = await isar.orderLocals.where().findAll();
    final Map<String, int> stats = {};
    for (final o in orders.where((o) => !o.isDeleted)) {
      stats[o.status ?? 'UNKNOWN'] = (stats[o.status ?? 'UNKNOWN'] ?? 0) + 1;
    }
    return stats;
  }

  // ──────────────── SETTINGS ────────────────
  Future<String?> getSetting(String key) async {
    final isar = await db;
    final s = await isar.appSettings.where().keyEqualTo(key).findFirst();
    return s?.value;
  }

  Future<void> setSetting(String key, String value) async {
    final isar = await db;
    final existing = await isar.appSettings.where().keyEqualTo(key).findFirst();
    final s = existing ?? AppSetting()..key = key;
    s.value = value;
    s.updatedAt = DateTime.now();
    await isar.writeTxn(() async => await isar.appSettings.put(s));
  }

  // ──────────────── HELPERS ────────────────
  Future<void> _addAuditLog(Isar isar, {
    required String userId,
    required String action,
    required String entity,
    required String entityId,
    String? oldValue,
    String? newValue,
    String? note,
  }) async {
    final log = AuditLogLocal()
      ..auditId = 'audit_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(9999).toString().padLeft(4, '0')}'
      ..userId = userId
      ..action = action
      ..entity = entity
      ..entityId = entityId
      ..oldValue = oldValue
      ..newValue = newValue
      ..note = note
      ..createdAt = DateTime.now();
    await isar.writeTxn(() async => await isar.auditLogLocals.put(log));
  }

  Future<void> _addNotification(Isar isar, {
    String? customerId,
    String? userId,
    String? orderId,
    required String type,
    required String title,
    String? body,
  }) async {
    final n = NotificationLocal()
      ..notificationId = 'ntf_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(9999).toString().padLeft(4, '0')}'
      ..customerId = customerId
      ..userId = userId
      ..type = type
      ..title = title
      ..body = body
      ..isRead = false
      ..createdAt = DateTime.now();
    await isar.writeTxn(() async => await isar.notificationLocals.put(n));
  }
}