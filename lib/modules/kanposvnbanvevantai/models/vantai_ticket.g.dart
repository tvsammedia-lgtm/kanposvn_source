// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vantai_ticket.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVantaiTicketCollection on Isar {
  IsarCollection<VantaiTicket> get vantaiTickets => this.collection();
}

const VantaiTicketSchema = CollectionSchema(
  name: r'VantaiTicket',
  id: -5885600999463498532,
  properties: {
    r'bookingDate': PropertySchema(
      id: 0,
      name: r'bookingDate',
      type: IsarType.dateTime,
    ),
    r'departureTime': PropertySchema(
      id: 1,
      name: r'departureTime',
      type: IsarType.dateTime,
    ),
    r'price': PropertySchema(
      id: 2,
      name: r'price',
      type: IsarType.double,
    ),
    r'seatNumber': PropertySchema(
      id: 3,
      name: r'seatNumber',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.byte,
      enumMap: _VantaiTicketstatusEnumValueMap,
    ),
    r'ticketCode': PropertySchema(
      id: 5,
      name: r'ticketCode',
      type: IsarType.string,
    ),
    r'ticketId': PropertySchema(
      id: 6,
      name: r'ticketId',
      type: IsarType.string,
    )
  },
  estimateSize: _vantaiTicketEstimateSize,
  serialize: _vantaiTicketSerialize,
  deserialize: _vantaiTicketDeserialize,
  deserializeProp: _vantaiTicketDeserializeProp,
  idName: r'id',
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
  links: {
    r'customer': LinkSchema(
      id: 1179982315070377624,
      name: r'customer',
      target: r'VantaiCustomer',
      single: true,
    ),
    r'route': LinkSchema(
      id: 5166770895866313360,
      name: r'route',
      target: r'VantaiRoute',
      single: true,
    ),
    r'vehicle': LinkSchema(
      id: -480001543668582777,
      name: r'vehicle',
      target: r'VantaiVehicle',
      single: true,
    ),
    r'trip': LinkSchema(
      id: -2793727017428083505,
      name: r'trip',
      target: r'VantaiTrip',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _vantaiTicketGetId,
  getLinks: _vantaiTicketGetLinks,
  attach: _vantaiTicketAttach,
  version: '3.1.0+1',
);

int _vantaiTicketEstimateSize(
  VantaiTicket object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.seatNumber.length * 3;
  bytesCount += 3 + object.ticketCode.length * 3;
  bytesCount += 3 + object.ticketId.length * 3;
  return bytesCount;
}

void _vantaiTicketSerialize(
  VantaiTicket object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.bookingDate);
  writer.writeDateTime(offsets[1], object.departureTime);
  writer.writeDouble(offsets[2], object.price);
  writer.writeString(offsets[3], object.seatNumber);
  writer.writeByte(offsets[4], object.status.index);
  writer.writeString(offsets[5], object.ticketCode);
  writer.writeString(offsets[6], object.ticketId);
}

VantaiTicket _vantaiTicketDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VantaiTicket();
  object.bookingDate = reader.readDateTimeOrNull(offsets[0]);
  object.departureTime = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.price = reader.readDouble(offsets[2]);
  object.seatNumber = reader.readString(offsets[3]);
  object.status =
      _VantaiTicketstatusValueEnumMap[reader.readByteOrNull(offsets[4])] ??
          TicketStatus.RESERVED;
  object.ticketCode = reader.readString(offsets[5]);
  object.ticketId = reader.readString(offsets[6]);
  return object;
}

P _vantaiTicketDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (_VantaiTicketstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          TicketStatus.RESERVED) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VantaiTicketstatusEnumValueMap = {
  'RESERVED': 0,
  'PAID': 1,
  'CANCELLED': 2,
};
const _VantaiTicketstatusValueEnumMap = {
  0: TicketStatus.RESERVED,
  1: TicketStatus.PAID,
  2: TicketStatus.CANCELLED,
};

Id _vantaiTicketGetId(VantaiTicket object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vantaiTicketGetLinks(VantaiTicket object) {
  return [object.customer, object.route, object.vehicle, object.trip];
}

void _vantaiTicketAttach(
    IsarCollection<dynamic> col, Id id, VantaiTicket object) {
  object.id = id;
  object.customer
      .attach(col, col.isar.collection<VantaiCustomer>(), r'customer', id);
  object.route.attach(col, col.isar.collection<VantaiRoute>(), r'route', id);
  object.vehicle
      .attach(col, col.isar.collection<VantaiVehicle>(), r'vehicle', id);
  object.trip.attach(col, col.isar.collection<VantaiTrip>(), r'trip', id);
}

extension VantaiTicketByIndex on IsarCollection<VantaiTicket> {
  Future<VantaiTicket?> getByTicketId(String ticketId) {
    return getByIndex(r'ticketId', [ticketId]);
  }

  VantaiTicket? getByTicketIdSync(String ticketId) {
    return getByIndexSync(r'ticketId', [ticketId]);
  }

  Future<bool> deleteByTicketId(String ticketId) {
    return deleteByIndex(r'ticketId', [ticketId]);
  }

  bool deleteByTicketIdSync(String ticketId) {
    return deleteByIndexSync(r'ticketId', [ticketId]);
  }

  Future<List<VantaiTicket?>> getAllByTicketId(List<String> ticketIdValues) {
    final values = ticketIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'ticketId', values);
  }

  List<VantaiTicket?> getAllByTicketIdSync(List<String> ticketIdValues) {
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

  Future<Id> putByTicketId(VantaiTicket object) {
    return putByIndex(r'ticketId', object);
  }

  Id putByTicketIdSync(VantaiTicket object, {bool saveLinks = true}) {
    return putByIndexSync(r'ticketId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTicketId(List<VantaiTicket> objects) {
    return putAllByIndex(r'ticketId', objects);
  }

  List<Id> putAllByTicketIdSync(List<VantaiTicket> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'ticketId', objects, saveLinks: saveLinks);
  }
}

extension VantaiTicketQueryWhereSort
    on QueryBuilder<VantaiTicket, VantaiTicket, QWhere> {
  QueryBuilder<VantaiTicket, VantaiTicket, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VantaiTicketQueryWhere
    on QueryBuilder<VantaiTicket, VantaiTicket, QWhereClause> {
  QueryBuilder<VantaiTicket, VantaiTicket, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterWhereClause> idBetween(
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterWhereClause> ticketIdEqualTo(
      String ticketId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ticketId',
        value: [ticketId],
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterWhereClause>
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

extension VantaiTicketQueryFilter
    on QueryBuilder<VantaiTicket, VantaiTicket, QFilterCondition> {
  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      bookingDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bookingDate',
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      bookingDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bookingDate',
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      bookingDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      bookingDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      bookingDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      bookingDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookingDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      departureTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'departureTime',
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      departureTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'departureTime',
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      departureTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departureTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      departureTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'departureTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      departureTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'departureTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      departureTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'departureTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> priceEqualTo(
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> priceLessThan(
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> priceBetween(
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      seatNumberEqualTo(
    String value, {
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      seatNumberGreaterThan(
    String value, {
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      seatNumberLessThan(
    String value, {
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      seatNumberBetween(
    String lower,
    String upper, {
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      seatNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'seatNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      seatNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'seatNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      seatNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seatNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      seatNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'seatNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> statusEqualTo(
      TicketStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      statusGreaterThan(
    TicketStatus value, {
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      statusLessThan(
    TicketStatus value, {
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> statusBetween(
    TicketStatus lower,
    TicketStatus upper, {
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ticketCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ticketCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ticketCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ticketCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ticketCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticketCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticketCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticketCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
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

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticketId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketId',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      ticketIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticketId',
        value: '',
      ));
    });
  }
}

extension VantaiTicketQueryObject
    on QueryBuilder<VantaiTicket, VantaiTicket, QFilterCondition> {}

extension VantaiTicketQueryLinks
    on QueryBuilder<VantaiTicket, VantaiTicket, QFilterCondition> {
  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> customer(
      FilterQuery<VantaiCustomer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customer');
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customer', 0, true, 0, true);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> route(
      FilterQuery<VantaiRoute> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'route');
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      routeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'route', 0, true, 0, true);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> vehicle(
      FilterQuery<VantaiVehicle> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'vehicle');
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition>
      vehicleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vehicle', 0, true, 0, true);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> trip(
      FilterQuery<VantaiTrip> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'trip');
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterFilterCondition> tripIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'trip', 0, true, 0, true);
    });
  }
}

extension VantaiTicketQuerySortBy
    on QueryBuilder<VantaiTicket, VantaiTicket, QSortBy> {
  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> sortByBookingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingDate', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy>
      sortByBookingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingDate', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> sortByDepartureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy>
      sortByDepartureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> sortBySeatNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatNumber', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy>
      sortBySeatNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatNumber', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> sortByTicketCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketCode', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy>
      sortByTicketCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketCode', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> sortByTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> sortByTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.desc);
    });
  }
}

extension VantaiTicketQuerySortThenBy
    on QueryBuilder<VantaiTicket, VantaiTicket, QSortThenBy> {
  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenByBookingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingDate', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy>
      thenByBookingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingDate', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenByDepartureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy>
      thenByDepartureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenBySeatNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatNumber', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy>
      thenBySeatNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatNumber', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenByTicketCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketCode', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy>
      thenByTicketCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketCode', Sort.desc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenByTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.asc);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QAfterSortBy> thenByTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.desc);
    });
  }
}

extension VantaiTicketQueryWhereDistinct
    on QueryBuilder<VantaiTicket, VantaiTicket, QDistinct> {
  QueryBuilder<VantaiTicket, VantaiTicket, QDistinct> distinctByBookingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookingDate');
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QDistinct>
      distinctByDepartureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'departureTime');
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QDistinct> distinctBySeatNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seatNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QDistinct> distinctByTicketCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticketCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiTicket, VantaiTicket, QDistinct> distinctByTicketId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticketId', caseSensitive: caseSensitive);
    });
  }
}

extension VantaiTicketQueryProperty
    on QueryBuilder<VantaiTicket, VantaiTicket, QQueryProperty> {
  QueryBuilder<VantaiTicket, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VantaiTicket, DateTime?, QQueryOperations>
      bookingDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookingDate');
    });
  }

  QueryBuilder<VantaiTicket, DateTime?, QQueryOperations>
      departureTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'departureTime');
    });
  }

  QueryBuilder<VantaiTicket, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<VantaiTicket, String, QQueryOperations> seatNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seatNumber');
    });
  }

  QueryBuilder<VantaiTicket, TicketStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VantaiTicket, String, QQueryOperations> ticketCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticketCode');
    });
  }

  QueryBuilder<VantaiTicket, String, QQueryOperations> ticketIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticketId');
    });
  }
}
