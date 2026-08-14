// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetXeOmVehicleCollection on Isar {
  IsarCollection<XeOmVehicle> get xeOmVehicles => this.collection();
}

const XeOmVehicleSchema = CollectionSchema(
  name: r'XeOmVehicle',
  id: -2571539506171986076,
  properties: {
    r'brand': PropertySchema(
      id: 0,
      name: r'brand',
      type: IsarType.string,
    ),
    r'color': PropertySchema(
      id: 1,
      name: r'color',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'driverUuid': PropertySchema(
      id: 3,
      name: r'driverUuid',
      type: IsarType.string,
    ),
    r'hasGps': PropertySchema(
      id: 4,
      name: r'hasGps',
      type: IsarType.bool,
    ),
    r'insuranceExpiry': PropertySchema(
      id: 5,
      name: r'insuranceExpiry',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 6,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'licensePlate': PropertySchema(
      id: 7,
      name: r'licensePlate',
      type: IsarType.string,
    ),
    r'manufactureYear': PropertySchema(
      id: 8,
      name: r'manufactureYear',
      type: IsarType.long,
    ),
    r'registrationExpiry': PropertySchema(
      id: 9,
      name: r'registrationExpiry',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.byte,
      enumMap: _XeOmVehiclestatusEnumValueMap,
    ),
    r'syncVersion': PropertySchema(
      id: 11,
      name: r'syncVersion',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 12,
      name: r'type',
      type: IsarType.byte,
      enumMap: _XeOmVehicletypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 14,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _xeOmVehicleEstimateSize,
  serialize: _xeOmVehicleSerialize,
  deserialize: _xeOmVehicleDeserialize,
  deserializeProp: _xeOmVehicleDeserializeProp,
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
  getId: _xeOmVehicleGetId,
  getLinks: _xeOmVehicleGetLinks,
  attach: _xeOmVehicleAttach,
  version: '3.1.0+1',
);

int _xeOmVehicleEstimateSize(
  XeOmVehicle object,
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
    final value = object.color;
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
    final value = object.licensePlate;
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
  return bytesCount;
}

void _xeOmVehicleSerialize(
  XeOmVehicle object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brand);
  writer.writeString(offsets[1], object.color);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.driverUuid);
  writer.writeBool(offsets[4], object.hasGps);
  writer.writeDateTime(offsets[5], object.insuranceExpiry);
  writer.writeBool(offsets[6], object.isDeleted);
  writer.writeString(offsets[7], object.licensePlate);
  writer.writeLong(offsets[8], object.manufactureYear);
  writer.writeDateTime(offsets[9], object.registrationExpiry);
  writer.writeByte(offsets[10], object.status.index);
  writer.writeLong(offsets[11], object.syncVersion);
  writer.writeByte(offsets[12], object.type.index);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeString(offsets[14], object.uuid);
}

XeOmVehicle _xeOmVehicleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = XeOmVehicle();
  object.brand = reader.readStringOrNull(offsets[0]);
  object.color = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.driverUuid = reader.readStringOrNull(offsets[3]);
  object.hasGps = reader.readBool(offsets[4]);
  object.id = id;
  object.insuranceExpiry = reader.readDateTimeOrNull(offsets[5]);
  object.isDeleted = reader.readBool(offsets[6]);
  object.licensePlate = reader.readStringOrNull(offsets[7]);
  object.manufactureYear = reader.readLongOrNull(offsets[8]);
  object.registrationExpiry = reader.readDateTimeOrNull(offsets[9]);
  object.status =
      _XeOmVehiclestatusValueEnumMap[reader.readByteOrNull(offsets[10])] ??
          VehicleStatus.active;
  object.syncVersion = reader.readLong(offsets[11]);
  object.type =
      _XeOmVehicletypeValueEnumMap[reader.readByteOrNull(offsets[12])] ??
          VehicleType.motorbike;
  object.updatedAt = reader.readDateTimeOrNull(offsets[13]);
  object.uuid = reader.readStringOrNull(offsets[14]);
  return object;
}

P _xeOmVehicleDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (_XeOmVehiclestatusValueEnumMap[reader.readByteOrNull(offset)] ??
          VehicleStatus.active) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (_XeOmVehicletypeValueEnumMap[reader.readByteOrNull(offset)] ??
          VehicleType.motorbike) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _XeOmVehiclestatusEnumValueMap = {
  'active': 0,
  'maintenance': 1,
  'inactive': 2,
};
const _XeOmVehiclestatusValueEnumMap = {
  0: VehicleStatus.active,
  1: VehicleStatus.maintenance,
  2: VehicleStatus.inactive,
};
const _XeOmVehicletypeEnumValueMap = {
  'motorbike': 0,
  'taxi4Seats': 1,
  'taxi7Seats': 2,
  'evTaxi': 3,
  'truck': 4,
  'delivery': 5,
};
const _XeOmVehicletypeValueEnumMap = {
  0: VehicleType.motorbike,
  1: VehicleType.taxi4Seats,
  2: VehicleType.taxi7Seats,
  3: VehicleType.evTaxi,
  4: VehicleType.truck,
  5: VehicleType.delivery,
};

Id _xeOmVehicleGetId(XeOmVehicle object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _xeOmVehicleGetLinks(XeOmVehicle object) {
  return [];
}

void _xeOmVehicleAttach(
    IsarCollection<dynamic> col, Id id, XeOmVehicle object) {
  object.id = id;
}

extension XeOmVehicleByIndex on IsarCollection<XeOmVehicle> {
  Future<XeOmVehicle?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  XeOmVehicle? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<XeOmVehicle?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<XeOmVehicle?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(XeOmVehicle object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(XeOmVehicle object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<XeOmVehicle> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<XeOmVehicle> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension XeOmVehicleQueryWhereSort
    on QueryBuilder<XeOmVehicle, XeOmVehicle, QWhere> {
  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension XeOmVehicleQueryWhere
    on QueryBuilder<XeOmVehicle, XeOmVehicle, QWhereClause> {
  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterWhereClause> idBetween(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterWhereClause> uuidNotEqualTo(
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

extension XeOmVehicleQueryFilter
    on QueryBuilder<XeOmVehicle, XeOmVehicle, QFilterCondition> {
  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> brandEqualTo(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      brandGreaterThan(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> brandLessThan(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> brandBetween(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> brandStartsWith(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> brandEndsWith(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> brandContains(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> brandMatches(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> colorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      colorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> colorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      colorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> colorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> colorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'color',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> colorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> colorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> colorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> colorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'color',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> colorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      colorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      driverUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverUuid',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      driverUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverUuid',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      driverUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      driverUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      driverUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      driverUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> hasGpsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasGps',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> idBetween(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      insuranceExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'insuranceExpiry',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      insuranceExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'insuranceExpiry',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      insuranceExpiryEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insuranceExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'licensePlate',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'licensePlate',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateEqualTo(
    String? value, {
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateGreaterThan(
    String? value, {
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateLessThan(
    String? value, {
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateStartsWith(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateEndsWith(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licensePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      licensePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      manufactureYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'manufactureYear',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      manufactureYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'manufactureYear',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      manufactureYearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manufactureYear',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      manufactureYearGreaterThan(
    int? value, {
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      manufactureYearLessThan(
    int? value, {
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      manufactureYearBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      registrationExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'registrationExpiry',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      registrationExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'registrationExpiry',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      registrationExpiryEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registrationExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> statusEqualTo(
      VehicleStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> typeEqualTo(
      VehicleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> typeBetween(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> uuidContains(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension XeOmVehicleQueryObject
    on QueryBuilder<XeOmVehicle, XeOmVehicle, QFilterCondition> {}

extension XeOmVehicleQueryLinks
    on QueryBuilder<XeOmVehicle, XeOmVehicle, QFilterCondition> {}

extension XeOmVehicleQuerySortBy
    on QueryBuilder<XeOmVehicle, XeOmVehicle, QSortBy> {
  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByHasGps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGps', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByHasGpsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGps', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByInsuranceExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy>
      sortByInsuranceExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy>
      sortByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByManufactureYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy>
      sortByManufactureYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy>
      sortByRegistrationExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationExpiry', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy>
      sortByRegistrationExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationExpiry', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension XeOmVehicleQuerySortThenBy
    on QueryBuilder<XeOmVehicle, XeOmVehicle, QSortThenBy> {
  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByHasGps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGps', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByHasGpsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGps', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByInsuranceExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy>
      thenByInsuranceExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insuranceExpiry', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy>
      thenByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByManufactureYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy>
      thenByManufactureYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy>
      thenByRegistrationExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationExpiry', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy>
      thenByRegistrationExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationExpiry', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension XeOmVehicleQueryWhereDistinct
    on QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> {
  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctByColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctByDriverUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctByHasGps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasGps');
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct>
      distinctByInsuranceExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'insuranceExpiry');
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctByLicensePlate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licensePlate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct>
      distinctByManufactureYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'manufactureYear');
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct>
      distinctByRegistrationExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registrationExpiry');
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<XeOmVehicle, XeOmVehicle, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension XeOmVehicleQueryProperty
    on QueryBuilder<XeOmVehicle, XeOmVehicle, QQueryProperty> {
  QueryBuilder<XeOmVehicle, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<XeOmVehicle, String?, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<XeOmVehicle, String?, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<XeOmVehicle, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<XeOmVehicle, String?, QQueryOperations> driverUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverUuid');
    });
  }

  QueryBuilder<XeOmVehicle, bool, QQueryOperations> hasGpsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasGps');
    });
  }

  QueryBuilder<XeOmVehicle, DateTime?, QQueryOperations>
      insuranceExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'insuranceExpiry');
    });
  }

  QueryBuilder<XeOmVehicle, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<XeOmVehicle, String?, QQueryOperations> licensePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licensePlate');
    });
  }

  QueryBuilder<XeOmVehicle, int?, QQueryOperations> manufactureYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'manufactureYear');
    });
  }

  QueryBuilder<XeOmVehicle, DateTime?, QQueryOperations>
      registrationExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registrationExpiry');
    });
  }

  QueryBuilder<XeOmVehicle, VehicleStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<XeOmVehicle, int, QQueryOperations> syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<XeOmVehicle, VehicleType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<XeOmVehicle, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<XeOmVehicle, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
