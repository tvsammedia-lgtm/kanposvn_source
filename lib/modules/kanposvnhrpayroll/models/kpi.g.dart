// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kpi.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKpiRecordCollection on Isar {
  IsarCollection<KpiRecord> get kpiRecords => this.collection();
}

const KpiRecordSchema = CollectionSchema(
  name: r'KpiRecord',
  id: -2782753526116942569,
  properties: {
    r'accidents': PropertySchema(
      id: 0,
      name: r'accidents',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerRating': PropertySchema(
      id: 2,
      name: r'customerRating',
      type: IsarType.double,
    ),
    r'driverId': PropertySchema(
      id: 3,
      name: r'driverId',
      type: IsarType.long,
    ),
    r'driverName': PropertySchema(
      id: 4,
      name: r'driverName',
      type: IsarType.string,
    ),
    r'fuelConsumption': PropertySchema(
      id: 5,
      name: r'fuelConsumption',
      type: IsarType.double,
    ),
    r'fuelTarget': PropertySchema(
      id: 6,
      name: r'fuelTarget',
      type: IsarType.double,
    ),
    r'kpiBonus': PropertySchema(
      id: 7,
      name: r'kpiBonus',
      type: IsarType.double,
    ),
    r'kpiScore': PropertySchema(
      id: 8,
      name: r'kpiScore',
      type: IsarType.double,
    ),
    r'month': PropertySchema(
      id: 9,
      name: r'month',
      type: IsarType.long,
    ),
    r'needsSync': PropertySchema(
      id: 10,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 11,
      name: r'notes',
      type: IsarType.string,
    ),
    r'onTimeScore': PropertySchema(
      id: 12,
      name: r'onTimeScore',
      type: IsarType.double,
    ),
    r'remoteId': PropertySchema(
      id: 13,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'totalKm': PropertySchema(
      id: 14,
      name: r'totalKm',
      type: IsarType.double,
    ),
    r'totalTrips': PropertySchema(
      id: 15,
      name: r'totalTrips',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 16,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'violations': PropertySchema(
      id: 17,
      name: r'violations',
      type: IsarType.long,
    ),
    r'year': PropertySchema(
      id: 18,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _kpiRecordEstimateSize,
  serialize: _kpiRecordSerialize,
  deserialize: _kpiRecordDeserialize,
  deserializeProp: _kpiRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _kpiRecordGetId,
  getLinks: _kpiRecordGetLinks,
  attach: _kpiRecordAttach,
  version: '3.1.0+1',
);

int _kpiRecordEstimateSize(
  KpiRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.driverName.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _kpiRecordSerialize(
  KpiRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accidents);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDouble(offsets[2], object.customerRating);
  writer.writeLong(offsets[3], object.driverId);
  writer.writeString(offsets[4], object.driverName);
  writer.writeDouble(offsets[5], object.fuelConsumption);
  writer.writeDouble(offsets[6], object.fuelTarget);
  writer.writeDouble(offsets[7], object.kpiBonus);
  writer.writeDouble(offsets[8], object.kpiScore);
  writer.writeLong(offsets[9], object.month);
  writer.writeBool(offsets[10], object.needsSync);
  writer.writeString(offsets[11], object.notes);
  writer.writeDouble(offsets[12], object.onTimeScore);
  writer.writeString(offsets[13], object.remoteId);
  writer.writeDouble(offsets[14], object.totalKm);
  writer.writeLong(offsets[15], object.totalTrips);
  writer.writeDateTime(offsets[16], object.updatedAt);
  writer.writeLong(offsets[17], object.violations);
  writer.writeLong(offsets[18], object.year);
}

KpiRecord _kpiRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KpiRecord();
  object.accidents = reader.readLong(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.customerRating = reader.readDouble(offsets[2]);
  object.driverId = reader.readLong(offsets[3]);
  object.driverName = reader.readString(offsets[4]);
  object.fuelConsumption = reader.readDouble(offsets[5]);
  object.fuelTarget = reader.readDouble(offsets[6]);
  object.id = id;
  object.kpiBonus = reader.readDouble(offsets[7]);
  object.kpiScore = reader.readDouble(offsets[8]);
  object.month = reader.readLong(offsets[9]);
  object.needsSync = reader.readBool(offsets[10]);
  object.notes = reader.readStringOrNull(offsets[11]);
  object.onTimeScore = reader.readDouble(offsets[12]);
  object.remoteId = reader.readStringOrNull(offsets[13]);
  object.totalKm = reader.readDouble(offsets[14]);
  object.totalTrips = reader.readLong(offsets[15]);
  object.updatedAt = reader.readDateTime(offsets[16]);
  object.violations = reader.readLong(offsets[17]);
  object.year = reader.readLong(offsets[18]);
  return object;
}

P _kpiRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kpiRecordGetId(KpiRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _kpiRecordGetLinks(KpiRecord object) {
  return [];
}

void _kpiRecordAttach(IsarCollection<dynamic> col, Id id, KpiRecord object) {
  object.id = id;
}

extension KpiRecordQueryWhereSort
    on QueryBuilder<KpiRecord, KpiRecord, QWhere> {
  QueryBuilder<KpiRecord, KpiRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KpiRecordQueryWhere
    on QueryBuilder<KpiRecord, KpiRecord, QWhereClause> {
  QueryBuilder<KpiRecord, KpiRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterWhereClause> idBetween(
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
}

extension KpiRecordQueryFilter
    on QueryBuilder<KpiRecord, KpiRecord, QFilterCondition> {
  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> accidentsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accidents',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      accidentsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accidents',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> accidentsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accidents',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> accidentsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accidents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      customerRatingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      customerRatingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      customerRatingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      customerRatingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> driverIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverId',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> driverIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverId',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> driverIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverId',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> driverIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> driverNameEqualTo(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> driverNameLessThan(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> driverNameBetween(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> driverNameEndsWith(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> driverNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> driverNameMatches(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      driverNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverName',
        value: '',
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      driverNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverName',
        value: '',
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      fuelConsumptionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fuelConsumption',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      fuelConsumptionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fuelConsumption',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      fuelConsumptionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fuelConsumption',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      fuelConsumptionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fuelConsumption',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> fuelTargetEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fuelTarget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      fuelTargetGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fuelTarget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> fuelTargetLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fuelTarget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> fuelTargetBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fuelTarget',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> kpiBonusEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kpiBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> kpiBonusGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kpiBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> kpiBonusLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kpiBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> kpiBonusBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kpiBonus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> kpiScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kpiScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> kpiScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kpiScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> kpiScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kpiScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> kpiScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kpiScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> monthEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> monthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> monthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> monthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> needsSyncEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesEqualTo(
    String? value, {
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesGreaterThan(
    String? value, {
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesLessThan(
    String? value, {
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesContains(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> onTimeScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onTimeScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      onTimeScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'onTimeScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> onTimeScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'onTimeScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> onTimeScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'onTimeScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> remoteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> remoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> remoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> remoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> remoteIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> remoteIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> totalKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> totalKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> totalKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> totalKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> totalTripsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTrips',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      totalTripsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalTrips',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> totalTripsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalTrips',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> totalTripsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalTrips',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> violationsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'violations',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition>
      violationsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'violations',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> violationsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'violations',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> violationsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'violations',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> yearEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> yearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> yearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterFilterCondition> yearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension KpiRecordQueryObject
    on QueryBuilder<KpiRecord, KpiRecord, QFilterCondition> {}

extension KpiRecordQueryLinks
    on QueryBuilder<KpiRecord, KpiRecord, QFilterCondition> {}

extension KpiRecordQuerySortBy on QueryBuilder<KpiRecord, KpiRecord, QSortBy> {
  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByAccidents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidents', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByAccidentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidents', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByCustomerRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerRating', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByCustomerRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerRating', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByFuelConsumption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelConsumption', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByFuelConsumptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelConsumption', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByFuelTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelTarget', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByFuelTargetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelTarget', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByKpiBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByKpiBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByKpiScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiScore', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByKpiScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiScore', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByOnTimeScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onTimeScore', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByOnTimeScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onTimeScore', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByTotalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByTotalKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByTotalTrips() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTrips', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByTotalTripsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTrips', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByViolations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violations', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByViolationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violations', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension KpiRecordQuerySortThenBy
    on QueryBuilder<KpiRecord, KpiRecord, QSortThenBy> {
  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByAccidents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidents', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByAccidentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidents', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByCustomerRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerRating', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByCustomerRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerRating', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByFuelConsumption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelConsumption', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByFuelConsumptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelConsumption', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByFuelTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelTarget', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByFuelTargetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelTarget', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByKpiBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByKpiBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByKpiScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiScore', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByKpiScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiScore', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByOnTimeScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onTimeScore', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByOnTimeScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onTimeScore', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByTotalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByTotalKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByTotalTrips() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTrips', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByTotalTripsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTrips', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByViolations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violations', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByViolationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violations', Sort.desc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension KpiRecordQueryWhereDistinct
    on QueryBuilder<KpiRecord, KpiRecord, QDistinct> {
  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByAccidents() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accidents');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByCustomerRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerRating');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverId');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByDriverName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByFuelConsumption() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fuelConsumption');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByFuelTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fuelTarget');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByKpiBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kpiBonus');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByKpiScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kpiScore');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByOnTimeScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onTimeScore');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByTotalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalKm');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByTotalTrips() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTrips');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByViolations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'violations');
    });
  }

  QueryBuilder<KpiRecord, KpiRecord, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension KpiRecordQueryProperty
    on QueryBuilder<KpiRecord, KpiRecord, QQueryProperty> {
  QueryBuilder<KpiRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<KpiRecord, int, QQueryOperations> accidentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accidents');
    });
  }

  QueryBuilder<KpiRecord, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<KpiRecord, double, QQueryOperations> customerRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerRating');
    });
  }

  QueryBuilder<KpiRecord, int, QQueryOperations> driverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverId');
    });
  }

  QueryBuilder<KpiRecord, String, QQueryOperations> driverNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverName');
    });
  }

  QueryBuilder<KpiRecord, double, QQueryOperations> fuelConsumptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fuelConsumption');
    });
  }

  QueryBuilder<KpiRecord, double, QQueryOperations> fuelTargetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fuelTarget');
    });
  }

  QueryBuilder<KpiRecord, double, QQueryOperations> kpiBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kpiBonus');
    });
  }

  QueryBuilder<KpiRecord, double, QQueryOperations> kpiScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kpiScore');
    });
  }

  QueryBuilder<KpiRecord, int, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<KpiRecord, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<KpiRecord, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<KpiRecord, double, QQueryOperations> onTimeScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onTimeScore');
    });
  }

  QueryBuilder<KpiRecord, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<KpiRecord, double, QQueryOperations> totalKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalKm');
    });
  }

  QueryBuilder<KpiRecord, int, QQueryOperations> totalTripsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTrips');
    });
  }

  QueryBuilder<KpiRecord, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<KpiRecord, int, QQueryOperations> violationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'violations');
    });
  }

  QueryBuilder<KpiRecord, int, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDisciplineRecordCollection on Isar {
  IsarCollection<DisciplineRecord> get disciplineRecords => this.collection();
}

const DisciplineRecordSchema = CollectionSchema(
  name: r'DisciplineRecord',
  id: -1723598901444021362,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'employeeId': PropertySchema(
      id: 2,
      name: r'employeeId',
      type: IsarType.long,
    ),
    r'employeeName': PropertySchema(
      id: 3,
      name: r'employeeName',
      type: IsarType.string,
    ),
    r'handledBy': PropertySchema(
      id: 4,
      name: r'handledBy',
      type: IsarType.string,
    ),
    r'needsSync': PropertySchema(
      id: 5,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 6,
      name: r'notes',
      type: IsarType.string,
    ),
    r'penaltyAmount': PropertySchema(
      id: 7,
      name: r'penaltyAmount',
      type: IsarType.double,
    ),
    r'remoteId': PropertySchema(
      id: 8,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'violationDate': PropertySchema(
      id: 9,
      name: r'violationDate',
      type: IsarType.dateTime,
    ),
    r'violationType': PropertySchema(
      id: 10,
      name: r'violationType',
      type: IsarType.string,
    )
  },
  estimateSize: _disciplineRecordEstimateSize,
  serialize: _disciplineRecordSerialize,
  deserialize: _disciplineRecordDeserialize,
  deserializeProp: _disciplineRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _disciplineRecordGetId,
  getLinks: _disciplineRecordGetLinks,
  attach: _disciplineRecordAttach,
  version: '3.1.0+1',
);

int _disciplineRecordEstimateSize(
  DisciplineRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.employeeName.length * 3;
  {
    final value = object.handledBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.violationType.length * 3;
  return bytesCount;
}

void _disciplineRecordSerialize(
  DisciplineRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.description);
  writer.writeLong(offsets[2], object.employeeId);
  writer.writeString(offsets[3], object.employeeName);
  writer.writeString(offsets[4], object.handledBy);
  writer.writeBool(offsets[5], object.needsSync);
  writer.writeString(offsets[6], object.notes);
  writer.writeDouble(offsets[7], object.penaltyAmount);
  writer.writeString(offsets[8], object.remoteId);
  writer.writeDateTime(offsets[9], object.violationDate);
  writer.writeString(offsets[10], object.violationType);
}

DisciplineRecord _disciplineRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DisciplineRecord();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.description = reader.readString(offsets[1]);
  object.employeeId = reader.readLong(offsets[2]);
  object.employeeName = reader.readString(offsets[3]);
  object.handledBy = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.needsSync = reader.readBool(offsets[5]);
  object.notes = reader.readStringOrNull(offsets[6]);
  object.penaltyAmount = reader.readDouble(offsets[7]);
  object.remoteId = reader.readStringOrNull(offsets[8]);
  object.violationDate = reader.readDateTime(offsets[9]);
  object.violationType = reader.readString(offsets[10]);
  return object;
}

P _disciplineRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _disciplineRecordGetId(DisciplineRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _disciplineRecordGetLinks(DisciplineRecord object) {
  return [];
}

void _disciplineRecordAttach(
    IsarCollection<dynamic> col, Id id, DisciplineRecord object) {
  object.id = id;
}

extension DisciplineRecordQueryWhereSort
    on QueryBuilder<DisciplineRecord, DisciplineRecord, QWhere> {
  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DisciplineRecordQueryWhere
    on QueryBuilder<DisciplineRecord, DisciplineRecord, QWhereClause> {
  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterWhereClause> idBetween(
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
}

extension DisciplineRecordQueryFilter
    on QueryBuilder<DisciplineRecord, DisciplineRecord, QFilterCondition> {
  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'employeeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      employeeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'handledBy',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'handledBy',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'handledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'handledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'handledBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'handledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'handledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'handledBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'handledBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handledBy',
        value: '',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      handledByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'handledBy',
        value: '',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      needsSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesLessThan(
    String? value, {
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesStartsWith(
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesEndsWith(
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

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      penaltyAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'penaltyAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      penaltyAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'penaltyAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      penaltyAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'penaltyAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      penaltyAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'penaltyAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'violationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'violationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'violationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'violationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'violationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'violationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'violationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'violationType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'violationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'violationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'violationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'violationType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'violationType',
        value: '',
      ));
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterFilterCondition>
      violationTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'violationType',
        value: '',
      ));
    });
  }
}

extension DisciplineRecordQueryObject
    on QueryBuilder<DisciplineRecord, DisciplineRecord, QFilterCondition> {}

extension DisciplineRecordQueryLinks
    on QueryBuilder<DisciplineRecord, DisciplineRecord, QFilterCondition> {}

extension DisciplineRecordQuerySortBy
    on QueryBuilder<DisciplineRecord, DisciplineRecord, QSortBy> {
  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByHandledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handledBy', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByHandledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handledBy', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByPenaltyAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penaltyAmount', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByPenaltyAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penaltyAmount', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByViolationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationDate', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByViolationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationDate', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByViolationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationType', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      sortByViolationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationType', Sort.desc);
    });
  }
}

extension DisciplineRecordQuerySortThenBy
    on QueryBuilder<DisciplineRecord, DisciplineRecord, QSortThenBy> {
  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByHandledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handledBy', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByHandledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handledBy', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByPenaltyAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penaltyAmount', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByPenaltyAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penaltyAmount', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByViolationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationDate', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByViolationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationDate', Sort.desc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByViolationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationType', Sort.asc);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QAfterSortBy>
      thenByViolationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationType', Sort.desc);
    });
  }
}

extension DisciplineRecordQueryWhereDistinct
    on QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct> {
  QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct>
      distinctByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeId');
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct>
      distinctByEmployeeName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct>
      distinctByHandledBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'handledBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct>
      distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct>
      distinctByPenaltyAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'penaltyAmount');
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct>
      distinctByViolationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'violationDate');
    });
  }

  QueryBuilder<DisciplineRecord, DisciplineRecord, QDistinct>
      distinctByViolationType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'violationType',
          caseSensitive: caseSensitive);
    });
  }
}

extension DisciplineRecordQueryProperty
    on QueryBuilder<DisciplineRecord, DisciplineRecord, QQueryProperty> {
  QueryBuilder<DisciplineRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DisciplineRecord, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DisciplineRecord, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<DisciplineRecord, int, QQueryOperations> employeeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeId');
    });
  }

  QueryBuilder<DisciplineRecord, String, QQueryOperations>
      employeeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeName');
    });
  }

  QueryBuilder<DisciplineRecord, String?, QQueryOperations>
      handledByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'handledBy');
    });
  }

  QueryBuilder<DisciplineRecord, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<DisciplineRecord, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<DisciplineRecord, double, QQueryOperations>
      penaltyAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'penaltyAmount');
    });
  }

  QueryBuilder<DisciplineRecord, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<DisciplineRecord, DateTime, QQueryOperations>
      violationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'violationDate');
    });
  }

  QueryBuilder<DisciplineRecord, String, QQueryOperations>
      violationTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'violationType');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBonusRecordCollection on Isar {
  IsarCollection<BonusRecord> get bonusRecords => this.collection();
}

const BonusRecordSchema = CollectionSchema(
  name: r'BonusRecord',
  id: -6249713174223752680,
  properties: {
    r'approvedBy': PropertySchema(
      id: 0,
      name: r'approvedBy',
      type: IsarType.string,
    ),
    r'bonusAmount': PropertySchema(
      id: 1,
      name: r'bonusAmount',
      type: IsarType.double,
    ),
    r'bonusDate': PropertySchema(
      id: 2,
      name: r'bonusDate',
      type: IsarType.dateTime,
    ),
    r'bonusType': PropertySchema(
      id: 3,
      name: r'bonusType',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 5,
      name: r'description',
      type: IsarType.string,
    ),
    r'employeeId': PropertySchema(
      id: 6,
      name: r'employeeId',
      type: IsarType.long,
    ),
    r'employeeName': PropertySchema(
      id: 7,
      name: r'employeeName',
      type: IsarType.string,
    ),
    r'month': PropertySchema(
      id: 8,
      name: r'month',
      type: IsarType.long,
    ),
    r'needsSync': PropertySchema(
      id: 9,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 10,
      name: r'notes',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 11,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'year': PropertySchema(
      id: 12,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _bonusRecordEstimateSize,
  serialize: _bonusRecordSerialize,
  deserialize: _bonusRecordDeserialize,
  deserializeProp: _bonusRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bonusRecordGetId,
  getLinks: _bonusRecordGetLinks,
  attach: _bonusRecordAttach,
  version: '3.1.0+1',
);

int _bonusRecordEstimateSize(
  BonusRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.approvedBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.bonusType.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.employeeName.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _bonusRecordSerialize(
  BonusRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.approvedBy);
  writer.writeDouble(offsets[1], object.bonusAmount);
  writer.writeDateTime(offsets[2], object.bonusDate);
  writer.writeString(offsets[3], object.bonusType);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.description);
  writer.writeLong(offsets[6], object.employeeId);
  writer.writeString(offsets[7], object.employeeName);
  writer.writeLong(offsets[8], object.month);
  writer.writeBool(offsets[9], object.needsSync);
  writer.writeString(offsets[10], object.notes);
  writer.writeString(offsets[11], object.remoteId);
  writer.writeLong(offsets[12], object.year);
}

BonusRecord _bonusRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BonusRecord();
  object.approvedBy = reader.readStringOrNull(offsets[0]);
  object.bonusAmount = reader.readDouble(offsets[1]);
  object.bonusDate = reader.readDateTime(offsets[2]);
  object.bonusType = reader.readString(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.description = reader.readString(offsets[5]);
  object.employeeId = reader.readLong(offsets[6]);
  object.employeeName = reader.readString(offsets[7]);
  object.id = id;
  object.month = reader.readLong(offsets[8]);
  object.needsSync = reader.readBool(offsets[9]);
  object.notes = reader.readStringOrNull(offsets[10]);
  object.remoteId = reader.readStringOrNull(offsets[11]);
  object.year = reader.readLong(offsets[12]);
  return object;
}

P _bonusRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bonusRecordGetId(BonusRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bonusRecordGetLinks(BonusRecord object) {
  return [];
}

void _bonusRecordAttach(
    IsarCollection<dynamic> col, Id id, BonusRecord object) {
  object.id = id;
}

extension BonusRecordQueryWhereSort
    on QueryBuilder<BonusRecord, BonusRecord, QWhere> {
  QueryBuilder<BonusRecord, BonusRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BonusRecordQueryWhere
    on QueryBuilder<BonusRecord, BonusRecord, QWhereClause> {
  QueryBuilder<BonusRecord, BonusRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterWhereClause> idBetween(
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
}

extension BonusRecordQueryFilter
    on QueryBuilder<BonusRecord, BonusRecord, QFilterCondition> {
  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approvedBy',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approvedBy',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'approvedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'approvedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'approvedBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      approvedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'approvedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonusAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonusAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonusAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonusAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonusDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonusDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonusDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonusDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonusType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bonusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bonusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bonusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bonusType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonusType',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      bonusTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bonusType',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'employeeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      employeeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> monthEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      monthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> monthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> monthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      needsSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> notesEqualTo(
    String? value, {
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> notesLessThan(
    String? value, {
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> notesContains(
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> remoteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      remoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      remoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> remoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> remoteIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> yearEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> yearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> yearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterFilterCondition> yearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BonusRecordQueryObject
    on QueryBuilder<BonusRecord, BonusRecord, QFilterCondition> {}

extension BonusRecordQueryLinks
    on QueryBuilder<BonusRecord, BonusRecord, QFilterCondition> {}

extension BonusRecordQuerySortBy
    on QueryBuilder<BonusRecord, BonusRecord, QSortBy> {
  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByApprovedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByApprovedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByBonusAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusAmount', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByBonusAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusAmount', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByBonusDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusDate', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByBonusDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusDate', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByBonusType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusType', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByBonusTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusType', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy>
      sortByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension BonusRecordQuerySortThenBy
    on QueryBuilder<BonusRecord, BonusRecord, QSortThenBy> {
  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByApprovedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByApprovedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByBonusAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusAmount', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByBonusAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusAmount', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByBonusDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusDate', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByBonusDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusDate', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByBonusType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusType', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByBonusTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusType', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy>
      thenByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension BonusRecordQueryWhereDistinct
    on QueryBuilder<BonusRecord, BonusRecord, QDistinct> {
  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByApprovedBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approvedBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByBonusAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonusAmount');
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByBonusDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonusDate');
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByBonusType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonusType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeId');
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByEmployeeName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonusRecord, BonusRecord, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension BonusRecordQueryProperty
    on QueryBuilder<BonusRecord, BonusRecord, QQueryProperty> {
  QueryBuilder<BonusRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BonusRecord, String?, QQueryOperations> approvedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approvedBy');
    });
  }

  QueryBuilder<BonusRecord, double, QQueryOperations> bonusAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonusAmount');
    });
  }

  QueryBuilder<BonusRecord, DateTime, QQueryOperations> bonusDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonusDate');
    });
  }

  QueryBuilder<BonusRecord, String, QQueryOperations> bonusTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonusType');
    });
  }

  QueryBuilder<BonusRecord, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BonusRecord, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<BonusRecord, int, QQueryOperations> employeeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeId');
    });
  }

  QueryBuilder<BonusRecord, String, QQueryOperations> employeeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeName');
    });
  }

  QueryBuilder<BonusRecord, int, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<BonusRecord, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<BonusRecord, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<BonusRecord, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<BonusRecord, int, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
