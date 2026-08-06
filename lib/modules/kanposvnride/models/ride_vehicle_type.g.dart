// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_vehicle_type.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKanRideVehicleTypeCollection on Isar {
  IsarCollection<KanRideVehicleType> get kanRideVehicleTypes =>
      this.collection();
}

const KanRideVehicleTypeSchema = CollectionSchema(
  name: r'KanRideVehicleType',
  id: 5446976615816171813,
  properties: {
    r'baseFare': PropertySchema(
      id: 0,
      name: r'baseFare',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 1,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'pricePerKm': PropertySchema(
      id: 3,
      name: r'pricePerKm',
      type: IsarType.double,
    ),
    r'pricePerMinute': PropertySchema(
      id: 4,
      name: r'pricePerMinute',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.string,
    ),
    r'vehicleTypeId': PropertySchema(
      id: 6,
      name: r'vehicleTypeId',
      type: IsarType.string,
    )
  },
  estimateSize: _kanRideVehicleTypeEstimateSize,
  serialize: _kanRideVehicleTypeSerialize,
  deserialize: _kanRideVehicleTypeDeserialize,
  deserializeProp: _kanRideVehicleTypeDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'vehicleTypeId': IndexSchema(
      id: -8510864119142010452,
      name: r'vehicleTypeId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'vehicleTypeId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _kanRideVehicleTypeGetId,
  getLinks: _kanRideVehicleTypeGetLinks,
  attach: _kanRideVehicleTypeAttach,
  version: '3.1.0+1',
);

int _kanRideVehicleTypeEstimateSize(
  KanRideVehicleType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.vehicleTypeId.length * 3;
  return bytesCount;
}

void _kanRideVehicleTypeSerialize(
  KanRideVehicleType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.baseFare);
  writer.writeBool(offsets[1], object.isSynced);
  writer.writeString(offsets[2], object.name);
  writer.writeDouble(offsets[3], object.pricePerKm);
  writer.writeDouble(offsets[4], object.pricePerMinute);
  writer.writeString(offsets[5], object.status);
  writer.writeString(offsets[6], object.vehicleTypeId);
}

KanRideVehicleType _kanRideVehicleTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KanRideVehicleType();
  object.baseFare = reader.readDouble(offsets[0]);
  object.isSynced = reader.readBool(offsets[1]);
  object.isarId = id;
  object.name = reader.readString(offsets[2]);
  object.pricePerKm = reader.readDouble(offsets[3]);
  object.pricePerMinute = reader.readDouble(offsets[4]);
  object.status = reader.readString(offsets[5]);
  object.vehicleTypeId = reader.readString(offsets[6]);
  return object;
}

P _kanRideVehicleTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kanRideVehicleTypeGetId(KanRideVehicleType object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _kanRideVehicleTypeGetLinks(
    KanRideVehicleType object) {
  return [];
}

void _kanRideVehicleTypeAttach(
    IsarCollection<dynamic> col, Id id, KanRideVehicleType object) {
  object.isarId = id;
}

extension KanRideVehicleTypeByIndex on IsarCollection<KanRideVehicleType> {
  Future<KanRideVehicleType?> getByVehicleTypeId(String vehicleTypeId) {
    return getByIndex(r'vehicleTypeId', [vehicleTypeId]);
  }

  KanRideVehicleType? getByVehicleTypeIdSync(String vehicleTypeId) {
    return getByIndexSync(r'vehicleTypeId', [vehicleTypeId]);
  }

  Future<bool> deleteByVehicleTypeId(String vehicleTypeId) {
    return deleteByIndex(r'vehicleTypeId', [vehicleTypeId]);
  }

  bool deleteByVehicleTypeIdSync(String vehicleTypeId) {
    return deleteByIndexSync(r'vehicleTypeId', [vehicleTypeId]);
  }

  Future<List<KanRideVehicleType?>> getAllByVehicleTypeId(
      List<String> vehicleTypeIdValues) {
    final values = vehicleTypeIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'vehicleTypeId', values);
  }

  List<KanRideVehicleType?> getAllByVehicleTypeIdSync(
      List<String> vehicleTypeIdValues) {
    final values = vehicleTypeIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'vehicleTypeId', values);
  }

  Future<int> deleteAllByVehicleTypeId(List<String> vehicleTypeIdValues) {
    final values = vehicleTypeIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'vehicleTypeId', values);
  }

  int deleteAllByVehicleTypeIdSync(List<String> vehicleTypeIdValues) {
    final values = vehicleTypeIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'vehicleTypeId', values);
  }

  Future<Id> putByVehicleTypeId(KanRideVehicleType object) {
    return putByIndex(r'vehicleTypeId', object);
  }

  Id putByVehicleTypeIdSync(KanRideVehicleType object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'vehicleTypeId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByVehicleTypeId(List<KanRideVehicleType> objects) {
    return putAllByIndex(r'vehicleTypeId', objects);
  }

  List<Id> putAllByVehicleTypeIdSync(List<KanRideVehicleType> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'vehicleTypeId', objects, saveLinks: saveLinks);
  }
}

extension KanRideVehicleTypeQueryWhereSort
    on QueryBuilder<KanRideVehicleType, KanRideVehicleType, QWhere> {
  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KanRideVehicleTypeQueryWhere
    on QueryBuilder<KanRideVehicleType, KanRideVehicleType, QWhereClause> {
  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterWhereClause>
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterWhereClause>
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterWhereClause>
      vehicleTypeIdEqualTo(String vehicleTypeId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'vehicleTypeId',
        value: [vehicleTypeId],
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterWhereClause>
      vehicleTypeIdNotEqualTo(String vehicleTypeId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleTypeId',
              lower: [],
              upper: [vehicleTypeId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleTypeId',
              lower: [vehicleTypeId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleTypeId',
              lower: [vehicleTypeId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleTypeId',
              lower: [],
              upper: [vehicleTypeId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension KanRideVehicleTypeQueryFilter
    on QueryBuilder<KanRideVehicleType, KanRideVehicleType, QFilterCondition> {
  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      baseFareEqualTo(
    double value, {
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      baseFareGreaterThan(
    double value, {
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      baseFareLessThan(
    double value, {
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      baseFareBetween(
    double lower,
    double upper, {
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      pricePerKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricePerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      pricePerKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pricePerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      pricePerKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pricePerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      pricePerKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pricePerKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      pricePerMinuteEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricePerMinute',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      pricePerMinuteGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pricePerMinute',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      pricePerMinuteLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pricePerMinute',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      pricePerMinuteBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pricePerMinute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
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

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      vehicleTypeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      vehicleTypeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      vehicleTypeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      vehicleTypeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      vehicleTypeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      vehicleTypeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      vehicleTypeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      vehicleTypeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleTypeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      vehicleTypeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterFilterCondition>
      vehicleTypeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleTypeId',
        value: '',
      ));
    });
  }
}

extension KanRideVehicleTypeQueryObject
    on QueryBuilder<KanRideVehicleType, KanRideVehicleType, QFilterCondition> {}

extension KanRideVehicleTypeQueryLinks
    on QueryBuilder<KanRideVehicleType, KanRideVehicleType, QFilterCondition> {}

extension KanRideVehicleTypeQuerySortBy
    on QueryBuilder<KanRideVehicleType, KanRideVehicleType, QSortBy> {
  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByBaseFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByBaseFareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByPricePerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerKm', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByPricePerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerKm', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByPricePerMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerMinute', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByPricePerMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerMinute', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByVehicleTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      sortByVehicleTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.desc);
    });
  }
}

extension KanRideVehicleTypeQuerySortThenBy
    on QueryBuilder<KanRideVehicleType, KanRideVehicleType, QSortThenBy> {
  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByBaseFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByBaseFareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseFare', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByPricePerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerKm', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByPricePerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerKm', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByPricePerMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerMinute', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByPricePerMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerMinute', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByVehicleTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.asc);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QAfterSortBy>
      thenByVehicleTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleTypeId', Sort.desc);
    });
  }
}

extension KanRideVehicleTypeQueryWhereDistinct
    on QueryBuilder<KanRideVehicleType, KanRideVehicleType, QDistinct> {
  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QDistinct>
      distinctByBaseFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseFare');
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QDistinct>
      distinctByPricePerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pricePerKm');
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QDistinct>
      distinctByPricePerMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pricePerMinute');
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRideVehicleType, KanRideVehicleType, QDistinct>
      distinctByVehicleTypeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleTypeId',
          caseSensitive: caseSensitive);
    });
  }
}

extension KanRideVehicleTypeQueryProperty
    on QueryBuilder<KanRideVehicleType, KanRideVehicleType, QQueryProperty> {
  QueryBuilder<KanRideVehicleType, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<KanRideVehicleType, double, QQueryOperations>
      baseFareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseFare');
    });
  }

  QueryBuilder<KanRideVehicleType, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<KanRideVehicleType, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<KanRideVehicleType, double, QQueryOperations>
      pricePerKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pricePerKm');
    });
  }

  QueryBuilder<KanRideVehicleType, double, QQueryOperations>
      pricePerMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pricePerMinute');
    });
  }

  QueryBuilder<KanRideVehicleType, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<KanRideVehicleType, String, QQueryOperations>
      vehicleTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleTypeId');
    });
  }
}
