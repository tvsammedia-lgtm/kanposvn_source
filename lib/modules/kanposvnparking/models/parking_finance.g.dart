// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_finance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingFinanceTxCollection on Isar {
  IsarCollection<ParkingFinanceTx> get parkingFinanceTxs => this.collection();
}

const ParkingFinanceTxSchema = CollectionSchema(
  name: r'ParkingFinanceTx',
  id: 8042039601635513991,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'expenseCategory': PropertySchema(
      id: 2,
      name: r'expenseCategory',
      type: IsarType.string,
    ),
    r'financeId': PropertySchema(
      id: 3,
      name: r'financeId',
      type: IsarType.string,
    ),
    r'incomeCategory': PropertySchema(
      id: 4,
      name: r'incomeCategory',
      type: IsarType.string,
    ),
    r'isIncome': PropertySchema(
      id: 5,
      name: r'isIncome',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 6,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'note': PropertySchema(
      id: 7,
      name: r'note',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _parkingFinanceTxEstimateSize,
  serialize: _parkingFinanceTxSerialize,
  deserialize: _parkingFinanceTxDeserialize,
  deserializeProp: _parkingFinanceTxDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'financeId': IndexSchema(
      id: 3567653780748622963,
      name: r'financeId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'financeId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'expenseCategory': IndexSchema(
      id: 6102304178932123248,
      name: r'expenseCategory',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'expenseCategory',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _parkingFinanceTxGetId,
  getLinks: _parkingFinanceTxGetLinks,
  attach: _parkingFinanceTxAttach,
  version: '3.1.0+1',
);

int _parkingFinanceTxEstimateSize(
  ParkingFinanceTx object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.expenseCategory.length * 3;
  bytesCount += 3 + object.financeId.length * 3;
  bytesCount += 3 + object.incomeCategory.length * 3;
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _parkingFinanceTxSerialize(
  ParkingFinanceTx object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.expenseCategory);
  writer.writeString(offsets[3], object.financeId);
  writer.writeString(offsets[4], object.incomeCategory);
  writer.writeBool(offsets[5], object.isIncome);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeString(offsets[7], object.note);
  writer.writeDateTime(offsets[8], object.updatedAt);
}

ParkingFinanceTx _parkingFinanceTxDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingFinanceTx();
  object.amount = reader.readDouble(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.expenseCategory = reader.readString(offsets[2]);
  object.financeId = reader.readString(offsets[3]);
  object.incomeCategory = reader.readString(offsets[4]);
  object.isIncome = reader.readBool(offsets[5]);
  object.isSynced = reader.readBool(offsets[6]);
  object.isarId = id;
  object.note = reader.readString(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  return object;
}

P _parkingFinanceTxDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parkingFinanceTxGetId(ParkingFinanceTx object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _parkingFinanceTxGetLinks(ParkingFinanceTx object) {
  return [];
}

void _parkingFinanceTxAttach(
    IsarCollection<dynamic> col, Id id, ParkingFinanceTx object) {
  object.isarId = id;
}

extension ParkingFinanceTxByIndex on IsarCollection<ParkingFinanceTx> {
  Future<ParkingFinanceTx?> getByFinanceId(String financeId) {
    return getByIndex(r'financeId', [financeId]);
  }

  ParkingFinanceTx? getByFinanceIdSync(String financeId) {
    return getByIndexSync(r'financeId', [financeId]);
  }

  Future<bool> deleteByFinanceId(String financeId) {
    return deleteByIndex(r'financeId', [financeId]);
  }

  bool deleteByFinanceIdSync(String financeId) {
    return deleteByIndexSync(r'financeId', [financeId]);
  }

  Future<List<ParkingFinanceTx?>> getAllByFinanceId(
      List<String> financeIdValues) {
    final values = financeIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'financeId', values);
  }

  List<ParkingFinanceTx?> getAllByFinanceIdSync(List<String> financeIdValues) {
    final values = financeIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'financeId', values);
  }

  Future<int> deleteAllByFinanceId(List<String> financeIdValues) {
    final values = financeIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'financeId', values);
  }

  int deleteAllByFinanceIdSync(List<String> financeIdValues) {
    final values = financeIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'financeId', values);
  }

  Future<Id> putByFinanceId(ParkingFinanceTx object) {
    return putByIndex(r'financeId', object);
  }

  Id putByFinanceIdSync(ParkingFinanceTx object, {bool saveLinks = true}) {
    return putByIndexSync(r'financeId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFinanceId(List<ParkingFinanceTx> objects) {
    return putAllByIndex(r'financeId', objects);
  }

  List<Id> putAllByFinanceIdSync(List<ParkingFinanceTx> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'financeId', objects, saveLinks: saveLinks);
  }
}

extension ParkingFinanceTxQueryWhereSort
    on QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QWhere> {
  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension ParkingFinanceTxQueryWhere
    on QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QWhereClause> {
  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      financeIdEqualTo(String financeId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'financeId',
        value: [financeId],
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      financeIdNotEqualTo(String financeId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'financeId',
              lower: [],
              upper: [financeId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'financeId',
              lower: [financeId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'financeId',
              lower: [financeId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'financeId',
              lower: [],
              upper: [financeId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      expenseCategoryEqualTo(String expenseCategory) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'expenseCategory',
        value: [expenseCategory],
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterWhereClause>
      expenseCategoryNotEqualTo(String expenseCategory) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expenseCategory',
              lower: [],
              upper: [expenseCategory],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expenseCategory',
              lower: [expenseCategory],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expenseCategory',
              lower: [expenseCategory],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expenseCategory',
              lower: [],
              upper: [expenseCategory],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ParkingFinanceTxQueryFilter
    on QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QFilterCondition> {
  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      amountEqualTo(
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      amountGreaterThan(
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      amountLessThan(
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      amountBetween(
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      createdAtGreaterThan(
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      createdAtLessThan(
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      createdAtBetween(
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      expenseCategoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      expenseCategoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      expenseCategoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      expenseCategoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      expenseCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      expenseCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      expenseCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      expenseCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenseCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      expenseCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      expenseCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenseCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      financeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'financeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      financeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'financeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      financeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'financeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      financeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'financeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      financeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'financeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      financeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'financeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      financeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'financeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      financeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'financeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      financeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'financeId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      financeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'financeId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      incomeCategoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incomeCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      incomeCategoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'incomeCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      incomeCategoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'incomeCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      incomeCategoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'incomeCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      incomeCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'incomeCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      incomeCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'incomeCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      incomeCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'incomeCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      incomeCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'incomeCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      incomeCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incomeCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      incomeCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'incomeCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      isIncomeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isIncome',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      updatedAtGreaterThan(
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterFilterCondition>
      updatedAtBetween(
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

extension ParkingFinanceTxQueryObject
    on QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QFilterCondition> {}

extension ParkingFinanceTxQueryLinks
    on QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QFilterCondition> {}

extension ParkingFinanceTxQuerySortBy
    on QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QSortBy> {
  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByExpenseCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseCategory', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByExpenseCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseCategory', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByFinanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'financeId', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByFinanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'financeId', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByIncomeCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomeCategory', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByIncomeCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomeCategory', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByIsIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncome', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByIsIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncome', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ParkingFinanceTxQuerySortThenBy
    on QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QSortThenBy> {
  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByExpenseCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseCategory', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByExpenseCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseCategory', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByFinanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'financeId', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByFinanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'financeId', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByIncomeCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomeCategory', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByIncomeCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomeCategory', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByIsIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncome', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByIsIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncome', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ParkingFinanceTxQueryWhereDistinct
    on QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QDistinct> {
  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QDistinct>
      distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QDistinct>
      distinctByExpenseCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenseCategory',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QDistinct>
      distinctByFinanceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'financeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QDistinct>
      distinctByIncomeCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'incomeCategory',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QDistinct>
      distinctByIsIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isIncome');
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ParkingFinanceTxQueryProperty
    on QueryBuilder<ParkingFinanceTx, ParkingFinanceTx, QQueryProperty> {
  QueryBuilder<ParkingFinanceTx, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ParkingFinanceTx, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<ParkingFinanceTx, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ParkingFinanceTx, String, QQueryOperations>
      expenseCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenseCategory');
    });
  }

  QueryBuilder<ParkingFinanceTx, String, QQueryOperations> financeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'financeId');
    });
  }

  QueryBuilder<ParkingFinanceTx, String, QQueryOperations>
      incomeCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'incomeCategory');
    });
  }

  QueryBuilder<ParkingFinanceTx, bool, QQueryOperations> isIncomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isIncome');
    });
  }

  QueryBuilder<ParkingFinanceTx, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ParkingFinanceTx, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<ParkingFinanceTx, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
