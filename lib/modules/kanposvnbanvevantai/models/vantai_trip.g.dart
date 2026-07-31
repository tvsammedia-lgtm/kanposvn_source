// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vantai_trip.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVantaiTripCollection on Isar {
  IsarCollection<VantaiTrip> get vantaiTrips => this.collection();
}

const VantaiTripSchema = CollectionSchema(
  name: r'VantaiTrip',
  id: 2553233745026948237,
  properties: {
    r'arrivalTime': PropertySchema(
      id: 0,
      name: r'arrivalTime',
      type: IsarType.dateTime,
    ),
    r'departureTime': PropertySchema(
      id: 1,
      name: r'departureTime',
      type: IsarType.dateTime,
    ),
    r'driverName': PropertySchema(
      id: 2,
      name: r'driverName',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 3,
      name: r'status',
      type: IsarType.byte,
      enumMap: _VantaiTripstatusEnumValueMap,
    ),
    r'tripId': PropertySchema(
      id: 4,
      name: r'tripId',
      type: IsarType.string,
    )
  },
  estimateSize: _vantaiTripEstimateSize,
  serialize: _vantaiTripSerialize,
  deserialize: _vantaiTripDeserialize,
  deserializeProp: _vantaiTripDeserializeProp,
  idName: r'id',
  indexes: {
    r'tripId': IndexSchema(
      id: 7734156669642746260,
      name: r'tripId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'tripId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'route': LinkSchema(
      id: -1463103417594934784,
      name: r'route',
      target: r'VantaiRoute',
      single: true,
    ),
    r'vehicle': LinkSchema(
      id: 441542903582871958,
      name: r'vehicle',
      target: r'VantaiVehicle',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _vantaiTripGetId,
  getLinks: _vantaiTripGetLinks,
  attach: _vantaiTripAttach,
  version: '3.1.0+1',
);

int _vantaiTripEstimateSize(
  VantaiTrip object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.driverName.length * 3;
  bytesCount += 3 + object.tripId.length * 3;
  return bytesCount;
}

void _vantaiTripSerialize(
  VantaiTrip object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.arrivalTime);
  writer.writeDateTime(offsets[1], object.departureTime);
  writer.writeString(offsets[2], object.driverName);
  writer.writeByte(offsets[3], object.status.index);
  writer.writeString(offsets[4], object.tripId);
}

VantaiTrip _vantaiTripDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VantaiTrip();
  object.arrivalTime = reader.readDateTimeOrNull(offsets[0]);
  object.departureTime = reader.readDateTimeOrNull(offsets[1]);
  object.driverName = reader.readString(offsets[2]);
  object.id = id;
  object.status =
      _VantaiTripstatusValueEnumMap[reader.readByteOrNull(offsets[3])] ??
          TripStatus.SCHEDULED;
  object.tripId = reader.readString(offsets[4]);
  return object;
}

P _vantaiTripDeserializeProp<P>(
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
      return (_VantaiTripstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          TripStatus.SCHEDULED) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VantaiTripstatusEnumValueMap = {
  'SCHEDULED': 0,
  'RUNNING': 1,
  'COMPLETED': 2,
  'CANCELLED': 3,
};
const _VantaiTripstatusValueEnumMap = {
  0: TripStatus.SCHEDULED,
  1: TripStatus.RUNNING,
  2: TripStatus.COMPLETED,
  3: TripStatus.CANCELLED,
};

Id _vantaiTripGetId(VantaiTrip object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vantaiTripGetLinks(VantaiTrip object) {
  return [object.route, object.vehicle];
}

void _vantaiTripAttach(IsarCollection<dynamic> col, Id id, VantaiTrip object) {
  object.id = id;
  object.route.attach(col, col.isar.collection<VantaiRoute>(), r'route', id);
  object.vehicle
      .attach(col, col.isar.collection<VantaiVehicle>(), r'vehicle', id);
}

extension VantaiTripByIndex on IsarCollection<VantaiTrip> {
  Future<VantaiTrip?> getByTripId(String tripId) {
    return getByIndex(r'tripId', [tripId]);
  }

  VantaiTrip? getByTripIdSync(String tripId) {
    return getByIndexSync(r'tripId', [tripId]);
  }

  Future<bool> deleteByTripId(String tripId) {
    return deleteByIndex(r'tripId', [tripId]);
  }

  bool deleteByTripIdSync(String tripId) {
    return deleteByIndexSync(r'tripId', [tripId]);
  }

  Future<List<VantaiTrip?>> getAllByTripId(List<String> tripIdValues) {
    final values = tripIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'tripId', values);
  }

  List<VantaiTrip?> getAllByTripIdSync(List<String> tripIdValues) {
    final values = tripIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'tripId', values);
  }

  Future<int> deleteAllByTripId(List<String> tripIdValues) {
    final values = tripIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'tripId', values);
  }

  int deleteAllByTripIdSync(List<String> tripIdValues) {
    final values = tripIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'tripId', values);
  }

  Future<Id> putByTripId(VantaiTrip object) {
    return putByIndex(r'tripId', object);
  }

  Id putByTripIdSync(VantaiTrip object, {bool saveLinks = true}) {
    return putByIndexSync(r'tripId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTripId(List<VantaiTrip> objects) {
    return putAllByIndex(r'tripId', objects);
  }

  List<Id> putAllByTripIdSync(List<VantaiTrip> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'tripId', objects, saveLinks: saveLinks);
  }
}

extension VantaiTripQueryWhereSort
    on QueryBuilder<VantaiTrip, VantaiTrip, QWhere> {
  QueryBuilder<VantaiTrip, VantaiTrip, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VantaiTripQueryWhere
    on QueryBuilder<VantaiTrip, VantaiTrip, QWhereClause> {
  QueryBuilder<VantaiTrip, VantaiTrip, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterWhereClause> idBetween(
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterWhereClause> tripIdEqualTo(
      String tripId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tripId',
        value: [tripId],
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterWhereClause> tripIdNotEqualTo(
      String tripId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [],
              upper: [tripId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [tripId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [tripId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [],
              upper: [tripId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VantaiTripQueryFilter
    on QueryBuilder<VantaiTrip, VantaiTrip, QFilterCondition> {
  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      arrivalTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'arrivalTime',
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      arrivalTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'arrivalTime',
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      arrivalTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'arrivalTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      departureTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'departureTime',
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      departureTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'departureTime',
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      departureTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departureTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> driverNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      driverNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      driverNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> driverNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      driverNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      driverNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      driverNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> driverNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      driverNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverName',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      driverNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverName',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> statusEqualTo(
      TripStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> statusGreaterThan(
    TripStatus value, {
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> statusLessThan(
    TripStatus value, {
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> statusBetween(
    TripStatus lower,
    TripStatus upper, {
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

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> tripIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> tripIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> tripIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> tripIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tripId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> tripIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> tripIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> tripIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> tripIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tripId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> tripIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripId',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition>
      tripIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tripId',
        value: '',
      ));
    });
  }
}

extension VantaiTripQueryObject
    on QueryBuilder<VantaiTrip, VantaiTrip, QFilterCondition> {}

extension VantaiTripQueryLinks
    on QueryBuilder<VantaiTrip, VantaiTrip, QFilterCondition> {
  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> route(
      FilterQuery<VantaiRoute> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'route');
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> routeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'route', 0, true, 0, true);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> vehicle(
      FilterQuery<VantaiVehicle> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'vehicle');
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterFilterCondition> vehicleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vehicle', 0, true, 0, true);
    });
  }
}

extension VantaiTripQuerySortBy
    on QueryBuilder<VantaiTrip, VantaiTrip, QSortBy> {
  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> sortByArrivalTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrivalTime', Sort.asc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> sortByArrivalTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrivalTime', Sort.desc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> sortByDepartureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.asc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> sortByDepartureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.desc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> sortByDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.asc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> sortByDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.desc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> sortByTripId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.asc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> sortByTripIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.desc);
    });
  }
}

extension VantaiTripQuerySortThenBy
    on QueryBuilder<VantaiTrip, VantaiTrip, QSortThenBy> {
  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenByArrivalTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrivalTime', Sort.asc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenByArrivalTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrivalTime', Sort.desc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenByDepartureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.asc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenByDepartureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.desc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenByDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.asc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenByDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.desc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenByTripId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.asc);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QAfterSortBy> thenByTripIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.desc);
    });
  }
}

extension VantaiTripQueryWhereDistinct
    on QueryBuilder<VantaiTrip, VantaiTrip, QDistinct> {
  QueryBuilder<VantaiTrip, VantaiTrip, QDistinct> distinctByArrivalTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'arrivalTime');
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QDistinct> distinctByDepartureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'departureTime');
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QDistinct> distinctByDriverName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<VantaiTrip, VantaiTrip, QDistinct> distinctByTripId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tripId', caseSensitive: caseSensitive);
    });
  }
}

extension VantaiTripQueryProperty
    on QueryBuilder<VantaiTrip, VantaiTrip, QQueryProperty> {
  QueryBuilder<VantaiTrip, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VantaiTrip, DateTime?, QQueryOperations> arrivalTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'arrivalTime');
    });
  }

  QueryBuilder<VantaiTrip, DateTime?, QQueryOperations>
      departureTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'departureTime');
    });
  }

  QueryBuilder<VantaiTrip, String, QQueryOperations> driverNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverName');
    });
  }

  QueryBuilder<VantaiTrip, TripStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VantaiTrip, String, QQueryOperations> tripIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tripId');
    });
  }
}
