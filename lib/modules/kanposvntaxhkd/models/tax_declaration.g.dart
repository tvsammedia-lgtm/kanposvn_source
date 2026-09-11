// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_declaration.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaxDeclarationCollection on Isar {
  IsarCollection<TaxDeclaration> get taxDeclarations => this.collection();
}

const TaxDeclarationSchema = CollectionSchema(
  name: r'TaxDeclaration',
  id: -3861731249061268664,
  properties: {
    r'acceptedAt': PropertySchema(
      id: 0,
      name: r'acceptedAt',
      type: IsarType.dateTime,
    ),
    r'approvedBy': PropertySchema(
      id: 1,
      name: r'approvedBy',
      type: IsarType.string,
    ),
    r'attachmentIds': PropertySchema(
      id: 2,
      name: r'attachmentIds',
      type: IsarType.stringList,
    ),
    r'businessId': PropertySchema(
      id: 3,
      name: r'businessId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'createdBy': PropertySchema(
      id: 5,
      name: r'createdBy',
      type: IsarType.string,
    ),
    r'dataHash': PropertySchema(
      id: 6,
      name: r'dataHash',
      type: IsarType.string,
    ),
    r'expenseAmount': PropertySchema(
      id: 7,
      name: r'expenseAmount',
      type: IsarType.double,
    ),
    r'formCode': PropertySchema(
      id: 8,
      name: r'formCode',
      type: IsarType.string,
    ),
    r'formVersion': PropertySchema(
      id: 9,
      name: r'formVersion',
      type: IsarType.string,
    ),
    r'methodCode': PropertySchema(
      id: 10,
      name: r'methodCode',
      type: IsarType.string,
    ),
    r'otherTaxAmount': PropertySchema(
      id: 11,
      name: r'otherTaxAmount',
      type: IsarType.double,
    ),
    r'pitAmount': PropertySchema(
      id: 12,
      name: r'pitAmount',
      type: IsarType.double,
    ),
    r'receiptNumber': PropertySchema(
      id: 13,
      name: r'receiptNumber',
      type: IsarType.string,
    ),
    r'revenueAmount': PropertySchema(
      id: 14,
      name: r'revenueAmount',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 15,
      name: r'status',
      type: IsarType.string,
    ),
    r'submittedAt': PropertySchema(
      id: 16,
      name: r'submittedAt',
      type: IsarType.dateTime,
    ),
    r'taxPeriod': PropertySchema(
      id: 17,
      name: r'taxPeriod',
      type: IsarType.string,
    ),
    r'taxType': PropertySchema(
      id: 18,
      name: r'taxType',
      type: IsarType.string,
    ),
    r'taxYear': PropertySchema(
      id: 19,
      name: r'taxYear',
      type: IsarType.string,
    ),
    r'taxableIncome': PropertySchema(
      id: 20,
      name: r'taxableIncome',
      type: IsarType.double,
    ),
    r'tenantId': PropertySchema(
      id: 21,
      name: r'tenantId',
      type: IsarType.string,
    ),
    r'totalPayable': PropertySchema(
      id: 22,
      name: r'totalPayable',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 23,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vatAmount': PropertySchema(
      id: 24,
      name: r'vatAmount',
      type: IsarType.double,
    )
  },
  estimateSize: _taxDeclarationEstimateSize,
  serialize: _taxDeclarationSerialize,
  deserialize: _taxDeclarationDeserialize,
  deserializeProp: _taxDeclarationDeserializeProp,
  idName: r'id',
  indexes: {
    r'tenantId': IndexSchema(
      id: -1042425927805315167,
      name: r'tenantId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tenantId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _taxDeclarationGetId,
  getLinks: _taxDeclarationGetLinks,
  attach: _taxDeclarationAttach,
  version: '3.1.0+1',
);

int _taxDeclarationEstimateSize(
  TaxDeclaration object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.approvedBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.attachmentIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.businessId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createdBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dataHash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.formCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.formVersion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.methodCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.receiptNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taxPeriod;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taxType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taxYear;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tenantId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _taxDeclarationSerialize(
  TaxDeclaration object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.acceptedAt);
  writer.writeString(offsets[1], object.approvedBy);
  writer.writeStringList(offsets[2], object.attachmentIds);
  writer.writeString(offsets[3], object.businessId);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.createdBy);
  writer.writeString(offsets[6], object.dataHash);
  writer.writeDouble(offsets[7], object.expenseAmount);
  writer.writeString(offsets[8], object.formCode);
  writer.writeString(offsets[9], object.formVersion);
  writer.writeString(offsets[10], object.methodCode);
  writer.writeDouble(offsets[11], object.otherTaxAmount);
  writer.writeDouble(offsets[12], object.pitAmount);
  writer.writeString(offsets[13], object.receiptNumber);
  writer.writeDouble(offsets[14], object.revenueAmount);
  writer.writeString(offsets[15], object.status);
  writer.writeDateTime(offsets[16], object.submittedAt);
  writer.writeString(offsets[17], object.taxPeriod);
  writer.writeString(offsets[18], object.taxType);
  writer.writeString(offsets[19], object.taxYear);
  writer.writeDouble(offsets[20], object.taxableIncome);
  writer.writeString(offsets[21], object.tenantId);
  writer.writeDouble(offsets[22], object.totalPayable);
  writer.writeDateTime(offsets[23], object.updatedAt);
  writer.writeDouble(offsets[24], object.vatAmount);
}

TaxDeclaration _taxDeclarationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaxDeclaration();
  object.acceptedAt = reader.readDateTimeOrNull(offsets[0]);
  object.approvedBy = reader.readStringOrNull(offsets[1]);
  object.attachmentIds = reader.readStringList(offsets[2]);
  object.businessId = reader.readStringOrNull(offsets[3]);
  object.createdAt = reader.readDateTimeOrNull(offsets[4]);
  object.createdBy = reader.readStringOrNull(offsets[5]);
  object.dataHash = reader.readStringOrNull(offsets[6]);
  object.expenseAmount = reader.readDoubleOrNull(offsets[7]);
  object.formCode = reader.readStringOrNull(offsets[8]);
  object.formVersion = reader.readStringOrNull(offsets[9]);
  object.id = id;
  object.methodCode = reader.readStringOrNull(offsets[10]);
  object.otherTaxAmount = reader.readDoubleOrNull(offsets[11]);
  object.pitAmount = reader.readDoubleOrNull(offsets[12]);
  object.receiptNumber = reader.readStringOrNull(offsets[13]);
  object.revenueAmount = reader.readDoubleOrNull(offsets[14]);
  object.status = reader.readStringOrNull(offsets[15]);
  object.submittedAt = reader.readDateTimeOrNull(offsets[16]);
  object.taxPeriod = reader.readStringOrNull(offsets[17]);
  object.taxType = reader.readStringOrNull(offsets[18]);
  object.taxYear = reader.readStringOrNull(offsets[19]);
  object.taxableIncome = reader.readDoubleOrNull(offsets[20]);
  object.tenantId = reader.readStringOrNull(offsets[21]);
  object.totalPayable = reader.readDoubleOrNull(offsets[22]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[23]);
  object.vatAmount = reader.readDoubleOrNull(offsets[24]);
  return object;
}

P _taxDeclarationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringList(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readDoubleOrNull(offset)) as P;
    case 23:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 24:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taxDeclarationGetId(TaxDeclaration object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taxDeclarationGetLinks(TaxDeclaration object) {
  return [];
}

void _taxDeclarationAttach(
    IsarCollection<dynamic> col, Id id, TaxDeclaration object) {
  object.id = id;
}

extension TaxDeclarationQueryWhereSort
    on QueryBuilder<TaxDeclaration, TaxDeclaration, QWhere> {
  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaxDeclarationQueryWhere
    on QueryBuilder<TaxDeclaration, TaxDeclaration, QWhereClause> {
  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterWhereClause> idBetween(
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterWhereClause>
      tenantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tenantId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterWhereClause>
      tenantIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tenantId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterWhereClause>
      tenantIdEqualTo(String? tenantId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tenantId',
        value: [tenantId],
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterWhereClause>
      tenantIdNotEqualTo(String? tenantId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tenantId',
              lower: [],
              upper: [tenantId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tenantId',
              lower: [tenantId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tenantId',
              lower: [tenantId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tenantId',
              lower: [],
              upper: [tenantId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TaxDeclarationQueryFilter
    on QueryBuilder<TaxDeclaration, TaxDeclaration, QFilterCondition> {
  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      acceptedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'acceptedAt',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      acceptedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'acceptedAt',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      acceptedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'acceptedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      acceptedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'acceptedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      acceptedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'acceptedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      acceptedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'acceptedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approvedBy',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approvedBy',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'approvedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'approvedBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      approvedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'approvedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentIds',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentIds',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachmentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachmentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachmentIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attachmentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attachmentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentIds',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentIds',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachmentIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachmentIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachmentIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachmentIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachmentIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      attachmentIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachmentIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'businessId',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'businessId',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'businessId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'businessId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'businessId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'businessId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'businessId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'businessId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'businessId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      businessIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'businessId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdBy',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdBy',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByEqualTo(
    String? value, {
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByGreaterThan(
    String? value, {
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByLessThan(
    String? value, {
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByStartsWith(
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByEndsWith(
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      createdByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dataHash',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dataHash',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dataHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dataHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dataHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataHash',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      dataHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataHash',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      expenseAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      expenseAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      expenseAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      expenseAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      expenseAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      expenseAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'formCode',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'formCode',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'formVersion',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'formVersion',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formVersion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      formVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'methodCode',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'methodCode',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'methodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'methodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'methodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'methodCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'methodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'methodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'methodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'methodCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'methodCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      methodCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'methodCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      otherTaxAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'otherTaxAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      otherTaxAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'otherTaxAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      otherTaxAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      otherTaxAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'otherTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      otherTaxAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'otherTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      otherTaxAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'otherTaxAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      pitAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pitAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      pitAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pitAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'receiptNumber',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'receiptNumber',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiptNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiptNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiptNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      receiptNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiptNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      revenueAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revenueAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      revenueAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revenueAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusEqualTo(
    String? value, {
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusGreaterThan(
    String? value, {
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusLessThan(
    String? value, {
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusStartsWith(
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusEndsWith(
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      submittedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'submittedAt',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      submittedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'submittedAt',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      submittedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submittedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      submittedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'submittedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      submittedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'submittedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      submittedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'submittedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxPeriod',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxPeriod',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxPeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxPeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxPeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxPeriod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxPeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxPeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxPeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxPeriod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxPeriod',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxPeriodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxPeriod',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxType',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxType',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxYear',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxYear',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxYear',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxYear',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxYearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxYear',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxableIncomeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxableIncome',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxableIncomeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxableIncome',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxableIncomeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxableIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxableIncomeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxableIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxableIncomeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxableIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      taxableIncomeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxableIncome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tenantId',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tenantId',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tenantId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tenantId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenantId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      tenantIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tenantId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      totalPayableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPayable',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      totalPayableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPayable',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      totalPayableEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPayable',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      totalPayableGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPayable',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      totalPayableLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPayable',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      totalPayableBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPayable',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      vatAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vatAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
      vatAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vatAmount',
      ));
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterFilterCondition>
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
}

extension TaxDeclarationQueryObject
    on QueryBuilder<TaxDeclaration, TaxDeclaration, QFilterCondition> {}

extension TaxDeclarationQueryLinks
    on QueryBuilder<TaxDeclaration, TaxDeclaration, QFilterCondition> {}

extension TaxDeclarationQuerySortBy
    on QueryBuilder<TaxDeclaration, TaxDeclaration, QSortBy> {
  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByAcceptedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByAcceptedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByApprovedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByApprovedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByDataHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHash', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByDataHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHash', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByExpenseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByExpenseAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByFormCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formCode', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByFormCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formCode', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByFormVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formVersion', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByFormVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formVersion', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByMethodCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodCode', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByMethodCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodCode', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByOtherTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherTaxAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByOtherTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherTaxAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByPitAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByPitAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByReceiptNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByReceiptNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByRevenueAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortBySubmittedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByTaxPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPeriod', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByTaxPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPeriod', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByTaxType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxType', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByTaxTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxType', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByTaxYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxYear', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByTaxYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxYear', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByTaxableIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxableIncome', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByTaxableIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxableIncome', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByTotalPayable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPayable', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByTotalPayableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPayable', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> sortByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      sortByVatAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.desc);
    });
  }
}

extension TaxDeclarationQuerySortThenBy
    on QueryBuilder<TaxDeclaration, TaxDeclaration, QSortThenBy> {
  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByAcceptedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByAcceptedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByApprovedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByApprovedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByDataHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHash', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByDataHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHash', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByExpenseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByExpenseAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByFormCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formCode', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByFormCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formCode', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByFormVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formVersion', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByFormVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formVersion', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByMethodCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodCode', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByMethodCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodCode', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByOtherTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherTaxAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByOtherTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherTaxAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByPitAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByPitAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByReceiptNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByReceiptNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByRevenueAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenBySubmittedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByTaxPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPeriod', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByTaxPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPeriod', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByTaxType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxType', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByTaxTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxType', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByTaxYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxYear', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByTaxYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxYear', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByTaxableIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxableIncome', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByTaxableIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxableIncome', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByTotalPayable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPayable', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByTotalPayableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPayable', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy> thenByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QAfterSortBy>
      thenByVatAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.desc);
    });
  }
}

extension TaxDeclarationQueryWhereDistinct
    on QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> {
  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByAcceptedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'acceptedAt');
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByApprovedBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approvedBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByAttachmentIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentIds');
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByBusinessId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByCreatedBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByDataHash(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByExpenseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenseAmount');
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByFormCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByFormVersion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formVersion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByMethodCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'methodCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByOtherTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherTaxAmount');
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByPitAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pitAmount');
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByReceiptNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiptNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueAmount');
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submittedAt');
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByTaxPeriod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxPeriod', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByTaxType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByTaxYear(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxYear', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByTaxableIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxableIncome');
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct> distinctByTenantId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tenantId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByTotalPayable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPayable');
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TaxDeclaration, TaxDeclaration, QDistinct>
      distinctByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vatAmount');
    });
  }
}

extension TaxDeclarationQueryProperty
    on QueryBuilder<TaxDeclaration, TaxDeclaration, QQueryProperty> {
  QueryBuilder<TaxDeclaration, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaxDeclaration, DateTime?, QQueryOperations>
      acceptedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'acceptedAt');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations> approvedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approvedBy');
    });
  }

  QueryBuilder<TaxDeclaration, List<String>?, QQueryOperations>
      attachmentIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentIds');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations> businessIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessId');
    });
  }

  QueryBuilder<TaxDeclaration, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations> createdByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdBy');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations> dataHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataHash');
    });
  }

  QueryBuilder<TaxDeclaration, double?, QQueryOperations>
      expenseAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenseAmount');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations> formCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formCode');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations>
      formVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formVersion');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations> methodCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'methodCode');
    });
  }

  QueryBuilder<TaxDeclaration, double?, QQueryOperations>
      otherTaxAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherTaxAmount');
    });
  }

  QueryBuilder<TaxDeclaration, double?, QQueryOperations> pitAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pitAmount');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations>
      receiptNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiptNumber');
    });
  }

  QueryBuilder<TaxDeclaration, double?, QQueryOperations>
      revenueAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueAmount');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TaxDeclaration, DateTime?, QQueryOperations>
      submittedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submittedAt');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations> taxPeriodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxPeriod');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations> taxTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxType');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations> taxYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxYear');
    });
  }

  QueryBuilder<TaxDeclaration, double?, QQueryOperations>
      taxableIncomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxableIncome');
    });
  }

  QueryBuilder<TaxDeclaration, String?, QQueryOperations> tenantIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tenantId');
    });
  }

  QueryBuilder<TaxDeclaration, double?, QQueryOperations>
      totalPayableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPayable');
    });
  }

  QueryBuilder<TaxDeclaration, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TaxDeclaration, double?, QQueryOperations> vatAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vatAmount');
    });
  }
}
