// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookingLocalCollection on Isar {
  IsarCollection<BookingLocal> get bookingLocals => this.collection();
}

const BookingLocalSchema = CollectionSchema(
  name: r'BookingLocal',
  id: -3603850071880143692,
  properties: {
    r'agentId': PropertySchema(
      id: 0,
      name: r'agentId',
      type: IsarType.string,
    ),
    r'commission': PropertySchema(
      id: 1,
      name: r'commission',
      type: IsarType.double,
    ),
    r'contactEmail': PropertySchema(
      id: 2,
      name: r'contactEmail',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'discountAmount': PropertySchema(
      id: 4,
      name: r'discountAmount',
      type: IsarType.double,
    ),
    r'expiresAt': PropertySchema(
      id: 5,
      name: r'expiresAt',
      type: IsarType.dateTime,
    ),
    r'flightOfferUuid': PropertySchema(
      id: 6,
      name: r'flightOfferUuid',
      type: IsarType.string,
    ),
    r'idempotencyKey': PropertySchema(
      id: 7,
      name: r'idempotencyKey',
      type: IsarType.string,
    ),
    r'isCheckedIn': PropertySchema(
      id: 8,
      name: r'isCheckedIn',
      type: IsarType.bool,
    ),
    r'isDeleted': PropertySchema(
      id: 9,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'needsSync': PropertySchema(
      id: 10,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'paidAmount': PropertySchema(
      id: 11,
      name: r'paidAmount',
      type: IsarType.double,
    ),
    r'passengerName': PropertySchema(
      id: 12,
      name: r'passengerName',
      type: IsarType.string,
    ),
    r'passengerPhone': PropertySchema(
      id: 13,
      name: r'passengerPhone',
      type: IsarType.string,
    ),
    r'pnrCode': PropertySchema(
      id: 14,
      name: r'pnrCode',
      type: IsarType.string,
    ),
    r'profit': PropertySchema(
      id: 15,
      name: r'profit',
      type: IsarType.double,
    ),
    r'promoCode': PropertySchema(
      id: 16,
      name: r'promoCode',
      type: IsarType.string,
    ),
    r'providerBookingId': PropertySchema(
      id: 17,
      name: r'providerBookingId',
      type: IsarType.string,
    ),
    r'remainingAmount': PropertySchema(
      id: 18,
      name: r'remainingAmount',
      type: IsarType.double,
    ),
    r'seatNumber': PropertySchema(
      id: 19,
      name: r'seatNumber',
      type: IsarType.string,
    ),
    r'serviceFee': PropertySchema(
      id: 20,
      name: r'serviceFee',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 21,
      name: r'status',
      type: IsarType.byte,
      enumMap: _BookingLocalstatusEnumValueMap,
    ),
    r'supplierPrice': PropertySchema(
      id: 22,
      name: r'supplierPrice',
      type: IsarType.double,
    ),
    r'ticketNumber': PropertySchema(
      id: 23,
      name: r'ticketNumber',
      type: IsarType.string,
    ),
    r'totalAmount': PropertySchema(
      id: 24,
      name: r'totalAmount',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 25,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 26,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _bookingLocalEstimateSize,
  serialize: _bookingLocalSerialize,
  deserialize: _bookingLocalDeserialize,
  deserializeProp: _bookingLocalDeserializeProp,
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
  getId: _bookingLocalGetId,
  getLinks: _bookingLocalGetLinks,
  attach: _bookingLocalAttach,
  version: '3.1.0+1',
);

int _bookingLocalEstimateSize(
  BookingLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.agentId.length * 3;
  bytesCount += 3 + object.contactEmail.length * 3;
  {
    final value = object.flightOfferUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idempotencyKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.passengerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.passengerPhone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pnrCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.promoCode.length * 3;
  {
    final value = object.providerBookingId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.seatNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ticketNumber;
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

void _bookingLocalSerialize(
  BookingLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.agentId);
  writer.writeDouble(offsets[1], object.commission);
  writer.writeString(offsets[2], object.contactEmail);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDouble(offsets[4], object.discountAmount);
  writer.writeDateTime(offsets[5], object.expiresAt);
  writer.writeString(offsets[6], object.flightOfferUuid);
  writer.writeString(offsets[7], object.idempotencyKey);
  writer.writeBool(offsets[8], object.isCheckedIn);
  writer.writeBool(offsets[9], object.isDeleted);
  writer.writeBool(offsets[10], object.needsSync);
  writer.writeDouble(offsets[11], object.paidAmount);
  writer.writeString(offsets[12], object.passengerName);
  writer.writeString(offsets[13], object.passengerPhone);
  writer.writeString(offsets[14], object.pnrCode);
  writer.writeDouble(offsets[15], object.profit);
  writer.writeString(offsets[16], object.promoCode);
  writer.writeString(offsets[17], object.providerBookingId);
  writer.writeDouble(offsets[18], object.remainingAmount);
  writer.writeString(offsets[19], object.seatNumber);
  writer.writeDouble(offsets[20], object.serviceFee);
  writer.writeByte(offsets[21], object.status.index);
  writer.writeDouble(offsets[22], object.supplierPrice);
  writer.writeString(offsets[23], object.ticketNumber);
  writer.writeDouble(offsets[24], object.totalAmount);
  writer.writeDateTime(offsets[25], object.updatedAt);
  writer.writeString(offsets[26], object.uuid);
}

BookingLocal _bookingLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookingLocal();
  object.agentId = reader.readString(offsets[0]);
  object.commission = reader.readDoubleOrNull(offsets[1]);
  object.contactEmail = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTimeOrNull(offsets[3]);
  object.discountAmount = reader.readDouble(offsets[4]);
  object.expiresAt = reader.readDateTimeOrNull(offsets[5]);
  object.flightOfferUuid = reader.readStringOrNull(offsets[6]);
  object.id = id;
  object.idempotencyKey = reader.readStringOrNull(offsets[7]);
  object.isCheckedIn = reader.readBool(offsets[8]);
  object.isDeleted = reader.readBool(offsets[9]);
  object.needsSync = reader.readBool(offsets[10]);
  object.paidAmount = reader.readDouble(offsets[11]);
  object.passengerName = reader.readStringOrNull(offsets[12]);
  object.passengerPhone = reader.readStringOrNull(offsets[13]);
  object.pnrCode = reader.readStringOrNull(offsets[14]);
  object.profit = reader.readDouble(offsets[15]);
  object.promoCode = reader.readString(offsets[16]);
  object.providerBookingId = reader.readStringOrNull(offsets[17]);
  object.remainingAmount = reader.readDouble(offsets[18]);
  object.seatNumber = reader.readStringOrNull(offsets[19]);
  object.serviceFee = reader.readDouble(offsets[20]);
  object.status =
      _BookingLocalstatusValueEnumMap[reader.readByteOrNull(offsets[21])] ??
          BookingAirStatus.draft;
  object.supplierPrice = reader.readDouble(offsets[22]);
  object.ticketNumber = reader.readStringOrNull(offsets[23]);
  object.totalAmount = reader.readDoubleOrNull(offsets[24]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[25]);
  object.uuid = reader.readStringOrNull(offsets[26]);
  return object;
}

P _bookingLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (_BookingLocalstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          BookingAirStatus.draft) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readDoubleOrNull(offset)) as P;
    case 25:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BookingLocalstatusEnumValueMap = {
  'draft': 0,
  'pendingPayment': 1,
  'confirmed': 2,
  'cancelled': 3,
  'held': 4,
  'paid': 5,
  'ticketed': 6,
  'cancelRequested': 7,
  'expired': 8,
  'failed': 9,
  'refunded': 10,
};
const _BookingLocalstatusValueEnumMap = {
  0: BookingAirStatus.draft,
  1: BookingAirStatus.pendingPayment,
  2: BookingAirStatus.confirmed,
  3: BookingAirStatus.cancelled,
  4: BookingAirStatus.held,
  5: BookingAirStatus.paid,
  6: BookingAirStatus.ticketed,
  7: BookingAirStatus.cancelRequested,
  8: BookingAirStatus.expired,
  9: BookingAirStatus.failed,
  10: BookingAirStatus.refunded,
};

Id _bookingLocalGetId(BookingLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookingLocalGetLinks(BookingLocal object) {
  return [];
}

void _bookingLocalAttach(
    IsarCollection<dynamic> col, Id id, BookingLocal object) {
  object.id = id;
}

extension BookingLocalByIndex on IsarCollection<BookingLocal> {
  Future<BookingLocal?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  BookingLocal? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<BookingLocal?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<BookingLocal?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(BookingLocal object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(BookingLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<BookingLocal> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<BookingLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension BookingLocalQueryWhereSort
    on QueryBuilder<BookingLocal, BookingLocal, QWhere> {
  QueryBuilder<BookingLocal, BookingLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BookingLocalQueryWhere
    on QueryBuilder<BookingLocal, BookingLocal, QWhereClause> {
  QueryBuilder<BookingLocal, BookingLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterWhereClause> uuidNotEqualTo(
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

extension BookingLocalQueryFilter
    on QueryBuilder<BookingLocal, BookingLocal, QFilterCondition> {
  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      agentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'agentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      agentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'agentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      agentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'agentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      agentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'agentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      agentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'agentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      agentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'agentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      agentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'agentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      agentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'agentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      agentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'agentId',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      agentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'agentId',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      commissionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'commission',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      commissionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'commission',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      contactEmailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      contactEmailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      contactEmailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      contactEmailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactEmail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      contactEmailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      contactEmailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      contactEmailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      contactEmailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactEmail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      contactEmailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      contactEmailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      discountAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      discountAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      discountAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      discountAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      expiresAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiresAt',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      expiresAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiresAt',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      expiresAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      expiresAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      expiresAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      expiresAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiresAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flightOfferUuid',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flightOfferUuid',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flightOfferUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flightOfferUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flightOfferUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flightOfferUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'flightOfferUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'flightOfferUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flightOfferUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'flightOfferUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flightOfferUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      flightOfferUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flightOfferUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idempotencyKey',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idempotencyKey',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idempotencyKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idempotencyKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idempotencyKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idempotencyKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idempotencyKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idempotencyKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idempotencyKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idempotencyKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idempotencyKey',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      idempotencyKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idempotencyKey',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      isCheckedInEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCheckedIn',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      needsSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      paidAmountEqualTo(
    double value, {
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      paidAmountGreaterThan(
    double value, {
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      paidAmountLessThan(
    double value, {
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      paidAmountBetween(
    double lower,
    double upper, {
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'passengerName',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'passengerName',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passengerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passengerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passengerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passengerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passengerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passengerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passengerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passengerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passengerName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passengerName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'passengerPhone',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'passengerPhone',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passengerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passengerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passengerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passengerPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passengerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passengerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passengerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passengerPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passengerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      passengerPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passengerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pnrCode',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pnrCode',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pnrCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pnrCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pnrCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pnrCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pnrCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pnrCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pnrCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pnrCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pnrCode',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      pnrCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pnrCode',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> profitEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      profitGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'profit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      profitLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'profit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> profitBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'profit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      promoCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      promoCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      promoCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      promoCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promoCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      promoCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'promoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      promoCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'promoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      promoCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'promoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      promoCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'promoCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      promoCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promoCode',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      promoCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'promoCode',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'providerBookingId',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'providerBookingId',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'providerBookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'providerBookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'providerBookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'providerBookingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'providerBookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'providerBookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'providerBookingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'providerBookingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'providerBookingId',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      providerBookingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'providerBookingId',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      remainingAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remainingAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      remainingAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remainingAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      remainingAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remainingAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      remainingAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remainingAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'seatNumber',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'seatNumber',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seatNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seatNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seatNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seatNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'seatNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'seatNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'seatNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'seatNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seatNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      seatNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'seatNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      serviceFeeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      serviceFeeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serviceFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      serviceFeeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serviceFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      serviceFeeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serviceFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> statusEqualTo(
      BookingAirStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      statusGreaterThan(
    BookingAirStatus value, {
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      statusLessThan(
    BookingAirStatus value, {
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> statusBetween(
    BookingAirStatus lower,
    BookingAirStatus upper, {
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      supplierPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      supplierPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supplierPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      supplierPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supplierPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      supplierPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supplierPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ticketNumber',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ticketNumber',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ticketNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ticketNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ticketNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ticketNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ticketNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticketNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticketNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      ticketNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticketNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      totalAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      totalAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      totalAmountEqualTo(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      totalAmountGreaterThan(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      totalAmountLessThan(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      totalAmountBetween(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      uuidGreaterThan(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      uuidStartsWith(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> uuidContains(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension BookingLocalQueryObject
    on QueryBuilder<BookingLocal, BookingLocal, QFilterCondition> {}

extension BookingLocalQueryLinks
    on QueryBuilder<BookingLocal, BookingLocal, QFilterCondition> {}

extension BookingLocalQuerySortBy
    on QueryBuilder<BookingLocal, BookingLocal, QSortBy> {
  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByContactEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactEmail', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByContactEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactEmail', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByFlightOfferUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flightOfferUuid', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByFlightOfferUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flightOfferUuid', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByIdempotencyKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idempotencyKey', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByIdempotencyKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idempotencyKey', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByIsCheckedIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCheckedIn', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByIsCheckedInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCheckedIn', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByPassengerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerName', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByPassengerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerName', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByPassengerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerPhone', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByPassengerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerPhone', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByPnrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pnrCode', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByPnrCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pnrCode', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profit', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profit', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByPromoCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoCode', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByPromoCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoCode', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByProviderBookingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providerBookingId', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByProviderBookingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providerBookingId', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByRemainingAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingAmount', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByRemainingAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingAmount', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortBySeatNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatNumber', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortBySeatNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatNumber', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByServiceFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceFee', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByServiceFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceFee', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortBySupplierPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierPrice', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortBySupplierPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierPrice', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByTicketNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketNumber', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByTicketNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketNumber', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension BookingLocalQuerySortThenBy
    on QueryBuilder<BookingLocal, BookingLocal, QSortThenBy> {
  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByContactEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactEmail', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByContactEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactEmail', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByFlightOfferUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flightOfferUuid', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByFlightOfferUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flightOfferUuid', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByIdempotencyKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idempotencyKey', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByIdempotencyKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idempotencyKey', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByIsCheckedIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCheckedIn', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByIsCheckedInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCheckedIn', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByPassengerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerName', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByPassengerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerName', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByPassengerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerPhone', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByPassengerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerPhone', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByPnrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pnrCode', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByPnrCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pnrCode', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profit', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profit', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByPromoCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoCode', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByPromoCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoCode', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByProviderBookingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providerBookingId', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByProviderBookingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providerBookingId', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByRemainingAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingAmount', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByRemainingAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingAmount', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenBySeatNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatNumber', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenBySeatNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatNumber', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByServiceFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceFee', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByServiceFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceFee', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenBySupplierPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierPrice', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenBySupplierPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierPrice', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByTicketNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketNumber', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByTicketNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketNumber', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy>
      thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension BookingLocalQueryWhereDistinct
    on QueryBuilder<BookingLocal, BookingLocal, QDistinct> {
  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByAgentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'agentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commission');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByContactEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactEmail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct>
      distinctByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountAmount');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiresAt');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByFlightOfferUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flightOfferUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByIdempotencyKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idempotencyKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByIsCheckedIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCheckedIn');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidAmount');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByPassengerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passengerName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByPassengerPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passengerPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByPnrCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pnrCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profit');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByPromoCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promoCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct>
      distinctByProviderBookingId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'providerBookingId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct>
      distinctByRemainingAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remainingAmount');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctBySeatNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seatNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByServiceFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serviceFee');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct>
      distinctBySupplierPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supplierPrice');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByTicketNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticketNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension BookingLocalQueryProperty
    on QueryBuilder<BookingLocal, BookingLocal, QQueryProperty> {
  QueryBuilder<BookingLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookingLocal, String, QQueryOperations> agentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'agentId');
    });
  }

  QueryBuilder<BookingLocal, double?, QQueryOperations> commissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commission');
    });
  }

  QueryBuilder<BookingLocal, String, QQueryOperations> contactEmailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactEmail');
    });
  }

  QueryBuilder<BookingLocal, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BookingLocal, double, QQueryOperations>
      discountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountAmount');
    });
  }

  QueryBuilder<BookingLocal, DateTime?, QQueryOperations> expiresAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiresAt');
    });
  }

  QueryBuilder<BookingLocal, String?, QQueryOperations>
      flightOfferUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flightOfferUuid');
    });
  }

  QueryBuilder<BookingLocal, String?, QQueryOperations>
      idempotencyKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idempotencyKey');
    });
  }

  QueryBuilder<BookingLocal, bool, QQueryOperations> isCheckedInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCheckedIn');
    });
  }

  QueryBuilder<BookingLocal, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<BookingLocal, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<BookingLocal, double, QQueryOperations> paidAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidAmount');
    });
  }

  QueryBuilder<BookingLocal, String?, QQueryOperations>
      passengerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passengerName');
    });
  }

  QueryBuilder<BookingLocal, String?, QQueryOperations>
      passengerPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passengerPhone');
    });
  }

  QueryBuilder<BookingLocal, String?, QQueryOperations> pnrCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pnrCode');
    });
  }

  QueryBuilder<BookingLocal, double, QQueryOperations> profitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profit');
    });
  }

  QueryBuilder<BookingLocal, String, QQueryOperations> promoCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promoCode');
    });
  }

  QueryBuilder<BookingLocal, String?, QQueryOperations>
      providerBookingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'providerBookingId');
    });
  }

  QueryBuilder<BookingLocal, double, QQueryOperations>
      remainingAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remainingAmount');
    });
  }

  QueryBuilder<BookingLocal, String?, QQueryOperations> seatNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seatNumber');
    });
  }

  QueryBuilder<BookingLocal, double, QQueryOperations> serviceFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serviceFee');
    });
  }

  QueryBuilder<BookingLocal, BookingAirStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<BookingLocal, double, QQueryOperations> supplierPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supplierPrice');
    });
  }

  QueryBuilder<BookingLocal, String?, QQueryOperations> ticketNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticketNumber');
    });
  }

  QueryBuilder<BookingLocal, double?, QQueryOperations> totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }

  QueryBuilder<BookingLocal, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<BookingLocal, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
