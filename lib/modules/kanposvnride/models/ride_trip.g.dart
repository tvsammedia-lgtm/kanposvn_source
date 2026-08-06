// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_trip.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKanRideTripCollection on Isar {
  IsarCollection<KanRideTrip> get kanRideTrips => this.collection();
}

const KanRideTripSchema = CollectionSchema(
  name: r'KanRideTrip',
  id: -5738252657998742076,
  properties: {
    r'actualDistanceKm': PropertySchema(
      id: 0,
      name: r'actualDistanceKm',
      type: IsarType.double,
    ),
    r'bookingId': PropertySchema(
      id: 1,
      name: r'bookingId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'driverId': PropertySchema(
      id: 3,
      name: r'driverId',
      type: IsarType.string,
    ),
    r'endTime': PropertySchema(
      id: 4,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'finalPrice': PropertySchema(
      id: 5,
      name: r'finalPrice',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 6,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'startTime': PropertySchema(
      id: 7,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 8,
      name: r'status',
      type: IsarType.string,
    ),
    r'tripId': PropertySchema(
      id: 9,
      name: r'tripId',
      type: IsarType.string,
    )
  },
  estimateSize: _kanRideTripEstimateSize,
  serialize: _kanRideTripSerialize,
  deserialize: _kanRideTripDeserialize,
  deserializeProp: _kanRideTripDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'tripId': IndexSchema(
      id: 7734156669642746260,
      name: r'tripId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'tripId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _kanRideTripGetId,
  getLinks: _kanRideTripGetLinks,
  attach: _kanRideTripAttach,
  version: '3.1.0+1',
);

int _kanRideTripEstimateSize(
  KanRideTrip object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookingId.length * 3;
  bytesCount += 3 + object.driverId.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.tripId.length * 3;
  return bytesCount;
}

void _kanRideTripSerialize(
  KanRideTrip object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.actualDistanceKm);
  writer.writeString(offsets[1], object.bookingId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.driverId);
  writer.writeDateTime(offsets[4], object.endTime);
  writer.writeDouble(offsets[5], object.finalPrice);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeDateTime(offsets[7], object.startTime);
  writer.writeString(offsets[8], object.status);
  writer.writeString(offsets[9], object.tripId);
}

KanRideTrip _kanRideTripDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KanRideTrip();
  object.actualDistanceKm = reader.readDouble(offsets[0]);
  object.bookingId = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.driverId = reader.readString(offsets[3]);
  object.endTime = reader.readDateTimeOrNull(offsets[4]);
  object.finalPrice = reader.readDouble(offsets[5]);
  object.isSynced = reader.readBool(offsets[6]);
  object.isarId = id;
  object.startTime = reader.readDateTime(offsets[7]);
  object.status = reader.readString(offsets[8]);
  object.tripId = reader.readString(offsets[9]);
  return object;
}

P _kanRideTripDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kanRideTripGetId(KanRideTrip object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _kanRideTripGetLinks(KanRideTrip object) {
  return [];
}

void _kanRideTripAttach(
    IsarCollection<dynamic> col, Id id, KanRideTrip object) {
  object.isarId = id;
}

extension KanRideTripByIndex on IsarCollection<KanRideTrip> {
  Future<KanRideTrip?> getByTripId(String tripId) {
    return getByIndex(r'tripId', [tripId]);
  }

  KanRideTrip? getByTripIdSync(String tripId) {
    return getByIndexSync(r'tripId', [tripId]);
  }

  Future<bool> deleteByTripId(String tripId) {
    return deleteByIndex(r'tripId', [tripId]);
  }

  bool deleteByTripIdSync(String tripId) {
    return deleteByIndexSync(r'tripId', [tripId]);
  }

  Future<List<KanRideTrip?>> getAllByTripId(List<String> tripIdValues) {
    final values = tripIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'tripId', values);
  }

  List<KanRideTrip?> getAllByTripIdSync(List<String> tripIdValues) {
    final values = tripIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'tripId', values);
  }

  Future<int> deleteAllByTripId(List<String> tripIdValues) {
    final values = tripIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'tripId', values);
  }

  int deleteAllByTripIdSync(List<String> tripIdValues) {
    final values = tripIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'tripId', values);
  }

  Future<Id> putByTripId(KanRideTrip object) {
    return putByIndex(r'tripId', object);
  }

  Id putByTripIdSync(KanRideTrip object, {bool saveLinks = true}) {
    return putByIndexSync(r'tripId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTripId(List<KanRideTrip> objects) {
    return putAllByIndex(r'tripId', objects);
  }

  List<Id> putAllByTripIdSync(List<KanRideTrip> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'tripId', objects, saveLinks: saveLinks);
  }
}

extension KanRideTripQueryWhereSort
    on QueryBuilder<KanRideTrip, KanRideTrip, QWhere> {
  QueryBuilder<KanRideTrip, KanRideTrip, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KanRideTripQueryWhere
    on QueryBuilder<KanRideTrip, KanRideTrip, QWhereClause> {
  QueryBuilder<KanRideTrip, KanRideTrip, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterWhereClause> tripIdEqualTo(
      String tripId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tripId',
        value: [tripId],
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterWhereClause> tripIdNotEqualTo(
      String tripId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [],
              upper: [tripId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [tripId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [tripId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [],
              upper: [tripId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension KanRideTripQueryFilter
    on QueryBuilder<KanRideTrip, KanRideTrip, QFilterCondition> {
  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      actualDistanceKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualDistanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      actualDistanceKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualDistanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      actualDistanceKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualDistanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      actualDistanceKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualDistanceKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      bookingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      bookingIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      bookingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      bookingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookingId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> driverIdEqualTo(
    String value, {
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      driverIdGreaterThan(
    String value, {
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      driverIdLessThan(
    String value, {
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> driverIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      driverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> driverIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      driverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      driverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> endTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> tripIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      tripIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> tripIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> tripIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tripId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      tripIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> tripIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> tripIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition> tripIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tripId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      tripIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterFilterCondition>
      tripIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tripId',
        value: '',
      ));
    });
  }
}

extension KanRideTripQueryObject
    on QueryBuilder<KanRideTrip, KanRideTrip, QFilterCondition> {}

extension KanRideTripQueryLinks
    on QueryBuilder<KanRideTrip, KanRideTrip, QFilterCondition> {}

extension KanRideTripQuerySortBy
    on QueryBuilder<KanRideTrip, KanRideTrip, QSortBy> {
  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy>
      sortByActualDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDistanceKm', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy>
      sortByActualDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDistanceKm', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByBookingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingId', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByBookingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingId', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByFinalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByFinalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByTripId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> sortByTripIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.desc);
    });
  }
}

extension KanRideTripQuerySortThenBy
    on QueryBuilder<KanRideTrip, KanRideTrip, QSortThenBy> {
  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy>
      thenByActualDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDistanceKm', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy>
      thenByActualDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDistanceKm', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByBookingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingId', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByBookingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingId', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByFinalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByFinalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByTripId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.asc);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QAfterSortBy> thenByTripIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.desc);
    });
  }
}

extension KanRideTripQueryWhereDistinct
    on QueryBuilder<KanRideTrip, KanRideTrip, QDistinct> {
  QueryBuilder<KanRideTrip, KanRideTrip, QDistinct>
      distinctByActualDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualDistanceKm');
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QDistinct> distinctByBookingId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QDistinct> distinctByDriverId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QDistinct> distinctByFinalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalPrice');
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideTrip, KanRideTrip, QDistinct> distinctByTripId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tripId', caseSensitive: caseSensitive);
    });
  }
}

extension KanRideTripQueryProperty
    on QueryBuilder<KanRideTrip, KanRideTrip, QQueryProperty> {
  QueryBuilder<KanRideTrip, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<KanRideTrip, double, QQueryOperations>
      actualDistanceKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualDistanceKm');
    });
  }

  QueryBuilder<KanRideTrip, String, QQueryOperations> bookingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookingId');
    });
  }

  QueryBuilder<KanRideTrip, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<KanRideTrip, String, QQueryOperations> driverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverId');
    });
  }

  QueryBuilder<KanRideTrip, DateTime?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<KanRideTrip, double, QQueryOperations> finalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalPrice');
    });
  }

  QueryBuilder<KanRideTrip, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<KanRideTrip, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<KanRideTrip, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<KanRideTrip, String, QQueryOperations> tripIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tripId');
    });
  }
}
