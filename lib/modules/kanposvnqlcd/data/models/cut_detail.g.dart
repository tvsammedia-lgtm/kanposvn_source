// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cut_detail.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCutDetailCollection on Isar {
  IsarCollection<CutDetail> get cutDetails => this.collection();
}

const CutDetailSchema = CollectionSchema(
  name: r'CutDetail',
  id: -8130483106989581735,
  properties: {
    r'color': PropertySchema(
      id: 0,
      name: r'color',
      type: IsarType.string,
    ),
    r'cutNo': PropertySchema(
      id: 1,
      name: r'cutNo',
      type: IsarType.string,
    ),
    r'cutNo1': PropertySchema(
      id: 2,
      name: r'cutNo1',
      type: IsarType.string,
    ),
    r'gen': PropertySchema(
      id: 3,
      name: r'gen',
      type: IsarType.long,
    ),
    r'idGen': PropertySchema(
      id: 4,
      name: r'idGen',
      type: IsarType.long,
    ),
    r'opNo': PropertySchema(
      id: 5,
      name: r'opNo',
      type: IsarType.long,
    ),
    r'opNo1': PropertySchema(
      id: 6,
      name: r'opNo1',
      type: IsarType.long,
    ),
    r'poNo': PropertySchema(
      id: 7,
      name: r'poNo',
      type: IsarType.string,
    ),
    r'poNo1': PropertySchema(
      id: 8,
      name: r'poNo1',
      type: IsarType.string,
    ),
    r'qty': PropertySchema(
      id: 9,
      name: r'qty',
      type: IsarType.long,
    ),
    r'qty1': PropertySchema(
      id: 10,
      name: r'qty1',
      type: IsarType.long,
    ),
    r'size': PropertySchema(
      id: 11,
      name: r'size',
      type: IsarType.string,
    ),
    r'size1': PropertySchema(
      id: 12,
      name: r'size1',
      type: IsarType.string,
    ),
    r'startBundle': PropertySchema(
      id: 13,
      name: r'startBundle',
      type: IsarType.long,
    ),
    r'startBundle1': PropertySchema(
      id: 14,
      name: r'startBundle1',
      type: IsarType.long,
    )
  },
  estimateSize: _cutDetailEstimateSize,
  serialize: _cutDetailSerialize,
  deserialize: _cutDetailDeserialize,
  deserializeProp: _cutDetailDeserializeProp,
  idName: r'id',
  indexes: {
    r'idGen': IndexSchema(
      id: 411966946173493191,
      name: r'idGen',
      unique: false,
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
  getId: _cutDetailGetId,
  getLinks: _cutDetailGetLinks,
  attach: _cutDetailAttach,
  version: '3.1.0+1',
);

int _cutDetailEstimateSize(
  CutDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.color.length * 3;
  bytesCount += 3 + object.cutNo.length * 3;
  {
    final value = object.cutNo1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.poNo.length * 3;
  {
    final value = object.poNo1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.size.length * 3;
  {
    final value = object.size1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _cutDetailSerialize(
  CutDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.color);
  writer.writeString(offsets[1], object.cutNo);
  writer.writeString(offsets[2], object.cutNo1);
  writer.writeLong(offsets[3], object.gen);
  writer.writeLong(offsets[4], object.idGen);
  writer.writeLong(offsets[5], object.opNo);
  writer.writeLong(offsets[6], object.opNo1);
  writer.writeString(offsets[7], object.poNo);
  writer.writeString(offsets[8], object.poNo1);
  writer.writeLong(offsets[9], object.qty);
  writer.writeLong(offsets[10], object.qty1);
  writer.writeString(offsets[11], object.size);
  writer.writeString(offsets[12], object.size1);
  writer.writeLong(offsets[13], object.startBundle);
  writer.writeLong(offsets[14], object.startBundle1);
}

CutDetail _cutDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CutDetail();
  object.color = reader.readString(offsets[0]);
  object.cutNo = reader.readString(offsets[1]);
  object.cutNo1 = reader.readStringOrNull(offsets[2]);
  object.gen = reader.readLong(offsets[3]);
  object.id = id;
  object.idGen = reader.readLong(offsets[4]);
  object.opNo = reader.readLong(offsets[5]);
  object.opNo1 = reader.readLongOrNull(offsets[6]);
  object.poNo = reader.readString(offsets[7]);
  object.poNo1 = reader.readStringOrNull(offsets[8]);
  object.qty = reader.readLong(offsets[9]);
  object.qty1 = reader.readLongOrNull(offsets[10]);
  object.size = reader.readString(offsets[11]);
  object.size1 = reader.readStringOrNull(offsets[12]);
  object.startBundle = reader.readLong(offsets[13]);
  object.startBundle1 = reader.readLongOrNull(offsets[14]);
  return object;
}

P _cutDetailDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cutDetailGetId(CutDetail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cutDetailGetLinks(CutDetail object) {
  return [];
}

void _cutDetailAttach(IsarCollection<dynamic> col, Id id, CutDetail object) {
  object.id = id;
}

extension CutDetailQueryWhereSort
    on QueryBuilder<CutDetail, CutDetail, QWhere> {
  QueryBuilder<CutDetail, CutDetail, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterWhere> anyIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idGen'),
      );
    });
  }
}

extension CutDetailQueryWhere
    on QueryBuilder<CutDetail, CutDetail, QWhereClause> {
  QueryBuilder<CutDetail, CutDetail, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CutDetail, CutDetail, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterWhereClause> idBetween(
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

  QueryBuilder<CutDetail, CutDetail, QAfterWhereClause> idGenEqualTo(
      int idGen) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idGen',
        value: [idGen],
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterWhereClause> idGenNotEqualTo(
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

  QueryBuilder<CutDetail, CutDetail, QAfterWhereClause> idGenGreaterThan(
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

  QueryBuilder<CutDetail, CutDetail, QAfterWhereClause> idGenLessThan(
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

  QueryBuilder<CutDetail, CutDetail, QAfterWhereClause> idGenBetween(
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

extension CutDetailQueryFilter
    on QueryBuilder<CutDetail, CutDetail, QFilterCondition> {
  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> colorEqualTo(
    String value, {
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> colorGreaterThan(
    String value, {
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> colorLessThan(
    String value, {
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> colorBetween(
    String lower,
    String upper, {
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> colorStartsWith(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> colorEndsWith(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> colorContains(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> colorMatches(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> colorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> colorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNoEqualTo(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNoGreaterThan(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNoLessThan(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNoBetween(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNoStartsWith(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNoEndsWith(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNoContains(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNoMatches(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cutNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cutNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cutNo1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cutNo1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cutNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cutNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cutNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cutNo1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cutNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cutNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cutNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cutNo1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cutNo1',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> cutNo1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cutNo1',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> genEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gen',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> genGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gen',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> genLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gen',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> genBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> idGenEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idGen',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> idGenGreaterThan(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> idGenLessThan(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> idGenBetween(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> opNoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opNo',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> opNoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opNo',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> opNoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opNo',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> opNoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> opNo1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'opNo1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> opNo1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'opNo1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> opNo1EqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opNo1',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> opNo1GreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opNo1',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> opNo1LessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opNo1',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> opNo1Between(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opNo1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNoEqualTo(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNoGreaterThan(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNoLessThan(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNoBetween(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNoStartsWith(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNoEndsWith(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNoContains(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNoMatches(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'poNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'poNo1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'poNo1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'poNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'poNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'poNo1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'poNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'poNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'poNo1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'poNo1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poNo1',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> poNo1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'poNo1',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> qtyEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> qtyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> qtyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> qtyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> qty1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qty1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> qty1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qty1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> qty1EqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty1',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> qty1GreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty1',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> qty1LessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty1',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> qty1Between(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> sizeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> sizeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> sizeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> sizeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'size',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> sizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> sizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> sizeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> sizeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'size',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> sizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> sizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'size',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'size1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'size1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'size1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'size1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'size1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'size1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'size1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'size1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'size1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size1',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> size1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'size1',
        value: '',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> startBundleEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startBundle',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition>
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> startBundleLessThan(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> startBundleBetween(
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

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition>
      startBundle1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startBundle1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition>
      startBundle1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startBundle1',
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> startBundle1EqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startBundle1',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition>
      startBundle1GreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startBundle1',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition>
      startBundle1LessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startBundle1',
        value: value,
      ));
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterFilterCondition> startBundle1Between(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startBundle1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CutDetailQueryObject
    on QueryBuilder<CutDetail, CutDetail, QFilterCondition> {}

extension CutDetailQueryLinks
    on QueryBuilder<CutDetail, CutDetail, QFilterCondition> {}

extension CutDetailQuerySortBy on QueryBuilder<CutDetail, CutDetail, QSortBy> {
  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByCutNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByCutNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByCutNo1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByCutNo1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo1', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gen', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByGenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gen', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByIdGenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByOpNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opNo', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByOpNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opNo', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByOpNo1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opNo1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByOpNo1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opNo1', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByPoNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByPoNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByPoNo1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByPoNo1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo1', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByQty1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByQty1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty1', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortBySize1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortBySize1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size1', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByStartBundle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByStartBundleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByStartBundle1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> sortByStartBundle1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle1', Sort.desc);
    });
  }
}

extension CutDetailQuerySortThenBy
    on QueryBuilder<CutDetail, CutDetail, QSortThenBy> {
  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByCutNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByCutNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByCutNo1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByCutNo1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cutNo1', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gen', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByGenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gen', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByIdGenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByOpNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opNo', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByOpNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opNo', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByOpNo1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opNo1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByOpNo1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opNo1', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByPoNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByPoNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByPoNo1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByPoNo1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo1', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByQty1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByQty1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty1', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenBySize1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenBySize1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size1', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByStartBundle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByStartBundleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle', Sort.desc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByStartBundle1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle1', Sort.asc);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QAfterSortBy> thenByStartBundle1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBundle1', Sort.desc);
    });
  }
}

extension CutDetailQueryWhereDistinct
    on QueryBuilder<CutDetail, CutDetail, QDistinct> {
  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByCutNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cutNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByCutNo1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cutNo1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gen');
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idGen');
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByOpNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opNo');
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByOpNo1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opNo1');
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByPoNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'poNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByPoNo1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'poNo1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty');
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByQty1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty1');
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctBySize(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'size', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctBySize1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'size1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByStartBundle() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startBundle');
    });
  }

  QueryBuilder<CutDetail, CutDetail, QDistinct> distinctByStartBundle1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startBundle1');
    });
  }
}

extension CutDetailQueryProperty
    on QueryBuilder<CutDetail, CutDetail, QQueryProperty> {
  QueryBuilder<CutDetail, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CutDetail, String, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<CutDetail, String, QQueryOperations> cutNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cutNo');
    });
  }

  QueryBuilder<CutDetail, String?, QQueryOperations> cutNo1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cutNo1');
    });
  }

  QueryBuilder<CutDetail, int, QQueryOperations> genProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gen');
    });
  }

  QueryBuilder<CutDetail, int, QQueryOperations> idGenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idGen');
    });
  }

  QueryBuilder<CutDetail, int, QQueryOperations> opNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opNo');
    });
  }

  QueryBuilder<CutDetail, int?, QQueryOperations> opNo1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opNo1');
    });
  }

  QueryBuilder<CutDetail, String, QQueryOperations> poNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'poNo');
    });
  }

  QueryBuilder<CutDetail, String?, QQueryOperations> poNo1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'poNo1');
    });
  }

  QueryBuilder<CutDetail, int, QQueryOperations> qtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty');
    });
  }

  QueryBuilder<CutDetail, int?, QQueryOperations> qty1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty1');
    });
  }

  QueryBuilder<CutDetail, String, QQueryOperations> sizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'size');
    });
  }

  QueryBuilder<CutDetail, String?, QQueryOperations> size1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'size1');
    });
  }

  QueryBuilder<CutDetail, int, QQueryOperations> startBundleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startBundle');
    });
  }

  QueryBuilder<CutDetail, int?, QQueryOperations> startBundle1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startBundle1');
    });
  }
}
