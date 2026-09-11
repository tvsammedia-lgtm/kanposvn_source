// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_declaration_line.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaxDeclarationLineCollection on Isar {
  IsarCollection<TaxDeclarationLine> get taxDeclarationLines =>
      this.collection();
}

const TaxDeclarationLineSchema = CollectionSchema(
  name: r'TaxDeclarationLine',
  id: 8757132808669636540,
  properties: {
    r'declarationId': PropertySchema(
      id: 0,
      name: r'declarationId',
      type: IsarType.string,
    ),
    r'industryCode': PropertySchema(
      id: 1,
      name: r'industryCode',
      type: IsarType.string,
    ),
    r'industryName': PropertySchema(
      id: 2,
      name: r'industryName',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 3,
      name: r'notes',
      type: IsarType.string,
    ),
    r'pitAmount': PropertySchema(
      id: 4,
      name: r'pitAmount',
      type: IsarType.double,
    ),
    r'pitRate': PropertySchema(
      id: 5,
      name: r'pitRate',
      type: IsarType.double,
    ),
    r'revenueAmount': PropertySchema(
      id: 6,
      name: r'revenueAmount',
      type: IsarType.double,
    ),
    r'vatAmount': PropertySchema(
      id: 7,
      name: r'vatAmount',
      type: IsarType.double,
    ),
    r'vatRate': PropertySchema(
      id: 8,
      name: r'vatRate',
      type: IsarType.double,
    )
  },
  estimateSize: _taxDeclarationLineEstimateSize,
  serialize: _taxDeclarationLineSerialize,
  deserialize: _taxDeclarationLineDeserialize,
  deserializeProp: _taxDeclarationLineDeserializeProp,
  idName: r'id',
  indexes: {
    r'declarationId': IndexSchema(
      id: -3313496450921337492,
      name: r'declarationId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'declarationId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _taxDeclarationLineGetId,
  getLinks: _taxDeclarationLineGetLinks,
  attach: _taxDeclarationLineAttach,
  version: '3.1.0+1',
);

int _taxDeclarationLineEstimateSize(
  TaxDeclarationLine object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.declarationId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.industryCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.industryName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _taxDeclarationLineSerialize(
  TaxDeclarationLine object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.declarationId);
  writer.writeString(offsets[1], object.industryCode);
  writer.writeString(offsets[2], object.industryName);
  writer.writeString(offsets[3], object.notes);
  writer.writeDouble(offsets[4], object.pitAmount);
  writer.writeDouble(offsets[5], object.pitRate);
  writer.writeDouble(offsets[6], object.revenueAmount);
  writer.writeDouble(offsets[7], object.vatAmount);
  writer.writeDouble(offsets[8], object.vatRate);
}

TaxDeclarationLine _taxDeclarationLineDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaxDeclarationLine();
  object.declarationId = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.industryCode = reader.readStringOrNull(offsets[1]);
  object.industryName = reader.readStringOrNull(offsets[2]);
  object.notes = reader.readStringOrNull(offsets[3]);
  object.pitAmount = reader.readDoubleOrNull(offsets[4]);
  object.pitRate = reader.readDoubleOrNull(offsets[5]);
  object.revenueAmount = reader.readDoubleOrNull(offsets[6]);
  object.vatAmount = reader.readDoubleOrNull(offsets[7]);
  object.vatRate = reader.readDoubleOrNull(offsets[8]);
  return object;
}

P _taxDeclarationLineDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taxDeclarationLineGetId(TaxDeclarationLine object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taxDeclarationLineGetLinks(
    TaxDeclarationLine object) {
  return [];
}

void _taxDeclarationLineAttach(
    IsarCollection<dynamic> col, Id id, TaxDeclarationLine object) {
  object.id = id;
}

extension TaxDeclarationLineQueryWhereSort
    on QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QWhere> {
  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaxDeclarationLineQueryWhere
    on QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QWhereClause> {
  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterWhereClause>
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

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterWhereClause>
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

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterWhereClause>
      declarationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'declarationId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterWhereClause>
      declarationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'declarationId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterWhereClause>
      declarationIdEqualTo(String? declarationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'declarationId',
        value: [declarationId],
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterWhereClause>
      declarationIdNotEqualTo(String? declarationId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'declarationId',
              lower: [],
              upper: [declarationId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'declarationId',
              lower: [declarationId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'declarationId',
              lower: [declarationId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'declarationId',
              lower: [],
              upper: [declarationId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TaxDeclarationLineQueryFilter
    on QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QFilterCondition> {
  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'declarationId',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'declarationId',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'declarationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'declarationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'declarationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'declarationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'declarationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'declarationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'declarationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'declarationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'declarationId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      declarationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'declarationId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'industryCode',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'industryCode',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'industryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'industryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'industryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'industryCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'industryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'industryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'industryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'industryCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'industryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'industryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'industryName',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'industryName',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'industryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'industryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'industryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'industryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'industryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'industryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'industryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'industryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'industryName',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      industryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'industryName',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
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

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
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

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      notesLessThan(
    String? value, {
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

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pitAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pitAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pitAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pitAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pitAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pitAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pitRate',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pitRate',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pitRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pitRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pitRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      pitRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pitRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      revenueAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revenueAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      revenueAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revenueAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      revenueAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      revenueAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenueAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      revenueAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenueAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      revenueAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenueAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vatAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vatAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vatAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vatAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vatAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vatAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vatRate',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vatRate',
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vatRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vatRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vatRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterFilterCondition>
      vatRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vatRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension TaxDeclarationLineQueryObject
    on QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QFilterCondition> {}

extension TaxDeclarationLineQueryLinks
    on QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QFilterCondition> {}

extension TaxDeclarationLineQuerySortBy
    on QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QSortBy> {
  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByDeclarationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declarationId', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByDeclarationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declarationId', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByIndustryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryCode', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByIndustryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryCode', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByIndustryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryName', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByIndustryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryName', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByPitAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByPitAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByPitRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitRate', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByPitRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitRate', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByRevenueAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByVatAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByVatRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatRate', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      sortByVatRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatRate', Sort.desc);
    });
  }
}

extension TaxDeclarationLineQuerySortThenBy
    on QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QSortThenBy> {
  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByDeclarationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declarationId', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByDeclarationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declarationId', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByIndustryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryCode', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByIndustryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryCode', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByIndustryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryName', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByIndustryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryName', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByPitAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByPitAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByPitRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitRate', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByPitRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitRate', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByRevenueAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByVatAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByVatRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatRate', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QAfterSortBy>
      thenByVatRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatRate', Sort.desc);
    });
  }
}

extension TaxDeclarationLineQueryWhereDistinct
    on QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QDistinct> {
  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QDistinct>
      distinctByDeclarationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'declarationId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QDistinct>
      distinctByIndustryCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'industryCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QDistinct>
      distinctByIndustryName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'industryName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QDistinct>
      distinctByPitAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pitAmount');
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QDistinct>
      distinctByPitRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pitRate');
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QDistinct>
      distinctByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueAmount');
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QDistinct>
      distinctByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vatAmount');
    });
  }

  QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QDistinct>
      distinctByVatRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vatRate');
    });
  }
}

extension TaxDeclarationLineQueryProperty
    on QueryBuilder<TaxDeclarationLine, TaxDeclarationLine, QQueryProperty> {
  QueryBuilder<TaxDeclarationLine, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaxDeclarationLine, String?, QQueryOperations>
      declarationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'declarationId');
    });
  }

  QueryBuilder<TaxDeclarationLine, String?, QQueryOperations>
      industryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'industryCode');
    });
  }

  QueryBuilder<TaxDeclarationLine, String?, QQueryOperations>
      industryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'industryName');
    });
  }

  QueryBuilder<TaxDeclarationLine, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<TaxDeclarationLine, double?, QQueryOperations>
      pitAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pitAmount');
    });
  }

  QueryBuilder<TaxDeclarationLine, double?, QQueryOperations>
      pitRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pitRate');
    });
  }

  QueryBuilder<TaxDeclarationLine, double?, QQueryOperations>
      revenueAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueAmount');
    });
  }

  QueryBuilder<TaxDeclarationLine, double?, QQueryOperations>
      vatAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vatAmount');
    });
  }

  QueryBuilder<TaxDeclarationLine, double?, QQueryOperations>
      vatRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vatRate');
    });
  }
}
