// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_period.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaxPeriodCollection on Isar {
  IsarCollection<TaxPeriod> get taxPeriods => this.collection();
}

const TaxPeriodSchema = CollectionSchema(
  name: r'TaxPeriod',
  id: 3805857420418793471,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'declarationDueDate': PropertySchema(
      id: 1,
      name: r'declarationDueDate',
      type: IsarType.dateTime,
    ),
    r'declaredAmount': PropertySchema(
      id: 2,
      name: r'declaredAmount',
      type: IsarType.double,
    ),
    r'fiscalYear': PropertySchema(
      id: 3,
      name: r'fiscalYear',
      type: IsarType.long,
    ),
    r'note': PropertySchema(
      id: 4,
      name: r'note',
      type: IsarType.string,
    ),
    r'paidAmount': PropertySchema(
      id: 5,
      name: r'paidAmount',
      type: IsarType.double,
    ),
    r'paidAt': PropertySchema(
      id: 6,
      name: r'paidAt',
      type: IsarType.dateTime,
    ),
    r'paymentDueDate': PropertySchema(
      id: 7,
      name: r'paymentDueDate',
      type: IsarType.dateTime,
    ),
    r'periodEnd': PropertySchema(
      id: 8,
      name: r'periodEnd',
      type: IsarType.dateTime,
    ),
    r'periodNumber': PropertySchema(
      id: 9,
      name: r'periodNumber',
      type: IsarType.long,
    ),
    r'periodStart': PropertySchema(
      id: 10,
      name: r'periodStart',
      type: IsarType.dateTime,
    ),
    r'periodType': PropertySchema(
      id: 11,
      name: r'periodType',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.string,
    ),
    r'submittedAt': PropertySchema(
      id: 13,
      name: r'submittedAt',
      type: IsarType.dateTime,
    ),
    r'syncStatus': PropertySchema(
      id: 14,
      name: r'syncStatus',
      type: IsarType.string,
    ),
    r'taxType': PropertySchema(
      id: 15,
      name: r'taxType',
      type: IsarType.string,
    ),
    r'tenantId': PropertySchema(
      id: 16,
      name: r'tenantId',
      type: IsarType.string,
    )
  },
  estimateSize: _taxPeriodEstimateSize,
  serialize: _taxPeriodSerialize,
  deserialize: _taxPeriodDeserialize,
  deserializeProp: _taxPeriodDeserializeProp,
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
  getId: _taxPeriodGetId,
  getLinks: _taxPeriodGetLinks,
  attach: _taxPeriodAttach,
  version: '3.1.0+1',
);

int _taxPeriodEstimateSize(
  TaxPeriod object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.periodType;
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
    final value = object.syncStatus;
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
    final value = object.tenantId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _taxPeriodSerialize(
  TaxPeriod object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.declarationDueDate);
  writer.writeDouble(offsets[2], object.declaredAmount);
  writer.writeLong(offsets[3], object.fiscalYear);
  writer.writeString(offsets[4], object.note);
  writer.writeDouble(offsets[5], object.paidAmount);
  writer.writeDateTime(offsets[6], object.paidAt);
  writer.writeDateTime(offsets[7], object.paymentDueDate);
  writer.writeDateTime(offsets[8], object.periodEnd);
  writer.writeLong(offsets[9], object.periodNumber);
  writer.writeDateTime(offsets[10], object.periodStart);
  writer.writeString(offsets[11], object.periodType);
  writer.writeString(offsets[12], object.status);
  writer.writeDateTime(offsets[13], object.submittedAt);
  writer.writeString(offsets[14], object.syncStatus);
  writer.writeString(offsets[15], object.taxType);
  writer.writeString(offsets[16], object.tenantId);
}

TaxPeriod _taxPeriodDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaxPeriod();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.declarationDueDate = reader.readDateTimeOrNull(offsets[1]);
  object.declaredAmount = reader.readDoubleOrNull(offsets[2]);
  object.fiscalYear = reader.readLongOrNull(offsets[3]);
  object.id = id;
  object.note = reader.readStringOrNull(offsets[4]);
  object.paidAmount = reader.readDoubleOrNull(offsets[5]);
  object.paidAt = reader.readDateTimeOrNull(offsets[6]);
  object.paymentDueDate = reader.readDateTimeOrNull(offsets[7]);
  object.periodEnd = reader.readDateTimeOrNull(offsets[8]);
  object.periodNumber = reader.readLongOrNull(offsets[9]);
  object.periodStart = reader.readDateTimeOrNull(offsets[10]);
  object.periodType = reader.readStringOrNull(offsets[11]);
  object.status = reader.readStringOrNull(offsets[12]);
  object.submittedAt = reader.readDateTimeOrNull(offsets[13]);
  object.syncStatus = reader.readStringOrNull(offsets[14]);
  object.taxType = reader.readStringOrNull(offsets[15]);
  object.tenantId = reader.readStringOrNull(offsets[16]);
  return object;
}

P _taxPeriodDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taxPeriodGetId(TaxPeriod object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taxPeriodGetLinks(TaxPeriod object) {
  return [];
}

void _taxPeriodAttach(IsarCollection<dynamic> col, Id id, TaxPeriod object) {
  object.id = id;
}

extension TaxPeriodQueryWhereSort
    on QueryBuilder<TaxPeriod, TaxPeriod, QWhere> {
  QueryBuilder<TaxPeriod, TaxPeriod, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaxPeriodQueryWhere
    on QueryBuilder<TaxPeriod, TaxPeriod, QWhereClause> {
  QueryBuilder<TaxPeriod, TaxPeriod, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterWhereClause> idBetween(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterWhereClause> tenantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tenantId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterWhereClause> tenantIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tenantId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterWhereClause> tenantIdEqualTo(
      String? tenantId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tenantId',
        value: [tenantId],
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterWhereClause> tenantIdNotEqualTo(
      String? tenantId) {
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

extension TaxPeriodQueryFilter
    on QueryBuilder<TaxPeriod, TaxPeriod, QFilterCondition> {
  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declarationDueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'declarationDueDate',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declarationDueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'declarationDueDate',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declarationDueDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'declarationDueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declarationDueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'declarationDueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declarationDueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'declarationDueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declarationDueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'declarationDueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declaredAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'declaredAmount',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declaredAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'declaredAmount',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declaredAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'declaredAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declaredAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'declaredAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declaredAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'declaredAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      declaredAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'declaredAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> fiscalYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fiscalYear',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      fiscalYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fiscalYear',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> fiscalYearEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiscalYear',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> fiscalYearLessThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> fiscalYearBetween(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteEqualTo(
    String? value, {
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteGreaterThan(
    String? value, {
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteLessThan(
    String? value, {
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteStartsWith(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteEndsWith(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> paidAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paidAmount',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      paidAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paidAmount',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> paidAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      paidAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> paidAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> paidAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> paidAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paidAt',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> paidAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paidAt',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> paidAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> paidAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> paidAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> paidAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      paymentDueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentDueDate',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      paymentDueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentDueDate',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      paymentDueDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentDueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      paymentDueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentDueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      paymentDueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentDueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      paymentDueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentDueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodEndIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'periodEnd',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodEndIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'periodEnd',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodEndEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'periodEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodEndGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'periodEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodEndLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'periodEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodEndBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'periodEnd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'periodNumber',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'periodNumber',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodNumberEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'periodNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'periodNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'periodNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'periodNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodStartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'periodStart',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodStartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'periodStart',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodStartEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'periodStart',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodStartGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'periodStart',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodStartLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'periodStart',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodStartBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'periodStart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'periodType',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'periodType',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'periodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'periodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'periodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'periodType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'periodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'periodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'periodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> periodTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'periodType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'periodType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      periodTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'periodType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      submittedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'submittedAt',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      submittedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'submittedAt',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> submittedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submittedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> submittedAtLessThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> submittedAtBetween(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> syncStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncStatus',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      syncStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncStatus',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> syncStatusEqualTo(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> syncStatusLessThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> syncStatusBetween(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> syncStatusEndsWith(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> syncStatusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> syncStatusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> taxTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxType',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> taxTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxType',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> taxTypeEqualTo(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> taxTypeGreaterThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> taxTypeLessThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> taxTypeBetween(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> taxTypeStartsWith(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> taxTypeEndsWith(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> taxTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> taxTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> taxTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      taxTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> tenantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tenantId',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      tenantIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tenantId',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> tenantIdEqualTo(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> tenantIdGreaterThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> tenantIdLessThan(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> tenantIdBetween(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> tenantIdStartsWith(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> tenantIdEndsWith(
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

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> tenantIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> tenantIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tenantId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition> tenantIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenantId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterFilterCondition>
      tenantIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tenantId',
        value: '',
      ));
    });
  }
}

extension TaxPeriodQueryObject
    on QueryBuilder<TaxPeriod, TaxPeriod, QFilterCondition> {}

extension TaxPeriodQueryLinks
    on QueryBuilder<TaxPeriod, TaxPeriod, QFilterCondition> {}

extension TaxPeriodQuerySortBy on QueryBuilder<TaxPeriod, TaxPeriod, QSortBy> {
  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByDeclarationDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declarationDueDate', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy>
      sortByDeclarationDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declarationDueDate', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByDeclaredAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declaredAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByDeclaredAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declaredAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByFiscalYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiscalYear', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByFiscalYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiscalYear', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPaidAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPaidAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPaymentDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDueDate', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPaymentDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDueDate', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPeriodEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodEnd', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPeriodEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodEnd', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPeriodNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodNumber', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPeriodNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodNumber', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPeriodStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodStart', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPeriodStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodStart', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPeriodType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodType', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByPeriodTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodType', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortBySubmittedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByTaxType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxType', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByTaxTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxType', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> sortByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.desc);
    });
  }
}

extension TaxPeriodQuerySortThenBy
    on QueryBuilder<TaxPeriod, TaxPeriod, QSortThenBy> {
  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByDeclarationDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declarationDueDate', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy>
      thenByDeclarationDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declarationDueDate', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByDeclaredAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declaredAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByDeclaredAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'declaredAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByFiscalYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiscalYear', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByFiscalYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiscalYear', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPaidAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPaidAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPaymentDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDueDate', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPaymentDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDueDate', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPeriodEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodEnd', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPeriodEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodEnd', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPeriodNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodNumber', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPeriodNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodNumber', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPeriodStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodStart', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPeriodStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodStart', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPeriodType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodType', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByPeriodTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodType', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenBySubmittedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByTaxType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxType', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByTaxTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxType', Sort.desc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.asc);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QAfterSortBy> thenByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.desc);
    });
  }
}

extension TaxPeriodQueryWhereDistinct
    on QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> {
  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByDeclarationDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'declarationDueDate');
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByDeclaredAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'declaredAmount');
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByFiscalYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fiscalYear');
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidAmount');
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByPaidAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidAt');
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByPaymentDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentDueDate');
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByPeriodEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'periodEnd');
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByPeriodNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'periodNumber');
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByPeriodStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'periodStart');
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByPeriodType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'periodType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submittedAt');
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctBySyncStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByTaxType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxPeriod, TaxPeriod, QDistinct> distinctByTenantId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tenantId', caseSensitive: caseSensitive);
    });
  }
}

extension TaxPeriodQueryProperty
    on QueryBuilder<TaxPeriod, TaxPeriod, QQueryProperty> {
  QueryBuilder<TaxPeriod, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaxPeriod, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TaxPeriod, DateTime?, QQueryOperations>
      declarationDueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'declarationDueDate');
    });
  }

  QueryBuilder<TaxPeriod, double?, QQueryOperations> declaredAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'declaredAmount');
    });
  }

  QueryBuilder<TaxPeriod, int?, QQueryOperations> fiscalYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fiscalYear');
    });
  }

  QueryBuilder<TaxPeriod, String?, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<TaxPeriod, double?, QQueryOperations> paidAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidAmount');
    });
  }

  QueryBuilder<TaxPeriod, DateTime?, QQueryOperations> paidAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidAt');
    });
  }

  QueryBuilder<TaxPeriod, DateTime?, QQueryOperations>
      paymentDueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentDueDate');
    });
  }

  QueryBuilder<TaxPeriod, DateTime?, QQueryOperations> periodEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'periodEnd');
    });
  }

  QueryBuilder<TaxPeriod, int?, QQueryOperations> periodNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'periodNumber');
    });
  }

  QueryBuilder<TaxPeriod, DateTime?, QQueryOperations> periodStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'periodStart');
    });
  }

  QueryBuilder<TaxPeriod, String?, QQueryOperations> periodTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'periodType');
    });
  }

  QueryBuilder<TaxPeriod, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TaxPeriod, DateTime?, QQueryOperations> submittedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submittedAt');
    });
  }

  QueryBuilder<TaxPeriod, String?, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<TaxPeriod, String?, QQueryOperations> taxTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxType');
    });
  }

  QueryBuilder<TaxPeriod, String?, QQueryOperations> tenantIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tenantId');
    });
  }
}
