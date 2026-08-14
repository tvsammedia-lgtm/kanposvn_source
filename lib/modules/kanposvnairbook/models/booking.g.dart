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
    r'commission': PropertySchema(
      id: 0,
      name: r'commission',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'flightOfferUuid': PropertySchema(
      id: 2,
      name: r'flightOfferUuid',
      type: IsarType.string,
    ),
    r'isCheckedIn': PropertySchema(
      id: 3,
      name: r'isCheckedIn',
      type: IsarType.bool,
    ),
    r'isDeleted': PropertySchema(
      id: 4,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'needsSync': PropertySchema(
      id: 5,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'passengerName': PropertySchema(
      id: 6,
      name: r'passengerName',
      type: IsarType.string,
    ),
    r'passengerPhone': PropertySchema(
      id: 7,
      name: r'passengerPhone',
      type: IsarType.string,
    ),
    r'pnrCode': PropertySchema(
      id: 8,
      name: r'pnrCode',
      type: IsarType.string,
    ),
    r'seatNumber': PropertySchema(
      id: 9,
      name: r'seatNumber',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.byte,
      enumMap: _BookingLocalstatusEnumValueMap,
    ),
    r'totalAmount': PropertySchema(
      id: 11,
      name: r'totalAmount',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 13,
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
  {
    final value = object.flightOfferUuid;
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
  {
    final value = object.seatNumber;
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
  writer.writeDouble(offsets[0], object.commission);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.flightOfferUuid);
  writer.writeBool(offsets[3], object.isCheckedIn);
  writer.writeBool(offsets[4], object.isDeleted);
  writer.writeBool(offsets[5], object.needsSync);
  writer.writeString(offsets[6], object.passengerName);
  writer.writeString(offsets[7], object.passengerPhone);
  writer.writeString(offsets[8], object.pnrCode);
  writer.writeString(offsets[9], object.seatNumber);
  writer.writeByte(offsets[10], object.status.index);
  writer.writeDouble(offsets[11], object.totalAmount);
  writer.writeDateTime(offsets[12], object.updatedAt);
  writer.writeString(offsets[13], object.uuid);
}

BookingLocal _bookingLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookingLocal();
  object.commission = reader.readDoubleOrNull(offsets[0]);
  object.createdAt = reader.readDateTimeOrNull(offsets[1]);
  object.flightOfferUuid = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.isCheckedIn = reader.readBool(offsets[3]);
  object.isDeleted = reader.readBool(offsets[4]);
  object.needsSync = reader.readBool(offsets[5]);
  object.passengerName = reader.readStringOrNull(offsets[6]);
  object.passengerPhone = reader.readStringOrNull(offsets[7]);
  object.pnrCode = reader.readStringOrNull(offsets[8]);
  object.seatNumber = reader.readStringOrNull(offsets[9]);
  object.status =
      _BookingLocalstatusValueEnumMap[reader.readByteOrNull(offsets[10])] ??
          BookingAirStatus.draft;
  object.totalAmount = reader.readDoubleOrNull(offsets[11]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[12]);
  object.uuid = reader.readStringOrNull(offsets[13]);
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (_BookingLocalstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          BookingAirStatus.draft) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
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
};
const _BookingLocalstatusValueEnumMap = {
  0: BookingAirStatus.draft,
  1: BookingAirStatus.pendingPayment,
  2: BookingAirStatus.confirmed,
  3: BookingAirStatus.cancelled,
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
  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commission');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByFlightOfferUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flightOfferUuid',
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

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctBySeatNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seatNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookingLocal, BookingLocal, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
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

  QueryBuilder<BookingLocal, double?, QQueryOperations> commissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commission');
    });
  }

  QueryBuilder<BookingLocal, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BookingLocal, String?, QQueryOperations>
      flightOfferUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flightOfferUuid');
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

  QueryBuilder<BookingLocal, String?, QQueryOperations> seatNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seatNumber');
    });
  }

  QueryBuilder<BookingLocal, BookingAirStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
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
