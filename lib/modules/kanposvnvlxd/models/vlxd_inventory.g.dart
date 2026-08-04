// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vlxd_inventory.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVlxdWarehouseCollection on Isar {
  IsarCollection<VlxdWarehouse> get vlxdWarehouses => this.collection();
}

const VlxdWarehouseSchema = CollectionSchema(
  name: r'VlxdWarehouse',
  id: -4923874278530472749,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
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
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 5,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 6,
      name: r'version',
      type: IsarType.long,
    ),
    r'warehouseId': PropertySchema(
      id: 7,
      name: r'warehouseId',
      type: IsarType.string,
    )
  },
  estimateSize: _vlxdWarehouseEstimateSize,
  serialize: _vlxdWarehouseSerialize,
  deserialize: _vlxdWarehouseDeserialize,
  deserializeProp: _vlxdWarehouseDeserializeProp,
  idName: r'id',
  indexes: {
    r'warehouseId': IndexSchema(
      id: -3759612439572445753,
      name: r'warehouseId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'warehouseId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _vlxdWarehouseGetId,
  getLinks: _vlxdWarehouseGetLinks,
  attach: _vlxdWarehouseAttach,
  version: '3.1.0+1',
);

int _vlxdWarehouseEstimateSize(
  VlxdWarehouse object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.warehouseId.length * 3;
  return bytesCount;
}

void _vlxdWarehouseSerialize(
  VlxdWarehouse object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.name);
  writer.writeDateTime(offsets[5], object.updatedAt);
  writer.writeLong(offsets[6], object.version);
  writer.writeString(offsets[7], object.warehouseId);
}

VlxdWarehouse _vlxdWarehouseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VlxdWarehouse();
  object.address = reader.readString(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.updatedAt = reader.readDateTime(offsets[5]);
  object.version = reader.readLong(offsets[6]);
  object.warehouseId = reader.readString(offsets[7]);
  return object;
}

P _vlxdWarehouseDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vlxdWarehouseGetId(VlxdWarehouse object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vlxdWarehouseGetLinks(VlxdWarehouse object) {
  return [];
}

void _vlxdWarehouseAttach(
    IsarCollection<dynamic> col, Id id, VlxdWarehouse object) {
  object.id = id;
}

extension VlxdWarehouseByIndex on IsarCollection<VlxdWarehouse> {
  Future<VlxdWarehouse?> getByWarehouseId(String warehouseId) {
    return getByIndex(r'warehouseId', [warehouseId]);
  }

  VlxdWarehouse? getByWarehouseIdSync(String warehouseId) {
    return getByIndexSync(r'warehouseId', [warehouseId]);
  }

  Future<bool> deleteByWarehouseId(String warehouseId) {
    return deleteByIndex(r'warehouseId', [warehouseId]);
  }

  bool deleteByWarehouseIdSync(String warehouseId) {
    return deleteByIndexSync(r'warehouseId', [warehouseId]);
  }

  Future<List<VlxdWarehouse?>> getAllByWarehouseId(
      List<String> warehouseIdValues) {
    final values = warehouseIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'warehouseId', values);
  }

  List<VlxdWarehouse?> getAllByWarehouseIdSync(List<String> warehouseIdValues) {
    final values = warehouseIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'warehouseId', values);
  }

  Future<int> deleteAllByWarehouseId(List<String> warehouseIdValues) {
    final values = warehouseIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'warehouseId', values);
  }

  int deleteAllByWarehouseIdSync(List<String> warehouseIdValues) {
    final values = warehouseIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'warehouseId', values);
  }

  Future<Id> putByWarehouseId(VlxdWarehouse object) {
    return putByIndex(r'warehouseId', object);
  }

  Id putByWarehouseIdSync(VlxdWarehouse object, {bool saveLinks = true}) {
    return putByIndexSync(r'warehouseId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByWarehouseId(List<VlxdWarehouse> objects) {
    return putAllByIndex(r'warehouseId', objects);
  }

  List<Id> putAllByWarehouseIdSync(List<VlxdWarehouse> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'warehouseId', objects, saveLinks: saveLinks);
  }
}

extension VlxdWarehouseQueryWhereSort
    on QueryBuilder<VlxdWarehouse, VlxdWarehouse, QWhere> {
  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VlxdWarehouseQueryWhere
    on QueryBuilder<VlxdWarehouse, VlxdWarehouse, QWhereClause> {
  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterWhereClause> idBetween(
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterWhereClause>
      warehouseIdEqualTo(String warehouseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'warehouseId',
        value: [warehouseId],
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterWhereClause>
      warehouseIdNotEqualTo(String warehouseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'warehouseId',
              lower: [],
              upper: [warehouseId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'warehouseId',
              lower: [warehouseId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'warehouseId',
              lower: [warehouseId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'warehouseId',
              lower: [],
              upper: [warehouseId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VlxdWarehouseQueryFilter
    on QueryBuilder<VlxdWarehouse, VlxdWarehouse, QFilterCondition> {
  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      addressEqualTo(
    String value, {
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      addressGreaterThan(
    String value, {
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      addressLessThan(
    String value, {
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      addressBetween(
    String lower,
    String upper, {
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      addressStartsWith(
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      addressEndsWith(
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
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

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      warehouseIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      warehouseIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      warehouseIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      warehouseIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warehouseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      warehouseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      warehouseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      warehouseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      warehouseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warehouseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      warehouseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warehouseId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterFilterCondition>
      warehouseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warehouseId',
        value: '',
      ));
    });
  }
}

extension VlxdWarehouseQueryObject
    on QueryBuilder<VlxdWarehouse, VlxdWarehouse, QFilterCondition> {}

extension VlxdWarehouseQueryLinks
    on QueryBuilder<VlxdWarehouse, VlxdWarehouse, QFilterCondition> {}

extension VlxdWarehouseQuerySortBy
    on QueryBuilder<VlxdWarehouse, VlxdWarehouse, QSortBy> {
  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> sortByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy>
      sortByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension VlxdWarehouseQuerySortThenBy
    on QueryBuilder<VlxdWarehouse, VlxdWarehouse, QSortThenBy> {
  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy> thenByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QAfterSortBy>
      thenByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension VlxdWarehouseQueryWhereDistinct
    on QueryBuilder<VlxdWarehouse, VlxdWarehouse, QDistinct> {
  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }

  QueryBuilder<VlxdWarehouse, VlxdWarehouse, QDistinct> distinctByWarehouseId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warehouseId', caseSensitive: caseSensitive);
    });
  }
}

extension VlxdWarehouseQueryProperty
    on QueryBuilder<VlxdWarehouse, VlxdWarehouse, QQueryProperty> {
  QueryBuilder<VlxdWarehouse, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VlxdWarehouse, String, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<VlxdWarehouse, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<VlxdWarehouse, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<VlxdWarehouse, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<VlxdWarehouse, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<VlxdWarehouse, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<VlxdWarehouse, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }

  QueryBuilder<VlxdWarehouse, String, QQueryOperations> warehouseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVlxdInventoryStockCollection on Isar {
  IsarCollection<VlxdInventoryStock> get vlxdInventoryStocks =>
      this.collection();
}

const VlxdInventoryStockSchema = CollectionSchema(
  name: r'VlxdInventoryStock',
  id: -5525088162456813565,
  properties: {
    r'currentQuantity': PropertySchema(
      id: 0,
      name: r'currentQuantity',
      type: IsarType.double,
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
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'maxQuantity': PropertySchema(
      id: 4,
      name: r'maxQuantity',
      type: IsarType.double,
    ),
    r'minQuantity': PropertySchema(
      id: 5,
      name: r'minQuantity',
      type: IsarType.double,
    ),
    r'stockId': PropertySchema(
      id: 6,
      name: r'stockId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 8,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _vlxdInventoryStockEstimateSize,
  serialize: _vlxdInventoryStockSerialize,
  deserialize: _vlxdInventoryStockDeserialize,
  deserializeProp: _vlxdInventoryStockDeserializeProp,
  idName: r'id',
  indexes: {
    r'stockId': IndexSchema(
      id: -4176528792222388375,
      name: r'stockId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'stockId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'warehouse': LinkSchema(
      id: 1601229685220419411,
      name: r'warehouse',
      target: r'VlxdWarehouse',
      single: true,
    ),
    r'product': LinkSchema(
      id: 4350593122180295711,
      name: r'product',
      target: r'VlxdProduct',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _vlxdInventoryStockGetId,
  getLinks: _vlxdInventoryStockGetLinks,
  attach: _vlxdInventoryStockAttach,
  version: '3.1.0+1',
);

int _vlxdInventoryStockEstimateSize(
  VlxdInventoryStock object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.stockId.length * 3;
  return bytesCount;
}

void _vlxdInventoryStockSerialize(
  VlxdInventoryStock object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.currentQuantity);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeDouble(offsets[4], object.maxQuantity);
  writer.writeDouble(offsets[5], object.minQuantity);
  writer.writeString(offsets[6], object.stockId);
  writer.writeDateTime(offsets[7], object.updatedAt);
  writer.writeLong(offsets[8], object.version);
}

VlxdInventoryStock _vlxdInventoryStockDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VlxdInventoryStock();
  object.currentQuantity = reader.readDouble(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[3]);
  object.maxQuantity = reader.readDouble(offsets[4]);
  object.minQuantity = reader.readDouble(offsets[5]);
  object.stockId = reader.readString(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  object.version = reader.readLong(offsets[8]);
  return object;
}

P _vlxdInventoryStockDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vlxdInventoryStockGetId(VlxdInventoryStock object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vlxdInventoryStockGetLinks(
    VlxdInventoryStock object) {
  return [object.warehouse, object.product];
}

void _vlxdInventoryStockAttach(
    IsarCollection<dynamic> col, Id id, VlxdInventoryStock object) {
  object.id = id;
  object.warehouse
      .attach(col, col.isar.collection<VlxdWarehouse>(), r'warehouse', id);
  object.product
      .attach(col, col.isar.collection<VlxdProduct>(), r'product', id);
}

extension VlxdInventoryStockByIndex on IsarCollection<VlxdInventoryStock> {
  Future<VlxdInventoryStock?> getByStockId(String stockId) {
    return getByIndex(r'stockId', [stockId]);
  }

  VlxdInventoryStock? getByStockIdSync(String stockId) {
    return getByIndexSync(r'stockId', [stockId]);
  }

  Future<bool> deleteByStockId(String stockId) {
    return deleteByIndex(r'stockId', [stockId]);
  }

  bool deleteByStockIdSync(String stockId) {
    return deleteByIndexSync(r'stockId', [stockId]);
  }

  Future<List<VlxdInventoryStock?>> getAllByStockId(
      List<String> stockIdValues) {
    final values = stockIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'stockId', values);
  }

  List<VlxdInventoryStock?> getAllByStockIdSync(List<String> stockIdValues) {
    final values = stockIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'stockId', values);
  }

  Future<int> deleteAllByStockId(List<String> stockIdValues) {
    final values = stockIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'stockId', values);
  }

  int deleteAllByStockIdSync(List<String> stockIdValues) {
    final values = stockIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'stockId', values);
  }

  Future<Id> putByStockId(VlxdInventoryStock object) {
    return putByIndex(r'stockId', object);
  }

  Id putByStockIdSync(VlxdInventoryStock object, {bool saveLinks = true}) {
    return putByIndexSync(r'stockId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByStockId(List<VlxdInventoryStock> objects) {
    return putAllByIndex(r'stockId', objects);
  }

  List<Id> putAllByStockIdSync(List<VlxdInventoryStock> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'stockId', objects, saveLinks: saveLinks);
  }
}

extension VlxdInventoryStockQueryWhereSort
    on QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QWhere> {
  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VlxdInventoryStockQueryWhere
    on QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QWhereClause> {
  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterWhereClause>
      stockIdEqualTo(String stockId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'stockId',
        value: [stockId],
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterWhereClause>
      stockIdNotEqualTo(String stockId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stockId',
              lower: [],
              upper: [stockId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stockId',
              lower: [stockId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stockId',
              lower: [stockId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stockId',
              lower: [],
              upper: [stockId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VlxdInventoryStockQueryFilter
    on QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QFilterCondition> {
  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      currentQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      currentQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      currentQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      currentQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      maxQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      maxQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      maxQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      maxQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      minQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      minQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      minQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      minQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      stockIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      stockIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      stockIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      stockIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      stockIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stockId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      stockIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stockId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      stockIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stockId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      stockIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stockId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      stockIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      stockIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stockId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
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

extension VlxdInventoryStockQueryObject
    on QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QFilterCondition> {}

extension VlxdInventoryStockQueryLinks
    on QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QFilterCondition> {
  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      warehouse(FilterQuery<VlxdWarehouse> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'warehouse');
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      warehouseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'warehouse', 0, true, 0, true);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      product(FilterQuery<VlxdProduct> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'product');
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'product', 0, true, 0, true);
    });
  }
}

extension VlxdInventoryStockQuerySortBy
    on QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QSortBy> {
  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByCurrentQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentQuantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByCurrentQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentQuantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByMaxQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxQuantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByMaxQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxQuantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByMinQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minQuantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByMinQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minQuantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByStockId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockId', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByStockIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockId', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension VlxdInventoryStockQuerySortThenBy
    on QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QSortThenBy> {
  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByCurrentQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentQuantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByCurrentQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentQuantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByMaxQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxQuantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByMaxQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxQuantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByMinQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minQuantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByMinQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minQuantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByStockId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockId', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByStockIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockId', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension VlxdInventoryStockQueryWhereDistinct
    on QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QDistinct> {
  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QDistinct>
      distinctByCurrentQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentQuantity');
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QDistinct>
      distinctByMaxQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxQuantity');
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QDistinct>
      distinctByMinQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minQuantity');
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QDistinct>
      distinctByStockId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension VlxdInventoryStockQueryProperty
    on QueryBuilder<VlxdInventoryStock, VlxdInventoryStock, QQueryProperty> {
  QueryBuilder<VlxdInventoryStock, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VlxdInventoryStock, double, QQueryOperations>
      currentQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentQuantity');
    });
  }

  QueryBuilder<VlxdInventoryStock, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<VlxdInventoryStock, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<VlxdInventoryStock, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<VlxdInventoryStock, double, QQueryOperations>
      maxQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxQuantity');
    });
  }

  QueryBuilder<VlxdInventoryStock, double, QQueryOperations>
      minQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minQuantity');
    });
  }

  QueryBuilder<VlxdInventoryStock, String, QQueryOperations> stockIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockId');
    });
  }

  QueryBuilder<VlxdInventoryStock, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<VlxdInventoryStock, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVlxdInventoryTransactionCollection on Isar {
  IsarCollection<VlxdInventoryTransaction> get vlxdInventoryTransactions =>
      this.collection();
}

const VlxdInventoryTransactionSchema = CollectionSchema(
  name: r'VlxdInventoryTransaction',
  id: -4702191781478150690,
  properties: {
    r'createdBy': PropertySchema(
      id: 0,
      name: r'createdBy',
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
    r'documentCode': PropertySchema(
      id: 3,
      name: r'documentCode',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 4,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'note': PropertySchema(
      id: 5,
      name: r'note',
      type: IsarType.string,
    ),
    r'transactionDate': PropertySchema(
      id: 6,
      name: r'transactionDate',
      type: IsarType.dateTime,
    ),
    r'transactionId': PropertySchema(
      id: 7,
      name: r'transactionId',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 8,
      name: r'type',
      type: IsarType.byte,
      enumMap: _VlxdInventoryTransactiontypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 10,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _vlxdInventoryTransactionEstimateSize,
  serialize: _vlxdInventoryTransactionSerialize,
  deserialize: _vlxdInventoryTransactionDeserialize,
  deserializeProp: _vlxdInventoryTransactionDeserializeProp,
  idName: r'id',
  indexes: {
    r'transactionId': IndexSchema(
      id: 8561542235958051982,
      name: r'transactionId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'transactionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'warehouse': LinkSchema(
      id: 7925096728070442611,
      name: r'warehouse',
      target: r'VlxdWarehouse',
      single: true,
    ),
    r'supplier': LinkSchema(
      id: -5401236860806854403,
      name: r'supplier',
      target: r'VlxdSupplier',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _vlxdInventoryTransactionGetId,
  getLinks: _vlxdInventoryTransactionGetLinks,
  attach: _vlxdInventoryTransactionAttach,
  version: '3.1.0+1',
);

int _vlxdInventoryTransactionEstimateSize(
  VlxdInventoryTransaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.createdBy.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.documentCode.length * 3;
  bytesCount += 3 + object.note.length * 3;
  bytesCount += 3 + object.transactionId.length * 3;
  return bytesCount;
}

void _vlxdInventoryTransactionSerialize(
  VlxdInventoryTransaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.createdBy);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeString(offsets[3], object.documentCode);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeString(offsets[5], object.note);
  writer.writeDateTime(offsets[6], object.transactionDate);
  writer.writeString(offsets[7], object.transactionId);
  writer.writeByte(offsets[8], object.type.index);
  writer.writeDateTime(offsets[9], object.updatedAt);
  writer.writeLong(offsets[10], object.version);
}

VlxdInventoryTransaction _vlxdInventoryTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VlxdInventoryTransaction();
  object.createdBy = reader.readString(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.documentCode = reader.readString(offsets[3]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[4]);
  object.note = reader.readString(offsets[5]);
  object.transactionDate = reader.readDateTime(offsets[6]);
  object.transactionId = reader.readString(offsets[7]);
  object.type = _VlxdInventoryTransactiontypeValueEnumMap[
          reader.readByteOrNull(offsets[8])] ??
      VlxdInventoryTransactionType.IMPORT;
  object.updatedAt = reader.readDateTime(offsets[9]);
  object.version = reader.readLong(offsets[10]);
  return object;
}

P _vlxdInventoryTransactionDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (_VlxdInventoryTransactiontypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          VlxdInventoryTransactionType.IMPORT) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VlxdInventoryTransactiontypeEnumValueMap = {
  'IMPORT': 0,
  'EXPORT': 1,
  'ADJUSTMENT': 2,
  'TRANSFER': 3,
  'DESTROY': 4,
};
const _VlxdInventoryTransactiontypeValueEnumMap = {
  0: VlxdInventoryTransactionType.IMPORT,
  1: VlxdInventoryTransactionType.EXPORT,
  2: VlxdInventoryTransactionType.ADJUSTMENT,
  3: VlxdInventoryTransactionType.TRANSFER,
  4: VlxdInventoryTransactionType.DESTROY,
};

Id _vlxdInventoryTransactionGetId(VlxdInventoryTransaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vlxdInventoryTransactionGetLinks(
    VlxdInventoryTransaction object) {
  return [object.warehouse, object.supplier];
}

void _vlxdInventoryTransactionAttach(
    IsarCollection<dynamic> col, Id id, VlxdInventoryTransaction object) {
  object.id = id;
  object.warehouse
      .attach(col, col.isar.collection<VlxdWarehouse>(), r'warehouse', id);
  object.supplier
      .attach(col, col.isar.collection<VlxdSupplier>(), r'supplier', id);
}

extension VlxdInventoryTransactionByIndex
    on IsarCollection<VlxdInventoryTransaction> {
  Future<VlxdInventoryTransaction?> getByTransactionId(String transactionId) {
    return getByIndex(r'transactionId', [transactionId]);
  }

  VlxdInventoryTransaction? getByTransactionIdSync(String transactionId) {
    return getByIndexSync(r'transactionId', [transactionId]);
  }

  Future<bool> deleteByTransactionId(String transactionId) {
    return deleteByIndex(r'transactionId', [transactionId]);
  }

  bool deleteByTransactionIdSync(String transactionId) {
    return deleteByIndexSync(r'transactionId', [transactionId]);
  }

  Future<List<VlxdInventoryTransaction?>> getAllByTransactionId(
      List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'transactionId', values);
  }

  List<VlxdInventoryTransaction?> getAllByTransactionIdSync(
      List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'transactionId', values);
  }

  Future<int> deleteAllByTransactionId(List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'transactionId', values);
  }

  int deleteAllByTransactionIdSync(List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'transactionId', values);
  }

  Future<Id> putByTransactionId(VlxdInventoryTransaction object) {
    return putByIndex(r'transactionId', object);
  }

  Id putByTransactionIdSync(VlxdInventoryTransaction object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'transactionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTransactionId(
      List<VlxdInventoryTransaction> objects) {
    return putAllByIndex(r'transactionId', objects);
  }

  List<Id> putAllByTransactionIdSync(List<VlxdInventoryTransaction> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'transactionId', objects, saveLinks: saveLinks);
  }
}

extension VlxdInventoryTransactionQueryWhereSort on QueryBuilder<
    VlxdInventoryTransaction, VlxdInventoryTransaction, QWhere> {
  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VlxdInventoryTransactionQueryWhere on QueryBuilder<
    VlxdInventoryTransaction, VlxdInventoryTransaction, QWhereClause> {
  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterWhereClause> transactionIdEqualTo(String transactionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transactionId',
        value: [transactionId],
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterWhereClause> transactionIdNotEqualTo(String transactionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [],
              upper: [transactionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [transactionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [transactionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [],
              upper: [transactionId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VlxdInventoryTransactionQueryFilter on QueryBuilder<
    VlxdInventoryTransaction, VlxdInventoryTransaction, QFilterCondition> {
  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> createdByEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> createdByGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> createdByLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> createdByBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> createdByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> createdByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
          QAfterFilterCondition>
      createdByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
          QAfterFilterCondition>
      createdByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> createdByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> createdByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deletedAtGreaterThan(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deviceIdEqualTo(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deviceIdGreaterThan(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deviceIdLessThan(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deviceIdBetween(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deviceIdStartsWith(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deviceIdEndsWith(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
          QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
          QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> documentCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> documentCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> documentCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> documentCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> documentCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> documentCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
          QAfterFilterCondition>
      documentCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
          QAfterFilterCondition>
      documentCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> documentCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> documentCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> noteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> noteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> noteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> noteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
          QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
          QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
          QAfterFilterCondition>
      transactionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
          QAfterFilterCondition>
      transactionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> transactionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> typeEqualTo(VlxdInventoryTransactionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> typeGreaterThan(
    VlxdInventoryTransactionType value, {
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> typeLessThan(
    VlxdInventoryTransactionType value, {
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> typeBetween(
    VlxdInventoryTransactionType lower,
    VlxdInventoryTransactionType upper, {
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> versionGreaterThan(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> versionBetween(
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

extension VlxdInventoryTransactionQueryObject on QueryBuilder<
    VlxdInventoryTransaction, VlxdInventoryTransaction, QFilterCondition> {}

extension VlxdInventoryTransactionQueryLinks on QueryBuilder<
    VlxdInventoryTransaction, VlxdInventoryTransaction, QFilterCondition> {
  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> warehouse(FilterQuery<VlxdWarehouse> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'warehouse');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> warehouseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'warehouse', 0, true, 0, true);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> supplier(FilterQuery<VlxdSupplier> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'supplier');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction,
      QAfterFilterCondition> supplierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'supplier', 0, true, 0, true);
    });
  }
}

extension VlxdInventoryTransactionQuerySortBy on QueryBuilder<
    VlxdInventoryTransaction, VlxdInventoryTransaction, QSortBy> {
  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByDocumentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByDocumentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension VlxdInventoryTransactionQuerySortThenBy on QueryBuilder<
    VlxdInventoryTransaction, VlxdInventoryTransaction, QSortThenBy> {
  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByDocumentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByDocumentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension VlxdInventoryTransactionQueryWhereDistinct on QueryBuilder<
    VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct> {
  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct>
      distinctByCreatedBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct>
      distinctByDocumentCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct>
      distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct>
      distinctByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionDate');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct>
      distinctByTransactionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransaction, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension VlxdInventoryTransactionQueryProperty on QueryBuilder<
    VlxdInventoryTransaction, VlxdInventoryTransaction, QQueryProperty> {
  QueryBuilder<VlxdInventoryTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, String, QQueryOperations>
      createdByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdBy');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, String, QQueryOperations>
      documentCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentCode');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, String, QQueryOperations>
      noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, DateTime, QQueryOperations>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionDate');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, String, QQueryOperations>
      transactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionId');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, VlxdInventoryTransactionType,
      QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<VlxdInventoryTransaction, int, QQueryOperations>
      versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVlxdInventoryTransactionDetailCollection on Isar {
  IsarCollection<VlxdInventoryTransactionDetail>
      get vlxdInventoryTransactionDetails => this.collection();
}

const VlxdInventoryTransactionDetailSchema = CollectionSchema(
  name: r'VlxdInventoryTransactionDetail',
  id: -8348659248976581833,
  properties: {
    r'deletedAt': PropertySchema(
      id: 0,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 1,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 2,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'quantity': PropertySchema(
      id: 3,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'totalAmount': PropertySchema(
      id: 4,
      name: r'totalAmount',
      type: IsarType.double,
    ),
    r'unitPrice': PropertySchema(
      id: 5,
      name: r'unitPrice',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 7,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _vlxdInventoryTransactionDetailEstimateSize,
  serialize: _vlxdInventoryTransactionDetailSerialize,
  deserialize: _vlxdInventoryTransactionDetailDeserialize,
  deserializeProp: _vlxdInventoryTransactionDetailDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'transaction': LinkSchema(
      id: 2486360152662615229,
      name: r'transaction',
      target: r'VlxdInventoryTransaction',
      single: true,
    ),
    r'product': LinkSchema(
      id: 5406035224604353426,
      name: r'product',
      target: r'VlxdProduct',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _vlxdInventoryTransactionDetailGetId,
  getLinks: _vlxdInventoryTransactionDetailGetLinks,
  attach: _vlxdInventoryTransactionDetailAttach,
  version: '3.1.0+1',
);

int _vlxdInventoryTransactionDetailEstimateSize(
  VlxdInventoryTransactionDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  return bytesCount;
}

void _vlxdInventoryTransactionDetailSerialize(
  VlxdInventoryTransactionDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.deletedAt);
  writer.writeString(offsets[1], object.deviceId);
  writer.writeBool(offsets[2], object.isSynced);
  writer.writeDouble(offsets[3], object.quantity);
  writer.writeDouble(offsets[4], object.totalAmount);
  writer.writeDouble(offsets[5], object.unitPrice);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeLong(offsets[7], object.version);
}

VlxdInventoryTransactionDetail _vlxdInventoryTransactionDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VlxdInventoryTransactionDetail();
  object.deletedAt = reader.readDateTimeOrNull(offsets[0]);
  object.deviceId = reader.readString(offsets[1]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[2]);
  object.quantity = reader.readDouble(offsets[3]);
  object.totalAmount = reader.readDouble(offsets[4]);
  object.unitPrice = reader.readDouble(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  object.version = reader.readLong(offsets[7]);
  return object;
}

P _vlxdInventoryTransactionDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vlxdInventoryTransactionDetailGetId(VlxdInventoryTransactionDetail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vlxdInventoryTransactionDetailGetLinks(
    VlxdInventoryTransactionDetail object) {
  return [object.transaction, object.product];
}

void _vlxdInventoryTransactionDetailAttach(
    IsarCollection<dynamic> col, Id id, VlxdInventoryTransactionDetail object) {
  object.id = id;
  object.transaction.attach(
      col, col.isar.collection<VlxdInventoryTransaction>(), r'transaction', id);
  object.product
      .attach(col, col.isar.collection<VlxdProduct>(), r'product', id);
}

extension VlxdInventoryTransactionDetailQueryWhereSort on QueryBuilder<
    VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail, QWhere> {
  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VlxdInventoryTransactionDetailQueryWhere on QueryBuilder<
    VlxdInventoryTransactionDetail,
    VlxdInventoryTransactionDetail,
    QWhereClause> {
  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterWhereClause> idBetween(
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
}

extension VlxdInventoryTransactionDetailQueryFilter on QueryBuilder<
    VlxdInventoryTransactionDetail,
    VlxdInventoryTransactionDetail,
    QFilterCondition> {
  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deletedAtGreaterThan(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deviceIdEqualTo(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deviceIdGreaterThan(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deviceIdLessThan(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deviceIdBetween(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deviceIdStartsWith(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deviceIdEndsWith(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
          QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
          QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> quantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> quantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> quantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> quantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> totalAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> totalAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> totalAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> totalAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> unitPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> unitPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> unitPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> unitPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> versionGreaterThan(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> versionBetween(
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

extension VlxdInventoryTransactionDetailQueryObject on QueryBuilder<
    VlxdInventoryTransactionDetail,
    VlxdInventoryTransactionDetail,
    QFilterCondition> {}

extension VlxdInventoryTransactionDetailQueryLinks on QueryBuilder<
    VlxdInventoryTransactionDetail,
    VlxdInventoryTransactionDetail,
    QFilterCondition> {
  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
          QAfterFilterCondition>
      transaction(FilterQuery<VlxdInventoryTransaction> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'transaction');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> transactionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transaction', 0, true, 0, true);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> product(FilterQuery<VlxdProduct> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'product');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterFilterCondition> productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'product', 0, true, 0, true);
    });
  }
}

extension VlxdInventoryTransactionDetailQuerySortBy on QueryBuilder<
    VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail, QSortBy> {
  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension VlxdInventoryTransactionDetailQuerySortThenBy on QueryBuilder<
    VlxdInventoryTransactionDetail,
    VlxdInventoryTransactionDetail,
    QSortThenBy> {
  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension VlxdInventoryTransactionDetailQueryWhereDistinct on QueryBuilder<
    VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail, QDistinct> {
  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QDistinct> distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QDistinct> distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QDistinct> distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, VlxdInventoryTransactionDetail,
      QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension VlxdInventoryTransactionDetailQueryProperty on QueryBuilder<
    VlxdInventoryTransactionDetail,
    VlxdInventoryTransactionDetail,
    QQueryProperty> {
  QueryBuilder<VlxdInventoryTransactionDetail, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, double, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, double, QQueryOperations>
      totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, double, QQueryOperations>
      unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<VlxdInventoryTransactionDetail, int, QQueryOperations>
      versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
