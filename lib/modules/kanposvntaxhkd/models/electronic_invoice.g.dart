// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electronic_invoice.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetElectronicInvoiceCollection on Isar {
  IsarCollection<ElectronicInvoice> get electronicInvoices => this.collection();
}

const ElectronicInvoiceSchema = CollectionSchema(
  name: r'ElectronicInvoice',
  id: 3293341961943728674,
  properties: {
    r'adjustedFromId': PropertySchema(
      id: 0,
      name: r'adjustedFromId',
      type: IsarType.string,
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
    r'cancelledAt': PropertySchema(
      id: 3,
      name: r'cancelledAt',
      type: IsarType.dateTime,
    ),
    r'customerName': PropertySchema(
      id: 4,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'customerTaxCode': PropertySchema(
      id: 5,
      name: r'customerTaxCode',
      type: IsarType.string,
    ),
    r'invoiceDate': PropertySchema(
      id: 6,
      name: r'invoiceDate',
      type: IsarType.dateTime,
    ),
    r'invoiceNumber': PropertySchema(
      id: 7,
      name: r'invoiceNumber',
      type: IsarType.string,
    ),
    r'invoiceSeries': PropertySchema(
      id: 8,
      name: r'invoiceSeries',
      type: IsarType.string,
    ),
    r'invoiceType': PropertySchema(
      id: 9,
      name: r'invoiceType',
      type: IsarType.string,
    ),
    r'issuedAt': PropertySchema(
      id: 10,
      name: r'issuedAt',
      type: IsarType.dateTime,
    ),
    r'lookupCode': PropertySchema(
      id: 11,
      name: r'lookupCode',
      type: IsarType.string,
    ),
    r'pdfFileId': PropertySchema(
      id: 12,
      name: r'pdfFileId',
      type: IsarType.string,
    ),
    r'providerCode': PropertySchema(
      id: 13,
      name: r'providerCode',
      type: IsarType.string,
    ),
    r'sourceDocumentId': PropertySchema(
      id: 14,
      name: r'sourceDocumentId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 15,
      name: r'status',
      type: IsarType.string,
    ),
    r'subtotal': PropertySchema(
      id: 16,
      name: r'subtotal',
      type: IsarType.double,
    ),
    r'taxAuthorityCode': PropertySchema(
      id: 17,
      name: r'taxAuthorityCode',
      type: IsarType.string,
    ),
    r'tenantId': PropertySchema(
      id: 18,
      name: r'tenantId',
      type: IsarType.string,
    ),
    r'totalAmount': PropertySchema(
      id: 19,
      name: r'totalAmount',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 20,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vatAmount': PropertySchema(
      id: 21,
      name: r'vatAmount',
      type: IsarType.double,
    ),
    r'xmlFileId': PropertySchema(
      id: 22,
      name: r'xmlFileId',
      type: IsarType.string,
    )
  },
  estimateSize: _electronicInvoiceEstimateSize,
  serialize: _electronicInvoiceSerialize,
  deserialize: _electronicInvoiceDeserialize,
  deserializeProp: _electronicInvoiceDeserializeProp,
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
  getId: _electronicInvoiceGetId,
  getLinks: _electronicInvoiceGetLinks,
  attach: _electronicInvoiceAttach,
  version: '3.1.0+1',
);

int _electronicInvoiceEstimateSize(
  ElectronicInvoice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.adjustedFromId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
    final value = object.customerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerTaxCode;
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
    final value = object.invoiceSeries;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.invoiceType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lookupCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pdfFileId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.providerCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceDocumentId;
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
    final value = object.taxAuthorityCode;
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
  {
    final value = object.xmlFileId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _electronicInvoiceSerialize(
  ElectronicInvoice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.adjustedFromId);
  writer.writeString(offsets[1], object.branchId);
  writer.writeString(offsets[2], object.businessId);
  writer.writeDateTime(offsets[3], object.cancelledAt);
  writer.writeString(offsets[4], object.customerName);
  writer.writeString(offsets[5], object.customerTaxCode);
  writer.writeDateTime(offsets[6], object.invoiceDate);
  writer.writeString(offsets[7], object.invoiceNumber);
  writer.writeString(offsets[8], object.invoiceSeries);
  writer.writeString(offsets[9], object.invoiceType);
  writer.writeDateTime(offsets[10], object.issuedAt);
  writer.writeString(offsets[11], object.lookupCode);
  writer.writeString(offsets[12], object.pdfFileId);
  writer.writeString(offsets[13], object.providerCode);
  writer.writeString(offsets[14], object.sourceDocumentId);
  writer.writeString(offsets[15], object.status);
  writer.writeDouble(offsets[16], object.subtotal);
  writer.writeString(offsets[17], object.taxAuthorityCode);
  writer.writeString(offsets[18], object.tenantId);
  writer.writeDouble(offsets[19], object.totalAmount);
  writer.writeDateTime(offsets[20], object.updatedAt);
  writer.writeDouble(offsets[21], object.vatAmount);
  writer.writeString(offsets[22], object.xmlFileId);
}

ElectronicInvoice _electronicInvoiceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ElectronicInvoice();
  object.adjustedFromId = reader.readStringOrNull(offsets[0]);
  object.branchId = reader.readStringOrNull(offsets[1]);
  object.businessId = reader.readStringOrNull(offsets[2]);
  object.cancelledAt = reader.readDateTimeOrNull(offsets[3]);
  object.customerName = reader.readStringOrNull(offsets[4]);
  object.customerTaxCode = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.invoiceDate = reader.readDateTimeOrNull(offsets[6]);
  object.invoiceNumber = reader.readStringOrNull(offsets[7]);
  object.invoiceSeries = reader.readStringOrNull(offsets[8]);
  object.invoiceType = reader.readStringOrNull(offsets[9]);
  object.issuedAt = reader.readDateTimeOrNull(offsets[10]);
  object.lookupCode = reader.readStringOrNull(offsets[11]);
  object.pdfFileId = reader.readStringOrNull(offsets[12]);
  object.providerCode = reader.readStringOrNull(offsets[13]);
  object.sourceDocumentId = reader.readStringOrNull(offsets[14]);
  object.status = reader.readStringOrNull(offsets[15]);
  object.subtotal = reader.readDoubleOrNull(offsets[16]);
  object.taxAuthorityCode = reader.readStringOrNull(offsets[17]);
  object.tenantId = reader.readStringOrNull(offsets[18]);
  object.totalAmount = reader.readDoubleOrNull(offsets[19]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[20]);
  object.vatAmount = reader.readDoubleOrNull(offsets[21]);
  object.xmlFileId = reader.readStringOrNull(offsets[22]);
  return object;
}

P _electronicInvoiceDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readDoubleOrNull(offset)) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 21:
      return (reader.readDoubleOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _electronicInvoiceGetId(ElectronicInvoice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _electronicInvoiceGetLinks(
    ElectronicInvoice object) {
  return [];
}

void _electronicInvoiceAttach(
    IsarCollection<dynamic> col, Id id, ElectronicInvoice object) {
  object.id = id;
}

extension ElectronicInvoiceQueryWhereSort
    on QueryBuilder<ElectronicInvoice, ElectronicInvoice, QWhere> {
  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ElectronicInvoiceQueryWhere
    on QueryBuilder<ElectronicInvoice, ElectronicInvoice, QWhereClause> {
  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterWhereClause>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterWhereClause>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterWhereClause>
      tenantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tenantId',
        value: [null],
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterWhereClause>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterWhereClause>
      tenantIdEqualTo(String? tenantId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tenantId',
        value: [tenantId],
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterWhereClause>
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

extension ElectronicInvoiceQueryFilter
    on QueryBuilder<ElectronicInvoice, ElectronicInvoice, QFilterCondition> {
  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'adjustedFromId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'adjustedFromId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustedFromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adjustedFromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adjustedFromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adjustedFromId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'adjustedFromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'adjustedFromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'adjustedFromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'adjustedFromId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustedFromId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      adjustedFromIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'adjustedFromId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      branchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      branchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'branchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      branchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      branchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      businessIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'businessId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      businessIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'businessId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      businessIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'businessId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      businessIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'businessId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      businessIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      businessIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'businessId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      cancelledAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledAt',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      cancelledAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledAt',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      cancelledAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      cancelledAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cancelledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      cancelledAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cancelledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      cancelledAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cancelledAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerTaxCode',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerTaxCode',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerTaxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerTaxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerTaxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerTaxCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerTaxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerTaxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerTaxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerTaxCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerTaxCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      customerTaxCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerTaxCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoiceDate',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoiceDate',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoiceNumber',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoiceNumber',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoiceNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoiceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoiceSeries',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoiceSeries',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceSeries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceSeries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceSeries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceSeries',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoiceSeries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoiceSeries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoiceSeries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoiceSeries',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceSeries',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceSeriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoiceSeries',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoiceType',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoiceType',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoiceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceType',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      invoiceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoiceType',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      issuedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'issuedAt',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      issuedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'issuedAt',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      issuedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issuedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      issuedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issuedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      issuedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issuedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      issuedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issuedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lookupCode',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lookupCode',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lookupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lookupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lookupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lookupCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lookupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lookupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lookupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lookupCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lookupCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      lookupCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lookupCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pdfFileId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pdfFileId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdfFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdfFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdfFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdfFileId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pdfFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pdfFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pdfFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pdfFileId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdfFileId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      pdfFileIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pdfFileId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'providerCode',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'providerCode',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'providerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'providerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'providerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'providerCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'providerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'providerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'providerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'providerCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'providerCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      providerCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'providerCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceDocumentId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceDocumentId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceDocumentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceDocumentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceDocumentId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      sourceDocumentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceDocumentId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      subtotalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subtotal',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      subtotalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subtotal',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      subtotalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      subtotalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      subtotalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      subtotalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxAuthorityCode',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxAuthorityCode',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxAuthorityCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxAuthorityCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxAuthorityCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxAuthorityCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxAuthorityCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxAuthorityCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxAuthorityCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxAuthorityCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxAuthorityCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      taxAuthorityCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxAuthorityCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      tenantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tenantId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      tenantIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tenantId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      tenantIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      tenantIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tenantId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      tenantIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenantId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      tenantIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tenantId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      totalAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      totalAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      totalAmountEqualTo(
    double? value, {
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      totalAmountGreaterThan(
    double? value, {
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      totalAmountLessThan(
    double? value, {
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      totalAmountBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      vatAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vatAmount',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      vatAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vatAmount',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
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

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xmlFileId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xmlFileId',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xmlFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xmlFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xmlFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xmlFileId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'xmlFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'xmlFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'xmlFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'xmlFileId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xmlFileId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterFilterCondition>
      xmlFileIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'xmlFileId',
        value: '',
      ));
    });
  }
}

extension ElectronicInvoiceQueryObject
    on QueryBuilder<ElectronicInvoice, ElectronicInvoice, QFilterCondition> {}

extension ElectronicInvoiceQueryLinks
    on QueryBuilder<ElectronicInvoice, ElectronicInvoice, QFilterCondition> {}

extension ElectronicInvoiceQuerySortBy
    on QueryBuilder<ElectronicInvoice, ElectronicInvoice, QSortBy> {
  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByAdjustedFromId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustedFromId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByAdjustedFromIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustedFromId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByCancelledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByCustomerTaxCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerTaxCode', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByCustomerTaxCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerTaxCode', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByInvoiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByInvoiceDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByInvoiceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByInvoiceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByInvoiceSeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceSeries', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByInvoiceSeriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceSeries', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByInvoiceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceType', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByInvoiceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceType', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByIssuedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuedAt', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByIssuedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuedAt', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByLookupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupCode', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByLookupCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupCode', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByPdfFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfFileId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByPdfFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfFileId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByProviderCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providerCode', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByProviderCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providerCode', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortBySourceDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceDocumentId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortBySourceDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceDocumentId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByTaxAuthorityCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAuthorityCode', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByTaxAuthorityCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAuthorityCode', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByVatAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByXmlFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xmlFileId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      sortByXmlFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xmlFileId', Sort.desc);
    });
  }
}

extension ElectronicInvoiceQuerySortThenBy
    on QueryBuilder<ElectronicInvoice, ElectronicInvoice, QSortThenBy> {
  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByAdjustedFromId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustedFromId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByAdjustedFromIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustedFromId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByCancelledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByCustomerTaxCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerTaxCode', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByCustomerTaxCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerTaxCode', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByInvoiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByInvoiceDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByInvoiceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByInvoiceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByInvoiceSeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceSeries', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByInvoiceSeriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceSeries', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByInvoiceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceType', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByInvoiceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceType', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByIssuedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuedAt', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByIssuedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuedAt', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByLookupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupCode', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByLookupCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupCode', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByPdfFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfFileId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByPdfFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfFileId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByProviderCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providerCode', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByProviderCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providerCode', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenBySourceDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceDocumentId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenBySourceDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceDocumentId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByTaxAuthorityCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAuthorityCode', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByTaxAuthorityCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAuthorityCode', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByVatAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.desc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByXmlFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xmlFileId', Sort.asc);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QAfterSortBy>
      thenByXmlFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xmlFileId', Sort.desc);
    });
  }
}

extension ElectronicInvoiceQueryWhereDistinct
    on QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct> {
  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByAdjustedFromId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adjustedFromId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByBranchId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByBusinessId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledAt');
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByCustomerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByCustomerTaxCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerTaxCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByInvoiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceDate');
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByInvoiceNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByInvoiceSeries({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceSeries',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByInvoiceType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByIssuedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issuedAt');
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByLookupCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lookupCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByPdfFileId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdfFileId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByProviderCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'providerCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctBySourceDocumentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceDocumentId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtotal');
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByTaxAuthorityCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxAuthorityCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByTenantId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tenantId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vatAmount');
    });
  }

  QueryBuilder<ElectronicInvoice, ElectronicInvoice, QDistinct>
      distinctByXmlFileId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xmlFileId', caseSensitive: caseSensitive);
    });
  }
}

extension ElectronicInvoiceQueryProperty
    on QueryBuilder<ElectronicInvoice, ElectronicInvoice, QQueryProperty> {
  QueryBuilder<ElectronicInvoice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      adjustedFromIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adjustedFromId');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      businessIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessId');
    });
  }

  QueryBuilder<ElectronicInvoice, DateTime?, QQueryOperations>
      cancelledAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledAt');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      customerTaxCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerTaxCode');
    });
  }

  QueryBuilder<ElectronicInvoice, DateTime?, QQueryOperations>
      invoiceDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceDate');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      invoiceNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceNumber');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      invoiceSeriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceSeries');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      invoiceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceType');
    });
  }

  QueryBuilder<ElectronicInvoice, DateTime?, QQueryOperations>
      issuedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issuedAt');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      lookupCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lookupCode');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      pdfFileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdfFileId');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      providerCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'providerCode');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      sourceDocumentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceDocumentId');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ElectronicInvoice, double?, QQueryOperations>
      subtotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtotal');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      taxAuthorityCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxAuthorityCode');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      tenantIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tenantId');
    });
  }

  QueryBuilder<ElectronicInvoice, double?, QQueryOperations>
      totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }

  QueryBuilder<ElectronicInvoice, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ElectronicInvoice, double?, QQueryOperations>
      vatAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vatAmount');
    });
  }

  QueryBuilder<ElectronicInvoice, String?, QQueryOperations>
      xmlFileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xmlFileId');
    });
  }
}
