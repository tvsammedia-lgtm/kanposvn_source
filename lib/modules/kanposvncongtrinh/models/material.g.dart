// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCongTrinhMaterialCategoryCollection on Isar {
  IsarCollection<CongTrinhMaterialCategory> get congTrinhMaterialCategorys =>
      this.collection();
}

const CongTrinhMaterialCategorySchema = CollectionSchema(
  name: r'CongTrinhMaterialCategory',
  id: 9196369988725295179,
  properties: {
    r'categoryId': PropertySchema(
      id: 0,
      name: r'categoryId',
      type: IsarType.string,
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
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 9,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _congTrinhMaterialCategoryEstimateSize,
  serialize: _congTrinhMaterialCategorySerialize,
  deserialize: _congTrinhMaterialCategoryDeserialize,
  deserializeProp: _congTrinhMaterialCategoryDeserializeProp,
  idName: r'id',
  indexes: {
    r'categoryId': IndexSchema(
      id: -8798048739239305339,
      name: r'categoryId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'categoryId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _congTrinhMaterialCategoryGetId,
  getLinks: _congTrinhMaterialCategoryGetLinks,
  attach: _congTrinhMaterialCategoryAttach,
  version: '3.1.0+1',
);

int _congTrinhMaterialCategoryEstimateSize(
  CongTrinhMaterialCategory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoryId.length * 3;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _congTrinhMaterialCategorySerialize(
  CongTrinhMaterialCategory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.categoryId);
  writer.writeString(offsets[1], object.code);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDateTime(offsets[3], object.deletedAt);
  writer.writeString(offsets[4], object.description);
  writer.writeString(offsets[5], object.deviceId);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeString(offsets[7], object.name);
  writer.writeDateTime(offsets[8], object.updatedAt);
  writer.writeLong(offsets[9], object.version);
}

CongTrinhMaterialCategory _congTrinhMaterialCategoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CongTrinhMaterialCategory();
  object.categoryId = reader.readString(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[3]);
  object.description = reader.readString(offsets[4]);
  object.deviceId = reader.readString(offsets[5]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[6]);
  object.name = reader.readString(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  object.version = reader.readLong(offsets[9]);
  return object;
}

P _congTrinhMaterialCategoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
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
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _congTrinhMaterialCategoryGetId(CongTrinhMaterialCategory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _congTrinhMaterialCategoryGetLinks(
    CongTrinhMaterialCategory object) {
  return [];
}

void _congTrinhMaterialCategoryAttach(
    IsarCollection<dynamic> col, Id id, CongTrinhMaterialCategory object) {
  object.id = id;
}

extension CongTrinhMaterialCategoryByIndex
    on IsarCollection<CongTrinhMaterialCategory> {
  Future<CongTrinhMaterialCategory?> getByCategoryId(String categoryId) {
    return getByIndex(r'categoryId', [categoryId]);
  }

  CongTrinhMaterialCategory? getByCategoryIdSync(String categoryId) {
    return getByIndexSync(r'categoryId', [categoryId]);
  }

  Future<bool> deleteByCategoryId(String categoryId) {
    return deleteByIndex(r'categoryId', [categoryId]);
  }

  bool deleteByCategoryIdSync(String categoryId) {
    return deleteByIndexSync(r'categoryId', [categoryId]);
  }

  Future<List<CongTrinhMaterialCategory?>> getAllByCategoryId(
      List<String> categoryIdValues) {
    final values = categoryIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'categoryId', values);
  }

  List<CongTrinhMaterialCategory?> getAllByCategoryIdSync(
      List<String> categoryIdValues) {
    final values = categoryIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'categoryId', values);
  }

  Future<int> deleteAllByCategoryId(List<String> categoryIdValues) {
    final values = categoryIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'categoryId', values);
  }

  int deleteAllByCategoryIdSync(List<String> categoryIdValues) {
    final values = categoryIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'categoryId', values);
  }

  Future<Id> putByCategoryId(CongTrinhMaterialCategory object) {
    return putByIndex(r'categoryId', object);
  }

  Id putByCategoryIdSync(CongTrinhMaterialCategory object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'categoryId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCategoryId(List<CongTrinhMaterialCategory> objects) {
    return putAllByIndex(r'categoryId', objects);
  }

  List<Id> putAllByCategoryIdSync(List<CongTrinhMaterialCategory> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'categoryId', objects, saveLinks: saveLinks);
  }
}

extension CongTrinhMaterialCategoryQueryWhereSort on QueryBuilder<
    CongTrinhMaterialCategory, CongTrinhMaterialCategory, QWhere> {
  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CongTrinhMaterialCategoryQueryWhere on QueryBuilder<
    CongTrinhMaterialCategory, CongTrinhMaterialCategory, QWhereClause> {
  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterWhereClause> categoryIdEqualTo(String categoryId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'categoryId',
        value: [categoryId],
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterWhereClause> categoryIdNotEqualTo(String categoryId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'categoryId',
              lower: [],
              upper: [categoryId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'categoryId',
              lower: [categoryId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'categoryId',
              lower: [categoryId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'categoryId',
              lower: [],
              upper: [categoryId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CongTrinhMaterialCategoryQueryFilter on QueryBuilder<
    CongTrinhMaterialCategory, CongTrinhMaterialCategory, QFilterCondition> {
  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> categoryIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> categoryIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> categoryIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> categoryIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> categoryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> categoryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
          QAfterFilterCondition>
      categoryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
          QAfterFilterCondition>
      categoryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> categoryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> categoryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> codeEqualTo(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> codeBetween(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> codeStartsWith(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> codeEndsWith(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
          QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
          QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
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

extension CongTrinhMaterialCategoryQueryObject on QueryBuilder<
    CongTrinhMaterialCategory, CongTrinhMaterialCategory, QFilterCondition> {}

extension CongTrinhMaterialCategoryQueryLinks on QueryBuilder<
    CongTrinhMaterialCategory, CongTrinhMaterialCategory, QFilterCondition> {}

extension CongTrinhMaterialCategoryQuerySortBy on QueryBuilder<
    CongTrinhMaterialCategory, CongTrinhMaterialCategory, QSortBy> {
  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhMaterialCategoryQuerySortThenBy on QueryBuilder<
    CongTrinhMaterialCategory, CongTrinhMaterialCategory, QSortThenBy> {
  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory,
      QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhMaterialCategoryQueryWhereDistinct on QueryBuilder<
    CongTrinhMaterialCategory, CongTrinhMaterialCategory, QDistinct> {
  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory, QDistinct>
      distinctByCategoryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory, QDistinct>
      distinctByCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, CongTrinhMaterialCategory, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension CongTrinhMaterialCategoryQueryProperty on QueryBuilder<
    CongTrinhMaterialCategory, CongTrinhMaterialCategory, QQueryProperty> {
  QueryBuilder<CongTrinhMaterialCategory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, String, QQueryOperations>
      categoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryId');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, String, QQueryOperations>
      codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialCategory, int, QQueryOperations>
      versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCongTrinhMaterialCollection on Isar {
  IsarCollection<CongTrinhMaterial> get congTrinhMaterials => this.collection();
}

const CongTrinhMaterialSchema = CollectionSchema(
  name: r'CongTrinhMaterial',
  id: 7792242400892454821,
  properties: {
    r'categoryId': PropertySchema(
      id: 0,
      name: r'categoryId',
      type: IsarType.string,
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
    r'defaultUnit': PropertySchema(
      id: 3,
      name: r'defaultUnit',
      type: IsarType.string,
    ),
    r'deletedAt': PropertySchema(
      id: 4,
      name: r'deletedAt',
      type: IsarType.dateTime,
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
    r'materialId': PropertySchema(
      id: 7,
      name: r'materialId',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 9,
      name: r'notes',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 11,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _congTrinhMaterialEstimateSize,
  serialize: _congTrinhMaterialSerialize,
  deserialize: _congTrinhMaterialDeserialize,
  deserializeProp: _congTrinhMaterialDeserializeProp,
  idName: r'id',
  indexes: {
    r'materialId': IndexSchema(
      id: -4039490305560314015,
      name: r'materialId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'materialId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _congTrinhMaterialGetId,
  getLinks: _congTrinhMaterialGetLinks,
  attach: _congTrinhMaterialAttach,
  version: '3.1.0+1',
);

int _congTrinhMaterialEstimateSize(
  CongTrinhMaterial object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoryId.length * 3;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.defaultUnit.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.materialId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  return bytesCount;
}

void _congTrinhMaterialSerialize(
  CongTrinhMaterial object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.categoryId);
  writer.writeString(offsets[1], object.code);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.defaultUnit);
  writer.writeDateTime(offsets[4], object.deletedAt);
  writer.writeString(offsets[5], object.deviceId);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeString(offsets[7], object.materialId);
  writer.writeString(offsets[8], object.name);
  writer.writeString(offsets[9], object.notes);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeLong(offsets[11], object.version);
}

CongTrinhMaterial _congTrinhMaterialDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CongTrinhMaterial();
  object.categoryId = reader.readString(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.defaultUnit = reader.readString(offsets[3]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[4]);
  object.deviceId = reader.readString(offsets[5]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[6]);
  object.materialId = reader.readString(offsets[7]);
  object.name = reader.readString(offsets[8]);
  object.notes = reader.readString(offsets[9]);
  object.updatedAt = reader.readDateTime(offsets[10]);
  object.version = reader.readLong(offsets[11]);
  return object;
}

P _congTrinhMaterialDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _congTrinhMaterialGetId(CongTrinhMaterial object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _congTrinhMaterialGetLinks(
    CongTrinhMaterial object) {
  return [];
}

void _congTrinhMaterialAttach(
    IsarCollection<dynamic> col, Id id, CongTrinhMaterial object) {
  object.id = id;
}

extension CongTrinhMaterialByIndex on IsarCollection<CongTrinhMaterial> {
  Future<CongTrinhMaterial?> getByMaterialId(String materialId) {
    return getByIndex(r'materialId', [materialId]);
  }

  CongTrinhMaterial? getByMaterialIdSync(String materialId) {
    return getByIndexSync(r'materialId', [materialId]);
  }

  Future<bool> deleteByMaterialId(String materialId) {
    return deleteByIndex(r'materialId', [materialId]);
  }

  bool deleteByMaterialIdSync(String materialId) {
    return deleteByIndexSync(r'materialId', [materialId]);
  }

  Future<List<CongTrinhMaterial?>> getAllByMaterialId(
      List<String> materialIdValues) {
    final values = materialIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'materialId', values);
  }

  List<CongTrinhMaterial?> getAllByMaterialIdSync(
      List<String> materialIdValues) {
    final values = materialIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'materialId', values);
  }

  Future<int> deleteAllByMaterialId(List<String> materialIdValues) {
    final values = materialIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'materialId', values);
  }

  int deleteAllByMaterialIdSync(List<String> materialIdValues) {
    final values = materialIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'materialId', values);
  }

  Future<Id> putByMaterialId(CongTrinhMaterial object) {
    return putByIndex(r'materialId', object);
  }

  Id putByMaterialIdSync(CongTrinhMaterial object, {bool saveLinks = true}) {
    return putByIndexSync(r'materialId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMaterialId(List<CongTrinhMaterial> objects) {
    return putAllByIndex(r'materialId', objects);
  }

  List<Id> putAllByMaterialIdSync(List<CongTrinhMaterial> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'materialId', objects, saveLinks: saveLinks);
  }
}

extension CongTrinhMaterialQueryWhereSort
    on QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QWhere> {
  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CongTrinhMaterialQueryWhere
    on QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QWhereClause> {
  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterWhereClause>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterWhereClause>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterWhereClause>
      materialIdEqualTo(String materialId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'materialId',
        value: [materialId],
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterWhereClause>
      materialIdNotEqualTo(String materialId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'materialId',
              lower: [],
              upper: [materialId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'materialId',
              lower: [materialId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'materialId',
              lower: [materialId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'materialId',
              lower: [],
              upper: [materialId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CongTrinhMaterialQueryFilter
    on QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QFilterCondition> {
  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      categoryIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      categoryIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      categoryIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      categoryIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      categoryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      categoryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      categoryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      categoryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      categoryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      categoryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      defaultUnitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      defaultUnitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defaultUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      defaultUnitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defaultUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      defaultUnitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defaultUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      defaultUnitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'defaultUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      defaultUnitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'defaultUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      defaultUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defaultUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      defaultUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defaultUnit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      defaultUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      defaultUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defaultUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      materialIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      materialIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      materialIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      materialIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'materialId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      materialIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      materialIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      materialIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      materialIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'materialId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      materialIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      materialIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'materialId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      notesEqualTo(
    String value, {
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      notesGreaterThan(
    String value, {
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      notesLessThan(
    String value, {
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      notesBetween(
    String lower,
    String upper, {
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      notesStartsWith(
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      notesEndsWith(
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterFilterCondition>
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

extension CongTrinhMaterialQueryObject
    on QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QFilterCondition> {}

extension CongTrinhMaterialQueryLinks
    on QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QFilterCondition> {}

extension CongTrinhMaterialQuerySortBy
    on QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QSortBy> {
  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByDefaultUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByDefaultUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByMaterialId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByMaterialIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhMaterialQuerySortThenBy
    on QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QSortThenBy> {
  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByDefaultUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByDefaultUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByMaterialId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByMaterialIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhMaterialQueryWhereDistinct
    on QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct> {
  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct>
      distinctByCategoryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct>
      distinctByDefaultUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultUnit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct>
      distinctByMaterialId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'materialId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension CongTrinhMaterialQueryProperty
    on QueryBuilder<CongTrinhMaterial, CongTrinhMaterial, QQueryProperty> {
  QueryBuilder<CongTrinhMaterial, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CongTrinhMaterial, String, QQueryOperations>
      categoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryId');
    });
  }

  QueryBuilder<CongTrinhMaterial, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<CongTrinhMaterial, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhMaterial, String, QQueryOperations>
      defaultUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultUnit');
    });
  }

  QueryBuilder<CongTrinhMaterial, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhMaterial, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<CongTrinhMaterial, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhMaterial, String, QQueryOperations>
      materialIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'materialId');
    });
  }

  QueryBuilder<CongTrinhMaterial, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CongTrinhMaterial, String, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<CongTrinhMaterial, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhMaterial, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCongTrinhMaterialNormCollection on Isar {
  IsarCollection<CongTrinhMaterialNorm> get congTrinhMaterialNorms =>
      this.collection();
}

const CongTrinhMaterialNormSchema = CollectionSchema(
  name: r'CongTrinhMaterialNorm',
  id: -8161976801500107306,
  properties: {
    r'buildingGrade': PropertySchema(
      id: 0,
      name: r'buildingGrade',
      type: IsarType.string,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'coefficient': PropertySchema(
      id: 2,
      name: r'coefficient',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 4,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 5,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'effectiveFrom': PropertySchema(
      id: 6,
      name: r'effectiveFrom',
      type: IsarType.dateTime,
    ),
    r'effectiveTo': PropertySchema(
      id: 7,
      name: r'effectiveTo',
      type: IsarType.dateTime,
    ),
    r'finishLevel': PropertySchema(
      id: 8,
      name: r'finishLevel',
      type: IsarType.string,
    ),
    r'foundationType': PropertySchema(
      id: 9,
      name: r'foundationType',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 10,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'materialId': PropertySchema(
      id: 11,
      name: r'materialId',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 12,
      name: r'name',
      type: IsarType.string,
    ),
    r'normId': PropertySchema(
      id: 13,
      name: r'normId',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 14,
      name: r'notes',
      type: IsarType.string,
    ),
    r'quantityPerM2': PropertySchema(
      id: 15,
      name: r'quantityPerM2',
      type: IsarType.double,
    ),
    r'structureType': PropertySchema(
      id: 16,
      name: r'structureType',
      type: IsarType.string,
    ),
    r'unit': PropertySchema(
      id: 17,
      name: r'unit',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 18,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 19,
      name: r'version',
      type: IsarType.long,
    ),
    r'wastePercent': PropertySchema(
      id: 20,
      name: r'wastePercent',
      type: IsarType.double,
    )
  },
  estimateSize: _congTrinhMaterialNormEstimateSize,
  serialize: _congTrinhMaterialNormSerialize,
  deserialize: _congTrinhMaterialNormDeserialize,
  deserializeProp: _congTrinhMaterialNormDeserializeProp,
  idName: r'id',
  indexes: {
    r'normId': IndexSchema(
      id: 2886982845469131138,
      name: r'normId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'normId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _congTrinhMaterialNormGetId,
  getLinks: _congTrinhMaterialNormGetLinks,
  attach: _congTrinhMaterialNormAttach,
  version: '3.1.0+1',
);

int _congTrinhMaterialNormEstimateSize(
  CongTrinhMaterialNorm object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.buildingGrade.length * 3;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.finishLevel.length * 3;
  bytesCount += 3 + object.foundationType.length * 3;
  bytesCount += 3 + object.materialId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.normId.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  bytesCount += 3 + object.structureType.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _congTrinhMaterialNormSerialize(
  CongTrinhMaterialNorm object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.buildingGrade);
  writer.writeString(offsets[1], object.code);
  writer.writeDouble(offsets[2], object.coefficient);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDateTime(offsets[4], object.deletedAt);
  writer.writeString(offsets[5], object.deviceId);
  writer.writeDateTime(offsets[6], object.effectiveFrom);
  writer.writeDateTime(offsets[7], object.effectiveTo);
  writer.writeString(offsets[8], object.finishLevel);
  writer.writeString(offsets[9], object.foundationType);
  writer.writeBool(offsets[10], object.isSynced);
  writer.writeString(offsets[11], object.materialId);
  writer.writeString(offsets[12], object.name);
  writer.writeString(offsets[13], object.normId);
  writer.writeString(offsets[14], object.notes);
  writer.writeDouble(offsets[15], object.quantityPerM2);
  writer.writeString(offsets[16], object.structureType);
  writer.writeString(offsets[17], object.unit);
  writer.writeDateTime(offsets[18], object.updatedAt);
  writer.writeLong(offsets[19], object.version);
  writer.writeDouble(offsets[20], object.wastePercent);
}

CongTrinhMaterialNorm _congTrinhMaterialNormDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CongTrinhMaterialNorm();
  object.buildingGrade = reader.readString(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.coefficient = reader.readDouble(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[4]);
  object.deviceId = reader.readString(offsets[5]);
  object.effectiveFrom = reader.readDateTimeOrNull(offsets[6]);
  object.effectiveTo = reader.readDateTimeOrNull(offsets[7]);
  object.finishLevel = reader.readString(offsets[8]);
  object.foundationType = reader.readString(offsets[9]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[10]);
  object.materialId = reader.readString(offsets[11]);
  object.name = reader.readString(offsets[12]);
  object.normId = reader.readString(offsets[13]);
  object.notes = reader.readString(offsets[14]);
  object.quantityPerM2 = reader.readDouble(offsets[15]);
  object.structureType = reader.readString(offsets[16]);
  object.unit = reader.readString(offsets[17]);
  object.updatedAt = reader.readDateTime(offsets[18]);
  object.version = reader.readLong(offsets[19]);
  object.wastePercent = reader.readDouble(offsets[20]);
  return object;
}

P _congTrinhMaterialNormDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readDateTime(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _congTrinhMaterialNormGetId(CongTrinhMaterialNorm object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _congTrinhMaterialNormGetLinks(
    CongTrinhMaterialNorm object) {
  return [];
}

void _congTrinhMaterialNormAttach(
    IsarCollection<dynamic> col, Id id, CongTrinhMaterialNorm object) {
  object.id = id;
}

extension CongTrinhMaterialNormByIndex
    on IsarCollection<CongTrinhMaterialNorm> {
  Future<CongTrinhMaterialNorm?> getByNormId(String normId) {
    return getByIndex(r'normId', [normId]);
  }

  CongTrinhMaterialNorm? getByNormIdSync(String normId) {
    return getByIndexSync(r'normId', [normId]);
  }

  Future<bool> deleteByNormId(String normId) {
    return deleteByIndex(r'normId', [normId]);
  }

  bool deleteByNormIdSync(String normId) {
    return deleteByIndexSync(r'normId', [normId]);
  }

  Future<List<CongTrinhMaterialNorm?>> getAllByNormId(
      List<String> normIdValues) {
    final values = normIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'normId', values);
  }

  List<CongTrinhMaterialNorm?> getAllByNormIdSync(List<String> normIdValues) {
    final values = normIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'normId', values);
  }

  Future<int> deleteAllByNormId(List<String> normIdValues) {
    final values = normIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'normId', values);
  }

  int deleteAllByNormIdSync(List<String> normIdValues) {
    final values = normIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'normId', values);
  }

  Future<Id> putByNormId(CongTrinhMaterialNorm object) {
    return putByIndex(r'normId', object);
  }

  Id putByNormIdSync(CongTrinhMaterialNorm object, {bool saveLinks = true}) {
    return putByIndexSync(r'normId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNormId(List<CongTrinhMaterialNorm> objects) {
    return putAllByIndex(r'normId', objects);
  }

  List<Id> putAllByNormIdSync(List<CongTrinhMaterialNorm> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'normId', objects, saveLinks: saveLinks);
  }
}

extension CongTrinhMaterialNormQueryWhereSort
    on QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QWhere> {
  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CongTrinhMaterialNormQueryWhere on QueryBuilder<CongTrinhMaterialNorm,
    CongTrinhMaterialNorm, QWhereClause> {
  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterWhereClause>
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterWhereClause>
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterWhereClause>
      normIdEqualTo(String normId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'normId',
        value: [normId],
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterWhereClause>
      normIdNotEqualTo(String normId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'normId',
              lower: [],
              upper: [normId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'normId',
              lower: [normId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'normId',
              lower: [normId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'normId',
              lower: [],
              upper: [normId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CongTrinhMaterialNormQueryFilter on QueryBuilder<
    CongTrinhMaterialNorm, CongTrinhMaterialNorm, QFilterCondition> {
  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> buildingGradeEqualTo(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> buildingGradeGreaterThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> buildingGradeLessThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> buildingGradeBetween(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> buildingGradeStartsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> buildingGradeEndsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      buildingGradeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      buildingGradeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'buildingGrade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> buildingGradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buildingGrade',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> buildingGradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'buildingGrade',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> codeEqualTo(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> codeBetween(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> codeStartsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> codeEndsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> coefficientEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coefficient',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> coefficientGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coefficient',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> coefficientLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coefficient',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> coefficientBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coefficient',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveFromIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectiveFrom',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveFromIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectiveFrom',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveFromEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveFromGreaterThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveFromLessThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveFromBetween(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectiveTo',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectiveTo',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveToEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveTo',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveToGreaterThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveToLessThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> effectiveToBetween(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> finishLevelEqualTo(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> finishLevelGreaterThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> finishLevelLessThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> finishLevelBetween(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> finishLevelStartsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> finishLevelEndsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      finishLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      finishLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'finishLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> finishLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finishLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> finishLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'finishLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> foundationTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> foundationTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> foundationTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> foundationTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foundationType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> foundationTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> foundationTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      foundationTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      foundationTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foundationType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> foundationTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foundationType',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> foundationTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foundationType',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> materialIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> materialIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> materialIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> materialIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'materialId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> materialIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> materialIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      materialIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      materialIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'materialId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> materialIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> materialIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'materialId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> normIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'normId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> normIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'normId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> normIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'normId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> normIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'normId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> normIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'normId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> normIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'normId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      normIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'normId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      normIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'normId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> normIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'normId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> normIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'normId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> notesEqualTo(
    String value, {
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> notesGreaterThan(
    String value, {
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> notesLessThan(
    String value, {
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> notesBetween(
    String lower,
    String upper, {
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> quantityPerM2EqualTo(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> quantityPerM2GreaterThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> quantityPerM2LessThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> quantityPerM2Between(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> structureTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> structureTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> structureTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> structureTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'structureType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> structureTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> structureTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      structureTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      structureTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'structureType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> structureTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'structureType',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> structureTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'structureType',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> unitEqualTo(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> unitGreaterThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> unitLessThan(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> unitBetween(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> unitStartsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> unitEndsWith(
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
          QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
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

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> wastePercentEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wastePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> wastePercentGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wastePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> wastePercentLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wastePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm,
      QAfterFilterCondition> wastePercentBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wastePercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CongTrinhMaterialNormQueryObject on QueryBuilder<
    CongTrinhMaterialNorm, CongTrinhMaterialNorm, QFilterCondition> {}

extension CongTrinhMaterialNormQueryLinks on QueryBuilder<CongTrinhMaterialNorm,
    CongTrinhMaterialNorm, QFilterCondition> {}

extension CongTrinhMaterialNormQuerySortBy
    on QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QSortBy> {
  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByBuildingGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByBuildingGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByCoefficientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByEffectiveFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByEffectiveFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByEffectiveTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByEffectiveToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByFinishLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByFinishLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByFoundationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foundationType', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByFoundationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foundationType', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByMaterialId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByMaterialIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByNormId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByNormIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByQuantityPerM2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityPerM2', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByQuantityPerM2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityPerM2', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByStructureType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureType', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByStructureTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureType', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByWastePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wastePercent', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      sortByWastePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wastePercent', Sort.desc);
    });
  }
}

extension CongTrinhMaterialNormQuerySortThenBy
    on QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QSortThenBy> {
  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByBuildingGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByBuildingGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByCoefficientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByEffectiveFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByEffectiveFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByEffectiveTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByEffectiveToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByFinishLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByFinishLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByFoundationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foundationType', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByFoundationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foundationType', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByMaterialId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByMaterialIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByNormId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByNormIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByQuantityPerM2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityPerM2', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByQuantityPerM2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityPerM2', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByStructureType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureType', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByStructureTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureType', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByWastePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wastePercent', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QAfterSortBy>
      thenByWastePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wastePercent', Sort.desc);
    });
  }
}

extension CongTrinhMaterialNormQueryWhereDistinct
    on QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct> {
  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByBuildingGrade({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buildingGrade',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coefficient');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByEffectiveFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveFrom');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByEffectiveTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveTo');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByFinishLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finishLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByFoundationType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foundationType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByMaterialId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'materialId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByNormId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'normId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByQuantityPerM2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityPerM2');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByStructureType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'structureType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, CongTrinhMaterialNorm, QDistinct>
      distinctByWastePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wastePercent');
    });
  }
}

extension CongTrinhMaterialNormQueryProperty on QueryBuilder<
    CongTrinhMaterialNorm, CongTrinhMaterialNorm, QQueryProperty> {
  QueryBuilder<CongTrinhMaterialNorm, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, String, QQueryOperations>
      buildingGradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buildingGrade');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, double, QQueryOperations>
      coefficientProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coefficient');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, DateTime?, QQueryOperations>
      effectiveFromProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveFrom');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, DateTime?, QQueryOperations>
      effectiveToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveTo');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, String, QQueryOperations>
      finishLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finishLevel');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, String, QQueryOperations>
      foundationTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foundationType');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, String, QQueryOperations>
      materialIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'materialId');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, String, QQueryOperations>
      normIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'normId');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, String, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, double, QQueryOperations>
      quantityPerM2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityPerM2');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, String, QQueryOperations>
      structureTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'structureType');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }

  QueryBuilder<CongTrinhMaterialNorm, double, QQueryOperations>
      wastePercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wastePercent');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCongTrinhMaterialPriceCollection on Isar {
  IsarCollection<CongTrinhMaterialPrice> get congTrinhMaterialPrices =>
      this.collection();
}

const CongTrinhMaterialPriceSchema = CollectionSchema(
  name: r'CongTrinhMaterialPrice',
  id: 274254748171273633,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
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
    r'district': PropertySchema(
      id: 3,
      name: r'district',
      type: IsarType.string,
    ),
    r'effectiveDate': PropertySchema(
      id: 4,
      name: r'effectiveDate',
      type: IsarType.dateTime,
    ),
    r'isSynced': PropertySchema(
      id: 5,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'materialId': PropertySchema(
      id: 6,
      name: r'materialId',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 7,
      name: r'notes',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 8,
      name: r'price',
      type: IsarType.double,
    ),
    r'priceId': PropertySchema(
      id: 9,
      name: r'priceId',
      type: IsarType.string,
    ),
    r'province': PropertySchema(
      id: 10,
      name: r'province',
      type: IsarType.string,
    ),
    r'source': PropertySchema(
      id: 11,
      name: r'source',
      type: IsarType.string,
    ),
    r'supplierId': PropertySchema(
      id: 12,
      name: r'supplierId',
      type: IsarType.string,
    ),
    r'transportCost': PropertySchema(
      id: 13,
      name: r'transportCost',
      type: IsarType.double,
    ),
    r'unit': PropertySchema(
      id: 14,
      name: r'unit',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 15,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vatPercent': PropertySchema(
      id: 16,
      name: r'vatPercent',
      type: IsarType.double,
    ),
    r'version': PropertySchema(
      id: 17,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _congTrinhMaterialPriceEstimateSize,
  serialize: _congTrinhMaterialPriceSerialize,
  deserialize: _congTrinhMaterialPriceDeserialize,
  deserializeProp: _congTrinhMaterialPriceDeserializeProp,
  idName: r'id',
  indexes: {
    r'priceId': IndexSchema(
      id: 4214521554078543696,
      name: r'priceId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'priceId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _congTrinhMaterialPriceGetId,
  getLinks: _congTrinhMaterialPriceGetLinks,
  attach: _congTrinhMaterialPriceAttach,
  version: '3.1.0+1',
);

int _congTrinhMaterialPriceEstimateSize(
  CongTrinhMaterialPrice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.district.length * 3;
  bytesCount += 3 + object.materialId.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  bytesCount += 3 + object.priceId.length * 3;
  bytesCount += 3 + object.province.length * 3;
  bytesCount += 3 + object.source.length * 3;
  bytesCount += 3 + object.supplierId.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _congTrinhMaterialPriceSerialize(
  CongTrinhMaterialPrice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeString(offsets[3], object.district);
  writer.writeDateTime(offsets[4], object.effectiveDate);
  writer.writeBool(offsets[5], object.isSynced);
  writer.writeString(offsets[6], object.materialId);
  writer.writeString(offsets[7], object.notes);
  writer.writeDouble(offsets[8], object.price);
  writer.writeString(offsets[9], object.priceId);
  writer.writeString(offsets[10], object.province);
  writer.writeString(offsets[11], object.source);
  writer.writeString(offsets[12], object.supplierId);
  writer.writeDouble(offsets[13], object.transportCost);
  writer.writeString(offsets[14], object.unit);
  writer.writeDateTime(offsets[15], object.updatedAt);
  writer.writeDouble(offsets[16], object.vatPercent);
  writer.writeLong(offsets[17], object.version);
}

CongTrinhMaterialPrice _congTrinhMaterialPriceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CongTrinhMaterialPrice();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.district = reader.readString(offsets[3]);
  object.effectiveDate = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[5]);
  object.materialId = reader.readString(offsets[6]);
  object.notes = reader.readString(offsets[7]);
  object.price = reader.readDouble(offsets[8]);
  object.priceId = reader.readString(offsets[9]);
  object.province = reader.readString(offsets[10]);
  object.source = reader.readString(offsets[11]);
  object.supplierId = reader.readString(offsets[12]);
  object.transportCost = reader.readDouble(offsets[13]);
  object.unit = reader.readString(offsets[14]);
  object.updatedAt = reader.readDateTime(offsets[15]);
  object.vatPercent = reader.readDouble(offsets[16]);
  object.version = reader.readLong(offsets[17]);
  return object;
}

P _congTrinhMaterialPriceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _congTrinhMaterialPriceGetId(CongTrinhMaterialPrice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _congTrinhMaterialPriceGetLinks(
    CongTrinhMaterialPrice object) {
  return [];
}

void _congTrinhMaterialPriceAttach(
    IsarCollection<dynamic> col, Id id, CongTrinhMaterialPrice object) {
  object.id = id;
}

extension CongTrinhMaterialPriceByIndex
    on IsarCollection<CongTrinhMaterialPrice> {
  Future<CongTrinhMaterialPrice?> getByPriceId(String priceId) {
    return getByIndex(r'priceId', [priceId]);
  }

  CongTrinhMaterialPrice? getByPriceIdSync(String priceId) {
    return getByIndexSync(r'priceId', [priceId]);
  }

  Future<bool> deleteByPriceId(String priceId) {
    return deleteByIndex(r'priceId', [priceId]);
  }

  bool deleteByPriceIdSync(String priceId) {
    return deleteByIndexSync(r'priceId', [priceId]);
  }

  Future<List<CongTrinhMaterialPrice?>> getAllByPriceId(
      List<String> priceIdValues) {
    final values = priceIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'priceId', values);
  }

  List<CongTrinhMaterialPrice?> getAllByPriceIdSync(
      List<String> priceIdValues) {
    final values = priceIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'priceId', values);
  }

  Future<int> deleteAllByPriceId(List<String> priceIdValues) {
    final values = priceIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'priceId', values);
  }

  int deleteAllByPriceIdSync(List<String> priceIdValues) {
    final values = priceIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'priceId', values);
  }

  Future<Id> putByPriceId(CongTrinhMaterialPrice object) {
    return putByIndex(r'priceId', object);
  }

  Id putByPriceIdSync(CongTrinhMaterialPrice object, {bool saveLinks = true}) {
    return putByIndexSync(r'priceId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPriceId(List<CongTrinhMaterialPrice> objects) {
    return putAllByIndex(r'priceId', objects);
  }

  List<Id> putAllByPriceIdSync(List<CongTrinhMaterialPrice> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'priceId', objects, saveLinks: saveLinks);
  }
}

extension CongTrinhMaterialPriceQueryWhereSort
    on QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QWhere> {
  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CongTrinhMaterialPriceQueryWhere on QueryBuilder<
    CongTrinhMaterialPrice, CongTrinhMaterialPrice, QWhereClause> {
  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterWhereClause> priceIdEqualTo(String priceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'priceId',
        value: [priceId],
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterWhereClause> priceIdNotEqualTo(String priceId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'priceId',
              lower: [],
              upper: [priceId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'priceId',
              lower: [priceId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'priceId',
              lower: [priceId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'priceId',
              lower: [],
              upper: [priceId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CongTrinhMaterialPriceQueryFilter on QueryBuilder<
    CongTrinhMaterialPrice, CongTrinhMaterialPrice, QFilterCondition> {
  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> districtEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> districtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> districtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> districtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'district',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> districtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> districtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      districtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      districtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'district',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> districtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> districtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> effectiveDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectiveDate',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> effectiveDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectiveDate',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> effectiveDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveDate',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> effectiveDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveDate',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> effectiveDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveDate',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> effectiveDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> materialIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> materialIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> materialIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> materialIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'materialId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> materialIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> materialIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      materialIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      materialIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'materialId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> materialIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> materialIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'materialId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> notesEqualTo(
    String value, {
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> notesGreaterThan(
    String value, {
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> notesLessThan(
    String value, {
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> notesBetween(
    String lower,
    String upper, {
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      priceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      priceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> priceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> provinceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> provinceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> provinceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> provinceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'province',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> provinceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> provinceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      provinceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      provinceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'province',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> provinceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'province',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> provinceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'province',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> sourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> sourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> sourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> sourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> supplierIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> supplierIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> supplierIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> supplierIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supplierId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> supplierIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> supplierIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      supplierIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      supplierIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'supplierId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> supplierIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> supplierIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'supplierId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> transportCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transportCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> transportCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transportCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> transportCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transportCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> transportCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transportCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> unitEqualTo(
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> unitGreaterThan(
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> unitLessThan(
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> unitBetween(
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> unitStartsWith(
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> unitEndsWith(
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
          QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> vatPercentEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vatPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> vatPercentGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vatPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> vatPercentLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vatPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> vatPercentBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vatPercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice,
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

extension CongTrinhMaterialPriceQueryObject on QueryBuilder<
    CongTrinhMaterialPrice, CongTrinhMaterialPrice, QFilterCondition> {}

extension CongTrinhMaterialPriceQueryLinks on QueryBuilder<
    CongTrinhMaterialPrice, CongTrinhMaterialPrice, QFilterCondition> {}

extension CongTrinhMaterialPriceQuerySortBy
    on QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QSortBy> {
  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByEffectiveDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDate', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByEffectiveDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDate', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByMaterialId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByMaterialIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByPriceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByPriceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByProvince() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByProvinceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortBySupplierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByTransportCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportCost', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByTransportCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportCost', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByVatPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatPercent', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByVatPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatPercent', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhMaterialPriceQuerySortThenBy on QueryBuilder<
    CongTrinhMaterialPrice, CongTrinhMaterialPrice, QSortThenBy> {
  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByEffectiveDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDate', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByEffectiveDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDate', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByMaterialId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByMaterialIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByPriceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByPriceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByProvince() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByProvinceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenBySupplierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByTransportCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportCost', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByTransportCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportCost', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByVatPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatPercent', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByVatPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatPercent', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhMaterialPriceQueryWhereDistinct
    on QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct> {
  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByDistrict({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'district', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByEffectiveDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveDate');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByMaterialId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'materialId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByPriceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByProvince({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'province', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctBySource({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctBySupplierId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supplierId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByTransportCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transportCost');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByVatPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vatPercent');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, CongTrinhMaterialPrice, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension CongTrinhMaterialPriceQueryProperty on QueryBuilder<
    CongTrinhMaterialPrice, CongTrinhMaterialPrice, QQueryProperty> {
  QueryBuilder<CongTrinhMaterialPrice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, String, QQueryOperations>
      districtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'district');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, DateTime?, QQueryOperations>
      effectiveDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveDate');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, String, QQueryOperations>
      materialIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'materialId');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, String, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, double, QQueryOperations>
      priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, String, QQueryOperations>
      priceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceId');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, String, QQueryOperations>
      provinceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'province');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, String, QQueryOperations>
      sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, String, QQueryOperations>
      supplierIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supplierId');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, double, QQueryOperations>
      transportCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transportCost');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, String, QQueryOperations>
      unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, double, QQueryOperations>
      vatPercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vatPercent');
    });
  }

  QueryBuilder<CongTrinhMaterialPrice, int, QQueryOperations>
      versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
