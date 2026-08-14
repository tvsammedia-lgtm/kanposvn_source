// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_offer.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFlightOfferCollection on Isar {
  IsarCollection<FlightOffer> get flightOffers => this.collection();
}

const FlightOfferSchema = CollectionSchema(
  name: r'FlightOffer',
  id: -5993217085484330668,
  properties: {
    r'airline': PropertySchema(
      id: 0,
      name: r'airline',
      type: IsarType.string,
    ),
    r'arrivalTime': PropertySchema(
      id: 1,
      name: r'arrivalTime',
      type: IsarType.dateTime,
    ),
    r'baseFare': PropertySchema(
      id: 2,
      name: r'baseFare',
      type: IsarType.double,
    ),
    r'cabinClass': PropertySchema(
      id: 3,
      name: r'cabinClass',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'departureTime': PropertySchema(
      id: 5,
      name: r'departureTime',
      type: IsarType.dateTime,
    ),
    r'destination': PropertySchema(
      id: 6,
      name: r'destination',
      type: IsarType.string,
    ),
    r'durationMinutes': PropertySchema(
      id: 7,
      name: r'durationMinutes',
      type: IsarType.long,
    ),
    r'flightNumber': PropertySchema(
      id: 8,
      name: r'flightNumber',
      type: IsarType.string,
    ),
    r'origin': PropertySchema(
      id: 9,
      name: r'origin',
      type: IsarType.string,
    ),
    r'taxAndFee': PropertySchema(
      id: 10,
      name: r'taxAndFee',
      type: IsarType.double,
    ),
    r'totalFare': PropertySchema(
      id: 11,
      name: r'totalFare',
      type: IsarType.double,
    ),
    r'uuid': PropertySchema(
      id: 12,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _flightOfferEstimateSize,
  serialize: _flightOfferSerialize,
  deserialize: _flightOfferDeserialize,
  deserializeProp: _flightOfferDeserializeProp,
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
  getId: _flightOfferGetId,
  getLinks: _flightOfferGetLinks,
  attach: _flightOfferAttach,
  version: '3.1.0+1',
);

int _flightOfferEstimateSize(
  FlightOffer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.airline;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cabinClass;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.destination;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.flightNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.origin;
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

void _flightOfferSerialize(
  FlightOffer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.airline);
  writer.writeDateTime(offsets[1], object.arrivalTime);
  writer.writeDouble(offsets[2], object.baseFare);
  writer.writeString(offsets[3], object.cabinClass);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeDateTime(offsets[5], object.departureTime);
  writer.writeString(offsets[6], object.destination);
  writer.writeLong(offsets[7], object.durationMinutes);
  writer.writeString(offsets[8], object.flightNumber);
  writer.writeString(offsets[9], object.origin);
  writer.writeDouble(offsets[10], object.taxAndFee);
  writer.writeDouble(offsets[11], object.totalFare);
  writer.writeString(offsets[12], object.uuid);
}

FlightOffer _flightOfferDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FlightOffer();
  object.airline = reader.readStringOrNull(offsets[0]);
  object.arrivalTime = reader.readDateTimeOrNull(offsets[1]);
  object.baseFare = reader.readDoubleOrNull(offsets[2]);
  object.cabinClass = reader.readStringOrNull(offsets[3]);
  object.createdAt = reader.readDateTimeOrNull(offsets[4]);
  object.departureTime = reader.readDateTimeOrNull(offsets[5]);
  object.destination = reader.readStringOrNull(offsets[6]);
  object.durationMinutes = reader.readLongOrNull(offsets[7]);
  object.flightNumber = reader.readStringOrNull(offsets[8]);
  object.id = id;
  object.origin = reader.readStringOrNull(offsets[9]);
  object.taxAndFee = reader.readDoubleOrNull(offsets[10]);
  object.totalFare = reader.readDoubleOrNull(offsets[11]);
  object.uuid = reader.readStringOrNull(offsets[12]);
  return object;
}

P _flightOfferDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _flightOfferGetId(FlightOffer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _flightOfferGetLinks(FlightOffer object) {
  return [];
}

void _flightOfferAttach(
    IsarCollection<dynamic> col, Id id, FlightOffer object) {
  object.id = id;
}

extension FlightOfferByIndex on IsarCollection<FlightOffer> {
  Future<FlightOffer?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  FlightOffer? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<FlightOffer?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<FlightOffer?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(FlightOffer object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(FlightOffer object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<FlightOffer> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<FlightOffer> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension FlightOfferQueryWhereSort
    on QueryBuilder<FlightOffer, FlightOffer, QWhere> {
  QueryBuilder<FlightOffer, FlightOffer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FlightOfferQueryWhere
    on QueryBuilder<FlightOffer, FlightOffer, QWhereClause> {
  QueryBuilder<FlightOffer, FlightOffer, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterWhereClause> idBetween(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterWhereClause> uuidNotEqualTo(
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

extension FlightOfferQueryFilter
    on QueryBuilder<FlightOffer, FlightOffer, QFilterCondition> {
  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      airlineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'airline',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      airlineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'airline',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> airlineEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'airline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      airlineGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'airline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> airlineLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'airline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> airlineBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'airline',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      airlineStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'airline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> airlineEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'airline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> airlineContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'airline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> airlineMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'airline',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      airlineIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'airline',
        value: '',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      airlineIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'airline',
        value: '',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      arrivalTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'arrivalTime',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      arrivalTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'arrivalTime',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      arrivalTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'arrivalTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      arrivalTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'arrivalTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      arrivalTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'arrivalTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      arrivalTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'arrivalTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      baseFareIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseFare',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      baseFareIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseFare',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> baseFareEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      baseFareGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      baseFareLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> baseFareBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseFare',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cabinClass',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cabinClass',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cabinClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cabinClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cabinClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cabinClass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cabinClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cabinClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cabinClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cabinClass',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cabinClass',
        value: '',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      cabinClassIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cabinClass',
        value: '',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      departureTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'departureTime',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      departureTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'departureTime',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      departureTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departureTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destination',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destination',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destination',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destination',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destination',
        value: '',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      destinationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destination',
        value: '',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      durationMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationMinutes',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      durationMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationMinutes',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      durationMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      durationMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      durationMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      durationMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flightNumber',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flightNumber',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flightNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flightNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flightNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flightNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'flightNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'flightNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flightNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'flightNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flightNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      flightNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flightNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> originIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'origin',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      originIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'origin',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> originEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      originGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> originLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> originBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'origin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      originStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> originEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> originContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> originMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'origin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      originIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'origin',
        value: '',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      originIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'origin',
        value: '',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      taxAndFeeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxAndFee',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      taxAndFeeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxAndFee',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      taxAndFeeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxAndFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      taxAndFeeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxAndFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      taxAndFeeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxAndFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      taxAndFeeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxAndFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      totalFareIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalFare',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      totalFareIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalFare',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      totalFareEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      totalFareGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      totalFareLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      totalFareBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalFare',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> uuidContains(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension FlightOfferQueryObject
    on QueryBuilder<FlightOffer, FlightOffer, QFilterCondition> {}

extension FlightOfferQueryLinks
    on QueryBuilder<FlightOffer, FlightOffer, QFilterCondition> {}

extension FlightOfferQuerySortBy
    on QueryBuilder<FlightOffer, FlightOffer, QSortBy> {
  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByAirline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'airline', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByAirlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'airline', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByArrivalTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrivalTime', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByArrivalTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrivalTime', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByBaseFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByBaseFareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByCabinClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cabinClass', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByCabinClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cabinClass', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByDepartureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy>
      sortByDepartureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByDestination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByDestinationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy>
      sortByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByFlightNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flightNumber', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy>
      sortByFlightNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flightNumber', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByTaxAndFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAndFee', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByTaxAndFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAndFee', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByTotalFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFare', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByTotalFareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFare', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension FlightOfferQuerySortThenBy
    on QueryBuilder<FlightOffer, FlightOffer, QSortThenBy> {
  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByAirline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'airline', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByAirlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'airline', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByArrivalTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrivalTime', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByArrivalTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrivalTime', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByBaseFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByBaseFareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByCabinClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cabinClass', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByCabinClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cabinClass', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByDepartureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy>
      thenByDepartureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByDestination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByDestinationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy>
      thenByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByFlightNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flightNumber', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy>
      thenByFlightNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flightNumber', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByTaxAndFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAndFee', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByTaxAndFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAndFee', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByTotalFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFare', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByTotalFareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFare', Sort.desc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension FlightOfferQueryWhereDistinct
    on QueryBuilder<FlightOffer, FlightOffer, QDistinct> {
  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByAirline(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'airline', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByArrivalTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'arrivalTime');
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByBaseFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseFare');
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByCabinClass(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cabinClass', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByDepartureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'departureTime');
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByDestination(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destination', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct>
      distinctByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationMinutes');
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByFlightNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flightNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByOrigin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'origin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByTaxAndFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxAndFee');
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByTotalFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFare');
    });
  }

  QueryBuilder<FlightOffer, FlightOffer, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension FlightOfferQueryProperty
    on QueryBuilder<FlightOffer, FlightOffer, QQueryProperty> {
  QueryBuilder<FlightOffer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FlightOffer, String?, QQueryOperations> airlineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'airline');
    });
  }

  QueryBuilder<FlightOffer, DateTime?, QQueryOperations> arrivalTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'arrivalTime');
    });
  }

  QueryBuilder<FlightOffer, double?, QQueryOperations> baseFareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseFare');
    });
  }

  QueryBuilder<FlightOffer, String?, QQueryOperations> cabinClassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cabinClass');
    });
  }

  QueryBuilder<FlightOffer, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FlightOffer, DateTime?, QQueryOperations>
      departureTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'departureTime');
    });
  }

  QueryBuilder<FlightOffer, String?, QQueryOperations> destinationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destination');
    });
  }

  QueryBuilder<FlightOffer, int?, QQueryOperations> durationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationMinutes');
    });
  }

  QueryBuilder<FlightOffer, String?, QQueryOperations> flightNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flightNumber');
    });
  }

  QueryBuilder<FlightOffer, String?, QQueryOperations> originProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'origin');
    });
  }

  QueryBuilder<FlightOffer, double?, QQueryOperations> taxAndFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxAndFee');
    });
  }

  QueryBuilder<FlightOffer, double?, QQueryOperations> totalFareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFare');
    });
  }

  QueryBuilder<FlightOffer, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
