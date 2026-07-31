// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_checkin_checkout.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRoomCheckInCollection on Isar {
  IsarCollection<RoomCheckIn> get roomCheckIns => this.collection();
}

const RoomCheckInSchema = CollectionSchema(
  name: r'RoomCheckIn',
  id: -1396636574142135572,
  properties: {
    r'actualCheckIn': PropertySchema(
      id: 0,
      name: r'actualCheckIn',
      type: IsarType.dateTime,
    ),
    r'actualCheckOut': PropertySchema(
      id: 1,
      name: r'actualCheckOut',
      type: IsarType.dateTime,
    ),
    r'checkInId': PropertySchema(
      id: 2,
      name: r'checkInId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerIdentity': PropertySchema(
      id: 4,
      name: r'customerIdentity',
      type: IsarType.string,
    ),
    r'customerName': PropertySchema(
      id: 5,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'customerPhone': PropertySchema(
      id: 6,
      name: r'customerPhone',
      type: IsarType.string,
    ),
    r'discount': PropertySchema(
      id: 7,
      name: r'discount',
      type: IsarType.double,
    ),
    r'expectedCheckOut': PropertySchema(
      id: 8,
      name: r'expectedCheckOut',
      type: IsarType.dateTime,
    ),
    r'finalTotal': PropertySchema(
      id: 9,
      name: r'finalTotal',
      type: IsarType.double,
    ),
    r'isCheckedOut': PropertySchema(
      id: 10,
      name: r'isCheckedOut',
      type: IsarType.bool,
    ),
    r'note': PropertySchema(
      id: 11,
      name: r'note',
      type: IsarType.string,
    ),
    r'prePaid': PropertySchema(
      id: 12,
      name: r'prePaid',
      type: IsarType.double,
    ),
    r'rentalType': PropertySchema(
      id: 13,
      name: r'rentalType',
      type: IsarType.byte,
      enumMap: _RoomCheckInrentalTypeEnumValueMap,
    ),
    r'roomTotalCharge': PropertySchema(
      id: 14,
      name: r'roomTotalCharge',
      type: IsarType.double,
    ),
    r'serviceTotalCharge': PropertySchema(
      id: 15,
      name: r'serviceTotalCharge',
      type: IsarType.double,
    )
  },
  estimateSize: _roomCheckInEstimateSize,
  serialize: _roomCheckInSerialize,
  deserialize: _roomCheckInDeserialize,
  deserializeProp: _roomCheckInDeserializeProp,
  idName: r'id',
  indexes: {
    r'checkInId': IndexSchema(
      id: 1841632595250945841,
      name: r'checkInId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'checkInId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'room': LinkSchema(
      id: 2116558649714745682,
      name: r'room',
      target: r'HotelRoom',
      single: true,
    ),
    r'reservation': LinkSchema(
      id: -4612524006325414893,
      name: r'reservation',
      target: r'RoomReservation',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _roomCheckInGetId,
  getLinks: _roomCheckInGetLinks,
  attach: _roomCheckInAttach,
  version: '3.1.0+1',
);

int _roomCheckInEstimateSize(
  RoomCheckIn object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.checkInId.length * 3;
  bytesCount += 3 + object.customerIdentity.length * 3;
  bytesCount += 3 + object.customerName.length * 3;
  bytesCount += 3 + object.customerPhone.length * 3;
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _roomCheckInSerialize(
  RoomCheckIn object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.actualCheckIn);
  writer.writeDateTime(offsets[1], object.actualCheckOut);
  writer.writeString(offsets[2], object.checkInId);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.customerIdentity);
  writer.writeString(offsets[5], object.customerName);
  writer.writeString(offsets[6], object.customerPhone);
  writer.writeDouble(offsets[7], object.discount);
  writer.writeDateTime(offsets[8], object.expectedCheckOut);
  writer.writeDouble(offsets[9], object.finalTotal);
  writer.writeBool(offsets[10], object.isCheckedOut);
  writer.writeString(offsets[11], object.note);
  writer.writeDouble(offsets[12], object.prePaid);
  writer.writeByte(offsets[13], object.rentalType.index);
  writer.writeDouble(offsets[14], object.roomTotalCharge);
  writer.writeDouble(offsets[15], object.serviceTotalCharge);
}

RoomCheckIn _roomCheckInDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RoomCheckIn();
  object.actualCheckIn = reader.readDateTimeOrNull(offsets[0]);
  object.actualCheckOut = reader.readDateTimeOrNull(offsets[1]);
  object.checkInId = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.customerIdentity = reader.readString(offsets[4]);
  object.customerName = reader.readString(offsets[5]);
  object.customerPhone = reader.readString(offsets[6]);
  object.discount = reader.readDouble(offsets[7]);
  object.expectedCheckOut = reader.readDateTimeOrNull(offsets[8]);
  object.finalTotal = reader.readDouble(offsets[9]);
  object.id = id;
  object.isCheckedOut = reader.readBool(offsets[10]);
  object.note = reader.readString(offsets[11]);
  object.prePaid = reader.readDouble(offsets[12]);
  object.rentalType =
      _RoomCheckInrentalTypeValueEnumMap[reader.readByteOrNull(offsets[13])] ??
          RentalType.HOURLY;
  object.roomTotalCharge = reader.readDouble(offsets[14]);
  object.serviceTotalCharge = reader.readDouble(offsets[15]);
  return object;
}

P _roomCheckInDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (_RoomCheckInrentalTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          RentalType.HOURLY) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RoomCheckInrentalTypeEnumValueMap = {
  'HOURLY': 0,
  'OVERNIGHT': 1,
  'DAILY': 2,
};
const _RoomCheckInrentalTypeValueEnumMap = {
  0: RentalType.HOURLY,
  1: RentalType.OVERNIGHT,
  2: RentalType.DAILY,
};

Id _roomCheckInGetId(RoomCheckIn object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _roomCheckInGetLinks(RoomCheckIn object) {
  return [object.room, object.reservation];
}

void _roomCheckInAttach(
    IsarCollection<dynamic> col, Id id, RoomCheckIn object) {
  object.id = id;
  object.room.attach(col, col.isar.collection<HotelRoom>(), r'room', id);
  object.reservation
      .attach(col, col.isar.collection<RoomReservation>(), r'reservation', id);
}

extension RoomCheckInByIndex on IsarCollection<RoomCheckIn> {
  Future<RoomCheckIn?> getByCheckInId(String checkInId) {
    return getByIndex(r'checkInId', [checkInId]);
  }

  RoomCheckIn? getByCheckInIdSync(String checkInId) {
    return getByIndexSync(r'checkInId', [checkInId]);
  }

  Future<bool> deleteByCheckInId(String checkInId) {
    return deleteByIndex(r'checkInId', [checkInId]);
  }

  bool deleteByCheckInIdSync(String checkInId) {
    return deleteByIndexSync(r'checkInId', [checkInId]);
  }

  Future<List<RoomCheckIn?>> getAllByCheckInId(List<String> checkInIdValues) {
    final values = checkInIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'checkInId', values);
  }

  List<RoomCheckIn?> getAllByCheckInIdSync(List<String> checkInIdValues) {
    final values = checkInIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'checkInId', values);
  }

  Future<int> deleteAllByCheckInId(List<String> checkInIdValues) {
    final values = checkInIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'checkInId', values);
  }

  int deleteAllByCheckInIdSync(List<String> checkInIdValues) {
    final values = checkInIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'checkInId', values);
  }

  Future<Id> putByCheckInId(RoomCheckIn object) {
    return putByIndex(r'checkInId', object);
  }

  Id putByCheckInIdSync(RoomCheckIn object, {bool saveLinks = true}) {
    return putByIndexSync(r'checkInId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCheckInId(List<RoomCheckIn> objects) {
    return putAllByIndex(r'checkInId', objects);
  }

  List<Id> putAllByCheckInIdSync(List<RoomCheckIn> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'checkInId', objects, saveLinks: saveLinks);
  }
}

extension RoomCheckInQueryWhereSort
    on QueryBuilder<RoomCheckIn, RoomCheckIn, QWhere> {
  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RoomCheckInQueryWhere
    on QueryBuilder<RoomCheckIn, RoomCheckIn, QWhereClause> {
  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterWhereClause> idBetween(
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterWhereClause> checkInIdEqualTo(
      String checkInId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'checkInId',
        value: [checkInId],
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterWhereClause> checkInIdNotEqualTo(
      String checkInId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkInId',
              lower: [],
              upper: [checkInId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkInId',
              lower: [checkInId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkInId',
              lower: [checkInId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkInId',
              lower: [],
              upper: [checkInId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RoomCheckInQueryFilter
    on QueryBuilder<RoomCheckIn, RoomCheckIn, QFilterCondition> {
  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualCheckIn',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualCheckIn',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckInEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualCheckIn',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckInGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualCheckIn',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckInLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualCheckIn',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckInBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualCheckIn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckOutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualCheckOut',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckOutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualCheckOut',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckOutEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualCheckOut',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckOutGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualCheckOut',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckOutLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualCheckOut',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      actualCheckOutBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualCheckOut',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      checkInIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      checkInIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      checkInIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      checkInIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkInId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      checkInIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      checkInIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      checkInIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      checkInIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checkInId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      checkInIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInId',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      checkInIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checkInId',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerIdentityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerIdentity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerIdentityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerIdentity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerIdentityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerIdentity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerIdentityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerIdentity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerIdentityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerIdentity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerIdentityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerIdentity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerIdentityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerIdentity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerIdentityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerIdentity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerIdentityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerIdentity',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerIdentityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerIdentity',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      customerPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> discountEqualTo(
    double value, {
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      discountGreaterThan(
    double value, {
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      discountLessThan(
    double value, {
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> discountBetween(
    double lower,
    double upper, {
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      expectedCheckOutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expectedCheckOut',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      expectedCheckOutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expectedCheckOut',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      expectedCheckOutEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expectedCheckOut',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      finalTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      finalTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      finalTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      finalTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      isCheckedOutEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCheckedOut',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> noteEqualTo(
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> noteGreaterThan(
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> noteLessThan(
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> noteBetween(
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> noteStartsWith(
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> noteEndsWith(
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

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> noteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> noteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> prePaidEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prePaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      prePaidGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prePaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> prePaidLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prePaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> prePaidBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prePaid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      rentalTypeEqualTo(RentalType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentalType',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      rentalTypeGreaterThan(
    RentalType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentalType',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      rentalTypeLessThan(
    RentalType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentalType',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      rentalTypeBetween(
    RentalType lower,
    RentalType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentalType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      roomTotalChargeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomTotalCharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      roomTotalChargeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomTotalCharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      roomTotalChargeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomTotalCharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      roomTotalChargeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomTotalCharge',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      serviceTotalChargeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceTotalCharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      serviceTotalChargeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serviceTotalCharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      serviceTotalChargeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serviceTotalCharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      serviceTotalChargeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serviceTotalCharge',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension RoomCheckInQueryObject
    on QueryBuilder<RoomCheckIn, RoomCheckIn, QFilterCondition> {}

extension RoomCheckInQueryLinks
    on QueryBuilder<RoomCheckIn, RoomCheckIn, QFilterCondition> {
  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> room(
      FilterQuery<HotelRoom> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'room');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> roomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'room', 0, true, 0, true);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition> reservation(
      FilterQuery<RoomReservation> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'reservation');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterFilterCondition>
      reservationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'reservation', 0, true, 0, true);
    });
  }
}

extension RoomCheckInQuerySortBy
    on QueryBuilder<RoomCheckIn, RoomCheckIn, QSortBy> {
  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByActualCheckIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCheckIn', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByActualCheckInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCheckIn', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByActualCheckOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCheckOut', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByActualCheckOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCheckOut', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByCheckInId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInId', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByCheckInIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInId', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByCustomerIdentity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerIdentity', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByCustomerIdentityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerIdentity', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByExpectedCheckOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckOut', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByExpectedCheckOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckOut', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByFinalTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalTotal', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByFinalTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalTotal', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByIsCheckedOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCheckedOut', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByIsCheckedOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCheckedOut', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByPrePaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prePaid', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByPrePaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prePaid', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByRentalType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalType', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByRentalTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalType', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> sortByRoomTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomTotalCharge', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByRoomTotalChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomTotalCharge', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByServiceTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceTotalCharge', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      sortByServiceTotalChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceTotalCharge', Sort.desc);
    });
  }
}

extension RoomCheckInQuerySortThenBy
    on QueryBuilder<RoomCheckIn, RoomCheckIn, QSortThenBy> {
  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByActualCheckIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCheckIn', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByActualCheckInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCheckIn', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByActualCheckOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCheckOut', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByActualCheckOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCheckOut', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByCheckInId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInId', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByCheckInIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInId', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByCustomerIdentity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerIdentity', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByCustomerIdentityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerIdentity', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByExpectedCheckOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckOut', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByExpectedCheckOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCheckOut', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByFinalTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalTotal', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByFinalTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalTotal', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByIsCheckedOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCheckedOut', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByIsCheckedOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCheckedOut', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByPrePaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prePaid', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByPrePaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prePaid', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByRentalType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalType', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByRentalTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalType', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy> thenByRoomTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomTotalCharge', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByRoomTotalChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomTotalCharge', Sort.desc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByServiceTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceTotalCharge', Sort.asc);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QAfterSortBy>
      thenByServiceTotalChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceTotalCharge', Sort.desc);
    });
  }
}

extension RoomCheckInQueryWhereDistinct
    on QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> {
  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByActualCheckIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualCheckIn');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByActualCheckOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualCheckOut');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByCheckInId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkInId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByCustomerIdentity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerIdentity',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByCustomerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByCustomerPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discount');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct>
      distinctByExpectedCheckOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedCheckOut');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByFinalTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalTotal');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByIsCheckedOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCheckedOut');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByPrePaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prePaid');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct> distinctByRentalType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentalType');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct>
      distinctByRoomTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomTotalCharge');
    });
  }

  QueryBuilder<RoomCheckIn, RoomCheckIn, QDistinct>
      distinctByServiceTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serviceTotalCharge');
    });
  }
}

extension RoomCheckInQueryProperty
    on QueryBuilder<RoomCheckIn, RoomCheckIn, QQueryProperty> {
  QueryBuilder<RoomCheckIn, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RoomCheckIn, DateTime?, QQueryOperations>
      actualCheckInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualCheckIn');
    });
  }

  QueryBuilder<RoomCheckIn, DateTime?, QQueryOperations>
      actualCheckOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualCheckOut');
    });
  }

  QueryBuilder<RoomCheckIn, String, QQueryOperations> checkInIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkInId');
    });
  }

  QueryBuilder<RoomCheckIn, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RoomCheckIn, String, QQueryOperations>
      customerIdentityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerIdentity');
    });
  }

  QueryBuilder<RoomCheckIn, String, QQueryOperations> customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<RoomCheckIn, String, QQueryOperations> customerPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerPhone');
    });
  }

  QueryBuilder<RoomCheckIn, double, QQueryOperations> discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discount');
    });
  }

  QueryBuilder<RoomCheckIn, DateTime?, QQueryOperations>
      expectedCheckOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedCheckOut');
    });
  }

  QueryBuilder<RoomCheckIn, double, QQueryOperations> finalTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalTotal');
    });
  }

  QueryBuilder<RoomCheckIn, bool, QQueryOperations> isCheckedOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCheckedOut');
    });
  }

  QueryBuilder<RoomCheckIn, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<RoomCheckIn, double, QQueryOperations> prePaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prePaid');
    });
  }

  QueryBuilder<RoomCheckIn, RentalType, QQueryOperations> rentalTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentalType');
    });
  }

  QueryBuilder<RoomCheckIn, double, QQueryOperations>
      roomTotalChargeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomTotalCharge');
    });
  }

  QueryBuilder<RoomCheckIn, double, QQueryOperations>
      serviceTotalChargeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serviceTotalCharge');
    });
  }
}
