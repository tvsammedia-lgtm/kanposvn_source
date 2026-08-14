// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_ticket.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBusTicketLocalCollection on Isar {
  IsarCollection<BusTicketLocal> get busTicketLocals => this.collection();
}

const BusTicketLocalSchema = CollectionSchema(
  name: r'BusTicketLocal',
  id: -7655107656339588693,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'selectedSeats': PropertySchema(
      id: 1,
      name: r'selectedSeats',
      type: IsarType.stringList,
    ),
    r'status': PropertySchema(
      id: 2,
      name: r'status',
      type: IsarType.byte,
      enumMap: _BusTicketLocalstatusEnumValueMap,
    ),
    r'ticketCode': PropertySchema(
      id: 3,
      name: r'ticketCode',
      type: IsarType.string,
    ),
    r'totalPrice': PropertySchema(
      id: 4,
      name: r'totalPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _busTicketLocalEstimateSize,
  serialize: _busTicketLocalSerialize,
  deserialize: _busTicketLocalDeserialize,
  deserializeProp: _busTicketLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'ticketCode': IndexSchema(
      id: -5171396740593256752,
      name: r'ticketCode',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'ticketCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _busTicketLocalGetId,
  getLinks: _busTicketLocalGetLinks,
  attach: _busTicketLocalAttach,
  version: '3.1.0+1',
);

int _busTicketLocalEstimateSize(
  BusTicketLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.selectedSeats;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.ticketCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _busTicketLocalSerialize(
  BusTicketLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeStringList(offsets[1], object.selectedSeats);
  writer.writeByte(offsets[2], object.status.index);
  writer.writeString(offsets[3], object.ticketCode);
  writer.writeDouble(offsets[4], object.totalPrice);
}

BusTicketLocal _busTicketLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BusTicketLocal();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.selectedSeats = reader.readStringList(offsets[1]);
  object.status =
      _BusTicketLocalstatusValueEnumMap[reader.readByteOrNull(offsets[2])] ??
          BoardingStatus.pending;
  object.ticketCode = reader.readStringOrNull(offsets[3]);
  object.totalPrice = reader.readDoubleOrNull(offsets[4]);
  return object;
}

P _busTicketLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringList(offset)) as P;
    case 2:
      return (_BusTicketLocalstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          BoardingStatus.pending) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BusTicketLocalstatusEnumValueMap = {
  'pending': 0,
  'boarded': 1,
  'cancelled': 2,
};
const _BusTicketLocalstatusValueEnumMap = {
  0: BoardingStatus.pending,
  1: BoardingStatus.boarded,
  2: BoardingStatus.cancelled,
};

Id _busTicketLocalGetId(BusTicketLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _busTicketLocalGetLinks(BusTicketLocal object) {
  return [];
}

void _busTicketLocalAttach(
    IsarCollection<dynamic> col, Id id, BusTicketLocal object) {
  object.id = id;
}

extension BusTicketLocalByIndex on IsarCollection<BusTicketLocal> {
  Future<BusTicketLocal?> getByTicketCode(String? ticketCode) {
    return getByIndex(r'ticketCode', [ticketCode]);
  }

  BusTicketLocal? getByTicketCodeSync(String? ticketCode) {
    return getByIndexSync(r'ticketCode', [ticketCode]);
  }

  Future<bool> deleteByTicketCode(String? ticketCode) {
    return deleteByIndex(r'ticketCode', [ticketCode]);
  }

  bool deleteByTicketCodeSync(String? ticketCode) {
    return deleteByIndexSync(r'ticketCode', [ticketCode]);
  }

  Future<List<BusTicketLocal?>> getAllByTicketCode(
      List<String?> ticketCodeValues) {
    final values = ticketCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'ticketCode', values);
  }

  List<BusTicketLocal?> getAllByTicketCodeSync(List<String?> ticketCodeValues) {
    final values = ticketCodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'ticketCode', values);
  }

  Future<int> deleteAllByTicketCode(List<String?> ticketCodeValues) {
    final values = ticketCodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'ticketCode', values);
  }

  int deleteAllByTicketCodeSync(List<String?> ticketCodeValues) {
    final values = ticketCodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'ticketCode', values);
  }

  Future<Id> putByTicketCode(BusTicketLocal object) {
    return putByIndex(r'ticketCode', object);
  }

  Id putByTicketCodeSync(BusTicketLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'ticketCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTicketCode(List<BusTicketLocal> objects) {
    return putAllByIndex(r'ticketCode', objects);
  }

  List<Id> putAllByTicketCodeSync(List<BusTicketLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'ticketCode', objects, saveLinks: saveLinks);
  }
}

extension BusTicketLocalQueryWhereSort
    on QueryBuilder<BusTicketLocal, BusTicketLocal, QWhere> {
  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BusTicketLocalQueryWhere
    on QueryBuilder<BusTicketLocal, BusTicketLocal, QWhereClause> {
  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterWhereClause>
      ticketCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ticketCode',
        value: [null],
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterWhereClause>
      ticketCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ticketCode',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterWhereClause>
      ticketCodeEqualTo(String? ticketCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ticketCode',
        value: [ticketCode],
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterWhereClause>
      ticketCodeNotEqualTo(String? ticketCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketCode',
              lower: [],
              upper: [ticketCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketCode',
              lower: [ticketCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketCode',
              lower: [ticketCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketCode',
              lower: [],
              upper: [ticketCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BusTicketLocalQueryFilter
    on QueryBuilder<BusTicketLocal, BusTicketLocal, QFilterCondition> {
  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectedSeats',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectedSeats',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedSeats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedSeats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedSeats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedSeats',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'selectedSeats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'selectedSeats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'selectedSeats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'selectedSeats',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedSeats',
        value: '',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'selectedSeats',
        value: '',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedSeats',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedSeats',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedSeats',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedSeats',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedSeats',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      selectedSeatsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedSeats',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      statusEqualTo(BoardingStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      statusGreaterThan(
    BoardingStatus value, {
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      statusLessThan(
    BoardingStatus value, {
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      statusBetween(
    BoardingStatus lower,
    BoardingStatus upper, {
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      ticketCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ticketCode',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      ticketCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ticketCode',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      ticketCodeEqualTo(
    String? value, {
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      ticketCodeGreaterThan(
    String? value, {
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      ticketCodeLessThan(
    String? value, {
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      ticketCodeBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      ticketCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticketCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      ticketCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticketCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      ticketCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketCode',
        value: '',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      ticketCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticketCode',
        value: '',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      totalPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPrice',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      totalPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPrice',
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      totalPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      totalPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      totalPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterFilterCondition>
      totalPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension BusTicketLocalQueryObject
    on QueryBuilder<BusTicketLocal, BusTicketLocal, QFilterCondition> {}

extension BusTicketLocalQueryLinks
    on QueryBuilder<BusTicketLocal, BusTicketLocal, QFilterCondition> {}

extension BusTicketLocalQuerySortBy
    on QueryBuilder<BusTicketLocal, BusTicketLocal, QSortBy> {
  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      sortByTicketCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketCode', Sort.asc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      sortByTicketCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketCode', Sort.desc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      sortByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      sortByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }
}

extension BusTicketLocalQuerySortThenBy
    on QueryBuilder<BusTicketLocal, BusTicketLocal, QSortThenBy> {
  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      thenByTicketCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketCode', Sort.asc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      thenByTicketCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketCode', Sort.desc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      thenByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QAfterSortBy>
      thenByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }
}

extension BusTicketLocalQueryWhereDistinct
    on QueryBuilder<BusTicketLocal, BusTicketLocal, QDistinct> {
  QueryBuilder<BusTicketLocal, BusTicketLocal, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QDistinct>
      distinctBySelectedSeats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedSeats');
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QDistinct> distinctByTicketCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticketCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BusTicketLocal, BusTicketLocal, QDistinct>
      distinctByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPrice');
    });
  }
}

extension BusTicketLocalQueryProperty
    on QueryBuilder<BusTicketLocal, BusTicketLocal, QQueryProperty> {
  QueryBuilder<BusTicketLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BusTicketLocal, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BusTicketLocal, List<String>?, QQueryOperations>
      selectedSeatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedSeats');
    });
  }

  QueryBuilder<BusTicketLocal, BoardingStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<BusTicketLocal, String?, QQueryOperations> ticketCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticketCode');
    });
  }

  QueryBuilder<BusTicketLocal, double?, QQueryOperations> totalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPrice');
    });
  }
}
