// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_finance_accounting.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHotelCashTransactionCollection on Isar {
  IsarCollection<HotelCashTransaction> get hotelCashTransactions =>
      this.collection();
}

const HotelCashTransactionSchema = CollectionSchema(
  name: r'HotelCashTransaction',
  id: -7040888031647496740,
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
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'createdBy': PropertySchema(
      id: 3,
      name: r'createdBy',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'referenceId': PropertySchema(
      id: 5,
      name: r'referenceId',
      type: IsarType.string,
    ),
    r'transactionId': PropertySchema(
      id: 6,
      name: r'transactionId',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 7,
      name: r'type',
      type: IsarType.byte,
      enumMap: _HotelCashTransactiontypeEnumValueMap,
    )
  },
  estimateSize: _hotelCashTransactionEstimateSize,
  serialize: _hotelCashTransactionSerialize,
  deserialize: _hotelCashTransactionDeserialize,
  deserializeProp: _hotelCashTransactionDeserializeProp,
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
  links: {},
  embeddedSchemas: {},
  getId: _hotelCashTransactionGetId,
  getLinks: _hotelCashTransactionGetLinks,
  attach: _hotelCashTransactionAttach,
  version: '3.1.0+1',
);

int _hotelCashTransactionEstimateSize(
  HotelCashTransaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.createdBy.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.referenceId.length * 3;
  bytesCount += 3 + object.transactionId.length * 3;
  return bytesCount;
}

void _hotelCashTransactionSerialize(
  HotelCashTransaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.category);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.createdBy);
  writer.writeString(offsets[4], object.description);
  writer.writeString(offsets[5], object.referenceId);
  writer.writeString(offsets[6], object.transactionId);
  writer.writeByte(offsets[7], object.type.index);
}

HotelCashTransaction _hotelCashTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HotelCashTransaction();
  object.amount = reader.readDouble(offsets[0]);
  object.category = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.createdBy = reader.readString(offsets[3]);
  object.description = reader.readString(offsets[4]);
  object.id = id;
  object.referenceId = reader.readString(offsets[5]);
  object.transactionId = reader.readString(offsets[6]);
  object.type = _HotelCashTransactiontypeValueEnumMap[
          reader.readByteOrNull(offsets[7])] ??
      CashTransactionType.INCOME;
  return object;
}

P _hotelCashTransactionDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_HotelCashTransactiontypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          CashTransactionType.INCOME) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _HotelCashTransactiontypeEnumValueMap = {
  'INCOME': 0,
  'EXPENSE': 1,
};
const _HotelCashTransactiontypeValueEnumMap = {
  0: CashTransactionType.INCOME,
  1: CashTransactionType.EXPENSE,
};

Id _hotelCashTransactionGetId(HotelCashTransaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _hotelCashTransactionGetLinks(
    HotelCashTransaction object) {
  return [];
}

void _hotelCashTransactionAttach(
    IsarCollection<dynamic> col, Id id, HotelCashTransaction object) {
  object.id = id;
}

extension HotelCashTransactionByIndex on IsarCollection<HotelCashTransaction> {
  Future<HotelCashTransaction?> getByTransactionId(String transactionId) {
    return getByIndex(r'transactionId', [transactionId]);
  }

  HotelCashTransaction? getByTransactionIdSync(String transactionId) {
    return getByIndexSync(r'transactionId', [transactionId]);
  }

  Future<bool> deleteByTransactionId(String transactionId) {
    return deleteByIndex(r'transactionId', [transactionId]);
  }

  bool deleteByTransactionIdSync(String transactionId) {
    return deleteByIndexSync(r'transactionId', [transactionId]);
  }

  Future<List<HotelCashTransaction?>> getAllByTransactionId(
      List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'transactionId', values);
  }

  List<HotelCashTransaction?> getAllByTransactionIdSync(
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

  Future<Id> putByTransactionId(HotelCashTransaction object) {
    return putByIndex(r'transactionId', object);
  }

  Id putByTransactionIdSync(HotelCashTransaction object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'transactionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTransactionId(List<HotelCashTransaction> objects) {
    return putAllByIndex(r'transactionId', objects);
  }

  List<Id> putAllByTransactionIdSync(List<HotelCashTransaction> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'transactionId', objects, saveLinks: saveLinks);
  }
}

extension HotelCashTransactionQueryWhereSort
    on QueryBuilder<HotelCashTransaction, HotelCashTransaction, QWhere> {
  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HotelCashTransactionQueryWhere
    on QueryBuilder<HotelCashTransaction, HotelCashTransaction, QWhereClause> {
  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterWhereClause>
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterWhereClause>
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterWhereClause>
      transactionIdEqualTo(String transactionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transactionId',
        value: [transactionId],
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterWhereClause>
      transactionIdNotEqualTo(String transactionId) {
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

extension HotelCashTransactionQueryFilter on QueryBuilder<HotelCashTransaction,
    HotelCashTransaction, QFilterCondition> {
  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> createdByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> createdByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> referenceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> referenceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> referenceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> referenceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> referenceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> referenceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
          QAfterFilterCondition>
      referenceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
          QAfterFilterCondition>
      referenceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> referenceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> referenceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> transactionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> transactionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> typeEqualTo(CashTransactionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> typeGreaterThan(
    CashTransactionType value, {
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> typeLessThan(
    CashTransactionType value, {
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

  QueryBuilder<HotelCashTransaction, HotelCashTransaction,
      QAfterFilterCondition> typeBetween(
    CashTransactionType lower,
    CashTransactionType upper, {
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

extension HotelCashTransactionQueryObject on QueryBuilder<HotelCashTransaction,
    HotelCashTransaction, QFilterCondition> {}

extension HotelCashTransactionQueryLinks on QueryBuilder<HotelCashTransaction,
    HotelCashTransaction, QFilterCondition> {}

extension HotelCashTransactionQuerySortBy
    on QueryBuilder<HotelCashTransaction, HotelCashTransaction, QSortBy> {
  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension HotelCashTransactionQuerySortThenBy
    on QueryBuilder<HotelCashTransaction, HotelCashTransaction, QSortThenBy> {
  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension HotelCashTransactionQueryWhereDistinct
    on QueryBuilder<HotelCashTransaction, HotelCashTransaction, QDistinct> {
  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QDistinct>
      distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QDistinct>
      distinctByCreatedBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QDistinct>
      distinctByReferenceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QDistinct>
      distinctByTransactionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelCashTransaction, HotelCashTransaction, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension HotelCashTransactionQueryProperty on QueryBuilder<
    HotelCashTransaction, HotelCashTransaction, QQueryProperty> {
  QueryBuilder<HotelCashTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HotelCashTransaction, double, QQueryOperations>
      amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<HotelCashTransaction, String, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<HotelCashTransaction, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<HotelCashTransaction, String, QQueryOperations>
      createdByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdBy');
    });
  }

  QueryBuilder<HotelCashTransaction, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<HotelCashTransaction, String, QQueryOperations>
      referenceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceId');
    });
  }

  QueryBuilder<HotelCashTransaction, String, QQueryOperations>
      transactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionId');
    });
  }

  QueryBuilder<HotelCashTransaction, CashTransactionType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHotelShiftReportCollection on Isar {
  IsarCollection<HotelShiftReport> get hotelShiftReports => this.collection();
}

const HotelShiftReportSchema = CollectionSchema(
  name: r'HotelShiftReport',
  id: 6155560072999551684,
  properties: {
    r'difference': PropertySchema(
      id: 0,
      name: r'difference',
      type: IsarType.double,
    ),
    r'employeeName': PropertySchema(
      id: 1,
      name: r'employeeName',
      type: IsarType.string,
    ),
    r'endTime': PropertySchema(
      id: 2,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'endingCash': PropertySchema(
      id: 3,
      name: r'endingCash',
      type: IsarType.double,
    ),
    r'isClosed': PropertySchema(
      id: 4,
      name: r'isClosed',
      type: IsarType.bool,
    ),
    r'note': PropertySchema(
      id: 5,
      name: r'note',
      type: IsarType.string,
    ),
    r'reportId': PropertySchema(
      id: 6,
      name: r'reportId',
      type: IsarType.string,
    ),
    r'shiftName': PropertySchema(
      id: 7,
      name: r'shiftName',
      type: IsarType.string,
    ),
    r'startTime': PropertySchema(
      id: 8,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'startingCash': PropertySchema(
      id: 9,
      name: r'startingCash',
      type: IsarType.double,
    ),
    r'totalCashExpense': PropertySchema(
      id: 10,
      name: r'totalCashExpense',
      type: IsarType.double,
    ),
    r'totalCashIncome': PropertySchema(
      id: 11,
      name: r'totalCashIncome',
      type: IsarType.double,
    )
  },
  estimateSize: _hotelShiftReportEstimateSize,
  serialize: _hotelShiftReportSerialize,
  deserialize: _hotelShiftReportDeserialize,
  deserializeProp: _hotelShiftReportDeserializeProp,
  idName: r'id',
  indexes: {
    r'reportId': IndexSchema(
      id: 1732854644896652467,
      name: r'reportId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'reportId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _hotelShiftReportGetId,
  getLinks: _hotelShiftReportGetLinks,
  attach: _hotelShiftReportAttach,
  version: '3.1.0+1',
);

int _hotelShiftReportEstimateSize(
  HotelShiftReport object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.employeeName.length * 3;
  bytesCount += 3 + object.note.length * 3;
  bytesCount += 3 + object.reportId.length * 3;
  bytesCount += 3 + object.shiftName.length * 3;
  return bytesCount;
}

void _hotelShiftReportSerialize(
  HotelShiftReport object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.difference);
  writer.writeString(offsets[1], object.employeeName);
  writer.writeDateTime(offsets[2], object.endTime);
  writer.writeDouble(offsets[3], object.endingCash);
  writer.writeBool(offsets[4], object.isClosed);
  writer.writeString(offsets[5], object.note);
  writer.writeString(offsets[6], object.reportId);
  writer.writeString(offsets[7], object.shiftName);
  writer.writeDateTime(offsets[8], object.startTime);
  writer.writeDouble(offsets[9], object.startingCash);
  writer.writeDouble(offsets[10], object.totalCashExpense);
  writer.writeDouble(offsets[11], object.totalCashIncome);
}

HotelShiftReport _hotelShiftReportDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HotelShiftReport();
  object.difference = reader.readDouble(offsets[0]);
  object.employeeName = reader.readString(offsets[1]);
  object.endTime = reader.readDateTimeOrNull(offsets[2]);
  object.endingCash = reader.readDouble(offsets[3]);
  object.id = id;
  object.isClosed = reader.readBool(offsets[4]);
  object.note = reader.readString(offsets[5]);
  object.reportId = reader.readString(offsets[6]);
  object.shiftName = reader.readString(offsets[7]);
  object.startTime = reader.readDateTime(offsets[8]);
  object.startingCash = reader.readDouble(offsets[9]);
  object.totalCashExpense = reader.readDouble(offsets[10]);
  object.totalCashIncome = reader.readDouble(offsets[11]);
  return object;
}

P _hotelShiftReportDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _hotelShiftReportGetId(HotelShiftReport object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _hotelShiftReportGetLinks(HotelShiftReport object) {
  return [];
}

void _hotelShiftReportAttach(
    IsarCollection<dynamic> col, Id id, HotelShiftReport object) {
  object.id = id;
}

extension HotelShiftReportByIndex on IsarCollection<HotelShiftReport> {
  Future<HotelShiftReport?> getByReportId(String reportId) {
    return getByIndex(r'reportId', [reportId]);
  }

  HotelShiftReport? getByReportIdSync(String reportId) {
    return getByIndexSync(r'reportId', [reportId]);
  }

  Future<bool> deleteByReportId(String reportId) {
    return deleteByIndex(r'reportId', [reportId]);
  }

  bool deleteByReportIdSync(String reportId) {
    return deleteByIndexSync(r'reportId', [reportId]);
  }

  Future<List<HotelShiftReport?>> getAllByReportId(
      List<String> reportIdValues) {
    final values = reportIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'reportId', values);
  }

  List<HotelShiftReport?> getAllByReportIdSync(List<String> reportIdValues) {
    final values = reportIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'reportId', values);
  }

  Future<int> deleteAllByReportId(List<String> reportIdValues) {
    final values = reportIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'reportId', values);
  }

  int deleteAllByReportIdSync(List<String> reportIdValues) {
    final values = reportIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'reportId', values);
  }

  Future<Id> putByReportId(HotelShiftReport object) {
    return putByIndex(r'reportId', object);
  }

  Id putByReportIdSync(HotelShiftReport object, {bool saveLinks = true}) {
    return putByIndexSync(r'reportId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByReportId(List<HotelShiftReport> objects) {
    return putAllByIndex(r'reportId', objects);
  }

  List<Id> putAllByReportIdSync(List<HotelShiftReport> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'reportId', objects, saveLinks: saveLinks);
  }
}

extension HotelShiftReportQueryWhereSort
    on QueryBuilder<HotelShiftReport, HotelShiftReport, QWhere> {
  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HotelShiftReportQueryWhere
    on QueryBuilder<HotelShiftReport, HotelShiftReport, QWhereClause> {
  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterWhereClause>
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

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterWhereClause> idBetween(
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

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterWhereClause>
      reportIdEqualTo(String reportId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reportId',
        value: [reportId],
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterWhereClause>
      reportIdNotEqualTo(String reportId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportId',
              lower: [],
              upper: [reportId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportId',
              lower: [reportId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportId',
              lower: [reportId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportId',
              lower: [],
              upper: [reportId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension HotelShiftReportQueryFilter
    on QueryBuilder<HotelShiftReport, HotelShiftReport, QFilterCondition> {
  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      differenceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      differenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'difference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      differenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'difference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      differenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'difference',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      employeeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      employeeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      employeeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      employeeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      employeeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      employeeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      employeeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      employeeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'employeeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      employeeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      employeeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      endingCashEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endingCash',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      endingCashGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endingCash',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      endingCashLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endingCash',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      endingCashBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endingCash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
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

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
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

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
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

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      isClosedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isClosed',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      noteEqualTo(
    String value, {
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

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      noteGreaterThan(
    String value, {
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

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      noteLessThan(
    String value, {
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

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      noteBetween(
    String lower,
    String upper, {
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

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      noteStartsWith(
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

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      noteEndsWith(
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

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      reportIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reportId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      reportIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reportId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      reportIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reportId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      reportIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reportId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      reportIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reportId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      reportIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reportId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      reportIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reportId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      reportIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reportId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      reportIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reportId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      reportIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reportId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      shiftNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shiftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      shiftNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shiftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      shiftNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shiftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      shiftNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shiftName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      shiftNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shiftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      shiftNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shiftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      shiftNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shiftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      shiftNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shiftName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      shiftNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shiftName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      shiftNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shiftName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      startingCashEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startingCash',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      startingCashGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startingCash',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      startingCashLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startingCash',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      startingCashBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startingCash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      totalCashExpenseEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCashExpense',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      totalCashExpenseGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCashExpense',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      totalCashExpenseLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCashExpense',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      totalCashExpenseBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCashExpense',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      totalCashIncomeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCashIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      totalCashIncomeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCashIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      totalCashIncomeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCashIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterFilterCondition>
      totalCashIncomeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCashIncome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension HotelShiftReportQueryObject
    on QueryBuilder<HotelShiftReport, HotelShiftReport, QFilterCondition> {}

extension HotelShiftReportQueryLinks
    on QueryBuilder<HotelShiftReport, HotelShiftReport, QFilterCondition> {}

extension HotelShiftReportQuerySortBy
    on QueryBuilder<HotelShiftReport, HotelShiftReport, QSortBy> {
  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difference', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difference', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByEndingCash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endingCash', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByEndingCashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endingCash', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByIsClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClosed', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByIsClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClosed', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByReportId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportId', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByReportIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportId', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByShiftName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shiftName', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByShiftNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shiftName', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByStartingCash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingCash', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByStartingCashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingCash', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByTotalCashExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCashExpense', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByTotalCashExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCashExpense', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByTotalCashIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCashIncome', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      sortByTotalCashIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCashIncome', Sort.desc);
    });
  }
}

extension HotelShiftReportQuerySortThenBy
    on QueryBuilder<HotelShiftReport, HotelShiftReport, QSortThenBy> {
  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difference', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difference', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByEndingCash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endingCash', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByEndingCashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endingCash', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByIsClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClosed', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByIsClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClosed', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByReportId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportId', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByReportIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportId', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByShiftName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shiftName', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByShiftNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shiftName', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByStartingCash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingCash', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByStartingCashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingCash', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByTotalCashExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCashExpense', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByTotalCashExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCashExpense', Sort.desc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByTotalCashIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCashIncome', Sort.asc);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QAfterSortBy>
      thenByTotalCashIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCashIncome', Sort.desc);
    });
  }
}

extension HotelShiftReportQueryWhereDistinct
    on QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct> {
  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct>
      distinctByDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difference');
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct>
      distinctByEmployeeName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct>
      distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct>
      distinctByEndingCash() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endingCash');
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct>
      distinctByIsClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isClosed');
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct>
      distinctByReportId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reportId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct>
      distinctByShiftName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shiftName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct>
      distinctByStartingCash() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startingCash');
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct>
      distinctByTotalCashExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCashExpense');
    });
  }

  QueryBuilder<HotelShiftReport, HotelShiftReport, QDistinct>
      distinctByTotalCashIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCashIncome');
    });
  }
}

extension HotelShiftReportQueryProperty
    on QueryBuilder<HotelShiftReport, HotelShiftReport, QQueryProperty> {
  QueryBuilder<HotelShiftReport, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HotelShiftReport, double, QQueryOperations>
      differenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difference');
    });
  }

  QueryBuilder<HotelShiftReport, String, QQueryOperations>
      employeeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeName');
    });
  }

  QueryBuilder<HotelShiftReport, DateTime?, QQueryOperations>
      endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<HotelShiftReport, double, QQueryOperations>
      endingCashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endingCash');
    });
  }

  QueryBuilder<HotelShiftReport, bool, QQueryOperations> isClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isClosed');
    });
  }

  QueryBuilder<HotelShiftReport, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<HotelShiftReport, String, QQueryOperations> reportIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reportId');
    });
  }

  QueryBuilder<HotelShiftReport, String, QQueryOperations> shiftNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shiftName');
    });
  }

  QueryBuilder<HotelShiftReport, DateTime, QQueryOperations>
      startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<HotelShiftReport, double, QQueryOperations>
      startingCashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startingCash');
    });
  }

  QueryBuilder<HotelShiftReport, double, QQueryOperations>
      totalCashExpenseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCashExpense');
    });
  }

  QueryBuilder<HotelShiftReport, double, QQueryOperations>
      totalCashIncomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCashIncome');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHotelAccountingSummaryCollection on Isar {
  IsarCollection<HotelAccountingSummary> get hotelAccountingSummarys =>
      this.collection();
}

const HotelAccountingSummarySchema = CollectionSchema(
  name: r'HotelAccountingSummary',
  id: 6958360105979766274,
  properties: {
    r'netProfit': PropertySchema(
      id: 0,
      name: r'netProfit',
      type: IsarType.double,
    ),
    r'summaryDate': PropertySchema(
      id: 1,
      name: r'summaryDate',
      type: IsarType.string,
    ),
    r'totalExpense': PropertySchema(
      id: 2,
      name: r'totalExpense',
      type: IsarType.double,
    ),
    r'totalRoomRevenue': PropertySchema(
      id: 3,
      name: r'totalRoomRevenue',
      type: IsarType.double,
    ),
    r'totalServiceRevenue': PropertySchema(
      id: 4,
      name: r'totalServiceRevenue',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 5,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _hotelAccountingSummaryEstimateSize,
  serialize: _hotelAccountingSummarySerialize,
  deserialize: _hotelAccountingSummaryDeserialize,
  deserializeProp: _hotelAccountingSummaryDeserializeProp,
  idName: r'id',
  indexes: {
    r'summaryDate': IndexSchema(
      id: -2235866952207359312,
      name: r'summaryDate',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'summaryDate',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _hotelAccountingSummaryGetId,
  getLinks: _hotelAccountingSummaryGetLinks,
  attach: _hotelAccountingSummaryAttach,
  version: '3.1.0+1',
);

int _hotelAccountingSummaryEstimateSize(
  HotelAccountingSummary object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.summaryDate.length * 3;
  return bytesCount;
}

void _hotelAccountingSummarySerialize(
  HotelAccountingSummary object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.netProfit);
  writer.writeString(offsets[1], object.summaryDate);
  writer.writeDouble(offsets[2], object.totalExpense);
  writer.writeDouble(offsets[3], object.totalRoomRevenue);
  writer.writeDouble(offsets[4], object.totalServiceRevenue);
  writer.writeDateTime(offsets[5], object.updatedAt);
}

HotelAccountingSummary _hotelAccountingSummaryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HotelAccountingSummary();
  object.id = id;
  object.netProfit = reader.readDouble(offsets[0]);
  object.summaryDate = reader.readString(offsets[1]);
  object.totalExpense = reader.readDouble(offsets[2]);
  object.totalRoomRevenue = reader.readDouble(offsets[3]);
  object.totalServiceRevenue = reader.readDouble(offsets[4]);
  object.updatedAt = reader.readDateTime(offsets[5]);
  return object;
}

P _hotelAccountingSummaryDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _hotelAccountingSummaryGetId(HotelAccountingSummary object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _hotelAccountingSummaryGetLinks(
    HotelAccountingSummary object) {
  return [];
}

void _hotelAccountingSummaryAttach(
    IsarCollection<dynamic> col, Id id, HotelAccountingSummary object) {
  object.id = id;
}

extension HotelAccountingSummaryByIndex
    on IsarCollection<HotelAccountingSummary> {
  Future<HotelAccountingSummary?> getBySummaryDate(String summaryDate) {
    return getByIndex(r'summaryDate', [summaryDate]);
  }

  HotelAccountingSummary? getBySummaryDateSync(String summaryDate) {
    return getByIndexSync(r'summaryDate', [summaryDate]);
  }

  Future<bool> deleteBySummaryDate(String summaryDate) {
    return deleteByIndex(r'summaryDate', [summaryDate]);
  }

  bool deleteBySummaryDateSync(String summaryDate) {
    return deleteByIndexSync(r'summaryDate', [summaryDate]);
  }

  Future<List<HotelAccountingSummary?>> getAllBySummaryDate(
      List<String> summaryDateValues) {
    final values = summaryDateValues.map((e) => [e]).toList();
    return getAllByIndex(r'summaryDate', values);
  }

  List<HotelAccountingSummary?> getAllBySummaryDateSync(
      List<String> summaryDateValues) {
    final values = summaryDateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'summaryDate', values);
  }

  Future<int> deleteAllBySummaryDate(List<String> summaryDateValues) {
    final values = summaryDateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'summaryDate', values);
  }

  int deleteAllBySummaryDateSync(List<String> summaryDateValues) {
    final values = summaryDateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'summaryDate', values);
  }

  Future<Id> putBySummaryDate(HotelAccountingSummary object) {
    return putByIndex(r'summaryDate', object);
  }

  Id putBySummaryDateSync(HotelAccountingSummary object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'summaryDate', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySummaryDate(List<HotelAccountingSummary> objects) {
    return putAllByIndex(r'summaryDate', objects);
  }

  List<Id> putAllBySummaryDateSync(List<HotelAccountingSummary> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'summaryDate', objects, saveLinks: saveLinks);
  }
}

extension HotelAccountingSummaryQueryWhereSort
    on QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QWhere> {
  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HotelAccountingSummaryQueryWhere on QueryBuilder<
    HotelAccountingSummary, HotelAccountingSummary, QWhereClause> {
  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
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

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
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

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterWhereClause> summaryDateEqualTo(String summaryDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'summaryDate',
        value: [summaryDate],
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterWhereClause> summaryDateNotEqualTo(String summaryDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'summaryDate',
              lower: [],
              upper: [summaryDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'summaryDate',
              lower: [summaryDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'summaryDate',
              lower: [summaryDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'summaryDate',
              lower: [],
              upper: [summaryDate],
              includeUpper: false,
            ));
      }
    });
  }
}

extension HotelAccountingSummaryQueryFilter on QueryBuilder<
    HotelAccountingSummary, HotelAccountingSummary, QFilterCondition> {
  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
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

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
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

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
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

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> netProfitEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'netProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> netProfitGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'netProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> netProfitLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'netProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> netProfitBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'netProfit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> summaryDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summaryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> summaryDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'summaryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> summaryDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'summaryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> summaryDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'summaryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> summaryDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'summaryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> summaryDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'summaryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
          QAfterFilterCondition>
      summaryDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'summaryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
          QAfterFilterCondition>
      summaryDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'summaryDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> summaryDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summaryDate',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> summaryDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'summaryDate',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalExpenseEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalExpense',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalExpenseGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalExpense',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalExpenseLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalExpense',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalExpenseBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalExpense',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalRoomRevenueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalRoomRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalRoomRevenueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalRoomRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalRoomRevenueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalRoomRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalRoomRevenueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalRoomRevenue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalServiceRevenueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalServiceRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalServiceRevenueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalServiceRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalServiceRevenueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalServiceRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> totalServiceRevenueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalServiceRevenue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
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

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
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

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary,
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
}

extension HotelAccountingSummaryQueryObject on QueryBuilder<
    HotelAccountingSummary, HotelAccountingSummary, QFilterCondition> {}

extension HotelAccountingSummaryQueryLinks on QueryBuilder<
    HotelAccountingSummary, HotelAccountingSummary, QFilterCondition> {}

extension HotelAccountingSummaryQuerySortBy
    on QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QSortBy> {
  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortByNetProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortByNetProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.desc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortBySummaryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryDate', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortBySummaryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryDate', Sort.desc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortByTotalExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpense', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortByTotalExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpense', Sort.desc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortByTotalRoomRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRoomRevenue', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortByTotalRoomRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRoomRevenue', Sort.desc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortByTotalServiceRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalServiceRevenue', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortByTotalServiceRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalServiceRevenue', Sort.desc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension HotelAccountingSummaryQuerySortThenBy on QueryBuilder<
    HotelAccountingSummary, HotelAccountingSummary, QSortThenBy> {
  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenByNetProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenByNetProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.desc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenBySummaryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryDate', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenBySummaryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryDate', Sort.desc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenByTotalExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpense', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenByTotalExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpense', Sort.desc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenByTotalRoomRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRoomRevenue', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenByTotalRoomRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRoomRevenue', Sort.desc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenByTotalServiceRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalServiceRevenue', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenByTotalServiceRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalServiceRevenue', Sort.desc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension HotelAccountingSummaryQueryWhereDistinct
    on QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QDistinct> {
  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QDistinct>
      distinctByNetProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netProfit');
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QDistinct>
      distinctBySummaryDate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summaryDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QDistinct>
      distinctByTotalExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalExpense');
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QDistinct>
      distinctByTotalRoomRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalRoomRevenue');
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QDistinct>
      distinctByTotalServiceRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalServiceRevenue');
    });
  }

  QueryBuilder<HotelAccountingSummary, HotelAccountingSummary, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension HotelAccountingSummaryQueryProperty on QueryBuilder<
    HotelAccountingSummary, HotelAccountingSummary, QQueryProperty> {
  QueryBuilder<HotelAccountingSummary, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HotelAccountingSummary, double, QQueryOperations>
      netProfitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netProfit');
    });
  }

  QueryBuilder<HotelAccountingSummary, String, QQueryOperations>
      summaryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summaryDate');
    });
  }

  QueryBuilder<HotelAccountingSummary, double, QQueryOperations>
      totalExpenseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalExpense');
    });
  }

  QueryBuilder<HotelAccountingSummary, double, QQueryOperations>
      totalRoomRevenueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalRoomRevenue');
    });
  }

  QueryBuilder<HotelAccountingSummary, double, QQueryOperations>
      totalServiceRevenueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalServiceRevenue');
    });
  }

  QueryBuilder<HotelAccountingSummary, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
