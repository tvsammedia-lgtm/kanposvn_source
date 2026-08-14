// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_driver.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideDriverCollection on Isar {
  IsarCollection<RideDriver> get rideDrivers => this.collection();
}

const RideDriverSchema = CollectionSchema(
  name: r'RideDriver',
  id: -255406128120955466,
  properties: {
    r'avatarUrl': PropertySchema(
      id: 0,
      name: r'avatarUrl',
      type: IsarType.string,
    ),
    r'averageRating': PropertySchema(
      id: 1,
      name: r'averageRating',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentLat': PropertySchema(
      id: 3,
      name: r'currentLat',
      type: IsarType.double,
    ),
    r'currentLng': PropertySchema(
      id: 4,
      name: r'currentLng',
      type: IsarType.double,
    ),
    r'driverWalletBalance': PropertySchema(
      id: 5,
      name: r'driverWalletBalance',
      type: IsarType.double,
    ),
    r'fullName': PropertySchema(
      id: 6,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 7,
      name: r'phone',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 8,
      name: r'status',
      type: IsarType.byte,
      enumMap: _RideDriverstatusEnumValueMap,
    ),
    r'syncStatus': PropertySchema(
      id: 9,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _RideDriversyncStatusEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 11,
      name: r'uuid',
      type: IsarType.string,
    ),
    r'vehiclePlate': PropertySchema(
      id: 12,
      name: r'vehiclePlate',
      type: IsarType.string,
    ),
    r'vehicleType': PropertySchema(
      id: 13,
      name: r'vehicleType',
      type: IsarType.byte,
      enumMap: _RideDrivervehicleTypeEnumValueMap,
    )
  },
  estimateSize: _rideDriverEstimateSize,
  serialize: _rideDriverSerialize,
  deserialize: _rideDriverDeserialize,
  deserializeProp: _rideDriverDeserializeProp,
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
  getId: _rideDriverGetId,
  getLinks: _rideDriverGetLinks,
  attach: _rideDriverAttach,
  version: '3.1.0+1',
);

int _rideDriverEstimateSize(
  RideDriver object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatarUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fullName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
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
    final value = object.vehiclePlate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _rideDriverSerialize(
  RideDriver object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatarUrl);
  writer.writeDouble(offsets[1], object.averageRating);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDouble(offsets[3], object.currentLat);
  writer.writeDouble(offsets[4], object.currentLng);
  writer.writeDouble(offsets[5], object.driverWalletBalance);
  writer.writeString(offsets[6], object.fullName);
  writer.writeString(offsets[7], object.phone);
  writer.writeByte(offsets[8], object.status.index);
  writer.writeByte(offsets[9], object.syncStatus.index);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeString(offsets[11], object.uuid);
  writer.writeString(offsets[12], object.vehiclePlate);
  writer.writeByte(offsets[13], object.vehicleType.index);
}

RideDriver _rideDriverDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideDriver();
  object.avatarUrl = reader.readStringOrNull(offsets[0]);
  object.averageRating = reader.readDouble(offsets[1]);
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.currentLat = reader.readDoubleOrNull(offsets[3]);
  object.currentLng = reader.readDoubleOrNull(offsets[4]);
  object.driverWalletBalance = reader.readDouble(offsets[5]);
  object.fullName = reader.readStringOrNull(offsets[6]);
  object.id = id;
  object.phone = reader.readStringOrNull(offsets[7]);
  object.status =
      _RideDriverstatusValueEnumMap[reader.readByteOrNull(offsets[8])] ??
          DriverStatus.online;
  object.syncStatus =
      _RideDriversyncStatusValueEnumMap[reader.readByteOrNull(offsets[9])] ??
          SyncStatus.synced;
  object.updatedAt = reader.readDateTimeOrNull(offsets[10]);
  object.uuid = reader.readStringOrNull(offsets[11]);
  object.vehiclePlate = reader.readStringOrNull(offsets[12]);
  object.vehicleType =
      _RideDrivervehicleTypeValueEnumMap[reader.readByteOrNull(offsets[13])] ??
          VehicleType.motorBike;
  return object;
}

P _rideDriverDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (_RideDriverstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          DriverStatus.online) as P;
    case 9:
      return (_RideDriversyncStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.synced) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (_RideDrivervehicleTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          VehicleType.motorBike) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RideDriverstatusEnumValueMap = {
  'online': 0,
  'offline': 1,
  'busy': 2,
};
const _RideDriverstatusValueEnumMap = {
  0: DriverStatus.online,
  1: DriverStatus.offline,
  2: DriverStatus.busy,
};
const _RideDriversyncStatusEnumValueMap = {
  'synced': 0,
  'pending': 1,
  'failed': 2,
};
const _RideDriversyncStatusValueEnumMap = {
  0: SyncStatus.synced,
  1: SyncStatus.pending,
  2: SyncStatus.failed,
};
const _RideDrivervehicleTypeEnumValueMap = {
  'motorBike': 0,
  'evBike': 1,
  'car4Seats': 2,
  'car7Seats': 3,
  'delivery': 4,
};
const _RideDrivervehicleTypeValueEnumMap = {
  0: VehicleType.motorBike,
  1: VehicleType.evBike,
  2: VehicleType.car4Seats,
  3: VehicleType.car7Seats,
  4: VehicleType.delivery,
};

Id _rideDriverGetId(RideDriver object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideDriverGetLinks(RideDriver object) {
  return [];
}

void _rideDriverAttach(IsarCollection<dynamic> col, Id id, RideDriver object) {
  object.id = id;
}

extension RideDriverByIndex on IsarCollection<RideDriver> {
  Future<RideDriver?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  RideDriver? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<RideDriver?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<RideDriver?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(RideDriver object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(RideDriver object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<RideDriver> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<RideDriver> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension RideDriverQueryWhereSort
    on QueryBuilder<RideDriver, RideDriver, QWhere> {
  QueryBuilder<RideDriver, RideDriver, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RideDriverQueryWhere
    on QueryBuilder<RideDriver, RideDriver, QWhereClause> {
  QueryBuilder<RideDriver, RideDriver, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<RideDriver, RideDriver, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterWhereClause> idBetween(
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

  QueryBuilder<RideDriver, RideDriver, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterWhereClause> uuidNotEqualTo(
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

extension RideDriverQueryFilter
    on QueryBuilder<RideDriver, RideDriver, QFilterCondition> {
  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      avatarUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatarUrl',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      avatarUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatarUrl',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> avatarUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      avatarUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> avatarUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> avatarUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      avatarUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> avatarUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> avatarUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> avatarUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatarUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      avatarUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      avatarUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      averageRatingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      averageRatingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      averageRatingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      averageRatingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      currentLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentLat',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      currentLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentLat',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> currentLatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      currentLatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      currentLatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> currentLatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      currentLngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentLng',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      currentLngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentLng',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> currentLngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      currentLngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      currentLngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> currentLngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentLng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      driverWalletBalanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverWalletBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      driverWalletBalanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverWalletBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      driverWalletBalanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverWalletBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      driverWalletBalanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverWalletBalance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> fullNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      fullNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> fullNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      fullNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> fullNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> fullNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> fullNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> fullNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> phoneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> phoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> statusEqualTo(
      DriverStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> statusGreaterThan(
    DriverStatus value, {
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> statusLessThan(
    DriverStatus value, {
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> statusBetween(
    DriverStatus lower,
    DriverStatus upper, {
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> syncStatusEqualTo(
      SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> syncStatusBetween(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidContains(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehiclePlate',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehiclePlate',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateEqualTo(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateGreaterThan(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateLessThan(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateBetween(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateStartsWith(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateEndsWith(
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

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehiclePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehiclePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehiclePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehiclePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehicleTypeEqualTo(VehicleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleType',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehicleTypeGreaterThan(
    VehicleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleType',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehicleTypeLessThan(
    VehicleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleType',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterFilterCondition>
      vehicleTypeBetween(
    VehicleType lower,
    VehicleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RideDriverQueryObject
    on QueryBuilder<RideDriver, RideDriver, QFilterCondition> {}

extension RideDriverQueryLinks
    on QueryBuilder<RideDriver, RideDriver, QFilterCondition> {}

extension RideDriverQuerySortBy
    on QueryBuilder<RideDriver, RideDriver, QSortBy> {
  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByAverageRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageRating', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByAverageRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageRating', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByCurrentLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByCurrentLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByCurrentLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByCurrentLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy>
      sortByDriverWalletBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverWalletBalance', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy>
      sortByDriverWalletBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverWalletBalance', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByVehiclePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByVehiclePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> sortByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension RideDriverQuerySortThenBy
    on QueryBuilder<RideDriver, RideDriver, QSortThenBy> {
  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByAverageRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageRating', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByAverageRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageRating', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByCurrentLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByCurrentLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByCurrentLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByCurrentLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy>
      thenByDriverWalletBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverWalletBalance', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy>
      thenByDriverWalletBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverWalletBalance', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByVehiclePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByVehiclePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.desc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QAfterSortBy> thenByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension RideDriverQueryWhereDistinct
    on QueryBuilder<RideDriver, RideDriver, QDistinct> {
  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByAvatarUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByAverageRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageRating');
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByCurrentLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLat');
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByCurrentLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLng');
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct>
      distinctByDriverWalletBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverWalletBalance');
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByVehiclePlate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehiclePlate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDriver, RideDriver, QDistinct> distinctByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleType');
    });
  }
}

extension RideDriverQueryProperty
    on QueryBuilder<RideDriver, RideDriver, QQueryProperty> {
  QueryBuilder<RideDriver, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideDriver, String?, QQueryOperations> avatarUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarUrl');
    });
  }

  QueryBuilder<RideDriver, double, QQueryOperations> averageRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageRating');
    });
  }

  QueryBuilder<RideDriver, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RideDriver, double?, QQueryOperations> currentLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLat');
    });
  }

  QueryBuilder<RideDriver, double?, QQueryOperations> currentLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLng');
    });
  }

  QueryBuilder<RideDriver, double, QQueryOperations>
      driverWalletBalanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverWalletBalance');
    });
  }

  QueryBuilder<RideDriver, String?, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<RideDriver, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<RideDriver, DriverStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<RideDriver, SyncStatus, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<RideDriver, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<RideDriver, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }

  QueryBuilder<RideDriver, String?, QQueryOperations> vehiclePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehiclePlate');
    });
  }

  QueryBuilder<RideDriver, VehicleType, QQueryOperations>
      vehicleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleType');
    });
  }
}
