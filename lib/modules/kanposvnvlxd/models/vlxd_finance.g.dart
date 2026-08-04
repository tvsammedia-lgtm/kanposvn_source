// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vlxd_finance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVlxdFinanceTransactionCollection on Isar {
  IsarCollection<VlxdFinanceTransaction> get vlxdFinanceTransactions =>
      this.collection();
}

const VlxdFinanceTransactionSchema = CollectionSchema(
  name: r'VlxdFinanceTransaction',
  id: 4046234722504993474,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
    ),
    r'createdBy': PropertySchema(
      id: 2,
      name: r'createdBy',
      type: IsarType.string,
    ),
    r'deletedAt': PropertySchema(
      id: 3,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'deviceId': PropertySchema(
      id: 5,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'documentCode': PropertySchema(
      id: 6,
      name: r'documentCode',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 7,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'paymentMethod': PropertySchema(
      id: 8,
      name: r'paymentMethod',
      type: IsarType.string,
    ),
    r'transactionDate': PropertySchema(
      id: 9,
      name: r'transactionDate',
      type: IsarType.dateTime,
    ),
    r'transactionId': PropertySchema(
      id: 10,
      name: r'transactionId',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 11,
      name: r'type',
      type: IsarType.byte,
      enumMap: _VlxdFinanceTransactiontypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 13,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _vlxdFinanceTransactionEstimateSize,
  serialize: _vlxdFinanceTransactionSerialize,
  deserialize: _vlxdFinanceTransactionDeserialize,
  deserializeProp: _vlxdFinanceTransactionDeserializeProp,
  idName: r'id',
  indexes: {
    r'transactionId': IndexSchema(
      id: 8561542235958051982,
      name: r'transactionId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'transactionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'customer': LinkSchema(
      id: 1625039701360142419,
      name: r'customer',
      target: r'VlxdCustomer',
      single: true,
    ),
    r'supplier': LinkSchema(
      id: 1234842011443879796,
      name: r'supplier',
      target: r'VlxdSupplier',
      single: true,
    ),
    r'order': LinkSchema(
      id: 2673498588645368176,
      name: r'order',
      target: r'VlxdOrder',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _vlxdFinanceTransactionGetId,
  getLinks: _vlxdFinanceTransactionGetLinks,
  attach: _vlxdFinanceTransactionAttach,
  version: '3.1.0+1',
);

int _vlxdFinanceTransactionEstimateSize(
  VlxdFinanceTransaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.createdBy.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.documentCode.length * 3;
  bytesCount += 3 + object.paymentMethod.length * 3;
  bytesCount += 3 + object.transactionId.length * 3;
  return bytesCount;
}

void _vlxdFinanceTransactionSerialize(
  VlxdFinanceTransaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.category);
  writer.writeString(offsets[2], object.createdBy);
  writer.writeDateTime(offsets[3], object.deletedAt);
  writer.writeString(offsets[4], object.description);
  writer.writeString(offsets[5], object.deviceId);
  writer.writeString(offsets[6], object.documentCode);
  writer.writeBool(offsets[7], object.isSynced);
  writer.writeString(offsets[8], object.paymentMethod);
  writer.writeDateTime(offsets[9], object.transactionDate);
  writer.writeString(offsets[10], object.transactionId);
  writer.writeByte(offsets[11], object.type.index);
  writer.writeDateTime(offsets[12], object.updatedAt);
  writer.writeLong(offsets[13], object.version);
}

VlxdFinanceTransaction _vlxdFinanceTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VlxdFinanceTransaction();
  object.amount = reader.readDouble(offsets[0]);
  object.category = reader.readString(offsets[1]);
  object.createdBy = reader.readString(offsets[2]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[3]);
  object.description = reader.readString(offsets[4]);
  object.deviceId = reader.readString(offsets[5]);
  object.documentCode = reader.readString(offsets[6]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[7]);
  object.paymentMethod = reader.readString(offsets[8]);
  object.transactionDate = reader.readDateTime(offsets[9]);
  object.transactionId = reader.readString(offsets[10]);
  object.type = _VlxdFinanceTransactiontypeValueEnumMap[
          reader.readByteOrNull(offsets[11])] ??
      FinanceTransactionType.RECEIPT;
  object.updatedAt = reader.readDateTime(offsets[12]);
  object.version = reader.readLong(offsets[13]);
  return object;
}

P _vlxdFinanceTransactionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (_VlxdFinanceTransactiontypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          FinanceTransactionType.RECEIPT) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VlxdFinanceTransactiontypeEnumValueMap = {
  'RECEIPT': 0,
  'PAYMENT': 1,
};
const _VlxdFinanceTransactiontypeValueEnumMap = {
  0: FinanceTransactionType.RECEIPT,
  1: FinanceTransactionType.PAYMENT,
};

Id _vlxdFinanceTransactionGetId(VlxdFinanceTransaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vlxdFinanceTransactionGetLinks(
    VlxdFinanceTransaction object) {
  return [object.customer, object.supplier, object.order];
}

void _vlxdFinanceTransactionAttach(
    IsarCollection<dynamic> col, Id id, VlxdFinanceTransaction object) {
  object.id = id;
  object.customer
      .attach(col, col.isar.collection<VlxdCustomer>(), r'customer', id);
  object.supplier
      .attach(col, col.isar.collection<VlxdSupplier>(), r'supplier', id);
  object.order.attach(col, col.isar.collection<VlxdOrder>(), r'order', id);
}

extension VlxdFinanceTransactionByIndex
    on IsarCollection<VlxdFinanceTransaction> {
  Future<VlxdFinanceTransaction?> getByTransactionId(String transactionId) {
    return getByIndex(r'transactionId', [transactionId]);
  }

  VlxdFinanceTransaction? getByTransactionIdSync(String transactionId) {
    return getByIndexSync(r'transactionId', [transactionId]);
  }

  Future<bool> deleteByTransactionId(String transactionId) {
    return deleteByIndex(r'transactionId', [transactionId]);
  }

  bool deleteByTransactionIdSync(String transactionId) {
    return deleteByIndexSync(r'transactionId', [transactionId]);
  }

  Future<List<VlxdFinanceTransaction?>> getAllByTransactionId(
      List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'transactionId', values);
  }

  List<VlxdFinanceTransaction?> getAllByTransactionIdSync(
      List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'transactionId', values);
  }

  Future<int> deleteAllByTransactionId(List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'transactionId', values);
  }

  int deleteAllByTransactionIdSync(List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'transactionId', values);
  }

  Future<Id> putByTransactionId(VlxdFinanceTransaction object) {
    return putByIndex(r'transactionId', object);
  }

  Id putByTransactionIdSync(VlxdFinanceTransaction object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'transactionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTransactionId(List<VlxdFinanceTransaction> objects) {
    return putAllByIndex(r'transactionId', objects);
  }

  List<Id> putAllByTransactionIdSync(List<VlxdFinanceTransaction> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'transactionId', objects, saveLinks: saveLinks);
  }
}

extension VlxdFinanceTransactionQueryWhereSort
    on QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QWhere> {
  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VlxdFinanceTransactionQueryWhere on QueryBuilder<
    VlxdFinanceTransaction, VlxdFinanceTransaction, QWhereClause> {
  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterWhereClause> transactionIdEqualTo(String transactionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transactionId',
        value: [transactionId],
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterWhereClause> transactionIdNotEqualTo(String transactionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [],
              upper: [transactionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [transactionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [transactionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [],
              upper: [transactionId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VlxdFinanceTransactionQueryFilter on QueryBuilder<
    VlxdFinanceTransaction, VlxdFinanceTransaction, QFilterCondition> {
  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> createdByEqualTo(
    String value, {
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> createdByGreaterThan(
    String value, {
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> createdByLessThan(
    String value, {
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> createdByBetween(
    String lower,
    String upper, {
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> createdByStartsWith(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> createdByEndsWith(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      createdByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      createdByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> createdByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> createdByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deletedAtGreaterThan(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deviceIdEqualTo(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deviceIdGreaterThan(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deviceIdLessThan(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deviceIdBetween(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deviceIdStartsWith(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deviceIdEndsWith(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> documentCodeEqualTo(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> documentCodeGreaterThan(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> documentCodeLessThan(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> documentCodeBetween(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> documentCodeStartsWith(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> documentCodeEndsWith(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      documentCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      documentCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> documentCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> documentCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> paymentMethodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> paymentMethodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> paymentMethodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> paymentMethodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> paymentMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> paymentMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      paymentMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      paymentMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> paymentMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> paymentMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      transactionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
          QAfterFilterCondition>
      transactionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> transactionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> typeEqualTo(FinanceTransactionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> typeGreaterThan(
    FinanceTransactionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> typeLessThan(
    FinanceTransactionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> typeBetween(
    FinanceTransactionType lower,
    FinanceTransactionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> versionGreaterThan(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> versionBetween(
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

extension VlxdFinanceTransactionQueryObject on QueryBuilder<
    VlxdFinanceTransaction, VlxdFinanceTransaction, QFilterCondition> {}

extension VlxdFinanceTransactionQueryLinks on QueryBuilder<
    VlxdFinanceTransaction, VlxdFinanceTransaction, QFilterCondition> {
  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> customer(FilterQuery<VlxdCustomer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customer');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customer', 0, true, 0, true);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> supplier(FilterQuery<VlxdSupplier> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'supplier');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> supplierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'supplier', 0, true, 0, true);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> order(FilterQuery<VlxdOrder> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'order');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction,
      QAfterFilterCondition> orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'order', 0, true, 0, true);
    });
  }
}

extension VlxdFinanceTransactionQuerySortBy
    on QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QSortBy> {
  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByDocumentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByDocumentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension VlxdFinanceTransactionQuerySortThenBy on QueryBuilder<
    VlxdFinanceTransaction, VlxdFinanceTransaction, QSortThenBy> {
  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByDocumentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByDocumentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension VlxdFinanceTransactionQueryWhereDistinct
    on QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct> {
  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByCreatedBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByDocumentCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByPaymentMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionDate');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByTransactionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, VlxdFinanceTransaction, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension VlxdFinanceTransactionQueryProperty on QueryBuilder<
    VlxdFinanceTransaction, VlxdFinanceTransaction, QQueryProperty> {
  QueryBuilder<VlxdFinanceTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, double, QQueryOperations>
      amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, String, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, String, QQueryOperations>
      createdByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdBy');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, String, QQueryOperations>
      documentCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentCode');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, String, QQueryOperations>
      paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, DateTime, QQueryOperations>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionDate');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, String, QQueryOperations>
      transactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionId');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, FinanceTransactionType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<VlxdFinanceTransaction, int, QQueryOperations>
      versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
