// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_booking.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRoomReservationCollection on Isar {
  IsarCollection<RoomReservation> get roomReservations => this.collection();
}

const RoomReservationSchema = CollectionSchema(
  name: r'RoomReservation',
  id: -6689705726899304893,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerName': PropertySchema(
      id: 1,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'customerPhone': PropertySchema(
      id: 2,
      name: r'customerPhone',
      type: IsarType.string,
    ),
    r'deletedAt': PropertySchema(
      id: 3,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'depositAmount': PropertySchema(
      id: 4,
      name: r'depositAmount',
      type: IsarType.double,
    ),
    r'deviceId': PropertySchema(
      id: 5,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'expectedCheckIn': PropertySchema(
      id: 6,
      name: r'expectedCheckIn',
      type: IsarType.dateTime,
    ),
    r'expectedCheckOut': PropertySchema(
      id: 7,
      name: r'expectedCheckOut',
      type: IsarType.dateTime,
    ),
    r'guestCount': PropertySchema(
      id: 8,
      name: r'guestCount',
      type: IsarType.long,
    ),
    r'isSynced': PropertySchema(
      id: 9,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'note': PropertySchema(
      id: 10,
      name: r'note',
      type: IsarType.string,
    ),
    r'reservationCode': PropertySchema(
      id: 11,
      name: r'reservationCode',
      type: IsarType.string,
    ),
    r'reservationId': PropertySchema(
      id: 12,
      name: r'reservationId',
      type: IsarType.string,
    ),
    r'source': PropertySchema(
      id: 13,
      name: r'source',
      type: IsarType.byte,
      enumMap: _RoomReservationsourceEnumValueMap,
    ),
    r'status': PropertySchema(
      id: 14,
      name: r'status',
      type: IsarType.byte,
      enumMap: _RoomReservationstatusEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 15,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 16,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _roomReservationEstimateSize,
  serialize: _roomReservationSerialize,
  deserialize: _roomReservationDeserialize,
  deserializeProp: _roomReservationDeserializeProp,
  idName: r'id',
  indexes: {
    r'reservationId': IndexSchema(
      id: -5057117933484024607,
      name: r'reservationId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'reservationId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'room': LinkSchema(
      id: 4253992943267420742,
      name: r'room',
      target: r'HotelRoom',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _roomReservationGetId,
  getLinks: _roomReservationGetLinks,
  attach: _roomReservationAttach,
  version: '3.1.0+1',
);

int _roomReservationEstimateSize(
  RoomReservation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customerName.length * 3;
  bytesCount += 3 + object.customerPhone.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.note.length * 3;
  bytesCount += 3 + object.reservationCode.length * 3;
  bytesCount += 3 + object.reservationId.length * 3;
  return bytesCount;
}

void _roomReservationSerialize(
  RoomReservation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.customerName);
  writer.writeString(offsets[2], object.customerPhone);
  writer.writeDateTime(offsets[3], object.deletedAt);
  writer.writeDouble(offsets[4], object.depositAmount);
  writer.writeString(offsets[5], object.deviceId);
  writer.writeDateTime(offsets[6], object.expectedCheckIn);
  writer.writeDateTime(offsets[7], object.expectedCheckOut);
  writer.writeLong(offsets[8], object.guestCount);
  writer.writeBool(offsets[9], object.isSynced);
  writer.writeString(offsets[10], object.note);
  writer.writeString(offsets[11], object.reservationCode);
  writer.writeString(offsets[12], object.reservationId);
  writer.writeByte(offsets[13], object.source.index);
  writer.writeByte(offsets[14], object.status.index);
  writer.writeDateTime(offsets[15], object.updatedAt);
  writer.writeLong(offsets[16], object.version);
}

RoomReservation _roomReservationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RoomReservation();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.customerName = reader.readString(offsets[1]);
  object.customerPhone = reader.readString(offsets[2]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[3]);
  object.depositAmount = reader.readDouble(offsets[4]);
  object.deviceId = reader.readString(offsets[5]);
  object.expectedCheckIn = reader.readDateTimeOrNull(offsets[6]);
  object.expectedCheckOut = reader.readDateTimeOrNull(offsets[7]);
  object.guestCount = reader.readLong(offsets[8]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[9]);
  object.note = reader.readString(offsets[10]);
  object.reservationCode = reader.readString(offsets[11]);
  object.reservationId = reader.readString(offsets[12]);
  object.source =
      _RoomReservationsourceValueEnumMap[reader.readByteOrNull(offsets[13])] ??
          BookingSource.walkIn;
  object.status =
      _RoomReservationstatusValueEnumMap[reader.readByteOrNull(offsets[14])] ??
          ReservationStatus.PENDING;
  object.updatedAt = reader.readDateTime(offsets[15]);
  object.version = reader.readLong(offsets[16]);
  return object;
}

P _roomReservationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (_RoomReservationsourceValueEnumMap[
              reader.readByteOrNull(offset)] ??
          BookingSource.walkIn) as P;
    case 14:
      return (_RoomReservationstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ReservationStatus.PENDING) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RoomReservationsourceEnumValueMap = {
  'walkIn': 0,
  'bookingCom': 1,
  'agoda': 2,
  'traveloka': 3,
  'dienThoai': 4,
  'facebook': 5,
};
const _RoomReservationsourceValueEnumMap = {
  0: BookingSource.walkIn,
  1: BookingSource.bookingCom,
  2: BookingSource.agoda,
  3: BookingSource.traveloka,
  4: BookingSource.dienThoai,
  5: BookingSource.facebook,
};
const _RoomReservationstatusEnumValueMap = {
  'PENDING': 0,
  'CHECKED_IN': 1,
  'CANCELLED': 2,
};
const _RoomReservationstatusValueEnumMap = {
  0: ReservationStatus.PENDING,
  1: ReservationStatus.CHECKED_IN,
  2: ReservationStatus.CANCELLED,
};

Id _roomReservationGetId(RoomReservation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _roomReservationGetLinks(RoomReservation object) {
  return [object.room];
}

void _roomReservationAttach(
    IsarCollection<dynamic> col, Id id, RoomReservation object) {
  object.id = id;
  object.room.attach(col, col.isar.collection<HotelRoom>(), r'room', id);
}

extension RoomReservationByIndex on IsarCollection<RoomReservation> {
  Future<RoomReservation?> getByReservationId(String reservationId) {
    return getByIndex(r'reservationId', [reservationId]);
  }

  RoomReservation? getByReservationIdSync(String reservationId) {
    return getByIndexSync(r'reservationId', [reservationId]);
  }

  Future<bool> deleteByReservationId(String reservationId) {
    return deleteByIndex(r'reservationId', [reservationId]);
  }

  bool deleteByReservationIdSync(String reservationId) {
    return deleteByIndexSync(r'reservationId', [reservationId]);
  }

  Future<List<RoomReservation?>> getAllByReservationId(
      List<String> reservationIdValues) {
    final values = reservationIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'reservationId', values);
  }

  List<RoomReservation?> getAllByReservationIdSync(
      List<String> reservationIdValues) {
    final values = reservationIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'reservationId', values);
  }

  Future<int> deleteAllByReservationId(List<String> reservationIdValues) {
    final values = reservationIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'reservationId', values);
  }

  int deleteAllByReservationIdSync(List<String> reservationIdValues) {
    final values = reservationIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'reservationId', values);
  }

  Future<Id> putByReservationId(RoomReservation object) {
    return putByIndex(r'reservationId', object);
  }

  Id putByReservationIdSync(RoomReservation object, {bool saveLinks = true}) {
    return putByIndexSync(r'reservationId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByReservationId(List<RoomReservation> objects) {
    return putAllByIndex(r'reservationId', objects);
  }

  List<Id> putAllByReservationIdSync(List<RoomReservation> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'reservationId', objects, saveLinks: saveLinks);
  }
}

extension RoomReservationQueryWhereSort
    on QueryBuilder<RoomReservation, RoomReservation, QWhere> {
  QueryBuilder<RoomReservation, RoomReservation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RoomReservationQueryWhere
    on QueryBuilder<RoomReservation, RoomReservation, QWhereClause> {
  QueryBuilder<RoomReservation, RoomReservation, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterWhereClause>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterWhereClause> idBetween(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterWhereClause>
      reservationIdEqualTo(String reservationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reservationId',
        value: [reservationId],
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterWhereClause>
      reservationIdNotEqualTo(String reservationId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reservationId',
              lower: [],
              upper: [reservationId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reservationId',
              lower: [reservationId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reservationId',
              lower: [reservationId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reservationId',
              lower: [],
              upper: [reservationId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RoomReservationQueryFilter
    on QueryBuilder<RoomReservation, RoomReservation, QFilterCondition> {
  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerPhoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      customerPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deletedAtGreaterThan(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deletedAtLessThan(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deletedAtBetween(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      depositAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'depositAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      depositAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'depositAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      depositAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'depositAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      depositAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'depositAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deviceIdEqualTo(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deviceIdGreaterThan(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deviceIdLessThan(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deviceIdBetween(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deviceIdStartsWith(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deviceIdEndsWith(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expectedCheckIn',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expectedCheckIn',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckInEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expectedCheckIn',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckInGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expectedCheckIn',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckInLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expectedCheckIn',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckInBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expectedCheckIn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckOutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expectedCheckOut',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckOutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expectedCheckOut',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckOutEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expectedCheckOut',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckOutGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expectedCheckOut',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckOutLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expectedCheckOut',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      expectedCheckOutBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expectedCheckOut',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      guestCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guestCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      guestCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'guestCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      guestCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'guestCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      guestCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'guestCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reservationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reservationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reservationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reservationCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reservationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reservationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reservationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reservationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reservationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reservationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reservationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reservationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reservationId',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      reservationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reservationId',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      sourceEqualTo(BookingSource value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      sourceGreaterThan(
    BookingSource value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      sourceLessThan(
    BookingSource value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      sourceBetween(
    BookingSource lower,
    BookingSource upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      statusEqualTo(ReservationStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      statusGreaterThan(
    ReservationStatus value, {
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      statusLessThan(
    ReservationStatus value, {
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      statusBetween(
    ReservationStatus lower,
    ReservationStatus upper, {
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      versionGreaterThan(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      versionLessThan(
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

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      versionBetween(
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

extension RoomReservationQueryObject
    on QueryBuilder<RoomReservation, RoomReservation, QFilterCondition> {}

extension RoomReservationQueryLinks
    on QueryBuilder<RoomReservation, RoomReservation, QFilterCondition> {
  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition> room(
      FilterQuery<HotelRoom> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'room');
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterFilterCondition>
      roomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'room', 0, true, 0, true);
    });
  }
}

extension RoomReservationQuerySortBy
    on QueryBuilder<RoomReservation, RoomReservation, QSortBy> {
  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByDepositAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByExpectedCheckIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckIn', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByExpectedCheckInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckIn', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByExpectedCheckOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckOut', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByExpectedCheckOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckOut', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByGuestCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guestCount', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByGuestCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guestCount', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByReservationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reservationCode', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByReservationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reservationCode', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByReservationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reservationId', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByReservationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reservationId', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension RoomReservationQuerySortThenBy
    on QueryBuilder<RoomReservation, RoomReservation, QSortThenBy> {
  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByDepositAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByExpectedCheckIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckIn', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByExpectedCheckInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckIn', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByExpectedCheckOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckOut', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByExpectedCheckOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckOut', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByGuestCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guestCount', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByGuestCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guestCount', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByReservationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reservationCode', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByReservationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reservationCode', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByReservationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reservationId', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByReservationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reservationId', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension RoomReservationQueryWhereDistinct
    on QueryBuilder<RoomReservation, RoomReservation, QDistinct> {
  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByCustomerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByCustomerPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'depositAmount');
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByExpectedCheckIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedCheckIn');
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByExpectedCheckOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedCheckOut');
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByGuestCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'guestCount');
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByReservationCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reservationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByReservationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reservationId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct> distinctBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source');
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<RoomReservation, RoomReservation, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension RoomReservationQueryProperty
    on QueryBuilder<RoomReservation, RoomReservation, QQueryProperty> {
  QueryBuilder<RoomReservation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RoomReservation, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RoomReservation, String, QQueryOperations>
      customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<RoomReservation, String, QQueryOperations>
      customerPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerPhone');
    });
  }

  QueryBuilder<RoomReservation, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<RoomReservation, double, QQueryOperations>
      depositAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'depositAmount');
    });
  }

  QueryBuilder<RoomReservation, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<RoomReservation, DateTime?, QQueryOperations>
      expectedCheckInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedCheckIn');
    });
  }

  QueryBuilder<RoomReservation, DateTime?, QQueryOperations>
      expectedCheckOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedCheckOut');
    });
  }

  QueryBuilder<RoomReservation, int, QQueryOperations> guestCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'guestCount');
    });
  }

  QueryBuilder<RoomReservation, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<RoomReservation, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<RoomReservation, String, QQueryOperations>
      reservationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reservationCode');
    });
  }

  QueryBuilder<RoomReservation, String, QQueryOperations>
      reservationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reservationId');
    });
  }

  QueryBuilder<RoomReservation, BookingSource, QQueryOperations>
      sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<RoomReservation, ReservationStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<RoomReservation, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<RoomReservation, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
