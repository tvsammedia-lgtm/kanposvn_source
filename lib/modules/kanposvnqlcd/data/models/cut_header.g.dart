// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cut_header.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCutHeaderCollection on Isar {
  IsarCollection<CutHeader> get cutHeaders => this.collection();
}

const CutHeaderSchema = CollectionSchema(
  name: r'CutHeader',
  id: -3163445311871553212,
  properties: {
    r'cutNo': PropertySchema(
      id: 0,
      name: r'cutNo',
      type: IsarType.string,
    ),
    r'dateCreate': PropertySchema(
      id: 1,
      name: r'dateCreate',
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
    r'fromOp': PropertySchema(
      id: 4,
      name: r'fromOp',
      type: IsarType.long,
    ),
    r'idGen': PropertySchema(
      id: 5,
      name: r'idGen',
      type: IsarType.long,
    ),
    r'isSynced': PropertySchema(
      id: 6,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'poNo': PropertySchema(
      id: 7,
      name: r'poNo',
      type: IsarType.string,
    ),
    r'sizeLabels': PropertySchema(
      id: 8,
      name: r'sizeLabels',
      type: IsarType.stringList,
    ),
    r'startBundle': PropertySchema(
      id: 9,
      name: r'startBundle',
      type: IsarType.long,
    ),
    r'toOp': PropertySchema(
      id: 10,
      name: r'toOp',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 12,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _cutHeaderEstimateSize,
  serialize: _cutHeaderSerialize,
  deserialize: _cutHeaderDeserialize,
  deserializeProp: _cutHeaderDeserializeProp,
  idName: r'id',
  indexes: {
    r'idGen': IndexSchema(
      id: 411966946173493191,
      name: r'idGen',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idGen',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _cutHeaderGetId,
  getLinks: _cutHeaderGetLinks,
  attach: _cutHeaderAttach,
  version: '3.1.0+1',
);

int _cutHeaderEstimateSize(
  CutHeader object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cutNo.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.poNo.length * 3;
  bytesCount += 3 + object.sizeLabels.length * 3;
  {
    for (var i = 0; i < object.sizeLabels.length; i++) {
      final value = object.sizeLabels[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _cutHeaderSerialize(
  CutHeader object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cutNo);
  writer.writeDateTime(offsets[1], object.dateCreate);
  writer.writeDateTime(offsets[2], object.deletedAt);
  writer.writeString(offsets[3], object.deviceId);
  writer.writeLong(offsets[4], object.fromOp);
  writer.writeLong(offsets[5], object.idGen);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeString(offsets[7], object.poNo);
  writer.writeStringList(offsets[8], object.sizeLabels);
  writer.writeLong(offsets[9], object.startBundle);
  writer.writeLong(offsets[10], object.toOp);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeLong(offsets[12], object.version);
}

CutHeader _cutHeaderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CutHeader();
  object.cutNo = reader.readString(offsets[0]);
  object.dateCreate = reader.readDateTime(offsets[1]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[2]);
  object.deviceId = reader.readString(offsets[3]);
  object.fromOp = reader.readLong(offsets[4]);
  object.id = id;
  object.idGen = reader.readLong(offsets[5]);
  object.isSynced = reader.readBool(offsets[6]);
  object.poNo = reader.readString(offsets[7]);
  object.sizeLabels = reader.readStringList(offsets[8]) ?? [];
  object.startBundle = reader.readLong(offsets[9]);
  object.toOp = reader.readLong(offsets[10]);
  object.updatedAt = reader.readDateTime(offsets[11]);
  object.version = reader.readLong(offsets[12]);
  return object;
}

P _cutHeaderDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cutHeaderGetId(CutHeader object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cutHeaderGetLinks(CutHeader object) {
  return [];
}

void _cutHeaderAttach(IsarCollection<dynamic> col, Id id, CutHeader object) {
  object.id = id;
}

extension CutHeaderByIndex on IsarCollection<CutHeader> {
  Future<CutHeader?> getByIdGen(int idGen) {
    return getByIndex(r'idGen', [idGen]);
  }

  CutHeader? getByIdGenSync(int idGen) {
    return getByIndexSync(r'idGen', [idGen]);
  }

  Future<bool> deleteByIdGen(int idGen) {
    return deleteByIndex(r'idGen', [idGen]);
  }

  bool deleteByIdGenSync(int idGen) {
    return deleteByIndexSync(r'idGen', [idGen]);
  }

  Future<List<CutHeader?>> getAllByIdGen(List<int> idGenValues) {
    final values = idGenValues.map((e) => [e]).toList();
    return getAllByIndex(r'idGen', values);
  }

  List<CutHeader?> getAllByIdGenSync(List<int> idGenValues) {
    final values = idGenValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idGen', values);
  }

  Future<int> deleteAllByIdGen(List<int> idGenValues) {
    final values = idGenValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idGen', values);
  }

  int deleteAllByIdGenSync(List<int> idGenValues) {
    final values = idGenValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idGen', values);
  }

  Future<Id> putByIdGen(CutHeader object) {
    return putByIndex(r'idGen', object);
  }

  Id putByIdGenSync(CutHeader object, {bool saveLinks = true}) {
    return putByIndexSync(r'idGen', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdGen(List<CutHeader> objects) {
    return putAllByIndex(r'idGen', objects);
  }

  List<Id> putAllByIdGenSync(List<CutHeader> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'idGen', objects, saveLinks: saveLinks);
  }
}

extension CutHeaderQueryWhereSort
    on QueryBuilder<CutHeader, CutHeader, QWhere> {
  QueryBuilder<CutHeader, CutHeader, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterWhere> anyIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idGen'),
      );
    });
  }
}

extension CutHeaderQueryWhere
    on QueryBuilder<CutHeader, CutHeader, QWhereClause> {
  QueryBuilder<CutHeader, CutHeader, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CutHeader, CutHeader, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterWhereClause> idBetween(
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

  QueryBuilder<CutHeader, CutHeader, QAfterWhereClause> idGenEqualTo(
      int idGen) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idGen',
        value: [idGen],
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterWhereClause> idGenNotEqualTo(
      int idGen) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idGen',
              lower: [],
              upper: [idGen],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idGen',
              lower: [idGen],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idGen',
              lower: [idGen],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idGen',
              lower: [],
              upper: [idGen],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterWhereClause> idGenGreaterThan(
    int idGen, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idGen',
        lower: [idGen],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterWhereClause> idGenLessThan(
    int idGen, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idGen',
        lower: [],
        upper: [idGen],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterWhereClause> idGenBetween(
    int lowerIdGen,
    int upperIdGen, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idGen',
        lower: [lowerIdGen],
        includeLower: includeLower,
        upper: [upperIdGen],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CutHeaderQueryFilter
    on QueryBuilder<CutHeader, CutHeader, QFilterCondition> {
  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> cutNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cutNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> cutNoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cutNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> cutNoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cutNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> cutNoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cutNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> cutNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cutNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> cutNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cutNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> cutNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cutNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> cutNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cutNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> cutNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cutNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> cutNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cutNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> dateCreateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateCreate',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      dateCreateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateCreate',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> dateCreateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateCreate',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> dateCreateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateCreate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deletedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deviceIdEqualTo(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deviceIdGreaterThan(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deviceIdLessThan(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deviceIdBetween(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deviceIdStartsWith(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deviceIdEndsWith(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deviceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deviceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> fromOpEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromOp',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> fromOpGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromOp',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> fromOpLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromOp',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> fromOpBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromOp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> idGenEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idGen',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> idGenGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idGen',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> idGenLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idGen',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> idGenBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idGen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> poNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> poNoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> poNoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> poNoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'poNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> poNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> poNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> poNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> poNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'poNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> poNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> poNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'poNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sizeLabels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sizeLabels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sizeLabels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sizeLabels',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sizeLabels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sizeLabels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sizeLabels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sizeLabels',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sizeLabels',
        value: '',
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sizeLabels',
        value: '',
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sizeLabels',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sizeLabels',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sizeLabels',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sizeLabels',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sizeLabels',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      sizeLabelsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sizeLabels',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> startBundleEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startBundle',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
      startBundleGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startBundle',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> startBundleLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startBundle',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> startBundleBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startBundle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> toOpEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toOp',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> toOpGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toOp',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> toOpLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toOp',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> toOpBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toOp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition>
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> versionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> versionGreaterThan(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<CutHeader, CutHeader, QAfterFilterCondition> versionBetween(
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

extension CutHeaderQueryObject
    on QueryBuilder<CutHeader, CutHeader, QFilterCondition> {}

extension CutHeaderQueryLinks
    on QueryBuilder<CutHeader, CutHeader, QFilterCondition> {}

extension CutHeaderQuerySortBy on QueryBuilder<CutHeader, CutHeader, QSortBy> {
  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByCutNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByCutNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByDateCreate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreate', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByDateCreateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreate', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByFromOp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromOp', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByFromOpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromOp', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByIdGenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByPoNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByPoNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByStartBundle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByStartBundleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByToOp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toOp', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByToOpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toOp', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CutHeaderQuerySortThenBy
    on QueryBuilder<CutHeader, CutHeader, QSortThenBy> {
  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByCutNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByCutNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByDateCreate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreate', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByDateCreateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreate', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByFromOp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromOp', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByFromOpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromOp', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByIdGenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByPoNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByPoNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByStartBundle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByStartBundleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByToOp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toOp', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByToOpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toOp', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CutHeaderQueryWhereDistinct
    on QueryBuilder<CutHeader, CutHeader, QDistinct> {
  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByCutNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cutNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByDateCreate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateCreate');
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByFromOp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromOp');
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idGen');
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByPoNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'poNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctBySizeLabels() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sizeLabels');
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByStartBundle() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startBundle');
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByToOp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toOp');
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CutHeader, CutHeader, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension CutHeaderQueryProperty
    on QueryBuilder<CutHeader, CutHeader, QQueryProperty> {
  QueryBuilder<CutHeader, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CutHeader, String, QQueryOperations> cutNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cutNo');
    });
  }

  QueryBuilder<CutHeader, DateTime, QQueryOperations> dateCreateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateCreate');
    });
  }

  QueryBuilder<CutHeader, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CutHeader, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<CutHeader, int, QQueryOperations> fromOpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromOp');
    });
  }

  QueryBuilder<CutHeader, int, QQueryOperations> idGenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idGen');
    });
  }

  QueryBuilder<CutHeader, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CutHeader, String, QQueryOperations> poNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'poNo');
    });
  }

  QueryBuilder<CutHeader, List<String>, QQueryOperations> sizeLabelsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sizeLabels');
    });
  }

  QueryBuilder<CutHeader, int, QQueryOperations> startBundleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startBundle');
    });
  }

  QueryBuilder<CutHeader, int, QQueryOperations> toOpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toOp');
    });
  }

  QueryBuilder<CutHeader, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CutHeader, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
