// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vantai_vehicle.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVantaiVehicleCollection on Isar {
  IsarCollection<VantaiVehicle> get vantaiVehicles => this.collection();
}

const VantaiVehicleSchema = CollectionSchema(
  name: r'VantaiVehicle',
  id: -180626227633137841,
  properties: {
    r'brand': PropertySchema(
      id: 0,
      name: r'brand',
      type: IsarType.string,
    ),
    r'manufactureYear': PropertySchema(
      id: 1,
      name: r'manufactureYear',
      type: IsarType.long,
    ),
    r'plateNumber': PropertySchema(
      id: 2,
      name: r'plateNumber',
      type: IsarType.string,
    ),
    r'totalSeats': PropertySchema(
      id: 3,
      name: r'totalSeats',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.byte,
      enumMap: _VantaiVehicletypeEnumValueMap,
    ),
    r'vehicleId': PropertySchema(
      id: 5,
      name: r'vehicleId',
      type: IsarType.string,
    )
  },
  estimateSize: _vantaiVehicleEstimateSize,
  serialize: _vantaiVehicleSerialize,
  deserialize: _vantaiVehicleDeserialize,
  deserializeProp: _vantaiVehicleDeserializeProp,
  idName: r'id',
  indexes: {
    r'vehicleId': IndexSchema(
      id: 2011968157433523416,
      name: r'vehicleId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'vehicleId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _vantaiVehicleGetId,
  getLinks: _vantaiVehicleGetLinks,
  attach: _vantaiVehicleAttach,
  version: '3.1.0+1',
);

int _vantaiVehicleEstimateSize(
  VantaiVehicle object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.brand.length * 3;
  bytesCount += 3 + object.plateNumber.length * 3;
  bytesCount += 3 + object.vehicleId.length * 3;
  return bytesCount;
}

void _vantaiVehicleSerialize(
  VantaiVehicle object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brand);
  writer.writeLong(offsets[1], object.manufactureYear);
  writer.writeString(offsets[2], object.plateNumber);
  writer.writeLong(offsets[3], object.totalSeats);
  writer.writeByte(offsets[4], object.type.index);
  writer.writeString(offsets[5], object.vehicleId);
}

VantaiVehicle _vantaiVehicleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VantaiVehicle();
  object.brand = reader.readString(offsets[0]);
  object.id = id;
  object.manufactureYear = reader.readLong(offsets[1]);
  object.plateNumber = reader.readString(offsets[2]);
  object.totalSeats = reader.readLong(offsets[3]);
  object.type =
      _VantaiVehicletypeValueEnumMap[reader.readByteOrNull(offsets[4])] ??
          VehicleType.SLEEPER;
  object.vehicleId = reader.readString(offsets[5]);
  return object;
}

P _vantaiVehicleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (_VantaiVehicletypeValueEnumMap[reader.readByteOrNull(offset)] ??
          VehicleType.SLEEPER) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VantaiVehicletypeEnumValueMap = {
  'SLEEPER': 0,
  'SEAT': 1,
  'LIMOUSINE': 2,
  'TRUCK': 3,
};
const _VantaiVehicletypeValueEnumMap = {
  0: VehicleType.SLEEPER,
  1: VehicleType.SEAT,
  2: VehicleType.LIMOUSINE,
  3: VehicleType.TRUCK,
};

Id _vantaiVehicleGetId(VantaiVehicle object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vantaiVehicleGetLinks(VantaiVehicle object) {
  return [];
}

void _vantaiVehicleAttach(
    IsarCollection<dynamic> col, Id id, VantaiVehicle object) {
  object.id = id;
}

extension VantaiVehicleByIndex on IsarCollection<VantaiVehicle> {
  Future<VantaiVehicle?> getByVehicleId(String vehicleId) {
    return getByIndex(r'vehicleId', [vehicleId]);
  }

  VantaiVehicle? getByVehicleIdSync(String vehicleId) {
    return getByIndexSync(r'vehicleId', [vehicleId]);
  }

  Future<bool> deleteByVehicleId(String vehicleId) {
    return deleteByIndex(r'vehicleId', [vehicleId]);
  }

  bool deleteByVehicleIdSync(String vehicleId) {
    return deleteByIndexSync(r'vehicleId', [vehicleId]);
  }

  Future<List<VantaiVehicle?>> getAllByVehicleId(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'vehicleId', values);
  }

  List<VantaiVehicle?> getAllByVehicleIdSync(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'vehicleId', values);
  }

  Future<int> deleteAllByVehicleId(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'vehicleId', values);
  }

  int deleteAllByVehicleIdSync(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'vehicleId', values);
  }

  Future<Id> putByVehicleId(VantaiVehicle object) {
    return putByIndex(r'vehicleId', object);
  }

  Id putByVehicleIdSync(VantaiVehicle object, {bool saveLinks = true}) {
    return putByIndexSync(r'vehicleId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByVehicleId(List<VantaiVehicle> objects) {
    return putAllByIndex(r'vehicleId', objects);
  }

  List<Id> putAllByVehicleIdSync(List<VantaiVehicle> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'vehicleId', objects, saveLinks: saveLinks);
  }
}

extension VantaiVehicleQueryWhereSort
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QWhere> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VantaiVehicleQueryWhere
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QWhereClause> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause> idBetween(
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause>
      vehicleIdEqualTo(String vehicleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'vehicleId',
        value: [vehicleId],
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterWhereClause>
      vehicleIdNotEqualTo(String vehicleId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [],
              upper: [vehicleId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [vehicleId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [vehicleId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [],
              upper: [vehicleId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VantaiVehicleQueryFilter
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QFilterCondition> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      manufactureYearEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manufactureYear',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      manufactureYearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'manufactureYear',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      manufactureYearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'manufactureYear',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      manufactureYearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'manufactureYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberEqualTo(
    String value, {
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberGreaterThan(
    String value, {
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberLessThan(
    String value, {
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberBetween(
    String lower,
    String upper, {
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plateNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plateNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plateNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      plateNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plateNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      totalSeatsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSeats',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      totalSeatsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalSeats',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      totalSeatsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalSeats',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      totalSeatsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalSeats',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition> typeEqualTo(
      VehicleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      typeGreaterThan(
    VehicleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      typeLessThan(
    VehicleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition> typeBetween(
    VehicleType lower,
    VehicleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
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

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      vehicleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      vehicleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      vehicleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterFilterCondition>
      vehicleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleId',
        value: '',
      ));
    });
  }
}

extension VantaiVehicleQueryObject
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QFilterCondition> {}

extension VantaiVehicleQueryLinks
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QFilterCondition> {}

extension VantaiVehicleQuerySortBy
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QSortBy> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByManufactureYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByManufactureYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByTotalSeats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeats', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByTotalSeatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeats', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> sortByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      sortByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }
}

extension VantaiVehicleQuerySortThenBy
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QSortThenBy> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByManufactureYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByManufactureYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manufactureYear', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByTotalSeats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeats', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByTotalSeatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeats', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy> thenByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QAfterSortBy>
      thenByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }
}

extension VantaiVehicleQueryWhereDistinct
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> {
  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct>
      distinctByManufactureYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'manufactureYear');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByPlateNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plateNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByTotalSeats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSeats');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<VantaiVehicle, VantaiVehicle, QDistinct> distinctByVehicleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleId', caseSensitive: caseSensitive);
    });
  }
}

extension VantaiVehicleQueryProperty
    on QueryBuilder<VantaiVehicle, VantaiVehicle, QQueryProperty> {
  QueryBuilder<VantaiVehicle, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VantaiVehicle, String, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<VantaiVehicle, int, QQueryOperations> manufactureYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'manufactureYear');
    });
  }

  QueryBuilder<VantaiVehicle, String, QQueryOperations> plateNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plateNumber');
    });
  }

  QueryBuilder<VantaiVehicle, int, QQueryOperations> totalSeatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSeats');
    });
  }

  QueryBuilder<VantaiVehicle, VehicleType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<VantaiVehicle, String, QQueryOperations> vehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleId');
    });
  }
}
