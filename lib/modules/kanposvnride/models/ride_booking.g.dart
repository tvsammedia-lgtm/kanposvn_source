// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_booking.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideBookingCollection on Isar {
  IsarCollection<RideBooking> get rideBookings => this.collection();
}

const RideBookingSchema = CollectionSchema(
  name: r'RideBooking',
  id: -1846116325170251143,
  properties: {
    r'acceptedAt': PropertySchema(
      id: 0,
      name: r'acceptedAt',
      type: IsarType.dateTime,
    ),
    r'commission': PropertySchema(
      id: 1,
      name: r'commission',
      type: IsarType.double,
    ),
    r'completedAt': PropertySchema(
      id: 2,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'corporateUuid': PropertySchema(
      id: 3,
      name: r'corporateUuid',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'discount': PropertySchema(
      id: 5,
      name: r'discount',
      type: IsarType.double,
    ),
    r'distanceKm': PropertySchema(
      id: 6,
      name: r'distanceKm',
      type: IsarType.double,
    ),
    r'driverEarnings': PropertySchema(
      id: 7,
      name: r'driverEarnings',
      type: IsarType.double,
    ),
    r'driverUuid': PropertySchema(
      id: 8,
      name: r'driverUuid',
      type: IsarType.string,
    ),
    r'dropoffAddress': PropertySchema(
      id: 9,
      name: r'dropoffAddress',
      type: IsarType.string,
    ),
    r'dropoffLat': PropertySchema(
      id: 10,
      name: r'dropoffLat',
      type: IsarType.double,
    ),
    r'dropoffLng': PropertySchema(
      id: 11,
      name: r'dropoffLng',
      type: IsarType.double,
    ),
    r'estimatedPrice': PropertySchema(
      id: 12,
      name: r'estimatedPrice',
      type: IsarType.double,
    ),
    r'finalPrice': PropertySchema(
      id: 13,
      name: r'finalPrice',
      type: IsarType.double,
    ),
    r'isSharedRide': PropertySchema(
      id: 14,
      name: r'isSharedRide',
      type: IsarType.bool,
    ),
    r'passengerUuid': PropertySchema(
      id: 15,
      name: r'passengerUuid',
      type: IsarType.string,
    ),
    r'paymentMethod': PropertySchema(
      id: 16,
      name: r'paymentMethod',
      type: IsarType.string,
    ),
    r'paymentMethodCorp': PropertySchema(
      id: 17,
      name: r'paymentMethodCorp',
      type: IsarType.string,
    ),
    r'pickupAddress': PropertySchema(
      id: 18,
      name: r'pickupAddress',
      type: IsarType.string,
    ),
    r'pickupAt': PropertySchema(
      id: 19,
      name: r'pickupAt',
      type: IsarType.dateTime,
    ),
    r'pickupLat': PropertySchema(
      id: 20,
      name: r'pickupLat',
      type: IsarType.double,
    ),
    r'pickupLng': PropertySchema(
      id: 21,
      name: r'pickupLng',
      type: IsarType.double,
    ),
    r'promotionCode': PropertySchema(
      id: 22,
      name: r'promotionCode',
      type: IsarType.string,
    ),
    r'requestedVehicleType': PropertySchema(
      id: 23,
      name: r'requestedVehicleType',
      type: IsarType.byte,
      enumMap: _RideBookingrequestedVehicleTypeEnumValueMap,
    ),
    r'sharedGroupUuid': PropertySchema(
      id: 24,
      name: r'sharedGroupUuid',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 25,
      name: r'status',
      type: IsarType.byte,
      enumMap: _RideBookingstatusEnumValueMap,
    ),
    r'surcharge': PropertySchema(
      id: 26,
      name: r'surcharge',
      type: IsarType.double,
    ),
    r'surgeMultiplier': PropertySchema(
      id: 27,
      name: r'surgeMultiplier',
      type: IsarType.double,
    ),
    r'syncStatus': PropertySchema(
      id: 28,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _RideBookingsyncStatusEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 29,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 30,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _rideBookingEstimateSize,
  serialize: _rideBookingSerialize,
  deserialize: _rideBookingDeserialize,
  deserializeProp: _rideBookingDeserializeProp,
  idName: r'id',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'passengerUuid': IndexSchema(
      id: -1636725924250270831,
      name: r'passengerUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'passengerUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'driverUuid': IndexSchema(
      id: 3863677328561972722,
      name: r'driverUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'driverUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _rideBookingGetId,
  getLinks: _rideBookingGetLinks,
  attach: _rideBookingAttach,
  version: '3.1.0+1',
);

int _rideBookingEstimateSize(
  RideBooking object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.corporateUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.driverUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dropoffAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.passengerUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.paymentMethod.length * 3;
  bytesCount += 3 + object.paymentMethodCorp.length * 3;
  {
    final value = object.pickupAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.promotionCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sharedGroupUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _rideBookingSerialize(
  RideBooking object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.acceptedAt);
  writer.writeDouble(offsets[1], object.commission);
  writer.writeDateTime(offsets[2], object.completedAt);
  writer.writeString(offsets[3], object.corporateUuid);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeDouble(offsets[5], object.discount);
  writer.writeDouble(offsets[6], object.distanceKm);
  writer.writeDouble(offsets[7], object.driverEarnings);
  writer.writeString(offsets[8], object.driverUuid);
  writer.writeString(offsets[9], object.dropoffAddress);
  writer.writeDouble(offsets[10], object.dropoffLat);
  writer.writeDouble(offsets[11], object.dropoffLng);
  writer.writeDouble(offsets[12], object.estimatedPrice);
  writer.writeDouble(offsets[13], object.finalPrice);
  writer.writeBool(offsets[14], object.isSharedRide);
  writer.writeString(offsets[15], object.passengerUuid);
  writer.writeString(offsets[16], object.paymentMethod);
  writer.writeString(offsets[17], object.paymentMethodCorp);
  writer.writeString(offsets[18], object.pickupAddress);
  writer.writeDateTime(offsets[19], object.pickupAt);
  writer.writeDouble(offsets[20], object.pickupLat);
  writer.writeDouble(offsets[21], object.pickupLng);
  writer.writeString(offsets[22], object.promotionCode);
  writer.writeByte(offsets[23], object.requestedVehicleType.index);
  writer.writeString(offsets[24], object.sharedGroupUuid);
  writer.writeByte(offsets[25], object.status.index);
  writer.writeDouble(offsets[26], object.surcharge);
  writer.writeDouble(offsets[27], object.surgeMultiplier);
  writer.writeByte(offsets[28], object.syncStatus.index);
  writer.writeDateTime(offsets[29], object.updatedAt);
  writer.writeString(offsets[30], object.uuid);
}

RideBooking _rideBookingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideBooking();
  object.acceptedAt = reader.readDateTimeOrNull(offsets[0]);
  object.commission = reader.readDouble(offsets[1]);
  object.completedAt = reader.readDateTimeOrNull(offsets[2]);
  object.corporateUuid = reader.readStringOrNull(offsets[3]);
  object.createdAt = reader.readDateTimeOrNull(offsets[4]);
  object.discount = reader.readDouble(offsets[5]);
  object.distanceKm = reader.readDouble(offsets[6]);
  object.driverEarnings = reader.readDouble(offsets[7]);
  object.driverUuid = reader.readStringOrNull(offsets[8]);
  object.dropoffAddress = reader.readStringOrNull(offsets[9]);
  object.dropoffLat = reader.readDoubleOrNull(offsets[10]);
  object.dropoffLng = reader.readDoubleOrNull(offsets[11]);
  object.estimatedPrice = reader.readDouble(offsets[12]);
  object.finalPrice = reader.readDouble(offsets[13]);
  object.id = id;
  object.isSharedRide = reader.readBool(offsets[14]);
  object.passengerUuid = reader.readStringOrNull(offsets[15]);
  object.paymentMethod = reader.readString(offsets[16]);
  object.paymentMethodCorp = reader.readString(offsets[17]);
  object.pickupAddress = reader.readStringOrNull(offsets[18]);
  object.pickupAt = reader.readDateTimeOrNull(offsets[19]);
  object.pickupLat = reader.readDoubleOrNull(offsets[20]);
  object.pickupLng = reader.readDoubleOrNull(offsets[21]);
  object.promotionCode = reader.readStringOrNull(offsets[22]);
  object.requestedVehicleType = _RideBookingrequestedVehicleTypeValueEnumMap[
          reader.readByteOrNull(offsets[23])] ??
      VehicleType.motorBike;
  object.sharedGroupUuid = reader.readStringOrNull(offsets[24]);
  object.status =
      _RideBookingstatusValueEnumMap[reader.readByteOrNull(offsets[25])] ??
          BookingStatus.findingDriver;
  object.surcharge = reader.readDouble(offsets[26]);
  object.surgeMultiplier = reader.readDouble(offsets[27]);
  object.syncStatus =
      _RideBookingsyncStatusValueEnumMap[reader.readByteOrNull(offsets[28])] ??
          SyncStatus.synced;
  object.updatedAt = reader.readDateTimeOrNull(offsets[29]);
  object.uuid = reader.readStringOrNull(offsets[30]);
  return object;
}

P _rideBookingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    case 21:
      return (reader.readDoubleOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (_RideBookingrequestedVehicleTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          VehicleType.motorBike) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (_RideBookingstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          BookingStatus.findingDriver) as P;
    case 26:
      return (reader.readDouble(offset)) as P;
    case 27:
      return (reader.readDouble(offset)) as P;
    case 28:
      return (_RideBookingsyncStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.synced) as P;
    case 29:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RideBookingrequestedVehicleTypeEnumValueMap = {
  'motorBike': 0,
  'evBike': 1,
  'car4Seats': 2,
  'car7Seats': 3,
  'delivery': 4,
};
const _RideBookingrequestedVehicleTypeValueEnumMap = {
  0: VehicleType.motorBike,
  1: VehicleType.evBike,
  2: VehicleType.car4Seats,
  3: VehicleType.car7Seats,
  4: VehicleType.delivery,
};
const _RideBookingstatusEnumValueMap = {
  'findingDriver': 0,
  'accepted': 1,
  'arrived': 2,
  'inProgress': 3,
  'completed': 4,
  'cancelled': 5,
};
const _RideBookingstatusValueEnumMap = {
  0: BookingStatus.findingDriver,
  1: BookingStatus.accepted,
  2: BookingStatus.arrived,
  3: BookingStatus.inProgress,
  4: BookingStatus.completed,
  5: BookingStatus.cancelled,
};
const _RideBookingsyncStatusEnumValueMap = {
  'synced': 0,
  'pending': 1,
  'failed': 2,
};
const _RideBookingsyncStatusValueEnumMap = {
  0: SyncStatus.synced,
  1: SyncStatus.pending,
  2: SyncStatus.failed,
};

Id _rideBookingGetId(RideBooking object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideBookingGetLinks(RideBooking object) {
  return [];
}

void _rideBookingAttach(
    IsarCollection<dynamic> col, Id id, RideBooking object) {
  object.id = id;
}

extension RideBookingByIndex on IsarCollection<RideBooking> {
  Future<RideBooking?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  RideBooking? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<RideBooking?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<RideBooking?> getAllByUuidSync(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uuid', values);
  }

  Future<int> deleteAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uuid', values);
  }

  int deleteAllByUuidSync(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uuid', values);
  }

  Future<Id> putByUuid(RideBooking object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(RideBooking object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<RideBooking> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<RideBooking> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension RideBookingQueryWhereSort
    on QueryBuilder<RideBooking, RideBooking, QWhere> {
  QueryBuilder<RideBooking, RideBooking, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RideBookingQueryWhere
    on QueryBuilder<RideBooking, RideBooking, QWhereClause> {
  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause> uuidNotEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause>
      passengerUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'passengerUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause>
      passengerUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'passengerUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause>
      passengerUuidEqualTo(String? passengerUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'passengerUuid',
        value: [passengerUuid],
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause>
      passengerUuidNotEqualTo(String? passengerUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passengerUuid',
              lower: [],
              upper: [passengerUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passengerUuid',
              lower: [passengerUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passengerUuid',
              lower: [passengerUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passengerUuid',
              lower: [],
              upper: [passengerUuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause> driverUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'driverUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause>
      driverUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'driverUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause> driverUuidEqualTo(
      String? driverUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'driverUuid',
        value: [driverUuid],
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterWhereClause>
      driverUuidNotEqualTo(String? driverUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverUuid',
              lower: [],
              upper: [driverUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverUuid',
              lower: [driverUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverUuid',
              lower: [driverUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverUuid',
              lower: [],
              upper: [driverUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RideBookingQueryFilter
    on QueryBuilder<RideBooking, RideBooking, QFilterCondition> {
  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      acceptedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'acceptedAt',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      acceptedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'acceptedAt',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      acceptedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'acceptedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      acceptedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'acceptedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      acceptedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'acceptedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      acceptedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'acceptedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      commissionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      commissionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      commissionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      commissionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commission',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      completedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      completedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'corporateUuid',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'corporateUuid',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'corporateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'corporateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'corporateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'corporateUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'corporateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'corporateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'corporateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'corporateUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'corporateUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      corporateUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'corporateUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> discountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      discountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      discountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> discountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      distanceKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      distanceKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'distanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      distanceKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'distanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      distanceKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'distanceKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverEarningsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverEarnings',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverEarningsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverEarnings',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverEarningsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverEarnings',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverEarningsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverEarnings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverUuid',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverUuid',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      driverUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dropoffAddress',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dropoffAddress',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dropoffAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dropoffAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dropoffAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dropoffAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dropoffLat',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dropoffLat',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dropoffLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dropoffLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dropoffLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dropoffLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dropoffLng',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dropoffLng',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dropoffLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dropoffLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dropoffLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      dropoffLngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dropoffLng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      estimatedPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      estimatedPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      estimatedPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      estimatedPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      finalPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      finalPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      finalPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      finalPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      isSharedRideEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSharedRide',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'passengerUuid',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'passengerUuid',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passengerUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passengerUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passengerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      passengerUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passengerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodCorpEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethodCorp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodCorpGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethodCorp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodCorpLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethodCorp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodCorpBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethodCorp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodCorpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentMethodCorp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodCorpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentMethodCorp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodCorpContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentMethodCorp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodCorpMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentMethodCorp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodCorpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethodCorp',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      paymentMethodCorpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentMethodCorp',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickupAddress',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickupAddress',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickupAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pickupAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pickupAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickupAt',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickupAt',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> pickupAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickupAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickupAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> pickupAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickupAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickupLat',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickupLat',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickupLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickupLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickupLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickupLng',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickupLng',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickupLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickupLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      pickupLngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickupLng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promotionCode',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promotionCode',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promotionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promotionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promotionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promotionCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'promotionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'promotionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'promotionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'promotionCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promotionCode',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      promotionCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'promotionCode',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      requestedVehicleTypeEqualTo(VehicleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requestedVehicleType',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      requestedVehicleTypeGreaterThan(
    VehicleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'requestedVehicleType',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      requestedVehicleTypeLessThan(
    VehicleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'requestedVehicleType',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      requestedVehicleTypeBetween(
    VehicleType lower,
    VehicleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'requestedVehicleType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sharedGroupUuid',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sharedGroupUuid',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sharedGroupUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sharedGroupUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sharedGroupUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sharedGroupUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sharedGroupUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sharedGroupUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sharedGroupUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sharedGroupUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sharedGroupUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      sharedGroupUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sharedGroupUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> statusEqualTo(
      BookingStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      statusGreaterThan(
    BookingStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> statusLessThan(
    BookingStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> statusBetween(
    BookingStatus lower,
    BookingStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      surchargeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surcharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      surchargeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surcharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      surchargeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surcharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      surchargeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surcharge',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      surgeMultiplierEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surgeMultiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      surgeMultiplierGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surgeMultiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      surgeMultiplierLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surgeMultiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      surgeMultiplierBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surgeMultiplier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      syncStatusGreaterThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      syncStatusLessThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      syncStatusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> uuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> uuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> uuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> uuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> uuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension RideBookingQueryObject
    on QueryBuilder<RideBooking, RideBooking, QFilterCondition> {}

extension RideBookingQueryLinks
    on QueryBuilder<RideBooking, RideBooking, QFilterCondition> {}

extension RideBookingQuerySortBy
    on QueryBuilder<RideBooking, RideBooking, QSortBy> {
  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByAcceptedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedAt', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByAcceptedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedAt', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByCorporateUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corporateUuid', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByCorporateUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corporateUuid', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDriverEarnings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverEarnings', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByDriverEarningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverEarnings', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDropoffAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByDropoffAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDropoffLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDropoffLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDropoffLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByDropoffLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByEstimatedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByFinalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByFinalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByIsSharedRide() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharedRide', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByIsSharedRideDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharedRide', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByPassengerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerUuid', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByPassengerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerUuid', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByPaymentMethodCorp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethodCorp', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByPaymentMethodCorpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethodCorp', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByPickupAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByPickupAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByPickupAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAt', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByPickupAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAt', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByPickupLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByPickupLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByPickupLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByPickupLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByPromotionCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionCode', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByPromotionCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionCode', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByRequestedVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedVehicleType', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortByRequestedVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedVehicleType', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortBySharedGroupUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedGroupUuid', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortBySharedGroupUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedGroupUuid', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortBySurcharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surcharge', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortBySurchargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surcharge', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortBySurgeMultiplier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surgeMultiplier', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      sortBySurgeMultiplierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surgeMultiplier', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension RideBookingQuerySortThenBy
    on QueryBuilder<RideBooking, RideBooking, QSortThenBy> {
  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByAcceptedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedAt', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByAcceptedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedAt', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByCorporateUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corporateUuid', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByCorporateUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corporateUuid', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDriverEarnings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverEarnings', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByDriverEarningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverEarnings', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDropoffAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByDropoffAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDropoffLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDropoffLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDropoffLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByDropoffLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByEstimatedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByFinalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByFinalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByIsSharedRide() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharedRide', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByIsSharedRideDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharedRide', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByPassengerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerUuid', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByPassengerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerUuid', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByPaymentMethodCorp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethodCorp', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByPaymentMethodCorpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethodCorp', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByPickupAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByPickupAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByPickupAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAt', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByPickupAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAt', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByPickupLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByPickupLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByPickupLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByPickupLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByPromotionCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionCode', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByPromotionCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionCode', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByRequestedVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedVehicleType', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenByRequestedVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedVehicleType', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenBySharedGroupUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedGroupUuid', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenBySharedGroupUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedGroupUuid', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenBySurcharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surcharge', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenBySurchargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surcharge', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenBySurgeMultiplier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surgeMultiplier', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy>
      thenBySurgeMultiplierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surgeMultiplier', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension RideBookingQueryWhereDistinct
    on QueryBuilder<RideBooking, RideBooking, QDistinct> {
  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByAcceptedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'acceptedAt');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commission');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByCorporateUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'corporateUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discount');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceKm');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByDriverEarnings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverEarnings');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByDriverUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByDropoffAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dropoffAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByDropoffLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dropoffLat');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByDropoffLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dropoffLng');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedPrice');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByFinalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalPrice');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByIsSharedRide() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSharedRide');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByPassengerUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passengerUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByPaymentMethod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByPaymentMethodCorp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethodCorp',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByPickupAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByPickupAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupAt');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByPickupLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupLat');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByPickupLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupLng');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByPromotionCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promotionCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct>
      distinctByRequestedVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requestedVehicleType');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctBySharedGroupUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sharedGroupUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctBySurcharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surcharge');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct>
      distinctBySurgeMultiplier() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surgeMultiplier');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<RideBooking, RideBooking, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension RideBookingQueryProperty
    on QueryBuilder<RideBooking, RideBooking, QQueryProperty> {
  QueryBuilder<RideBooking, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideBooking, DateTime?, QQueryOperations> acceptedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'acceptedAt');
    });
  }

  QueryBuilder<RideBooking, double, QQueryOperations> commissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commission');
    });
  }

  QueryBuilder<RideBooking, DateTime?, QQueryOperations> completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<RideBooking, String?, QQueryOperations> corporateUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'corporateUuid');
    });
  }

  QueryBuilder<RideBooking, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RideBooking, double, QQueryOperations> discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discount');
    });
  }

  QueryBuilder<RideBooking, double, QQueryOperations> distanceKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceKm');
    });
  }

  QueryBuilder<RideBooking, double, QQueryOperations> driverEarningsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverEarnings');
    });
  }

  QueryBuilder<RideBooking, String?, QQueryOperations> driverUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverUuid');
    });
  }

  QueryBuilder<RideBooking, String?, QQueryOperations>
      dropoffAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dropoffAddress');
    });
  }

  QueryBuilder<RideBooking, double?, QQueryOperations> dropoffLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dropoffLat');
    });
  }

  QueryBuilder<RideBooking, double?, QQueryOperations> dropoffLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dropoffLng');
    });
  }

  QueryBuilder<RideBooking, double, QQueryOperations> estimatedPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedPrice');
    });
  }

  QueryBuilder<RideBooking, double, QQueryOperations> finalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalPrice');
    });
  }

  QueryBuilder<RideBooking, bool, QQueryOperations> isSharedRideProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSharedRide');
    });
  }

  QueryBuilder<RideBooking, String?, QQueryOperations> passengerUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passengerUuid');
    });
  }

  QueryBuilder<RideBooking, String, QQueryOperations> paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<RideBooking, String, QQueryOperations>
      paymentMethodCorpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethodCorp');
    });
  }

  QueryBuilder<RideBooking, String?, QQueryOperations> pickupAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupAddress');
    });
  }

  QueryBuilder<RideBooking, DateTime?, QQueryOperations> pickupAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupAt');
    });
  }

  QueryBuilder<RideBooking, double?, QQueryOperations> pickupLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupLat');
    });
  }

  QueryBuilder<RideBooking, double?, QQueryOperations> pickupLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupLng');
    });
  }

  QueryBuilder<RideBooking, String?, QQueryOperations> promotionCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promotionCode');
    });
  }

  QueryBuilder<RideBooking, VehicleType, QQueryOperations>
      requestedVehicleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestedVehicleType');
    });
  }

  QueryBuilder<RideBooking, String?, QQueryOperations>
      sharedGroupUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sharedGroupUuid');
    });
  }

  QueryBuilder<RideBooking, BookingStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<RideBooking, double, QQueryOperations> surchargeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surcharge');
    });
  }

  QueryBuilder<RideBooking, double, QQueryOperations>
      surgeMultiplierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surgeMultiplier');
    });
  }

  QueryBuilder<RideBooking, SyncStatus, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<RideBooking, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<RideBooking, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
