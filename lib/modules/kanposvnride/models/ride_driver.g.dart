// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_driver.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKanRideDriverCollection on Isar {
  IsarCollection<KanRideDriver> get kanRideDrivers => this.collection();
}

const KanRideDriverSchema = CollectionSchema(
  name: r'KanRideDriver',
  id: 1010732351089991976,
  properties: {
    r'avatar': PropertySchema(
      id: 0,
      name: r'avatar',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentLat': PropertySchema(
      id: 2,
      name: r'currentLat',
      type: IsarType.double,
    ),
    r'currentLng': PropertySchema(
      id: 3,
      name: r'currentLng',
      type: IsarType.double,
    ),
    r'driverId': PropertySchema(
      id: 4,
      name: r'driverId',
      type: IsarType.string,
    ),
    r'fullName': PropertySchema(
      id: 5,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'isOnline': PropertySchema(
      id: 6,
      name: r'isOnline',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 7,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'phone': PropertySchema(
      id: 8,
      name: r'phone',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 9,
      name: r'rating',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehicleLicensePlate': PropertySchema(
      id: 12,
      name: r'vehicleLicensePlate',
      type: IsarType.string,
    ),
    r'vehicleModel': PropertySchema(
      id: 13,
      name: r'vehicleModel',
      type: IsarType.string,
    ),
    r'vehicleTypeId': PropertySchema(
      id: 14,
      name: r'vehicleTypeId',
      type: IsarType.string,
    )
  },
  estimateSize: _kanRideDriverEstimateSize,
  serialize: _kanRideDriverSerialize,
  deserialize: _kanRideDriverDeserialize,
  deserializeProp: _kanRideDriverDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'driverId': IndexSchema(
      id: -2215465182691497637,
      name: r'driverId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'driverId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _kanRideDriverGetId,
  getLinks: _kanRideDriverGetLinks,
  attach: _kanRideDriverAttach,
  version: '3.1.0+1',
);

int _kanRideDriverEstimateSize(
  KanRideDriver object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.avatar.length * 3;
  bytesCount += 3 + object.driverId.length * 3;
  bytesCount += 3 + object.fullName.length * 3;
  bytesCount += 3 + object.phone.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.vehicleLicensePlate.length * 3;
  bytesCount += 3 + object.vehicleModel.length * 3;
  bytesCount += 3 + object.vehicleTypeId.length * 3;
  return bytesCount;
}

void _kanRideDriverSerialize(
  KanRideDriver object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatar);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDouble(offsets[2], object.currentLat);
  writer.writeDouble(offsets[3], object.currentLng);
  writer.writeString(offsets[4], object.driverId);
  writer.writeString(offsets[5], object.fullName);
  writer.writeBool(offsets[6], object.isOnline);
  writer.writeBool(offsets[7], object.isSynced);
  writer.writeString(offsets[8], object.phone);
  writer.writeDouble(offsets[9], object.rating);
  writer.writeString(offsets[10], object.status);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeString(offsets[12], object.vehicleLicensePlate);
  writer.writeString(offsets[13], object.vehicleModel);
  writer.writeString(offsets[14], object.vehicleTypeId);
}

KanRideDriver _kanRideDriverDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KanRideDriver();
  object.avatar = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.currentLat = reader.readDoubleOrNull(offsets[2]);
  object.currentLng = reader.readDoubleOrNull(offsets[3]);
  object.driverId = reader.readString(offsets[4]);
  object.fullName = reader.readString(offsets[5]);
  object.isOnline = reader.readBool(offsets[6]);
  object.isSynced = reader.readBool(offsets[7]);
  object.isarId = id;
  object.phone = reader.readString(offsets[8]);
  object.rating = reader.readDouble(offsets[9]);
  object.status = reader.readString(offsets[10]);
  object.updatedAt = reader.readDateTime(offsets[11]);
  object.vehicleLicensePlate = reader.readString(offsets[12]);
  object.vehicleModel = reader.readString(offsets[13]);
  object.vehicleTypeId = reader.readString(offsets[14]);
  return object;
}

P _kanRideDriverDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kanRideDriverGetId(KanRideDriver object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _kanRideDriverGetLinks(KanRideDriver object) {
  return [];
}

void _kanRideDriverAttach(
    IsarCollection<dynamic> col, Id id, KanRideDriver object) {
  object.isarId = id;
}

extension KanRideDriverByIndex on IsarCollection<KanRideDriver> {
  Future<KanRideDriver?> getByDriverId(String driverId) {
    return getByIndex(r'driverId', [driverId]);
  }

  KanRideDriver? getByDriverIdSync(String driverId) {
    return getByIndexSync(r'driverId', [driverId]);
  }

  Future<bool> deleteByDriverId(String driverId) {
    return deleteByIndex(r'driverId', [driverId]);
  }

  bool deleteByDriverIdSync(String driverId) {
    return deleteByIndexSync(r'driverId', [driverId]);
  }

  Future<List<KanRideDriver?>> getAllByDriverId(List<String> driverIdValues) {
    final values = driverIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'driverId', values);
  }

  List<KanRideDriver?> getAllByDriverIdSync(List<String> driverIdValues) {
    final values = driverIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'driverId', values);
  }

  Future<int> deleteAllByDriverId(List<String> driverIdValues) {
    final values = driverIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'driverId', values);
  }

  int deleteAllByDriverIdSync(List<String> driverIdValues) {
    final values = driverIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'driverId', values);
  }

  Future<Id> putByDriverId(KanRideDriver object) {
    return putByIndex(r'driverId', object);
  }

  Id putByDriverIdSync(KanRideDriver object, {bool saveLinks = true}) {
    return putByIndexSync(r'driverId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDriverId(List<KanRideDriver> objects) {
    return putAllByIndex(r'driverId', objects);
  }

  List<Id> putAllByDriverIdSync(List<KanRideDriver> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'driverId', objects, saveLinks: saveLinks);
  }
}

extension KanRideDriverQueryWhereSort
    on QueryBuilder<KanRideDriver, KanRideDriver, QWhere> {
  QueryBuilder<KanRideDriver, KanRideDriver, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KanRideDriverQueryWhere
    on QueryBuilder<KanRideDriver, KanRideDriver, QWhereClause> {
  QueryBuilder<KanRideDriver, KanRideDriver, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterWhereClause>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterWhereClause> driverIdEqualTo(
      String driverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'driverId',
        value: [driverId],
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterWhereClause>
      driverIdNotEqualTo(String driverId) {
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
}

extension KanRideDriverQueryFilter
    on QueryBuilder<KanRideDriver, KanRideDriver, QFilterCondition> {
  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      avatarEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      avatarGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      avatarLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      avatarBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      avatarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      avatarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      avatarContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      avatarMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      avatarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      avatarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      currentLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentLat',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      currentLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentLat',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      currentLatEqualTo(
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      currentLatBetween(
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      currentLngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentLng',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      currentLngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentLng',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      currentLngEqualTo(
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      currentLngBetween(
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      driverIdEqualTo(
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      driverIdBetween(
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      driverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      driverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      driverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      driverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      fullNameEqualTo(
    String value, {
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      fullNameGreaterThan(
    String value, {
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      fullNameLessThan(
    String value, {
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      fullNameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      fullNameEndsWith(
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      fullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      fullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      isOnlineEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOnline',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      phoneEqualTo(
    String value, {
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      phoneGreaterThan(
    String value, {
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      phoneLessThan(
    String value, {
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      phoneBetween(
    String lower,
    String upper, {
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      phoneStartsWith(
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      phoneEndsWith(
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      ratingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      ratingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      ratingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      ratingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleLicensePlateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleLicensePlateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleLicensePlateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleLicensePlateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleLicensePlate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleLicensePlateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleLicensePlateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleLicensePlateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleLicensePlateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleLicensePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleLicensePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleLicensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleLicensePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleLicensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleModelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleModel',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleModel',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
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

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleTypeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleTypeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleTypeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleTypeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterFilterCondition>
      vehicleTypeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleTypeId',
        value: '',
      ));
    });
  }
}

extension KanRideDriverQueryObject
    on QueryBuilder<KanRideDriver, KanRideDriver, QFilterCondition> {}

extension KanRideDriverQueryLinks
    on QueryBuilder<KanRideDriver, KanRideDriver, QFilterCondition> {}

extension KanRideDriverQuerySortBy
    on QueryBuilder<KanRideDriver, KanRideDriver, QSortBy> {
  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByCurrentLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByCurrentLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByCurrentLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByCurrentLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByIsOnlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByVehicleLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicensePlate', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByVehicleLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicensePlate', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByVehicleModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleModel', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByVehicleModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleModel', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByVehicleTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      sortByVehicleTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.desc);
    });
  }
}

extension KanRideDriverQuerySortThenBy
    on QueryBuilder<KanRideDriver, KanRideDriver, QSortThenBy> {
  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByCurrentLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByCurrentLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByCurrentLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByCurrentLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByIsOnlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByVehicleLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicensePlate', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByVehicleLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicensePlate', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByVehicleModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleModel', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByVehicleModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleModel', Sort.desc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByVehicleTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.asc);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QAfterSortBy>
      thenByVehicleTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.desc);
    });
  }
}

extension KanRideDriverQueryWhereDistinct
    on QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> {
  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByAvatar(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatar', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByCurrentLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLat');
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByCurrentLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLng');
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByDriverId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOnline');
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct>
      distinctByVehicleLicensePlate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleLicensePlate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByVehicleModel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleModel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideDriver, KanRideDriver, QDistinct> distinctByVehicleTypeId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleTypeId',
          caseSensitive: caseSensitive);
    });
  }
}

extension KanRideDriverQueryProperty
    on QueryBuilder<KanRideDriver, KanRideDriver, QQueryProperty> {
  QueryBuilder<KanRideDriver, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<KanRideDriver, String, QQueryOperations> avatarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatar');
    });
  }

  QueryBuilder<KanRideDriver, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<KanRideDriver, double?, QQueryOperations> currentLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLat');
    });
  }

  QueryBuilder<KanRideDriver, double?, QQueryOperations> currentLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLng');
    });
  }

  QueryBuilder<KanRideDriver, String, QQueryOperations> driverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverId');
    });
  }

  QueryBuilder<KanRideDriver, String, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<KanRideDriver, bool, QQueryOperations> isOnlineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOnline');
    });
  }

  QueryBuilder<KanRideDriver, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<KanRideDriver, String, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<KanRideDriver, double, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<KanRideDriver, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<KanRideDriver, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<KanRideDriver, String, QQueryOperations>
      vehicleLicensePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleLicensePlate');
    });
  }

  QueryBuilder<KanRideDriver, String, QQueryOperations> vehicleModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleModel');
    });
  }

  QueryBuilder<KanRideDriver, String, QQueryOperations>
      vehicleTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleTypeId');
    });
  }
}
