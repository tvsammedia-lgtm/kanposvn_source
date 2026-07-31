// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTransactionRecordCollection on Isar {
  IsarCollection<TransactionRecord> get transactionRecords => this.collection();
}

const TransactionRecordSchema = CollectionSchema(
  name: r'TransactionRecord',
  id: 5251947889243599499,
  properties: {
    r'askingPrice': PropertySchema(
      id: 0,
      name: r'askingPrice',
      type: IsarType.double,
    ),
    r'brokerId': PropertySchema(
      id: 1,
      name: r'brokerId',
      type: IsarType.string,
    ),
    r'buyerId': PropertySchema(
      id: 2,
      name: r'buyerId',
      type: IsarType.string,
    ),
    r'commission': PropertySchema(
      id: 3,
      name: r'commission',
      type: IsarType.double,
    ),
    r'finalPrice': PropertySchema(
      id: 4,
      name: r'finalPrice',
      type: IsarType.double,
    ),
    r'floorFee': PropertySchema(
      id: 5,
      name: r'floorFee',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 6,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 7,
      name: r'notes',
      type: IsarType.string,
    ),
    r'propertyId': PropertySchema(
      id: 8,
      name: r'propertyId',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 9,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'sellerId': PropertySchema(
      id: 10,
      name: r'sellerId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.string,
      enumMap: _TransactionRecordstatusEnumValueMap,
    ),
    r'transactionCode': PropertySchema(
      id: 12,
      name: r'transactionCode',
      type: IsarType.string,
    ),
    r'transactionDate': PropertySchema(
      id: 13,
      name: r'transactionDate',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 14,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 15,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _transactionRecordEstimateSize,
  serialize: _transactionRecordSerialize,
  deserialize: _transactionRecordDeserialize,
  deserializeProp: _transactionRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'remoteId': IndexSchema(
      id: 6301175856541681032,
      name: r'remoteId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'remoteId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _transactionRecordGetId,
  getLinks: _transactionRecordGetLinks,
  attach: _transactionRecordAttach,
  version: '3.1.0+1',
);

int _transactionRecordEstimateSize(
  TransactionRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.brokerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.buyerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.propertyId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sellerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  {
    final value = object.transactionCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _transactionRecordSerialize(
  TransactionRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.askingPrice);
  writer.writeString(offsets[1], object.brokerId);
  writer.writeString(offsets[2], object.buyerId);
  writer.writeDouble(offsets[3], object.commission);
  writer.writeDouble(offsets[4], object.finalPrice);
  writer.writeDouble(offsets[5], object.floorFee);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeString(offsets[7], object.notes);
  writer.writeString(offsets[8], object.propertyId);
  writer.writeString(offsets[9], object.remoteId);
  writer.writeString(offsets[10], object.sellerId);
  writer.writeString(offsets[11], object.status.name);
  writer.writeString(offsets[12], object.transactionCode);
  writer.writeDateTime(offsets[13], object.transactionDate);
  writer.writeDateTime(offsets[14], object.updatedAt);
  writer.writeLong(offsets[15], object.version);
}

TransactionRecord _transactionRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionRecord();
  object.askingPrice = reader.readDoubleOrNull(offsets[0]);
  object.brokerId = reader.readStringOrNull(offsets[1]);
  object.buyerId = reader.readStringOrNull(offsets[2]);
  object.commission = reader.readDoubleOrNull(offsets[3]);
  object.finalPrice = reader.readDoubleOrNull(offsets[4]);
  object.floorFee = reader.readDoubleOrNull(offsets[5]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[6]);
  object.notes = reader.readStringOrNull(offsets[7]);
  object.propertyId = reader.readStringOrNull(offsets[8]);
  object.remoteId = reader.readStringOrNull(offsets[9]);
  object.sellerId = reader.readStringOrNull(offsets[10]);
  object.status = _TransactionRecordstatusValueEnumMap[
          reader.readStringOrNull(offsets[11])] ??
      TransactionStatus.negotiating;
  object.transactionCode = reader.readStringOrNull(offsets[12]);
  object.transactionDate = reader.readDateTimeOrNull(offsets[13]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[14]);
  object.version = reader.readLongOrNull(offsets[15]);
  return object;
}

P _transactionRecordDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (_TransactionRecordstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TransactionStatus.negotiating) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TransactionRecordstatusEnumValueMap = {
  r'negotiating': r'negotiating',
  r'deposited': r'deposited',
  r'notarized': r'notarized',
  r'completed': r'completed',
  r'cancelled': r'cancelled',
};
const _TransactionRecordstatusValueEnumMap = {
  r'negotiating': TransactionStatus.negotiating,
  r'deposited': TransactionStatus.deposited,
  r'notarized': TransactionStatus.notarized,
  r'completed': TransactionStatus.completed,
  r'cancelled': TransactionStatus.cancelled,
};

Id _transactionRecordGetId(TransactionRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _transactionRecordGetLinks(
    TransactionRecord object) {
  return [];
}

void _transactionRecordAttach(
    IsarCollection<dynamic> col, Id id, TransactionRecord object) {
  object.id = id;
}

extension TransactionRecordByIndex on IsarCollection<TransactionRecord> {
  Future<TransactionRecord?> getByRemoteId(String? remoteId) {
    return getByIndex(r'remoteId', [remoteId]);
  }

  TransactionRecord? getByRemoteIdSync(String? remoteId) {
    return getByIndexSync(r'remoteId', [remoteId]);
  }

  Future<bool> deleteByRemoteId(String? remoteId) {
    return deleteByIndex(r'remoteId', [remoteId]);
  }

  bool deleteByRemoteIdSync(String? remoteId) {
    return deleteByIndexSync(r'remoteId', [remoteId]);
  }

  Future<List<TransactionRecord?>> getAllByRemoteId(
      List<String?> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'remoteId', values);
  }

  List<TransactionRecord?> getAllByRemoteIdSync(List<String?> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'remoteId', values);
  }

  Future<int> deleteAllByRemoteId(List<String?> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'remoteId', values);
  }

  int deleteAllByRemoteIdSync(List<String?> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'remoteId', values);
  }

  Future<Id> putByRemoteId(TransactionRecord object) {
    return putByIndex(r'remoteId', object);
  }

  Id putByRemoteIdSync(TransactionRecord object, {bool saveLinks = true}) {
    return putByIndexSync(r'remoteId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRemoteId(List<TransactionRecord> objects) {
    return putAllByIndex(r'remoteId', objects);
  }

  List<Id> putAllByRemoteIdSync(List<TransactionRecord> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'remoteId', objects, saveLinks: saveLinks);
  }
}

extension TransactionRecordQueryWhereSort
    on QueryBuilder<TransactionRecord, TransactionRecord, QWhere> {
  QueryBuilder<TransactionRecord, TransactionRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TransactionRecordQueryWhere
    on QueryBuilder<TransactionRecord, TransactionRecord, QWhereClause> {
  QueryBuilder<TransactionRecord, TransactionRecord, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterWhereClause>
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterWhereClause>
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterWhereClause>
      remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterWhereClause>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'remoteId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterWhereClause>
      remoteIdEqualTo(String? remoteId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [remoteId],
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterWhereClause>
      remoteIdNotEqualTo(String? remoteId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TransactionRecordQueryFilter
    on QueryBuilder<TransactionRecord, TransactionRecord, QFilterCondition> {
  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      askingPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'askingPrice',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      askingPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'askingPrice',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      askingPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'askingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      askingPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'askingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      askingPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'askingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      askingPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'askingPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brokerId',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brokerId',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brokerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brokerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brokerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brokerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brokerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brokerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brokerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brokerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brokerId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      brokerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brokerId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'buyerId',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'buyerId',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buyerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buyerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buyerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buyerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'buyerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'buyerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'buyerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'buyerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buyerId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      buyerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'buyerId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      commissionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'commission',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      commissionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'commission',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      commissionEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      commissionGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      commissionLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      commissionBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commission',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      finalPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finalPrice',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      finalPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finalPrice',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      finalPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      finalPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      finalPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      finalPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      floorFeeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'floorFee',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      floorFeeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'floorFee',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      floorFeeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      floorFeeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floorFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      floorFeeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floorFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      floorFeeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floorFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyId',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyId',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      propertyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellerId',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellerId',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sellerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sellerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sellerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sellerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellerId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      sellerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sellerId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      statusEqualTo(
    TransactionStatus value, {
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      statusGreaterThan(
    TransactionStatus value, {
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      statusLessThan(
    TransactionStatus value, {
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      statusBetween(
    TransactionStatus lower,
    TransactionStatus upper, {
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionCode',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionCode',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionDate',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionDate',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionDateGreaterThan(
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionDateLessThan(
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      transactionDateBetween(
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      versionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      versionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      versionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      versionGreaterThan(
    int? value, {
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      versionLessThan(
    int? value, {
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

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterFilterCondition>
      versionBetween(
    int? lower,
    int? upper, {
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

extension TransactionRecordQueryObject
    on QueryBuilder<TransactionRecord, TransactionRecord, QFilterCondition> {}

extension TransactionRecordQueryLinks
    on QueryBuilder<TransactionRecord, TransactionRecord, QFilterCondition> {}

extension TransactionRecordQuerySortBy
    on QueryBuilder<TransactionRecord, TransactionRecord, QSortBy> {
  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByAskingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'askingPrice', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByAskingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'askingPrice', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByBrokerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerId', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByBrokerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerId', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByBuyerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyerId', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByBuyerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyerId', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByFinalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByFinalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByFloorFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorFee', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByFloorFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorFee', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortBySellerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerId', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortBySellerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerId', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByTransactionCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionCode', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByTransactionCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionCode', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TransactionRecordQuerySortThenBy
    on QueryBuilder<TransactionRecord, TransactionRecord, QSortThenBy> {
  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByAskingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'askingPrice', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByAskingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'askingPrice', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByBrokerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerId', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByBrokerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerId', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByBuyerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyerId', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByBuyerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyerId', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByFinalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByFinalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalPrice', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByFloorFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorFee', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByFloorFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorFee', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenBySellerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerId', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenBySellerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerId', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByTransactionCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionCode', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByTransactionCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionCode', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TransactionRecordQueryWhereDistinct
    on QueryBuilder<TransactionRecord, TransactionRecord, QDistinct> {
  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByAskingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'askingPrice');
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByBrokerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brokerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByBuyerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buyerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commission');
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByFinalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalPrice');
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByFloorFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorFee');
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByPropertyId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctBySellerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByTransactionCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionDate');
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TransactionRecord, TransactionRecord, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension TransactionRecordQueryProperty
    on QueryBuilder<TransactionRecord, TransactionRecord, QQueryProperty> {
  QueryBuilder<TransactionRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TransactionRecord, double?, QQueryOperations>
      askingPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'askingPrice');
    });
  }

  QueryBuilder<TransactionRecord, String?, QQueryOperations>
      brokerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brokerId');
    });
  }

  QueryBuilder<TransactionRecord, String?, QQueryOperations> buyerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buyerId');
    });
  }

  QueryBuilder<TransactionRecord, double?, QQueryOperations>
      commissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commission');
    });
  }

  QueryBuilder<TransactionRecord, double?, QQueryOperations>
      finalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalPrice');
    });
  }

  QueryBuilder<TransactionRecord, double?, QQueryOperations>
      floorFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorFee');
    });
  }

  QueryBuilder<TransactionRecord, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<TransactionRecord, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<TransactionRecord, String?, QQueryOperations>
      propertyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyId');
    });
  }

  QueryBuilder<TransactionRecord, String?, QQueryOperations>
      remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<TransactionRecord, String?, QQueryOperations>
      sellerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellerId');
    });
  }

  QueryBuilder<TransactionRecord, TransactionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TransactionRecord, String?, QQueryOperations>
      transactionCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionCode');
    });
  }

  QueryBuilder<TransactionRecord, DateTime?, QQueryOperations>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionDate');
    });
  }

  QueryBuilder<TransactionRecord, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TransactionRecord, int?, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
