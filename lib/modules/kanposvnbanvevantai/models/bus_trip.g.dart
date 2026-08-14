// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_trip.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBusTripLocalCollection on Isar {
  IsarCollection<BusTripLocal> get busTripLocals => this.collection();
}

const BusTripLocalSchema = CollectionSchema(
  name: r'BusTripLocal',
  id: 121181146231681653,
  properties: {
    r'currentLat': PropertySchema(
      id: 0,
      name: r'currentLat',
      type: IsarType.double,
    ),
    r'currentLng': PropertySchema(
      id: 1,
      name: r'currentLng',
      type: IsarType.double,
    ),
    r'destinationLat': PropertySchema(
      id: 2,
      name: r'destinationLat',
      type: IsarType.double,
    ),
    r'destinationLng': PropertySchema(
      id: 3,
      name: r'destinationLng',
      type: IsarType.double,
    ),
    r'driverName': PropertySchema(
      id: 4,
      name: r'driverName',
      type: IsarType.string,
    ),
    r'plateNumber': PropertySchema(
      id: 5,
      name: r'plateNumber',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 7,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _busTripLocalEstimateSize,
  serialize: _busTripLocalSerialize,
  deserialize: _busTripLocalDeserialize,
  deserializeProp: _busTripLocalDeserializeProp,
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
  getId: _busTripLocalGetId,
  getLinks: _busTripLocalGetLinks,
  attach: _busTripLocalAttach,
  version: '3.1.0+1',
);

int _busTripLocalEstimateSize(
  BusTripLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.driverName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.plateNumber;
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

void _busTripLocalSerialize(
  BusTripLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.currentLat);
  writer.writeDouble(offsets[1], object.currentLng);
  writer.writeDouble(offsets[2], object.destinationLat);
  writer.writeDouble(offsets[3], object.destinationLng);
  writer.writeString(offsets[4], object.driverName);
  writer.writeString(offsets[5], object.plateNumber);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeString(offsets[7], object.uuid);
}

BusTripLocal _busTripLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BusTripLocal();
  object.currentLat = reader.readDoubleOrNull(offsets[0]);
  object.currentLng = reader.readDoubleOrNull(offsets[1]);
  object.destinationLat = reader.readDoubleOrNull(offsets[2]);
  object.destinationLng = reader.readDoubleOrNull(offsets[3]);
  object.driverName = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.plateNumber = reader.readStringOrNull(offsets[5]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[6]);
  object.uuid = reader.readStringOrNull(offsets[7]);
  return object;
}

P _busTripLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _busTripLocalGetId(BusTripLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _busTripLocalGetLinks(BusTripLocal object) {
  return [];
}

void _busTripLocalAttach(
    IsarCollection<dynamic> col, Id id, BusTripLocal object) {
  object.id = id;
}

extension BusTripLocalByIndex on IsarCollection<BusTripLocal> {
  Future<BusTripLocal?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  BusTripLocal? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<BusTripLocal?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<BusTripLocal?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(BusTripLocal object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(BusTripLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<BusTripLocal> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<BusTripLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension BusTripLocalQueryWhereSort
    on QueryBuilder<BusTripLocal, BusTripLocal, QWhere> {
  QueryBuilder<BusTripLocal, BusTripLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BusTripLocalQueryWhere
    on QueryBuilder<BusTripLocal, BusTripLocal, QWhereClause> {
  QueryBuilder<BusTripLocal, BusTripLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterWhereClause> uuidNotEqualTo(
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

extension BusTripLocalQueryFilter
    on QueryBuilder<BusTripLocal, BusTripLocal, QFilterCondition> {
  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentLat',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentLat',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentLng',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentLng',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      currentLngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentLng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destinationLat',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destinationLat',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destinationLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destinationLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destinationLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destinationLng',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destinationLng',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destinationLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destinationLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      destinationLngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destinationLng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      driverNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverName',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      driverNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverName',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      driverNameEqualTo(
    String? value, {
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      driverNameGreaterThan(
    String? value, {
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      driverNameLessThan(
    String? value, {
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      driverNameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      driverNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      driverNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      driverNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverName',
        value: '',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      driverNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverName',
        value: '',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plateNumber',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plateNumber',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plateNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plateNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plateNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      plateNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plateNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition> uuidContains(
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension BusTripLocalQueryObject
    on QueryBuilder<BusTripLocal, BusTripLocal, QFilterCondition> {}

extension BusTripLocalQueryLinks
    on QueryBuilder<BusTripLocal, BusTripLocal, QFilterCondition> {}

extension BusTripLocalQuerySortBy
    on QueryBuilder<BusTripLocal, BusTripLocal, QSortBy> {
  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> sortByCurrentLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      sortByCurrentLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> sortByCurrentLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      sortByCurrentLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      sortByDestinationLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationLat', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      sortByDestinationLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationLat', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      sortByDestinationLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationLng', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      sortByDestinationLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationLng', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> sortByDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      sortByDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> sortByPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      sortByPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension BusTripLocalQuerySortThenBy
    on QueryBuilder<BusTripLocal, BusTripLocal, QSortThenBy> {
  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> thenByCurrentLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      thenByCurrentLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLat', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> thenByCurrentLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      thenByCurrentLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLng', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      thenByDestinationLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationLat', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      thenByDestinationLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationLat', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      thenByDestinationLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationLng', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      thenByDestinationLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationLng', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> thenByDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      thenByDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> thenByPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy>
      thenByPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension BusTripLocalQueryWhereDistinct
    on QueryBuilder<BusTripLocal, BusTripLocal, QDistinct> {
  QueryBuilder<BusTripLocal, BusTripLocal, QDistinct> distinctByCurrentLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLat');
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QDistinct> distinctByCurrentLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLng');
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QDistinct>
      distinctByDestinationLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destinationLat');
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QDistinct>
      distinctByDestinationLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destinationLng');
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QDistinct> distinctByDriverName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QDistinct> distinctByPlateNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plateNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<BusTripLocal, BusTripLocal, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension BusTripLocalQueryProperty
    on QueryBuilder<BusTripLocal, BusTripLocal, QQueryProperty> {
  QueryBuilder<BusTripLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BusTripLocal, double?, QQueryOperations> currentLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLat');
    });
  }

  QueryBuilder<BusTripLocal, double?, QQueryOperations> currentLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLng');
    });
  }

  QueryBuilder<BusTripLocal, double?, QQueryOperations>
      destinationLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destinationLat');
    });
  }

  QueryBuilder<BusTripLocal, double?, QQueryOperations>
      destinationLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destinationLng');
    });
  }

  QueryBuilder<BusTripLocal, String?, QQueryOperations> driverNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverName');
    });
  }

  QueryBuilder<BusTripLocal, String?, QQueryOperations> plateNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plateNumber');
    });
  }

  QueryBuilder<BusTripLocal, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<BusTripLocal, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
