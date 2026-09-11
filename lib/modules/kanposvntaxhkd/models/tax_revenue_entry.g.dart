// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_revenue_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaxRevenueEntryCollection on Isar {
  IsarCollection<TaxRevenueEntry> get taxRevenueEntrys => this.collection();
}

const TaxRevenueEntrySchema = CollectionSchema(
  name: r'TaxRevenueEntry',
  id: 2111811440732364975,
  properties: {
    r'adjustmentAmount': PropertySchema(
      id: 0,
      name: r'adjustmentAmount',
      type: IsarType.double,
    ),
    r'branchId': PropertySchema(
      id: 1,
      name: r'branchId',
      type: IsarType.string,
    ),
    r'businessId': PropertySchema(
      id: 2,
      name: r'businessId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerId': PropertySchema(
      id: 4,
      name: r'customerId',
      type: IsarType.string,
    ),
    r'deletedAt': PropertySchema(
      id: 5,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'discountAmount': PropertySchema(
      id: 6,
      name: r'discountAmount',
      type: IsarType.double,
    ),
    r'documentDate': PropertySchema(
      id: 7,
      name: r'documentDate',
      type: IsarType.dateTime,
    ),
    r'documentId': PropertySchema(
      id: 8,
      name: r'documentId',
      type: IsarType.string,
    ),
    r'documentType': PropertySchema(
      id: 9,
      name: r'documentType',
      type: IsarType.string,
    ),
    r'fiscalYear': PropertySchema(
      id: 10,
      name: r'fiscalYear',
      type: IsarType.long,
    ),
    r'grossRevenue': PropertySchema(
      id: 11,
      name: r'grossRevenue',
      type: IsarType.double,
    ),
    r'industryCode': PropertySchema(
      id: 12,
      name: r'industryCode',
      type: IsarType.string,
    ),
    r'invoiceNumber': PropertySchema(
      id: 13,
      name: r'invoiceNumber',
      type: IsarType.string,
    ),
    r'nonTaxableRevenue': PropertySchema(
      id: 14,
      name: r'nonTaxableRevenue',
      type: IsarType.double,
    ),
    r'paymentStatus': PropertySchema(
      id: 15,
      name: r'paymentStatus',
      type: IsarType.string,
    ),
    r'pitTaxableRevenue': PropertySchema(
      id: 16,
      name: r'pitTaxableRevenue',
      type: IsarType.double,
    ),
    r'returnAmount': PropertySchema(
      id: 17,
      name: r'returnAmount',
      type: IsarType.double,
    ),
    r'salesChannel': PropertySchema(
      id: 18,
      name: r'salesChannel',
      type: IsarType.string,
    ),
    r'serverVersion': PropertySchema(
      id: 19,
      name: r'serverVersion',
      type: IsarType.long,
    ),
    r'syncStatus': PropertySchema(
      id: 20,
      name: r'syncStatus',
      type: IsarType.string,
    ),
    r'taxPeriod': PropertySchema(
      id: 21,
      name: r'taxPeriod',
      type: IsarType.string,
    ),
    r'taxableRevenue': PropertySchema(
      id: 22,
      name: r'taxableRevenue',
      type: IsarType.double,
    ),
    r'tenantId': PropertySchema(
      id: 23,
      name: r'tenantId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 24,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vatTaxableRevenue': PropertySchema(
      id: 25,
      name: r'vatTaxableRevenue',
      type: IsarType.double,
    )
  },
  estimateSize: _taxRevenueEntryEstimateSize,
  serialize: _taxRevenueEntrySerialize,
  deserialize: _taxRevenueEntryDeserialize,
  deserializeProp: _taxRevenueEntryDeserializeProp,
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
  getId: _taxRevenueEntryGetId,
  getLinks: _taxRevenueEntryGetLinks,
  attach: _taxRevenueEntryAttach,
  version: '3.1.0+1',
);

int _taxRevenueEntryEstimateSize(
  TaxRevenueEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.branchId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.businessId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.documentId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.documentType;
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
    final value = object.invoiceNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.paymentStatus;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.salesChannel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.syncStatus;
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
    final value = object.tenantId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _taxRevenueEntrySerialize(
  TaxRevenueEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.adjustmentAmount);
  writer.writeString(offsets[1], object.branchId);
  writer.writeString(offsets[2], object.businessId);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.customerId);
  writer.writeDateTime(offsets[5], object.deletedAt);
  writer.writeDouble(offsets[6], object.discountAmount);
  writer.writeDateTime(offsets[7], object.documentDate);
  writer.writeString(offsets[8], object.documentId);
  writer.writeString(offsets[9], object.documentType);
  writer.writeLong(offsets[10], object.fiscalYear);
  writer.writeDouble(offsets[11], object.grossRevenue);
  writer.writeString(offsets[12], object.industryCode);
  writer.writeString(offsets[13], object.invoiceNumber);
  writer.writeDouble(offsets[14], object.nonTaxableRevenue);
  writer.writeString(offsets[15], object.paymentStatus);
  writer.writeDouble(offsets[16], object.pitTaxableRevenue);
  writer.writeDouble(offsets[17], object.returnAmount);
  writer.writeString(offsets[18], object.salesChannel);
  writer.writeLong(offsets[19], object.serverVersion);
  writer.writeString(offsets[20], object.syncStatus);
  writer.writeString(offsets[21], object.taxPeriod);
  writer.writeDouble(offsets[22], object.taxableRevenue);
  writer.writeString(offsets[23], object.tenantId);
  writer.writeDateTime(offsets[24], object.updatedAt);
  writer.writeDouble(offsets[25], object.vatTaxableRevenue);
}

TaxRevenueEntry _taxRevenueEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaxRevenueEntry();
  object.adjustmentAmount = reader.readDoubleOrNull(offsets[0]);
  object.branchId = reader.readStringOrNull(offsets[1]);
  object.businessId = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTimeOrNull(offsets[3]);
  object.customerId = reader.readStringOrNull(offsets[4]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[5]);
  object.discountAmount = reader.readDoubleOrNull(offsets[6]);
  object.documentDate = reader.readDateTimeOrNull(offsets[7]);
  object.documentId = reader.readStringOrNull(offsets[8]);
  object.documentType = reader.readStringOrNull(offsets[9]);
  object.fiscalYear = reader.readLongOrNull(offsets[10]);
  object.grossRevenue = reader.readDoubleOrNull(offsets[11]);
  object.id = id;
  object.industryCode = reader.readStringOrNull(offsets[12]);
  object.invoiceNumber = reader.readStringOrNull(offsets[13]);
  object.nonTaxableRevenue = reader.readDoubleOrNull(offsets[14]);
  object.paymentStatus = reader.readStringOrNull(offsets[15]);
  object.pitTaxableRevenue = reader.readDoubleOrNull(offsets[16]);
  object.returnAmount = reader.readDoubleOrNull(offsets[17]);
  object.salesChannel = reader.readStringOrNull(offsets[18]);
  object.serverVersion = reader.readLongOrNull(offsets[19]);
  object.syncStatus = reader.readStringOrNull(offsets[20]);
  object.taxPeriod = reader.readStringOrNull(offsets[21]);
  object.taxableRevenue = reader.readDoubleOrNull(offsets[22]);
  object.tenantId = reader.readStringOrNull(offsets[23]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[24]);
  object.vatTaxableRevenue = reader.readDoubleOrNull(offsets[25]);
  return object;
}

P _taxRevenueEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readDoubleOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 25:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taxRevenueEntryGetId(TaxRevenueEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taxRevenueEntryGetLinks(TaxRevenueEntry object) {
  return [];
}

void _taxRevenueEntryAttach(
    IsarCollection<dynamic> col, Id id, TaxRevenueEntry object) {
  object.id = id;
}

extension TaxRevenueEntryQueryWhereSort
    on QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QWhere> {
  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaxRevenueEntryQueryWhere
    on QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QWhereClause> {
  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterWhereClause>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterWhereClause> idBetween(
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterWhereClause>
      tenantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tenantId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterWhereClause>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterWhereClause>
      tenantIdEqualTo(String? tenantId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tenantId',
        value: [tenantId],
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterWhereClause>
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

extension TaxRevenueEntryQueryFilter
    on QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QFilterCondition> {
  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      adjustmentAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'adjustmentAmount',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      adjustmentAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'adjustmentAmount',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      adjustmentAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustmentAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      adjustmentAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adjustmentAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      adjustmentAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adjustmentAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      adjustmentAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adjustmentAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'branchId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'branchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      branchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      businessIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'businessId',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      businessIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'businessId',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      businessIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'businessId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      businessIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'businessId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      businessIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      businessIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'businessId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerId',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerId',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      customerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      discountAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountAmount',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      discountAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountAmount',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      discountAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      discountAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      discountAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      discountAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'documentDate',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'documentDate',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'documentId',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'documentId',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'documentType',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'documentType',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      documentTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      fiscalYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fiscalYear',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      fiscalYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fiscalYear',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      fiscalYearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiscalYear',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      fiscalYearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fiscalYear',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      fiscalYearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fiscalYear',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      fiscalYearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fiscalYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      grossRevenueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grossRevenue',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      grossRevenueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grossRevenue',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      grossRevenueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grossRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      grossRevenueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grossRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      grossRevenueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grossRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      grossRevenueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grossRevenue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      industryCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'industryCode',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      industryCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'industryCode',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      industryCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'industryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      industryCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'industryCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      industryCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'industryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      industryCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'industryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoiceNumber',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoiceNumber',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoiceNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      invoiceNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoiceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      nonTaxableRevenueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nonTaxableRevenue',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      nonTaxableRevenueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nonTaxableRevenue',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      nonTaxableRevenueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nonTaxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      nonTaxableRevenueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nonTaxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      nonTaxableRevenueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nonTaxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      nonTaxableRevenueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nonTaxableRevenue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentStatus',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentStatus',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      paymentStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      pitTaxableRevenueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pitTaxableRevenue',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      pitTaxableRevenueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pitTaxableRevenue',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      pitTaxableRevenueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pitTaxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      pitTaxableRevenueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pitTaxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      pitTaxableRevenueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pitTaxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      pitTaxableRevenueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pitTaxableRevenue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      returnAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'returnAmount',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      returnAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'returnAmount',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      returnAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      returnAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      returnAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      returnAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'salesChannel',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'salesChannel',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salesChannel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salesChannel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salesChannel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salesChannel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'salesChannel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'salesChannel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'salesChannel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'salesChannel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salesChannel',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      salesChannelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'salesChannel',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      serverVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverVersion',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      serverVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverVersion',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      serverVersionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      serverVersionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      serverVersionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      serverVersionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncStatus',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncStatus',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxPeriodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxPeriod',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxPeriodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxPeriod',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxPeriodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxPeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxPeriodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxPeriod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxPeriodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxPeriod',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxPeriodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxPeriod',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxableRevenueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxableRevenue',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxableRevenueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxableRevenue',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxableRevenueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxableRevenueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxableRevenueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      taxableRevenueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxableRevenue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      tenantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tenantId',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      tenantIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tenantId',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      tenantIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      tenantIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tenantId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      tenantIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenantId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      tenantIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tenantId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
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

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      vatTaxableRevenueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vatTaxableRevenue',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      vatTaxableRevenueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vatTaxableRevenue',
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      vatTaxableRevenueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vatTaxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      vatTaxableRevenueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vatTaxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      vatTaxableRevenueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vatTaxableRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterFilterCondition>
      vatTaxableRevenueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vatTaxableRevenue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension TaxRevenueEntryQueryObject
    on QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QFilterCondition> {}

extension TaxRevenueEntryQueryLinks
    on QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QFilterCondition> {}

extension TaxRevenueEntryQuerySortBy
    on QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QSortBy> {
  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByAdjustmentAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByAdjustmentAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByDocumentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentDate', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByDocumentDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentDate', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByDocumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByFiscalYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiscalYear', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByFiscalYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiscalYear', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByGrossRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossRevenue', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByGrossRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossRevenue', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByIndustryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryCode', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByIndustryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryCode', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByInvoiceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByInvoiceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByNonTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonTaxableRevenue', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByNonTaxableRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonTaxableRevenue', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByPaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByPaymentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByPitTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitTaxableRevenue', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByPitTaxableRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitTaxableRevenue', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByReturnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByReturnAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortBySalesChannel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesChannel', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortBySalesChannelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesChannel', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByServerVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverVersion', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByServerVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverVersion', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByTaxPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPeriod', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByTaxPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPeriod', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxableRevenue', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByTaxableRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxableRevenue', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByVatTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatTaxableRevenue', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      sortByVatTaxableRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatTaxableRevenue', Sort.desc);
    });
  }
}

extension TaxRevenueEntryQuerySortThenBy
    on QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QSortThenBy> {
  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByAdjustmentAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByAdjustmentAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByDocumentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentDate', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByDocumentDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentDate', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByDocumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByFiscalYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiscalYear', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByFiscalYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiscalYear', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByGrossRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossRevenue', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByGrossRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossRevenue', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByIndustryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryCode', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByIndustryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'industryCode', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByInvoiceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByInvoiceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByNonTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonTaxableRevenue', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByNonTaxableRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonTaxableRevenue', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByPaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByPaymentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByPitTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitTaxableRevenue', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByPitTaxableRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pitTaxableRevenue', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByReturnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByReturnAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenBySalesChannel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesChannel', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenBySalesChannelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesChannel', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByServerVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverVersion', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByServerVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverVersion', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByTaxPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPeriod', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByTaxPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPeriod', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxableRevenue', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByTaxableRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxableRevenue', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByVatTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatTaxableRevenue', Sort.asc);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QAfterSortBy>
      thenByVatTaxableRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatTaxableRevenue', Sort.desc);
    });
  }
}

extension TaxRevenueEntryQueryWhereDistinct
    on QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct> {
  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByAdjustmentAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adjustmentAmount');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct> distinctByBranchId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByBusinessId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByCustomerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountAmount');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByDocumentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentDate');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByDocumentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByDocumentType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByFiscalYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fiscalYear');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByGrossRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grossRevenue');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByIndustryCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'industryCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByInvoiceNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByNonTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nonTaxableRevenue');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByPaymentStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByPitTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pitTaxableRevenue');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByReturnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnAmount');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctBySalesChannel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salesChannel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByServerVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverVersion');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctBySyncStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct> distinctByTaxPeriod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxPeriod', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxableRevenue');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct> distinctByTenantId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tenantId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QDistinct>
      distinctByVatTaxableRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vatTaxableRevenue');
    });
  }
}

extension TaxRevenueEntryQueryProperty
    on QueryBuilder<TaxRevenueEntry, TaxRevenueEntry, QQueryProperty> {
  QueryBuilder<TaxRevenueEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaxRevenueEntry, double?, QQueryOperations>
      adjustmentAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adjustmentAmount');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations> branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations>
      businessIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessId');
    });
  }

  QueryBuilder<TaxRevenueEntry, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations>
      customerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerId');
    });
  }

  QueryBuilder<TaxRevenueEntry, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<TaxRevenueEntry, double?, QQueryOperations>
      discountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountAmount');
    });
  }

  QueryBuilder<TaxRevenueEntry, DateTime?, QQueryOperations>
      documentDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentDate');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations>
      documentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentId');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations>
      documentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentType');
    });
  }

  QueryBuilder<TaxRevenueEntry, int?, QQueryOperations> fiscalYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fiscalYear');
    });
  }

  QueryBuilder<TaxRevenueEntry, double?, QQueryOperations>
      grossRevenueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grossRevenue');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations>
      industryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'industryCode');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations>
      invoiceNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceNumber');
    });
  }

  QueryBuilder<TaxRevenueEntry, double?, QQueryOperations>
      nonTaxableRevenueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nonTaxableRevenue');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations>
      paymentStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentStatus');
    });
  }

  QueryBuilder<TaxRevenueEntry, double?, QQueryOperations>
      pitTaxableRevenueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pitTaxableRevenue');
    });
  }

  QueryBuilder<TaxRevenueEntry, double?, QQueryOperations>
      returnAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnAmount');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations>
      salesChannelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salesChannel');
    });
  }

  QueryBuilder<TaxRevenueEntry, int?, QQueryOperations>
      serverVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverVersion');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations> taxPeriodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxPeriod');
    });
  }

  QueryBuilder<TaxRevenueEntry, double?, QQueryOperations>
      taxableRevenueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxableRevenue');
    });
  }

  QueryBuilder<TaxRevenueEntry, String?, QQueryOperations> tenantIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tenantId');
    });
  }

  QueryBuilder<TaxRevenueEntry, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TaxRevenueEntry, double?, QQueryOperations>
      vatTaxableRevenueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vatTaxableRevenue');
    });
  }
}
