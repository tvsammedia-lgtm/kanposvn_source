// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_booking.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKanRideBookingCollection on Isar {
  IsarCollection<KanRideBooking> get kanRideBookings => this.collection();
}

const KanRideBookingSchema = CollectionSchema(
  name: r'KanRideBooking',
  id: -1676966498689216112,
  properties: {
    r'bookingId': PropertySchema(
      id: 0,
      name: r'bookingId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerId': PropertySchema(
      id: 2,
      name: r'customerId',
      type: IsarType.string,
    ),
    r'distanceKm': PropertySchema(
      id: 3,
      name: r'distanceKm',
      type: IsarType.double,
    ),
    r'driverId': PropertySchema(
      id: 4,
      name: r'driverId',
      type: IsarType.string,
    ),
    r'dropoffAddress': PropertySchema(
      id: 5,
      name: r'dropoffAddress',
      type: IsarType.string,
    ),
    r'dropoffLat': PropertySchema(
      id: 6,
      name: r'dropoffLat',
      type: IsarType.double,
    ),
    r'dropoffLng': PropertySchema(
      id: 7,
      name: r'dropoffLng',
      type: IsarType.double,
    ),
    r'estimatedPrice': PropertySchema(
      id: 8,
      name: r'estimatedPrice',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 9,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'pickupAddress': PropertySchema(
      id: 10,
      name: r'pickupAddress',
      type: IsarType.string,
    ),
    r'pickupLat': PropertySchema(
      id: 11,
      name: r'pickupLat',
      type: IsarType.double,
    ),
    r'pickupLng': PropertySchema(
      id: 12,
      name: r'pickupLng',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 13,
      name: r'status',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 14,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehicleTypeId': PropertySchema(
      id: 15,
      name: r'vehicleTypeId',
      type: IsarType.string,
    )
  },
  estimateSize: _kanRideBookingEstimateSize,
  serialize: _kanRideBookingSerialize,
  deserialize: _kanRideBookingDeserialize,
  deserializeProp: _kanRideBookingDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'bookingId': IndexSchema(
      id: 4804924406505946939,
      name: r'bookingId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'bookingId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _kanRideBookingGetId,
  getLinks: _kanRideBookingGetLinks,
  attach: _kanRideBookingAttach,
  version: '3.1.0+1',
);

int _kanRideBookingEstimateSize(
  KanRideBooking object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookingId.length * 3;
  bytesCount += 3 + object.customerId.length * 3;
  {
    final value = object.driverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.dropoffAddress.length * 3;
  bytesCount += 3 + object.pickupAddress.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.vehicleTypeId.length * 3;
  return bytesCount;
}

void _kanRideBookingSerialize(
  KanRideBooking object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookingId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.customerId);
  writer.writeDouble(offsets[3], object.distanceKm);
  writer.writeString(offsets[4], object.driverId);
  writer.writeString(offsets[5], object.dropoffAddress);
  writer.writeDouble(offsets[6], object.dropoffLat);
  writer.writeDouble(offsets[7], object.dropoffLng);
  writer.writeDouble(offsets[8], object.estimatedPrice);
  writer.writeBool(offsets[9], object.isSynced);
  writer.writeString(offsets[10], object.pickupAddress);
  writer.writeDouble(offsets[11], object.pickupLat);
  writer.writeDouble(offsets[12], object.pickupLng);
  writer.writeString(offsets[13], object.status);
  writer.writeDateTime(offsets[14], object.updatedAt);
  writer.writeString(offsets[15], object.vehicleTypeId);
}

KanRideBooking _kanRideBookingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KanRideBooking();
  object.bookingId = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.customerId = reader.readString(offsets[2]);
  object.distanceKm = reader.readDouble(offsets[3]);
  object.driverId = reader.readStringOrNull(offsets[4]);
  object.dropoffAddress = reader.readString(offsets[5]);
  object.dropoffLat = reader.readDouble(offsets[6]);
  object.dropoffLng = reader.readDouble(offsets[7]);
  object.estimatedPrice = reader.readDouble(offsets[8]);
  object.isSynced = reader.readBool(offsets[9]);
  object.isarId = id;
  object.pickupAddress = reader.readString(offsets[10]);
  object.pickupLat = reader.readDouble(offsets[11]);
  object.pickupLng = reader.readDouble(offsets[12]);
  object.status = reader.readString(offsets[13]);
  object.updatedAt = reader.readDateTime(offsets[14]);
  object.vehicleTypeId = reader.readString(offsets[15]);
  return object;
}

P _kanRideBookingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readDateTime(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kanRideBookingGetId(KanRideBooking object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _kanRideBookingGetLinks(KanRideBooking object) {
  return [];
}

void _kanRideBookingAttach(
    IsarCollection<dynamic> col, Id id, KanRideBooking object) {
  object.isarId = id;
}

extension KanRideBookingByIndex on IsarCollection<KanRideBooking> {
  Future<KanRideBooking?> getByBookingId(String bookingId) {
    return getByIndex(r'bookingId', [bookingId]);
  }

  KanRideBooking? getByBookingIdSync(String bookingId) {
    return getByIndexSync(r'bookingId', [bookingId]);
  }

  Future<bool> deleteByBookingId(String bookingId) {
    return deleteByIndex(r'bookingId', [bookingId]);
  }

  bool deleteByBookingIdSync(String bookingId) {
    return deleteByIndexSync(r'bookingId', [bookingId]);
  }

  Future<List<KanRideBooking?>> getAllByBookingId(
      List<String> bookingIdValues) {
    final values = bookingIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'bookingId', values);
  }

  List<KanRideBooking?> getAllByBookingIdSync(List<String> bookingIdValues) {
    final values = bookingIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'bookingId', values);
  }

  Future<int> deleteAllByBookingId(List<String> bookingIdValues) {
    final values = bookingIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'bookingId', values);
  }

  int deleteAllByBookingIdSync(List<String> bookingIdValues) {
    final values = bookingIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'bookingId', values);
  }

  Future<Id> putByBookingId(KanRideBooking object) {
    return putByIndex(r'bookingId', object);
  }

  Id putByBookingIdSync(KanRideBooking object, {bool saveLinks = true}) {
    return putByIndexSync(r'bookingId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBookingId(List<KanRideBooking> objects) {
    return putAllByIndex(r'bookingId', objects);
  }

  List<Id> putAllByBookingIdSync(List<KanRideBooking> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'bookingId', objects, saveLinks: saveLinks);
  }
}

extension KanRideBookingQueryWhereSort
    on QueryBuilder<KanRideBooking, KanRideBooking, QWhere> {
  QueryBuilder<KanRideBooking, KanRideBooking, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KanRideBookingQueryWhere
    on QueryBuilder<KanRideBooking, KanRideBooking, QWhereClause> {
  QueryBuilder<KanRideBooking, KanRideBooking, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterWhereClause>
      bookingIdEqualTo(String bookingId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bookingId',
        value: [bookingId],
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterWhereClause>
      bookingIdNotEqualTo(String bookingId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingId',
              lower: [],
              upper: [bookingId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingId',
              lower: [bookingId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingId',
              lower: [bookingId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingId',
              lower: [],
              upper: [bookingId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension KanRideBookingQueryFilter
    on QueryBuilder<KanRideBooking, KanRideBooking, QFilterCondition> {
  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      bookingIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      bookingIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      bookingIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      bookingIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      bookingIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      bookingIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      bookingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      bookingIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      bookingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      bookingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookingId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      customerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      customerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      customerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      customerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      customerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      customerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      customerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      customerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      customerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      customerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverId',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverId',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      driverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffAddressEqualTo(
    String value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffAddressGreaterThan(
    String value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffAddressLessThan(
    String value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffAddressBetween(
    String lower,
    String upper, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dropoffAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dropoffAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dropoffAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffLatEqualTo(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffLatGreaterThan(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffLatLessThan(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffLatBetween(
    double lower,
    double upper, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffLngEqualTo(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffLngGreaterThan(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffLngLessThan(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      dropoffLngBetween(
    double lower,
    double upper, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupAddressEqualTo(
    String value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupAddressGreaterThan(
    String value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupAddressLessThan(
    String value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupAddressBetween(
    String lower,
    String upper, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pickupAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pickupAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupLatEqualTo(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupLatGreaterThan(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupLatLessThan(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupLatBetween(
    double lower,
    double upper, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupLngEqualTo(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupLngGreaterThan(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupLngLessThan(
    double value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      pickupLngBetween(
    double lower,
    double upper, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      vehicleTypeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      vehicleTypeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      vehicleTypeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      vehicleTypeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      vehicleTypeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      vehicleTypeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      vehicleTypeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      vehicleTypeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleTypeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      vehicleTypeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterFilterCondition>
      vehicleTypeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleTypeId',
        value: '',
      ));
    });
  }
}

extension KanRideBookingQueryObject
    on QueryBuilder<KanRideBooking, KanRideBooking, QFilterCondition> {}

extension KanRideBookingQueryLinks
    on QueryBuilder<KanRideBooking, KanRideBooking, QFilterCondition> {}

extension KanRideBookingQuerySortBy
    on QueryBuilder<KanRideBooking, KanRideBooking, QSortBy> {
  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> sortByBookingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingId', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByBookingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingId', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> sortByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByDropoffAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByDropoffAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByDropoffLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByDropoffLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByDropoffLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByDropoffLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByEstimatedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByPickupAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByPickupAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> sortByPickupLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByPickupLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> sortByPickupLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByPickupLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByVehicleTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      sortByVehicleTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.desc);
    });
  }
}

extension KanRideBookingQuerySortThenBy
    on QueryBuilder<KanRideBooking, KanRideBooking, QSortThenBy> {
  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> thenByBookingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingId', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByBookingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingId', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> thenByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByDropoffAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByDropoffAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByDropoffLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByDropoffLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLat', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByDropoffLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByDropoffLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffLng', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByEstimatedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByPickupAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByPickupAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> thenByPickupLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByPickupLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLat', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> thenByPickupLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByPickupLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupLng', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByVehicleTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.asc);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QAfterSortBy>
      thenByVehicleTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.desc);
    });
  }
}

extension KanRideBookingQueryWhereDistinct
    on QueryBuilder<KanRideBooking, KanRideBooking, QDistinct> {
  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct> distinctByBookingId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct> distinctByCustomerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct>
      distinctByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceKm');
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct> distinctByDriverId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct>
      distinctByDropoffAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dropoffAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct>
      distinctByDropoffLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dropoffLat');
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct>
      distinctByDropoffLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dropoffLng');
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct>
      distinctByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedPrice');
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct>
      distinctByPickupAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct>
      distinctByPickupLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupLat');
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct>
      distinctByPickupLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupLng');
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<KanRideBooking, KanRideBooking, QDistinct>
      distinctByVehicleTypeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleTypeId',
          caseSensitive: caseSensitive);
    });
  }
}

extension KanRideBookingQueryProperty
    on QueryBuilder<KanRideBooking, KanRideBooking, QQueryProperty> {
  QueryBuilder<KanRideBooking, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<KanRideBooking, String, QQueryOperations> bookingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookingId');
    });
  }

  QueryBuilder<KanRideBooking, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<KanRideBooking, String, QQueryOperations> customerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerId');
    });
  }

  QueryBuilder<KanRideBooking, double, QQueryOperations> distanceKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceKm');
    });
  }

  QueryBuilder<KanRideBooking, String?, QQueryOperations> driverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverId');
    });
  }

  QueryBuilder<KanRideBooking, String, QQueryOperations>
      dropoffAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dropoffAddress');
    });
  }

  QueryBuilder<KanRideBooking, double, QQueryOperations> dropoffLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dropoffLat');
    });
  }

  QueryBuilder<KanRideBooking, double, QQueryOperations> dropoffLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dropoffLng');
    });
  }

  QueryBuilder<KanRideBooking, double, QQueryOperations>
      estimatedPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedPrice');
    });
  }

  QueryBuilder<KanRideBooking, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<KanRideBooking, String, QQueryOperations>
      pickupAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupAddress');
    });
  }

  QueryBuilder<KanRideBooking, double, QQueryOperations> pickupLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupLat');
    });
  }

  QueryBuilder<KanRideBooking, double, QQueryOperations> pickupLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupLng');
    });
  }

  QueryBuilder<KanRideBooking, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<KanRideBooking, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<KanRideBooking, String, QQueryOperations>
      vehicleTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleTypeId');
    });
  }
}
