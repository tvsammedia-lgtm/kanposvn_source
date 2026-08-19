// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pawn_invoice_detail.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPawnInvoiceDetailCollection on Isar {
  IsarCollection<PawnInvoiceDetail> get pawnInvoiceDetails => this.collection();
}

const PawnInvoiceDetailSchema = CollectionSchema(
  name: r'PawnInvoiceDetail',
  id: -8373114687992147969,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'imei': PropertySchema(
      id: 1,
      name: r'imei',
      type: IsarType.string,
    ),
    r'productName': PropertySchema(
      id: 2,
      name: r'productName',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 3,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'total': PropertySchema(
      id: 4,
      name: r'total',
      type: IsarType.double,
    ),
    r'unitPrice': PropertySchema(
      id: 5,
      name: r'unitPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _pawnInvoiceDetailEstimateSize,
  serialize: _pawnInvoiceDetailSerialize,
  deserialize: _pawnInvoiceDetailDeserialize,
  deserializeProp: _pawnInvoiceDetailDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'invoice': LinkSchema(
      id: 5511956963433984951,
      name: r'invoice',
      target: r'Invoice',
      single: true,
    ),
    r'product': LinkSchema(
      id: -6733474000834218185,
      name: r'product',
      target: r'Product',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _pawnInvoiceDetailGetId,
  getLinks: _pawnInvoiceDetailGetLinks,
  attach: _pawnInvoiceDetailAttach,
  version: '3.1.0+1',
);

int _pawnInvoiceDetailEstimateSize(
  PawnInvoiceDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imei;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _pawnInvoiceDetailSerialize(
  PawnInvoiceDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.imei);
  writer.writeString(offsets[2], object.productName);
  writer.writeLong(offsets[3], object.quantity);
  writer.writeDouble(offsets[4], object.total);
  writer.writeDouble(offsets[5], object.unitPrice);
}

PawnInvoiceDetail _pawnInvoiceDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PawnInvoiceDetail();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.imei = reader.readStringOrNull(offsets[1]);
  object.productName = reader.readStringOrNull(offsets[2]);
  object.quantity = reader.readLongOrNull(offsets[3]);
  object.total = reader.readDoubleOrNull(offsets[4]);
  object.unitPrice = reader.readDoubleOrNull(offsets[5]);
  return object;
}

P _pawnInvoiceDetailDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pawnInvoiceDetailGetId(PawnInvoiceDetail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pawnInvoiceDetailGetLinks(
    PawnInvoiceDetail object) {
  return [object.invoice, object.product];
}

void _pawnInvoiceDetailAttach(
    IsarCollection<dynamic> col, Id id, PawnInvoiceDetail object) {
  object.id = id;
  object.invoice.attach(col, col.isar.collection<Invoice>(), r'invoice', id);
  object.product.attach(col, col.isar.collection<Product>(), r'product', id);
}

extension PawnInvoiceDetailQueryWhereSort
    on QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QWhere> {
  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PawnInvoiceDetailQueryWhere
    on QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QWhereClause> {
  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterWhereClause>
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

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterWhereClause>
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
}

extension PawnInvoiceDetailQueryFilter
    on QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QFilterCondition> {
  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
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

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
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

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
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

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
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

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
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

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
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

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imei',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imei',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imei',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imei',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imei',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      imeiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imei',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productName',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productName',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      quantityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      quantityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      quantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      totalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      totalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      totalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      totalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      unitPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitPrice',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      unitPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitPrice',
      ));
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      unitPriceEqualTo(
    double? value, {
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

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      unitPriceGreaterThan(
    double? value, {
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

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      unitPriceLessThan(
    double? value, {
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

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      unitPriceBetween(
    double? lower,
    double? upper, {
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
}

extension PawnInvoiceDetailQueryObject
    on QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QFilterCondition> {}

extension PawnInvoiceDetailQueryLinks
    on QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QFilterCondition> {
  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      invoice(FilterQuery<Invoice> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'invoice');
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      invoiceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'invoice', 0, true, 0, true);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      product(FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'product');
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'product', 0, true, 0, true);
    });
  }
}

extension PawnInvoiceDetailQuerySortBy
    on QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QSortBy> {
  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.desc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension PawnInvoiceDetailQuerySortThenBy
    on QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QSortThenBy> {
  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.desc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QAfterSortBy>
      thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension PawnInvoiceDetailQueryWhereDistinct
    on QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QDistinct> {
  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QDistinct> distinctByImei(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imei', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QDistinct>
      distinctByProductName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QDistinct>
      distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QDistinct>
      distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }
}

extension PawnInvoiceDetailQueryProperty
    on QueryBuilder<PawnInvoiceDetail, PawnInvoiceDetail, QQueryProperty> {
  QueryBuilder<PawnInvoiceDetail, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PawnInvoiceDetail, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PawnInvoiceDetail, String?, QQueryOperations> imeiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imei');
    });
  }

  QueryBuilder<PawnInvoiceDetail, String?, QQueryOperations>
      productNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productName');
    });
  }

  QueryBuilder<PawnInvoiceDetail, int?, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<PawnInvoiceDetail, double?, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<PawnInvoiceDetail, double?, QQueryOperations>
      unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }
}
