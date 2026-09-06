// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labor.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCongTrinhLaborTypeCollection on Isar {
  IsarCollection<CongTrinhLaborType> get congTrinhLaborTypes =>
      this.collection();
}

const CongTrinhLaborTypeSchema = CollectionSchema(
  name: r'CongTrinhLaborType',
  id: 9111010062720955357,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 3,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'deviceId': PropertySchema(
      id: 5,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 6,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'laborTypeId': PropertySchema(
      id: 7,
      name: r'laborTypeId',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
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
  estimateSize: _congTrinhLaborTypeEstimateSize,
  serialize: _congTrinhLaborTypeSerialize,
  deserialize: _congTrinhLaborTypeDeserialize,
  deserializeProp: _congTrinhLaborTypeDeserializeProp,
  idName: r'id',
  indexes: {
    r'laborTypeId': IndexSchema(
      id: 9072719625069054217,
      name: r'laborTypeId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'laborTypeId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _congTrinhLaborTypeGetId,
  getLinks: _congTrinhLaborTypeGetLinks,
  attach: _congTrinhLaborTypeAttach,
  version: '3.1.0+1',
);

int _congTrinhLaborTypeEstimateSize(
  CongTrinhLaborType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.laborTypeId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _congTrinhLaborTypeSerialize(
  CongTrinhLaborType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.code);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDateTime(offsets[3], object.deletedAt);
  writer.writeString(offsets[4], object.description);
  writer.writeString(offsets[5], object.deviceId);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeString(offsets[7], object.laborTypeId);
  writer.writeString(offsets[8], object.name);
  writer.writeDateTime(offsets[9], object.updatedAt);
  writer.writeLong(offsets[10], object.version);
}

CongTrinhLaborType _congTrinhLaborTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CongTrinhLaborType();
  object.active = reader.readBool(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[3]);
  object.description = reader.readString(offsets[4]);
  object.deviceId = reader.readString(offsets[5]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[6]);
  object.laborTypeId = reader.readString(offsets[7]);
  object.name = reader.readString(offsets[8]);
  object.updatedAt = reader.readDateTime(offsets[9]);
  object.version = reader.readLong(offsets[10]);
  return object;
}

P _congTrinhLaborTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _congTrinhLaborTypeGetId(CongTrinhLaborType object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _congTrinhLaborTypeGetLinks(
    CongTrinhLaborType object) {
  return [];
}

void _congTrinhLaborTypeAttach(
    IsarCollection<dynamic> col, Id id, CongTrinhLaborType object) {
  object.id = id;
}

extension CongTrinhLaborTypeByIndex on IsarCollection<CongTrinhLaborType> {
  Future<CongTrinhLaborType?> getByLaborTypeId(String laborTypeId) {
    return getByIndex(r'laborTypeId', [laborTypeId]);
  }

  CongTrinhLaborType? getByLaborTypeIdSync(String laborTypeId) {
    return getByIndexSync(r'laborTypeId', [laborTypeId]);
  }

  Future<bool> deleteByLaborTypeId(String laborTypeId) {
    return deleteByIndex(r'laborTypeId', [laborTypeId]);
  }

  bool deleteByLaborTypeIdSync(String laborTypeId) {
    return deleteByIndexSync(r'laborTypeId', [laborTypeId]);
  }

  Future<List<CongTrinhLaborType?>> getAllByLaborTypeId(
      List<String> laborTypeIdValues) {
    final values = laborTypeIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'laborTypeId', values);
  }

  List<CongTrinhLaborType?> getAllByLaborTypeIdSync(
      List<String> laborTypeIdValues) {
    final values = laborTypeIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'laborTypeId', values);
  }

  Future<int> deleteAllByLaborTypeId(List<String> laborTypeIdValues) {
    final values = laborTypeIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'laborTypeId', values);
  }

  int deleteAllByLaborTypeIdSync(List<String> laborTypeIdValues) {
    final values = laborTypeIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'laborTypeId', values);
  }

  Future<Id> putByLaborTypeId(CongTrinhLaborType object) {
    return putByIndex(r'laborTypeId', object);
  }

  Id putByLaborTypeIdSync(CongTrinhLaborType object, {bool saveLinks = true}) {
    return putByIndexSync(r'laborTypeId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLaborTypeId(List<CongTrinhLaborType> objects) {
    return putAllByIndex(r'laborTypeId', objects);
  }

  List<Id> putAllByLaborTypeIdSync(List<CongTrinhLaborType> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'laborTypeId', objects, saveLinks: saveLinks);
  }
}

extension CongTrinhLaborTypeQueryWhereSort
    on QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QWhere> {
  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CongTrinhLaborTypeQueryWhere
    on QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QWhereClause> {
  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterWhereClause>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterWhereClause>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterWhereClause>
      laborTypeIdEqualTo(String laborTypeId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'laborTypeId',
        value: [laborTypeId],
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterWhereClause>
      laborTypeIdNotEqualTo(String laborTypeId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'laborTypeId',
              lower: [],
              upper: [laborTypeId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'laborTypeId',
              lower: [laborTypeId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'laborTypeId',
              lower: [laborTypeId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'laborTypeId',
              lower: [],
              upper: [laborTypeId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CongTrinhLaborTypeQueryFilter
    on QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QFilterCondition> {
  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      laborTypeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      laborTypeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      laborTypeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      laborTypeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'laborTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      laborTypeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      laborTypeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      laborTypeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      laborTypeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'laborTypeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      laborTypeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'laborTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      laborTypeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'laborTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterFilterCondition>
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

extension CongTrinhLaborTypeQueryObject
    on QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QFilterCondition> {}

extension CongTrinhLaborTypeQueryLinks
    on QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QFilterCondition> {}

extension CongTrinhLaborTypeQuerySortBy
    on QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QSortBy> {
  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByLaborTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByLaborTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhLaborTypeQuerySortThenBy
    on QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QSortThenBy> {
  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByLaborTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByLaborTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhLaborTypeQueryWhereDistinct
    on QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct> {
  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct>
      distinctByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'active');
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct>
      distinctByCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct>
      distinctByLaborTypeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'laborTypeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension CongTrinhLaborTypeQueryProperty
    on QueryBuilder<CongTrinhLaborType, CongTrinhLaborType, QQueryProperty> {
  QueryBuilder<CongTrinhLaborType, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CongTrinhLaborType, bool, QQueryOperations> activeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'active');
    });
  }

  QueryBuilder<CongTrinhLaborType, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<CongTrinhLaborType, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhLaborType, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhLaborType, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<CongTrinhLaborType, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<CongTrinhLaborType, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhLaborType, String, QQueryOperations>
      laborTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'laborTypeId');
    });
  }

  QueryBuilder<CongTrinhLaborType, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CongTrinhLaborType, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhLaborType, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCongTrinhLaborNormCollection on Isar {
  IsarCollection<CongTrinhLaborNorm> get congTrinhLaborNorms =>
      this.collection();
}

const CongTrinhLaborNormSchema = CollectionSchema(
  name: r'CongTrinhLaborNorm',
  id: 8399857218618961646,
  properties: {
    r'buildingGrade': PropertySchema(
      id: 0,
      name: r'buildingGrade',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 2,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 3,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'effectiveFrom': PropertySchema(
      id: 4,
      name: r'effectiveFrom',
      type: IsarType.dateTime,
    ),
    r'effectiveTo': PropertySchema(
      id: 5,
      name: r'effectiveTo',
      type: IsarType.dateTime,
    ),
    r'finishLevel': PropertySchema(
      id: 6,
      name: r'finishLevel',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 7,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'laborNormId': PropertySchema(
      id: 8,
      name: r'laborNormId',
      type: IsarType.string,
    ),
    r'laborTypeId': PropertySchema(
      id: 9,
      name: r'laborTypeId',
      type: IsarType.string,
    ),
    r'quantityPerM2': PropertySchema(
      id: 10,
      name: r'quantityPerM2',
      type: IsarType.double,
    ),
    r'unit': PropertySchema(
      id: 11,
      name: r'unit',
      type: IsarType.string,
    ),
    r'unitPrice': PropertySchema(
      id: 12,
      name: r'unitPrice',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 14,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _congTrinhLaborNormEstimateSize,
  serialize: _congTrinhLaborNormSerialize,
  deserialize: _congTrinhLaborNormDeserialize,
  deserializeProp: _congTrinhLaborNormDeserializeProp,
  idName: r'id',
  indexes: {
    r'laborNormId': IndexSchema(
      id: -8630040641738144528,
      name: r'laborNormId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'laborNormId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _congTrinhLaborNormGetId,
  getLinks: _congTrinhLaborNormGetLinks,
  attach: _congTrinhLaborNormAttach,
  version: '3.1.0+1',
);

int _congTrinhLaborNormEstimateSize(
  CongTrinhLaborNorm object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.buildingGrade.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.finishLevel.length * 3;
  bytesCount += 3 + object.laborNormId.length * 3;
  bytesCount += 3 + object.laborTypeId.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _congTrinhLaborNormSerialize(
  CongTrinhLaborNorm object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.buildingGrade);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDateTime(offsets[2], object.deletedAt);
  writer.writeString(offsets[3], object.deviceId);
  writer.writeDateTime(offsets[4], object.effectiveFrom);
  writer.writeDateTime(offsets[5], object.effectiveTo);
  writer.writeString(offsets[6], object.finishLevel);
  writer.writeBool(offsets[7], object.isSynced);
  writer.writeString(offsets[8], object.laborNormId);
  writer.writeString(offsets[9], object.laborTypeId);
  writer.writeDouble(offsets[10], object.quantityPerM2);
  writer.writeString(offsets[11], object.unit);
  writer.writeDouble(offsets[12], object.unitPrice);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeLong(offsets[14], object.version);
}

CongTrinhLaborNorm _congTrinhLaborNormDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CongTrinhLaborNorm();
  object.buildingGrade = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[2]);
  object.deviceId = reader.readString(offsets[3]);
  object.effectiveFrom = reader.readDateTimeOrNull(offsets[4]);
  object.effectiveTo = reader.readDateTimeOrNull(offsets[5]);
  object.finishLevel = reader.readString(offsets[6]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[7]);
  object.laborNormId = reader.readString(offsets[8]);
  object.laborTypeId = reader.readString(offsets[9]);
  object.quantityPerM2 = reader.readDouble(offsets[10]);
  object.unit = reader.readString(offsets[11]);
  object.unitPrice = reader.readDouble(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  object.version = reader.readLong(offsets[14]);
  return object;
}

P _congTrinhLaborNormDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _congTrinhLaborNormGetId(CongTrinhLaborNorm object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _congTrinhLaborNormGetLinks(
    CongTrinhLaborNorm object) {
  return [];
}

void _congTrinhLaborNormAttach(
    IsarCollection<dynamic> col, Id id, CongTrinhLaborNorm object) {
  object.id = id;
}

extension CongTrinhLaborNormByIndex on IsarCollection<CongTrinhLaborNorm> {
  Future<CongTrinhLaborNorm?> getByLaborNormId(String laborNormId) {
    return getByIndex(r'laborNormId', [laborNormId]);
  }

  CongTrinhLaborNorm? getByLaborNormIdSync(String laborNormId) {
    return getByIndexSync(r'laborNormId', [laborNormId]);
  }

  Future<bool> deleteByLaborNormId(String laborNormId) {
    return deleteByIndex(r'laborNormId', [laborNormId]);
  }

  bool deleteByLaborNormIdSync(String laborNormId) {
    return deleteByIndexSync(r'laborNormId', [laborNormId]);
  }

  Future<List<CongTrinhLaborNorm?>> getAllByLaborNormId(
      List<String> laborNormIdValues) {
    final values = laborNormIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'laborNormId', values);
  }

  List<CongTrinhLaborNorm?> getAllByLaborNormIdSync(
      List<String> laborNormIdValues) {
    final values = laborNormIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'laborNormId', values);
  }

  Future<int> deleteAllByLaborNormId(List<String> laborNormIdValues) {
    final values = laborNormIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'laborNormId', values);
  }

  int deleteAllByLaborNormIdSync(List<String> laborNormIdValues) {
    final values = laborNormIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'laborNormId', values);
  }

  Future<Id> putByLaborNormId(CongTrinhLaborNorm object) {
    return putByIndex(r'laborNormId', object);
  }

  Id putByLaborNormIdSync(CongTrinhLaborNorm object, {bool saveLinks = true}) {
    return putByIndexSync(r'laborNormId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLaborNormId(List<CongTrinhLaborNorm> objects) {
    return putAllByIndex(r'laborNormId', objects);
  }

  List<Id> putAllByLaborNormIdSync(List<CongTrinhLaborNorm> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'laborNormId', objects, saveLinks: saveLinks);
  }
}

extension CongTrinhLaborNormQueryWhereSort
    on QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QWhere> {
  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CongTrinhLaborNormQueryWhere
    on QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QWhereClause> {
  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterWhereClause>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterWhereClause>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterWhereClause>
      laborNormIdEqualTo(String laborNormId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'laborNormId',
        value: [laborNormId],
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterWhereClause>
      laborNormIdNotEqualTo(String laborNormId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'laborNormId',
              lower: [],
              upper: [laborNormId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'laborNormId',
              lower: [laborNormId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'laborNormId',
              lower: [laborNormId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'laborNormId',
              lower: [],
              upper: [laborNormId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CongTrinhLaborNormQueryFilter
    on QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QFilterCondition> {
  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      buildingGradeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      buildingGradeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      buildingGradeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      buildingGradeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buildingGrade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      buildingGradeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      buildingGradeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      buildingGradeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      buildingGradeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'buildingGrade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      buildingGradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buildingGrade',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      buildingGradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'buildingGrade',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveFromIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectiveFrom',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveFromIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectiveFrom',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveFromEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveFromGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveFromLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveFromBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveFrom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectiveTo',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectiveTo',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveToEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveTo',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveToGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveTo',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveToLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveTo',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      effectiveToBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      finishLevelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      finishLevelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      finishLevelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      finishLevelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finishLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      finishLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      finishLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      finishLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      finishLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'finishLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      finishLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finishLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      finishLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'finishLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborNormIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'laborNormId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborNormIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'laborNormId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborNormIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'laborNormId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborNormIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'laborNormId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborNormIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'laborNormId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborNormIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'laborNormId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborNormIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'laborNormId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborNormIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'laborNormId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborNormIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'laborNormId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborNormIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'laborNormId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborTypeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborTypeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborTypeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborTypeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'laborTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborTypeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborTypeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborTypeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborTypeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'laborTypeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborTypeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'laborTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      laborTypeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'laborTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      quantityPerM2EqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityPerM2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      quantityPerM2GreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantityPerM2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      quantityPerM2LessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantityPerM2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      quantityPerM2Between(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantityPerM2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitPriceEqualTo(
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitPriceGreaterThan(
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitPriceLessThan(
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      unitPriceBetween(
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterFilterCondition>
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

extension CongTrinhLaborNormQueryObject
    on QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QFilterCondition> {}

extension CongTrinhLaborNormQueryLinks
    on QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QFilterCondition> {}

extension CongTrinhLaborNormQuerySortBy
    on QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QSortBy> {
  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByBuildingGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByBuildingGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByEffectiveFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByEffectiveFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByEffectiveTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByEffectiveToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByFinishLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByFinishLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByLaborNormId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborNormId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByLaborNormIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborNormId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByLaborTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByLaborTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByQuantityPerM2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityPerM2', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByQuantityPerM2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityPerM2', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhLaborNormQuerySortThenBy
    on QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QSortThenBy> {
  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByBuildingGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByBuildingGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByEffectiveFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByEffectiveFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByEffectiveTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByEffectiveToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByFinishLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByFinishLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByLaborNormId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborNormId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByLaborNormIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborNormId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByLaborTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByLaborTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByQuantityPerM2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityPerM2', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByQuantityPerM2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityPerM2', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhLaborNormQueryWhereDistinct
    on QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct> {
  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByBuildingGrade({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buildingGrade',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByEffectiveFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveFrom');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByEffectiveTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveTo');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByFinishLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finishLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByLaborNormId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'laborNormId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByLaborTypeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'laborTypeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByQuantityPerM2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityPerM2');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension CongTrinhLaborNormQueryProperty
    on QueryBuilder<CongTrinhLaborNorm, CongTrinhLaborNorm, QQueryProperty> {
  QueryBuilder<CongTrinhLaborNorm, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, String, QQueryOperations>
      buildingGradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buildingGrade');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, DateTime?, QQueryOperations>
      effectiveFromProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveFrom');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, DateTime?, QQueryOperations>
      effectiveToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveTo');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, String, QQueryOperations>
      finishLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finishLevel');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, String, QQueryOperations>
      laborNormIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'laborNormId');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, String, QQueryOperations>
      laborTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'laborTypeId');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, double, QQueryOperations>
      quantityPerM2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityPerM2');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, double, QQueryOperations>
      unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhLaborNorm, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
