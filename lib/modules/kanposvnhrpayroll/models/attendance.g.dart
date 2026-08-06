// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAttendanceCollection on Isar {
  IsarCollection<Attendance> get attendances => this.collection();
}

const AttendanceSchema = CollectionSchema(
  name: r'Attendance',
  id: 4618409064190326501,
  properties: {
    r'afternoonShifts': PropertySchema(
      id: 0,
      name: r'afternoonShifts',
      type: IsarType.double,
    ),
    r'annualLeaveDays': PropertySchema(
      id: 1,
      name: r'annualLeaveDays',
      type: IsarType.double,
    ),
    r'attendanceType': PropertySchema(
      id: 2,
      name: r'attendanceType',
      type: IsarType.string,
      enumMap: _AttendanceattendanceTypeEnumValueMap,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'driverLeaveDays': PropertySchema(
      id: 4,
      name: r'driverLeaveDays',
      type: IsarType.double,
    ),
    r'earlyLeaveDays': PropertySchema(
      id: 5,
      name: r'earlyLeaveDays',
      type: IsarType.double,
    ),
    r'employeeCode': PropertySchema(
      id: 6,
      name: r'employeeCode',
      type: IsarType.string,
    ),
    r'employeeId': PropertySchema(
      id: 7,
      name: r'employeeId',
      type: IsarType.long,
    ),
    r'employeeName': PropertySchema(
      id: 8,
      name: r'employeeName',
      type: IsarType.string,
    ),
    r'holidayDays': PropertySchema(
      id: 9,
      name: r'holidayDays',
      type: IsarType.double,
    ),
    r'lastSyncAt': PropertySchema(
      id: 10,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'lateDays': PropertySchema(
      id: 11,
      name: r'lateDays',
      type: IsarType.double,
    ),
    r'leaveDays': PropertySchema(
      id: 12,
      name: r'leaveDays',
      type: IsarType.double,
    ),
    r'maternityLeaveDays': PropertySchema(
      id: 13,
      name: r'maternityLeaveDays',
      type: IsarType.double,
    ),
    r'month': PropertySchema(
      id: 14,
      name: r'month',
      type: IsarType.long,
    ),
    r'morningShifts': PropertySchema(
      id: 15,
      name: r'morningShifts',
      type: IsarType.double,
    ),
    r'needsSync': PropertySchema(
      id: 16,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 17,
      name: r'notes',
      type: IsarType.string,
    ),
    r'overtimeHours': PropertySchema(
      id: 18,
      name: r'overtimeHours',
      type: IsarType.double,
    ),
    r'remoteId': PropertySchema(
      id: 19,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'restHours': PropertySchema(
      id: 20,
      name: r'restHours',
      type: IsarType.double,
    ),
    r'sickLeaveDays': PropertySchema(
      id: 21,
      name: r'sickLeaveDays',
      type: IsarType.double,
    ),
    r'totalContainers': PropertySchema(
      id: 22,
      name: r'totalContainers',
      type: IsarType.long,
    ),
    r'totalDrivingHours': PropertySchema(
      id: 23,
      name: r'totalDrivingHours',
      type: IsarType.double,
    ),
    r'totalKm': PropertySchema(
      id: 24,
      name: r'totalKm',
      type: IsarType.double,
    ),
    r'totalTrips': PropertySchema(
      id: 25,
      name: r'totalTrips',
      type: IsarType.long,
    ),
    r'unpaidLeaveDays': PropertySchema(
      id: 26,
      name: r'unpaidLeaveDays',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 27,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'workingDays': PropertySchema(
      id: 28,
      name: r'workingDays',
      type: IsarType.double,
    ),
    r'year': PropertySchema(
      id: 29,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _attendanceEstimateSize,
  serialize: _attendanceSerialize,
  deserialize: _attendanceDeserialize,
  deserializeProp: _attendanceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _attendanceGetId,
  getLinks: _attendanceGetLinks,
  attach: _attendanceAttach,
  version: '3.1.0+1',
);

int _attendanceEstimateSize(
  Attendance object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.attendanceType.name.length * 3;
  bytesCount += 3 + object.employeeCode.length * 3;
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

void _attendanceSerialize(
  Attendance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.afternoonShifts);
  writer.writeDouble(offsets[1], object.annualLeaveDays);
  writer.writeString(offsets[2], object.attendanceType.name);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDouble(offsets[4], object.driverLeaveDays);
  writer.writeDouble(offsets[5], object.earlyLeaveDays);
  writer.writeString(offsets[6], object.employeeCode);
  writer.writeLong(offsets[7], object.employeeId);
  writer.writeString(offsets[8], object.employeeName);
  writer.writeDouble(offsets[9], object.holidayDays);
  writer.writeDateTime(offsets[10], object.lastSyncAt);
  writer.writeDouble(offsets[11], object.lateDays);
  writer.writeDouble(offsets[12], object.leaveDays);
  writer.writeDouble(offsets[13], object.maternityLeaveDays);
  writer.writeLong(offsets[14], object.month);
  writer.writeDouble(offsets[15], object.morningShifts);
  writer.writeBool(offsets[16], object.needsSync);
  writer.writeString(offsets[17], object.notes);
  writer.writeDouble(offsets[18], object.overtimeHours);
  writer.writeString(offsets[19], object.remoteId);
  writer.writeDouble(offsets[20], object.restHours);
  writer.writeDouble(offsets[21], object.sickLeaveDays);
  writer.writeLong(offsets[22], object.totalContainers);
  writer.writeDouble(offsets[23], object.totalDrivingHours);
  writer.writeDouble(offsets[24], object.totalKm);
  writer.writeLong(offsets[25], object.totalTrips);
  writer.writeDouble(offsets[26], object.unpaidLeaveDays);
  writer.writeDateTime(offsets[27], object.updatedAt);
  writer.writeDouble(offsets[28], object.workingDays);
  writer.writeLong(offsets[29], object.year);
}

Attendance _attendanceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Attendance();
  object.afternoonShifts = reader.readDouble(offsets[0]);
  object.annualLeaveDays = reader.readDouble(offsets[1]);
  object.attendanceType = _AttendanceattendanceTypeValueEnumMap[
          reader.readStringOrNull(offsets[2])] ??
      AttendanceType.office;
  object.createdAt = reader.readDateTime(offsets[3]);
  object.driverLeaveDays = reader.readDouble(offsets[4]);
  object.earlyLeaveDays = reader.readDouble(offsets[5]);
  object.employeeCode = reader.readString(offsets[6]);
  object.employeeId = reader.readLong(offsets[7]);
  object.employeeName = reader.readString(offsets[8]);
  object.holidayDays = reader.readDouble(offsets[9]);
  object.id = id;
  object.lastSyncAt = reader.readDateTimeOrNull(offsets[10]);
  object.lateDays = reader.readDouble(offsets[11]);
  object.leaveDays = reader.readDouble(offsets[12]);
  object.maternityLeaveDays = reader.readDouble(offsets[13]);
  object.month = reader.readLong(offsets[14]);
  object.morningShifts = reader.readDouble(offsets[15]);
  object.needsSync = reader.readBool(offsets[16]);
  object.notes = reader.readStringOrNull(offsets[17]);
  object.overtimeHours = reader.readDouble(offsets[18]);
  object.remoteId = reader.readStringOrNull(offsets[19]);
  object.restHours = reader.readDouble(offsets[20]);
  object.sickLeaveDays = reader.readDouble(offsets[21]);
  object.totalContainers = reader.readLong(offsets[22]);
  object.totalDrivingHours = reader.readDouble(offsets[23]);
  object.totalKm = reader.readDouble(offsets[24]);
  object.totalTrips = reader.readLong(offsets[25]);
  object.unpaidLeaveDays = reader.readDouble(offsets[26]);
  object.updatedAt = reader.readDateTime(offsets[27]);
  object.workingDays = reader.readDouble(offsets[28]);
  object.year = reader.readLong(offsets[29]);
  return object;
}

P _attendanceDeserializeProp<P>(
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
      return (_AttendanceattendanceTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          AttendanceType.office) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readLong(offset)) as P;
    case 23:
      return (reader.readDouble(offset)) as P;
    case 24:
      return (reader.readDouble(offset)) as P;
    case 25:
      return (reader.readLong(offset)) as P;
    case 26:
      return (reader.readDouble(offset)) as P;
    case 27:
      return (reader.readDateTime(offset)) as P;
    case 28:
      return (reader.readDouble(offset)) as P;
    case 29:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AttendanceattendanceTypeEnumValueMap = {
  r'office': r'office',
  r'driver': r'driver',
};
const _AttendanceattendanceTypeValueEnumMap = {
  r'office': AttendanceType.office,
  r'driver': AttendanceType.driver,
};

Id _attendanceGetId(Attendance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _attendanceGetLinks(Attendance object) {
  return [];
}

void _attendanceAttach(IsarCollection<dynamic> col, Id id, Attendance object) {
  object.id = id;
}

extension AttendanceQueryWhereSort
    on QueryBuilder<Attendance, Attendance, QWhere> {
  QueryBuilder<Attendance, Attendance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AttendanceQueryWhere
    on QueryBuilder<Attendance, Attendance, QWhereClause> {
  QueryBuilder<Attendance, Attendance, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Attendance, Attendance, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterWhereClause> idBetween(
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

extension AttendanceQueryFilter
    on QueryBuilder<Attendance, Attendance, QFilterCondition> {
  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      afternoonShiftsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'afternoonShifts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      afternoonShiftsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'afternoonShifts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      afternoonShiftsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'afternoonShifts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      afternoonShiftsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'afternoonShifts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      annualLeaveDaysEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      annualLeaveDaysGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'annualLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      annualLeaveDaysLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'annualLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      annualLeaveDaysBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'annualLeaveDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      attendanceTypeEqualTo(
    AttendanceType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attendanceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      attendanceTypeGreaterThan(
    AttendanceType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attendanceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      attendanceTypeLessThan(
    AttendanceType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attendanceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      attendanceTypeBetween(
    AttendanceType lower,
    AttendanceType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attendanceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      attendanceTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attendanceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      attendanceTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attendanceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      attendanceTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attendanceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      attendanceTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attendanceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      attendanceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attendanceType',
        value: '',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      attendanceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attendanceType',
        value: '',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      driverLeaveDaysEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      driverLeaveDaysGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      driverLeaveDaysLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      driverLeaveDaysBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverLeaveDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      earlyLeaveDaysEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'earlyLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      earlyLeaveDaysGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'earlyLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      earlyLeaveDaysLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'earlyLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      earlyLeaveDaysBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'earlyLeaveDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'employeeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'employeeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'employeeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'employeeCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> employeeIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> employeeIdBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'employeeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      employeeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      holidayDaysEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'holidayDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      holidayDaysGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'holidayDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      holidayDaysLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'holidayDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      holidayDaysBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'holidayDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> lastSyncAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      lastSyncAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      lastSyncAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> lastSyncAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> lateDaysEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lateDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      lateDaysGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lateDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> lateDaysLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lateDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> lateDaysBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lateDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> leaveDaysEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      leaveDaysGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> leaveDaysLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> leaveDaysBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leaveDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      maternityLeaveDaysEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maternityLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      maternityLeaveDaysGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maternityLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      maternityLeaveDaysLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maternityLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      maternityLeaveDaysBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maternityLeaveDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> monthEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> monthGreaterThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> monthLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> monthBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      morningShiftsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'morningShifts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      morningShiftsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'morningShifts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      morningShiftsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'morningShifts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      morningShiftsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'morningShifts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> needsSyncEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> notesContains(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      overtimeHoursEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overtimeHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      overtimeHoursGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overtimeHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      overtimeHoursLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overtimeHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      overtimeHoursBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overtimeHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> remoteIdEqualTo(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> remoteIdLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> remoteIdBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> remoteIdEndsWith(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> remoteIdContains(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> remoteIdMatches(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> restHoursEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      restHoursGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'restHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> restHoursLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'restHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> restHoursBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'restHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      sickLeaveDaysEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sickLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      sickLeaveDaysGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sickLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      sickLeaveDaysLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sickLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      sickLeaveDaysBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sickLeaveDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      totalContainersEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalContainers',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      totalContainersGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalContainers',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      totalContainersLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalContainers',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      totalContainersBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalContainers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      totalDrivingHoursEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDrivingHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      totalDrivingHoursGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDrivingHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      totalDrivingHoursLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDrivingHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      totalDrivingHoursBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDrivingHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> totalKmEqualTo(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      totalKmGreaterThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> totalKmLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> totalKmBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> totalTripsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTrips',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      totalTripsLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> totalTripsBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      unpaidLeaveDaysEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unpaidLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      unpaidLeaveDaysGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unpaidLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      unpaidLeaveDaysLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unpaidLeaveDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      unpaidLeaveDaysBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unpaidLeaveDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      workingDaysEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workingDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      workingDaysGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workingDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      workingDaysLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workingDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition>
      workingDaysBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workingDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> yearEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> yearGreaterThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> yearLessThan(
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

  QueryBuilder<Attendance, Attendance, QAfterFilterCondition> yearBetween(
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

extension AttendanceQueryObject
    on QueryBuilder<Attendance, Attendance, QFilterCondition> {}

extension AttendanceQueryLinks
    on QueryBuilder<Attendance, Attendance, QFilterCondition> {}

extension AttendanceQuerySortBy
    on QueryBuilder<Attendance, Attendance, QSortBy> {
  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByAfternoonShifts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'afternoonShifts', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      sortByAfternoonShiftsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'afternoonShifts', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByAnnualLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      sortByAnnualLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByAttendanceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceType', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      sortByAttendanceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceType', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByDriverLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      sortByDriverLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByEarlyLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earlyLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      sortByEarlyLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earlyLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByEmployeeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByEmployeeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByHolidayDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holidayDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByHolidayDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holidayDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByLateDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lateDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByLateDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lateDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      sortByMaternityLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maternityLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      sortByMaternityLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maternityLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByMorningShifts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningShifts', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByMorningShiftsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningShifts', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByOvertimeHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeHours', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByOvertimeHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeHours', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByRestHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restHours', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByRestHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restHours', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortBySickLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sickLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortBySickLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sickLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByTotalContainers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalContainers', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      sortByTotalContainersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalContainers', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByTotalDrivingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDrivingHours', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      sortByTotalDrivingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDrivingHours', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByTotalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByTotalKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByTotalTrips() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTrips', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByTotalTripsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTrips', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByUnpaidLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unpaidLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      sortByUnpaidLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unpaidLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByWorkingDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension AttendanceQuerySortThenBy
    on QueryBuilder<Attendance, Attendance, QSortThenBy> {
  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByAfternoonShifts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'afternoonShifts', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      thenByAfternoonShiftsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'afternoonShifts', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByAnnualLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      thenByAnnualLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByAttendanceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceType', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      thenByAttendanceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceType', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByDriverLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      thenByDriverLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByEarlyLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earlyLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      thenByEarlyLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earlyLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByEmployeeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByEmployeeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByHolidayDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holidayDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByHolidayDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holidayDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByLateDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lateDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByLateDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lateDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      thenByMaternityLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maternityLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      thenByMaternityLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maternityLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByMorningShifts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningShifts', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByMorningShiftsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningShifts', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByOvertimeHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeHours', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByOvertimeHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeHours', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByRestHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restHours', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByRestHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restHours', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenBySickLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sickLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenBySickLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sickLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByTotalContainers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalContainers', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      thenByTotalContainersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalContainers', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByTotalDrivingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDrivingHours', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      thenByTotalDrivingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDrivingHours', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByTotalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByTotalKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByTotalTrips() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTrips', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByTotalTripsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTrips', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByUnpaidLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unpaidLeaveDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy>
      thenByUnpaidLeaveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unpaidLeaveDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByWorkingDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.desc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Attendance, Attendance, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension AttendanceQueryWhereDistinct
    on QueryBuilder<Attendance, Attendance, QDistinct> {
  QueryBuilder<Attendance, Attendance, QDistinct> distinctByAfternoonShifts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'afternoonShifts');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByAnnualLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'annualLeaveDays');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByAttendanceType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attendanceType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByDriverLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverLeaveDays');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByEarlyLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'earlyLeaveDays');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByEmployeeCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeId');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByEmployeeName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByHolidayDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'holidayDays');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByLateDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lateDays');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leaveDays');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct>
      distinctByMaternityLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maternityLeaveDays');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByMorningShifts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'morningShifts');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByOvertimeHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overtimeHours');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByRestHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restHours');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctBySickLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sickLeaveDays');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByTotalContainers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalContainers');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct>
      distinctByTotalDrivingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDrivingHours');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByTotalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalKm');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByTotalTrips() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTrips');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByUnpaidLeaveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unpaidLeaveDays');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workingDays');
    });
  }

  QueryBuilder<Attendance, Attendance, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension AttendanceQueryProperty
    on QueryBuilder<Attendance, Attendance, QQueryProperty> {
  QueryBuilder<Attendance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> afternoonShiftsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'afternoonShifts');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> annualLeaveDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'annualLeaveDays');
    });
  }

  QueryBuilder<Attendance, AttendanceType, QQueryOperations>
      attendanceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attendanceType');
    });
  }

  QueryBuilder<Attendance, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> driverLeaveDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverLeaveDays');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> earlyLeaveDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'earlyLeaveDays');
    });
  }

  QueryBuilder<Attendance, String, QQueryOperations> employeeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeCode');
    });
  }

  QueryBuilder<Attendance, int, QQueryOperations> employeeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeId');
    });
  }

  QueryBuilder<Attendance, String, QQueryOperations> employeeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeName');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> holidayDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'holidayDays');
    });
  }

  QueryBuilder<Attendance, DateTime?, QQueryOperations> lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> lateDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lateDays');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> leaveDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leaveDays');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations>
      maternityLeaveDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maternityLeaveDays');
    });
  }

  QueryBuilder<Attendance, int, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> morningShiftsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'morningShifts');
    });
  }

  QueryBuilder<Attendance, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<Attendance, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> overtimeHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overtimeHours');
    });
  }

  QueryBuilder<Attendance, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> restHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restHours');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> sickLeaveDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sickLeaveDays');
    });
  }

  QueryBuilder<Attendance, int, QQueryOperations> totalContainersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalContainers');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations>
      totalDrivingHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDrivingHours');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> totalKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalKm');
    });
  }

  QueryBuilder<Attendance, int, QQueryOperations> totalTripsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTrips');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> unpaidLeaveDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unpaidLeaveDays');
    });
  }

  QueryBuilder<Attendance, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Attendance, double, QQueryOperations> workingDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workingDays');
    });
  }

  QueryBuilder<Attendance, int, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
