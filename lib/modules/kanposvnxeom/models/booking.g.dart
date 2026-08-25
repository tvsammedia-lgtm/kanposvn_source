// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetXeOmBookingCollection on Isar {
  IsarCollection<XeOmBooking> get xeOmBookings => this.collection();
}

const XeOmBookingSchema = CollectionSchema(
  name: r'XeOmBooking',
  id: 1642420598242766149,
  properties: {
    r'baseFare': PropertySchema(
      id: 0,
      name: r'baseFare',
      type: IsarType.double,
    ),
    r'bookingCode': PropertySchema(
      id: 1,
      name: r'bookingCode',
      type: IsarType.string,
    ),
    r'completedAt': PropertySchema(
      id: 2,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerName': PropertySchema(
      id: 4,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'customerPhone': PropertySchema(
      id: 5,
      name: r'customerPhone',
      type: IsarType.string,
    ),
    r'customerUuid': PropertySchema(
      id: 6,
      name: r'customerUuid',
      type: IsarType.string,
    ),
    r'debtAmount': PropertySchema(
      id: 7,
      name: r'debtAmount',
      type: IsarType.double,
    ),
    r'discount': PropertySchema(
      id: 8,
      name: r'discount',
      type: IsarType.double,
    ),
    r'distanceKm': PropertySchema(
      id: 9,
      name: r'distanceKm',
      type: IsarType.double,
    ),
    r'driverUuid': PropertySchema(
      id: 10,
      name: r'driverUuid',
      type: IsarType.string,
    ),
    r'dropoffAddress': PropertySchema(
      id: 11,
      name: r'dropoffAddress',
      type: IsarType.string,
    ),
    r'dropoffLat': PropertySchema(
      id: 12,
      name: r'dropoffLat',
      type: IsarType.double,
    ),
    r'dropoffLng': PropertySchema(
      id: 13,
      name: r'dropoffLng',
      type: IsarType.double,
    ),
    r'isDeleted': PropertySchema(
      id: 14,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'isPaid': PropertySchema(
      id: 15,
      name: r'isPaid',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 16,
      name: r'notes',
      type: IsarType.string,
    ),
    r'paymentMethod': PropertySchema(
      id: 17,
      name: r'paymentMethod',
      type: IsarType.byte,
      enumMap: _XeOmBookingpaymentMethodEnumValueMap,
    ),
    r'pickedUpAt': PropertySchema(
      id: 18,
      name: r'pickedUpAt',
      type: IsarType.dateTime,
    ),
    r'pickupAddress': PropertySchema(
      id: 19,
      name: r'pickupAddress',
      type: IsarType.string,
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
    r'price': PropertySchema(
      id: 22,
      name: r'price',
      type: IsarType.double,
    ),
    r'promotionCode': PropertySchema(
      id: 23,
      name: r'promotionCode',
      type: IsarType.string,
    ),
    r'requiredVehicleType': PropertySchema(
      id: 24,
      name: r'requiredVehicleType',
      type: IsarType.string,
    ),
    r'scheduledAt': PropertySchema(
      id: 25,
      name: r'scheduledAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 26,
      name: r'status',
      type: IsarType.byte,
      enumMap: _XeOmBookingstatusEnumValueMap,
    ),
    r'surcharge': PropertySchema(
      id: 27,
      name: r'surcharge',
      type: IsarType.double,
    ),
    r'syncVersion': PropertySchema(
      id: 28,
      name: r'syncVersion',
      type: IsarType.long,
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
    ),
    r'vehicleUuid': PropertySchema(
      id: 31,
      name: r'vehicleUuid',
      type: IsarType.string,
    )
  },
  estimateSize: _xeOmBookingEstimateSize,
  serialize: _xeOmBookingSerialize,
  deserialize: _xeOmBookingDeserialize,
  deserializeProp: _xeOmBookingDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _xeOmBookingGetId,
  getLinks: _xeOmBookingGetLinks,
  attach: _xeOmBookingAttach,
  version: '3.1.0+1',
);

int _xeOmBookingEstimateSize(
  XeOmBooking object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bookingCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerPhone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerUuid;
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
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
    final value = object.requiredVehicleType;
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
  {
    final value = object.vehicleUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _xeOmBookingSerialize(
  XeOmBooking object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.baseFare);
  writer.writeString(offsets[1], object.bookingCode);
  writer.writeDateTime(offsets[2], object.completedAt);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.customerName);
  writer.writeString(offsets[5], object.customerPhone);
  writer.writeString(offsets[6], object.customerUuid);
  writer.writeDouble(offsets[7], object.debtAmount);
  writer.writeDouble(offsets[8], object.discount);
  writer.writeDouble(offsets[9], object.distanceKm);
  writer.writeString(offsets[10], object.driverUuid);
  writer.writeString(offsets[11], object.dropoffAddress);
  writer.writeDouble(offsets[12], object.dropoffLat);
  writer.writeDouble(offsets[13], object.dropoffLng);
  writer.writeBool(offsets[14], object.isDeleted);
  writer.writeBool(offsets[15], object.isPaid);
  writer.writeString(offsets[16], object.notes);
  writer.writeByte(offsets[17], object.paymentMethod.index);
  writer.writeDateTime(offsets[18], object.pickedUpAt);
  writer.writeString(offsets[19], object.pickupAddress);
  writer.writeDouble(offsets[20], object.pickupLat);
  writer.writeDouble(offsets[21], object.pickupLng);
  writer.writeDouble(offsets[22], object.price);
  writer.writeString(offsets[23], object.promotionCode);
  writer.writeString(offsets[24], object.requiredVehicleType);
  writer.writeDateTime(offsets[25], object.scheduledAt);
  writer.writeByte(offsets[26], object.status.index);
  writer.writeDouble(offsets[27], object.surcharge);
  writer.writeLong(offsets[28], object.syncVersion);
  writer.writeDateTime(offsets[29], object.updatedAt);
  writer.writeString(offsets[30], object.uuid);
  writer.writeString(offsets[31], object.vehicleUuid);
}

XeOmBooking _xeOmBookingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = XeOmBooking();
  object.baseFare = reader.readDouble(offsets[0]);
  object.bookingCode = reader.readStringOrNull(offsets[1]);
  object.completedAt = reader.readDateTimeOrNull(offsets[2]);
  object.createdAt = reader.readDateTimeOrNull(offsets[3]);
  object.customerName = reader.readStringOrNull(offsets[4]);
  object.customerPhone = reader.readStringOrNull(offsets[5]);
  object.customerUuid = reader.readStringOrNull(offsets[6]);
  object.debtAmount = reader.readDouble(offsets[7]);
  object.discount = reader.readDouble(offsets[8]);
  object.distanceKm = reader.readDoubleOrNull(offsets[9]);
  object.driverUuid = reader.readStringOrNull(offsets[10]);
  object.dropoffAddress = reader.readStringOrNull(offsets[11]);
  object.dropoffLat = reader.readDoubleOrNull(offsets[12]);
  object.dropoffLng = reader.readDoubleOrNull(offsets[13]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[14]);
  object.isPaid = reader.readBool(offsets[15]);
  object.notes = reader.readStringOrNull(offsets[16]);
  object.paymentMethod = _XeOmBookingpaymentMethodValueEnumMap[
          reader.readByteOrNull(offsets[17])] ??
      PaymentMethod.cash;
  object.pickedUpAt = reader.readDateTimeOrNull(offsets[18]);
  object.pickupAddress = reader.readStringOrNull(offsets[19]);
  object.pickupLat = reader.readDoubleOrNull(offsets[20]);
  object.pickupLng = reader.readDoubleOrNull(offsets[21]);
  object.price = reader.readDoubleOrNull(offsets[22]);
  object.promotionCode = reader.readStringOrNull(offsets[23]);
  object.requiredVehicleType = reader.readStringOrNull(offsets[24]);
  object.scheduledAt = reader.readDateTimeOrNull(offsets[25]);
  object.status =
      _XeOmBookingstatusValueEnumMap[reader.readByteOrNull(offsets[26])] ??
          BookingStatus.newBooking;
  object.surcharge = reader.readDouble(offsets[27]);
  object.syncVersion = reader.readLong(offsets[28]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[29]);
  object.uuid = reader.readStringOrNull(offsets[30]);
  object.vehicleUuid = reader.readStringOrNull(offsets[31]);
  return object;
}

P _xeOmBookingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (_XeOmBookingpaymentMethodValueEnumMap[
              reader.readByteOrNull(offset)] ??
          PaymentMethod.cash) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    case 21:
      return (reader.readDoubleOrNull(offset)) as P;
    case 22:
      return (reader.readDoubleOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 26:
      return (_XeOmBookingstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          BookingStatus.newBooking) as P;
    case 27:
      return (reader.readDouble(offset)) as P;
    case 28:
      return (reader.readLong(offset)) as P;
    case 29:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _XeOmBookingpaymentMethodEnumValueMap = {
  'cash': 0,
  'qr': 1,
  'momo': 2,
  'zaloPay': 3,
  'vnpay': 4,
  'bankTransfer': 5,
  'debt': 6,
};
const _XeOmBookingpaymentMethodValueEnumMap = {
  0: PaymentMethod.cash,
  1: PaymentMethod.qr,
  2: PaymentMethod.momo,
  3: PaymentMethod.zaloPay,
  4: PaymentMethod.vnpay,
  5: PaymentMethod.bankTransfer,
  6: PaymentMethod.debt,
};
const _XeOmBookingstatusEnumValueMap = {
  'newBooking': 0,
  'searchingDriver': 1,
  'driverAccepted': 2,
  'driverArriving': 3,
  'pickedUp': 4,
  'inProgress': 5,
  'completed': 6,
  'cancelled': 7,
};
const _XeOmBookingstatusValueEnumMap = {
  0: BookingStatus.newBooking,
  1: BookingStatus.searchingDriver,
  2: BookingStatus.driverAccepted,
  3: BookingStatus.driverArriving,
  4: BookingStatus.pickedUp,
  5: BookingStatus.inProgress,
  6: BookingStatus.completed,
  7: BookingStatus.cancelled,
};

Id _xeOmBookingGetId(XeOmBooking object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _xeOmBookingGetLinks(XeOmBooking object) {
  return [];
}

void _xeOmBookingAttach(
    IsarCollection<dynamic> col, Id id, XeOmBooking object) {
  object.id = id;
}

extension XeOmBookingByIndex on IsarCollection<XeOmBooking> {
  Future<XeOmBooking?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  XeOmBooking? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<XeOmBooking?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<XeOmBooking?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(XeOmBooking object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(XeOmBooking object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<XeOmBooking> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<XeOmBooking> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension XeOmBookingQueryWhereSort
    on QueryBuilder<XeOmBooking, XeOmBooking, QWhere> {
  QueryBuilder<XeOmBooking, XeOmBooking, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension XeOmBookingQueryWhere
    on QueryBuilder<XeOmBooking, XeOmBooking, QWhereClause> {
  QueryBuilder<XeOmBooking, XeOmBooking, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterWhereClause> idBetween(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterWhereClause> uuidNotEqualTo(
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
}

extension XeOmBookingQueryFilter
    on QueryBuilder<XeOmBooking, XeOmBooking, QFilterCondition> {
  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> baseFareEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      baseFareGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      baseFareLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> baseFareBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseFare',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bookingCode',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bookingCode',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookingCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookingCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookingCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookingCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookingCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookingCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookingCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingCode',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      bookingCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookingCode',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerPhone',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerPhone',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerUuid',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerUuid',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      customerUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      debtAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'debtAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      debtAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'debtAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      debtAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'debtAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      debtAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'debtAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> discountEqualTo(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> discountBetween(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      distanceKmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'distanceKm',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      distanceKmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'distanceKm',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      distanceKmEqualTo(
    double? value, {
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      distanceKmGreaterThan(
    double? value, {
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      distanceKmLessThan(
    double? value, {
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      distanceKmBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      driverUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverUuid',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      driverUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverUuid',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      driverUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      driverUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      driverUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      driverUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      dropoffAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dropoffAddress',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      dropoffAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dropoffAddress',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      dropoffAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      dropoffAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dropoffAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      dropoffAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dropoffAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      dropoffAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dropoffAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      dropoffLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dropoffLat',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      dropoffLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dropoffLat',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      dropoffLngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dropoffLng',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      dropoffLngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dropoffLng',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> idBetween(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> isPaidEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPaid',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      paymentMethodEqualTo(PaymentMethod value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      paymentMethodGreaterThan(
    PaymentMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      paymentMethodLessThan(
    PaymentMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      paymentMethodBetween(
    PaymentMethod lower,
    PaymentMethod upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickedUpAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickedUpAt',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickedUpAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickedUpAt',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickedUpAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickedUpAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickedUpAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickedUpAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickedUpAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickedUpAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickedUpAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickedUpAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickupAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickupAddress',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickupAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickupAddress',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickupAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickupAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pickupAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickupAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickupAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pickupAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickupLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickupLat',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickupLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickupLat',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickupLngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickupLng',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      pickupLngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickupLng',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> priceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      priceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> priceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> priceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      promotionCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promotionCode',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      promotionCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promotionCode',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      promotionCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'promotionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      promotionCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'promotionCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      promotionCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promotionCode',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      promotionCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'promotionCode',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'requiredVehicleType',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'requiredVehicleType',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiredVehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'requiredVehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'requiredVehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'requiredVehicleType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'requiredVehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'requiredVehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'requiredVehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'requiredVehicleType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiredVehicleType',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      requiredVehicleTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'requiredVehicleType',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      scheduledAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scheduledAt',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      scheduledAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scheduledAt',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      scheduledAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      scheduledAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      scheduledAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      scheduledAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduledAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> statusEqualTo(
      BookingStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      syncVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      syncVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      syncVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> uuidContains(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehicleUuid',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehicleUuid',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterFilterCondition>
      vehicleUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleUuid',
        value: '',
      ));
    });
  }
}

extension XeOmBookingQueryObject
    on QueryBuilder<XeOmBooking, XeOmBooking, QFilterCondition> {}

extension XeOmBookingQueryLinks
    on QueryBuilder<XeOmBooking, XeOmBooking, QFilterCondition> {}

extension XeOmBookingQuerySortBy
    on QueryBuilder<XeOmBooking, XeOmBooking, QSortBy> {
  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByBaseFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByBaseFareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByBookingCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingCode', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByBookingCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingCode', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      sortByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByCustomerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      sortByCustomerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDebtAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtAmount', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDebtAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtAmount', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDropoffAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      sortByDropoffAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDropoffLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDropoffLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDropoffLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByDropoffLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByIsPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByPickedUpAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickedUpAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByPickedUpAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickedUpAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByPickupAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      sortByPickupAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByPickupLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByPickupLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByPickupLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByPickupLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByPromotionCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionCode', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      sortByPromotionCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionCode', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      sortByRequiredVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredVehicleType', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      sortByRequiredVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredVehicleType', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByScheduledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByScheduledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortBySurcharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surcharge', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortBySurchargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surcharge', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByVehicleUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> sortByVehicleUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleUuid', Sort.desc);
    });
  }
}

extension XeOmBookingQuerySortThenBy
    on QueryBuilder<XeOmBooking, XeOmBooking, QSortThenBy> {
  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByBaseFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByBaseFareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByBookingCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingCode', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByBookingCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingCode', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      thenByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByCustomerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      thenByCustomerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDebtAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtAmount', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDebtAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtAmount', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDropoffAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      thenByDropoffAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDropoffLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDropoffLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDropoffLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByDropoffLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByIsPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByPickedUpAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickedUpAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByPickedUpAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickedUpAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByPickupAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      thenByPickupAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByPickupLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByPickupLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByPickupLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByPickupLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByPromotionCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionCode', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      thenByPromotionCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionCode', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      thenByRequiredVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredVehicleType', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy>
      thenByRequiredVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredVehicleType', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByScheduledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByScheduledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenBySurcharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surcharge', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenBySurchargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surcharge', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByVehicleUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QAfterSortBy> thenByVehicleUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleUuid', Sort.desc);
    });
  }
}

extension XeOmBookingQueryWhereDistinct
    on QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> {
  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByBaseFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseFare');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByBookingCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookingCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByCustomerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByCustomerPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByCustomerUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByDebtAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'debtAmount');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discount');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceKm');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByDriverUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByDropoffAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dropoffAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByDropoffLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dropoffLat');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByDropoffLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dropoffLng');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPaid');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByPickedUpAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickedUpAt');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByPickupAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByPickupLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupLat');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByPickupLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupLng');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByPromotionCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promotionCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct>
      distinctByRequiredVehicleType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requiredVehicleType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByScheduledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledAt');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctBySurcharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surcharge');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmBooking, XeOmBooking, QDistinct> distinctByVehicleUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleUuid', caseSensitive: caseSensitive);
    });
  }
}

extension XeOmBookingQueryProperty
    on QueryBuilder<XeOmBooking, XeOmBooking, QQueryProperty> {
  QueryBuilder<XeOmBooking, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<XeOmBooking, double, QQueryOperations> baseFareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseFare');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations> bookingCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookingCode');
    });
  }

  QueryBuilder<XeOmBooking, DateTime?, QQueryOperations> completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<XeOmBooking, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations> customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations> customerPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerPhone');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations> customerUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerUuid');
    });
  }

  QueryBuilder<XeOmBooking, double, QQueryOperations> debtAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'debtAmount');
    });
  }

  QueryBuilder<XeOmBooking, double, QQueryOperations> discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discount');
    });
  }

  QueryBuilder<XeOmBooking, double?, QQueryOperations> distanceKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceKm');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations> driverUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverUuid');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations>
      dropoffAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dropoffAddress');
    });
  }

  QueryBuilder<XeOmBooking, double?, QQueryOperations> dropoffLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dropoffLat');
    });
  }

  QueryBuilder<XeOmBooking, double?, QQueryOperations> dropoffLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dropoffLng');
    });
  }

  QueryBuilder<XeOmBooking, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<XeOmBooking, bool, QQueryOperations> isPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPaid');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<XeOmBooking, PaymentMethod, QQueryOperations>
      paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<XeOmBooking, DateTime?, QQueryOperations> pickedUpAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickedUpAt');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations> pickupAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupAddress');
    });
  }

  QueryBuilder<XeOmBooking, double?, QQueryOperations> pickupLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupLat');
    });
  }

  QueryBuilder<XeOmBooking, double?, QQueryOperations> pickupLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupLng');
    });
  }

  QueryBuilder<XeOmBooking, double?, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations> promotionCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promotionCode');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations>
      requiredVehicleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requiredVehicleType');
    });
  }

  QueryBuilder<XeOmBooking, DateTime?, QQueryOperations> scheduledAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledAt');
    });
  }

  QueryBuilder<XeOmBooking, BookingStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<XeOmBooking, double, QQueryOperations> surchargeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surcharge');
    });
  }

  QueryBuilder<XeOmBooking, int, QQueryOperations> syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<XeOmBooking, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }

  QueryBuilder<XeOmBooking, String?, QQueryOperations> vehicleUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleUuid');
    });
  }
}
