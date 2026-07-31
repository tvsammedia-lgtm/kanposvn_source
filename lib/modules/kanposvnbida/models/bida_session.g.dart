// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bida_session.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBidaSessionCollection on Isar {
  IsarCollection<BidaSession> get bidaSessions => this.collection();
}

const BidaSessionSchema = CollectionSchema(
  name: r'BidaSession',
  id: -8532099458227148930,
  properties: {
    r'endTime': PropertySchema(
      id: 0,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'grandTotal': PropertySchema(
      id: 1,
      name: r'grandTotal',
      type: IsarType.double,
    ),
    r'hourlyPrice': PropertySchema(
      id: 2,
      name: r'hourlyPrice',
      type: IsarType.double,
    ),
    r'orderLines': PropertySchema(
      id: 3,
      name: r'orderLines',
      type: IsarType.objectList,
      target: r'BidaOrderLine',
    ),
    r'sessionId': PropertySchema(
      id: 4,
      name: r'sessionId',
      type: IsarType.string,
    ),
    r'startTime': PropertySchema(
      id: 5,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.byte,
      enumMap: _BidaSessionstatusEnumValueMap,
    ),
    r'totalItemCost': PropertySchema(
      id: 7,
      name: r'totalItemCost',
      type: IsarType.double,
    ),
    r'totalTimeCost': PropertySchema(
      id: 8,
      name: r'totalTimeCost',
      type: IsarType.double,
    )
  },
  estimateSize: _bidaSessionEstimateSize,
  serialize: _bidaSessionSerialize,
  deserialize: _bidaSessionDeserialize,
  deserializeProp: _bidaSessionDeserializeProp,
  idName: r'id',
  indexes: {
    r'sessionId': IndexSchema(
      id: 6949518585047923839,
      name: r'sessionId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'sessionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'table': LinkSchema(
      id: -5166333453179776823,
      name: r'table',
      target: r'BidaTable',
      single: true,
    )
  },
  embeddedSchemas: {r'BidaOrderLine': BidaOrderLineSchema},
  getId: _bidaSessionGetId,
  getLinks: _bidaSessionGetLinks,
  attach: _bidaSessionAttach,
  version: '3.1.0+1',
);

int _bidaSessionEstimateSize(
  BidaSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.orderLines.length * 3;
  {
    final offsets = allOffsets[BidaOrderLine]!;
    for (var i = 0; i < object.orderLines.length; i++) {
      final value = object.orderLines[i];
      bytesCount +=
          BidaOrderLineSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.sessionId.length * 3;
  return bytesCount;
}

void _bidaSessionSerialize(
  BidaSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endTime);
  writer.writeDouble(offsets[1], object.grandTotal);
  writer.writeDouble(offsets[2], object.hourlyPrice);
  writer.writeObjectList<BidaOrderLine>(
    offsets[3],
    allOffsets,
    BidaOrderLineSchema.serialize,
    object.orderLines,
  );
  writer.writeString(offsets[4], object.sessionId);
  writer.writeDateTime(offsets[5], object.startTime);
  writer.writeByte(offsets[6], object.status.index);
  writer.writeDouble(offsets[7], object.totalItemCost);
  writer.writeDouble(offsets[8], object.totalTimeCost);
}

BidaSession _bidaSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BidaSession();
  object.endTime = reader.readDateTimeOrNull(offsets[0]);
  object.hourlyPrice = reader.readDouble(offsets[2]);
  object.id = id;
  object.orderLines = reader.readObjectList<BidaOrderLine>(
        offsets[3],
        BidaOrderLineSchema.deserialize,
        allOffsets,
        BidaOrderLine(),
      ) ??
      [];
  object.sessionId = reader.readString(offsets[4]);
  object.startTime = reader.readDateTimeOrNull(offsets[5]);
  object.status =
      _BidaSessionstatusValueEnumMap[reader.readByteOrNull(offsets[6])] ??
          BidaSessionStatus.OPEN;
  object.totalTimeCost = reader.readDouble(offsets[8]);
  return object;
}

P _bidaSessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readObjectList<BidaOrderLine>(
            offset,
            BidaOrderLineSchema.deserialize,
            allOffsets,
            BidaOrderLine(),
          ) ??
          []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (_BidaSessionstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          BidaSessionStatus.OPEN) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BidaSessionstatusEnumValueMap = {
  'OPEN': 0,
  'PAID': 1,
  'CANCELLED': 2,
};
const _BidaSessionstatusValueEnumMap = {
  0: BidaSessionStatus.OPEN,
  1: BidaSessionStatus.PAID,
  2: BidaSessionStatus.CANCELLED,
};

Id _bidaSessionGetId(BidaSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bidaSessionGetLinks(BidaSession object) {
  return [object.table];
}

void _bidaSessionAttach(
    IsarCollection<dynamic> col, Id id, BidaSession object) {
  object.id = id;
  object.table.attach(col, col.isar.collection<BidaTable>(), r'table', id);
}

extension BidaSessionByIndex on IsarCollection<BidaSession> {
  Future<BidaSession?> getBySessionId(String sessionId) {
    return getByIndex(r'sessionId', [sessionId]);
  }

  BidaSession? getBySessionIdSync(String sessionId) {
    return getByIndexSync(r'sessionId', [sessionId]);
  }

  Future<bool> deleteBySessionId(String sessionId) {
    return deleteByIndex(r'sessionId', [sessionId]);
  }

  bool deleteBySessionIdSync(String sessionId) {
    return deleteByIndexSync(r'sessionId', [sessionId]);
  }

  Future<List<BidaSession?>> getAllBySessionId(List<String> sessionIdValues) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'sessionId', values);
  }

  List<BidaSession?> getAllBySessionIdSync(List<String> sessionIdValues) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'sessionId', values);
  }

  Future<int> deleteAllBySessionId(List<String> sessionIdValues) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'sessionId', values);
  }

  int deleteAllBySessionIdSync(List<String> sessionIdValues) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'sessionId', values);
  }

  Future<Id> putBySessionId(BidaSession object) {
    return putByIndex(r'sessionId', object);
  }

  Id putBySessionIdSync(BidaSession object, {bool saveLinks = true}) {
    return putByIndexSync(r'sessionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySessionId(List<BidaSession> objects) {
    return putAllByIndex(r'sessionId', objects);
  }

  List<Id> putAllBySessionIdSync(List<BidaSession> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'sessionId', objects, saveLinks: saveLinks);
  }
}

extension BidaSessionQueryWhereSort
    on QueryBuilder<BidaSession, BidaSession, QWhere> {
  QueryBuilder<BidaSession, BidaSession, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BidaSessionQueryWhere
    on QueryBuilder<BidaSession, BidaSession, QWhereClause> {
  QueryBuilder<BidaSession, BidaSession, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BidaSession, BidaSession, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterWhereClause> idBetween(
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

  QueryBuilder<BidaSession, BidaSession, QAfterWhereClause> sessionIdEqualTo(
      String sessionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sessionId',
        value: [sessionId],
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterWhereClause> sessionIdNotEqualTo(
      String sessionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [],
              upper: [sessionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [sessionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [sessionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [],
              upper: [sessionId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BidaSessionQueryFilter
    on QueryBuilder<BidaSession, BidaSession, QFilterCondition> {
  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> endTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
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

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> endTimeLessThan(
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

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> endTimeBetween(
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

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      grandTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grandTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      grandTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grandTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      grandTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grandTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      grandTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grandTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      hourlyPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hourlyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      hourlyPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hourlyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      hourlyPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hourlyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      hourlyPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hourlyPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      orderLinesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'orderLines',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      orderLinesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'orderLines',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      orderLinesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'orderLines',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      orderLinesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'orderLines',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      orderLinesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'orderLines',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      orderLinesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'orderLines',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      sessionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      sessionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      sessionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      sessionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sessionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      sessionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      sessionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      sessionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      sessionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sessionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      sessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      sessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      startTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startTime',
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      startTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startTime',
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      startTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime? value, {
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

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      startTimeLessThan(
    DateTime? value, {
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

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      startTimeBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> statusEqualTo(
      BidaSessionStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      statusGreaterThan(
    BidaSessionStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> statusLessThan(
    BidaSessionStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> statusBetween(
    BidaSessionStatus lower,
    BidaSessionStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      totalItemCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalItemCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      totalItemCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalItemCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      totalItemCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalItemCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      totalItemCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalItemCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      totalTimeCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTimeCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      totalTimeCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalTimeCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      totalTimeCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalTimeCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      totalTimeCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalTimeCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension BidaSessionQueryObject
    on QueryBuilder<BidaSession, BidaSession, QFilterCondition> {
  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition>
      orderLinesElement(FilterQuery<BidaOrderLine> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'orderLines');
    });
  }
}

extension BidaSessionQueryLinks
    on QueryBuilder<BidaSession, BidaSession, QFilterCondition> {
  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> table(
      FilterQuery<BidaTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'table');
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterFilterCondition> tableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'table', 0, true, 0, true);
    });
  }
}

extension BidaSessionQuerySortBy
    on QueryBuilder<BidaSession, BidaSession, QSortBy> {
  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByGrandTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grandTotal', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByGrandTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grandTotal', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByHourlyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByTotalItemCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemCost', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy>
      sortByTotalItemCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemCost', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> sortByTotalTimeCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeCost', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy>
      sortByTotalTimeCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeCost', Sort.desc);
    });
  }
}

extension BidaSessionQuerySortThenBy
    on QueryBuilder<BidaSession, BidaSession, QSortThenBy> {
  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByGrandTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grandTotal', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByGrandTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grandTotal', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByHourlyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByTotalItemCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemCost', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy>
      thenByTotalItemCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemCost', Sort.desc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy> thenByTotalTimeCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeCost', Sort.asc);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QAfterSortBy>
      thenByTotalTimeCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeCost', Sort.desc);
    });
  }
}

extension BidaSessionQueryWhereDistinct
    on QueryBuilder<BidaSession, BidaSession, QDistinct> {
  QueryBuilder<BidaSession, BidaSession, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<BidaSession, BidaSession, QDistinct> distinctByGrandTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grandTotal');
    });
  }

  QueryBuilder<BidaSession, BidaSession, QDistinct> distinctByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hourlyPrice');
    });
  }

  QueryBuilder<BidaSession, BidaSession, QDistinct> distinctBySessionId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaSession, BidaSession, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<BidaSession, BidaSession, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<BidaSession, BidaSession, QDistinct> distinctByTotalItemCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalItemCost');
    });
  }

  QueryBuilder<BidaSession, BidaSession, QDistinct> distinctByTotalTimeCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTimeCost');
    });
  }
}

extension BidaSessionQueryProperty
    on QueryBuilder<BidaSession, BidaSession, QQueryProperty> {
  QueryBuilder<BidaSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BidaSession, DateTime?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<BidaSession, double, QQueryOperations> grandTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grandTotal');
    });
  }

  QueryBuilder<BidaSession, double, QQueryOperations> hourlyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hourlyPrice');
    });
  }

  QueryBuilder<BidaSession, List<BidaOrderLine>, QQueryOperations>
      orderLinesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderLines');
    });
  }

  QueryBuilder<BidaSession, String, QQueryOperations> sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<BidaSession, DateTime?, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<BidaSession, BidaSessionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<BidaSession, double, QQueryOperations> totalItemCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalItemCost');
    });
  }

  QueryBuilder<BidaSession, double, QQueryOperations> totalTimeCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTimeCost');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BidaOrderLineSchema = Schema(
  name: r'BidaOrderLine',
  id: -159694508845512494,
  properties: {
    r'itemId': PropertySchema(
      id: 0,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 1,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 2,
      name: r'price',
      type: IsarType.double,
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
    )
  },
  estimateSize: _bidaOrderLineEstimateSize,
  serialize: _bidaOrderLineSerialize,
  deserialize: _bidaOrderLineDeserialize,
  deserializeProp: _bidaOrderLineDeserializeProp,
);

int _bidaOrderLineEstimateSize(
  BidaOrderLine object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.itemId.length * 3;
  bytesCount += 3 + object.itemName.length * 3;
  return bytesCount;
}

void _bidaOrderLineSerialize(
  BidaOrderLine object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.itemId);
  writer.writeString(offsets[1], object.itemName);
  writer.writeDouble(offsets[2], object.price);
  writer.writeLong(offsets[3], object.quantity);
  writer.writeDouble(offsets[4], object.total);
}

BidaOrderLine _bidaOrderLineDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BidaOrderLine();
  object.itemId = reader.readString(offsets[0]);
  object.itemName = reader.readString(offsets[1]);
  object.price = reader.readDouble(offsets[2]);
  object.quantity = reader.readLong(offsets[3]);
  return object;
}

P _bidaOrderLineDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BidaOrderLineQueryFilter
    on QueryBuilder<BidaOrderLine, BidaOrderLine, QFilterCondition> {
  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      priceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      priceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      priceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      priceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      quantityGreaterThan(
    int value, {
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

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      quantityLessThan(
    int value, {
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

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      quantityBetween(
    int lower,
    int upper, {
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

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      totalEqualTo(
    double value, {
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

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      totalGreaterThan(
    double value, {
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

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      totalLessThan(
    double value, {
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

  QueryBuilder<BidaOrderLine, BidaOrderLine, QAfterFilterCondition>
      totalBetween(
    double lower,
    double upper, {
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
}

extension BidaOrderLineQueryObject
    on QueryBuilder<BidaOrderLine, BidaOrderLine, QFilterCondition> {}
