// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_tariff.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingTariffCollection on Isar {
  IsarCollection<ParkingTariff> get parkingTariffs => this.collection();
}

const ParkingTariffSchema = CollectionSchema(
  name: r'ParkingTariff',
  id: -2309280166685235296,
  properties: {
    r'dailyMaxPrice': PropertySchema(
      id: 0,
      name: r'dailyMaxPrice',
      type: IsarType.double,
    ),
    r'firstHourPrice': PropertySchema(
      id: 1,
      name: r'firstHourPrice',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 2,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'nextHourPrice': PropertySchema(
      id: 3,
      name: r'nextHourPrice',
      type: IsarType.double,
    ),
    r'note': PropertySchema(
      id: 4,
      name: r'note',
      type: IsarType.string,
    ),
    r'tariffId': PropertySchema(
      id: 5,
      name: r'tariffId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehicleType': PropertySchema(
      id: 7,
      name: r'vehicleType',
      type: IsarType.string,
    )
  },
  estimateSize: _parkingTariffEstimateSize,
  serialize: _parkingTariffSerialize,
  deserialize: _parkingTariffDeserialize,
  deserializeProp: _parkingTariffDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'tariffId': IndexSchema(
      id: -7602254813858937951,
      name: r'tariffId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'tariffId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'vehicleType': IndexSchema(
      id: -3096741324283704007,
      name: r'vehicleType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'vehicleType',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _parkingTariffGetId,
  getLinks: _parkingTariffGetLinks,
  attach: _parkingTariffAttach,
  version: '3.1.0+1',
);

int _parkingTariffEstimateSize(
  ParkingTariff object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.note.length * 3;
  bytesCount += 3 + object.tariffId.length * 3;
  bytesCount += 3 + object.vehicleType.length * 3;
  return bytesCount;
}

void _parkingTariffSerialize(
  ParkingTariff object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.dailyMaxPrice);
  writer.writeDouble(offsets[1], object.firstHourPrice);
  writer.writeBool(offsets[2], object.isSynced);
  writer.writeDouble(offsets[3], object.nextHourPrice);
  writer.writeString(offsets[4], object.note);
  writer.writeString(offsets[5], object.tariffId);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeString(offsets[7], object.vehicleType);
}

ParkingTariff _parkingTariffDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingTariff();
  object.dailyMaxPrice = reader.readDouble(offsets[0]);
  object.firstHourPrice = reader.readDouble(offsets[1]);
  object.isSynced = reader.readBool(offsets[2]);
  object.isarId = id;
  object.nextHourPrice = reader.readDouble(offsets[3]);
  object.note = reader.readString(offsets[4]);
  object.tariffId = reader.readString(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  object.vehicleType = reader.readString(offsets[7]);
  return object;
}

P _parkingTariffDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parkingTariffGetId(ParkingTariff object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _parkingTariffGetLinks(ParkingTariff object) {
  return [];
}

void _parkingTariffAttach(
    IsarCollection<dynamic> col, Id id, ParkingTariff object) {
  object.isarId = id;
}

extension ParkingTariffByIndex on IsarCollection<ParkingTariff> {
  Future<ParkingTariff?> getByTariffId(String tariffId) {
    return getByIndex(r'tariffId', [tariffId]);
  }

  ParkingTariff? getByTariffIdSync(String tariffId) {
    return getByIndexSync(r'tariffId', [tariffId]);
  }

  Future<bool> deleteByTariffId(String tariffId) {
    return deleteByIndex(r'tariffId', [tariffId]);
  }

  bool deleteByTariffIdSync(String tariffId) {
    return deleteByIndexSync(r'tariffId', [tariffId]);
  }

  Future<List<ParkingTariff?>> getAllByTariffId(List<String> tariffIdValues) {
    final values = tariffIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'tariffId', values);
  }

  List<ParkingTariff?> getAllByTariffIdSync(List<String> tariffIdValues) {
    final values = tariffIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'tariffId', values);
  }

  Future<int> deleteAllByTariffId(List<String> tariffIdValues) {
    final values = tariffIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'tariffId', values);
  }

  int deleteAllByTariffIdSync(List<String> tariffIdValues) {
    final values = tariffIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'tariffId', values);
  }

  Future<Id> putByTariffId(ParkingTariff object) {
    return putByIndex(r'tariffId', object);
  }

  Id putByTariffIdSync(ParkingTariff object, {bool saveLinks = true}) {
    return putByIndexSync(r'tariffId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTariffId(List<ParkingTariff> objects) {
    return putAllByIndex(r'tariffId', objects);
  }

  List<Id> putAllByTariffIdSync(List<ParkingTariff> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'tariffId', objects, saveLinks: saveLinks);
  }
}

extension ParkingTariffQueryWhereSort
    on QueryBuilder<ParkingTariff, ParkingTariff, QWhere> {
  QueryBuilder<ParkingTariff, ParkingTariff, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParkingTariffQueryWhere
    on QueryBuilder<ParkingTariff, ParkingTariff, QWhereClause> {
  QueryBuilder<ParkingTariff, ParkingTariff, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterWhereClause>
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterWhereClause> tariffIdEqualTo(
      String tariffId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tariffId',
        value: [tariffId],
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterWhereClause>
      tariffIdNotEqualTo(String tariffId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tariffId',
              lower: [],
              upper: [tariffId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tariffId',
              lower: [tariffId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tariffId',
              lower: [tariffId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tariffId',
              lower: [],
              upper: [tariffId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterWhereClause>
      vehicleTypeEqualTo(String vehicleType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'vehicleType',
        value: [vehicleType],
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterWhereClause>
      vehicleTypeNotEqualTo(String vehicleType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleType',
              lower: [],
              upper: [vehicleType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleType',
              lower: [vehicleType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleType',
              lower: [vehicleType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleType',
              lower: [],
              upper: [vehicleType],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ParkingTariffQueryFilter
    on QueryBuilder<ParkingTariff, ParkingTariff, QFilterCondition> {
  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      dailyMaxPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyMaxPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      dailyMaxPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyMaxPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      dailyMaxPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyMaxPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      dailyMaxPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyMaxPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      firstHourPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstHourPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      firstHourPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstHourPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      firstHourPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstHourPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      firstHourPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstHourPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      nextHourPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextHourPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      nextHourPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextHourPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      nextHourPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextHourPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      nextHourPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextHourPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition> noteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      noteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      noteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition> noteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition> noteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      tariffIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tariffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      tariffIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tariffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      tariffIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tariffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      tariffIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tariffId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      tariffIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tariffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      tariffIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tariffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      tariffIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tariffId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      tariffIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tariffId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      tariffIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tariffId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      tariffIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tariffId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      vehicleTypeEqualTo(
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      vehicleTypeGreaterThan(
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      vehicleTypeLessThan(
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      vehicleTypeBetween(
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      vehicleTypeStartsWith(
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      vehicleTypeEndsWith(
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

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      vehicleTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      vehicleTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      vehicleTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleType',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterFilterCondition>
      vehicleTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleType',
        value: '',
      ));
    });
  }
}

extension ParkingTariffQueryObject
    on QueryBuilder<ParkingTariff, ParkingTariff, QFilterCondition> {}

extension ParkingTariffQueryLinks
    on QueryBuilder<ParkingTariff, ParkingTariff, QFilterCondition> {}

extension ParkingTariffQuerySortBy
    on QueryBuilder<ParkingTariff, ParkingTariff, QSortBy> {
  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      sortByDailyMaxPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyMaxPrice', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      sortByDailyMaxPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyMaxPrice', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      sortByFirstHourPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstHourPrice', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      sortByFirstHourPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstHourPrice', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      sortByNextHourPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHourPrice', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      sortByNextHourPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHourPrice', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> sortByTariffId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tariffId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      sortByTariffIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tariffId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> sortByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      sortByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension ParkingTariffQuerySortThenBy
    on QueryBuilder<ParkingTariff, ParkingTariff, QSortThenBy> {
  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      thenByDailyMaxPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyMaxPrice', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      thenByDailyMaxPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyMaxPrice', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      thenByFirstHourPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstHourPrice', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      thenByFirstHourPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstHourPrice', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      thenByNextHourPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHourPrice', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      thenByNextHourPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHourPrice', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> thenByTariffId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tariffId', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      thenByTariffIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tariffId', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy> thenByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QAfterSortBy>
      thenByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension ParkingTariffQueryWhereDistinct
    on QueryBuilder<ParkingTariff, ParkingTariff, QDistinct> {
  QueryBuilder<ParkingTariff, ParkingTariff, QDistinct>
      distinctByDailyMaxPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyMaxPrice');
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QDistinct>
      distinctByFirstHourPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstHourPrice');
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QDistinct>
      distinctByNextHourPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextHourPrice');
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QDistinct> distinctByTariffId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tariffId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ParkingTariff, ParkingTariff, QDistinct> distinctByVehicleType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleType', caseSensitive: caseSensitive);
    });
  }
}

extension ParkingTariffQueryProperty
    on QueryBuilder<ParkingTariff, ParkingTariff, QQueryProperty> {
  QueryBuilder<ParkingTariff, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ParkingTariff, double, QQueryOperations>
      dailyMaxPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyMaxPrice');
    });
  }

  QueryBuilder<ParkingTariff, double, QQueryOperations>
      firstHourPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstHourPrice');
    });
  }

  QueryBuilder<ParkingTariff, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ParkingTariff, double, QQueryOperations>
      nextHourPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextHourPrice');
    });
  }

  QueryBuilder<ParkingTariff, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<ParkingTariff, String, QQueryOperations> tariffIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tariffId');
    });
  }

  QueryBuilder<ParkingTariff, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ParkingTariff, String, QQueryOperations> vehicleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleType');
    });
  }
}
