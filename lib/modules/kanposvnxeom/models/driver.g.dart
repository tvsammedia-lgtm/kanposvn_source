// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetXeOmDriverCollection on Isar {
  IsarCollection<XeOmDriver> get xeOmDrivers => this.collection();
}

const XeOmDriverSchema = CollectionSchema(
  name: r'XeOmDriver',
  id: 2000702812306629104,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'avatarUrl': PropertySchema(
      id: 1,
      name: r'avatarUrl',
      type: IsarType.string,
    ),
    r'cccd': PropertySchema(
      id: 2,
      name: r'cccd',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dateOfBirth': PropertySchema(
      id: 4,
      name: r'dateOfBirth',
      type: IsarType.dateTime,
    ),
    r'driverLicense': PropertySchema(
      id: 5,
      name: r'driverLicense',
      type: IsarType.string,
    ),
    r'driverLicenseExpiry': PropertySchema(
      id: 6,
      name: r'driverLicenseExpiry',
      type: IsarType.dateTime,
    ),
    r'fullName': PropertySchema(
      id: 7,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'isDeleted': PropertySchema(
      id: 8,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'licenseImageUrl': PropertySchema(
      id: 9,
      name: r'licenseImageUrl',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 10,
      name: r'phone',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.byte,
      enumMap: _XeOmDriverstatusEnumValueMap,
    ),
    r'syncVersion': PropertySchema(
      id: 12,
      name: r'syncVersion',
      type: IsarType.long,
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
    ),
    r'vehicleImageUrl': PropertySchema(
      id: 15,
      name: r'vehicleImageUrl',
      type: IsarType.string,
    )
  },
  estimateSize: _xeOmDriverEstimateSize,
  serialize: _xeOmDriverSerialize,
  deserialize: _xeOmDriverDeserialize,
  deserializeProp: _xeOmDriverDeserializeProp,
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
  getId: _xeOmDriverGetId,
  getLinks: _xeOmDriverGetLinks,
  attach: _xeOmDriverAttach,
  version: '3.1.0+1',
);

int _xeOmDriverEstimateSize(
  XeOmDriver object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.avatarUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cccd;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.driverLicense;
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
    final value = object.licenseImageUrl;
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
    final value = object.vehicleImageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _xeOmDriverSerialize(
  XeOmDriver object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.avatarUrl);
  writer.writeString(offsets[2], object.cccd);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDateTime(offsets[4], object.dateOfBirth);
  writer.writeString(offsets[5], object.driverLicense);
  writer.writeDateTime(offsets[6], object.driverLicenseExpiry);
  writer.writeString(offsets[7], object.fullName);
  writer.writeBool(offsets[8], object.isDeleted);
  writer.writeString(offsets[9], object.licenseImageUrl);
  writer.writeString(offsets[10], object.phone);
  writer.writeByte(offsets[11], object.status.index);
  writer.writeLong(offsets[12], object.syncVersion);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeString(offsets[14], object.uuid);
  writer.writeString(offsets[15], object.vehicleImageUrl);
}

XeOmDriver _xeOmDriverDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = XeOmDriver();
  object.address = reader.readStringOrNull(offsets[0]);
  object.avatarUrl = reader.readStringOrNull(offsets[1]);
  object.cccd = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTimeOrNull(offsets[3]);
  object.dateOfBirth = reader.readDateTimeOrNull(offsets[4]);
  object.driverLicense = reader.readStringOrNull(offsets[5]);
  object.driverLicenseExpiry = reader.readDateTimeOrNull(offsets[6]);
  object.fullName = reader.readStringOrNull(offsets[7]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[8]);
  object.licenseImageUrl = reader.readStringOrNull(offsets[9]);
  object.phone = reader.readStringOrNull(offsets[10]);
  object.status =
      _XeOmDriverstatusValueEnumMap[reader.readByteOrNull(offsets[11])] ??
          DriverStatus.online;
  object.syncVersion = reader.readLong(offsets[12]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[13]);
  object.uuid = reader.readStringOrNull(offsets[14]);
  object.vehicleImageUrl = reader.readStringOrNull(offsets[15]);
  return object;
}

P _xeOmDriverDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (_XeOmDriverstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          DriverStatus.online) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _XeOmDriverstatusEnumValueMap = {
  'online': 0,
  'offline': 1,
  'busy': 2,
  'suspended': 3,
};
const _XeOmDriverstatusValueEnumMap = {
  0: DriverStatus.online,
  1: DriverStatus.offline,
  2: DriverStatus.busy,
  3: DriverStatus.suspended,
};

Id _xeOmDriverGetId(XeOmDriver object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _xeOmDriverGetLinks(XeOmDriver object) {
  return [];
}

void _xeOmDriverAttach(IsarCollection<dynamic> col, Id id, XeOmDriver object) {
  object.id = id;
}

extension XeOmDriverByIndex on IsarCollection<XeOmDriver> {
  Future<XeOmDriver?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  XeOmDriver? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<XeOmDriver?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<XeOmDriver?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(XeOmDriver object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(XeOmDriver object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<XeOmDriver> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<XeOmDriver> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension XeOmDriverQueryWhereSort
    on QueryBuilder<XeOmDriver, XeOmDriver, QWhere> {
  QueryBuilder<XeOmDriver, XeOmDriver, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension XeOmDriverQueryWhere
    on QueryBuilder<XeOmDriver, XeOmDriver, QWhereClause> {
  QueryBuilder<XeOmDriver, XeOmDriver, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterWhereClause> idBetween(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterWhereClause> uuidNotEqualTo(
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

extension XeOmDriverQueryFilter
    on QueryBuilder<XeOmDriver, XeOmDriver, QFilterCondition> {
  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> addressContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> addressMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      avatarUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatarUrl',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      avatarUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatarUrl',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> avatarUrlEqualTo(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> avatarUrlLessThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> avatarUrlBetween(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> avatarUrlEndsWith(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> avatarUrlContains(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> avatarUrlMatches(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      avatarUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      avatarUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cccd',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cccd',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cccd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cccd',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccd',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> cccdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cccd',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      dateOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateOfBirth',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      dateOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateOfBirth',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      dateOfBirthEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      dateOfBirthGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      dateOfBirthLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      dateOfBirthBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateOfBirth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverLicense',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverLicense',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverLicense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverLicense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverLicense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverLicense',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverLicense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverLicense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverLicense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverLicense',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverLicense',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverLicense',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverLicenseExpiry',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverLicenseExpiry',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseExpiryEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverLicenseExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseExpiryGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverLicenseExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseExpiryLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverLicenseExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      driverLicenseExpiryBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverLicenseExpiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> fullNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      fullNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> fullNameEqualTo(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> fullNameLessThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> fullNameBetween(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> fullNameEndsWith(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> fullNameContains(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> fullNameMatches(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> idBetween(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> isDeletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'licenseImageUrl',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'licenseImageUrl',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licenseImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licenseImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licenseImageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'licenseImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'licenseImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licenseImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licenseImageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseImageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      licenseImageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licenseImageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> phoneEqualTo(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> phoneGreaterThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> phoneLessThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> phoneBetween(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> phoneStartsWith(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> phoneEndsWith(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> phoneContains(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> phoneMatches(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> statusEqualTo(
      DriverStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidContains(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehicleImageUrl',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehicleImageUrl',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleImageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleImageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleImageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterFilterCondition>
      vehicleImageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleImageUrl',
        value: '',
      ));
    });
  }
}

extension XeOmDriverQueryObject
    on QueryBuilder<XeOmDriver, XeOmDriver, QFilterCondition> {}

extension XeOmDriverQueryLinks
    on QueryBuilder<XeOmDriver, XeOmDriver, QFilterCondition> {}

extension XeOmDriverQuerySortBy
    on QueryBuilder<XeOmDriver, XeOmDriver, QSortBy> {
  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByDriverLicense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLicense', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByDriverLicenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLicense', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy>
      sortByDriverLicenseExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLicenseExpiry', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy>
      sortByDriverLicenseExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLicenseExpiry', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByLicenseImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseImageUrl', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy>
      sortByLicenseImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseImageUrl', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> sortByVehicleImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleImageUrl', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy>
      sortByVehicleImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleImageUrl', Sort.desc);
    });
  }
}

extension XeOmDriverQuerySortThenBy
    on QueryBuilder<XeOmDriver, XeOmDriver, QSortThenBy> {
  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByDriverLicense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLicense', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByDriverLicenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLicense', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy>
      thenByDriverLicenseExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLicenseExpiry', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy>
      thenByDriverLicenseExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLicenseExpiry', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByLicenseImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseImageUrl', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy>
      thenByLicenseImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseImageUrl', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy> thenByVehicleImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleImageUrl', Sort.asc);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QAfterSortBy>
      thenByVehicleImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleImageUrl', Sort.desc);
    });
  }
}

extension XeOmDriverQueryWhereDistinct
    on QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> {
  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByAvatarUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByCccd(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cccd', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateOfBirth');
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByDriverLicense(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverLicense',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct>
      distinctByDriverLicenseExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverLicenseExpiry');
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByLicenseImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licenseImageUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmDriver, XeOmDriver, QDistinct> distinctByVehicleImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleImageUrl',
          caseSensitive: caseSensitive);
    });
  }
}

extension XeOmDriverQueryProperty
    on QueryBuilder<XeOmDriver, XeOmDriver, QQueryProperty> {
  QueryBuilder<XeOmDriver, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<XeOmDriver, String?, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<XeOmDriver, String?, QQueryOperations> avatarUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarUrl');
    });
  }

  QueryBuilder<XeOmDriver, String?, QQueryOperations> cccdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cccd');
    });
  }

  QueryBuilder<XeOmDriver, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<XeOmDriver, DateTime?, QQueryOperations> dateOfBirthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateOfBirth');
    });
  }

  QueryBuilder<XeOmDriver, String?, QQueryOperations> driverLicenseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverLicense');
    });
  }

  QueryBuilder<XeOmDriver, DateTime?, QQueryOperations>
      driverLicenseExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverLicenseExpiry');
    });
  }

  QueryBuilder<XeOmDriver, String?, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<XeOmDriver, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<XeOmDriver, String?, QQueryOperations>
      licenseImageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licenseImageUrl');
    });
  }

  QueryBuilder<XeOmDriver, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<XeOmDriver, DriverStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<XeOmDriver, int, QQueryOperations> syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<XeOmDriver, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<XeOmDriver, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }

  QueryBuilder<XeOmDriver, String?, QQueryOperations>
      vehicleImageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleImageUrl');
    });
  }
}
