// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gara_inventory.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGaraInventoryTransactionCollection on Isar {
  IsarCollection<GaraInventoryTransaction> get garaInventoryTransactions =>
      this.collection();
}

const GaraInventoryTransactionSchema = CollectionSchema(
  name: r'GaraInventoryTransaction',
  id: -4252903795978117644,
  properties: {
    r'documentCode': PropertySchema(
      id: 0,
      name: r'documentCode',
      type: IsarType.string,
    ),
    r'transactionDate': PropertySchema(
      id: 1,
      name: r'transactionDate',
      type: IsarType.dateTime,
    ),
    r'transactionId': PropertySchema(
      id: 2,
      name: r'transactionId',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 3,
      name: r'type',
      type: IsarType.byte,
      enumMap: _GaraInventoryTransactiontypeEnumValueMap,
    )
  },
  estimateSize: _garaInventoryTransactionEstimateSize,
  serialize: _garaInventoryTransactionSerialize,
  deserialize: _garaInventoryTransactionDeserialize,
  deserializeProp: _garaInventoryTransactionDeserializeProp,
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
    r'details': LinkSchema(
      id: -6658876875365319851,
      name: r'details',
      target: r'GaraInventoryDetail',
      single: false,
      linkName: r'transaction',
    )
  },
  embeddedSchemas: {},
  getId: _garaInventoryTransactionGetId,
  getLinks: _garaInventoryTransactionGetLinks,
  attach: _garaInventoryTransactionAttach,
  version: '3.1.0+1',
);

int _garaInventoryTransactionEstimateSize(
  GaraInventoryTransaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.documentCode.length * 3;
  bytesCount += 3 + object.transactionId.length * 3;
  return bytesCount;
}

void _garaInventoryTransactionSerialize(
  GaraInventoryTransaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.documentCode);
  writer.writeDateTime(offsets[1], object.transactionDate);
  writer.writeString(offsets[2], object.transactionId);
  writer.writeByte(offsets[3], object.type.index);
}

GaraInventoryTransaction _garaInventoryTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GaraInventoryTransaction();
  object.documentCode = reader.readString(offsets[0]);
  object.id = id;
  object.transactionDate = reader.readDateTimeOrNull(offsets[1]);
  object.transactionId = reader.readString(offsets[2]);
  object.type = _GaraInventoryTransactiontypeValueEnumMap[
          reader.readByteOrNull(offsets[3])] ??
      GaraInventoryTransactionType.IMPORT;
  return object;
}

P _garaInventoryTransactionDeserializeProp<P>(
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
      return (_GaraInventoryTransactiontypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          GaraInventoryTransactionType.IMPORT) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _GaraInventoryTransactiontypeEnumValueMap = {
  'IMPORT': 0,
  'EXPORT': 1,
};
const _GaraInventoryTransactiontypeValueEnumMap = {
  0: GaraInventoryTransactionType.IMPORT,
  1: GaraInventoryTransactionType.EXPORT,
};

Id _garaInventoryTransactionGetId(GaraInventoryTransaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _garaInventoryTransactionGetLinks(
    GaraInventoryTransaction object) {
  return [object.details];
}

void _garaInventoryTransactionAttach(
    IsarCollection<dynamic> col, Id id, GaraInventoryTransaction object) {
  object.id = id;
  object.details
      .attach(col, col.isar.collection<GaraInventoryDetail>(), r'details', id);
}

extension GaraInventoryTransactionByIndex
    on IsarCollection<GaraInventoryTransaction> {
  Future<GaraInventoryTransaction?> getByTransactionId(String transactionId) {
    return getByIndex(r'transactionId', [transactionId]);
  }

  GaraInventoryTransaction? getByTransactionIdSync(String transactionId) {
    return getByIndexSync(r'transactionId', [transactionId]);
  }

  Future<bool> deleteByTransactionId(String transactionId) {
    return deleteByIndex(r'transactionId', [transactionId]);
  }

  bool deleteByTransactionIdSync(String transactionId) {
    return deleteByIndexSync(r'transactionId', [transactionId]);
  }

  Future<List<GaraInventoryTransaction?>> getAllByTransactionId(
      List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'transactionId', values);
  }

  List<GaraInventoryTransaction?> getAllByTransactionIdSync(
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

  Future<Id> putByTransactionId(GaraInventoryTransaction object) {
    return putByIndex(r'transactionId', object);
  }

  Id putByTransactionIdSync(GaraInventoryTransaction object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'transactionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTransactionId(
      List<GaraInventoryTransaction> objects) {
    return putAllByIndex(r'transactionId', objects);
  }

  List<Id> putAllByTransactionIdSync(List<GaraInventoryTransaction> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'transactionId', objects, saveLinks: saveLinks);
  }
}

extension GaraInventoryTransactionQueryWhereSort on QueryBuilder<
    GaraInventoryTransaction, GaraInventoryTransaction, QWhere> {
  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GaraInventoryTransactionQueryWhere on QueryBuilder<
    GaraInventoryTransaction, GaraInventoryTransaction, QWhereClause> {
  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterWhereClause> transactionIdEqualTo(String transactionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transactionId',
        value: [transactionId],
      ));
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

extension GaraInventoryTransactionQueryFilter on QueryBuilder<
    GaraInventoryTransaction, GaraInventoryTransaction, QFilterCondition> {
  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> documentCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> documentCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> transactionDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionDate',
      ));
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> transactionDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionDate',
      ));
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> transactionDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> transactionDateGreaterThan(
    DateTime? value, {
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> transactionDateLessThan(
    DateTime? value, {
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> transactionDateBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> transactionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> transactionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> typeEqualTo(GaraInventoryTransactionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> typeGreaterThan(
    GaraInventoryTransactionType value, {
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> typeLessThan(
    GaraInventoryTransactionType value, {
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

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> typeBetween(
    GaraInventoryTransactionType lower,
    GaraInventoryTransactionType upper, {
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
}

extension GaraInventoryTransactionQueryObject on QueryBuilder<
    GaraInventoryTransaction, GaraInventoryTransaction, QFilterCondition> {}

extension GaraInventoryTransactionQueryLinks on QueryBuilder<
    GaraInventoryTransaction, GaraInventoryTransaction, QFilterCondition> {
  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> details(FilterQuery<GaraInventoryDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'details');
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> detailsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', length, true, length, true);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> detailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, true, 0, true);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> detailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, false, 999999, true);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> detailsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, true, length, include);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> detailsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', length, include, 999999, true);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction,
      QAfterFilterCondition> detailsLengthBetween(
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

extension GaraInventoryTransactionQuerySortBy on QueryBuilder<
    GaraInventoryTransaction, GaraInventoryTransaction, QSortBy> {
  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      sortByDocumentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      sortByDocumentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      sortByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      sortByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      sortByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      sortByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension GaraInventoryTransactionQuerySortThenBy on QueryBuilder<
    GaraInventoryTransaction, GaraInventoryTransaction, QSortThenBy> {
  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      thenByDocumentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      thenByDocumentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      thenByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      thenByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      thenByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      thenByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension GaraInventoryTransactionQueryWhereDistinct on QueryBuilder<
    GaraInventoryTransaction, GaraInventoryTransaction, QDistinct> {
  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QDistinct>
      distinctByDocumentCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QDistinct>
      distinctByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionDate');
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QDistinct>
      distinctByTransactionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransaction, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension GaraInventoryTransactionQueryProperty on QueryBuilder<
    GaraInventoryTransaction, GaraInventoryTransaction, QQueryProperty> {
  QueryBuilder<GaraInventoryTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GaraInventoryTransaction, String, QQueryOperations>
      documentCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentCode');
    });
  }

  QueryBuilder<GaraInventoryTransaction, DateTime?, QQueryOperations>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionDate');
    });
  }

  QueryBuilder<GaraInventoryTransaction, String, QQueryOperations>
      transactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionId');
    });
  }

  QueryBuilder<GaraInventoryTransaction, GaraInventoryTransactionType,
      QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGaraInventoryDetailCollection on Isar {
  IsarCollection<GaraInventoryDetail> get garaInventoryDetails =>
      this.collection();
}

const GaraInventoryDetailSchema = CollectionSchema(
  name: r'GaraInventoryDetail',
  id: -913327653564977119,
  properties: {
    r'quantity': PropertySchema(
      id: 0,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'totalAmount': PropertySchema(
      id: 1,
      name: r'totalAmount',
      type: IsarType.double,
    ),
    r'unitPrice': PropertySchema(
      id: 2,
      name: r'unitPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _garaInventoryDetailEstimateSize,
  serialize: _garaInventoryDetailSerialize,
  deserialize: _garaInventoryDetailDeserialize,
  deserializeProp: _garaInventoryDetailDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'transaction': LinkSchema(
      id: 3198002065962733987,
      name: r'transaction',
      target: r'GaraInventoryTransaction',
      single: true,
    ),
    r'product': LinkSchema(
      id: 7258556408160033686,
      name: r'product',
      target: r'GaraProduct',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _garaInventoryDetailGetId,
  getLinks: _garaInventoryDetailGetLinks,
  attach: _garaInventoryDetailAttach,
  version: '3.1.0+1',
);

int _garaInventoryDetailEstimateSize(
  GaraInventoryDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _garaInventoryDetailSerialize(
  GaraInventoryDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.quantity);
  writer.writeDouble(offsets[1], object.totalAmount);
  writer.writeDouble(offsets[2], object.unitPrice);
}

GaraInventoryDetail _garaInventoryDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GaraInventoryDetail();
  object.id = id;
  object.quantity = reader.readDouble(offsets[0]);
  object.totalAmount = reader.readDouble(offsets[1]);
  object.unitPrice = reader.readDouble(offsets[2]);
  return object;
}

P _garaInventoryDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _garaInventoryDetailGetId(GaraInventoryDetail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _garaInventoryDetailGetLinks(
    GaraInventoryDetail object) {
  return [object.transaction, object.product];
}

void _garaInventoryDetailAttach(
    IsarCollection<dynamic> col, Id id, GaraInventoryDetail object) {
  object.id = id;
  object.transaction.attach(
      col, col.isar.collection<GaraInventoryTransaction>(), r'transaction', id);
  object.product
      .attach(col, col.isar.collection<GaraProduct>(), r'product', id);
}

extension GaraInventoryDetailQueryWhereSort
    on QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QWhere> {
  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GaraInventoryDetailQueryWhere
    on QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QWhereClause> {
  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterWhereClause>
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterWhereClause>
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

extension GaraInventoryDetailQueryFilter on QueryBuilder<GaraInventoryDetail,
    GaraInventoryDetail, QFilterCondition> {
  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      quantityEqualTo(
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      quantityGreaterThan(
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      quantityLessThan(
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      quantityBetween(
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      unitPriceEqualTo(
    double value, {
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      unitPriceGreaterThan(
    double value, {
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      unitPriceLessThan(
    double value, {
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

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      unitPriceBetween(
    double lower,
    double upper, {
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

extension GaraInventoryDetailQueryObject on QueryBuilder<GaraInventoryDetail,
    GaraInventoryDetail, QFilterCondition> {}

extension GaraInventoryDetailQueryLinks on QueryBuilder<GaraInventoryDetail,
    GaraInventoryDetail, QFilterCondition> {
  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      transaction(FilterQuery<GaraInventoryTransaction> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'transaction');
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      transactionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transaction', 0, true, 0, true);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      product(FilterQuery<GaraProduct> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'product');
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'product', 0, true, 0, true);
    });
  }
}

extension GaraInventoryDetailQuerySortBy
    on QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QSortBy> {
  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension GaraInventoryDetailQuerySortThenBy
    on QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QSortThenBy> {
  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QAfterSortBy>
      thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension GaraInventoryDetailQueryWhereDistinct
    on QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QDistinct> {
  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QDistinct>
      distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }

  QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QDistinct>
      distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }
}

extension GaraInventoryDetailQueryProperty
    on QueryBuilder<GaraInventoryDetail, GaraInventoryDetail, QQueryProperty> {
  QueryBuilder<GaraInventoryDetail, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GaraInventoryDetail, double, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<GaraInventoryDetail, double, QQueryOperations>
      totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }

  QueryBuilder<GaraInventoryDetail, double, QQueryOperations>
      unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }
}
