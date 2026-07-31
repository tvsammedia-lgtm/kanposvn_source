// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nhathuoc_purchase.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNhathuocPurchaseCollection on Isar {
  IsarCollection<NhathuocPurchase> get nhathuocPurchases => this.collection();
}

const NhathuocPurchaseSchema = CollectionSchema(
  name: r'NhathuocPurchase',
  id: -1557401023203841738,
  properties: {
    r'documentCode': PropertySchema(
      id: 0,
      name: r'documentCode',
      type: IsarType.string,
    ),
    r'purchaseDate': PropertySchema(
      id: 1,
      name: r'purchaseDate',
      type: IsarType.dateTime,
    ),
    r'purchaseId': PropertySchema(
      id: 2,
      name: r'purchaseId',
      type: IsarType.string,
    ),
    r'totalAmount': PropertySchema(
      id: 3,
      name: r'totalAmount',
      type: IsarType.double,
    )
  },
  estimateSize: _nhathuocPurchaseEstimateSize,
  serialize: _nhathuocPurchaseSerialize,
  deserialize: _nhathuocPurchaseDeserialize,
  deserializeProp: _nhathuocPurchaseDeserializeProp,
  idName: r'id',
  indexes: {
    r'purchaseId': IndexSchema(
      id: -162747061722907333,
      name: r'purchaseId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'purchaseId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'supplier': LinkSchema(
      id: 8866288441537871502,
      name: r'supplier',
      target: r'NhathuocSupplier',
      single: true,
    ),
    r'details': LinkSchema(
      id: -316249670788261244,
      name: r'details',
      target: r'NhathuocPurchaseDetail',
      single: false,
      linkName: r'purchase',
    )
  },
  embeddedSchemas: {},
  getId: _nhathuocPurchaseGetId,
  getLinks: _nhathuocPurchaseGetLinks,
  attach: _nhathuocPurchaseAttach,
  version: '3.1.0+1',
);

int _nhathuocPurchaseEstimateSize(
  NhathuocPurchase object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.documentCode.length * 3;
  bytesCount += 3 + object.purchaseId.length * 3;
  return bytesCount;
}

void _nhathuocPurchaseSerialize(
  NhathuocPurchase object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.documentCode);
  writer.writeDateTime(offsets[1], object.purchaseDate);
  writer.writeString(offsets[2], object.purchaseId);
  writer.writeDouble(offsets[3], object.totalAmount);
}

NhathuocPurchase _nhathuocPurchaseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NhathuocPurchase();
  object.documentCode = reader.readString(offsets[0]);
  object.id = id;
  object.purchaseDate = reader.readDateTimeOrNull(offsets[1]);
  object.purchaseId = reader.readString(offsets[2]);
  object.totalAmount = reader.readDouble(offsets[3]);
  return object;
}

P _nhathuocPurchaseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nhathuocPurchaseGetId(NhathuocPurchase object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nhathuocPurchaseGetLinks(NhathuocPurchase object) {
  return [object.supplier, object.details];
}

void _nhathuocPurchaseAttach(
    IsarCollection<dynamic> col, Id id, NhathuocPurchase object) {
  object.id = id;
  object.supplier
      .attach(col, col.isar.collection<NhathuocSupplier>(), r'supplier', id);
  object.details.attach(
      col, col.isar.collection<NhathuocPurchaseDetail>(), r'details', id);
}

extension NhathuocPurchaseByIndex on IsarCollection<NhathuocPurchase> {
  Future<NhathuocPurchase?> getByPurchaseId(String purchaseId) {
    return getByIndex(r'purchaseId', [purchaseId]);
  }

  NhathuocPurchase? getByPurchaseIdSync(String purchaseId) {
    return getByIndexSync(r'purchaseId', [purchaseId]);
  }

  Future<bool> deleteByPurchaseId(String purchaseId) {
    return deleteByIndex(r'purchaseId', [purchaseId]);
  }

  bool deleteByPurchaseIdSync(String purchaseId) {
    return deleteByIndexSync(r'purchaseId', [purchaseId]);
  }

  Future<List<NhathuocPurchase?>> getAllByPurchaseId(
      List<String> purchaseIdValues) {
    final values = purchaseIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'purchaseId', values);
  }

  List<NhathuocPurchase?> getAllByPurchaseIdSync(
      List<String> purchaseIdValues) {
    final values = purchaseIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'purchaseId', values);
  }

  Future<int> deleteAllByPurchaseId(List<String> purchaseIdValues) {
    final values = purchaseIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'purchaseId', values);
  }

  int deleteAllByPurchaseIdSync(List<String> purchaseIdValues) {
    final values = purchaseIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'purchaseId', values);
  }

  Future<Id> putByPurchaseId(NhathuocPurchase object) {
    return putByIndex(r'purchaseId', object);
  }

  Id putByPurchaseIdSync(NhathuocPurchase object, {bool saveLinks = true}) {
    return putByIndexSync(r'purchaseId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPurchaseId(List<NhathuocPurchase> objects) {
    return putAllByIndex(r'purchaseId', objects);
  }

  List<Id> putAllByPurchaseIdSync(List<NhathuocPurchase> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'purchaseId', objects, saveLinks: saveLinks);
  }
}

extension NhathuocPurchaseQueryWhereSort
    on QueryBuilder<NhathuocPurchase, NhathuocPurchase, QWhere> {
  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NhathuocPurchaseQueryWhere
    on QueryBuilder<NhathuocPurchase, NhathuocPurchase, QWhereClause> {
  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterWhereClause>
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

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterWhereClause> idBetween(
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

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterWhereClause>
      purchaseIdEqualTo(String purchaseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'purchaseId',
        value: [purchaseId],
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterWhereClause>
      purchaseIdNotEqualTo(String purchaseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'purchaseId',
              lower: [],
              upper: [purchaseId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'purchaseId',
              lower: [purchaseId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'purchaseId',
              lower: [purchaseId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'purchaseId',
              lower: [],
              upper: [purchaseId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NhathuocPurchaseQueryFilter
    on QueryBuilder<NhathuocPurchase, NhathuocPurchase, QFilterCondition> {
  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      documentCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      documentCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      documentCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      documentCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      documentCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      documentCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      documentCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      documentCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      documentCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      documentCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
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

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
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

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
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

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'purchaseDate',
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'purchaseDate',
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'purchaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'purchaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'purchaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'purchaseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      purchaseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'purchaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      totalAmountEqualTo(
    double value, {
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

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      totalAmountGreaterThan(
    double value, {
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

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      totalAmountLessThan(
    double value, {
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

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      totalAmountBetween(
    double lower,
    double upper, {
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
}

extension NhathuocPurchaseQueryObject
    on QueryBuilder<NhathuocPurchase, NhathuocPurchase, QFilterCondition> {}

extension NhathuocPurchaseQueryLinks
    on QueryBuilder<NhathuocPurchase, NhathuocPurchase, QFilterCondition> {
  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      supplier(FilterQuery<NhathuocSupplier> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'supplier');
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      supplierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'supplier', 0, true, 0, true);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      details(FilterQuery<NhathuocPurchaseDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'details');
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      detailsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', length, true, length, true);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      detailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, true, 0, true);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      detailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, false, 999999, true);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      detailsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, true, length, include);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      detailsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', length, include, 999999, true);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterFilterCondition>
      detailsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'details', lower, includeLower, upper, includeUpper);
    });
  }
}

extension NhathuocPurchaseQuerySortBy
    on QueryBuilder<NhathuocPurchase, NhathuocPurchase, QSortBy> {
  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      sortByDocumentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      sortByDocumentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      sortByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      sortByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      sortByPurchaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      sortByPurchaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }
}

extension NhathuocPurchaseQuerySortThenBy
    on QueryBuilder<NhathuocPurchase, NhathuocPurchase, QSortThenBy> {
  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      thenByDocumentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      thenByDocumentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      thenByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      thenByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      thenByPurchaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      thenByPurchaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QAfterSortBy>
      thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }
}

extension NhathuocPurchaseQueryWhereDistinct
    on QueryBuilder<NhathuocPurchase, NhathuocPurchase, QDistinct> {
  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QDistinct>
      distinctByDocumentCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QDistinct>
      distinctByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseDate');
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QDistinct>
      distinctByPurchaseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPurchase, NhathuocPurchase, QDistinct>
      distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }
}

extension NhathuocPurchaseQueryProperty
    on QueryBuilder<NhathuocPurchase, NhathuocPurchase, QQueryProperty> {
  QueryBuilder<NhathuocPurchase, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NhathuocPurchase, String, QQueryOperations>
      documentCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentCode');
    });
  }

  QueryBuilder<NhathuocPurchase, DateTime?, QQueryOperations>
      purchaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseDate');
    });
  }

  QueryBuilder<NhathuocPurchase, String, QQueryOperations>
      purchaseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseId');
    });
  }

  QueryBuilder<NhathuocPurchase, double, QQueryOperations>
      totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNhathuocPurchaseDetailCollection on Isar {
  IsarCollection<NhathuocPurchaseDetail> get nhathuocPurchaseDetails =>
      this.collection();
}

const NhathuocPurchaseDetailSchema = CollectionSchema(
  name: r'NhathuocPurchaseDetail',
  id: 1109367840923319746,
  properties: {
    r'batchNumber': PropertySchema(
      id: 0,
      name: r'batchNumber',
      type: IsarType.string,
    ),
    r'expiryDate': PropertySchema(
      id: 1,
      name: r'expiryDate',
      type: IsarType.dateTime,
    ),
    r'purchasePrice': PropertySchema(
      id: 2,
      name: r'purchasePrice',
      type: IsarType.double,
    ),
    r'quantity': PropertySchema(
      id: 3,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'totalAmount': PropertySchema(
      id: 4,
      name: r'totalAmount',
      type: IsarType.double,
    )
  },
  estimateSize: _nhathuocPurchaseDetailEstimateSize,
  serialize: _nhathuocPurchaseDetailSerialize,
  deserialize: _nhathuocPurchaseDetailDeserialize,
  deserializeProp: _nhathuocPurchaseDetailDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'purchase': LinkSchema(
      id: -2170088122333881674,
      name: r'purchase',
      target: r'NhathuocPurchase',
      single: true,
    ),
    r'medicine': LinkSchema(
      id: 6177042706683674227,
      name: r'medicine',
      target: r'NhathuocMedicine',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _nhathuocPurchaseDetailGetId,
  getLinks: _nhathuocPurchaseDetailGetLinks,
  attach: _nhathuocPurchaseDetailAttach,
  version: '3.1.0+1',
);

int _nhathuocPurchaseDetailEstimateSize(
  NhathuocPurchaseDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.batchNumber.length * 3;
  return bytesCount;
}

void _nhathuocPurchaseDetailSerialize(
  NhathuocPurchaseDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.batchNumber);
  writer.writeDateTime(offsets[1], object.expiryDate);
  writer.writeDouble(offsets[2], object.purchasePrice);
  writer.writeDouble(offsets[3], object.quantity);
  writer.writeDouble(offsets[4], object.totalAmount);
}

NhathuocPurchaseDetail _nhathuocPurchaseDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NhathuocPurchaseDetail();
  object.batchNumber = reader.readString(offsets[0]);
  object.expiryDate = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.purchasePrice = reader.readDouble(offsets[2]);
  object.quantity = reader.readDouble(offsets[3]);
  object.totalAmount = reader.readDouble(offsets[4]);
  return object;
}

P _nhathuocPurchaseDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nhathuocPurchaseDetailGetId(NhathuocPurchaseDetail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nhathuocPurchaseDetailGetLinks(
    NhathuocPurchaseDetail object) {
  return [object.purchase, object.medicine];
}

void _nhathuocPurchaseDetailAttach(
    IsarCollection<dynamic> col, Id id, NhathuocPurchaseDetail object) {
  object.id = id;
  object.purchase
      .attach(col, col.isar.collection<NhathuocPurchase>(), r'purchase', id);
  object.medicine
      .attach(col, col.isar.collection<NhathuocMedicine>(), r'medicine', id);
}

extension NhathuocPurchaseDetailQueryWhereSort
    on QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QWhere> {
  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NhathuocPurchaseDetailQueryWhere on QueryBuilder<
    NhathuocPurchaseDetail, NhathuocPurchaseDetail, QWhereClause> {
  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
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

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
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
}

extension NhathuocPurchaseDetailQueryFilter on QueryBuilder<
    NhathuocPurchaseDetail, NhathuocPurchaseDetail, QFilterCondition> {
  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> batchNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> batchNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> batchNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> batchNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batchNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> batchNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> batchNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
          QAfterFilterCondition>
      batchNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
          QAfterFilterCondition>
      batchNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'batchNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> batchNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> batchNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'batchNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> expiryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> expiryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> expiryDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> expiryDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> expiryDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> expiryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
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

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
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

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
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

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> purchasePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> purchasePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> purchasePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> purchasePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchasePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> quantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> quantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> quantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> quantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> totalAmountEqualTo(
    double value, {
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

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> totalAmountGreaterThan(
    double value, {
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

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> totalAmountLessThan(
    double value, {
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

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> totalAmountBetween(
    double lower,
    double upper, {
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
}

extension NhathuocPurchaseDetailQueryObject on QueryBuilder<
    NhathuocPurchaseDetail, NhathuocPurchaseDetail, QFilterCondition> {}

extension NhathuocPurchaseDetailQueryLinks on QueryBuilder<
    NhathuocPurchaseDetail, NhathuocPurchaseDetail, QFilterCondition> {
  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> purchase(FilterQuery<NhathuocPurchase> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'purchase');
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> purchaseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'purchase', 0, true, 0, true);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> medicine(FilterQuery<NhathuocMedicine> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'medicine');
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail,
      QAfterFilterCondition> medicineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'medicine', 0, true, 0, true);
    });
  }
}

extension NhathuocPurchaseDetailQuerySortBy
    on QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QSortBy> {
  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      sortByBatchNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      sortByBatchNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      sortByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      sortByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      sortByPurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      sortByPurchasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }
}

extension NhathuocPurchaseDetailQuerySortThenBy on QueryBuilder<
    NhathuocPurchaseDetail, NhathuocPurchaseDetail, QSortThenBy> {
  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenByBatchNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenByBatchNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenByPurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenByPurchasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QAfterSortBy>
      thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }
}

extension NhathuocPurchaseDetailQueryWhereDistinct
    on QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QDistinct> {
  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QDistinct>
      distinctByBatchNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QDistinct>
      distinctByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryDate');
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QDistinct>
      distinctByPurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchasePrice');
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, NhathuocPurchaseDetail, QDistinct>
      distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }
}

extension NhathuocPurchaseDetailQueryProperty on QueryBuilder<
    NhathuocPurchaseDetail, NhathuocPurchaseDetail, QQueryProperty> {
  QueryBuilder<NhathuocPurchaseDetail, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, String, QQueryOperations>
      batchNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchNumber');
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, DateTime?, QQueryOperations>
      expiryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryDate');
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, double, QQueryOperations>
      purchasePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchasePrice');
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, double, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<NhathuocPurchaseDetail, double, QQueryOperations>
      totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }
}
