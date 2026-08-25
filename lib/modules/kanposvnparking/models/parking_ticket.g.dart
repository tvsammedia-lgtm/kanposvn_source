// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_ticket.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingTicketCollection on Isar {
  IsarCollection<ParkingTicket> get parkingTickets => this.collection();
}

const ParkingTicketSchema = CollectionSchema(
  name: r'ParkingTicket',
  id: 8287079922170929134,
  properties: {
    r'checkInCameraId': PropertySchema(
      id: 0,
      name: r'checkInCameraId',
      type: IsarType.string,
    ),
    r'checkInImageBack': PropertySchema(
      id: 1,
      name: r'checkInImageBack',
      type: IsarType.string,
    ),
    r'checkInImageFront': PropertySchema(
      id: 2,
      name: r'checkInImageFront',
      type: IsarType.string,
    ),
    r'checkInStaffId': PropertySchema(
      id: 3,
      name: r'checkInStaffId',
      type: IsarType.string,
    ),
    r'checkInTime': PropertySchema(
      id: 4,
      name: r'checkInTime',
      type: IsarType.dateTime,
    ),
    r'checkOutCameraId': PropertySchema(
      id: 5,
      name: r'checkOutCameraId',
      type: IsarType.string,
    ),
    r'checkOutImageBack': PropertySchema(
      id: 6,
      name: r'checkOutImageBack',
      type: IsarType.string,
    ),
    r'checkOutImageFront': PropertySchema(
      id: 7,
      name: r'checkOutImageFront',
      type: IsarType.string,
    ),
    r'checkOutStaffId': PropertySchema(
      id: 8,
      name: r'checkOutStaffId',
      type: IsarType.string,
    ),
    r'checkOutTime': PropertySchema(
      id: 9,
      name: r'checkOutTime',
      type: IsarType.dateTime,
    ),
    r'feeAmount': PropertySchema(
      id: 10,
      name: r'feeAmount',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 11,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'licensePlate': PropertySchema(
      id: 12,
      name: r'licensePlate',
      type: IsarType.string,
    ),
    r'monthlyTicketId': PropertySchema(
      id: 13,
      name: r'monthlyTicketId',
      type: IsarType.string,
    ),
    r'paymentMethod': PropertySchema(
      id: 14,
      name: r'paymentMethod',
      type: IsarType.string,
    ),
    r'paymentStatus': PropertySchema(
      id: 15,
      name: r'paymentStatus',
      type: IsarType.string,
    ),
    r'rfidCard': PropertySchema(
      id: 16,
      name: r'rfidCard',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 17,
      name: r'status',
      type: IsarType.string,
    ),
    r'ticketId': PropertySchema(
      id: 18,
      name: r'ticketId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 19,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehicleId': PropertySchema(
      id: 20,
      name: r'vehicleId',
      type: IsarType.string,
    )
  },
  estimateSize: _parkingTicketEstimateSize,
  serialize: _parkingTicketSerialize,
  deserialize: _parkingTicketDeserialize,
  deserializeProp: _parkingTicketDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'ticketId': IndexSchema(
      id: -6483959237056329942,
      name: r'ticketId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'ticketId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _parkingTicketGetId,
  getLinks: _parkingTicketGetLinks,
  attach: _parkingTicketAttach,
  version: '3.1.0+1',
);

int _parkingTicketEstimateSize(
  ParkingTicket object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.checkInCameraId.length * 3;
  bytesCount += 3 + object.checkInImageBack.length * 3;
  bytesCount += 3 + object.checkInImageFront.length * 3;
  bytesCount += 3 + object.checkInStaffId.length * 3;
  bytesCount += 3 + object.checkOutCameraId.length * 3;
  bytesCount += 3 + object.checkOutImageBack.length * 3;
  bytesCount += 3 + object.checkOutImageFront.length * 3;
  bytesCount += 3 + object.checkOutStaffId.length * 3;
  bytesCount += 3 + object.licensePlate.length * 3;
  bytesCount += 3 + object.monthlyTicketId.length * 3;
  bytesCount += 3 + object.paymentMethod.length * 3;
  bytesCount += 3 + object.paymentStatus.length * 3;
  bytesCount += 3 + object.rfidCard.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.ticketId.length * 3;
  bytesCount += 3 + object.vehicleId.length * 3;
  return bytesCount;
}

void _parkingTicketSerialize(
  ParkingTicket object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.checkInCameraId);
  writer.writeString(offsets[1], object.checkInImageBack);
  writer.writeString(offsets[2], object.checkInImageFront);
  writer.writeString(offsets[3], object.checkInStaffId);
  writer.writeDateTime(offsets[4], object.checkInTime);
  writer.writeString(offsets[5], object.checkOutCameraId);
  writer.writeString(offsets[6], object.checkOutImageBack);
  writer.writeString(offsets[7], object.checkOutImageFront);
  writer.writeString(offsets[8], object.checkOutStaffId);
  writer.writeDateTime(offsets[9], object.checkOutTime);
  writer.writeDouble(offsets[10], object.feeAmount);
  writer.writeBool(offsets[11], object.isSynced);
  writer.writeString(offsets[12], object.licensePlate);
  writer.writeString(offsets[13], object.monthlyTicketId);
  writer.writeString(offsets[14], object.paymentMethod);
  writer.writeString(offsets[15], object.paymentStatus);
  writer.writeString(offsets[16], object.rfidCard);
  writer.writeString(offsets[17], object.status);
  writer.writeString(offsets[18], object.ticketId);
  writer.writeDateTime(offsets[19], object.updatedAt);
  writer.writeString(offsets[20], object.vehicleId);
}

ParkingTicket _parkingTicketDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingTicket();
  object.checkInCameraId = reader.readString(offsets[0]);
  object.checkInImageBack = reader.readString(offsets[1]);
  object.checkInImageFront = reader.readString(offsets[2]);
  object.checkInStaffId = reader.readString(offsets[3]);
  object.checkInTime = reader.readDateTime(offsets[4]);
  object.checkOutCameraId = reader.readString(offsets[5]);
  object.checkOutImageBack = reader.readString(offsets[6]);
  object.checkOutImageFront = reader.readString(offsets[7]);
  object.checkOutStaffId = reader.readString(offsets[8]);
  object.checkOutTime = reader.readDateTimeOrNull(offsets[9]);
  object.feeAmount = reader.readDouble(offsets[10]);
  object.isSynced = reader.readBool(offsets[11]);
  object.isarId = id;
  object.licensePlate = reader.readString(offsets[12]);
  object.monthlyTicketId = reader.readString(offsets[13]);
  object.paymentMethod = reader.readString(offsets[14]);
  object.paymentStatus = reader.readString(offsets[15]);
  object.rfidCard = reader.readString(offsets[16]);
  object.status = reader.readString(offsets[17]);
  object.ticketId = reader.readString(offsets[18]);
  object.updatedAt = reader.readDateTime(offsets[19]);
  object.vehicleId = reader.readString(offsets[20]);
  return object;
}

P _parkingTicketDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parkingTicketGetId(ParkingTicket object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _parkingTicketGetLinks(ParkingTicket object) {
  return [];
}

void _parkingTicketAttach(
    IsarCollection<dynamic> col, Id id, ParkingTicket object) {
  object.isarId = id;
}

extension ParkingTicketByIndex on IsarCollection<ParkingTicket> {
  Future<ParkingTicket?> getByTicketId(String ticketId) {
    return getByIndex(r'ticketId', [ticketId]);
  }

  ParkingTicket? getByTicketIdSync(String ticketId) {
    return getByIndexSync(r'ticketId', [ticketId]);
  }

  Future<bool> deleteByTicketId(String ticketId) {
    return deleteByIndex(r'ticketId', [ticketId]);
  }

  bool deleteByTicketIdSync(String ticketId) {
    return deleteByIndexSync(r'ticketId', [ticketId]);
  }

  Future<List<ParkingTicket?>> getAllByTicketId(List<String> ticketIdValues) {
    final values = ticketIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'ticketId', values);
  }

  List<ParkingTicket?> getAllByTicketIdSync(List<String> ticketIdValues) {
    final values = ticketIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'ticketId', values);
  }

  Future<int> deleteAllByTicketId(List<String> ticketIdValues) {
    final values = ticketIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'ticketId', values);
  }

  int deleteAllByTicketIdSync(List<String> ticketIdValues) {
    final values = ticketIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'ticketId', values);
  }

  Future<Id> putByTicketId(ParkingTicket object) {
    return putByIndex(r'ticketId', object);
  }

  Id putByTicketIdSync(ParkingTicket object, {bool saveLinks = true}) {
    return putByIndexSync(r'ticketId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTicketId(List<ParkingTicket> objects) {
    return putAllByIndex(r'ticketId', objects);
  }

  List<Id> putAllByTicketIdSync(List<ParkingTicket> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'ticketId', objects, saveLinks: saveLinks);
  }
}

extension ParkingTicketQueryWhereSort
    on QueryBuilder<ParkingTicket, ParkingTicket, QWhere> {
  QueryBuilder<ParkingTicket, ParkingTicket, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParkingTicketQueryWhere
    on QueryBuilder<ParkingTicket, ParkingTicket, QWhereClause> {
  QueryBuilder<ParkingTicket, ParkingTicket, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterWhereClause>
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterWhereClause> ticketIdEqualTo(
      String ticketId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ticketId',
        value: [ticketId],
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterWhereClause>
      ticketIdNotEqualTo(String ticketId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketId',
              lower: [],
              upper: [ticketId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketId',
              lower: [ticketId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketId',
              lower: [ticketId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketId',
              lower: [],
              upper: [ticketId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ParkingTicketQueryFilter
    on QueryBuilder<ParkingTicket, ParkingTicket, QFilterCondition> {
  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInCameraIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInCameraIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkInCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInCameraIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkInCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInCameraIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkInCameraId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInCameraIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checkInCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInCameraIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checkInCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInCameraIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checkInCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInCameraIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checkInCameraId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInCameraIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInCameraId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInCameraIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checkInCameraId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageBackEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageBackGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkInImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageBackLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkInImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageBackBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkInImageBack',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageBackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checkInImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageBackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checkInImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageBackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checkInImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageBackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checkInImageBack',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageBackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInImageBack',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageBackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checkInImageBack',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageFrontEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageFrontGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkInImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageFrontLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkInImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageFrontBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkInImageFront',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageFrontStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checkInImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageFrontEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checkInImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageFrontContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checkInImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageFrontMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checkInImageFront',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageFrontIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInImageFront',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInImageFrontIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checkInImageFront',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInStaffIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInStaffIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkInStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInStaffIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkInStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInStaffIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkInStaffId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInStaffIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checkInStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInStaffIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checkInStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInStaffIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checkInStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInStaffIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checkInStaffId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInStaffIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInStaffId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInStaffIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checkInStaffId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkInTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkInTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkInTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkInTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutCameraIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkOutCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutCameraIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkOutCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutCameraIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkOutCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutCameraIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkOutCameraId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutCameraIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checkOutCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutCameraIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checkOutCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutCameraIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checkOutCameraId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutCameraIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checkOutCameraId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutCameraIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkOutCameraId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutCameraIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checkOutCameraId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageBackEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkOutImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageBackGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkOutImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageBackLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkOutImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageBackBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkOutImageBack',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageBackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checkOutImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageBackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checkOutImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageBackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checkOutImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageBackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checkOutImageBack',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageBackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkOutImageBack',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageBackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checkOutImageBack',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageFrontEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkOutImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageFrontGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkOutImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageFrontLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkOutImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageFrontBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkOutImageFront',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageFrontStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checkOutImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageFrontEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checkOutImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageFrontContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checkOutImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageFrontMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checkOutImageFront',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageFrontIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkOutImageFront',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutImageFrontIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checkOutImageFront',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutStaffIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkOutStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutStaffIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkOutStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutStaffIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkOutStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutStaffIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkOutStaffId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutStaffIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checkOutStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutStaffIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checkOutStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutStaffIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checkOutStaffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutStaffIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checkOutStaffId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutStaffIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkOutStaffId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutStaffIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checkOutStaffId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'checkOutTime',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'checkOutTime',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkOutTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkOutTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkOutTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      checkOutTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkOutTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      feeAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feeAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      feeAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feeAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      feeAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feeAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      feeAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feeAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      licensePlateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      licensePlateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      licensePlateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      licensePlateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licensePlate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      licensePlateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      licensePlateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      licensePlateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      licensePlateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licensePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      licensePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      licensePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      monthlyTicketIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthlyTicketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      monthlyTicketIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthlyTicketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      monthlyTicketIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthlyTicketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      monthlyTicketIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthlyTicketId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      monthlyTicketIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'monthlyTicketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      monthlyTicketIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'monthlyTicketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      monthlyTicketIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'monthlyTicketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      monthlyTicketIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'monthlyTicketId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      monthlyTicketIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthlyTicketId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      monthlyTicketIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'monthlyTicketId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentMethodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentMethodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentMethodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentMethodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentStatusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentStatusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentStatusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentStatusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      paymentStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      rfidCardEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rfidCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      rfidCardGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rfidCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      rfidCardLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rfidCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      rfidCardBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rfidCard',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      rfidCardStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rfidCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      rfidCardEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rfidCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      rfidCardContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rfidCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      rfidCardMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rfidCard',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      rfidCardIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rfidCard',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      rfidCardIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rfidCard',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      statusEqualTo(
    String value, {
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      statusGreaterThan(
    String value, {
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      statusLessThan(
    String value, {
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      statusBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      ticketIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      ticketIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      ticketIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      ticketIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ticketId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      ticketIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      ticketIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      ticketIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      ticketIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticketId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      ticketIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      ticketIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticketId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
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

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      vehicleIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      vehicleIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      vehicleIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      vehicleIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      vehicleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      vehicleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      vehicleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      vehicleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      vehicleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterFilterCondition>
      vehicleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleId',
        value: '',
      ));
    });
  }
}

extension ParkingTicketQueryObject
    on QueryBuilder<ParkingTicket, ParkingTicket, QFilterCondition> {}

extension ParkingTicketQueryLinks
    on QueryBuilder<ParkingTicket, ParkingTicket, QFilterCondition> {}

extension ParkingTicketQuerySortBy
    on QueryBuilder<ParkingTicket, ParkingTicket, QSortBy> {
  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckInCameraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInCameraId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckInCameraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInCameraId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckInImageBack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInImageBack', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckInImageBackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInImageBack', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckInImageFront() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInImageFront', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckInImageFrontDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInImageFront', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckInStaffId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInStaffId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckInStaffIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInStaffId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> sortByCheckInTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckInTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckOutCameraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutCameraId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckOutCameraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutCameraId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckOutImageBack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutImageBack', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckOutImageBackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutImageBack', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckOutImageFront() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutImageFront', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckOutImageFrontDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutImageFront', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckOutStaffId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutStaffId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckOutStaffIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutStaffId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckOutTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByCheckOutTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> sortByFeeAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feeAmount', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByFeeAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feeAmount', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByMonthlyTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyTicketId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByMonthlyTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyTicketId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByPaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByPaymentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> sortByRfidCard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidCard', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByRfidCardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidCard', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> sortByTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> sortByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      sortByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }
}

extension ParkingTicketQuerySortThenBy
    on QueryBuilder<ParkingTicket, ParkingTicket, QSortThenBy> {
  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckInCameraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInCameraId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckInCameraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInCameraId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckInImageBack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInImageBack', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckInImageBackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInImageBack', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckInImageFront() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInImageFront', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckInImageFrontDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInImageFront', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckInStaffId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInStaffId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckInStaffIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInStaffId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> thenByCheckInTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckInTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckOutCameraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutCameraId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckOutCameraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutCameraId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckOutImageBack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutImageBack', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckOutImageBackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutImageBack', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckOutImageFront() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutImageFront', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckOutImageFrontDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutImageFront', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckOutStaffId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutStaffId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckOutStaffIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutStaffId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckOutTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByCheckOutTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> thenByFeeAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feeAmount', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByFeeAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feeAmount', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByMonthlyTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyTicketId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByMonthlyTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyTicketId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByPaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByPaymentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> thenByRfidCard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidCard', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByRfidCardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidCard', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> thenByTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy> thenByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QAfterSortBy>
      thenByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }
}

extension ParkingTicketQueryWhereDistinct
    on QueryBuilder<ParkingTicket, ParkingTicket, QDistinct> {
  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct>
      distinctByCheckInCameraId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkInCameraId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct>
      distinctByCheckInImageBack({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkInImageBack',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct>
      distinctByCheckInImageFront({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkInImageFront',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct>
      distinctByCheckInStaffId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkInStaffId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct>
      distinctByCheckInTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkInTime');
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct>
      distinctByCheckOutCameraId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkOutCameraId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct>
      distinctByCheckOutImageBack({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkOutImageBack',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct>
      distinctByCheckOutImageFront({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkOutImageFront',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct>
      distinctByCheckOutStaffId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkOutStaffId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct>
      distinctByCheckOutTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkOutTime');
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct> distinctByFeeAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feeAmount');
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct> distinctByLicensePlate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licensePlate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct>
      distinctByMonthlyTicketId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyTicketId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct> distinctByPaymentMethod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct> distinctByPaymentStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct> distinctByRfidCard(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rfidCard', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct> distinctByTicketId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticketId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ParkingTicket, ParkingTicket, QDistinct> distinctByVehicleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleId', caseSensitive: caseSensitive);
    });
  }
}

extension ParkingTicketQueryProperty
    on QueryBuilder<ParkingTicket, ParkingTicket, QQueryProperty> {
  QueryBuilder<ParkingTicket, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations>
      checkInCameraIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkInCameraId');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations>
      checkInImageBackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkInImageBack');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations>
      checkInImageFrontProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkInImageFront');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations>
      checkInStaffIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkInStaffId');
    });
  }

  QueryBuilder<ParkingTicket, DateTime, QQueryOperations>
      checkInTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkInTime');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations>
      checkOutCameraIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkOutCameraId');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations>
      checkOutImageBackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkOutImageBack');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations>
      checkOutImageFrontProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkOutImageFront');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations>
      checkOutStaffIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkOutStaffId');
    });
  }

  QueryBuilder<ParkingTicket, DateTime?, QQueryOperations>
      checkOutTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkOutTime');
    });
  }

  QueryBuilder<ParkingTicket, double, QQueryOperations> feeAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feeAmount');
    });
  }

  QueryBuilder<ParkingTicket, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations> licensePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licensePlate');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations>
      monthlyTicketIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyTicketId');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations>
      paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations>
      paymentStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentStatus');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations> rfidCardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rfidCard');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations> ticketIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticketId');
    });
  }

  QueryBuilder<ParkingTicket, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ParkingTicket, String, QQueryOperations> vehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleId');
    });
  }
}
