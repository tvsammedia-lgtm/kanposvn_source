// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_area.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingAreaCollection on Isar {
  IsarCollection<ParkingArea> get parkingAreas => this.collection();
}

const ParkingAreaSchema = CollectionSchema(
  name: r'ParkingArea',
  id: 6283634861218905272,
  properties: {
    r'allowedVehicleTypes': PropertySchema(
      id: 0,
      name: r'allowedVehicleTypes',
      type: IsarType.string,
    ),
    r'areaCode': PropertySchema(
      id: 1,
      name: r'areaCode',
      type: IsarType.string,
    ),
    r'areaId': PropertySchema(
      id: 2,
      name: r'areaId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.string,
    ),
    r'totalSpots': PropertySchema(
      id: 6,
      name: r'totalSpots',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'usedSpots': PropertySchema(
      id: 8,
      name: r'usedSpots',
      type: IsarType.long,
    )
  },
  estimateSize: _parkingAreaEstimateSize,
  serialize: _parkingAreaSerialize,
  deserialize: _parkingAreaDeserialize,
  deserializeProp: _parkingAreaDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'areaId': IndexSchema(
      id: 7446077024685749099,
      name: r'areaId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'areaId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _parkingAreaGetId,
  getLinks: _parkingAreaGetLinks,
  attach: _parkingAreaAttach,
  version: '3.1.0+1',
);

int _parkingAreaEstimateSize(
  ParkingArea object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.allowedVehicleTypes.length * 3;
  bytesCount += 3 + object.areaCode.length * 3;
  bytesCount += 3 + object.areaId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.status.length * 3;
  return bytesCount;
}

void _parkingAreaSerialize(
  ParkingArea object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.allowedVehicleTypes);
  writer.writeString(offsets[1], object.areaCode);
  writer.writeString(offsets[2], object.areaId);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.status);
  writer.writeLong(offsets[6], object.totalSpots);
  writer.writeDateTime(offsets[7], object.updatedAt);
  writer.writeLong(offsets[8], object.usedSpots);
}

ParkingArea _parkingAreaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingArea();
  object.allowedVehicleTypes = reader.readString(offsets[0]);
  object.areaCode = reader.readString(offsets[1]);
  object.areaId = reader.readString(offsets[2]);
  object.isSynced = reader.readBool(offsets[3]);
  object.isarId = id;
  object.name = reader.readString(offsets[4]);
  object.status = reader.readString(offsets[5]);
  object.totalSpots = reader.readLong(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  object.usedSpots = reader.readLong(offsets[8]);
  return object;
}

P _parkingAreaDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parkingAreaGetId(ParkingArea object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _parkingAreaGetLinks(ParkingArea object) {
  return [];
}

void _parkingAreaAttach(
    IsarCollection<dynamic> col, Id id, ParkingArea object) {
  object.isarId = id;
}

extension ParkingAreaByIndex on IsarCollection<ParkingArea> {
  Future<ParkingArea?> getByAreaId(String areaId) {
    return getByIndex(r'areaId', [areaId]);
  }

  ParkingArea? getByAreaIdSync(String areaId) {
    return getByIndexSync(r'areaId', [areaId]);
  }

  Future<bool> deleteByAreaId(String areaId) {
    return deleteByIndex(r'areaId', [areaId]);
  }

  bool deleteByAreaIdSync(String areaId) {
    return deleteByIndexSync(r'areaId', [areaId]);
  }

  Future<List<ParkingArea?>> getAllByAreaId(List<String> areaIdValues) {
    final values = areaIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'areaId', values);
  }

  List<ParkingArea?> getAllByAreaIdSync(List<String> areaIdValues) {
    final values = areaIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'areaId', values);
  }

  Future<int> deleteAllByAreaId(List<String> areaIdValues) {
    final values = areaIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'areaId', values);
  }

  int deleteAllByAreaIdSync(List<String> areaIdValues) {
    final values = areaIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'areaId', values);
  }

  Future<Id> putByAreaId(ParkingArea object) {
    return putByIndex(r'areaId', object);
  }

  Id putByAreaIdSync(ParkingArea object, {bool saveLinks = true}) {
    return putByIndexSync(r'areaId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAreaId(List<ParkingArea> objects) {
    return putAllByIndex(r'areaId', objects);
  }

  List<Id> putAllByAreaIdSync(List<ParkingArea> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'areaId', objects, saveLinks: saveLinks);
  }
}

extension ParkingAreaQueryWhereSort
    on QueryBuilder<ParkingArea, ParkingArea, QWhere> {
  QueryBuilder<ParkingArea, ParkingArea, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParkingAreaQueryWhere
    on QueryBuilder<ParkingArea, ParkingArea, QWhereClause> {
  QueryBuilder<ParkingArea, ParkingArea, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterWhereClause> areaIdEqualTo(
      String areaId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'areaId',
        value: [areaId],
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterWhereClause> areaIdNotEqualTo(
      String areaId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'areaId',
              lower: [],
              upper: [areaId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'areaId',
              lower: [areaId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'areaId',
              lower: [areaId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'areaId',
              lower: [],
              upper: [areaId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ParkingAreaQueryFilter
    on QueryBuilder<ParkingArea, ParkingArea, QFilterCondition> {
  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      allowedVehicleTypesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowedVehicleTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      allowedVehicleTypesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowedVehicleTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      allowedVehicleTypesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowedVehicleTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      allowedVehicleTypesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowedVehicleTypes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      allowedVehicleTypesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'allowedVehicleTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      allowedVehicleTypesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'allowedVehicleTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      allowedVehicleTypesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'allowedVehicleTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      allowedVehicleTypesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'allowedVehicleTypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      allowedVehicleTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowedVehicleTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      allowedVehicleTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'allowedVehicleTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> areaCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      areaCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'areaCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      areaCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'areaCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> areaCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'areaCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      areaCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'areaCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      areaCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'areaCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      areaCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'areaCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> areaCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'areaCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      areaCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      areaCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'areaCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> areaIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      areaIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'areaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> areaIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'areaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> areaIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'areaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      areaIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'areaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> areaIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'areaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> areaIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'areaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> areaIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'areaId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      areaIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      areaIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'areaId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      totalSpotsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSpots',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      totalSpotsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalSpots',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      totalSpotsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalSpots',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      totalSpotsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalSpots',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
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

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      usedSpotsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedSpots',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      usedSpotsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usedSpots',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      usedSpotsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usedSpots',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterFilterCondition>
      usedSpotsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usedSpots',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ParkingAreaQueryObject
    on QueryBuilder<ParkingArea, ParkingArea, QFilterCondition> {}

extension ParkingAreaQueryLinks
    on QueryBuilder<ParkingArea, ParkingArea, QFilterCondition> {}

extension ParkingAreaQuerySortBy
    on QueryBuilder<ParkingArea, ParkingArea, QSortBy> {
  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy>
      sortByAllowedVehicleTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowedVehicleTypes', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy>
      sortByAllowedVehicleTypesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowedVehicleTypes', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByAreaCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaCode', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByAreaCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaCode', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByAreaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaId', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByAreaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaId', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByTotalSpots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSpots', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByTotalSpotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSpots', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByUsedSpots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedSpots', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> sortByUsedSpotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedSpots', Sort.desc);
    });
  }
}

extension ParkingAreaQuerySortThenBy
    on QueryBuilder<ParkingArea, ParkingArea, QSortThenBy> {
  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy>
      thenByAllowedVehicleTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowedVehicleTypes', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy>
      thenByAllowedVehicleTypesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowedVehicleTypes', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByAreaCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaCode', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByAreaCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaCode', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByAreaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaId', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByAreaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaId', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByTotalSpots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSpots', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByTotalSpotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSpots', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByUsedSpots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedSpots', Sort.asc);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QAfterSortBy> thenByUsedSpotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedSpots', Sort.desc);
    });
  }
}

extension ParkingAreaQueryWhereDistinct
    on QueryBuilder<ParkingArea, ParkingArea, QDistinct> {
  QueryBuilder<ParkingArea, ParkingArea, QDistinct>
      distinctByAllowedVehicleTypes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowedVehicleTypes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QDistinct> distinctByAreaCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'areaCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QDistinct> distinctByAreaId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'areaId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QDistinct> distinctByTotalSpots() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSpots');
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ParkingArea, ParkingArea, QDistinct> distinctByUsedSpots() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usedSpots');
    });
  }
}

extension ParkingAreaQueryProperty
    on QueryBuilder<ParkingArea, ParkingArea, QQueryProperty> {
  QueryBuilder<ParkingArea, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ParkingArea, String, QQueryOperations>
      allowedVehicleTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowedVehicleTypes');
    });
  }

  QueryBuilder<ParkingArea, String, QQueryOperations> areaCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'areaCode');
    });
  }

  QueryBuilder<ParkingArea, String, QQueryOperations> areaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'areaId');
    });
  }

  QueryBuilder<ParkingArea, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ParkingArea, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ParkingArea, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ParkingArea, int, QQueryOperations> totalSpotsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSpots');
    });
  }

  QueryBuilder<ParkingArea, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ParkingArea, int, QQueryOperations> usedSpotsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usedSpots');
    });
  }
}
