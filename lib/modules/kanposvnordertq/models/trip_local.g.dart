// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTripLocalCollection on Isar {
  IsarCollection<TripLocal> get tripLocals => this.collection();
}

const TripLocalSchema = CollectionSchema(
  name: r'TripLocal',
  id: 8114255748503771318,
  properties: {
    r'actualArrival': PropertySchema(
      id: 0,
      name: r'actualArrival',
      type: IsarType.dateTime,
    ),
    r'actualDeparture': PropertySchema(
      id: 1,
      name: r'actualDeparture',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'destination': PropertySchema(
      id: 3,
      name: r'destination',
      type: IsarType.string,
    ),
    r'driverId': PropertySchema(
      id: 4,
      name: r'driverId',
      type: IsarType.string,
    ),
    r'estimatedArrival': PropertySchema(
      id: 5,
      name: r'estimatedArrival',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 6,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'origin': PropertySchema(
      id: 7,
      name: r'origin',
      type: IsarType.string,
    ),
    r'plannedArrival': PropertySchema(
      id: 8,
      name: r'plannedArrival',
      type: IsarType.dateTime,
    ),
    r'plannedDeparture': PropertySchema(
      id: 9,
      name: r'plannedDeparture',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.string,
    ),
    r'syncedAt': PropertySchema(
      id: 11,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'tripCode': PropertySchema(
      id: 12,
      name: r'tripCode',
      type: IsarType.string,
    ),
    r'tripId': PropertySchema(
      id: 13,
      name: r'tripId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 14,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehicleId': PropertySchema(
      id: 15,
      name: r'vehicleId',
      type: IsarType.string,
    )
  },
  estimateSize: _tripLocalEstimateSize,
  serialize: _tripLocalSerialize,
  deserialize: _tripLocalDeserialize,
  deserializeProp: _tripLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'tripId': IndexSchema(
      id: 7734156669642746260,
      name: r'tripId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tripId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'vehicleId': IndexSchema(
      id: 2011968157433523416,
      name: r'vehicleId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'vehicleId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'driverId': IndexSchema(
      id: -2215465182691497637,
      name: r'driverId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'driverId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'syncedAt': IndexSchema(
      id: -9141336850758009100,
      name: r'syncedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'syncedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _tripLocalGetId,
  getLinks: _tripLocalGetLinks,
  attach: _tripLocalAttach,
  version: '3.1.0+1',
);

int _tripLocalEstimateSize(
  TripLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.destination;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.driverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.origin;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tripCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tripId.length * 3;
  {
    final value = object.vehicleId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _tripLocalSerialize(
  TripLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.actualArrival);
  writer.writeDateTime(offsets[1], object.actualDeparture);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.destination);
  writer.writeString(offsets[4], object.driverId);
  writer.writeDateTime(offsets[5], object.estimatedArrival);
  writer.writeBool(offsets[6], object.isDeleted);
  writer.writeString(offsets[7], object.origin);
  writer.writeDateTime(offsets[8], object.plannedArrival);
  writer.writeDateTime(offsets[9], object.plannedDeparture);
  writer.writeString(offsets[10], object.status);
  writer.writeDateTime(offsets[11], object.syncedAt);
  writer.writeString(offsets[12], object.tripCode);
  writer.writeString(offsets[13], object.tripId);
  writer.writeDateTime(offsets[14], object.updatedAt);
  writer.writeString(offsets[15], object.vehicleId);
}

TripLocal _tripLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TripLocal();
  object.actualArrival = reader.readDateTimeOrNull(offsets[0]);
  object.actualDeparture = reader.readDateTimeOrNull(offsets[1]);
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.destination = reader.readStringOrNull(offsets[3]);
  object.driverId = reader.readStringOrNull(offsets[4]);
  object.estimatedArrival = reader.readDateTimeOrNull(offsets[5]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[6]);
  object.origin = reader.readStringOrNull(offsets[7]);
  object.plannedArrival = reader.readDateTimeOrNull(offsets[8]);
  object.plannedDeparture = reader.readDateTimeOrNull(offsets[9]);
  object.status = reader.readStringOrNull(offsets[10]);
  object.syncedAt = reader.readDateTimeOrNull(offsets[11]);
  object.tripCode = reader.readStringOrNull(offsets[12]);
  object.tripId = reader.readString(offsets[13]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[14]);
  object.vehicleId = reader.readStringOrNull(offsets[15]);
  return object;
}

P _tripLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tripLocalGetId(TripLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tripLocalGetLinks(TripLocal object) {
  return [];
}

void _tripLocalAttach(IsarCollection<dynamic> col, Id id, TripLocal object) {
  object.id = id;
}

extension TripLocalByIndex on IsarCollection<TripLocal> {
  Future<TripLocal?> getByTripId(String tripId) {
    return getByIndex(r'tripId', [tripId]);
  }

  TripLocal? getByTripIdSync(String tripId) {
    return getByIndexSync(r'tripId', [tripId]);
  }

  Future<bool> deleteByTripId(String tripId) {
    return deleteByIndex(r'tripId', [tripId]);
  }

  bool deleteByTripIdSync(String tripId) {
    return deleteByIndexSync(r'tripId', [tripId]);
  }

  Future<List<TripLocal?>> getAllByTripId(List<String> tripIdValues) {
    final values = tripIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'tripId', values);
  }

  List<TripLocal?> getAllByTripIdSync(List<String> tripIdValues) {
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

  Future<Id> putByTripId(TripLocal object) {
    return putByIndex(r'tripId', object);
  }

  Id putByTripIdSync(TripLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'tripId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTripId(List<TripLocal> objects) {
    return putAllByIndex(r'tripId', objects);
  }

  List<Id> putAllByTripIdSync(List<TripLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'tripId', objects, saveLinks: saveLinks);
  }
}

extension TripLocalQueryWhereSort
    on QueryBuilder<TripLocal, TripLocal, QWhere> {
  QueryBuilder<TripLocal, TripLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhere> anySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncedAt'),
      );
    });
  }
}

extension TripLocalQueryWhere
    on QueryBuilder<TripLocal, TripLocal, QWhereClause> {
  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> tripIdEqualTo(
      String tripId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tripId',
        value: [tripId],
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> tripIdNotEqualTo(
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

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> vehicleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'vehicleId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> vehicleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'vehicleId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> vehicleIdEqualTo(
      String? vehicleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'vehicleId',
        value: [vehicleId],
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> vehicleIdNotEqualTo(
      String? vehicleId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [],
              upper: [vehicleId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [vehicleId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [vehicleId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [],
              upper: [vehicleId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> driverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'driverId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> driverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'driverId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> driverIdEqualTo(
      String? driverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'driverId',
        value: [driverId],
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> driverIdNotEqualTo(
      String? driverId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverId',
              lower: [],
              upper: [driverId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverId',
              lower: [driverId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverId',
              lower: [driverId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverId',
              lower: [],
              upper: [driverId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> syncedAtEqualTo(
      DateTime? syncedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncedAt',
        value: [syncedAt],
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> syncedAtNotEqualTo(
      DateTime? syncedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncedAt',
              lower: [],
              upper: [syncedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncedAt',
              lower: [syncedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncedAt',
              lower: [syncedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncedAt',
              lower: [],
              upper: [syncedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> syncedAtGreaterThan(
    DateTime? syncedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncedAt',
        lower: [syncedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> syncedAtLessThan(
    DateTime? syncedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncedAt',
        lower: [],
        upper: [syncedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterWhereClause> syncedAtBetween(
    DateTime? lowerSyncedAt,
    DateTime? upperSyncedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncedAt',
        lower: [lowerSyncedAt],
        includeLower: includeLower,
        upper: [upperSyncedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TripLocalQueryFilter
    on QueryBuilder<TripLocal, TripLocal, QFilterCondition> {
  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualArrivalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualArrival',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualArrivalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualArrival',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualArrivalEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualArrivalGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualArrivalLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualArrivalBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualArrival',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualDepartureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualDeparture',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualDepartureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualDeparture',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualDepartureEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualDepartureGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualDepartureLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      actualDepartureBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualDeparture',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      destinationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destination',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      destinationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destination',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> destinationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      destinationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> destinationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> destinationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destination',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      destinationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> destinationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> destinationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> destinationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destination',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      destinationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destination',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      destinationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destination',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> driverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverId',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      driverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverId',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> driverIdEqualTo(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> driverIdGreaterThan(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> driverIdLessThan(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> driverIdBetween(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> driverIdStartsWith(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> driverIdEndsWith(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> driverIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> driverIdMatches(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> driverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      driverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      estimatedArrivalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedArrival',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      estimatedArrivalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedArrival',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      estimatedArrivalEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      estimatedArrivalGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      estimatedArrivalLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      estimatedArrivalBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedArrival',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> isDeletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'origin',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'origin',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'origin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'origin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'origin',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> originIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'origin',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedArrivalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedArrival',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedArrivalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedArrival',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedArrivalEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedArrivalGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedArrivalLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedArrivalBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedArrival',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedDepartureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedDeparture',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedDepartureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedDeparture',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedDepartureEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedDepartureGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedDepartureLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      plannedDepartureBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedDeparture',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusEqualTo(
    String? value, {
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusGreaterThan(
    String? value, {
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusLessThan(
    String? value, {
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusContains(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> syncedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> syncedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> syncedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> syncedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tripCode',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      tripCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tripCode',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tripCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tripCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tripCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tripCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tripCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tripCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tripCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      tripCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tripCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripIdEqualTo(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripIdGreaterThan(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripIdLessThan(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripIdBetween(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripIdStartsWith(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripIdEndsWith(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripIdContains(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripIdMatches(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripId',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> tripIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tripId',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> vehicleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehicleId',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      vehicleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehicleId',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> vehicleIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      vehicleIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> vehicleIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> vehicleIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> vehicleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> vehicleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> vehicleIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> vehicleIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition> vehicleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterFilterCondition>
      vehicleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleId',
        value: '',
      ));
    });
  }
}

extension TripLocalQueryObject
    on QueryBuilder<TripLocal, TripLocal, QFilterCondition> {}

extension TripLocalQueryLinks
    on QueryBuilder<TripLocal, TripLocal, QFilterCondition> {}

extension TripLocalQuerySortBy on QueryBuilder<TripLocal, TripLocal, QSortBy> {
  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByActualArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualArrival', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByActualArrivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualArrival', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByActualDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDeparture', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByActualDepartureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDeparture', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByDestination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByDestinationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByEstimatedArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedArrival', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy>
      sortByEstimatedArrivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedArrival', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByPlannedArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedArrival', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByPlannedArrivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedArrival', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByPlannedDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDeparture', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy>
      sortByPlannedDepartureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDeparture', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByTripCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripCode', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByTripCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripCode', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByTripId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByTripIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> sortByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }
}

extension TripLocalQuerySortThenBy
    on QueryBuilder<TripLocal, TripLocal, QSortThenBy> {
  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByActualArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualArrival', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByActualArrivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualArrival', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByActualDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDeparture', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByActualDepartureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDeparture', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByDestination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByDestinationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByEstimatedArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedArrival', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy>
      thenByEstimatedArrivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedArrival', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByPlannedArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedArrival', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByPlannedArrivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedArrival', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByPlannedDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDeparture', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy>
      thenByPlannedDepartureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDeparture', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByTripCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripCode', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByTripCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripCode', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByTripId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByTripIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QAfterSortBy> thenByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }
}

extension TripLocalQueryWhereDistinct
    on QueryBuilder<TripLocal, TripLocal, QDistinct> {
  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByActualArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualArrival');
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByActualDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualDeparture');
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByDestination(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destination', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByDriverId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByEstimatedArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedArrival');
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByOrigin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'origin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByPlannedArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedArrival');
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByPlannedDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedDeparture');
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByTripCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tripCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByTripId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tripId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TripLocal, TripLocal, QDistinct> distinctByVehicleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleId', caseSensitive: caseSensitive);
    });
  }
}

extension TripLocalQueryProperty
    on QueryBuilder<TripLocal, TripLocal, QQueryProperty> {
  QueryBuilder<TripLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TripLocal, DateTime?, QQueryOperations> actualArrivalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualArrival');
    });
  }

  QueryBuilder<TripLocal, DateTime?, QQueryOperations>
      actualDepartureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualDeparture');
    });
  }

  QueryBuilder<TripLocal, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TripLocal, String?, QQueryOperations> destinationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destination');
    });
  }

  QueryBuilder<TripLocal, String?, QQueryOperations> driverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverId');
    });
  }

  QueryBuilder<TripLocal, DateTime?, QQueryOperations>
      estimatedArrivalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedArrival');
    });
  }

  QueryBuilder<TripLocal, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<TripLocal, String?, QQueryOperations> originProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'origin');
    });
  }

  QueryBuilder<TripLocal, DateTime?, QQueryOperations>
      plannedArrivalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedArrival');
    });
  }

  QueryBuilder<TripLocal, DateTime?, QQueryOperations>
      plannedDepartureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedDeparture');
    });
  }

  QueryBuilder<TripLocal, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TripLocal, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<TripLocal, String?, QQueryOperations> tripCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tripCode');
    });
  }

  QueryBuilder<TripLocal, String, QQueryOperations> tripIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tripId');
    });
  }

  QueryBuilder<TripLocal, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TripLocal, String?, QQueryOperations> vehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleId');
    });
  }
}
