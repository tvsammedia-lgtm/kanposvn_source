// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetXeOmPaymentCollection on Isar {
  IsarCollection<XeOmPayment> get xeOmPayments => this.collection();
}

const XeOmPaymentSchema = CollectionSchema(
  name: r'XeOmPayment',
  id: 1693020463258688802,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'bookingUuid': PropertySchema(
      id: 1,
      name: r'bookingUuid',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerUuid': PropertySchema(
      id: 3,
      name: r'customerUuid',
      type: IsarType.string,
    ),
    r'driverCommission': PropertySchema(
      id: 4,
      name: r'driverCommission',
      type: IsarType.double,
    ),
    r'driverUuid': PropertySchema(
      id: 5,
      name: r'driverUuid',
      type: IsarType.string,
    ),
    r'isDeleted': PropertySchema(
      id: 6,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'method': PropertySchema(
      id: 7,
      name: r'method',
      type: IsarType.byte,
      enumMap: _XeOmPaymentmethodEnumValueMap,
    ),
    r'notes': PropertySchema(
      id: 8,
      name: r'notes',
      type: IsarType.string,
    ),
    r'paidAt': PropertySchema(
      id: 9,
      name: r'paidAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.byte,
      enumMap: _XeOmPaymentstatusEnumValueMap,
    ),
    r'syncVersion': PropertySchema(
      id: 11,
      name: r'syncVersion',
      type: IsarType.long,
    ),
    r'transactionReference': PropertySchema(
      id: 12,
      name: r'transactionReference',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 14,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _xeOmPaymentEstimateSize,
  serialize: _xeOmPaymentSerialize,
  deserialize: _xeOmPaymentDeserialize,
  deserializeProp: _xeOmPaymentDeserializeProp,
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
  getId: _xeOmPaymentGetId,
  getLinks: _xeOmPaymentGetLinks,
  attach: _xeOmPaymentAttach,
  version: '3.1.0+1',
);

int _xeOmPaymentEstimateSize(
  XeOmPayment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bookingUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.driverUuid;
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
    final value = object.transactionReference;
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

void _xeOmPaymentSerialize(
  XeOmPayment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.bookingUuid);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.customerUuid);
  writer.writeDouble(offsets[4], object.driverCommission);
  writer.writeString(offsets[5], object.driverUuid);
  writer.writeBool(offsets[6], object.isDeleted);
  writer.writeByte(offsets[7], object.method.index);
  writer.writeString(offsets[8], object.notes);
  writer.writeDateTime(offsets[9], object.paidAt);
  writer.writeByte(offsets[10], object.status.index);
  writer.writeLong(offsets[11], object.syncVersion);
  writer.writeString(offsets[12], object.transactionReference);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeString(offsets[14], object.uuid);
}

XeOmPayment _xeOmPaymentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = XeOmPayment();
  object.amount = reader.readDoubleOrNull(offsets[0]);
  object.bookingUuid = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.customerUuid = reader.readStringOrNull(offsets[3]);
  object.driverCommission = reader.readDoubleOrNull(offsets[4]);
  object.driverUuid = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[6]);
  object.method =
      _XeOmPaymentmethodValueEnumMap[reader.readByteOrNull(offsets[7])] ??
          PaymentMethod.cash;
  object.notes = reader.readStringOrNull(offsets[8]);
  object.paidAt = reader.readDateTimeOrNull(offsets[9]);
  object.status =
      _XeOmPaymentstatusValueEnumMap[reader.readByteOrNull(offsets[10])] ??
          PaymentStatus.pending;
  object.syncVersion = reader.readLong(offsets[11]);
  object.transactionReference = reader.readStringOrNull(offsets[12]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[13]);
  object.uuid = reader.readStringOrNull(offsets[14]);
  return object;
}

P _xeOmPaymentDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (_XeOmPaymentmethodValueEnumMap[reader.readByteOrNull(offset)] ??
          PaymentMethod.cash) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (_XeOmPaymentstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          PaymentStatus.pending) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _XeOmPaymentmethodEnumValueMap = {
  'cash': 0,
  'qr': 1,
  'momo': 2,
  'zaloPay': 3,
  'vnpay': 4,
  'bankTransfer': 5,
};
const _XeOmPaymentmethodValueEnumMap = {
  0: PaymentMethod.cash,
  1: PaymentMethod.qr,
  2: PaymentMethod.momo,
  3: PaymentMethod.zaloPay,
  4: PaymentMethod.vnpay,
  5: PaymentMethod.bankTransfer,
};
const _XeOmPaymentstatusEnumValueMap = {
  'pending': 0,
  'completed': 1,
  'failed': 2,
  'refunded': 3,
};
const _XeOmPaymentstatusValueEnumMap = {
  0: PaymentStatus.pending,
  1: PaymentStatus.completed,
  2: PaymentStatus.failed,
  3: PaymentStatus.refunded,
};

Id _xeOmPaymentGetId(XeOmPayment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _xeOmPaymentGetLinks(XeOmPayment object) {
  return [];
}

void _xeOmPaymentAttach(
    IsarCollection<dynamic> col, Id id, XeOmPayment object) {
  object.id = id;
}

extension XeOmPaymentByIndex on IsarCollection<XeOmPayment> {
  Future<XeOmPayment?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  XeOmPayment? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<XeOmPayment?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<XeOmPayment?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(XeOmPayment object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(XeOmPayment object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<XeOmPayment> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<XeOmPayment> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension XeOmPaymentQueryWhereSort
    on QueryBuilder<XeOmPayment, XeOmPayment, QWhere> {
  QueryBuilder<XeOmPayment, XeOmPayment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension XeOmPaymentQueryWhere
    on QueryBuilder<XeOmPayment, XeOmPayment, QWhereClause> {
  QueryBuilder<XeOmPayment, XeOmPayment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterWhereClause> idBetween(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterWhereClause> uuidNotEqualTo(
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

extension XeOmPaymentQueryFilter
    on QueryBuilder<XeOmPayment, XeOmPayment, QFilterCondition> {
  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> amountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      amountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> amountEqualTo(
    double? value, {
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      amountGreaterThan(
    double? value, {
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> amountLessThan(
    double? value, {
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> amountBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bookingUuid',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bookingUuid',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookingUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookingUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      bookingUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookingUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerUuid',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerUuid',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      customerUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverCommissionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverCommission',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverCommissionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverCommission',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverCommissionEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverCommission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverCommissionGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverCommission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverCommissionLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverCommission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverCommissionBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverCommission',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverUuid',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverUuid',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      driverUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> methodEqualTo(
      PaymentMethod value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'method',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      methodGreaterThan(
    PaymentMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'method',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> methodLessThan(
    PaymentMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'method',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> methodBetween(
    PaymentMethod lower,
    PaymentMethod upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'method',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> paidAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paidAt',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      paidAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paidAt',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> paidAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      paidAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> paidAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> paidAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> statusEqualTo(
      PaymentStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      statusGreaterThan(
    PaymentStatus value, {
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> statusLessThan(
    PaymentStatus value, {
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> statusBetween(
    PaymentStatus lower,
    PaymentStatus upper, {
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      syncVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      syncVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      syncVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionReference',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionReference',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionReference',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionReference',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionReference',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      transactionReferenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionReference',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> uuidContains(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension XeOmPaymentQueryObject
    on QueryBuilder<XeOmPayment, XeOmPayment, QFilterCondition> {}

extension XeOmPaymentQueryLinks
    on QueryBuilder<XeOmPayment, XeOmPayment, QFilterCondition> {}

extension XeOmPaymentQuerySortBy
    on QueryBuilder<XeOmPayment, XeOmPayment, QSortBy> {
  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByBookingUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByBookingUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByCustomerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy>
      sortByCustomerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy>
      sortByDriverCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverCommission', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy>
      sortByDriverCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverCommission', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByPaidAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByPaidAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy>
      sortByTransactionReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionReference', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy>
      sortByTransactionReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionReference', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension XeOmPaymentQuerySortThenBy
    on QueryBuilder<XeOmPayment, XeOmPayment, QSortThenBy> {
  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByBookingUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByBookingUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByCustomerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy>
      thenByCustomerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy>
      thenByDriverCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverCommission', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy>
      thenByDriverCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverCommission', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByPaidAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByPaidAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy>
      thenByTransactionReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionReference', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy>
      thenByTransactionReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionReference', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension XeOmPaymentQueryWhereDistinct
    on QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> {
  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByBookingUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookingUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByCustomerUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct>
      distinctByDriverCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverCommission');
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByDriverUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'method');
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByPaidAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidAt');
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct>
      distinctByTransactionReference({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionReference',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<XeOmPayment, XeOmPayment, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension XeOmPaymentQueryProperty
    on QueryBuilder<XeOmPayment, XeOmPayment, QQueryProperty> {
  QueryBuilder<XeOmPayment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<XeOmPayment, double?, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<XeOmPayment, String?, QQueryOperations> bookingUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookingUuid');
    });
  }

  QueryBuilder<XeOmPayment, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<XeOmPayment, String?, QQueryOperations> customerUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerUuid');
    });
  }

  QueryBuilder<XeOmPayment, double?, QQueryOperations>
      driverCommissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverCommission');
    });
  }

  QueryBuilder<XeOmPayment, String?, QQueryOperations> driverUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverUuid');
    });
  }

  QueryBuilder<XeOmPayment, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<XeOmPayment, PaymentMethod, QQueryOperations> methodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'method');
    });
  }

  QueryBuilder<XeOmPayment, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<XeOmPayment, DateTime?, QQueryOperations> paidAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidAt');
    });
  }

  QueryBuilder<XeOmPayment, PaymentStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<XeOmPayment, int, QQueryOperations> syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<XeOmPayment, String?, QQueryOperations>
      transactionReferenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionReference');
    });
  }

  QueryBuilder<XeOmPayment, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<XeOmPayment, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
