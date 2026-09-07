// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVehicleLocalCollection on Isar {
  IsarCollection<VehicleLocal> get vehicleLocals => this.collection();
}

const VehicleLocalSchema = CollectionSchema(
  name: r'VehicleLocal',
  id: 1790211800593584397,
  properties: {
    r'capacityVolume': PropertySchema(
      id: 0,
      name: r'capacityVolume',
      type: IsarType.double,
    ),
    r'capacityWeight': PropertySchema(
      id: 1,
      name: r'capacityWeight',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentHeading': PropertySchema(
      id: 3,
      name: r'currentHeading',
      type: IsarType.double,
    ),
    r'currentLatitude': PropertySchema(
      id: 4,
      name: r'currentLatitude',
      type: IsarType.double,
    ),
    r'currentLongitude': PropertySchema(
      id: 5,
      name: r'currentLongitude',
      type: IsarType.double,
    ),
    r'currentSpeed': PropertySchema(
      id: 6,
      name: r'currentSpeed',
      type: IsarType.double,
    ),
    r'isDeleted': PropertySchema(
      id: 7,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'lastLocationAt': PropertySchema(
      id: 8,
      name: r'lastLocationAt',
      type: IsarType.dateTime,
    ),
    r'plateNumber': PropertySchema(
      id: 9,
      name: r'plateNumber',
      type: IsarType.string,
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
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehicleCode': PropertySchema(
      id: 13,
      name: r'vehicleCode',
      type: IsarType.string,
    ),
    r'vehicleId': PropertySchema(
      id: 14,
      name: r'vehicleId',
      type: IsarType.string,
    ),
    r'vehicleType': PropertySchema(
      id: 15,
      name: r'vehicleType',
      type: IsarType.string,
    )
  },
  estimateSize: _vehicleLocalEstimateSize,
  serialize: _vehicleLocalSerialize,
  deserialize: _vehicleLocalDeserialize,
  deserializeProp: _vehicleLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'vehicleId': IndexSchema(
      id: 2011968157433523416,
      name: r'vehicleId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'vehicleId',
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
  getId: _vehicleLocalGetId,
  getLinks: _vehicleLocalGetLinks,
  attach: _vehicleLocalAttach,
  version: '3.1.0+1',
);

int _vehicleLocalEstimateSize(
  VehicleLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.plateNumber;
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
    final value = object.vehicleCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.vehicleId.length * 3;
  {
    final value = object.vehicleType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _vehicleLocalSerialize(
  VehicleLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.capacityVolume);
  writer.writeDouble(offsets[1], object.capacityWeight);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDouble(offsets[3], object.currentHeading);
  writer.writeDouble(offsets[4], object.currentLatitude);
  writer.writeDouble(offsets[5], object.currentLongitude);
  writer.writeDouble(offsets[6], object.currentSpeed);
  writer.writeBool(offsets[7], object.isDeleted);
  writer.writeDateTime(offsets[8], object.lastLocationAt);
  writer.writeString(offsets[9], object.plateNumber);
  writer.writeString(offsets[10], object.status);
  writer.writeDateTime(offsets[11], object.syncedAt);
  writer.writeDateTime(offsets[12], object.updatedAt);
  writer.writeString(offsets[13], object.vehicleCode);
  writer.writeString(offsets[14], object.vehicleId);
  writer.writeString(offsets[15], object.vehicleType);
}

VehicleLocal _vehicleLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VehicleLocal();
  object.capacityVolume = reader.readDoubleOrNull(offsets[0]);
  object.capacityWeight = reader.readDoubleOrNull(offsets[1]);
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.currentHeading = reader.readDoubleOrNull(offsets[3]);
  object.currentLatitude = reader.readDoubleOrNull(offsets[4]);
  object.currentLongitude = reader.readDoubleOrNull(offsets[5]);
  object.currentSpeed = reader.readDoubleOrNull(offsets[6]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[7]);
  object.lastLocationAt = reader.readDateTimeOrNull(offsets[8]);
  object.plateNumber = reader.readStringOrNull(offsets[9]);
  object.status = reader.readStringOrNull(offsets[10]);
  object.syncedAt = reader.readDateTimeOrNull(offsets[11]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[12]);
  object.vehicleCode = reader.readStringOrNull(offsets[13]);
  object.vehicleId = reader.readString(offsets[14]);
  object.vehicleType = reader.readStringOrNull(offsets[15]);
  return object;
}

P _vehicleLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vehicleLocalGetId(VehicleLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vehicleLocalGetLinks(VehicleLocal object) {
  return [];
}

void _vehicleLocalAttach(
    IsarCollection<dynamic> col, Id id, VehicleLocal object) {
  object.id = id;
}

extension VehicleLocalByIndex on IsarCollection<VehicleLocal> {
  Future<VehicleLocal?> getByVehicleId(String vehicleId) {
    return getByIndex(r'vehicleId', [vehicleId]);
  }

  VehicleLocal? getByVehicleIdSync(String vehicleId) {
    return getByIndexSync(r'vehicleId', [vehicleId]);
  }

  Future<bool> deleteByVehicleId(String vehicleId) {
    return deleteByIndex(r'vehicleId', [vehicleId]);
  }

  bool deleteByVehicleIdSync(String vehicleId) {
    return deleteByIndexSync(r'vehicleId', [vehicleId]);
  }

  Future<List<VehicleLocal?>> getAllByVehicleId(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'vehicleId', values);
  }

  List<VehicleLocal?> getAllByVehicleIdSync(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'vehicleId', values);
  }

  Future<int> deleteAllByVehicleId(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'vehicleId', values);
  }

  int deleteAllByVehicleIdSync(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'vehicleId', values);
  }

  Future<Id> putByVehicleId(VehicleLocal object) {
    return putByIndex(r'vehicleId', object);
  }

  Id putByVehicleIdSync(VehicleLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'vehicleId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByVehicleId(List<VehicleLocal> objects) {
    return putAllByIndex(r'vehicleId', objects);
  }

  List<Id> putAllByVehicleIdSync(List<VehicleLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'vehicleId', objects, saveLinks: saveLinks);
  }
}

extension VehicleLocalQueryWhereSort
    on QueryBuilder<VehicleLocal, VehicleLocal, QWhere> {
  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhere> anySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncedAt'),
      );
    });
  }
}

extension VehicleLocalQueryWhere
    on QueryBuilder<VehicleLocal, VehicleLocal, QWhereClause> {
  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause> vehicleIdEqualTo(
      String vehicleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'vehicleId',
        value: [vehicleId],
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause>
      vehicleIdNotEqualTo(String vehicleId) {
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause> syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause>
      syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause> syncedAtEqualTo(
      DateTime? syncedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncedAt',
        value: [syncedAt],
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause>
      syncedAtNotEqualTo(DateTime? syncedAt) {
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause>
      syncedAtGreaterThan(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause> syncedAtLessThan(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterWhereClause> syncedAtBetween(
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

extension VehicleLocalQueryFilter
    on QueryBuilder<VehicleLocal, VehicleLocal, QFilterCondition> {
  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityVolumeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'capacityVolume',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityVolumeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'capacityVolume',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityVolumeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capacityVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityVolumeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capacityVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityVolumeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capacityVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityVolumeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capacityVolume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'capacityWeight',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'capacityWeight',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityWeightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capacityWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityWeightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capacityWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityWeightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capacityWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      capacityWeightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capacityWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentHeadingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentHeading',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentHeadingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentHeading',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentHeadingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentHeading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentHeadingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentHeading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentHeadingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentHeading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentHeadingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentHeading',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLatitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentLatitude',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLatitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentLatitude',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLatitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLatitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLatitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLatitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentLatitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLongitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentLongitude',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLongitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentLongitude',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLongitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLongitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLongitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentLongitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentLongitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentSpeedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentSpeed',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentSpeedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentSpeed',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentSpeedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentSpeedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentSpeedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      currentSpeedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentSpeed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      lastLocationAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastLocationAt',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      lastLocationAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastLocationAt',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      lastLocationAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastLocationAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      lastLocationAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastLocationAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      lastLocationAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastLocationAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      lastLocationAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastLocationAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plateNumber',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plateNumber',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plateNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plateNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plateNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      plateNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plateNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      statusGreaterThan(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      statusLessThan(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      syncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      syncedAtGreaterThan(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      syncedAtLessThan(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      syncedAtBetween(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehicleCode',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehicleCode',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleIdEqualTo(
    String value, {
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleIdGreaterThan(
    String value, {
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleIdLessThan(
    String value, {
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleIdStartsWith(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleIdEndsWith(
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

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehicleType',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehicleType',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleType',
        value: '',
      ));
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterFilterCondition>
      vehicleTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleType',
        value: '',
      ));
    });
  }
}

extension VehicleLocalQueryObject
    on QueryBuilder<VehicleLocal, VehicleLocal, QFilterCondition> {}

extension VehicleLocalQueryLinks
    on QueryBuilder<VehicleLocal, VehicleLocal, QFilterCondition> {}

extension VehicleLocalQuerySortBy
    on QueryBuilder<VehicleLocal, VehicleLocal, QSortBy> {
  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByCapacityVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityVolume', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByCapacityVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityVolume', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByCapacityWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityWeight', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByCapacityWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityWeight', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByCurrentHeading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHeading', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByCurrentHeadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHeading', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByCurrentLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLatitude', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByCurrentLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLatitude', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByCurrentLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLongitude', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByCurrentLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLongitude', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByCurrentSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSpeed', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByCurrentSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSpeed', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByLastLocationAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLocationAt', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByLastLocationAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLocationAt', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByVehicleCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleCode', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByVehicleCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleCode', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> sortByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      sortByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension VehicleLocalQuerySortThenBy
    on QueryBuilder<VehicleLocal, VehicleLocal, QSortThenBy> {
  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByCapacityVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityVolume', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByCapacityVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityVolume', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByCapacityWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityWeight', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByCapacityWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityWeight', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByCurrentHeading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHeading', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByCurrentHeadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHeading', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByCurrentLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLatitude', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByCurrentLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLatitude', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByCurrentLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLongitude', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByCurrentLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLongitude', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByCurrentSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSpeed', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByCurrentSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSpeed', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByLastLocationAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLocationAt', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByLastLocationAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLocationAt', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByVehicleCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleCode', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByVehicleCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleCode', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy> thenByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QAfterSortBy>
      thenByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension VehicleLocalQueryWhereDistinct
    on QueryBuilder<VehicleLocal, VehicleLocal, QDistinct> {
  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct>
      distinctByCapacityVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capacityVolume');
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct>
      distinctByCapacityWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capacityWeight');
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct>
      distinctByCurrentHeading() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentHeading');
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct>
      distinctByCurrentLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLatitude');
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct>
      distinctByCurrentLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLongitude');
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct> distinctByCurrentSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentSpeed');
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct>
      distinctByLastLocationAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastLocationAt');
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct> distinctByPlateNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plateNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct> distinctByVehicleCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct> distinctByVehicleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehicleLocal, VehicleLocal, QDistinct> distinctByVehicleType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleType', caseSensitive: caseSensitive);
    });
  }
}

extension VehicleLocalQueryProperty
    on QueryBuilder<VehicleLocal, VehicleLocal, QQueryProperty> {
  QueryBuilder<VehicleLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VehicleLocal, double?, QQueryOperations>
      capacityVolumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capacityVolume');
    });
  }

  QueryBuilder<VehicleLocal, double?, QQueryOperations>
      capacityWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capacityWeight');
    });
  }

  QueryBuilder<VehicleLocal, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<VehicleLocal, double?, QQueryOperations>
      currentHeadingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentHeading');
    });
  }

  QueryBuilder<VehicleLocal, double?, QQueryOperations>
      currentLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLatitude');
    });
  }

  QueryBuilder<VehicleLocal, double?, QQueryOperations>
      currentLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLongitude');
    });
  }

  QueryBuilder<VehicleLocal, double?, QQueryOperations> currentSpeedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentSpeed');
    });
  }

  QueryBuilder<VehicleLocal, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<VehicleLocal, DateTime?, QQueryOperations>
      lastLocationAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastLocationAt');
    });
  }

  QueryBuilder<VehicleLocal, String?, QQueryOperations> plateNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plateNumber');
    });
  }

  QueryBuilder<VehicleLocal, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VehicleLocal, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<VehicleLocal, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<VehicleLocal, String?, QQueryOperations> vehicleCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleCode');
    });
  }

  QueryBuilder<VehicleLocal, String, QQueryOperations> vehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleId');
    });
  }

  QueryBuilder<VehicleLocal, String?, QQueryOperations> vehicleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleType');
    });
  }
}
