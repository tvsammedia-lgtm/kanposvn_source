// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_ticket.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingMonthlyTicketCollection on Isar {
  IsarCollection<ParkingMonthlyTicket> get parkingMonthlyTickets =>
      this.collection();
}

const ParkingMonthlyTicketSchema = CollectionSchema(
  name: r'ParkingMonthlyTicket',
  id: 7420416551610354469,
  properties: {
    r'customerCccd': PropertySchema(
      id: 0,
      name: r'customerCccd',
      type: IsarType.string,
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
    r'endDate': PropertySchema(
      id: 3,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'feeAmount': PropertySchema(
      id: 4,
      name: r'feeAmount',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 5,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'licensePlate': PropertySchema(
      id: 6,
      name: r'licensePlate',
      type: IsarType.string,
    ),
    r'rfidCard': PropertySchema(
      id: 7,
      name: r'rfidCard',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 8,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 9,
      name: r'status',
      type: IsarType.string,
    ),
    r'ticketId': PropertySchema(
      id: 10,
      name: r'ticketId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehicleType': PropertySchema(
      id: 12,
      name: r'vehicleType',
      type: IsarType.string,
    )
  },
  estimateSize: _parkingMonthlyTicketEstimateSize,
  serialize: _parkingMonthlyTicketSerialize,
  deserialize: _parkingMonthlyTicketDeserialize,
  deserializeProp: _parkingMonthlyTicketDeserializeProp,
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
  getId: _parkingMonthlyTicketGetId,
  getLinks: _parkingMonthlyTicketGetLinks,
  attach: _parkingMonthlyTicketAttach,
  version: '3.1.0+1',
);

int _parkingMonthlyTicketEstimateSize(
  ParkingMonthlyTicket object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customerCccd.length * 3;
  bytesCount += 3 + object.customerName.length * 3;
  bytesCount += 3 + object.customerPhone.length * 3;
  bytesCount += 3 + object.licensePlate.length * 3;
  bytesCount += 3 + object.rfidCard.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.ticketId.length * 3;
  bytesCount += 3 + object.vehicleType.length * 3;
  return bytesCount;
}

void _parkingMonthlyTicketSerialize(
  ParkingMonthlyTicket object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.customerCccd);
  writer.writeString(offsets[1], object.customerName);
  writer.writeString(offsets[2], object.customerPhone);
  writer.writeDateTime(offsets[3], object.endDate);
  writer.writeDouble(offsets[4], object.feeAmount);
  writer.writeBool(offsets[5], object.isSynced);
  writer.writeString(offsets[6], object.licensePlate);
  writer.writeString(offsets[7], object.rfidCard);
  writer.writeDateTime(offsets[8], object.startDate);
  writer.writeString(offsets[9], object.status);
  writer.writeString(offsets[10], object.ticketId);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeString(offsets[12], object.vehicleType);
}

ParkingMonthlyTicket _parkingMonthlyTicketDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingMonthlyTicket();
  object.customerCccd = reader.readString(offsets[0]);
  object.customerName = reader.readString(offsets[1]);
  object.customerPhone = reader.readString(offsets[2]);
  object.endDate = reader.readDateTime(offsets[3]);
  object.feeAmount = reader.readDouble(offsets[4]);
  object.isSynced = reader.readBool(offsets[5]);
  object.isarId = id;
  object.licensePlate = reader.readString(offsets[6]);
  object.rfidCard = reader.readString(offsets[7]);
  object.startDate = reader.readDateTime(offsets[8]);
  object.status = reader.readString(offsets[9]);
  object.ticketId = reader.readString(offsets[10]);
  object.updatedAt = reader.readDateTime(offsets[11]);
  object.vehicleType = reader.readString(offsets[12]);
  return object;
}

P _parkingMonthlyTicketDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parkingMonthlyTicketGetId(ParkingMonthlyTicket object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _parkingMonthlyTicketGetLinks(
    ParkingMonthlyTicket object) {
  return [];
}

void _parkingMonthlyTicketAttach(
    IsarCollection<dynamic> col, Id id, ParkingMonthlyTicket object) {
  object.isarId = id;
}

extension ParkingMonthlyTicketByIndex on IsarCollection<ParkingMonthlyTicket> {
  Future<ParkingMonthlyTicket?> getByTicketId(String ticketId) {
    return getByIndex(r'ticketId', [ticketId]);
  }

  ParkingMonthlyTicket? getByTicketIdSync(String ticketId) {
    return getByIndexSync(r'ticketId', [ticketId]);
  }

  Future<bool> deleteByTicketId(String ticketId) {
    return deleteByIndex(r'ticketId', [ticketId]);
  }

  bool deleteByTicketIdSync(String ticketId) {
    return deleteByIndexSync(r'ticketId', [ticketId]);
  }

  Future<List<ParkingMonthlyTicket?>> getAllByTicketId(
      List<String> ticketIdValues) {
    final values = ticketIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'ticketId', values);
  }

  List<ParkingMonthlyTicket?> getAllByTicketIdSync(
      List<String> ticketIdValues) {
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

  Future<Id> putByTicketId(ParkingMonthlyTicket object) {
    return putByIndex(r'ticketId', object);
  }

  Id putByTicketIdSync(ParkingMonthlyTicket object, {bool saveLinks = true}) {
    return putByIndexSync(r'ticketId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTicketId(List<ParkingMonthlyTicket> objects) {
    return putAllByIndex(r'ticketId', objects);
  }

  List<Id> putAllByTicketIdSync(List<ParkingMonthlyTicket> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'ticketId', objects, saveLinks: saveLinks);
  }
}

extension ParkingMonthlyTicketQueryWhereSort
    on QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QWhere> {
  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParkingMonthlyTicketQueryWhere
    on QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QWhereClause> {
  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterWhereClause>
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterWhereClause>
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterWhereClause>
      ticketIdEqualTo(String ticketId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ticketId',
        value: [ticketId],
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterWhereClause>
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

extension ParkingMonthlyTicketQueryFilter on QueryBuilder<ParkingMonthlyTicket,
    ParkingMonthlyTicket, QFilterCondition> {
  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerCccdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerCccdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerCccdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerCccdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerCccd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerCccdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerCccdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      customerCccdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      customerCccdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerCccd',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerCccdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerCccd',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerCccdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerCccd',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerNameEqualTo(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerNameGreaterThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerNameLessThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerNameBetween(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerNameStartsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerNameEndsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerPhoneEqualTo(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerPhoneGreaterThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerPhoneLessThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerPhoneBetween(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerPhoneStartsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerPhoneEndsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      customerPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      customerPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> customerPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> endDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> endDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> endDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> endDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> feeAmountEqualTo(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> feeAmountGreaterThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> feeAmountLessThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> feeAmountBetween(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> licensePlateEqualTo(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> licensePlateGreaterThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> licensePlateLessThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> licensePlateBetween(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> licensePlateStartsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> licensePlateEndsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      licensePlateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      licensePlateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licensePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> licensePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> licensePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> rfidCardEqualTo(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> rfidCardGreaterThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> rfidCardLessThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> rfidCardBetween(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> rfidCardStartsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> rfidCardEndsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      rfidCardContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rfidCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      rfidCardMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rfidCard',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> rfidCardIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rfidCard',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> rfidCardIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rfidCard',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> startDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> startDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> statusBetween(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> ticketIdEqualTo(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> ticketIdGreaterThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> ticketIdLessThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> ticketIdBetween(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> ticketIdStartsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> ticketIdEndsWith(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      ticketIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      ticketIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticketId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> ticketIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> ticketIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticketId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> vehicleTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> vehicleTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> vehicleTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> vehicleTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> vehicleTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> vehicleTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      vehicleTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
          QAfterFilterCondition>
      vehicleTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> vehicleTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleType',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket,
      QAfterFilterCondition> vehicleTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleType',
        value: '',
      ));
    });
  }
}

extension ParkingMonthlyTicketQueryObject on QueryBuilder<ParkingMonthlyTicket,
    ParkingMonthlyTicket, QFilterCondition> {}

extension ParkingMonthlyTicketQueryLinks on QueryBuilder<ParkingMonthlyTicket,
    ParkingMonthlyTicket, QFilterCondition> {}

extension ParkingMonthlyTicketQuerySortBy
    on QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QSortBy> {
  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByCustomerCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByCustomerCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByFeeAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feeAmount', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByFeeAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feeAmount', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByRfidCard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidCard', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByRfidCardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidCard', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      sortByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension ParkingMonthlyTicketQuerySortThenBy
    on QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QSortThenBy> {
  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByCustomerCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByCustomerCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByFeeAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feeAmount', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByFeeAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feeAmount', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByRfidCard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidCard', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByRfidCardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidCard', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QAfterSortBy>
      thenByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension ParkingMonthlyTicketQueryWhereDistinct
    on QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct> {
  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByCustomerCccd({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerCccd', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByCustomerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByCustomerPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByFeeAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feeAmount');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByLicensePlate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licensePlate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByRfidCard({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rfidCard', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByTicketId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticketId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, ParkingMonthlyTicket, QDistinct>
      distinctByVehicleType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleType', caseSensitive: caseSensitive);
    });
  }
}

extension ParkingMonthlyTicketQueryProperty on QueryBuilder<
    ParkingMonthlyTicket, ParkingMonthlyTicket, QQueryProperty> {
  QueryBuilder<ParkingMonthlyTicket, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, String, QQueryOperations>
      customerCccdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerCccd');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, String, QQueryOperations>
      customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, String, QQueryOperations>
      customerPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerPhone');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, DateTime, QQueryOperations>
      endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, double, QQueryOperations>
      feeAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feeAmount');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, String, QQueryOperations>
      licensePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licensePlate');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, String, QQueryOperations>
      rfidCardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rfidCard');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, DateTime, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, String, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, String, QQueryOperations>
      ticketIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticketId');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ParkingMonthlyTicket, String, QQueryOperations>
      vehicleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleType');
    });
  }
}
