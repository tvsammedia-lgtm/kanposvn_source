// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vantai_vehicle.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVantaiVehicleCollection on Isar {
  IsarCollection<VantaiVehicle> get vantaiVehicles => this.collection();
}

const VantaiVehicleSchema = CollectionSchema(
  name: r'VantaiVehicle',
  id: -180626227633137841,
  properties: {
    r'brand': PropertySchema(
      id: 0,
      name: r'brand',
      type: IsarType.string,
    ),
    r'deletedAt': PropertySchema(
      id: 1,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 2,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'gpsEnabled': PropertySchema(
      id: 3,
      name: r'gpsEnabled',
      type: IsarType.bool,
    ),
    r'inspectionExpiry': PropertySchema(
      id: 4,
      name: r'inspectionExpiry',
      type: IsarType.dateTime,
    ),
    r'insuranceExpiry': PropertySchema(
      id: 5,
      name: r'insuranceExpiry',
      type: IsarType.dateTime,
    ),
    r'isSynced': PropertySchema(
      id: 6,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'lastOilChange': PropertySchema(
      id: 7,
      name: r'lastOilChange',
      type: IsarType.dateTime,
    ),
    r'lastTireChange': PropertySchema(
      id: 8,
      name: r'lastTireChange',
      type: IsarType.dateTime,
    ),
    r'manufactureYear': PropertySchema(
      id: 9,
      name: r'manufactureYear',
      type: IsarType.long,
    ),
    r'nextMaintenanceDate': PropertySchema(
      id: 10,
      name: r'nextMaintenanceDate',
      type: IsarType.dateTime,
    ),
    r'nextMaintenanceKm': PropertySchema(
      id: 11,
      name: r'nextMaintenanceKm',
      type: IsarType.double,
    ),
    r'odometerKm': PropertySchema(
      id: 12,
      name: r'odometerKm',
      type: IsarType.double,
    ),
    r'plateNumber': PropertySchema(
      id: 13,
      name: r'plateNumber',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 14,
      name: r'status',
      type: IsarType.byte,
      enumMap: _VantaiVehiclestatusEnumValueMap,
    ),
    r'totalSeats': PropertySchema(
      id: 15,
      name: r'totalSeats',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 16,
      name: r'type',
      type: IsarType.byte,
      enumMap: _VantaiVehicletypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 17,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehicleId': PropertySchema(
      id: 18,
      name: r'vehicleId',
      type: IsarType.string,
    ),
    r'version': PropertySchema(
      id: 19,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _vantaiVehicleEstimateSize,
  serialize: _vantaiVehicleSerialize,
  deserialize: _vantaiVehicleDeserialize,
  deserializeProp: _vantaiVehicleDeserializeProp,
  idName: r'id',
  indexes: {
    r'vehicleId': IndexSchema(
      id: 2011968157433523416,
      name: r'vehicleId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'vehicleId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _vantaiVehicleGetId,
  getLinks: _vantaiVehicleGetLinks,
  attach: _vantaiVehicleAttach,
  version: '3.1.0+1',
);

int _vantaiVehicleEstimateSize(
  VantaiVehicle object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.brand.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.plateNumber.length * 3;
  bytesCount += 3 + object.vehicleId.length * 3;
  return bytesCount;
}

void _vantaiVehicleSerialize(
  VantaiVehicle object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brand);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeBool(offsets[3], object.gpsEnabled);
  writer.writeDateTime(offsets[4], object.inspectionExpiry);
  writer.writeDateTime(offsets[5], object.insuranceExpiry);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeDateTime(offsets[7], object.lastOilChange);
  writer.writeDateTime(offsets[8], object.lastTireChange);
  writer.writeLong(offsets[9], object.manufactureYear);
  writer.writeDateTime(offsets[10], object.nextMaintenanceDate);
  writer.writeDouble(offsets[11], object.nextMaintenanceKm);
  writer.writeDouble(offsets[12], object.odometerKm);
  writer.writeString(offsets[13], object.plateNumber);
  writer.writeByte(offsets[14], object.status.index);
  writer.writeLong(offsets[15], object.totalSeats);
  writer.writeByte(offsets[16], object.type.index);
  writer.writeDateTime(offsets[17], object.updatedAt);
  writer.writeString(offsets[18], object.vehicleId);
  writer.writeLong(offsets[19], object.version);
}

VantaiVehicle _vantaiVehicleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VantaiVehicle();
  object.brand = reader.readString(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.gpsEnabled = reader.readBool(offsets[3]);
  object.id = id;
  object.inspectionExpiry = reader.readDateTimeOrNull(offsets[4]);
  object.insuranceExpiry = reader.readDateTimeOrNull(offsets[5]);
  object.isSynced = reader.readBool(offsets[6]);
  object.lastOilChange = reader.readDateTimeOrNull(offsets[7]);
  object.lastTireChange = reader.readDateTimeOrNull(offsets[8]);
  object.manufactureYear = reader.readLong(offsets[9]);
  object.nextMaintenanceDate = reader.readDateTimeOrNull(offsets[10]);
  object.nextMaintenanceKm = reader.readDouble(offsets[11]);
  object.odometerKm = reader.readDouble(offsets[12]);
  object.plateNumber = reader.readString(offsets[13]);
  object.status =
      _VantaiVehiclestatusValueEnumMap[reader.readByteOrNull(offsets[14])] ??
          VehicleStatus.ACTIVE;
  object.totalSeats = reader.readLong(offsets[15]);
  object.type =
      _VantaiVehicletypeValueEnumMap[reader.readByteOrNull(offsets[16])] ??
          VehicleType.SLEEPER;
  object.updatedAt = reader.readDateTime(offsets[17]);
  object.vehicleId = reader.readString(offsets[18]);
  object.version = reader.readLong(offsets[19]);
  return object;
}

P _vantaiVehicleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (_VantaiVehiclestatusValueEnumMap[reader.readByteOrNull(offset)] ??
          VehicleStatus.ACTIVE) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (_VantaiVehicletypeValueEnumMap[reader.readByteOrNull(offset)] ??
          VehicleType.SLEEPER) as P;
    case 17:
      return (reader.readDateTime(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VantaiVehiclestatusEnumValueMap = {
  'ACTIVE': 0,
  'MAINTENANCE': 1,
  'REPAIR': 2,
};
const _VantaiVehiclestatusValueEnumMap = {
  0: VehicleStatus.ACTIVE,
  1: VehicleStatus.MAINTENANCE,
  2: VehicleStatus.REPAIR,
};
const _VantaiVehicletypeEnumValueMap = {
  'SLEEPER': 0,
  'SEAT': 1,
  'LIMOUSINE': 2,
  'TRUCK': 3,
};
const _VantaiVehicletypeValueEnumMap = {
  0: VehicleType.SLEEPER,
  1: VehicleType.SEAT,
  2: VehicleType.LIMOUSINE,
  3: VehicleType.TRUCK,
};

Id _vantaiVehicleGetId(VantaiVehicle object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vantaiVehicleGetLinks(VantaiVehicle object) {
  return [];
}

void _vantaiVehicleAttach(
    IsarCollection<dynamic> col, Id id, VantaiVehicle object) {
  object.id = id;
}

extension VantaiVehicleByIndex on IsarCollection<VantaiVehicle> {
  Future<VantaiVehicle?> getByVehicleId(String vehicleId) {
    return getByIndex(r'vehicleId', [vehicleId]);
  }

  VantaiVehicle? getByVehicleIdSync(String vehicleId) {
    return getByIndexSync(r'vehicleId', [vehicleId]);
  }

  Future<bool> deleteByVehicleId(String vehicleId) {
    return deleteByIndex(r'vehicleId', [vehicleId]);
  }

  bool deleteByVehicleIdSync(String vehicleId) {
    return deleteByIndexSync(r'vehicleId', [vehicleId]);
  }

  Future<List<VantaiVehicle?>> getAllByVehicleId(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'vehicleId', values);
  }

  List<VantaiVehicle?> getAllByVehicleIdSync(List<String> vehicleIdValues) {
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

  Future<Id> putByVehicleId(VantaiVehicle object) {
    return putByIndex(r'vehicleId', object);
  }

  Id putByVehicleIdSync(VantaiVehicle object, {bool saveLinks = true}) {
    return putByIndexSync(r'vehicleId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByVehicleId(List<VantaiVehicle> objects) {
    return putAllByIndex(r'vehicleId', objects);
  }

  List<Id> putAllByVehicleIdSync(List<VantaiVehicle> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'vehicleId', objects, saveLinks: saveLinks);
  }
}

extension VantaiVehicleQueryWhereSort
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QWhere> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VantaiVehicleQueryWhere
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QWhereClause> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause> idBetween(
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause>
      vehicleIdEqualTo(String vehicleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'vehicleId',
        value: [vehicleId],
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause>
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
}

extension VantaiVehicleQueryFilter
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QFilterCondition> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      gpsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gpsEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      inspectionExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inspectionExpiry',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      inspectionExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inspectionExpiry',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      inspectionExpiryEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inspectionExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      inspectionExpiryGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inspectionExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      inspectionExpiryLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inspectionExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      inspectionExpiryBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inspectionExpiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      insuranceExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'insuranceExpiry',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      insuranceExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'insuranceExpiry',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      insuranceExpiryEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insuranceExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      insuranceExpiryGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'insuranceExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      insuranceExpiryLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'insuranceExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      insuranceExpiryBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'insuranceExpiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastOilChangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastOilChange',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastOilChangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastOilChange',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastOilChangeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastOilChange',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastOilChangeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastOilChange',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastOilChangeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastOilChange',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastOilChangeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastOilChange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastTireChangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastTireChange',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastTireChangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastTireChange',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastTireChangeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastTireChange',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastTireChangeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastTireChange',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastTireChangeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastTireChange',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      lastTireChangeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastTireChange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      manufactureYearEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manufactureYear',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      manufactureYearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'manufactureYear',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      manufactureYearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'manufactureYear',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      manufactureYearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'manufactureYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      nextMaintenanceDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nextMaintenanceDate',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      nextMaintenanceDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nextMaintenanceDate',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      nextMaintenanceDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextMaintenanceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      nextMaintenanceDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextMaintenanceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      nextMaintenanceDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextMaintenanceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      nextMaintenanceDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextMaintenanceDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      nextMaintenanceKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextMaintenanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      nextMaintenanceKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextMaintenanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      nextMaintenanceKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextMaintenanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      nextMaintenanceKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextMaintenanceKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      odometerKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'odometerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      odometerKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'odometerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      odometerKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'odometerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      odometerKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'odometerKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberEqualTo(
    String value, {
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberGreaterThan(
    String value, {
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberLessThan(
    String value, {
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberBetween(
    String lower,
    String upper, {
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plateNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plateNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plateNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      statusEqualTo(VehicleStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      statusGreaterThan(
    VehicleStatus value, {
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      statusLessThan(
    VehicleStatus value, {
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      statusBetween(
    VehicleStatus lower,
    VehicleStatus upper, {
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      totalSeatsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSeats',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      totalSeatsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalSeats',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      totalSeatsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalSeats',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      totalSeatsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalSeats',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition> typeEqualTo(
      VehicleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      typeGreaterThan(
    VehicleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      typeLessThan(
    VehicleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition> typeBetween(
    VehicleType lower,
    VehicleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      vehicleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      vehicleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      vehicleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      vehicleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VantaiVehicleQueryObject
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QFilterCondition> {}

extension VantaiVehicleQueryLinks
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QFilterCondition> {}

extension VantaiVehicleQuerySortBy
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QSortBy> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByGpsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsEnabled', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByGpsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsEnabled', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByInspectionExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inspectionExpiry', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByInspectionExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inspectionExpiry', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByInsuranceExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByInsuranceExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByLastOilChange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOilChange', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByLastOilChangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOilChange', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByLastTireChange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTireChange', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByLastTireChangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTireChange', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByManufactureYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByManufactureYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByNextMaintenanceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextMaintenanceDate', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByNextMaintenanceDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextMaintenanceDate', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByNextMaintenanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextMaintenanceKm', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByNextMaintenanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextMaintenanceKm', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByOdometerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'odometerKm', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByOdometerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'odometerKm', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByTotalSeats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeats', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByTotalSeatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeats', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension VantaiVehicleQuerySortThenBy
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QSortThenBy> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByGpsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsEnabled', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByGpsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsEnabled', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByInspectionExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inspectionExpiry', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByInspectionExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inspectionExpiry', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByInsuranceExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByInsuranceExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByLastOilChange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOilChange', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByLastOilChangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOilChange', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByLastTireChange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTireChange', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByLastTireChangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTireChange', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByManufactureYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByManufactureYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByNextMaintenanceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextMaintenanceDate', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByNextMaintenanceDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextMaintenanceDate', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByNextMaintenanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextMaintenanceKm', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByNextMaintenanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextMaintenanceKm', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByOdometerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'odometerKm', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByOdometerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'odometerKm', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByTotalSeats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeats', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByTotalSeatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeats', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension VantaiVehicleQueryWhereDistinct
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByGpsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gpsEnabled');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct>
      distinctByInspectionExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inspectionExpiry');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct>
      distinctByInsuranceExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'insuranceExpiry');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct>
      distinctByLastOilChange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastOilChange');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct>
      distinctByLastTireChange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastTireChange');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct>
      distinctByManufactureYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'manufactureYear');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct>
      distinctByNextMaintenanceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextMaintenanceDate');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct>
      distinctByNextMaintenanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextMaintenanceKm');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByOdometerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'odometerKm');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByPlateNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plateNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByTotalSeats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSeats');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByVehicleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension VantaiVehicleQueryProperty
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QQueryProperty> {
  QueryBuilder<VantaiVehicle, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VantaiVehicle, String, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<VantaiVehicle, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<VantaiVehicle, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<VantaiVehicle, bool, QQueryOperations> gpsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gpsEnabled');
    });
  }

  QueryBuilder<VantaiVehicle, DateTime?, QQueryOperations>
      inspectionExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inspectionExpiry');
    });
  }

  QueryBuilder<VantaiVehicle, DateTime?, QQueryOperations>
      insuranceExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'insuranceExpiry');
    });
  }

  QueryBuilder<VantaiVehicle, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<VantaiVehicle, DateTime?, QQueryOperations>
      lastOilChangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastOilChange');
    });
  }

  QueryBuilder<VantaiVehicle, DateTime?, QQueryOperations>
      lastTireChangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastTireChange');
    });
  }

  QueryBuilder<VantaiVehicle, int, QQueryOperations> manufactureYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'manufactureYear');
    });
  }

  QueryBuilder<VantaiVehicle, DateTime?, QQueryOperations>
      nextMaintenanceDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextMaintenanceDate');
    });
  }

  QueryBuilder<VantaiVehicle, double, QQueryOperations>
      nextMaintenanceKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextMaintenanceKm');
    });
  }

  QueryBuilder<VantaiVehicle, double, QQueryOperations> odometerKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'odometerKm');
    });
  }

  QueryBuilder<VantaiVehicle, String, QQueryOperations> plateNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plateNumber');
    });
  }

  QueryBuilder<VantaiVehicle, VehicleStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VantaiVehicle, int, QQueryOperations> totalSeatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSeats');
    });
  }

  QueryBuilder<VantaiVehicle, VehicleType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<VantaiVehicle, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<VantaiVehicle, String, QQueryOperations> vehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleId');
    });
  }

  QueryBuilder<VantaiVehicle, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
