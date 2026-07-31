// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDataEntityCollection on Isar {
  IsarCollection<DataEntity> get dataEntitys => this.collection();
}

const DataEntitySchema = CollectionSchema(
  name: r'DataEntity',
  id: 2934823510982072699,
  properties: {
    r'appCode': PropertySchema(
      id: 0,
      name: r'appCode',
      type: IsarType.string,
    ),
    r'collection': PropertySchema(
      id: 1,
      name: r'collection',
      type: IsarType.string,
    ),
    r'itemId': PropertySchema(
      id: 2,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'jsonData': PropertySchema(
      id: 3,
      name: r'jsonData',
      type: IsarType.string,
    )
  },
  estimateSize: _dataEntityEstimateSize,
  serialize: _dataEntitySerialize,
  deserialize: _dataEntityDeserialize,
  deserializeProp: _dataEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'collection_appCode': IndexSchema(
      id: -8443067225304710632,
      name: r'collection_appCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'collection',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'appCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'appCode': IndexSchema(
      id: 339450041668314217,
      name: r'appCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'appCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _dataEntityGetId,
  getLinks: _dataEntityGetLinks,
  attach: _dataEntityAttach,
  version: '3.1.0+1',
);

int _dataEntityEstimateSize(
  DataEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.appCode.length * 3;
  bytesCount += 3 + object.collection.length * 3;
  bytesCount += 3 + object.itemId.length * 3;
  bytesCount += 3 + object.jsonData.length * 3;
  return bytesCount;
}

void _dataEntitySerialize(
  DataEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.appCode);
  writer.writeString(offsets[1], object.collection);
  writer.writeString(offsets[2], object.itemId);
  writer.writeString(offsets[3], object.jsonData);
}

DataEntity _dataEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DataEntity();
  object.appCode = reader.readString(offsets[0]);
  object.collection = reader.readString(offsets[1]);
  object.id = id;
  object.itemId = reader.readString(offsets[2]);
  object.jsonData = reader.readString(offsets[3]);
  return object;
}

P _dataEntityDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dataEntityGetId(DataEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dataEntityGetLinks(DataEntity object) {
  return [];
}

void _dataEntityAttach(IsarCollection<dynamic> col, Id id, DataEntity object) {
  object.id = id;
}

extension DataEntityQueryWhereSort
    on QueryBuilder<DataEntity, DataEntity, QWhere> {
  QueryBuilder<DataEntity, DataEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DataEntityQueryWhere
    on QueryBuilder<DataEntity, DataEntity, QWhereClause> {
  QueryBuilder<DataEntity, DataEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DataEntity, DataEntity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<DataEntity, DataEntity, QAfterWhereClause>
      collectionEqualToAnyAppCode(String collection) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'collection_appCode',
        value: [collection],
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterWhereClause>
      collectionNotEqualToAnyAppCode(String collection) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collection_appCode',
              lower: [],
              upper: [collection],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collection_appCode',
              lower: [collection],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collection_appCode',
              lower: [collection],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collection_appCode',
              lower: [],
              upper: [collection],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterWhereClause>
      collectionAppCodeEqualTo(String collection, String appCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'collection_appCode',
        value: [collection, appCode],
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterWhereClause>
      collectionEqualToAppCodeNotEqualTo(String collection, String appCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collection_appCode',
              lower: [collection],
              upper: [collection, appCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collection_appCode',
              lower: [collection, appCode],
              includeLower: false,
              upper: [collection],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collection_appCode',
              lower: [collection, appCode],
              includeLower: false,
              upper: [collection],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collection_appCode',
              lower: [collection],
              upper: [collection, appCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterWhereClause> appCodeEqualTo(
      String appCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'appCode',
        value: [appCode],
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterWhereClause> appCodeNotEqualTo(
      String appCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'appCode',
              lower: [],
              upper: [appCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'appCode',
              lower: [appCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'appCode',
              lower: [appCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'appCode',
              lower: [],
              upper: [appCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DataEntityQueryFilter
    on QueryBuilder<DataEntity, DataEntity, QFilterCondition> {
  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> appCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      appCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> appCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> appCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> appCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> appCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> appCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> appCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> appCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      appCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> collectionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      collectionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'collection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      collectionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'collection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> collectionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'collection',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      collectionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'collection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      collectionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'collection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      collectionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'collection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> collectionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'collection',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      collectionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collection',
        value: '',
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      collectionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'collection',
        value: '',
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> itemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> itemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> itemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> itemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> itemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> itemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> itemIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> itemIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> jsonDataEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jsonData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      jsonDataGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jsonData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> jsonDataLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jsonData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> jsonDataBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jsonData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      jsonDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jsonData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> jsonDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jsonData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> jsonDataContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jsonData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition> jsonDataMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jsonData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      jsonDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jsonData',
        value: '',
      ));
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterFilterCondition>
      jsonDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jsonData',
        value: '',
      ));
    });
  }
}

extension DataEntityQueryObject
    on QueryBuilder<DataEntity, DataEntity, QFilterCondition> {}

extension DataEntityQueryLinks
    on QueryBuilder<DataEntity, DataEntity, QFilterCondition> {}

extension DataEntityQuerySortBy
    on QueryBuilder<DataEntity, DataEntity, QSortBy> {
  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> sortByAppCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appCode', Sort.asc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> sortByAppCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appCode', Sort.desc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> sortByCollection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collection', Sort.asc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> sortByCollectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collection', Sort.desc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> sortByJsonData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonData', Sort.asc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> sortByJsonDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonData', Sort.desc);
    });
  }
}

extension DataEntityQuerySortThenBy
    on QueryBuilder<DataEntity, DataEntity, QSortThenBy> {
  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> thenByAppCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appCode', Sort.asc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> thenByAppCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appCode', Sort.desc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> thenByCollection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collection', Sort.asc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> thenByCollectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collection', Sort.desc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> thenByJsonData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonData', Sort.asc);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QAfterSortBy> thenByJsonDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonData', Sort.desc);
    });
  }
}

extension DataEntityQueryWhereDistinct
    on QueryBuilder<DataEntity, DataEntity, QDistinct> {
  QueryBuilder<DataEntity, DataEntity, QDistinct> distinctByAppCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QDistinct> distinctByCollection(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collection', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QDistinct> distinctByItemId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DataEntity, DataEntity, QDistinct> distinctByJsonData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jsonData', caseSensitive: caseSensitive);
    });
  }
}

extension DataEntityQueryProperty
    on QueryBuilder<DataEntity, DataEntity, QQueryProperty> {
  QueryBuilder<DataEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DataEntity, String, QQueryOperations> appCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appCode');
    });
  }

  QueryBuilder<DataEntity, String, QQueryOperations> collectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collection');
    });
  }

  QueryBuilder<DataEntity, String, QQueryOperations> itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<DataEntity, String, QQueryOperations> jsonDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jsonData');
    });
  }
}
