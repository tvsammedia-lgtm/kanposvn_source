// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPaymentCollection on Isar {
  IsarCollection<Payment> get payments => this.collection();
}

const PaymentSchema = CollectionSchema(
  name: r'Payment',
  id: -6533700744042574122,
  properties: {
    r'collectedBy': PropertySchema(
      id: 0,
      name: r'collectedBy',
      type: IsarType.string,
    ),
    r'content': PropertySchema(
      id: 1,
      name: r'content',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'debtAmount': PropertySchema(
      id: 3,
      name: r'debtAmount',
      type: IsarType.double,
    ),
    r'deleted': PropertySchema(
      id: 4,
      name: r'deleted',
      type: IsarType.bool,
    ),
    r'deletedAt': PropertySchema(
      id: 5,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 6,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'discount': PropertySchema(
      id: 7,
      name: r'discount',
      type: IsarType.double,
    ),
    r'electricAmount': PropertySchema(
      id: 8,
      name: r'electricAmount',
      type: IsarType.double,
    ),
    r'garbageAmount': PropertySchema(
      id: 9,
      name: r'garbageAmount',
      type: IsarType.double,
    ),
    r'internetAmount': PropertySchema(
      id: 10,
      name: r'internetAmount',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 11,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'month': PropertySchema(
      id: 12,
      name: r'month',
      type: IsarType.long,
    ),
    r'otherServiceAmount': PropertySchema(
      id: 13,
      name: r'otherServiceAmount',
      type: IsarType.double,
    ),
    r'paidAmount': PropertySchema(
      id: 14,
      name: r'paidAmount',
      type: IsarType.double,
    ),
    r'parkingAmount': PropertySchema(
      id: 15,
      name: r'parkingAmount',
      type: IsarType.double,
    ),
    r'paymentDate': PropertySchema(
      id: 16,
      name: r'paymentDate',
      type: IsarType.dateTime,
    ),
    r'promotion': PropertySchema(
      id: 17,
      name: r'promotion',
      type: IsarType.double,
    ),
    r'receiptNumber': PropertySchema(
      id: 18,
      name: r'receiptNumber',
      type: IsarType.string,
    ),
    r'rentAmount': PropertySchema(
      id: 19,
      name: r'rentAmount',
      type: IsarType.double,
    ),
    r'roomUuid': PropertySchema(
      id: 20,
      name: r'roomUuid',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 21,
      name: r'syncStatus',
      type: IsarType.string,
      enumMap: _PaymentsyncStatusEnumValueMap,
    ),
    r'tenantUuid': PropertySchema(
      id: 22,
      name: r'tenantUuid',
      type: IsarType.string,
    ),
    r'totalAmount': PropertySchema(
      id: 23,
      name: r'totalAmount',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 24,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 25,
      name: r'uuid',
      type: IsarType.string,
    ),
    r'version': PropertySchema(
      id: 26,
      name: r'version',
      type: IsarType.long,
    ),
    r'waterAmount': PropertySchema(
      id: 27,
      name: r'waterAmount',
      type: IsarType.double,
    ),
    r'year': PropertySchema(
      id: 28,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _paymentEstimateSize,
  serialize: _paymentSerialize,
  deserialize: _paymentDeserialize,
  deserializeProp: _paymentDeserializeProp,
  idName: r'id',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _paymentGetId,
  getLinks: _paymentGetLinks,
  attach: _paymentAttach,
  version: '3.1.0+1',
);

int _paymentEstimateSize(
  Payment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.collectedBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.content;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.deviceId.length * 3;
  {
    final value = object.receiptNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.roomUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.syncStatus.name.length * 3;
  {
    final value = object.tenantUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _paymentSerialize(
  Payment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.collectedBy);
  writer.writeString(offsets[1], object.content);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDouble(offsets[3], object.debtAmount);
  writer.writeBool(offsets[4], object.deleted);
  writer.writeDateTime(offsets[5], object.deletedAt);
  writer.writeString(offsets[6], object.deviceId);
  writer.writeDouble(offsets[7], object.discount);
  writer.writeDouble(offsets[8], object.electricAmount);
  writer.writeDouble(offsets[9], object.garbageAmount);
  writer.writeDouble(offsets[10], object.internetAmount);
  writer.writeBool(offsets[11], object.isSynced);
  writer.writeLong(offsets[12], object.month);
  writer.writeDouble(offsets[13], object.otherServiceAmount);
  writer.writeDouble(offsets[14], object.paidAmount);
  writer.writeDouble(offsets[15], object.parkingAmount);
  writer.writeDateTime(offsets[16], object.paymentDate);
  writer.writeDouble(offsets[17], object.promotion);
  writer.writeString(offsets[18], object.receiptNumber);
  writer.writeDouble(offsets[19], object.rentAmount);
  writer.writeString(offsets[20], object.roomUuid);
  writer.writeString(offsets[21], object.syncStatus.name);
  writer.writeString(offsets[22], object.tenantUuid);
  writer.writeDouble(offsets[23], object.totalAmount);
  writer.writeDateTime(offsets[24], object.updatedAt);
  writer.writeString(offsets[25], object.uuid);
  writer.writeLong(offsets[26], object.version);
  writer.writeDouble(offsets[27], object.waterAmount);
  writer.writeLong(offsets[28], object.year);
}

Payment _paymentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Payment();
  object.collectedBy = reader.readStringOrNull(offsets[0]);
  object.content = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.debtAmount = reader.readDoubleOrNull(offsets[3]);
  object.deleted = reader.readBool(offsets[4]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[5]);
  object.deviceId = reader.readString(offsets[6]);
  object.discount = reader.readDoubleOrNull(offsets[7]);
  object.electricAmount = reader.readDoubleOrNull(offsets[8]);
  object.garbageAmount = reader.readDoubleOrNull(offsets[9]);
  object.id = id;
  object.internetAmount = reader.readDoubleOrNull(offsets[10]);
  object.isSynced = reader.readBool(offsets[11]);
  object.month = reader.readLongOrNull(offsets[12]);
  object.otherServiceAmount = reader.readDoubleOrNull(offsets[13]);
  object.paidAmount = reader.readDoubleOrNull(offsets[14]);
  object.parkingAmount = reader.readDoubleOrNull(offsets[15]);
  object.paymentDate = reader.readDateTimeOrNull(offsets[16]);
  object.promotion = reader.readDoubleOrNull(offsets[17]);
  object.receiptNumber = reader.readStringOrNull(offsets[18]);
  object.rentAmount = reader.readDoubleOrNull(offsets[19]);
  object.roomUuid = reader.readStringOrNull(offsets[20]);
  object.syncStatus =
      _PaymentsyncStatusValueEnumMap[reader.readStringOrNull(offsets[21])] ??
          SyncStatus.pending;
  object.tenantUuid = reader.readStringOrNull(offsets[22]);
  object.totalAmount = reader.readDoubleOrNull(offsets[23]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[24]);
  object.uuid = reader.readStringOrNull(offsets[25]);
  object.version = reader.readLong(offsets[26]);
  object.waterAmount = reader.readDoubleOrNull(offsets[27]);
  object.year = reader.readLongOrNull(offsets[28]);
  return object;
}

P _paymentDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readDoubleOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (_PaymentsyncStatusValueEnumMap[reader.readStringOrNull(offset)] ??
          SyncStatus.pending) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readDoubleOrNull(offset)) as P;
    case 24:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readLong(offset)) as P;
    case 27:
      return (reader.readDoubleOrNull(offset)) as P;
    case 28:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PaymentsyncStatusEnumValueMap = {
  r'pending': r'pending',
  r'synced': r'synced',
  r'error': r'error',
};
const _PaymentsyncStatusValueEnumMap = {
  r'pending': SyncStatus.pending,
  r'synced': SyncStatus.synced,
  r'error': SyncStatus.error,
};

Id _paymentGetId(Payment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _paymentGetLinks(Payment object) {
  return [];
}

void _paymentAttach(IsarCollection<dynamic> col, Id id, Payment object) {
  object.id = id;
}

extension PaymentByIndex on IsarCollection<Payment> {
  Future<Payment?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  Payment? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<Payment?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<Payment?> getAllByUuidSync(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uuid', values);
  }

  Future<int> deleteAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uuid', values);
  }

  int deleteAllByUuidSync(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uuid', values);
  }

  Future<Id> putByUuid(Payment object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(Payment object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<Payment> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<Payment> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension PaymentQueryWhereSort on QueryBuilder<Payment, Payment, QWhere> {
  QueryBuilder<Payment, Payment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PaymentQueryWhere on QueryBuilder<Payment, Payment, QWhereClause> {
  QueryBuilder<Payment, Payment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Payment, Payment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> idBetween(
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

  QueryBuilder<Payment, Payment, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> uuidEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> uuidNotEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PaymentQueryFilter
    on QueryBuilder<Payment, Payment, QFilterCondition> {
  QueryBuilder<Payment, Payment, QAfterFilterCondition> collectedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'collectedBy',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> collectedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'collectedBy',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> collectedByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> collectedByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'collectedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> collectedByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'collectedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> collectedByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'collectedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> collectedByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'collectedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> collectedByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'collectedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> collectedByContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'collectedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> collectedByMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'collectedBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> collectedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      collectedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'collectedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> debtAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'debtAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> debtAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'debtAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> debtAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'debtAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> debtAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'debtAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> debtAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'debtAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> debtAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'debtAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deletedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deletedAtGreaterThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deviceIdEqualTo(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deviceIdGreaterThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deviceIdLessThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deviceIdBetween(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deviceIdStartsWith(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deviceIdEndsWith(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deviceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deviceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> discountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> discountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> discountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> discountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> discountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> discountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> electricAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'electricAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      electricAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'electricAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> electricAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'electricAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      electricAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'electricAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> electricAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'electricAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> electricAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'electricAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> garbageAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'garbageAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      garbageAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'garbageAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> garbageAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'garbageAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      garbageAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'garbageAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> garbageAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'garbageAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> garbageAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'garbageAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> internetAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'internetAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      internetAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'internetAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> internetAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'internetAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      internetAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'internetAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> internetAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'internetAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> internetAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'internetAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> monthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'month',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> monthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'month',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> monthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> monthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> monthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> monthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      otherServiceAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'otherServiceAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      otherServiceAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'otherServiceAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      otherServiceAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherServiceAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      otherServiceAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'otherServiceAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      otherServiceAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'otherServiceAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      otherServiceAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'otherServiceAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paidAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paidAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paidAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paidAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paidAmountEqualTo(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paidAmountGreaterThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paidAmountLessThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paidAmountBetween(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> parkingAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parkingAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      parkingAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parkingAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> parkingAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      parkingAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parkingAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> parkingAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parkingAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> parkingAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parkingAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paymentDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentDate',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paymentDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentDate',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paymentDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paymentDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paymentDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paymentDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> promotionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promotion',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> promotionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promotion',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> promotionEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promotion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> promotionGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promotion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> promotionLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promotion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> promotionBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promotion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> receiptNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'receiptNumber',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      receiptNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'receiptNumber',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> receiptNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      receiptNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> receiptNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> receiptNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiptNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> receiptNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> receiptNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> receiptNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> receiptNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiptNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> receiptNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiptNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      receiptNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiptNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> rentAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rentAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> rentAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rentAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> rentAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> rentAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> rentAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> rentAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roomUuid',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roomUuid',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> roomUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> syncStatusEqualTo(
    SyncStatus value, {
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> syncStatusGreaterThan(
    SyncStatus value, {
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> syncStatusLessThan(
    SyncStatus value, {
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> syncStatusBetween(
    SyncStatus lower,
    SyncStatus upper, {
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> syncStatusStartsWith(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> syncStatusEndsWith(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> syncStatusContains(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> syncStatusMatches(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tenantUuid',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tenantUuid',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tenantUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tenantUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenantUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> tenantUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tenantUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> totalAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> totalAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> totalAmountEqualTo(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> totalAmountGreaterThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> totalAmountLessThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> totalAmountBetween(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> versionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> versionGreaterThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> versionBetween(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> waterAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'waterAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> waterAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'waterAmount',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> waterAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> waterAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> waterAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> waterAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> yearEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> yearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> yearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> yearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PaymentQueryObject
    on QueryBuilder<Payment, Payment, QFilterCondition> {}

extension PaymentQueryLinks
    on QueryBuilder<Payment, Payment, QFilterCondition> {}

extension PaymentQuerySortBy on QueryBuilder<Payment, Payment, QSortBy> {
  QueryBuilder<Payment, Payment, QAfterSortBy> sortByCollectedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectedBy', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByCollectedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectedBy', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDebtAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDebtAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByElectricAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'electricAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByElectricAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'electricAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByGarbageAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'garbageAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByGarbageAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'garbageAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByInternetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internetAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByInternetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internetAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByOtherServiceAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherServiceAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByOtherServiceAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherServiceAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByParkingAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByParkingAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByPaymentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDate', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByPaymentDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDate', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByPromotion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotion', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByPromotionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotion', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByReceiptNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByReceiptNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByRentAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByRentAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByRoomUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByRoomUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByTenantUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantUuid', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByTenantUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantUuid', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByWaterAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByWaterAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension PaymentQuerySortThenBy
    on QueryBuilder<Payment, Payment, QSortThenBy> {
  QueryBuilder<Payment, Payment, QAfterSortBy> thenByCollectedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectedBy', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByCollectedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectedBy', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDebtAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDebtAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByElectricAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'electricAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByElectricAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'electricAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByGarbageAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'garbageAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByGarbageAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'garbageAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByInternetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internetAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByInternetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internetAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByOtherServiceAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherServiceAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByOtherServiceAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherServiceAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByParkingAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByParkingAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByPaymentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDate', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByPaymentDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentDate', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByPromotion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotion', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByPromotionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotion', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByReceiptNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByReceiptNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByRentAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByRentAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByRoomUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByRoomUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByTenantUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantUuid', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByTenantUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantUuid', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByWaterAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterAmount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByWaterAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterAmount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension PaymentQueryWhereDistinct
    on QueryBuilder<Payment, Payment, QDistinct> {
  QueryBuilder<Payment, Payment, QDistinct> distinctByCollectedBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collectedBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByDebtAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'debtAmount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deleted');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByElectricAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'electricAmount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByGarbageAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'garbageAmount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByInternetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'internetAmount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByOtherServiceAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherServiceAmount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidAmount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByParkingAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingAmount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByPaymentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentDate');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByPromotion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promotion');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByReceiptNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiptNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByRentAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentAmount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByRoomUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctBySyncStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByTenantUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tenantUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByWaterAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waterAmount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension PaymentQueryProperty
    on QueryBuilder<Payment, Payment, QQueryProperty> {
  QueryBuilder<Payment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Payment, String?, QQueryOperations> collectedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collectedBy');
    });
  }

  QueryBuilder<Payment, String?, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<Payment, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations> debtAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'debtAmount');
    });
  }

  QueryBuilder<Payment, bool, QQueryOperations> deletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deleted');
    });
  }

  QueryBuilder<Payment, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<Payment, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations> discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discount');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations> electricAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'electricAmount');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations> garbageAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'garbageAmount');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations> internetAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'internetAmount');
    });
  }

  QueryBuilder<Payment, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<Payment, int?, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations>
      otherServiceAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherServiceAmount');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations> paidAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidAmount');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations> parkingAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingAmount');
    });
  }

  QueryBuilder<Payment, DateTime?, QQueryOperations> paymentDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentDate');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations> promotionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promotion');
    });
  }

  QueryBuilder<Payment, String?, QQueryOperations> receiptNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiptNumber');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations> rentAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentAmount');
    });
  }

  QueryBuilder<Payment, String?, QQueryOperations> roomUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomUuid');
    });
  }

  QueryBuilder<Payment, SyncStatus, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<Payment, String?, QQueryOperations> tenantUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tenantUuid');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations> totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }

  QueryBuilder<Payment, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Payment, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }

  QueryBuilder<Payment, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }

  QueryBuilder<Payment, double?, QQueryOperations> waterAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waterAmount');
    });
  }

  QueryBuilder<Payment, int?, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
