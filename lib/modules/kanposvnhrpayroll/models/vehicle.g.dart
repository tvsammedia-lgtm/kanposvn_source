// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVehicleCollection on Isar {
  IsarCollection<Vehicle> get vehicles => this.collection();
}

const VehicleSchema = CollectionSchema(
  name: r'Vehicle',
  id: -21624847921258799,
  properties: {
    r'brand': PropertySchema(
      id: 0,
      name: r'brand',
      type: IsarType.string,
    ),
    r'chassisNumber': PropertySchema(
      id: 1,
      name: r'chassisNumber',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'engineNumber': PropertySchema(
      id: 3,
      name: r'engineNumber',
      type: IsarType.string,
    ),
    r'etcDeviceId': PropertySchema(
      id: 4,
      name: r'etcDeviceId',
      type: IsarType.string,
    ),
    r'gpsDeviceId': PropertySchema(
      id: 5,
      name: r'gpsDeviceId',
      type: IsarType.string,
    ),
    r'hasEtc': PropertySchema(
      id: 6,
      name: r'hasEtc',
      type: IsarType.bool,
    ),
    r'hasGps': PropertySchema(
      id: 7,
      name: r'hasGps',
      type: IsarType.bool,
    ),
    r'insuranceExpiry': PropertySchema(
      id: 8,
      name: r'insuranceExpiry',
      type: IsarType.dateTime,
    ),
    r'insuranceNumber': PropertySchema(
      id: 9,
      name: r'insuranceNumber',
      type: IsarType.string,
    ),
    r'lastSyncAt': PropertySchema(
      id: 10,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'licensePlate': PropertySchema(
      id: 11,
      name: r'licensePlate',
      type: IsarType.string,
    ),
    r'loadCapacity': PropertySchema(
      id: 12,
      name: r'loadCapacity',
      type: IsarType.double,
    ),
    r'manufacturingYear': PropertySchema(
      id: 13,
      name: r'manufacturingYear',
      type: IsarType.long,
    ),
    r'needsSync': PropertySchema(
      id: 14,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'pairedMoocPlate': PropertySchema(
      id: 15,
      name: r'pairedMoocPlate',
      type: IsarType.string,
    ),
    r'registrationDate': PropertySchema(
      id: 16,
      name: r'registrationDate',
      type: IsarType.dateTime,
    ),
    r'registrationExpiry': PropertySchema(
      id: 17,
      name: r'registrationExpiry',
      type: IsarType.dateTime,
    ),
    r'remoteId': PropertySchema(
      id: 18,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 19,
      name: r'status',
      type: IsarType.string,
      enumMap: _VehiclestatusEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 20,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehicleType': PropertySchema(
      id: 21,
      name: r'vehicleType',
      type: IsarType.string,
      enumMap: _VehiclevehicleTypeEnumValueMap,
    )
  },
  estimateSize: _vehicleEstimateSize,
  serialize: _vehicleSerialize,
  deserialize: _vehicleDeserialize,
  deserializeProp: _vehicleDeserializeProp,
  idName: r'id',
  indexes: {
    r'licensePlate': IndexSchema(
      id: -2810072559435191233,
      name: r'licensePlate',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'licensePlate',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _vehicleGetId,
  getLinks: _vehicleGetLinks,
  attach: _vehicleAttach,
  version: '3.1.0+1',
);

int _vehicleEstimateSize(
  Vehicle object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.brand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.chassisNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.engineNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.etcDeviceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gpsDeviceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.insuranceNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.licensePlate.length * 3;
  {
    final value = object.pairedMoocPlate;
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
  bytesCount += 3 + object.vehicleType.name.length * 3;
  return bytesCount;
}

void _vehicleSerialize(
  Vehicle object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brand);
  writer.writeString(offsets[1], object.chassisNumber);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.engineNumber);
  writer.writeString(offsets[4], object.etcDeviceId);
  writer.writeString(offsets[5], object.gpsDeviceId);
  writer.writeBool(offsets[6], object.hasEtc);
  writer.writeBool(offsets[7], object.hasGps);
  writer.writeDateTime(offsets[8], object.insuranceExpiry);
  writer.writeString(offsets[9], object.insuranceNumber);
  writer.writeDateTime(offsets[10], object.lastSyncAt);
  writer.writeString(offsets[11], object.licensePlate);
  writer.writeDouble(offsets[12], object.loadCapacity);
  writer.writeLong(offsets[13], object.manufacturingYear);
  writer.writeBool(offsets[14], object.needsSync);
  writer.writeString(offsets[15], object.pairedMoocPlate);
  writer.writeDateTime(offsets[16], object.registrationDate);
  writer.writeDateTime(offsets[17], object.registrationExpiry);
  writer.writeString(offsets[18], object.remoteId);
  writer.writeString(offsets[19], object.status.name);
  writer.writeDateTime(offsets[20], object.updatedAt);
  writer.writeString(offsets[21], object.vehicleType.name);
}

Vehicle _vehicleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Vehicle();
  object.brand = reader.readStringOrNull(offsets[0]);
  object.chassisNumber = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.engineNumber = reader.readStringOrNull(offsets[3]);
  object.etcDeviceId = reader.readStringOrNull(offsets[4]);
  object.gpsDeviceId = reader.readStringOrNull(offsets[5]);
  object.hasEtc = reader.readBool(offsets[6]);
  object.hasGps = reader.readBool(offsets[7]);
  object.id = id;
  object.insuranceExpiry = reader.readDateTimeOrNull(offsets[8]);
  object.insuranceNumber = reader.readStringOrNull(offsets[9]);
  object.lastSyncAt = reader.readDateTimeOrNull(offsets[10]);
  object.licensePlate = reader.readString(offsets[11]);
  object.loadCapacity = reader.readDoubleOrNull(offsets[12]);
  object.manufacturingYear = reader.readLongOrNull(offsets[13]);
  object.needsSync = reader.readBool(offsets[14]);
  object.pairedMoocPlate = reader.readStringOrNull(offsets[15]);
  object.registrationDate = reader.readDateTimeOrNull(offsets[16]);
  object.registrationExpiry = reader.readDateTimeOrNull(offsets[17]);
  object.remoteId = reader.readStringOrNull(offsets[18]);
  object.status =
      _VehiclestatusValueEnumMap[reader.readStringOrNull(offsets[19])] ??
          VehicleStatus.active;
  object.updatedAt = reader.readDateTime(offsets[20]);
  object.vehicleType =
      _VehiclevehicleTypeValueEnumMap[reader.readStringOrNull(offsets[21])] ??
          VehicleType.container;
  return object;
}

P _vehicleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (_VehiclestatusValueEnumMap[reader.readStringOrNull(offset)] ??
          VehicleStatus.active) as P;
    case 20:
      return (reader.readDateTime(offset)) as P;
    case 21:
      return (_VehiclevehicleTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          VehicleType.container) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VehiclestatusEnumValueMap = {
  r'active': r'active',
  r'maintenance': r'maintenance',
  r'broken': r'broken',
  r'inactive': r'inactive',
};
const _VehiclestatusValueEnumMap = {
  r'active': VehicleStatus.active,
  r'maintenance': VehicleStatus.maintenance,
  r'broken': VehicleStatus.broken,
  r'inactive': VehicleStatus.inactive,
};
const _VehiclevehicleTypeEnumValueMap = {
  r'container': r'container',
  r'truck': r'truck',
  r'tractor': r'tractor',
  r'mooc': r'mooc',
};
const _VehiclevehicleTypeValueEnumMap = {
  r'container': VehicleType.container,
  r'truck': VehicleType.truck,
  r'tractor': VehicleType.tractor,
  r'mooc': VehicleType.mooc,
};

Id _vehicleGetId(Vehicle object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vehicleGetLinks(Vehicle object) {
  return [];
}

void _vehicleAttach(IsarCollection<dynamic> col, Id id, Vehicle object) {
  object.id = id;
}

extension VehicleByIndex on IsarCollection<Vehicle> {
  Future<Vehicle?> getByLicensePlate(String licensePlate) {
    return getByIndex(r'licensePlate', [licensePlate]);
  }

  Vehicle? getByLicensePlateSync(String licensePlate) {
    return getByIndexSync(r'licensePlate', [licensePlate]);
  }

  Future<bool> deleteByLicensePlate(String licensePlate) {
    return deleteByIndex(r'licensePlate', [licensePlate]);
  }

  bool deleteByLicensePlateSync(String licensePlate) {
    return deleteByIndexSync(r'licensePlate', [licensePlate]);
  }

  Future<List<Vehicle?>> getAllByLicensePlate(List<String> licensePlateValues) {
    final values = licensePlateValues.map((e) => [e]).toList();
    return getAllByIndex(r'licensePlate', values);
  }

  List<Vehicle?> getAllByLicensePlateSync(List<String> licensePlateValues) {
    final values = licensePlateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'licensePlate', values);
  }

  Future<int> deleteAllByLicensePlate(List<String> licensePlateValues) {
    final values = licensePlateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'licensePlate', values);
  }

  int deleteAllByLicensePlateSync(List<String> licensePlateValues) {
    final values = licensePlateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'licensePlate', values);
  }

  Future<Id> putByLicensePlate(Vehicle object) {
    return putByIndex(r'licensePlate', object);
  }

  Id putByLicensePlateSync(Vehicle object, {bool saveLinks = true}) {
    return putByIndexSync(r'licensePlate', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLicensePlate(List<Vehicle> objects) {
    return putAllByIndex(r'licensePlate', objects);
  }

  List<Id> putAllByLicensePlateSync(List<Vehicle> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'licensePlate', objects, saveLinks: saveLinks);
  }
}

extension VehicleQueryWhereSort on QueryBuilder<Vehicle, Vehicle, QWhere> {
  QueryBuilder<Vehicle, Vehicle, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VehicleQueryWhere on QueryBuilder<Vehicle, Vehicle, QWhereClause> {
  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> idBetween(
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

  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> licensePlateEqualTo(
      String licensePlate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'licensePlate',
        value: [licensePlate],
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> licensePlateNotEqualTo(
      String licensePlate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licensePlate',
              lower: [],
              upper: [licensePlate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licensePlate',
              lower: [licensePlate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licensePlate',
              lower: [licensePlate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licensePlate',
              lower: [],
              upper: [licensePlate],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VehicleQueryFilter
    on QueryBuilder<Vehicle, Vehicle, QFilterCondition> {
  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandEqualTo(
    String? value, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandGreaterThan(
    String? value, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandLessThan(
    String? value, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandStartsWith(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandEndsWith(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> chassisNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chassisNumber',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      chassisNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chassisNumber',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> chassisNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chassisNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      chassisNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chassisNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> chassisNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chassisNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> chassisNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chassisNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> chassisNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chassisNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> chassisNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chassisNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> chassisNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chassisNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> chassisNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chassisNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> chassisNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chassisNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      chassisNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chassisNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> engineNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'engineNumber',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      engineNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'engineNumber',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> engineNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> engineNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> engineNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> engineNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'engineNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> engineNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> engineNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> engineNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> engineNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'engineNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> engineNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'engineNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      engineNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'engineNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> etcDeviceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'etcDeviceId',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> etcDeviceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'etcDeviceId',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> etcDeviceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etcDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> etcDeviceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'etcDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> etcDeviceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'etcDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> etcDeviceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'etcDeviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> etcDeviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'etcDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> etcDeviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'etcDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> etcDeviceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'etcDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> etcDeviceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'etcDeviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> etcDeviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etcDeviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      etcDeviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'etcDeviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> gpsDeviceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gpsDeviceId',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> gpsDeviceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gpsDeviceId',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> gpsDeviceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gpsDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> gpsDeviceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gpsDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> gpsDeviceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gpsDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> gpsDeviceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gpsDeviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> gpsDeviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gpsDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> gpsDeviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gpsDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> gpsDeviceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gpsDeviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> gpsDeviceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gpsDeviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> gpsDeviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gpsDeviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      gpsDeviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gpsDeviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> hasEtcEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasEtc',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> hasGpsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasGps',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      insuranceExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'insuranceExpiry',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      insuranceExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'insuranceExpiry',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> insuranceExpiryEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insuranceExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> insuranceExpiryLessThan(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> insuranceExpiryBetween(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      insuranceNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'insuranceNumber',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      insuranceNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'insuranceNumber',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> insuranceNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insuranceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      insuranceNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'insuranceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> insuranceNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'insuranceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> insuranceNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'insuranceNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      insuranceNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'insuranceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> insuranceNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'insuranceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> insuranceNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'insuranceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> insuranceNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'insuranceNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      insuranceNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insuranceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      insuranceNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'insuranceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> lastSyncAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> lastSyncAtGreaterThan(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> lastSyncAtLessThan(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> lastSyncAtBetween(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> licensePlateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> licensePlateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> licensePlateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> licensePlateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licensePlate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> licensePlateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> licensePlateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> licensePlateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> licensePlateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licensePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> licensePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      licensePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> loadCapacityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'loadCapacity',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      loadCapacityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'loadCapacity',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> loadCapacityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loadCapacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> loadCapacityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'loadCapacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> loadCapacityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'loadCapacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> loadCapacityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'loadCapacity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      manufacturingYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'manufacturingYear',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      manufacturingYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'manufacturingYear',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      manufacturingYearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manufacturingYear',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      manufacturingYearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'manufacturingYear',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      manufacturingYearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'manufacturingYear',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      manufacturingYearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'manufacturingYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> needsSyncEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      pairedMoocPlateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pairedMoocPlate',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      pairedMoocPlateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pairedMoocPlate',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> pairedMoocPlateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pairedMoocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      pairedMoocPlateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pairedMoocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> pairedMoocPlateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pairedMoocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> pairedMoocPlateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pairedMoocPlate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      pairedMoocPlateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pairedMoocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> pairedMoocPlateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pairedMoocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> pairedMoocPlateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pairedMoocPlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> pairedMoocPlateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pairedMoocPlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      pairedMoocPlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pairedMoocPlate',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      pairedMoocPlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pairedMoocPlate',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      registrationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'registrationDate',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      registrationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'registrationDate',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> registrationDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registrationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      registrationDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'registrationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      registrationDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'registrationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> registrationDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'registrationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      registrationExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'registrationExpiry',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      registrationExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'registrationExpiry',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      registrationExpiryEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registrationExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      registrationExpiryGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'registrationExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      registrationExpiryLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'registrationExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      registrationExpiryBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'registrationExpiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdEqualTo(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdGreaterThan(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdLessThan(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdBetween(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdStartsWith(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdEndsWith(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdMatches(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> statusEqualTo(
    VehicleStatus value, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> statusGreaterThan(
    VehicleStatus value, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> statusLessThan(
    VehicleStatus value, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> statusBetween(
    VehicleStatus lower,
    VehicleStatus upper, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> statusContains(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> vehicleTypeEqualTo(
    VehicleType value, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> vehicleTypeGreaterThan(
    VehicleType value, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> vehicleTypeLessThan(
    VehicleType value, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> vehicleTypeBetween(
    VehicleType lower,
    VehicleType upper, {
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> vehicleTypeStartsWith(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> vehicleTypeEndsWith(
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

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> vehicleTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> vehicleTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> vehicleTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleType',
        value: '',
      ));
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition>
      vehicleTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleType',
        value: '',
      ));
    });
  }
}

extension VehicleQueryObject
    on QueryBuilder<Vehicle, Vehicle, QFilterCondition> {}

extension VehicleQueryLinks
    on QueryBuilder<Vehicle, Vehicle, QFilterCondition> {}

extension VehicleQuerySortBy on QueryBuilder<Vehicle, Vehicle, QSortBy> {
  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByChassisNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chassisNumber', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByChassisNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chassisNumber', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByEngineNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'engineNumber', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByEngineNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'engineNumber', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByEtcDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etcDeviceId', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByEtcDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etcDeviceId', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByGpsDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsDeviceId', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByGpsDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsDeviceId', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByHasEtc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEtc', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByHasEtcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEtc', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByHasGps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGps', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByHasGpsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGps', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByInsuranceExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByInsuranceExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByInsuranceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceNumber', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByInsuranceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceNumber', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByLoadCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loadCapacity', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByLoadCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loadCapacity', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByManufacturingYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufacturingYear', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByManufacturingYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufacturingYear', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByPairedMoocPlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pairedMoocPlate', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByPairedMoocPlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pairedMoocPlate', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByRegistrationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationDate', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByRegistrationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationDate', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByRegistrationExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationExpiry', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByRegistrationExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationExpiry', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension VehicleQuerySortThenBy
    on QueryBuilder<Vehicle, Vehicle, QSortThenBy> {
  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByChassisNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chassisNumber', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByChassisNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chassisNumber', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByEngineNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'engineNumber', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByEngineNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'engineNumber', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByEtcDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etcDeviceId', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByEtcDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etcDeviceId', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByGpsDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsDeviceId', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByGpsDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsDeviceId', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByHasEtc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEtc', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByHasEtcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEtc', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByHasGps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGps', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByHasGpsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGps', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByInsuranceExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByInsuranceExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByInsuranceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceNumber', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByInsuranceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceNumber', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByLoadCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loadCapacity', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByLoadCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loadCapacity', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByManufacturingYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufacturingYear', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByManufacturingYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufacturingYear', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByPairedMoocPlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pairedMoocPlate', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByPairedMoocPlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pairedMoocPlate', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByRegistrationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationDate', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByRegistrationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationDate', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByRegistrationExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationExpiry', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByRegistrationExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationExpiry', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension VehicleQueryWhereDistinct
    on QueryBuilder<Vehicle, Vehicle, QDistinct> {
  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByChassisNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chassisNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByEngineNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'engineNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByEtcDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'etcDeviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByGpsDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gpsDeviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByHasEtc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasEtc');
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByHasGps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasGps');
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByInsuranceExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'insuranceExpiry');
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByInsuranceNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'insuranceNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByLicensePlate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licensePlate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByLoadCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loadCapacity');
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByManufacturingYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'manufacturingYear');
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByPairedMoocPlate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pairedMoocPlate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByRegistrationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registrationDate');
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByRegistrationExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registrationExpiry');
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByVehicleType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleType', caseSensitive: caseSensitive);
    });
  }
}

extension VehicleQueryProperty
    on QueryBuilder<Vehicle, Vehicle, QQueryProperty> {
  QueryBuilder<Vehicle, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Vehicle, String?, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<Vehicle, String?, QQueryOperations> chassisNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chassisNumber');
    });
  }

  QueryBuilder<Vehicle, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Vehicle, String?, QQueryOperations> engineNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'engineNumber');
    });
  }

  QueryBuilder<Vehicle, String?, QQueryOperations> etcDeviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'etcDeviceId');
    });
  }

  QueryBuilder<Vehicle, String?, QQueryOperations> gpsDeviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gpsDeviceId');
    });
  }

  QueryBuilder<Vehicle, bool, QQueryOperations> hasEtcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasEtc');
    });
  }

  QueryBuilder<Vehicle, bool, QQueryOperations> hasGpsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasGps');
    });
  }

  QueryBuilder<Vehicle, DateTime?, QQueryOperations> insuranceExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'insuranceExpiry');
    });
  }

  QueryBuilder<Vehicle, String?, QQueryOperations> insuranceNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'insuranceNumber');
    });
  }

  QueryBuilder<Vehicle, DateTime?, QQueryOperations> lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<Vehicle, String, QQueryOperations> licensePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licensePlate');
    });
  }

  QueryBuilder<Vehicle, double?, QQueryOperations> loadCapacityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loadCapacity');
    });
  }

  QueryBuilder<Vehicle, int?, QQueryOperations> manufacturingYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'manufacturingYear');
    });
  }

  QueryBuilder<Vehicle, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<Vehicle, String?, QQueryOperations> pairedMoocPlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pairedMoocPlate');
    });
  }

  QueryBuilder<Vehicle, DateTime?, QQueryOperations>
      registrationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registrationDate');
    });
  }

  QueryBuilder<Vehicle, DateTime?, QQueryOperations>
      registrationExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registrationExpiry');
    });
  }

  QueryBuilder<Vehicle, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<Vehicle, VehicleStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Vehicle, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Vehicle, VehicleType, QQueryOperations> vehicleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleType');
    });
  }
}
