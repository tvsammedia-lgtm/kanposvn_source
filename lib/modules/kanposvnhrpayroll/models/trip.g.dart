// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTripCollection on Isar {
  IsarCollection<Trip> get trips => this.collection();
}

const TripSchema = CollectionSchema(
  name: r'Trip',
  id: 2639069002795865543,
  properties: {
    r'assistantDriverId': PropertySchema(
      id: 0,
      name: r'assistantDriverId',
      type: IsarType.long,
    ),
    r'assistantDriverName': PropertySchema(
      id: 1,
      name: r'assistantDriverName',
      type: IsarType.string,
    ),
    r'cargoType': PropertySchema(
      id: 2,
      name: r'cargoType',
      type: IsarType.string,
    ),
    r'cargoWeight': PropertySchema(
      id: 3,
      name: r'cargoWeight',
      type: IsarType.double,
    ),
    r'containerNumber': PropertySchema(
      id: 4,
      name: r'containerNumber',
      type: IsarType.string,
    ),
    r'coordinatorName': PropertySchema(
      id: 5,
      name: r'coordinatorName',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 6,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerName': PropertySchema(
      id: 7,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'deliveryPoint': PropertySchema(
      id: 8,
      name: r'deliveryPoint',
      type: IsarType.string,
    ),
    r'departureDate': PropertySchema(
      id: 9,
      name: r'departureDate',
      type: IsarType.dateTime,
    ),
    r'distanceKm': PropertySchema(
      id: 10,
      name: r'distanceKm',
      type: IsarType.double,
    ),
    r'expenses': PropertySchema(
      id: 11,
      name: r'expenses',
      type: IsarType.double,
    ),
    r'lastSyncAt': PropertySchema(
      id: 12,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'mainDriverId': PropertySchema(
      id: 13,
      name: r'mainDriverId',
      type: IsarType.long,
    ),
    r'mainDriverName': PropertySchema(
      id: 14,
      name: r'mainDriverName',
      type: IsarType.string,
    ),
    r'moocPlate': PropertySchema(
      id: 15,
      name: r'moocPlate',
      type: IsarType.string,
    ),
    r'needsSync': PropertySchema(
      id: 16,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 17,
      name: r'notes',
      type: IsarType.string,
    ),
    r'pickupPoint': PropertySchema(
      id: 18,
      name: r'pickupPoint',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 19,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'returnDate': PropertySchema(
      id: 20,
      name: r'returnDate',
      type: IsarType.dateTime,
    ),
    r'revenue': PropertySchema(
      id: 21,
      name: r'revenue',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 22,
      name: r'status',
      type: IsarType.string,
      enumMap: _TripstatusEnumValueMap,
    ),
    r'tripCode': PropertySchema(
      id: 23,
      name: r'tripCode',
      type: IsarType.string,
    ),
    r'tripDate': PropertySchema(
      id: 24,
      name: r'tripDate',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 25,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehiclePlate': PropertySchema(
      id: 26,
      name: r'vehiclePlate',
      type: IsarType.string,
    )
  },
  estimateSize: _tripEstimateSize,
  serialize: _tripSerialize,
  deserialize: _tripDeserialize,
  deserializeProp: _tripDeserializeProp,
  idName: r'id',
  indexes: {
    r'tripCode': IndexSchema(
      id: 6412868145314804800,
      name: r'tripCode',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tripCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _tripGetId,
  getLinks: _tripGetLinks,
  attach: _tripAttach,
  version: '3.1.0+1',
);

int _tripEstimateSize(
  Trip object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.assistantDriverName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cargoType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.containerNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.coordinatorName;
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
    final value = object.deliveryPoint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mainDriverName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.moocPlate;
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
    final value = object.pickupPoint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.tripCode.length * 3;
  {
    final value = object.vehiclePlate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _tripSerialize(
  Trip object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.assistantDriverId);
  writer.writeString(offsets[1], object.assistantDriverName);
  writer.writeString(offsets[2], object.cargoType);
  writer.writeDouble(offsets[3], object.cargoWeight);
  writer.writeString(offsets[4], object.containerNumber);
  writer.writeString(offsets[5], object.coordinatorName);
  writer.writeDateTime(offsets[6], object.createdAt);
  writer.writeString(offsets[7], object.customerName);
  writer.writeString(offsets[8], object.deliveryPoint);
  writer.writeDateTime(offsets[9], object.departureDate);
  writer.writeDouble(offsets[10], object.distanceKm);
  writer.writeDouble(offsets[11], object.expenses);
  writer.writeDateTime(offsets[12], object.lastSyncAt);
  writer.writeLong(offsets[13], object.mainDriverId);
  writer.writeString(offsets[14], object.mainDriverName);
  writer.writeString(offsets[15], object.moocPlate);
  writer.writeBool(offsets[16], object.needsSync);
  writer.writeString(offsets[17], object.notes);
  writer.writeString(offsets[18], object.pickupPoint);
  writer.writeString(offsets[19], object.remoteId);
  writer.writeDateTime(offsets[20], object.returnDate);
  writer.writeDouble(offsets[21], object.revenue);
  writer.writeString(offsets[22], object.status.name);
  writer.writeString(offsets[23], object.tripCode);
  writer.writeDateTime(offsets[24], object.tripDate);
  writer.writeDateTime(offsets[25], object.updatedAt);
  writer.writeString(offsets[26], object.vehiclePlate);
}

Trip _tripDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Trip();
  object.assistantDriverId = reader.readLongOrNull(offsets[0]);
  object.assistantDriverName = reader.readStringOrNull(offsets[1]);
  object.cargoType = reader.readStringOrNull(offsets[2]);
  object.cargoWeight = reader.readDoubleOrNull(offsets[3]);
  object.containerNumber = reader.readStringOrNull(offsets[4]);
  object.coordinatorName = reader.readStringOrNull(offsets[5]);
  object.createdAt = reader.readDateTime(offsets[6]);
  object.customerName = reader.readStringOrNull(offsets[7]);
  object.deliveryPoint = reader.readStringOrNull(offsets[8]);
  object.departureDate = reader.readDateTimeOrNull(offsets[9]);
  object.distanceKm = reader.readDoubleOrNull(offsets[10]);
  object.expenses = reader.readDoubleOrNull(offsets[11]);
  object.id = id;
  object.lastSyncAt = reader.readDateTimeOrNull(offsets[12]);
  object.mainDriverId = reader.readLongOrNull(offsets[13]);
  object.mainDriverName = reader.readStringOrNull(offsets[14]);
  object.moocPlate = reader.readStringOrNull(offsets[15]);
  object.needsSync = reader.readBool(offsets[16]);
  object.notes = reader.readStringOrNull(offsets[17]);
  object.pickupPoint = reader.readStringOrNull(offsets[18]);
  object.remoteId = reader.readStringOrNull(offsets[19]);
  object.returnDate = reader.readDateTimeOrNull(offsets[20]);
  object.revenue = reader.readDoubleOrNull(offsets[21]);
  object.status =
      _TripstatusValueEnumMap[reader.readStringOrNull(offsets[22])] ??
          TripStatus.assigned;
  object.tripCode = reader.readString(offsets[23]);
  object.tripDate = reader.readDateTimeOrNull(offsets[24]);
  object.updatedAt = reader.readDateTime(offsets[25]);
  object.vehiclePlate = reader.readStringOrNull(offsets[26]);
  return object;
}

P _tripDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 21:
      return (reader.readDoubleOrNull(offset)) as P;
    case 22:
      return (_TripstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          TripStatus.assigned) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 25:
      return (reader.readDateTime(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TripstatusEnumValueMap = {
  r'assigned': r'assigned',
  r'inProgress': r'inProgress',
  r'completed': r'completed',
  r'cancelled': r'cancelled',
};
const _TripstatusValueEnumMap = {
  r'assigned': TripStatus.assigned,
  r'inProgress': TripStatus.inProgress,
  r'completed': TripStatus.completed,
  r'cancelled': TripStatus.cancelled,
};

Id _tripGetId(Trip object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tripGetLinks(Trip object) {
  return [];
}

void _tripAttach(IsarCollection<dynamic> col, Id id, Trip object) {
  object.id = id;
}

extension TripByIndex on IsarCollection<Trip> {
  Future<Trip?> getByTripCode(String tripCode) {
    return getByIndex(r'tripCode', [tripCode]);
  }

  Trip? getByTripCodeSync(String tripCode) {
    return getByIndexSync(r'tripCode', [tripCode]);
  }

  Future<bool> deleteByTripCode(String tripCode) {
    return deleteByIndex(r'tripCode', [tripCode]);
  }

  bool deleteByTripCodeSync(String tripCode) {
    return deleteByIndexSync(r'tripCode', [tripCode]);
  }

  Future<List<Trip?>> getAllByTripCode(List<String> tripCodeValues) {
    final values = tripCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'tripCode', values);
  }

  List<Trip?> getAllByTripCodeSync(List<String> tripCodeValues) {
    final values = tripCodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'tripCode', values);
  }

  Future<int> deleteAllByTripCode(List<String> tripCodeValues) {
    final values = tripCodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'tripCode', values);
  }

  int deleteAllByTripCodeSync(List<String> tripCodeValues) {
    final values = tripCodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'tripCode', values);
  }

  Future<Id> putByTripCode(Trip object) {
    return putByIndex(r'tripCode', object);
  }

  Id putByTripCodeSync(Trip object, {bool saveLinks = true}) {
    return putByIndexSync(r'tripCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTripCode(List<Trip> objects) {
    return putAllByIndex(r'tripCode', objects);
  }

  List<Id> putAllByTripCodeSync(List<Trip> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'tripCode', objects, saveLinks: saveLinks);
  }
}

extension TripQueryWhereSort on QueryBuilder<Trip, Trip, QWhere> {
  QueryBuilder<Trip, Trip, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TripQueryWhere on QueryBuilder<Trip, Trip, QWhereClause> {
  QueryBuilder<Trip, Trip, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Trip, Trip, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Trip, Trip, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Trip, Trip, QAfterWhereClause> idBetween(
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

  QueryBuilder<Trip, Trip, QAfterWhereClause> tripCodeEqualTo(String tripCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tripCode',
        value: [tripCode],
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterWhereClause> tripCodeNotEqualTo(
      String tripCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripCode',
              lower: [],
              upper: [tripCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripCode',
              lower: [tripCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripCode',
              lower: [tripCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripCode',
              lower: [],
              upper: [tripCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TripQueryFilter on QueryBuilder<Trip, Trip, QFilterCondition> {
  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assistantDriverId',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assistantDriverId',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assistantDriverId',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assistantDriverId',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assistantDriverId',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assistantDriverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assistantDriverName',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition>
      assistantDriverNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assistantDriverName',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assistantDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition>
      assistantDriverNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assistantDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assistantDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assistantDriverName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assistantDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assistantDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assistantDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assistantDriverName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> assistantDriverNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assistantDriverName',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition>
      assistantDriverNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assistantDriverName',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cargoType',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cargoType',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cargoType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cargoType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cargoType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cargoType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cargoType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cargoType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cargoType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cargoType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cargoType',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cargoType',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cargoWeight',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cargoWeight',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoWeightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cargoWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoWeightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cargoWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoWeightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cargoWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> cargoWeightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cargoWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'containerNumber',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'containerNumber',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'containerNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'containerNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'containerNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'containerNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'containerNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'containerNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'containerNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> containerNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'containerNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coordinatorName',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coordinatorName',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coordinatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coordinatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coordinatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coordinatorName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coordinatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coordinatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coordinatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coordinatorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coordinatorName',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> coordinatorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coordinatorName',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameEqualTo(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameGreaterThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameLessThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameBetween(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameStartsWith(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameEndsWith(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveryPoint',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveryPoint',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveryPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveryPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveryPoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deliveryPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deliveryPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deliveryPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deliveryPoint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryPoint',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> deliveryPointIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deliveryPoint',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> departureDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'departureDate',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> departureDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'departureDate',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> departureDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departureDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> departureDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'departureDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> departureDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'departureDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> departureDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'departureDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> distanceKmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'distanceKm',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> distanceKmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'distanceKm',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> distanceKmEqualTo(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> distanceKmGreaterThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> distanceKmLessThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> distanceKmBetween(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> expensesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenses',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> expensesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenses',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> expensesEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenses',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> expensesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenses',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> expensesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenses',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> expensesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenses',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> lastSyncAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> lastSyncAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> lastSyncAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> lastSyncAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mainDriverId',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mainDriverId',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainDriverId',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mainDriverId',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mainDriverId',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mainDriverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mainDriverName',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mainDriverName',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mainDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mainDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mainDriverName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mainDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mainDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mainDriverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mainDriverName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainDriverName',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> mainDriverNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mainDriverName',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moocPlate',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moocPlate',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'moocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'moocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'moocPlate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'moocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'moocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'moocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'moocPlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moocPlate',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> moocPlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'moocPlate',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> needsSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickupPoint',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickupPoint',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickupPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickupPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickupPoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pickupPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pickupPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pickupPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pickupPoint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupPoint',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> pickupPointIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pickupPoint',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> returnDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'returnDate',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> returnDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'returnDate',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> returnDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> returnDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> returnDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> returnDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> revenueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revenue',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> revenueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revenue',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> revenueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> revenueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> revenueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> revenueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> statusEqualTo(
    TripStatus value, {
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> statusGreaterThan(
    TripStatus value, {
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> statusLessThan(
    TripStatus value, {
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> statusBetween(
    TripStatus lower,
    TripStatus upper, {
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> statusContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> statusMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripCodeEqualTo(
    String value, {
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripCodeGreaterThan(
    String value, {
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripCodeLessThan(
    String value, {
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripCodeBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripCodeStartsWith(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripCodeEndsWith(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripCodeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tripCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripCodeMatches(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tripCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tripDate',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tripDate',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tripDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tripDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> tripDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tripDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehiclePlate',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehiclePlate',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehiclePlate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehiclePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehiclePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<Trip, Trip, QAfterFilterCondition> vehiclePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehiclePlate',
        value: '',
      ));
    });
  }
}

extension TripQueryObject on QueryBuilder<Trip, Trip, QFilterCondition> {}

extension TripQueryLinks on QueryBuilder<Trip, Trip, QFilterCondition> {}

extension TripQuerySortBy on QueryBuilder<Trip, Trip, QSortBy> {
  QueryBuilder<Trip, Trip, QAfterSortBy> sortByAssistantDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assistantDriverId', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByAssistantDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assistantDriverId', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByAssistantDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assistantDriverName', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByAssistantDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assistantDriverName', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByCargoType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoType', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByCargoTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoType', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByCargoWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoWeight', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByCargoWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoWeight', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByContainerNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerNumber', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByContainerNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerNumber', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByCoordinatorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coordinatorName', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByCoordinatorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coordinatorName', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByDeliveryPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryPoint', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByDeliveryPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryPoint', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByDepartureDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureDate', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByDepartureDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureDate', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenses', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByExpensesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenses', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByMainDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainDriverId', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByMainDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainDriverId', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByMainDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainDriverName', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByMainDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainDriverName', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByMoocPlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moocPlate', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByMoocPlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moocPlate', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByPickupPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupPoint', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByPickupPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupPoint', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByReturnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenue', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenue', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByTripCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripCode', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByTripCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripCode', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByTripDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripDate', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByTripDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripDate', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByVehiclePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> sortByVehiclePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.desc);
    });
  }
}

extension TripQuerySortThenBy on QueryBuilder<Trip, Trip, QSortThenBy> {
  QueryBuilder<Trip, Trip, QAfterSortBy> thenByAssistantDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assistantDriverId', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByAssistantDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assistantDriverId', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByAssistantDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assistantDriverName', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByAssistantDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assistantDriverName', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByCargoType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoType', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByCargoTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoType', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByCargoWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoWeight', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByCargoWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoWeight', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByContainerNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerNumber', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByContainerNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerNumber', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByCoordinatorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coordinatorName', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByCoordinatorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coordinatorName', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByDeliveryPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryPoint', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByDeliveryPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryPoint', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByDepartureDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureDate', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByDepartureDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureDate', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenses', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByExpensesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenses', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByMainDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainDriverId', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByMainDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainDriverId', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByMainDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainDriverName', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByMainDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainDriverName', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByMoocPlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moocPlate', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByMoocPlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moocPlate', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByPickupPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupPoint', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByPickupPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupPoint', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByReturnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenue', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenue', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByTripCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripCode', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByTripCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripCode', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByTripDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripDate', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByTripDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripDate', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByVehiclePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.asc);
    });
  }

  QueryBuilder<Trip, Trip, QAfterSortBy> thenByVehiclePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.desc);
    });
  }
}

extension TripQueryWhereDistinct on QueryBuilder<Trip, Trip, QDistinct> {
  QueryBuilder<Trip, Trip, QDistinct> distinctByAssistantDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assistantDriverId');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByAssistantDriverName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assistantDriverName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByCargoType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cargoType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByCargoWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cargoWeight');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByContainerNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'containerNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByCoordinatorName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coordinatorName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByCustomerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByDeliveryPoint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveryPoint',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByDepartureDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'departureDate');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceKm');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenses');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByMainDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mainDriverId');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByMainDriverName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mainDriverName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByMoocPlate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moocPlate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByPickupPoint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupPoint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnDate');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenue');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByTripCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tripCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByTripDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tripDate');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Trip, Trip, QDistinct> distinctByVehiclePlate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehiclePlate', caseSensitive: caseSensitive);
    });
  }
}

extension TripQueryProperty on QueryBuilder<Trip, Trip, QQueryProperty> {
  QueryBuilder<Trip, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Trip, int?, QQueryOperations> assistantDriverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assistantDriverId');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> assistantDriverNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assistantDriverName');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> cargoTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cargoType');
    });
  }

  QueryBuilder<Trip, double?, QQueryOperations> cargoWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cargoWeight');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> containerNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containerNumber');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> coordinatorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coordinatorName');
    });
  }

  QueryBuilder<Trip, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> deliveryPointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveryPoint');
    });
  }

  QueryBuilder<Trip, DateTime?, QQueryOperations> departureDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'departureDate');
    });
  }

  QueryBuilder<Trip, double?, QQueryOperations> distanceKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceKm');
    });
  }

  QueryBuilder<Trip, double?, QQueryOperations> expensesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenses');
    });
  }

  QueryBuilder<Trip, DateTime?, QQueryOperations> lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<Trip, int?, QQueryOperations> mainDriverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mainDriverId');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> mainDriverNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mainDriverName');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> moocPlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moocPlate');
    });
  }

  QueryBuilder<Trip, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> pickupPointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupPoint');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<Trip, DateTime?, QQueryOperations> returnDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnDate');
    });
  }

  QueryBuilder<Trip, double?, QQueryOperations> revenueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenue');
    });
  }

  QueryBuilder<Trip, TripStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Trip, String, QQueryOperations> tripCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tripCode');
    });
  }

  QueryBuilder<Trip, DateTime?, QQueryOperations> tripDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tripDate');
    });
  }

  QueryBuilder<Trip, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Trip, String?, QQueryOperations> vehiclePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehiclePlate');
    });
  }
}
