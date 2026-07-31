// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vantai_route.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVantaiRouteCollection on Isar {
  IsarCollection<VantaiRoute> get vantaiRoutes => this.collection();
}

const VantaiRouteSchema = CollectionSchema(
  name: r'VantaiRoute',
  id: 3008113811359900364,
  properties: {
    r'basePrice': PropertySchema(
      id: 0,
      name: r'basePrice',
      type: IsarType.double,
    ),
    r'distanceKm': PropertySchema(
      id: 1,
      name: r'distanceKm',
      type: IsarType.double,
    ),
    r'endPoint': PropertySchema(
      id: 2,
      name: r'endPoint',
      type: IsarType.string,
    ),
    r'estimatedTime': PropertySchema(
      id: 3,
      name: r'estimatedTime',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 4,
      name: r'notes',
      type: IsarType.string,
    ),
    r'routeId': PropertySchema(
      id: 5,
      name: r'routeId',
      type: IsarType.string,
    ),
    r'routeName': PropertySchema(
      id: 6,
      name: r'routeName',
      type: IsarType.string,
    ),
    r'startPoint': PropertySchema(
      id: 7,
      name: r'startPoint',
      type: IsarType.string,
    )
  },
  estimateSize: _vantaiRouteEstimateSize,
  serialize: _vantaiRouteSerialize,
  deserialize: _vantaiRouteDeserialize,
  deserializeProp: _vantaiRouteDeserializeProp,
  idName: r'id',
  indexes: {
    r'routeId': IndexSchema(
      id: 3544562048266535092,
      name: r'routeId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'routeId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _vantaiRouteGetId,
  getLinks: _vantaiRouteGetLinks,
  attach: _vantaiRouteAttach,
  version: '3.1.0+1',
);

int _vantaiRouteEstimateSize(
  VantaiRoute object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.endPoint.length * 3;
  bytesCount += 3 + object.estimatedTime.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  bytesCount += 3 + object.routeId.length * 3;
  bytesCount += 3 + object.routeName.length * 3;
  bytesCount += 3 + object.startPoint.length * 3;
  return bytesCount;
}

void _vantaiRouteSerialize(
  VantaiRoute object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.basePrice);
  writer.writeDouble(offsets[1], object.distanceKm);
  writer.writeString(offsets[2], object.endPoint);
  writer.writeString(offsets[3], object.estimatedTime);
  writer.writeString(offsets[4], object.notes);
  writer.writeString(offsets[5], object.routeId);
  writer.writeString(offsets[6], object.routeName);
  writer.writeString(offsets[7], object.startPoint);
}

VantaiRoute _vantaiRouteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VantaiRoute();
  object.basePrice = reader.readDouble(offsets[0]);
  object.distanceKm = reader.readDouble(offsets[1]);
  object.endPoint = reader.readString(offsets[2]);
  object.estimatedTime = reader.readString(offsets[3]);
  object.id = id;
  object.notes = reader.readString(offsets[4]);
  object.routeId = reader.readString(offsets[5]);
  object.routeName = reader.readString(offsets[6]);
  object.startPoint = reader.readString(offsets[7]);
  return object;
}

P _vantaiRouteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vantaiRouteGetId(VantaiRoute object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vantaiRouteGetLinks(VantaiRoute object) {
  return [];
}

void _vantaiRouteAttach(
    IsarCollection<dynamic> col, Id id, VantaiRoute object) {
  object.id = id;
}

extension VantaiRouteByIndex on IsarCollection<VantaiRoute> {
  Future<VantaiRoute?> getByRouteId(String routeId) {
    return getByIndex(r'routeId', [routeId]);
  }

  VantaiRoute? getByRouteIdSync(String routeId) {
    return getByIndexSync(r'routeId', [routeId]);
  }

  Future<bool> deleteByRouteId(String routeId) {
    return deleteByIndex(r'routeId', [routeId]);
  }

  bool deleteByRouteIdSync(String routeId) {
    return deleteByIndexSync(r'routeId', [routeId]);
  }

  Future<List<VantaiRoute?>> getAllByRouteId(List<String> routeIdValues) {
    final values = routeIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'routeId', values);
  }

  List<VantaiRoute?> getAllByRouteIdSync(List<String> routeIdValues) {
    final values = routeIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'routeId', values);
  }

  Future<int> deleteAllByRouteId(List<String> routeIdValues) {
    final values = routeIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'routeId', values);
  }

  int deleteAllByRouteIdSync(List<String> routeIdValues) {
    final values = routeIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'routeId', values);
  }

  Future<Id> putByRouteId(VantaiRoute object) {
    return putByIndex(r'routeId', object);
  }

  Id putByRouteIdSync(VantaiRoute object, {bool saveLinks = true}) {
    return putByIndexSync(r'routeId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRouteId(List<VantaiRoute> objects) {
    return putAllByIndex(r'routeId', objects);
  }

  List<Id> putAllByRouteIdSync(List<VantaiRoute> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'routeId', objects, saveLinks: saveLinks);
  }
}

extension VantaiRouteQueryWhereSort
    on QueryBuilder<VantaiRoute, VantaiRoute, QWhere> {
  QueryBuilder<VantaiRoute, VantaiRoute, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VantaiRouteQueryWhere
    on QueryBuilder<VantaiRoute, VantaiRoute, QWhereClause> {
  QueryBuilder<VantaiRoute, VantaiRoute, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterWhereClause> idBetween(
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

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterWhereClause> routeIdEqualTo(
      String routeId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'routeId',
        value: [routeId],
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterWhereClause> routeIdNotEqualTo(
      String routeId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'routeId',
              lower: [],
              upper: [routeId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'routeId',
              lower: [routeId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'routeId',
              lower: [routeId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'routeId',
              lower: [],
              upper: [routeId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VantaiRouteQueryFilter
    on QueryBuilder<VantaiRoute, VantaiRoute, QFilterCondition> {
  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      basePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'basePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      basePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'basePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      basePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'basePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      basePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'basePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      distanceKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      distanceKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'distanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      distanceKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'distanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      distanceKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'distanceKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> endPointEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      endPointGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      endPointLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> endPointBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endPoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      endPointStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'endPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      endPointEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'endPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      endPointContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> endPointMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endPoint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      endPointIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endPoint',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      endPointIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endPoint',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      estimatedTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      estimatedTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      estimatedTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      estimatedTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      estimatedTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estimatedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      estimatedTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estimatedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      estimatedTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estimatedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      estimatedTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estimatedTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      estimatedTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedTime',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      estimatedTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estimatedTime',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      notesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> notesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> notesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> routeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'routeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'routeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> routeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'routeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> routeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'routeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'routeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> routeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'routeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> routeIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'routeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition> routeIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'routeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'routeId',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'routeId',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'routeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'routeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'routeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'routeName',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      routeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'routeName',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      startPointEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      startPointGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      startPointLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      startPointBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startPoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      startPointStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'startPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      startPointEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'startPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      startPointContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'startPoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      startPointMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'startPoint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      startPointIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startPoint',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterFilterCondition>
      startPointIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'startPoint',
        value: '',
      ));
    });
  }
}

extension VantaiRouteQueryObject
    on QueryBuilder<VantaiRoute, VantaiRoute, QFilterCondition> {}

extension VantaiRouteQueryLinks
    on QueryBuilder<VantaiRoute, VantaiRoute, QFilterCondition> {}

extension VantaiRouteQuerySortBy
    on QueryBuilder<VantaiRoute, VantaiRoute, QSortBy> {
  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByBasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basePrice', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByBasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basePrice', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByEndPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endPoint', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByEndPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endPoint', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByEstimatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedTime', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy>
      sortByEstimatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedTime', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByRouteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByRouteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByRouteName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeName', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByRouteNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeName', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByStartPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startPoint', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> sortByStartPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startPoint', Sort.desc);
    });
  }
}

extension VantaiRouteQuerySortThenBy
    on QueryBuilder<VantaiRoute, VantaiRoute, QSortThenBy> {
  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByBasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basePrice', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByBasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basePrice', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByEndPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endPoint', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByEndPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endPoint', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByEstimatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedTime', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy>
      thenByEstimatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedTime', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByRouteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByRouteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByRouteName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeName', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByRouteNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeName', Sort.desc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByStartPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startPoint', Sort.asc);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QAfterSortBy> thenByStartPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startPoint', Sort.desc);
    });
  }
}

extension VantaiRouteQueryWhereDistinct
    on QueryBuilder<VantaiRoute, VantaiRoute, QDistinct> {
  QueryBuilder<VantaiRoute, VantaiRoute, QDistinct> distinctByBasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'basePrice');
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QDistinct> distinctByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceKm');
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QDistinct> distinctByEndPoint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endPoint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QDistinct> distinctByEstimatedTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QDistinct> distinctByRouteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'routeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QDistinct> distinctByRouteName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'routeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiRoute, VantaiRoute, QDistinct> distinctByStartPoint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startPoint', caseSensitive: caseSensitive);
    });
  }
}

extension VantaiRouteQueryProperty
    on QueryBuilder<VantaiRoute, VantaiRoute, QQueryProperty> {
  QueryBuilder<VantaiRoute, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VantaiRoute, double, QQueryOperations> basePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'basePrice');
    });
  }

  QueryBuilder<VantaiRoute, double, QQueryOperations> distanceKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceKm');
    });
  }

  QueryBuilder<VantaiRoute, String, QQueryOperations> endPointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endPoint');
    });
  }

  QueryBuilder<VantaiRoute, String, QQueryOperations> estimatedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedTime');
    });
  }

  QueryBuilder<VantaiRoute, String, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<VantaiRoute, String, QQueryOperations> routeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'routeId');
    });
  }

  QueryBuilder<VantaiRoute, String, QQueryOperations> routeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'routeName');
    });
  }

  QueryBuilder<VantaiRoute, String, QQueryOperations> startPointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startPoint');
    });
  }
}
